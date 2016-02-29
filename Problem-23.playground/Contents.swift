
import UIKit

let numbers = [Int](1...28123)

let abundants = numbers.filter(isAbundant)
println(abundants.count)

let sums = pairSums(abundants)
println(sums)

let nonSums = numbers.filter { !sums.contains($0) }

let solution = nonSums.reduce(0, combine: +)
println(solution)

