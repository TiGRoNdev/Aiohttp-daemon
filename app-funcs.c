#include <unistd.h>
#include <malloc.h>
#include <stdlib.h>
#include "app-funcs.h"



int LoadConfig(char** conf_arr, char* conf_file) {
    FILE* conf = fopen(conf_file, "r");
    if (conf == NULL) {
        return 0;
    }

    char count[3] = {0};
    char app_path[100] = {0};
    fscanf(conf, "workers = %s\napp_path = %s\n", count, app_path);
    conf_arr[0] = count;

    for (int i = 0; i < atoi(count); ++i) {
        conf_arr[(i*3)+1] = app_path;
        fscanf(conf, "host = %s:%s\n", conf_arr[(i*3)+2], conf_arr[(i*3)+3]);
    }

    return 1;
}
/*
 *  Загружает файл конфига, конфиг должен быть составлен следующим образом:
 *
 *  workers = <колличество рабочих инстансов>
 *  app_path = <путь до python скрипта запуска aiohttp>
 *  host = <IP адрес>:<порт>
 *  ...колличество записей host должно соответствовать колличеству воркеров...
 */


int ReloadConfig() {

    return 0;
}


int InitWorkThread(FILE** workers, char** conf) {
    int count = atoi(conf[0]);
    for (int i = 0; i < count; ++i) {
        char command[100] = {0};
        sprintf(command, "python3.6 %s -i %s -p %s", conf[(i*3)+1], conf[(i*3)+2], conf[(i*3)+3]);
        workers[i] = popen(command, "r");
        if (workers[i] == NULL) {
            return 0;
        }
    }

    return 1;
}


void DestroyWorkThread(FILE** workers, char** conf) {
    int count = (int)conf[0];
    for (int i = 0; i < count; i++) {
        if (i > 0) {
            pclose(workers[i-1]);
        }
        free(conf[i]);
    }
    free(conf);
}