#PROJECT(FluDAGUnitTests)
#CMAKE_MINIMUM_REQUIRED(VERSION 2.6.4)

INCLUDE( ${CMAKE_SOURCE_DIR}/cmake/add_test.cmake )

SET (fludag_test_source test_FlukaFuncs.cpp)

ADD_EXECUTABLE (fludag_unit_tests
	EXCLUDE_FROM_ALL
    fludag_unit_test_driver.cc
	${fludag_test_source}
    )

# set libraries needed to link to test cases
SET(LIBS
    ${DI_LIBS}
    ${GTEST_LIBS}
)

TARGET_LINK_LIBRARIES (fludag_unit_tests ${LIBS})

run_test(fludag_unit_tests slabs.h5m)
	
