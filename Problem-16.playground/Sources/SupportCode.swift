func double(_ xs: [Int]) -> [Int] {
  var xs = xs
  var carry = 0
  for i in xs.indices {
    let digit = xs[i] * 2 + carry
    carry = digit / 10
    xs[i] = digit % 10
  }
  if carry > 0 { xs.append(carry) }
  return xs
}

func powersOfTwo(_ n: Int) -> [Int] {
  var result = [1]
  for _ in 1...n {
    result = double(result)
  }
  return result
}

public func sumOfDigits(forPowerOfTwo n: Int) -> Int {
  return powersOfTwo(n).reduce(0, +)
}
