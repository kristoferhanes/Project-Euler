import Foundation

func names(from file: NSURL) -> [String] {

  func removeQuotes(from s: String) -> String {
    guard s.characters.count >= 2 else { return s }
    guard s.characters.first == "\"" && s.characters.last == "\"" else { return s }
    let range = s.startIndex.advancedBy(1)..<s.startIndex.advancedBy(s.characters.count-1)
    return s.substringWithRange(range)
  }
  
  guard let contents = try? String(contentsOfURL: file) else { return [] }
  return contents.characters.split(",").map(String.init).map(removeQuotes)
}

func alphaValue(s: String) -> Int {

  func charValue(c: Character) -> Int {
    struct Constant { static let AlphaOffset = 64 }
    struct Memo { static var charValues = [Character:Int]() }
    if let cv = Memo.charValues[c] { return cv }

    let result = Int(String(c).unicodeScalars.first!.value) - Constant.AlphaOffset

    Memo.charValues[c] = result
    return result
  }

  return s.uppercaseString.characters.map(charValue).reduce(0, combine: +)
}

alphaValue("colin") == 53

let file = [#FileReference(fileReferenceLiteral: "names.txt")#]

let solution = names(from: file).sort().enumerate()
  .map { ($0.index+1) * alphaValue($0.element) }
  .reduce(0, combine: +)


solution
