import Foundation

public func smallestNumberDivisibleByAll(xs: [Int]) -> Int? {
  if xs.isEmpty { return nil }
  let largest = xs.sorted(>).first!
  for n in stride(from: largest*2, to: Int.max, by: largest) {
    if (xs.filter { n % $0 != 0 }).isEmpty  { return n }
  }
  return nil
}
