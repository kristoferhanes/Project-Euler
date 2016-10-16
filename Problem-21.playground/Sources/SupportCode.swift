import Foundation

extension Int {
  public var properDivisors: Set<Int> {
    struct Memo { static var divs = [Int:Set<Int>]() }
    if let ds = Memo.divs[self] { return ds }

    let lowDivs = lowDivisors
    let highDivs = highDivisors(lowDivs)
    let result = Set(lowDivs).union(highDivs).subtracting([self])

    Memo.divs[self] = result
    return result
  }

  var lowDivisors: [Int] {

    func sqrt(_ x: Int) -> Int {
      return Int(Foundation.sqrt(Double(x)))
    }
    
    var divisors = [Int](0...sqrt(self))
    for divisor in divisors where divisor != 0 {
      guard self % divisor != 0 else { continue }
      for i in Swift.stride(from: divisor, to: divisors.endIndex, by: divisor) {
        divisors[i] = 0
      }
    }
    return divisors.filter { $0 != 0 }
  }

  func highDivisors(_ lds: [Int]) -> [Int] {
    return lds.map { self / $0 }
  }
}

public func areAmicable(_ a: Int, _ b: Int) -> Bool {
  let sumA = a.properDivisors.reduce(0, +)
  let sumB = b.properDivisors.reduce(0, +)
  return sumA == b && sumB == a
}

public func amicableNumbers(in array: [Int]) -> [Int] {
  var result: [Int] = []
  for i in array.indices {
    for j in i+1..<array.endIndex where areAmicable(i, j) {
      result += [i,j]
    }
  }
  return result
}
