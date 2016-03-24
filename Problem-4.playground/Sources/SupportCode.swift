
import Foundation

extension Int {
  var isPalindrome: Bool {
    let s = String(self)
    let r = String(s.characters.reverse())
    return s == r
  }
  
}

func palindromes(from from: Int, to: Int) -> [Int] {
  var pals = [Int]()
  for i in from...to {
    for j in i...to {
      let product = i * j
      if product.isPalindrome { pals.append(product) }
    }
  }
  return pals
}

public func largestPalindrome(from from: Int, to: Int) -> Int? {
  return palindromes(from: from, to: to).maxElement()
}
