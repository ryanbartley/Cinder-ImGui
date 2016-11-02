if( NOT TARGET Cinder-ImGui )
  get_filename_component( CINDER_IMGUI_BLOCK_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )
  get_filename_component( IMGUI_LIB_SOURCE_PATH "${CINDER_IMGUI_BLOCK_PATH}/lib/imgui" ABSOLUTE )
  get_filename_component( CINDER_IMGUI_INCLUDE_PATH "${CINDER_IMGUI_BLOCK_PATH}/include" ABSOLUTE )
  get_filename_component( CINDER_IMGUI_SRC_PATH "${CINDER_IMGUI_BLOCK_PATH}/src" ABSOLUTE )
  
  if( NOT EXISTS ${CINDER_PATH} )
    get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )
  endif()

  add_library( Cinder-ImGui 
    ${CINDER_IMGUI_SRC_PATH}/CinderImGui.cpp 
    ${IMGUI_LIB_SOURCE_PATH}/imgui.cpp 
    ${IMGUI_LIB_SOURCE_PATH}/imgui_draw.cpp 
    ${IMGUI_LIB_SOURCE_PATH}/imgui_demo.cpp 
  )

  target_compile_options( Cinder-ImGui PUBLIC "-std=c++11" )

  target_include_directories( Cinder-ImGui PUBLIC "${CINDER_IMGUI_INCLUDE_PATH}" )
  target_include_directories( Cinder-ImGui SYSTEM BEFORE PUBLIC "${IMGUI_LIB_SOURCE_PATH}" )

	if( NOT TARGET cinder )
		    include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
		    find_package( cinder REQUIRED PATHS
		        "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
		        "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
	endif()
  target_link_libraries( Cinder-ImGui PRIVATE cinder )
	
endif()



