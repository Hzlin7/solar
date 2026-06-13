cmake_minimum_required(VERSION 3.21)
project(solar VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)

add_subdirectory(src)
add_subdirectory(examples)
