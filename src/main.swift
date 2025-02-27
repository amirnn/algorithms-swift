

func main() {
    let da: DynamicArray<Int> = DynamicArray<Int>()
    for i in 0..<100 {
        da.pushBack(item: i)
    }
    for i in 0..<100 {
        print("item at index \(i): \(da.at(i)!)")
        
    }
}

main()