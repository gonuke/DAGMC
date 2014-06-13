add_custom_target(check)
add_dependencies(check gtest)

macro(run_test test_target test_file)
  add_custom_target(${test_target}_runtest
      COMMAND ${test_target} #cmake 2.6 required
      DEPENDS ${test_target}
      WORKING_DIRECTORY "${CMAKE_CURRENT_SRC_DIR}")
  add_dependencies(check ${test_target}_runtest)
  configure_file(${test_file} ${test_file} COPYONLY)
endmacro()
