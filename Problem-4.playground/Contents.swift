
func largestPalindromeProduct(from from: Int, to: Int) -> Int? {

  func isPalindrome(n: Int) -> Bool {
    let s = String(n)
    func isPalindrome(start start: String.Index, end: String.Index) -> Bool {
      guard start < end else { return true }
      guard s[start] == s[end] else { return false }
      return isPalindrome(start: start.successor(), end: end.predecessor())
    }
    return isPalindrome(start: s.startIndex, end: s.endIndex.predecessor())
  }

  var result: Int?
  for i in from...to {
    for j in i...to {
      let product = i * j
      guard product > result else { continue }
      guard isPalindrome(product) else { continue }
      result = product
    }
  }
  return result
}

largestPalindromeProduct(from: 10, to: 99) == 9009
let result = largestPalindromeProduct(from: 100, to: 999)
result
