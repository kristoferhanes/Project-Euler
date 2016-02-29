

public func primesBelow(n: Int) -> [Int] {
  var ps = [Int](2..<n)
  for (i, p) in enumerate(ps) {
    if p == 0 { continue }
    for j in stride(from: i+p, to: ps.endIndex, by: p) {
      ps[j] = 0
    }
  }
  return ps.filter { $0 != 0 }
}

public func sum(xs: [Int]) -> Int {
  return xs.reduce(0, combine: +)
}

