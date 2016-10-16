
struct Natural {
  fileprivate var digits: [Int]

  init(_ value: Int) {
    var value = value
    var initDigits: [Int] = []
    repeat {
      initDigits.append(value % 10)
      value /= 10
    } while value > 0
    digits = initDigits
  }

  init(digits: [Int]) {
    self.digits = digits
  }

  var digitCount: Int {
    return digits.count
  }
}

func + (shorter: Natural, longer: Natural) -> Natural {
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

func fibs(_ index: Int) -> Natural {
  struct Memo { static var fibs = [1:Natural(1), 2:Natural(1)] }
  if let f = Memo.fibs[index] { return f }
  for i in 3...index where Memo.fibs[i] == nil {
    Memo.fibs[i] = Memo.fibs[i-1]! + Memo.fibs[i-2]!
  }
  return Memo.fibs[index]!
}

public func firstFibIndex(withDigitCount digitCountGoal: Int) -> Int {
  for i in 1..<Int.max {
    let digitCount = fibs(i).digitCount
    guard digitCount < digitCountGoal else { return i }
  }
  return 0
}
