func intToDigits(n: Int) -> [Int] {
  var n = n
  var result: [Int] = []
  while n > 0 {
    result.append(n % 10)
    n /= 10
  }
  return result
}

intToDigits(12345) == [5, 4, 3, 2, 1]


func digitsToWords(xs: [Int]) -> String {
  switch xs.count {
  case 1: return onesToWord(xs.first!)
  case 2: return twoDigitsToWords(xs[0]+xs[1]*10)
  case 3: return (xs.last != 0 ? onesToWord(xs.last!) + " hundred " : "")
    + (xs[0] == 0 && xs[1] == 0 ? "" : "and ")
    + digitsToWords([Int](xs.dropLast()))
  case 4: return (xs.last != 0 ? onesToWord(xs.last!) + " thousand " : "")
    + digitsToWords([Int](xs.dropLast()))
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
  case 10...99 where n % 10 == 0: return tensToWord(n/10*10)
  case 10...99: return "\(tensToWord(n/10*10))-\(onesToWord(n%10))"
  default: fatalError("out of bounds")
  }
}

func intToWords(n: Int) -> String {
  return digitsToWords(intToDigits(n))
}

intToWords(342) == "three hundred and forty-two"
intToWords(115) == "one hundred and fifteen"
intToWords(1042) == "one thousand and forty-two"


func countLetters(s: String) -> Int {

  func isLetter(char: Character) -> Bool {
    return "a"..."z" ~= char || "A"..."Z" ~= char
  }

  return s.characters.reduce(0) { count, char in isLetter(char) ? count+1 : count }
}

countLetters("three hundred and forty-two") == 23
countLetters("one hundred and fifteen") == 20

func letterCounter(range: Range<Int>) -> Int {
  return [Int](range)
    .map { countLetters(intToWords($0)) }
    .reduce(0, combine: +)
}

letterCounter(1...5) == 19


let solution = letterCounter(1...1000)
solution
