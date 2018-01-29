#ifndef APP_FUNCS_H
#define APP_FUNCS_H

int LoadConfig(char** conf_arr, char* conf_file);
int InitWorkThread(FILE** workers, char** conf);
int ReloadConfig();
void DestroyWorkThread(FILE** workers, char** conf);

#endif //APP_FUNCS_H
