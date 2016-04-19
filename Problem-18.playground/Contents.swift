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


func row(atIndex index: Int, fromTriangle triangle: [Int]) -> ArraySlice<Int> {

  func startIndex(ofRow row: Int) -> Int {
    guard row > 0 else { return 0 }
    return startIndex(ofRow: row-1) + row
  }

  let start = startIndex(ofRow: index)
  let end = start + index
  return triangle[start...end]
}

row(atIndex: 0, fromTriangle: triangle) == [75]
row(atIndex: 1, fromTriangle: triangle) == [95, 64]
row(atIndex: 2, fromTriangle: triangle) == [17, 47, 82]
row(atIndex: 3, fromTriangle: triangle) == [18, 35, 87, 10]


func mergeSumWithGreaterChild(row: ArraySlice<Int>, children: [Int]) -> [Int] {

  func leftChild(ofIndex index: Int) -> Int {
    return children[index]
  }

  func rightChild(ofIndex index: Int) -> Int {
    return children[index + 1]
  }

  func sumWithGreaterChild(index index: Int, value: Int) -> Int {
    return value + max(leftChild(ofIndex: index), rightChild(ofIndex: index))
  }

  return row.enumerate().map { sumWithGreaterChild(index: $0, value: $1) }
}

mergeSumWithGreaterChild([2, 4, 6], children: [8, 5, 9, 3]) == [10, 13, 15]

func maxSumOfPaths(inTriangle triangle: [Int], withHeight height: Int) -> Int {

  func maxSumOfPaths(rowIndex: Int, accum: [Int]) -> Int {
    guard rowIndex > 0 else { return accum[0] }
    let currentRow = row(atIndex: rowIndex - 1, fromTriangle: triangle)
    return maxSumOfPaths(rowIndex - 1, accum: mergeSumWithGreaterChild(currentRow, children: accum))
  }

  return maxSumOfPaths(height - 1, accum: [Int](row(atIndex: height - 1, fromTriangle: triangle)))
}

let smallTriangle = [
  3,
  7, 4,
  2, 4, 6,
  8, 5, 9, 3
]

maxSumOfPaths(inTriangle: smallTriangle, withHeight: 4) == 23

let solution = maxSumOfPaths(inTriangle: triangle, withHeight: 15)
solution
