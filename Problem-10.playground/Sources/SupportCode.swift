

public func sumOfPrimes(below n: Int) -> Int {
  var ps = [Int](2..<n)
  for (i, p) in ps.enumerate() where p != 0 {
    for j in (i+p).stride(to: ps.endIndex, by: p) {
      ps[j] = 0
    }
  }
  return ps.reduce(0, combine: +)
}
