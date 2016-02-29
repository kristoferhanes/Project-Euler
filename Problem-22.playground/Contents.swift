
import UIKit

let path = "/Users/kristoferhanes/Dropbox/Developer/Project Euler/Problem-22.playground/Resources/names.txt"

func removeQuotes(s: String) -> String {
  if count(s) < 2 { return s }
  if first(s) != "\"" || last(s) != "\"" { return s }
  let range = advance(s.startIndex,1)..<advance(s.startIndex,count(s)-1)
  return s.substringWithRange(range)
}

func namesFromFile(path: String) -> [String] {
  return String(contentsOfFile: path)?.componentsSeparatedByString(",").map(removeQuotes) ?? []
}

func charValue(c: Character) -> Int {
  struct Constants { static let alphaOffset = 64 }
  struct Memo { static var charValues = [Character:Int]() }

  if let cv = Memo.charValues[c] { return cv }
  let scalars = String(c).unicodeScalars
  let result = Int(scalars[scalars.startIndex].value) - Constants.alphaOffset
  Memo.charValues[c] = result
  return result
}

func alphaValue(s: String) -> Int {
  return Array(s.uppercaseString).map(charValue).reduce(0, combine: +)
}

removeQuotes("\"hello\"") == "hello"
alphaValue("colin") == 53

let solution = Array(enumerate(namesFromFile(path).sorted(<)))
  .map { ($0.index+1, alphaValue($0.element)) }
  .map { $0.0 * $0.1 }
  .reduce(0, combine: +)


println(solution)


