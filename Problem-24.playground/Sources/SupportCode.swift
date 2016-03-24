

public func permutions<T>(xs: [T]) -> [[T]] {
  var xs = xs
  if xs.count <= 1 { return [xs] }
  var result = [[T]]()
  for (i, e) in xs.enumerate() {
    let end = xs.endIndex-1
    swap(&xs[i], &xs[end])
    let rest = [T](xs.dropLast())
    for perm in permutions(rest) {
      result.append([e] + perm)
    }
    swap(&xs[i], &xs[end])
  }
  return result
}

public let perms = permutions([0,1,2,3,4,5,6,7,8,9])
  .map { xs in xs.map { x in Character("\(x)") } }
  .map { xs in String(xs) }
  .sort(<)
