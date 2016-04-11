
func sumOfSquares(xs: [Int]) -> Int {
  return xs.reduce(0) { sum, x in sum + (x * x) }
}

func squareOfSum(xs: [Int]) -> Int {
  let sum = xs.reduce(0, combine: +)
  return sum * sum
}

sumOfSquares([Int](1...10)) == 385
squareOfSum([Int](1...10)) == 3025
squareOfSum([Int](1...10)) - sumOfSquares([Int](1...10)) == 2640

let result = squareOfSum([Int](1...100)) - sumOfSquares([Int](1...100))
result
