
import UIKit

struct LongInt {
  let digits: [Int]
}

extension LongInt {
  init(_ value: Int) {
    digits = LongInt.split(value)
  }

  static func split(var n: Int) -> [Int] {
    var result = [Int]()
    while n > 0 {
      result.append(n % 10)
      n /= 10
    }
    return result
  }

  func times(n: Int) -> LongInt {
    var result = [Int]()
    var carry = 0
    for x in digits {
      let product = x * n + carry
      let digit = product % 10
      carry = product / 10
      result.append(digit)
    }
    while carry > 0 {
      result.append(carry % 10)
      carry /= 10
    }
    return LongInt(digits: result)
  }
}

extension LongInt: Printable {
  var description: String {
    let ds = digits.reverse()
    var result = [Character]()
    for d in ds {
      result.append(Character(String(d)))
    }
    return String(result)
  }
}

func factorial(n: Int) -> LongInt {
  var result = LongInt(1)
  for x in 2...n {
    result = result.times(x)
  }
  return result
}

LongInt.split(12345).reverse() == [1,2,3,4,5]
LongInt(999).times(2).digits.reverse() == [1,9,9,8]
LongInt(1234567890).description == "1234567890"
factorial(10).description == "3628800"
factorial(10).digits.reduce(0, combine: +) == 27


let solution = factorial(100).digits.reduce(0, combine: +)
println(solution)




