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


func row(at index: Int, in triangle: [Int]) -> ArraySlice<Int> {

  func startIndex(of row: Int) -> Int {
    guard row > 0 else { return 0 }
    return startIndex(of: row-1) + row
  }

  let start = startIndex(of: index)
  let end = start + index
  return triangle[start...end]
}

row(at: 0, in: triangle) == [75]
row(at: 1, in: triangle) == [95, 64]
row(at: 2, in: triangle) == [17, 47, 82]
row(at: 3, in: triangle) == [18, 35, 87, 10]

func mergeSumWithGreaterChild(from row: ArraySlice<Int>, with children: [Int]) -> [Int] {

  func leftChild(of index: Int) -> Int {
    return children[index]
  }

  func rightChild(of index: Int) -> Int {
    return children[index + 1]
  }

  func sumWithGreaterChild(index: Int, value: Int) -> Int {
    return value + max(leftChild(of: index), rightChild(of: index))
  }

  return row.enumerated().map(sumWithGreaterChild)
}

mergeSumWithGreaterChild(from: [2, 4, 6], with: [8, 5, 9, 3]) == [10, 13, 15]

func maxSumOfPaths(in triangle: [Int], height: Int) -> Int {

  func maxSumOfPaths(index: Int, accum: [Int]) -> Int {
    guard index > 0 else { return accum[0] }
    let currentRow = row(at: index - 1, in: triangle)
    return maxSumOfPaths(index: index - 1, accum: mergeSumWithGreaterChild(from: currentRow, with: accum))
  }

  return maxSumOfPaths(index: height - 1, accum: Array(row(at: height - 1, in: triangle)))
}

let smallTriangle = [
  3,
  7, 4,
  2, 4, 6,
  8, 5, 9, 3
]

maxSumOfPaths(in: smallTriangle, height: 4) == 23

let solution = maxSumOfPaths(in: triangle, height: 15)
solution
