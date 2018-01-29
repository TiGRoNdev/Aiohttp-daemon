#ifndef UTILS_H
#define UTILS_H

#include <signal.h>


int MonitorProc(char** config);
int WriteLog(char* arg);
void SetPidFile(char* Filename);
int WorkProc(char** conf);
void signal_error(int sig, siginfo_t *si, void *ptr, char** conf, FILE** workers);
int SetFdLimit(int MaxFd);


#endif //UTILS_H
