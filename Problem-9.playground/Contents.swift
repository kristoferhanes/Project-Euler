

func productOfPythagoreanTriple(withSum sum: Int) -> Int? {
  for a in 1..<sum {
    let x = Double(sum * (sum - 2*a)) / Double(2 * (sum - a))
    guard x == Double(Int(x)) else { continue }
    let b = Int(x)
    let c = sum - (a + b)
    return a * b * c
  }
  return nil
}


productOfPythagoreanTriple(withSum: 3+4+5)! == 3*4*5

let solution = productOfPythagoreanTriple(withSum: 1000)
solution
