-- 搜索算法
def linearSearch [BEq α] (x : α) (xs : List α) : Option Nat :=
  let rec aux (xs : List α) (idx : Nat) : Option Nat :=
    match xs with
    | [] => none
    | y :: ys =>
      if y == x then some idx
      else aux ys (idx + 1)
  aux xs 0

def binarySearch [Ord α] (x : α) (xs : List α) : Option Nat :=
  let rec aux (lo hi : Nat) : Option Nat :=
    if lo < hi then
      let mid := (lo + hi) / 2
      match Ord.compare x (xs.getD mid default!) with
      | .lt => aux lo mid
      | .gt => aux (mid + 1) hi
      | .eq => some mid
    else none
  aux 0 xs.length

def depthFirstSearch {α : Type} [BEq α] (start : α) (neighbors : α → List α) (target : α) : Bool :=
  let rec visit (visited : List α) (stack : List α) : Bool :=
    match stack with
    | [] => false
    | x :: xs =>
      if x == target then true
      else if visited.contains x then visit visited xs
      else
        let newNeighbors := neighbors x |>.filter (!visited.contains ·)
        visit (x :: visited) (newNeighbors ++ xs)
  visit [] [start]

def breadthFirstSearch {α : Type} [BEq α] (start : α) (neighbors : α → List α) (target : α) : Bool :=
  let rec visit (visited : List α) (queue : List α) : Bool :=
    match queue with
    | [] => false
    | x :: xs =>
      if x == target then true
      else if visited.contains x then visit visited xs
      else
        let newNeighbors := neighbors x |>.filter (!visited.contains ·)
        visit (x :: visited) (xs ++ newNeighbors)
  visit [] [start]

#eval linearSearch 3 [1, 2, 3, 4, 5]
#eval binarySearch 3 [1, 2, 3, 4, 5, 6, 7]
