
import Foundation

func largestPrimeFactor(of n: Int) -> Int {

  func sqrt(_ n: Int) -> Int {
    return Int(Foundation.sqrt(Double(n)))
  }

  func isPrime(_ n: Int) -> Bool {
    for divisor in 2...sqrt(n) {
      if n % divisor == 0 {
        return false
      }
    }
    return true
  }

  var result = 1

  for divisor in 2...sqrt(n) {
    if n % divisor == 0 && isPrime(divisor) {
      result = divisor
    }
  }

  return result
}

largestPrimeFactor(of: 13195) == 29
largestPrimeFactor(of: 600851475143)
