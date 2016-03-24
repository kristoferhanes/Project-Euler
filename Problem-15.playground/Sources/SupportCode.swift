

public struct Grid {
  let w: Int
  let h: Int

  public init(w: Int, h: Int) {
    self.w = w
    self.h = h
  }
}

extension Grid: Hashable {
  public var hashValue: Int {
    return 31 &* w.hashValue &+ h.hashValue
  }
}

public func == (l: Grid, r: Grid) -> Bool {
  return l.w == r.w && l.h == r.h
}

public func paths(grid: Grid) -> Int {
  struct Memo { static var paths = [Grid:Int]() }

  if let p = Memo.paths[grid] { return p }
  if grid.w == 0 || grid.h == 0 { return 1 }
  let result = paths(Grid(w: grid.w - 1, h: grid.h))
    + paths(Grid(w: grid.w, h: grid.h - 1))
  Memo.paths[grid] = result
  return result
}

