# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/tigron/Programms/CLion/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/tigron/Programms/CLion/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tigron/projects/work/Daemon-aiohttp-server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Daemon_aiohttp_server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Daemon_aiohttp_server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Daemon_aiohttp_server.dir/flags.make

CMakeFiles/Daemon_aiohttp_server.dir/main.c.o: CMakeFiles/Daemon_aiohttp_server.dir/flags.make
CMakeFiles/Daemon_aiohttp_server.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Daemon_aiohttp_server.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Daemon_aiohttp_server.dir/main.c.o   -c /home/tigron/projects/work/Daemon-aiohttp-server/main.c

CMakeFiles/Daemon_aiohttp_server.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Daemon_aiohttp_server.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tigron/projects/work/Daemon-aiohttp-server/main.c > CMakeFiles/Daemon_aiohttp_server.dir/main.c.i

CMakeFiles/Daemon_aiohttp_server.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Daemon_aiohttp_server.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tigron/projects/work/Daemon-aiohttp-server/main.c -o CMakeFiles/Daemon_aiohttp_server.dir/main.c.s

CMakeFiles/Daemon_aiohttp_server.dir/main.c.o.requires:

.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/main.c.o.requires

CMakeFiles/Daemon_aiohttp_server.dir/main.c.o.provides: CMakeFiles/Daemon_aiohttp_server.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/Daemon_aiohttp_server.dir/build.make CMakeFiles/Daemon_aiohttp_server.dir/main.c.o.provides.build
.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/main.c.o.provides

CMakeFiles/Daemon_aiohttp_server.dir/main.c.o.provides.build: CMakeFiles/Daemon_aiohttp_server.dir/main.c.o


CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o: CMakeFiles/Daemon_aiohttp_server.dir/flags.make
CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o: ../utils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o   -c /home/tigron/projects/work/Daemon-aiohttp-server/utils.c

CMakeFiles/Daemon_aiohttp_server.dir/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Daemon_aiohttp_server.dir/utils.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tigron/projects/work/Daemon-aiohttp-server/utils.c > CMakeFiles/Daemon_aiohttp_server.dir/utils.c.i

CMakeFiles/Daemon_aiohttp_server.dir/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Daemon_aiohttp_server.dir/utils.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tigron/projects/work/Daemon-aiohttp-server/utils.c -o CMakeFiles/Daemon_aiohttp_server.dir/utils.c.s

CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o.requires:

.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o.requires

CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o.provides: CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o.requires
	$(MAKE) -f CMakeFiles/Daemon_aiohttp_server.dir/build.make CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o.provides.build
.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o.provides

CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o.provides.build: CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o


CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o: CMakeFiles/Daemon_aiohttp_server.dir/flags.make
CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o: ../app-funcs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o   -c /home/tigron/projects/work/Daemon-aiohttp-server/app-funcs.c

CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/tigron/projects/work/Daemon-aiohttp-server/app-funcs.c > CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.i

CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/tigron/projects/work/Daemon-aiohttp-server/app-funcs.c -o CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.s

CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o.requires:

.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o.requires

CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o.provides: CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o.requires
	$(MAKE) -f CMakeFiles/Daemon_aiohttp_server.dir/build.make CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o.provides.build
.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o.provides

CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o.provides.build: CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o


# Object files for target Daemon_aiohttp_server
Daemon_aiohttp_server_OBJECTS = \
"CMakeFiles/Daemon_aiohttp_server.dir/main.c.o" \
"CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o" \
"CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o"

# External object files for target Daemon_aiohttp_server
Daemon_aiohttp_server_EXTERNAL_OBJECTS =

Daemon_aiohttp_server: CMakeFiles/Daemon_aiohttp_server.dir/main.c.o
Daemon_aiohttp_server: CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o
Daemon_aiohttp_server: CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o
Daemon_aiohttp_server: CMakeFiles/Daemon_aiohttp_server.dir/build.make
Daemon_aiohttp_server: CMakeFiles/Daemon_aiohttp_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable Daemon_aiohttp_server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Daemon_aiohttp_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Daemon_aiohttp_server.dir/build: Daemon_aiohttp_server

.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/build

CMakeFiles/Daemon_aiohttp_server.dir/requires: CMakeFiles/Daemon_aiohttp_server.dir/main.c.o.requires
CMakeFiles/Daemon_aiohttp_server.dir/requires: CMakeFiles/Daemon_aiohttp_server.dir/utils.c.o.requires
CMakeFiles/Daemon_aiohttp_server.dir/requires: CMakeFiles/Daemon_aiohttp_server.dir/app-funcs.c.o.requires

.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/requires

CMakeFiles/Daemon_aiohttp_server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Daemon_aiohttp_server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/clean

CMakeFiles/Daemon_aiohttp_server.dir/depend:
	cd /home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tigron/projects/work/Daemon-aiohttp-server /home/tigron/projects/work/Daemon-aiohttp-server /home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug /home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug /home/tigron/projects/work/Daemon-aiohttp-server/cmake-build-debug/CMakeFiles/Daemon_aiohttp_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Daemon_aiohttp_server.dir/depend

