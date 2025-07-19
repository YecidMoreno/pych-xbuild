cmake_minimum_required(VERSION 3.10)
project(xapp)

set(CMAKE_CXX_STANDARD 17)

add_executable(app src/app.cpp)

install(TARGETS app
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)