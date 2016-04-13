
public func collatzCount(withStarter starter: Int) -> Int {
  var n = starter
  var count = 0
  while true {
    count += 1
    guard n > 1 else { break }
    n = n % 2 == 0 ? n / 2 : 3 * n + 1
  }
  return count
}

public func longestCollatz(withStarterUnder n: Int) -> Int {
  var result = 0
  var resultCount = 0
  for i in 0..<n {
    let count = collatzCount(withStarter: i)
    guard count > resultCount else { continue }
    result = i
    resultCount = count
  }
  return result
}
