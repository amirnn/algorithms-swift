func mainDA() {
  let da: DynamicArray<Int> = DynamicArray<Int>()
  for i in 0..<100 {
    da.pushBack(item: i)
  }
  for i in 0..<100 {
    print("item at index \(i): \(da.at(i)!)")

  }
}

// mainDA()

func mainDeque() {
  let dq: DoublyLinkedList<Int> = DoublyLinkedList<Int>()
  for i in 0..<100 {
    dq.pushBack(item: i)
  }
  for i in 0..<100 {
    print("item at index \(i): \(dq.at(i)!)")
  }
}

mainDeque()