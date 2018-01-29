#define _GNU_SOURCE
#define  __USE_GNU
#include <ucontext.h>

#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <wait.h>
#include <execinfo.h>
#include <sys/resource.h>

#include "utils.h"
#include "app-funcs.h"


#define PID_FILE "/var/run/aiohttp-app-server.pid"
#define LOG_FILE "/var/log/aiohttp-app-server.log"
#define CHILD_NEED_WORK 228
#define CHILD_NEED_TERMINATE 322
#define FD_LIMIT 2048


int MonitorProc(char** conf)
{
    int      pid = 0;
    int      status;
    int      need_start = 1;
    sigset_t sigset;
    siginfo_t siginfo;

    // настраиваем сигналы которые будем обрабатывать
    sigemptyset(&sigset);

    // сигнал остановки процесса пользователем
    sigaddset(&sigset, SIGQUIT);

    // сигнал для остановки процесса пользователем с терминала
    sigaddset(&sigset, SIGINT);

    // сигнал запроса завершения процесса
    sigaddset(&sigset, SIGTERM);

    // сигнал посылаемый при изменении статуса дочернего процесса
    sigaddset(&sigset, SIGCHLD);

    // пользовательский сигнал который мы будем использовать для обновления конфига
    sigaddset(&sigset, SIGUSR1);
    sigprocmask(SIG_BLOCK, &sigset, NULL);

    // данная функция создаст файл с нашим PID'ом
    SetPidFile(PID_FILE);

    // бесконечный цикл работы
    for (;;)
    {
        // если необходимо создать потомка
        if (need_start)
        {
            // создаём потомка
            pid = fork();
        }

        need_start = 1;

        if (pid == -1) // если произошла ошибка
        {
            char *buff = (char *)malloc(150* sizeof(char));
            sprintf(buff, "[MONITOR] Fork failed (%s)\n", strerror(errno));
            // запишем в лог сообщение об этом
            WriteLog(buff);
            free(buff);
        }
        else if (!pid) // если мы потомок
        {
            // данный код выполняется в потомке

            // запустим функцию отвечающую за работу демона
            status = WorkProc(conf);

            // завершим процесс
            exit(status);
        }
        else // если мы родитель
        {
            // данный код выполняется в родителе

            // ожидаем поступление сигнала
            sigwaitinfo(&sigset, &siginfo);

            // если пришел сигнал от потомка
            if (siginfo.si_signo == SIGCHLD)
            {
                // получаем статус завершение
                wait(&status);

                // преобразуем статус в нормальный вид
                status = WEXITSTATUS(status);

                // если потомок завершил работу с кодом говорящем о том, что нет нужды дальше работать
                if (status == CHILD_NEED_TERMINATE)
                {
                    // запишем в лог сообщени об этом
                    WriteLog("[MONITOR] Child stopped\n");

                    // прервем цикл
                    break;
                }
                else if (status == CHILD_NEED_WORK) // если требуется перезапустить потомка
                {
                    // запишем в лог данное событие
                    WriteLog("[MONITOR] Child restart\n");
                }
            }
            else if (siginfo.si_signo == SIGUSR1) // если пришел сигнал что необходимо перезагрузить конфиг
            {
                kill(pid, SIGUSR1); // перешлем его потомку
                need_start = 0; // установим флаг что нам не надо запускать потомка заново
            }
            else // если пришел какой-либо другой ожидаемый сигнал
            {
                char *buff = (char *)malloc(150* sizeof(char));
                sprintf(buff, "[MONITOR] Signal %s\n", strsignal(siginfo.si_signo));
                // запишем в лог информацию о пришедшем сигнале
                WriteLog(buff);
                free(buff);

                // убьем потомка
                kill(pid, SIGTERM);
                status = 0;
                break;
            }
        }
    }

    // запишем в лог, что мы остановились
    WriteLog("[MONITOR] Stop\n");

    // удалим файл с PID'ом
    unlink(PID_FILE);

    return status;
}




int WriteLog(char *arg)
{
    FILE *log = fopen(LOG_FILE, "a+");
    if (!log) {
        return -1;
    }

    fprintf(log, "%s\n", arg);
    fclose(log);
    return 0;
}




void SetPidFile(char* Filename)
{
    FILE* f;

    f = fopen(Filename, "w+");
    if (f)
    {
        fprintf(f, "%u", getpid());
        fclose(f);
    }
}




int WorkProc(char** conf)
{
    struct sigaction sigact;
    sigset_t         sigset;
    int             signo;
    int             status;

    // сигналы об ошибках в программе будут обрататывать более тщательно
    // указываем что хотим получать расширенную информацию об ошибках
    sigact.sa_flags = SA_SIGINFO;
    // задаем функцию обработчик сигналов
    sigact.sa_sigaction = (void (*)(int, siginfo_t *, void *)) signal_error;

    sigemptyset(&sigact.sa_mask);

    // установим наш обработчик на сигналы

    sigaction(SIGFPE, &sigact, 0); // ошибка FPU
    sigaction(SIGILL, &sigact, 0); // ошибочная инструкция
    sigaction(SIGSEGV, &sigact, 0); // ошибка доступа к памяти
    sigaction(SIGBUS, &sigact, 0); // ошибка шины, при обращении к физической памяти

    sigemptyset(&sigset);

    // блокируем сигналы которые будем ожидать
    // сигнал остановки процесса пользователем
    sigaddset(&sigset, SIGQUIT);

    // сигнал для остановки процесса пользователем с терминала
    sigaddset(&sigset, SIGINT);

    // сигнал запроса завершения процесса
    sigaddset(&sigset, SIGTERM);

    // пользовательский сигнал который мы будем использовать для обновления конфига
    sigaddset(&sigset, SIGUSR1);
    sigprocmask(SIG_BLOCK, &sigset, NULL);

    // Установим максимальное кол-во дискрипторов которое можно открыть
    SetFdLimit(FD_LIMIT);

    // запишем в лог, что наш демон стартовал
    WriteLog("[DAEMON] Started\n");

    // запускаем все рабочие потоки
    FILE** workers = (FILE**)malloc(atoi(conf[0]) * sizeof(FILE*));
    status = InitWorkThread(workers, conf);
    // InitWorkThread — функция которая создаёт все рабочие потоки демона и инициализирует всю работу.
    if (status)
    {
        // цикл ожижания сообщений
        for (;;)
        {
            // ждем указанных сообщений
            sigwait(&sigset, &signo);

            // если то сообщение обновления конфига
            if (signo == SIGUSR1)
            {
                // обновим конфиг
                status = ReloadConfig();
                // ReloadConfig — функция осуществляющая обновление конфига
                // (заново считать файл и внести необходимые изменения в свою работу).
                // Имя файла можно также взять из параметров командной строки.
                if (status == 0)
                {
                    WriteLog("[DAEMON] Reload config failed\n");
                }
                else
                {
                    WriteLog("[DAEMON] Reload config OK\n");
                }
            }
            else // если какой-либо другой сигнал, то выйдим из цикла
            {
                break;
            }
        }

        // остановим все рабочеи потоки и корректно закроем всё что надо
        DestroyWorkThread(workers, conf);
        // DestroyWorkThread — функция которая останавливает рабочие потоки демона и корректно освобождает ресурсы.
    }
    else
    {
        WriteLog("[DAEMON] Create work thread failed\n");
    }

    WriteLog("[DAEMON] Stopped\n");

    // вернем код не требующим перезапуска
    return CHILD_NEED_TERMINATE;
}




void signal_error(int sig, siginfo_t *si, void *ptr, char** conf, FILE** workers)
{
    void* ErrorAddr;
    void* Trace[16];
    int    x;
    int    TraceSize;
    char** Messages;

    char *buff = (char *)malloc(150 * sizeof(char));
    sprintf(buff, "[DAEMON] Signal: %s, Addr: 0x%p\n", strsignal(sig), si->si_addr);
    // запишем в лог что за сигнал пришел
    WriteLog(buff);
    free(buff);


#if __WORDSIZE == 64 // если дело имеем с 64 битной ОС
    // получим адрес инструкции которая вызвала ошибку
    ErrorAddr = (void*)((ucontext_t*)ptr)->uc_mcontext.gregs[REG_RIP];
#else
    // получим адрес инструкции которая вызвала ошибку
        ErrorAddr = (void*)((ucontext_t*)ptr)->uc_mcontext.gregs[REG_EIP];
#endif

    // произведем backtrace чтобы получить весь стек вызовов
    TraceSize = backtrace(Trace, 16);
    Trace[1] = ErrorAddr;

    // получим расшифровку трасировки
    Messages = backtrace_symbols(Trace, TraceSize);
    if (Messages)
    {
        WriteLog("== Backtrace ==\n");

        // запишем в лог
        for (x = 1; x < TraceSize; x++)
        {
            char *buff = (char *)malloc(150 * sizeof(char));
            sprintf(buff, "%s\n", Messages[x]);
            WriteLog(buff);
            free(buff);
        }

        WriteLog("== End Backtrace ==\n");
        free(Messages);
    }

    WriteLog("[DAEMON] Stopped\n");

    // остановим все рабочие потоки и корректно закроем всё что надо
    DestroyWorkThread(workers, conf);

    // завершим процесс с кодом требующим перезапуска
    exit(CHILD_NEED_WORK);
}




int SetFdLimit(int MaxFd)
{
    struct rlimit lim;
    int          status;

    // зададим текущий лимит на кол-во открытых дискриптеров
    lim.rlim_cur = MaxFd;
    // зададим максимальный лимит на кол-во открытых дискриптеров
    lim.rlim_max = MaxFd;

    // установим указанное кол-во
    status = setrlimit(RLIMIT_NOFILE, &lim);

    return status;
}