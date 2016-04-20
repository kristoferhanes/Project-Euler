
struct LongInt {
  var digits: [Int]
}

extension LongInt {

  init(_ value: Int) {
    digits = LongInt.split(value)
  }

  static func split(n: Int) -> [Int] {
    var n = n
    var result: [Int] = []
    while n > 0 {
      result.append(n % 10)
      n /= 10
    }
    return result
  }

  func times(n: Int) -> LongInt {
    var copy = self
    copy.timesInPlace(n)
    return copy
  }

  mutating func timesInPlace(n: Int) {
    var carry = 0
    for i in digits.indices {
      let product = digits[i] * n + carry
      digits[i] = product % 10
      carry = product / 10
    }
    while carry > 0 {
      digits.append(carry % 10)
      carry /= 10
    }
  }

}

func factorial(n: Int) -> LongInt {
  var result = LongInt(2)
  for x in 3...n {
    result.timesInPlace(x)
  }
  return result
}

LongInt.split(12345).reverse() == [1,2,3,4,5]
LongInt(999).times(2).digits.reverse() == [1,9,9,8]
factorial(10).digits.reduce(0, combine: +) == 27


let solution = factorial(100).digits.reduce(0, combine: +)
solution
