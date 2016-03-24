
public struct Natural {
  public let digits: [Int]

  public init(_ value: Int) {
    var value = value
    var initDigits: [Int] = []
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

public func + (shorter: Natural, longer: Natural) -> Natural {
  guard shorter.digits.count <= longer.digits.count
    else { return longer + shorter }

  var result: [Int] = []
  var carry = 0
  for i in 0..<shorter.digits.count {
    let value = shorter.digits[i] + longer.digits[i] + carry
    result.append(value % 10)
    carry = value / 10
  }

  for i in shorter.digits.count..<longer.digits.count {
    let value = longer.digits[i] + carry
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
