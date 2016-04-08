
import Foundation

func largestPalindromeProduct(from from: Int, to: Int) -> Int? {

  func isPalindrome(n: Int) -> Bool {
    let s = String(n)
    let r = String(s.characters.reverse())
    return s == r
  }

  var result: Int?
  for i in from...to {
    for j in i...to {
      let product = i * j
      guard product > result else { continue }
      if isPalindrome(product) {
        result = product
      }
    }
  }
  return result
}


largestPalindromeProduct(from: 10, to: 99) == 9009
let result = largestPalindromeProduct(from: 100, to: 999)
result
