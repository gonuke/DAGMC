CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
MESSAGE ( STATUS "Including FLUKA in dagmciface library.")

SET ( CODE_SRCDIR      "fluka" )
SET ( CODE_SRC_FILES   "${CODE_SRCDIR}/fluka_funcs.cpp"  )
SET ( CODE_PUB_HEADERS "${CODE_SRCDIR}/fluka_funcs.h" )
SET ( CODE_CONFIG       )

SET ( DI_PUB_HEADERS ${DI_PUB_HEADERS}
                     ${CODE_PUB_HEADERS}
                     ${CODE_CONFIG}
      PARENT_SCOPE)

SET ( DI_SRC_FILES ${DI_SRC_FILES} 
                   ${CODE_SRC_FILES} 
      PARENT_SCOPE)

INCLUDE_DIRECTORIES( ${CMAKE_SOURCE_DIR}/${CODE_SRCDIR} )

ADD_SUBDIRECTORY(tests)

#######################
#
# ADDITIONAL CODE SPECIFIC TARGETS GO HERE
#
#########################

# Make sure FLUPRO is defined
IF (NOT DEFINED FLUPRO)
	set (FLUPRO "$ENV{FLUPRO}")
ENDIF (NOT DEFINED FLUPRO)

ENABLE_LANGUAGE(Fortran)


# Create the executable that can call flukam_
ADD_EXECUTABLE( fludag
                EXCLUDE_FROM_ALL
                mainFluDAG.cpp    )
TARGET_LINK_LIBRARIES(fludag      ${DI_LIBS}
                                      ${FLUPRO}/libflukahp.a 
                                      gfortran
                     )
INSTALL( TARGETS fludag RUNTIME DESTINATION "${INSTALL_BIN_DIR}" OPTIONAL)


ADD_CUSTOM_TARGET( rfludag 
                   COMMAND patch -o rfludag ${FLUPRO}/flutil/rfluka ${CMAKE_CURRENT_SOURCE_DIR}/rfluka.patch 
)

INSTALL( FILES ${CMAKE_CURRENT_BINARY_DIR}/rfludag DESTINATION "${INSTALL_BIN_DIR}" OPTIONAL)
ADD_DEPENDENCIES( fludag rfludag )


#SET (fluka_file ${FLUPRO}/usermvax/mgdraw.f)
#SET (fluka_includes ${FLUPRO}/flukapro)
#SET (fluka_libdir ${FLUPRO})
#ADD_CUSTOM_COMMAND(OUTPUT mgdraw.o
#       COMMAND gfortran -c ${fluka_file} -I${fluka_includes} 
#       DEPENDS ${FLUPRO}/usermvax/mgdraw.f
#       COMMENT "Custom command to compile mgdraw object with parenthetically named includes"
#       )
#ADD_CUSTOM_TARGET (mgdraw
#	        DEPENDS mgdraw.o)


IF (ADD_MGDRAW)
  SET( FLUKA_INCLUDES ${FLUPRO}/flukapro )
  ADD_DEPENDENCIES( fludag custom_mgdraw)
  ADD_CUSTOM_TARGET( custom_mgdraw
    COMMAND gfortran -o mgdraw.o -c ${ADD_MGDRAW} -I${FLUKA_INCLUDES}
    DEPENDS ${ADD_MGDRAW}
    COMMENT "Compiling a customized MGDRAW for inclusion in fludag"
  )
ENDIF (ADD_MGDRAW)