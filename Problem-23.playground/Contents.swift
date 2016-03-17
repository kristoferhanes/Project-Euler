
import UIKit

let numbers = [Int](1...28123)

let abundants = numbers.filter(isAbundant)
print(abundants.count)

let sums = pairSums(abundants)
print(sums)

let nonSums = numbers.filter { !sums.contains($0) }

let solution = nonSums.reduce(0, combine: +)
print(solution)

