-- 模式匹配
def describeList : List α → String
  | [] => "empty"
  | [x] => "singleton"
  | [x, y] => "pair"
  | _ => "many"

def head? : List α → Option α
  | [] => none
  | x :: _ => some x

def tail? : List α → Option (List α)
  | [] => none
  | _ :: xs => some xs

def take : Nat → List α → List α
  | 0, _ => []
  | _, [] => []
  | n + 1, x :: xs => x :: take n xs

def drop : Nat → List α → List α
  | 0, xs => xs
  | _, [] => []
  | n + 1, _ :: xs => drop n xs

def splitAt : Nat → List α → List α × List α
  | 0, xs => ([], xs)
  | _, [] => ([], [])
  | n + 1, x :: xs =>
    let (ys, zs) := splitAt n xs
    (x :: ys, zs)

def zip : List α → List β → List (α × β)
  | [], _ => []
  | _, [] => []
  | x :: xs, y :: ys => (x, y) :: zip xs ys

def unzip : List (α × β) → List α × List β
  | [] => ([], [])
  | (x, y) :: xys =>
    let (xs, ys) := unzip xys
    (x :: xs, y :: ys)

#eval describeList [1]
#eval head? [1, 2, 3]
#eval take 2 [1, 2, 3, 4, 5]
#eval zip [1, 2, 3] ['a', 'b', 'c']
