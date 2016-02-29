
import Foundation

extension Int {
  var isPalindrome: Bool {
    let s = String(self)
    let r = String(reverse(s))
    return s == r
  }
}

func palindromes(#from: Int, #to: Int) -> [Int] {
  var pals = [Int]()
  for i in from...to {
    for j in i...to {
      let product = i * j
      if product.isPalindrome { pals.append(product) }
    }
  }
  return pals
}

func max<T: Comparable>(xs: [T]) -> T? {
  return xs.reduce(nil) { max, x in x > max ? x : max }
}

public func largestPalindrome(#from: Int, #to: Int) -> Int? {
  return max(palindromes(from: from, to: to))
}
