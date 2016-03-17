
public struct Natural {
  public let digits: [Int]

  public init(var _ value: Int) {
    var initDigits = [Int]()
    repeat {
      initDigits.append(value % 10)
      value /= 10
    } while value > 0
    digits = initDigits
  }

  public init(digits: [Int]) {
    self.digits = digits
  }
}

public func + (lhs: Natural, rhs: Natural) -> Natural {
  let (shorter, longer) = lhs.digits.count < rhs.digits.count
    ? (lhs.digits, rhs.digits)
    : (rhs.digits, lhs.digits)

  var result = [Int]()
  var carry = 0
  for i in 0..<shorter.count {
    let value = shorter[i] + longer[i] + carry
    result.append(value % 10)
    carry = value / 10
  }

  for i in shorter.count..<longer.count {
    let value = longer[i] + carry
    result.append(value % 10)
    carry = value / 10
    if carry == 0 { break }
  }

  while carry > 0 {
    result.append(carry % 10)
    carry = carry / 10
  }

  return Natural(digits: result)
}

