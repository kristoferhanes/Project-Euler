
struct Grid {
  let w: Int
  let h: Int
}

extension Grid: Hashable {
  var hashValue: Int {
    return 31 &* w.hashValue &+ h.hashValue
  }
}

func == (l: Grid, r: Grid) -> Bool {
  return l.w == r.w && l.h == r.h
}

extension Grid {

  var numberOfPaths: Int {
    struct Memo { static var numberOfPaths: [Grid:Int] = [:] }
    if let np = Memo.numberOfPaths[self] { return np }

    if w == 0 || h == 0 { return 1 }
    let result = Grid(w: w - 1, h: h).numberOfPaths + Grid(w: w, h: h - 1).numberOfPaths

    Memo.numberOfPaths[self] = result
    return result
  }
  
}


Grid(w: 2, h: 2).numberOfPaths == 6

Grid(w: 20, h: 20).numberOfPaths
