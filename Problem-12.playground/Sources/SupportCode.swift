
import Foundation

extension Set {
  func map<Mapped>(_ transform: (Element) -> Mapped) -> Set<Mapped> {
    var result = Set<Mapped>(minimumCapacity: count)
    for x in self {
      result.insert(transform(x))
    }
    return result
  }
}

func factors(of number: Int) -> Set<Int> {

  func lowFactors(of number: Int) -> Set<Int> {

    func sqrt(_ number: Int) -> Int {
      return Int(Foundation.sqrt(Double(number)))
    }

    var divisors = [Int](0...sqrt(number))
    for divisor in divisors where divisor != 0 && number % divisor != 0 {
      for i in stride(from: divisor, to: divisors.endIndex, by: divisor) {
        divisors[i] = 0
      }
    }
    return Set(divisors).subtracting([0])
  }

  func highFactors(of number: Int, fromLowFactors factors: Set<Int>) -> Set<Int> {
    return factors.map { number / $0 }
  }

  let lf = lowFactors(of: number)
  let hf = highFactors(of: number, fromLowFactors: lf)
  return lf.union(hf)
}

public func firstValue(withDivisorCountGreaterThan divisorCount: Int,
                                                   from xs: AnyIterator<Int>) -> Int? {
  for x in xs {
    if factors(of: x).count > divisorCount {
      return x
    }
  }
  return nil
}

public var triangleNums: AnyIterator<Int> = AnyIterator {
  struct State {
    static var index = 1
    static var next = 0
  }

  State.next += State.index
  State.index += 1
  return State.next
}
