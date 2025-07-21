# bmi-example-c-grpc4bmi

cmake_minimum_required(VERSION 3.12)
project(bmi-example-c-grpc4bmi
  VERSION 0.1.0
  LANGUAGES C
)

include(GNUInstallDirs)

find_package(PkgConfig REQUIRED)

pkg_check_modules(BMIHEATC REQUIRED IMPORTED_TARGET bmiheatc)
message(STATUS "  Include dir: ${BMIHEATC_INCLUDE_DIRS}")
message(STATUS "  Library path: ${BMIHEATC_LINK_LIBRARIES}")

pkg_check_modules(PROTOBUF REQUIRED IMPORTED_TARGET protobuf)
message(STATUS "  Include dir: ${PROTOBUF_INCLUDE_DIRS}")
message(STATUS "  Library path: ${PROTOBUF_LINK_LIBRARIES}")

pkg_check_modules(GRPC4BMI REQUIRED IMPORTED_TARGET grpc4bmi)
message(STATUS "  Include dir: ${GRPC4BMI_INCLUDE_DIRS}")
message(STATUS "  Library path: ${GRPC4BMI_LINK_LIBRARIES}")

set(server_exe heatc-grpc4bmi-server)

add_executable(${server_exe} ${server_exe}.c)
target_link_libraries(${server_exe} ${BMIHEATC_LINK_LIBRARIES} ${PROTOBUF_LINK_LIBRARIES} ${GRPC4BMI_LINK_LIBRARIES})
target_include_directories(${server_exe} PUBLIC ${GRPC4BMI_INCLUDE_DIRS})

install(
  TARGETS ${server_exe}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
