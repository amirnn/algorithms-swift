# src

add_subdirectory("modules")

add_executable(main)
target_sources(main PRIVATE main.swift)
target_link_libraries(main PRIVATE dsa)