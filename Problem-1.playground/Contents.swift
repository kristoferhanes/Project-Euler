
extension Int {
  func isMultiple(of n: Int) -> Bool {
    return self % n == 0
  }
}

let solution = (1..<1000)
  .filter { $0.isMultiple(of: 3) || $0.isMultiple(of: 5) }
  .reduce(0, combine: +)

solution
