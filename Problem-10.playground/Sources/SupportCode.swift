

public func sumOfPrimes(below n: Int) -> Int {
  var ps = [Int](2..<n)
  for (i, p) in ps.enumerated() where p != 0 {
    for j in stride(from: i + p, to: ps.endIndex, by: p) {
      ps[j] = 0
    }
  }
  return ps.reduce(0, +)
}

