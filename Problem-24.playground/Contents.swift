
import UIKit

let p = permutions([0,1,2])
  .map { xs in xs.map { x in Character("\(x)") } }
  .map { xs in String(xs) }
  .sort(<)

perms[999999]





