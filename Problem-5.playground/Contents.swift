

func smallestNumberDivisibleByAll(xs: [Int]) -> Int? {
  guard let largest = xs.maxElement() else { return nil }
  outer: for n in (largest*2).stride(to: Int.max, by: largest) {
    for x in xs {
      if n % x != 0 { continue outer }
    }
    return n
  }
  return nil
}

smallestNumberDivisibleByAll([Int](1...10)) == 2520
let result = smallestNumberDivisibleByAll([Int](1...20))
result
