class SelectionSort<T>: ASort where T: Comparable {

  var data: (any ASortableList)?

  func Sort(list: any ASortableList) {
    data = list
  }
}
