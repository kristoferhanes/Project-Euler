
import UIKit

[Int](220.properDivisors).reduce(0, combine: +) == 284
[Int](284.properDivisors).reduce(0, combine: +) == 220
areAmicable(220, 284)

let solution = amicableNumbersInRange(1..<10000)
  .reduce(0, combine: +)
print(solution)

