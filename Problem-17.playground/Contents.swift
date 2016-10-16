func words(for n: Int) -> String {
  
  func digits(_ n: Int) -> [Int] {
    var n = n
    var result: [Int] = []
    while n > 0 {
      result.append(n % 10)
      n /= 10
    }
    return result
  }
  
  func wordForOnesDigit(_ n: Int) -> String {
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
  
  func wordForTeen(_ n: Int) -> String {
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
  
  func wordForTensDigit(_ n: Int) -> String {
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
  
  func wordsForTwoDigits(_ n: Int) -> String {
    switch n {
    case 0...9: return wordForOnesDigit(n)
    case 11...19: return wordForTeen(n)
    case 10...99 where n % 10 == 0: return wordForTensDigit(n/10*10)
    case 10...99: return "\(wordForTensDigit(n/10*10))-\(wordForOnesDigit(n%10))"
    default: fatalError("out of bounds")
    }
  }
  
  func words(for xs: [Int]) -> String {
    switch xs.count {
    case 1: return wordForOnesDigit(xs.first!)
    case 2: return wordsForTwoDigits(xs[0]+xs[1]*10)
    case 3: return (xs.last != 0 ? wordForOnesDigit(xs.last!) + " hundred " : "")
      + (xs[0] == 0 && xs[1] == 0 ? "" : "and ")
      + words(for: [Int](xs.dropLast()))
    case 4: return (xs.last != 0 ? wordForOnesDigit(xs.last!) + " thousand " : "")
      + words(for: [Int](xs.dropLast()))
    default: return ""
    }
  }
  
  return words(for: digits(n))
}

words(for: 342)  == "three hundred and forty-two"
words(for: 115)  == "one hundred and fifteen"
words(for: 1042) == "one thousand and forty-two"


func letterCount(in s: String) -> Int {

  func isLetter(_ char: Character) -> Bool {
    return "a"..."z" ~= char || "A"..."Z" ~= char
  }
  
  func addOne<A>(when: @escaping (A) -> Bool) -> (Int, A) -> Int {
    return { total, x in when(x) ? total + 1 : total }
  }

  return s.characters.reduce(0, addOne(when: isLetter))
}

letterCount(in: "three hundred and forty-two") == 23
letterCount(in: "one hundred and fifteen")     == 20

func totalLetterCount<Seq: Sequence>(in seq: Seq) -> Int
  where Seq.Iterator.Element == Int {
  return seq.map { letterCount(in: words(for: $0)) }.reduce(0, +)
}

totalLetterCount(in: 1...5) == 19

let solution = totalLetterCount(in: 1...1000)
solution
