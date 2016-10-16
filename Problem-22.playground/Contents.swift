import Foundation

func names(from file: URL) -> [String] {

  func withoutQuotes(_ s: String) -> String {
    guard s.characters.count >= 2 else { return s }
    guard s.characters.first == "\"" && s.characters.last == "\"" else { return s }
    return s.substring(with: s.index(after: s.startIndex)..<s.index(before: s.endIndex))
  }
  
  guard let contents = try? String(contentsOf: file) else { return [] }
  return contents.characters.split(separator: ",").map(String.init).map(withoutQuotes)
}

func alphaValue(_ s: String) -> Int {

  func charValue(c: Character) -> Int {
    struct Constant { static let AlphaOffset = 64 }
    struct Memo { static var charValues = [Character:Int]() }
    if let cv = Memo.charValues[c] { return cv }

    let result = Int(String(c).unicodeScalars.first!.value) - Constant.AlphaOffset

    Memo.charValues[c] = result
    return result
  }

  return s.uppercased().characters.map(charValue).reduce(0, +)
}

alphaValue("colin") == 53

let file = #fileLiteral(resourceName: "names.txt")

let solution = names(from: file).sorted().enumerated()
  .map { ($0.offset+1) * alphaValue($0.element) }
  .reduce(0, +)

solution
