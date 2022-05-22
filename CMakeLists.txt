cmake_minimum_required(VERSION 3.7)
project(VC6CV)

# For desktop compilation
#cmake_policy(SET CMP0015 NEW)
#cmake_policy(SET CMP0081 OLD)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror -Wall -std=gnu99 -g")

# Set --no-as-needed to stop the linker discarding mmal_vc_client
# as it can't see that the constructor registers a load of functionality
# with the MMAL core.
#SET(CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )

find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIRS})
add_executable(VC6CV main_gl.cpp)
target_link_libraries(VC6CV ${SDL2_LIBRARIES})

#include_directories(/usr/local/include)
include_directories(/usr/include/interface)
include_directories(/usr/include/interface/vcos/pthreads)
include_directories(/usr/include/interface/vmcs_host/linux)
include_directories(/usr/include/interface/vcsm)

find_library(LIB_BCMH NAMES bcm_host HINTS /usr/lib/arm-linux-gnueabihf)
find_library(LIB_VCOS NAMES vcos HINTS /usr/lib/arm-linux-gnueabihf)
find_library(LIB_VCSM NAMES vcsm HINTS /usr/lib/arm-linux-gnueabihf)
find_library(LIB_MMAL NAMES mmal HINTS /usr/lib/arm-linux-gnueabihf)
find_library(LIB_MMAL_CORE NAMES mmal_core HINTS /usr/lib/arm-linux-gnueabihf)
find_library(LIB_MMAL_UTIL NAMES mmal_util HINTS /usr/lib/arm-linux-gnueabihf)
find_library(LIB_MMAL_COMP NAMES mmal_components HINTS //usr/lib/arm-linux-gnueabihf)
find_library(LIB_BEGL NAMES EGL HINTS /usr/lib/arm-linux-gnueabihf)
find_library(LIB_GLES NAMES GLESv2 HINTS /usr/lib/arm-linux-gnueabihf)

set(VC6CV_GL_SOURCES
   camera/gcs.c
   camera/camGL.c
   gl/eglUtil.c
   gl/mesh.cpp
   gl/shader.cpp
   gl/texture.cpp)

set(VC6CV_LIBRARIES
	m dl pthread
	#m lm pthread ??
	${LIB_BCMH} ${LIB_VCOS} ${LIB_VCSM} ${SDL2_LIBRARIES}
	${LIB_MMAL} ${LIB_MMAL_CORE} ${LIB_MMAL_UTIL} ${LIB_MMAL_COMP})
set(VC6CV_GL_LIBRARIES
	${LIB_BEGL} ${LIB_GLES} ${SDL2_LIBRARIES})

# Grouped targets
add_custom_target(gl DEPENDS GLCV)

# GL CV sample application
add_executable(GLCV ${VC6CV_GL_SOURCES} main_gl.cpp)
target_link_libraries(GLCV ${VC6CV_LIBRARIES} ${VC6CV_GL_LIBRARIES})
target_include_directories(GLCV PRIVATE gl camera)
