func gcd(a: Int, _ b: Int) -> Int {
  guard a <= b else { return gcd(b, a) }
  let mod = b % a
  guard mod != 0 else { return a }
  return gcd(mod, a)
}

func lcm(a: Int, _ b: Int) -> Int {
  return a / gcd(a, b) * b
}

func lcm(range: Range<Int>) -> Int {
  return range.reduce(1, combine: lcm)
}

lcm(1...10) == 2520
let solution = lcm(1...20)
solution
