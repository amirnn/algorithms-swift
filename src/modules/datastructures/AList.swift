protocol AList {
  associatedtype T
  var size: Int { get }
  // getters
  func isEmpty() -> Bool
  func at(_ index: Int) -> T?
  // setters
  func pushFront(item: T)
  func pushBack(item: T)
  func popFront() -> T?
  func popBack() -> T?

  func pushAt(index: Int, item: T)
  func popAt(index: Int) -> T?

}

extension AList {
  func isEmpty() -> Bool {
    return size == 0
  }
}

protocol ASortableList: AList where T: Comparable {}
