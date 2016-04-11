
import Foundation

public func primeAtIndex(index: Int) -> Int {

  func isPrime(n: Int) -> Bool {

    func sqrt(x: Int) -> Int {
      return Int(Foundation.sqrt(Double(x)))
    }

    if n < 2 { return false }
    if n == 2 || n == 3 { return true }
    var divisors = [Int](2...sqrt(n))
    for divisor in divisors where divisor != 0 {
      guard n % divisor != 0 else { return false }
      for i in divisor.stride(to: divisors.endIndex+2, by: divisor) {
        divisors[i-2] = 0
      }
    }
    return true
  }

  var counter = 0
  for x in 2..<Int.max where isPrime(x) {
    counter += 1
    if counter == index {
      return x
    }
  }
  return 0
}
