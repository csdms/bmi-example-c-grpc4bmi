# bmi-example-c-grpc4bmi

cmake_minimum_required(VERSION 3.16)
project(bmi-example-c-grpc4bmi
  VERSION 0.1.0
  LANGUAGES CXX
)

include(GNUInstallDirs)

find_package(PkgConfig REQUIRED)

pkg_check_modules(BMIHEATC REQUIRED IMPORTED_TARGET bmiheatc)
list(APPEND CMAKE_MESSAGE_INDENT "  ")
message(STATUS "Include directory: ${BMIHEATC_INCLUDE_DIRS}")
message(STATUS "Library path: ${BMIHEATC_LINK_LIBRARIES}")
list(POP_BACK CMAKE_MESSAGE_INDENT)

pkg_check_modules(PROTOBUF REQUIRED IMPORTED_TARGET protobuf)
list(APPEND CMAKE_MESSAGE_INDENT "  ")
message(STATUS "Include directory: ${PROTOBUF_INCLUDE_DIRS}")
message(STATUS "Library path: ${PROTOBUF_LINK_LIBRARIES}")
list(POP_BACK CMAKE_MESSAGE_INDENT)

pkg_check_modules(GRPC4BMI REQUIRED IMPORTED_TARGET grpc4bmi)
list(APPEND CMAKE_MESSAGE_INDENT "  ")
message(STATUS "Include directory: ${GRPC4BMI_INCLUDE_DIRS}")
message(STATUS "Library path: ${GRPC4BMI_LINK_LIBRARIES}")
list(POP_BACK CMAKE_MESSAGE_INDENT)

set(server_exe heatc-grpc4bmi-server)

add_executable(${server_exe} ${server_exe}.cxx)
target_link_libraries(${server_exe}
  ${BMIHEATC_LINK_LIBRARIES}
  ${PROTOBUF_LINK_LIBRARIES}
  ${GRPC4BMI_LINK_LIBRARIES}
)
target_include_directories(${server_exe} PUBLIC ${GRPC4BMI_INCLUDE_DIRS})

install(
  TARGETS ${server_exe}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
