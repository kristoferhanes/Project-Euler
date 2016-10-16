
struct Grid {
  var width: Int
  var height: Int
}

extension Grid: Hashable {
  var hashValue: Int {
    return 31 &* width.hashValue &+ height.hashValue
  }
 
  static func == (left: Grid, right: Grid) -> Bool {
    return left.width == right.width && left.height == right.height
  }
}

extension Grid {

  var numberOfPaths: Int {
    
    func smallerGrids(from grid: Grid) -> (narrower: Grid, shorter: Grid) {
      let narrower = Grid(width: grid.width - 1, height: grid.height)
      let shorter  = Grid(width: grid.width, height: grid.height - 1)
      return (narrower, shorter)
    }
    
    func hasZeroSize(_ grid: Grid) -> Bool {
      return grid.width == 0 || grid.height == 0
    }
    
    var memo: [Grid:Int] = [:]
    
    func numberOfPaths(in grid: Grid) -> Int {
      if let np = memo[grid] { return np }
      
      if hasZeroSize(grid) { return 1 }
      let (narrower, shorter) = smallerGrids(from: grid)
      let result = numberOfPaths(in: narrower) + numberOfPaths(in: shorter)
      
      memo[grid] = result
      return result

    }
    
    return numberOfPaths(in: self)
  }
  
}


Grid(width: 2, height: 2).numberOfPaths == 6

Grid(width: 20, height: 20).numberOfPaths
