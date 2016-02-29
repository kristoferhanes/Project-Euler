



import Foundation

func memoize<T: Hashable, U>(body: ((T)->U,T)->U) -> (T)->U {
  var memo = [T:U]()
  var result: ((T)->U)!
  result = { x in
    if let q = memo[x] { return q }
    let r = body(result, x)
    memo[x] = r
    return r
  }
  return result
}

private func sum(set: Set<Int>) -> Int {
  return reduce(set, 0, +)
}

extension Int {
  func isDivisibleBy(number: Int) -> Bool {
    return self % number == 0
  }
}

private func lowFactorsOf(number: Int, remaining: ArraySlice<Int>) -> Set<Int> {
  if remaining.isEmpty { return [] }
  let (divisor, tail) = (remaining.first!, remaining[1..<remaining.count])
  return number.isDivisibleBy(divisor) ? lowFactorsOf(number, tail).union([divisor]) :
    lowFactorsOf(number, tail.filter { x in !x.isDivisibleBy(divisor) })
}

private func highFactorsOf(number: Int, fromLowFactors factors: Set<Int>) -> Set<Int> {
  return Set(map(factors) { x in number / x })
}

private func sqrt(number: Int) -> Int {
  return Int(sqrt(Double(number)))
}

private func getFactors(number: Int) -> Set<Int> {
  let lowFactors = lowFactorsOf(number, ArraySlice(1...sqrt(number)))
  let highFactors = highFactorsOf(number, fromLowFactors: lowFactors)
  return lowFactors.union(highFactors)
}

let factorsOf = memoize { factorsOf, x in getFactors(x) }
let sumOfFactors = memoize { sumOfFactors, x in sum(factorsOf(x)) }

public func isPerfect(number: Int) -> Bool {
  if !isNaturalNumber(number) { return false }
  return sumOfFactors(number) - number == number
}

public func isAbundant(number: Int) -> Bool {
  if !isNaturalNumber(number) { return false }
  return sumOfFactors(number) - number > number
}

public func isDeficient(number: Int) -> Bool {
  if !isNaturalNumber(number) { return false }
  return sumOfFactors(number) - number < number
}

public enum NumberClassifier: Printable {

  case Perfect(Int)
  case Abundant(Int)
  case Deficient(Int)
  case Nonnatural(Int)

  init(_ number: Int) {
    if isPerfect(number) {
      self = .Perfect(number)
    } else if isAbundant(number) {
      self = .Abundant(number)
    } else if isDeficient(number) {
      self = .Deficient(number)
    } else {
      self = .Nonnatural(number)
    }
  }

  public var description: String {
    switch self {
    case .Perfect(let value):
      return "\(value) is perfect"
    case .Abundant(let value):
      return "\(value) is abundant"
    case .Deficient(let value):
      return "\(value) is deficient"
    case .Nonnatural(let value):
      return "\(value) is nonnatural"
    }
  }

}

private func isNaturalNumber(number: Int) -> Bool {
  return number > 0
}

public func pairSums(xs: [Int]) -> Set<Int> {
  var result = Set<Int>()
  for i in 0..<xs.endIndex {
    for j in i..<xs.endIndex {
      result.insert(xs[j] + xs[i])
    }
  }
  return result
}




