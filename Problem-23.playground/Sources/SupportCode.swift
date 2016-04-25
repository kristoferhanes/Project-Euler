import Foundation

extension Set {
  func map<Mapped>(@noescape transform: Element->Mapped) -> Set<Mapped> {
    var result = Set<Mapped>(minimumCapacity: count)
    for x in self {
      result.insert(transform(x))
    }
    return result
  }
}

func factors(of number: Int) -> Set<Int> {

  func lowFactors(of number: Int) -> Set<Int> {

    func sqrt(number: Int) -> Int {
      return Int(Foundation.sqrt(Double(number)))
    }

    var divisors = [Int](0...sqrt(number))
    for divisor in divisors where divisor != 0 && number % divisor != 0 {
      for i in divisor.stride(to: divisors.endIndex, by: divisor) {
        divisors[i] = 0
      }
    }
    return Set(divisors).subtract([0])
  }

  func highFactors(of number: Int, fromLowFactors factors: Set<Int>) -> Set<Int> {
    return factors.map { number / $0 }
  }

  let lf = lowFactors(of: number)
  let hf = highFactors(of: number, fromLowFactors: lf)
  return lf.union(hf)
}

func sumOfFactors(of n: Int) -> Int {
  return factors(of: n).reduce(0,combine: +)
}

func isNaturalNumber(number: Int) -> Bool {
  return number > 0
}

public func isPerfect(number: Int) -> Bool {
  guard isNaturalNumber(number) else { return false }
  return sumOfFactors(of: number) - number == number
}

public func isAbundant(number: Int) -> Bool {
  guard isNaturalNumber(number) else { return false }
  return sumOfFactors(of: number) - number > number
}

public func isDeficient(number: Int) -> Bool {
  guard isNaturalNumber(number) else { return false }
  return sumOfFactors(of: number) - number < number
}

public func pairSums(xs: [Int]) -> Set<Int> {
  var result: Set<Int> = []
  for i in 0..<xs.endIndex {
    for j in i..<xs.endIndex {
      result.insert(xs[j] + xs[i])
    }
  }
  return result
}
