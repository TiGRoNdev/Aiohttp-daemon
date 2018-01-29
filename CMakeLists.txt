cmake_minimum_required(VERSION 3.9)
project(Daemon_aiohttp_server C)

set(CMAKE_C_STANDARD 11)

add_executable(Daemon_aiohttp_server main.c utils.h utils.c app-funcs.h app-funcs.c)