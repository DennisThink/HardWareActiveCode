cmake_minimum_required(VERSION 3.0)
project(CHardInfo)
include_directories(./include/doctest/)
include_directories(./include/)
if(CMAKE_CL_64)
    include_directories(./include/openssl/x64/include/)
    link_directories(./include/openssl/x64/lib/)
else()
    include_directories(./include/openssl/x86/include/)
    link_directories(./include/openssl/x86/lib/)
endif()

link_libraries( libssl.lib libcrypto.lib)
SET(SOURCE_FILE ./Source/CHardInfo.cpp
                ./Source/CCodeVerify.cpp
                ./Source/HardInfo.cpp)

SET(TEST_SOURCE_FILE ./Source/Main_Test.cpp
                     ./Source/CHardInfo.cpp)
add_definitions(-D_UNICODE)

if(CMAKE_CL_64)
    #设置64位的程序目标(可执行程序)输出路径
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/bin/Debug64/)     
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/bin/Release64/)
    file(COPY ./include/openssl/x64/bin/*.dll DESTINATION  ${PROJECT_SOURCE_DIR}/bin/Release64/) 
else()
    #设置32位的程序目标(可执行程序)输出路径
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${PROJECT_SOURCE_DIR}/bin/Debug32/)     
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${PROJECT_SOURCE_DIR}/bin/Release32/)
    file(COPY ./include/openssl/x86/bin/libcrypto-1_1.dll DESTINATION  ${PROJECT_SOURCE_DIR}/bin/Release32/)
    file(COPY ./include/openssl/x86/bin/libssl-1_1.dll DESTINATION ${PROJECT_SOURCE_DIR}/bin/Release32/)
endif()
add_executable(CHardInfo ${SOURCE_FILE})
add_executable(CHardInfoTest ${TEST_SOURCE_FILE})