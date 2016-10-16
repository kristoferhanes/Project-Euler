struct BigInt {
  var digits: [Int]
}

extension BigInt {
  init(_ value: Int) {

    func digits(_ n: Int) -> [Int] {
      var n = n
      var result: [Int] = []
      while n > 0 {
        result.append(n % 10)
        n /= 10
      }
      return result
    }
    
    self.digits = digits(value)
  }

  mutating func timesInPlace(_ n: Int) {
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

extension Int {
  var factorial: BigInt {
    var result = BigInt(2)
    for x in 3...self {
      result.timesInPlace(x)
    }
    return result
  }
}

extension Sequence where Iterator.Element == Int {
  var sum: Int {
    return reduce(0, +)
  }
}

10.factorial.digits.sum == 27

let solution = 100.factorial.digits.sum
solution
