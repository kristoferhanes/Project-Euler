
isPerfect(28) == true
isAbundant(12) == true

let numbers = [Int](1...28123)
let abundants = numbers.filter(isAbundant)
let sums = pairSums(abundants)
let nonSums = numbers.filter { !sums.contains($0) }

let solution = nonSums.reduce(0, combine: +)
solution
