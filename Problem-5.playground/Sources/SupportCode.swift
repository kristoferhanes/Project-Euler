import Foundation

public func smallestNumberDivisibleByAll(xs: [Int]) -> Int? {
  if xs.isEmpty { return nil }
  let largest = xs.sort(>).first!
  for n in (largest*2).stride(to: Int.max, by: largest) {
    if (xs.filter { n % $0 != 0 }).isEmpty  { return n }
  }
  return nil
}
