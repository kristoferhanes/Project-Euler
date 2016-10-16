
func largestPalindromeProduct(from: Int, to: Int) -> Int? {

  func isPalindrome(_ n: Int) -> Bool {
    let s = String(n).characters
    func isPalindrome(start: String.Index, end: String.Index) -> Bool {
      guard start < end else { return true }
      guard s[start] == s[end] else { return false }
      return isPalindrome(start: s.index(after: start), end: s.index(before: end))
    }
    return isPalindrome(start: s.startIndex, end: s.index(before: s.endIndex))
  }

  var result = Int.min
  for i in from...to {
    for j in i...to {
      let product = i * j
      guard product > result else { continue }
      guard isPalindrome(product) else { continue }
      result = product
    }
  }
  return result == Int.min ? nil : result
}

largestPalindromeProduct(from: 10, to: 99) == 9009
let result = largestPalindromeProduct(from: 100, to: 999)
result
