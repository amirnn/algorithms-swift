class DynamicArray<T>: IList {
  let initialBufferSize: Int = 2
  let bufferExtensionShrinkingScale: Int = 2
  let minimumNumberOfElementsToShrinkRation: Int = 4
  var bufferSize: Int
  var size: Int = 0  // number of elements
  var data: UnsafeMutablePointer<T?>
  var head: Int = 0
  var tail: Int = 0

  init() {
    bufferSize = initialBufferSize
    data = UnsafeMutablePointer<T?>.allocate(capacity: bufferSize)
    data.initialize(to: nil)
  }

  deinit {
    data.deallocate()
  }

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
    let indexMod: Int = index % bufferSize;
    let headMod: Int = head % bufferSize;
    let secondMod: Int = (headMod + bufferSize) % bufferSize;
    let actualIndex: Int = (indexMod + secondMod) % bufferSize;
    return actualIndex;
  }

  private func boundSizeCheck(index: Int) throws {
    if index < 0 || index > size - 1 {
      throw fatalError("Index out of bounds!")
    }
    if isEmpty() {
      throw fatalError("List is empty!")
    }
  }

  func pushFront(item: T) {
    if bufferIsFull() {
      extendBuffer()
    }
    if isEmpty() {
      data[head] = item
    } else {
      head -= 1
      data[actualIndex(0)] = item
    }
    size += 1
  }

  func pushBack(item: T) {
    if bufferIsFull() {
      extendBuffer()
    }
    if isEmpty() {
      data[tail] = item

    } else {
      tail += 1
      data[actualIndex(size)] = item
    }
    size += 1
  }

  func popFront() -> T? {
    if isEmpty() {
      return nil
    }
    if bufferIsAlmostEmpty() {
      shrinkBuffer()
    }
    var temp: T?
    if size == 1 {
      temp = data[0]
      data[0] = nil
    } else {
      temp = data[actualIndex(0)]
      data[actualIndex(0)] = nil
      head += 1
    }
    size -= 1
    return temp
  }

  func popBack() -> T? {
    if isEmpty() {
      return nil
    }
    if bufferIsAlmostEmpty() {
      shrinkBuffer()
    }
    var temp: T?
    if size == 1 {
      temp = data[0]
      data[0] = nil
    } else {
      temp = data[actualIndex(size - 1)]
      data[actualIndex(size - 1)] = nil
      tail -= 1
    }
    size -= 1
    return temp
  }

  func pushAt(index: Int, item: T) {
    do {
      try boundSizeCheck(index: index)
    } catch {
      print("\(error)")
      return
    }
    if index <= size / 2 {
      pushFront(item: item)
      for i in 0..<index {
        exchange(source: i, target: i + 1)
      }
    } else {
      pushBack(item: item)
      for i in (index..<size).reversed() {
        exchange(source: i, target: i - 1)
      }
    }
  }

  func popAt(index: Int) -> T? {
    do {
      try boundSizeCheck(index: index)
    } catch {
      print("\(error)")
      return nil
    }
    let temp: T?
    if index <= size / 2 {
      for i in 0..<index {
        exchange(source: i, target: i - 1)
      }
      temp = popFront()
    } else {
      for i in (index..<size).reversed() {
        exchange(source: i, target: i + 1)
      }
      temp = popFront()
    }
    return temp
  }

  private func bufferIsFull() -> Bool {
    return size >= bufferSize
  }

  private func bufferIsAlmostEmpty() -> Bool {
    return size <= bufferSize / minimumNumberOfElementsToShrinkRation
  }

  private func extendBuffer() {
    let newBufferSize = bufferSize * bufferExtensionShrinkingScale
    let newData = UnsafeMutablePointer<T?>.allocate(capacity: newBufferSize)
    newData.initialize(to: nil)
    for i in 0..<size {
      newData[i] = data[i]
    }
    data.deallocate()
    data = newData
    head = 0
    tail = size - 1
    bufferSize = newBufferSize
  }

  private func shrinkBuffer() {
    let newBufferSize = bufferSize / bufferExtensionShrinkingScale
    let newData = UnsafeMutablePointer<T?>.allocate(capacity: newBufferSize)
    newData.initialize(to: nil)
    for i in 0..<size {
      newData[i] = data[i]
    }
    data.deallocate()
    data = newData
    head = 0
    tail = size - 1
    bufferSize = newBufferSize
  }

  private func exchange(source: Int, target: Int) {
    let actualSource = actualIndex(source)
    let actualTarget = actualIndex(source)
    let temp = data[actualSource]
    data[actualSource] = data[actualTarget]
    data[actualTarget] = temp
  }
}
