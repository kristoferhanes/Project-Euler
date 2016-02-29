

let triangle = [
  75,
  95, 64,
  17, 47, 82,
  18, 35, 87, 10,
  20, 04, 82, 47, 65,
  19, 01, 23, 75, 03, 34,
  88, 02, 77, 73, 07, 63, 67,
  99, 65, 04, 28, 06, 16, 70, 92,
  41, 41, 26, 56, 83, 40, 80, 70, 33,
  41, 48, 72, 33, 47, 32, 37, 16, 94, 29,
  53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14,
  70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57,
  91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48,
  63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31,
  04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]

//let triangle = [
//  3,
//  7, 4,
//  2, 4, 6,
//  8, 5, 9, 3 ]

func levelIndex(i: Int) -> Int {
  return  i == 0 ? 0 : levelIndex(i-1) + i
}

struct TriangleIndex {
  let level: Int
  let index: Int

}

extension TriangleIndex {
  var value: Int? {
    let i = levelIndex(level)+index
    if i < triangle.startIndex || triangle.endIndex <= i { return nil }
    return triangle[i]
  }
  var leftChild: TriangleIndex {
    return TriangleIndex(level: level+1, index: index)
  }

  var rightChild: TriangleIndex {
    return TriangleIndex(level: level+1, index: index+1)
  }
}

let index = TriangleIndex(level: 4, index: 0)

func sum(xs: [Int]) -> Int {
  return xs.reduce(0, combine: +)
}

let root = TriangleIndex(level: 0, index: 0)

enum Direction { case Left, Right }

extension Direction { static let Values: [Direction] = [.Left,.Right] }

extension Direction: Printable {
  var description: String {
    switch self {
    case .Left: return "Left"
    case .Right: return "Right"
    }
  }
}

func permutations<T>(values: [T], xs: [T], length: Int) -> [[T]] {
  if length <= 0 { return [xs] }
  var result = [[T]]()
  for i in values {
    result += permutations(values, xs + [i], length-1)
  }
  return result
}

let directionPerms = { length in permutations(Direction.Values, [], length) }

func pathValues(xss: [[Direction]]) -> [[Int]] {
  var result = [[Int]]()
  for xs in xss {
    var index = root
    var path = [index.value!]
    for x in xs {
      switch x {
      case .Left: index = index.leftChild
      case .Right: index = index.rightChild
      }
      path.append(index.value!)
    }
    result.append(path)
  }
  return result
}

func sums(xss: [[Int]]) -> [Int] {
  var result = [Int]()
  for xs in xss {
    result.append(sum(xs))
  }
  return result
}


func max(xs: [Int]) -> Int {
  return xs.reduce(nil) { max, x in x > max ? x : max }!
}

public func solution() -> Int {
  return max(sums(pathValues(directionPerms(14))))
}

