//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to Problem-3.playground.
//

import Foundation

func sqrt(number: Int) -> Int {
  return Int(sqrt(Double(number)))
}

func lowFactors(n: Int) -> [Int] {
  var divisors = [Int](0...sqrt(n))
  for divisor in divisors {
    if divisor == 0 || n % divisor == 0 { continue }
    for i in divisor.stride(to: divisors.endIndex, by: divisor) {
      divisors[i] = 0
    }
  }
  return divisors.filter { $0 != 0 }
}

func highFactors(n: Int, fromLowFactors lfs: [Int]) -> [Int] {
  return lfs.map { n / $0 }
}

public func factors(n: Int) -> Set<Int> {
  let lfs = lowFactors(n)
  let hfs = highFactors(n, fromLowFactors: lfs)
  return Set(lfs).union(hfs)
}

public func isPrime(n: Int) -> Bool {
  let fs = factors(n)
  return n > 1 && fs.count == 2 && fs.contains(1) && fs.contains(n)
}
