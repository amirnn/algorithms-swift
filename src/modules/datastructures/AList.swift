protocol AList {
  associatedtype T
  var size: Int { get }
  func isEmpty() -> Bool
  func at(_ index: Int) -> T?
}

extension AList {
  func isEmpty() -> Bool {
    return size == 0
  }
}

protocol ASortableList: AList where T: Comparable {}
