
import UIKit

func fibs() -> [Int] {
  var result = [1,2]

  for i in 2..<100 {
    let fib = result[i-1] + result[i-2]
    if fib > 4_000_000 { break }
    result.append(fib)
  }

  return result
}

let sum = fibs().filter { $0 % 2 == 0 }.reduce(0, combine: +)
sum
