class DynamicArray<T>: AList {
  var size: Int = 0
  var data: [T] = []

  func at(_ index: Int) -> T? {
    do {
      try boundSizeCheck(index: index)
    } catch {
      print("\(error)")
      return nil
    }
    return data[actualIndex(index)]
  }

  private func actualIndex(_ index: Int) -> Int {
    return 0
  }

  private func boundSizeCheck(index: Int) throws {
    if index < 0 || index > size - 1 {
      throw fatalError("Index out of bounds!")
    }
    if isEmpty() {
      throw fatalError("List is empty!")
    }
  }

}
