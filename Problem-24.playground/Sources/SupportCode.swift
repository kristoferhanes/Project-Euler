public func permutions(of str: String) -> [String] {

  func permutions(of substr: String.CharacterView) -> [String] {
    guard substr.count > 1 else { return [String(substr)] }
    var result: [String] = []
    for (index, char) in substr.enumerated() {
      let front = substr.dropLast(substr.count-index)
      let back = substr.dropFirst(index+1)
      for perm in permutions(of: front+back) {
        result.append("\(char)" + perm)
      }
    }
    return result
  }

  return permutions(of: str.characters).sorted()
}
