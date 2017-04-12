cmake_minimum_required(VERSION 3.7)
project(Comp_Org_Project)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "-O2 -Wall")

set(SOURCE_FILES
        iplc-sim.c)

add_executable(Comp_Org_Project ${SOURCE_FILES})
target_link_libraries(Comp_Org_Project m)