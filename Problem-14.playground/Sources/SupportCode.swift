



public func collatz(n: Int) -> [Int] {
  if n < 1 { return [] }
  if n == 1 { return [1] }
  let n1 = n%2 == 0 ? n/2 : 3*n+1
  return [n] + collatz(n1)
}

public func collatzes(n: Int) -> [[Int]] {
  if n < 1 { return [] }
  var result = [[Int]]()
  for i in 1...n {
    result.append(collatz(i))
  }
  return result
}

public func longestCollatz(n: Int) -> [Int] {
  return collatzes(n).reduce([]) { max, x in x.count > max.count ? x : max }
}