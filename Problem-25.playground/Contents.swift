
import UIKit

func fibs(index: Int) -> Natural {
  struct Memo { static var fibs = [1:Natural(1), 2:Natural(1)] }
  if let f = Memo.fibs[index] { return f }
  for i in 3...index {
    if let _ = Memo.fibs[i] { continue }
    Memo.fibs[i] = Memo.fibs[i-1]! + Memo.fibs[i-2]!
  }
  return Memo.fibs[index]!
}

var index = 5000
var digitCount = 0
repeat {
  index--
  digitCount = fibs(index).digits.count
  print("index: \(index), digitCount: \(digitCount)")
} while digitCount > 999

index

