
enum ListError: Error {
  case IndexOutOfBounds(String = "Index Out Of Bounds")
  case IsEmpty(String = "List is Empty")
}

protocol IList {
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

  func pushAt(index: Int, item: T) throws;
  func popAt(index: Int) -> T?
}

extension IList {
  func isEmpty() -> Bool {
    return size == 0
  }

  internal func boundSizeCheck(index: Int) throws (ListError) {
    if index < 0 || index > size - 1 {
      throw ListError.IndexOutOfBounds()
    }
    if isEmpty() {
      throw ListError.IsEmpty()
    }
  }
}



protocol ISortableList: IList where T: Comparable {}
