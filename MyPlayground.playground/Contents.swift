
func test(nr nr:Int, comp: (Int) -> Void, nr2: Int) {
    
    comp(nr)
    
}

let f = { (n: Int) -> Void in
    print(n)
}

test(nr: 1, comp: f, nr2: 2) { (n:Int) -> Void in
    print(n)
}