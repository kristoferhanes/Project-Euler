220.properDivisors.reduce(0, combine: +) == 284
284.properDivisors.reduce(0, combine: +) == 220
areAmicable(220, 284)

amicableNumbers(inRange: 1...1000)

let solution = amicableNumbers(inRange: 1..<10000).reduce(0, combine: +)
solution
