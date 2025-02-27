class DoublyLinkedList<T>: IList {
  class Node {
    init(value: T) { item = value }
    var item: T
    var next: Node?
    var prev: Node?
  }

  var size: Int = 0
  var head: Node?
  var tail: Node?

  func at(_ index: Int) -> T? {
    return nodeAt(index)?.item
  }

  private func nodeAt(_ index: Int) -> Node? {
    do {
      try boundSizeCheck(index: index)
    } catch {
      print("\(error)")
      return nil
    }
    var current: Node
    if index <= size / 2 {
      current = head!
      for _ in 1..<size {
        current = current.next!
      }
    } else {
      current = tail!
      for _ in (index..<size - 1).reversed() {
        current = current.prev!
      }
    }
    return current
  }

  func pushFront(item: T) {
    if size == 0 {
      head = Node(value: item)
      tail = head
    } else {
      let temp = Node(value: item)
      temp.next = head
      head!.prev = temp
      head = temp
    }
    size += 1
  }

  func pushBack(item: T) {
    if size == 0 {
      head = Node(value: item)
      tail = head
    } else {
      let temp = Node(value: item)
      temp.prev = tail
      tail!.next = temp
      tail = temp
    }
    size += 1
  }

  func popFront() -> T? {
    do {
      try boundSizeCheck(index: 0)
    } catch {
      print("\(error)")
      return nil
    }
    let temp: Node
    if size == 1 {
      temp = head!
      head = nil
      tail = nil
    } else {
      temp = head!
      head = head!.next
      head!.prev = nil
      temp.next = nil
    }
    size -= 1
    return temp.item
  }

  func popBack() -> T? {
    do {
      try boundSizeCheck(index: size - 1)
    } catch {
      print("\(error)")
      return nil
    }
    let temp: Node
    if size == 1 {
      temp = tail!
      tail = nil
      head = nil
    } else {
      temp = tail!
      tail = tail!.prev
      tail!.next = nil
      temp.prev = nil
    }
    size -= 1
    return temp.item
  }

  func pushAt(index: Int, item: T) throws(ListError) {
    if index == 0 {
      pushFront(item: item)
      return
    } else if index < size {
      let newNode = Node(value: item)
      let oldNode = nodeAt(index)!
      let prev = oldNode.prev!
      newNode.prev = prev
      oldNode.prev = newNode
      newNode.next = oldNode
      prev.next = newNode
    } else {
      throw ListError.IndexOutOfBounds()
    }
  }

  func popAt(index: Int) -> T? {
    do {
      try boundSizeCheck(index: index)
    } catch {
      print("\(error)")
      return nil
    }
    if index == 0 {
      return popFront()
    } else if index == size - 1 {
      return popBack()
    } else {
      let temp = nodeAt(index)!
      let prev = temp.prev!
      let next = temp.next!
      prev.next = next
      next.prev = prev
      temp.next = nil
      temp.prev = nil
      size -= 1
      return temp.item
    }
  }

}
