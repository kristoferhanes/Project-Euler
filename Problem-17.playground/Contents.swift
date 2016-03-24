
import UIKit

func toDigits(n: Int) -> [Int] {
  var n = n
  var result = [Int]()
  while n > 0 {
    result.append(n % 10)
    n /= 10
  }
  return result
}

toDigits(12345) == [5,4,3,2,1]


func toWords(xs: [Int]) -> String {
  switch xs.count {
  case 1: return onesToWord(xs.first!)
  case 2: return twoDigitsToWords(xs[0]+xs[1]*10)
  case 3: return (xs.last != 0 ? onesToWord(xs.last!) + " hundred " : "")
    + (xs[0] == 0 && xs[1] == 0 ? "" : "and ")
    + toWords([Int](xs.dropLast()))
  case 4: return (xs.last != 0 ? onesToWord(xs.last!) + " thousand " : "")
    + toWords([Int](xs.dropLast()))
  default: return ""
  }
}

func onesToWord(n: Int) -> String {
  switch n {
  case 0: return ""
  case 1: return "one"
  case 2: return "two"
  case 3: return "three"
  case 4: return "four"
  case 5: return "five"
  case 6: return "six"
  case 7: return "seven"
  case 8: return "eight"
  case 9: return "nine"
  default: fatalError("out of bounds")
  }
}

func teensToWord(n: Int) -> String {
  switch n {
  case 11: return "eleven"
  case 12: return "twelve"
  case 13: return "thirteen"
  case 14: return "fourteen"
  case 15: return "fifteen"
  case 16: return "sixteen"
  case 17: return "seventeen"
  case 18: return "eighteen"
  case 19: return "nineteen"
  default: fatalError("out of bounds")
  }
}

func tensToWord(n: Int) -> String {
  switch n {
  case 10: return "ten"
  case 20: return "twenty"
  case 30: return "thirty"
  case 40: return "forty"
  case 50: return "fifty"
  case 60: return "sixty"
  case 70: return "seventy"
  case 80: return "eighty"
  case 90: return "ninety"
  default: fatalError("out of bounds")
  }
}

func twoDigitsToWords(n: Int) -> String {
  switch n {
  case 0...9: return onesToWord(n)
  case 11...19: return teensToWord(n)
  case 10...99 where n % 10 == 0:
    return tensToWord(n/10*10)
  case 10...99:
    return "\(tensToWord(n/10*10))-\(onesToWord(n%10))"
  default: fatalError("out of bounds")
  }
}


toWords(toDigits(1042))


func countLetters(s: String) -> Int {
  return s.characters.reduce(0) { count, x in
    switch x {
    case "a"..."z", "A"..."Z": return count + 1
    default: return count
    }
  }
}

countLetters("three hundred and forty-two") == 23
countLetters("one hundred and fifteen") == 20

func letterCounter(xs: [Int]) -> Int {
  return xs.map { countLetters(toWords(toDigits($0))) }.reduce(0, combine: +)
}

letterCounter([Int](1...5)) == 19


let solution = letterCounter([Int](1...1000))
solution





