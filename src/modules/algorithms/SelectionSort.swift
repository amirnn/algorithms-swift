class SelectionSort<T>: ASort where T: Comparable {

  var data: (any ISortableList)?

  func Sort(list: any ISortableList) {
    data = list
  }
}
