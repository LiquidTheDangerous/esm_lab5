cmake_minimum_required(VERSION 3.20)
project(main)


enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_LINK_EXECUTABLE "gcc <CMAKE_ASM_NASM_LINK_FLAGS> <LINK_FLAGS> -no-pie <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
if(${CMAKE_BUILD_TYPE} STREQUAL  "Debug")
    set(CMAKE_ASM_NASM_LINK_FLAGS ${CMAKE_ASM_NASM_LINK_FLAGS} -Fdwarf -g -lmain.lst )
endif(${CMAKE_BUILD_TYPE} STREQUAL  "Debug")

add_executable(main main.nasm print_array.nasm find_first_if.nasm pred.nasm stdio_array.nasm)
set_target_properties(main PROPERTIES NASM_OBJ_FORMAT elf64)