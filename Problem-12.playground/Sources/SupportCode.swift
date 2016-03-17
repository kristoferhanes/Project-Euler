

import Foundation

extension Set {
  func map<U>(transform: Element->U) -> Set<U> {
    var result = Set<U>()
    for x in self {
      result.insert(transform(x))
    }
    return result
  }
}

func sqrt(number: Int) -> Int {
  return Int(sqrt(Double(number)))
}

func lowFactors(number: Int) -> Set<Int> {
  var divisors = [Int](0...sqrt(number))
  for divisor in divisors {
    if divisor == 0 { continue }
    if number % divisor != 0 {
      for i in divisor.stride(to: divisors.endIndex, by: divisor) {
        divisors[i] = 0
      }
    }
  }
  return Set(divisors).subtract([0])
}

func highFactors(number: Int, fromLowFactors factors: Set<Int>) -> Set<Int> {
  return factors.map { number / $0 }
}

func factors(number: Int) -> Set<Int> {
  let lf = lowFactors(number)
  let hf = highFactors(number, fromLowFactors: lf)
  return lf.union(hf)
}

public func firstWith500Divisors(xs: AnyGenerator<Int>) -> Int? {
  for x in xs {
    if factors(x).count > 500 { return x }
  }
  return nil
}

public var triangleNums: AnyGenerator<Int> = anyGenerator {
  struct State {
    static var index = 1
    static var next = 0
  }

  State.next += State.index++
  return State.next
}
