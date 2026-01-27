execute_process(COMMAND "/home/crumb/MEHATRONIKA/project_ws/build/camera_filter/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/crumb/MEHATRONIKA/project_ws/build/camera_filter/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
