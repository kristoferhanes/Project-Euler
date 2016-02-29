


func mulBy2(var xs: [Int]) -> [Int] {
  var carry = 0

  for i in indices(xs) {
    let digit = xs[i] * 2 + carry
    carry = digit / 10
    xs[i] = digit % 10
  }

  if carry > 0 { xs.append(carry) }
  return xs
}


func powersOfTwo(n: Int) -> [Int] {
  var result = [1]

  for i in 1...n {
    result = mulBy2(result)
  }

  return result
}

func sum(xs: [Int]) -> Int {
  return xs.reduce(0, combine: +)
}

public func solution(n: Int) -> Int {
  return sum(powersOfTwo(n))
}
