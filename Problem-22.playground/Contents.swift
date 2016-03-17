
import UIKit

let path = "/Users/kristoferhanes/Dropbox/Developer/Project Euler/Problem-22.playground/Resources/names.txt"

func removeQuotes(s: String) -> String {
  if s.characters.count < 2 { return s }
  if s.characters.first != "\"" || s.characters.last != "\"" { return s }
  let range = s.startIndex.advancedBy(1)..<s.startIndex.advancedBy(s.characters.count-1)
  return s.substringWithRange(range)
}

func namesFromFile(path: String) -> [String] {
  return (try? String(contentsOfFile: path))?.characters.split(",").map { removeQuotes(String($0)) } ?? []
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
  return s.uppercaseString.characters.map(charValue).reduce(0, combine: +)
}

removeQuotes("\"hello\"") == "hello"
alphaValue("colin") == 53

let solution = namesFromFile(path).sort(<).enumerate()
  .map { ($0.index+1, alphaValue($0.element)) }
  .map { $0.0 * $0.1 }
  .reduce(0, combine: +)


print(solution)


