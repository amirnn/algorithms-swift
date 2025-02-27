protocol ASort {
  associatedtype T: Comparable
  var data: (any ISortableList)? { get }
  mutating func Sort(list: any ASortableList)
  func isSorted() -> Bool
}

extension ASort {
  func isSorted() -> Bool {
    if let data {
      for i in 0...data.size - 2 {
        if data.at(i) as! T > data.at(i + 1) as! T { return false }
      }
      return true
    }
    else {
      return false;
    }
  }
}
