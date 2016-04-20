import Foundation

extension Int {
  public var properDivisors: Set<Int> {
    struct Memo { static var divs = [Int:Set<Int>]() }
    if let ds = Memo.divs[self] { return ds }

    let lowDivs = lowDivisors
    let highDivs = highDivisors(lowDivs)
    let result = Set(lowDivs).union(highDivs).subtract([self])

    Memo.divs[self] = result
    return result
  }

  var lowDivisors: [Int] {
    var sieve = [Int](0...Int(sqrt(Double(self))))
    for x in sieve where x != 0 && self % x != 0 {
      for i in x.stride(to: sieve.endIndex, by: x) {
        sieve[i] = 0
      }
    }
    return sieve.filter { $0 != 0 }
  }

  func highDivisors(lds: [Int]) -> [Int] {
    return lds.map { self / $0 }
  }
}

public func areAmicable(a: Int, _ b: Int) -> Bool {
  let sumA = a.properDivisors.reduce(0, combine: +)
  let sumB = b.properDivisors.reduce(0, combine: +)
  return sumA == b && sumB == a
}

public func amicableNumbers(inRange range: Range<Int>) -> [Int] {
  var result: [Int] = []
  for i in range.startIndex..<range.endIndex-1 {
    for j in i+1..<range.endIndex {
      if areAmicable(i, j) { result += [i,j] }
    }
  }
  return result
}
