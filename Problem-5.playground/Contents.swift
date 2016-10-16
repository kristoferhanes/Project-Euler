func gcd(_ a: Int, _ b: Int) -> Int {
  guard a <= b else { return gcd(b, a) }
  let mod = b % a
  guard mod != 0 else { return a }
  return gcd(mod, a)
}

func lcm(_ a: Int, _ b: Int) -> Int {
  return a / gcd(a, b) * b
}

func lcm(_ array: [Int]) -> Int {
  return array.reduce(1, lcm)
}

lcm(Array(1...10)) == 2520
let solution = lcm(Array(1...20))
solution
