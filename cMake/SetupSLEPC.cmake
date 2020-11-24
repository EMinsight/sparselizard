function(ConfigureSLEPC TARGET)


# Find slepc headers:
message(STATUS "Looking for slepc headers at " ${PETSC_PATH})

FIND_PATH(SLEPC_INCLUDE_PATH
    NAMES slepc.h
    PATHS
    "${PETSC_PATH}/arch-linux-c-opt/include"
    "${PETSC_PATH}/arch-linux2-c-opt/include"
    "${PETSC_PATH}/arch-darwin-c-opt/include"
    REQUIRED ON)

if(SLEPC_INCLUDE_PATH)
    message(STATUS "Slepc headers found at " ${SLEPC_INCLUDE_PATH})
else()
    message(STATUS "SLEPC HEADERS NOT FOUND")
endif()


# Find slepc library:
message(STATUS "Looking for slepc library at " ${PETSC_PATH})

FIND_LIBRARY(SLEPC_LIBRARIES
    NAMES libslepc.so
    PATHS
    "${PETSC_PATH}/arch-linux-c-opt/lib"
    "${PETSC_PATH}/arch-linux2-c-opt/lib"
    "${PETSC_PATH}/arch-darwin-c-opt/lib"
    REQUIRED ON)

if(SLEPC_LIBRARIES)
    message(STATUS "Slepc library found at " ${SLEPC_LIBRARIES})
else()
    message(STATUS "SLEPC LIBRARY NOT FOUND")
endif()


if(SLEPC_INCLUDE_PATH AND SLEPC_LIBRARIES)
    SET(SLEPC_FOUND YES PARENT_SCOPE)
endif()


TARGET_INCLUDE_DIRECTORIES(${TARGET} PUBLIC ${SLEPC_INCLUDE_PATH})
TARGET_LINK_LIBRARIES(${TARGET} PUBLIC ${SLEPC_LIBRARIES})


endfunction(ConfigureSLEPC)

