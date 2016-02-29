
import Foundation

public func primeAtIndex(index: Int) -> Int {
  var counter = 0
  for x in 2..<Int.max {
    if isPrime(x) { counter++ }
    if counter == index { return x }
  }
  return 0
}

func sqrt(x: Int) -> Int {
  return Int(sqrt(Double(x)))
}

func isPrime(n: Int) -> Bool {
  struct Memo { static var primes = Set([2,3]) }

  if Memo.primes.contains(n) { return true }
  var divisors = [Int](2...sqrt(n))
  for divisor in divisors {
    if divisor == 0 { continue }
    if n % divisor == 0 { return false }
    else {
      for i in stride(from: divisor, to: divisors.endIndex+2, by: divisor) {
        divisors[i-2] = 0
      }
    }
  }
  Memo.primes.insert(n)
  return true
}
