
import UIKit

func isPyth(a: Int, _ b: Int, _ c: Int) -> Bool {
  return a*a + b*b == c*c
}

func pythWithSum(sum: Int) -> (Int,Int,Int)? {
  for a in 1...(sum/3-1) {
    for b in (a+1)...(sum*2/3-1) {
      let c = sum-(a+b)
      if isPyth(a, b, c) {
        return (a, b, c)
      }
    }
  }
  return nil
}

func productOfPythWithSum(sum: Int) -> Int? {
  return pythWithSum(sum).map { $0 * $1 * $2 }
}


productOfPythWithSum(3+4+5) == 3*4*5

let solution = productOfPythWithSum(1000)
