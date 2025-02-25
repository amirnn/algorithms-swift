class DoublyLinkedList<T>: AList {
    class Node {
        init(value: T) { item = value }
        var item: T
        var next: Node?
        var prev: Node?
    }

    var head: Node?
    var tail: Node?
    var size: Int = 0

    func at(_ index: Int) -> T? {
        do {
            try boundSizeCheck(index: index)
        } catch {
            print("\(error)")
            return nil   
        }
        var current: Node = head!
        for _ in 1..<size {
            current = current.next!
        }
        return current.item
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