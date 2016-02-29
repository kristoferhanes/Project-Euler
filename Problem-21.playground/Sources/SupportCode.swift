
import Foundation

extension Int {
  public var properDivisors: Set<Int> {
    struct Memo { static var divs = [Int:Set<Int>]() }

    if let ds = Memo.divs[self] { return ds }
    let lowDivs = lowDivisors
    let highDivs = highDivisors(lowDivs).subtract([self])
    let result = lowDivs.union(highDivs)
    Memo.divs[self] = result
    return result
  }

  var lowDivisors: Set<Int> {
    var sieve = [Int](0...Int(sqrt(Double(self))))
    for x in sieve {
      if x == 0 { continue }
      if self % x != 0 {
        for i in stride(from: x, to: sieve.endIndex, by: x) {
          sieve[i] = 0
        }
      }
    }
    return Set(sieve.filter { $0 != 0 })
  }

  func highDivisors(lds: Set<Int>) -> Set<Int> {
    var result = Set<Int>()
    for x in lds {
      result.insert(self / x)
    }
    return result
  }
}

public func areAmicable(a: Int, b: Int) -> Bool {
  let sumA = [Int](a.properDivisors).reduce(0, combine: +)
  let sumB = [Int](b.properDivisors).reduce(0, combine: +)
  return sumA == b && sumB == a
}

public func amicableNumbersInRange(range: Range<Int>) -> [Int] {
  var result = [Int]()
  for i in range.startIndex..<range.endIndex-1 {
    for j in i+1..<range.endIndex {
      if areAmicable(i, j) { result += [i,j] }
    }
  }
  return result
}

