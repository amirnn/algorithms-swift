# src/modules


add_library(dsa STATIC)

target_sources(dsa 
PUBLIC 
# datastructures
${CMAKE_CURRENT_SOURCE_DIR}/datastructures/IList.swift
${CMAKE_CURRENT_SOURCE_DIR}/datastructures/DoublyLinkedList.swift
${CMAKE_CURRENT_SOURCE_DIR}/datastructures/DynamicArray.swift

# algorithms
${CMAKE_CURRENT_SOURCE_DIR}/algorithms/ASort.swift
${CMAKE_CURRENT_SOURCE_DIR}/algorithms/MergeSort.swift
${CMAKE_CURRENT_SOURCE_DIR}/algorithms/SelectionSort.swift

)