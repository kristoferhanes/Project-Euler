
extension Int {
  func isMultipleOf(n: Int) -> Bool {
    return self % n == 0
  }
}

func sum(a: [Int]) -> Int {
  return a.reduce(0, combine: +)
}

let ns = [Int](1..<1000).filter { $0.isMultipleOf(3) || $0.isMultipleOf(5) }
let solution = sum(ns)
solution
