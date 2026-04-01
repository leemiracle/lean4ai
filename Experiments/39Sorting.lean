-- 排序算法
def bubbleSort [Ord α] (xs : List α) : List α :=
  let rec pass (xs : List α) : List α :=
    match xs with
    | [] => []
    | [x] => [x]
    | x :: y :: xs =>
      if Ord.compare x y == .lt then x :: pass (y :: xs)
      else y :: pass (x :: xs)
  let rec go (xs : List α) (n : Nat) : List α :=
    if n = 0 then xs
    else go (pass xs) (n - 1)
  go xs xs.length

def insertionSort [Ord α] (xs : List α) : List α :=
  let rec insert (x : α) (ys : List α) : List α :=
    match ys with
    | [] => [x]
    | y :: ys =>
      if Ord.compare x y == .lt then x :: y :: ys
      else y :: insert x ys
  xs.foldl (fun acc x => insert x acc) []

def mergeSort [Ord α] (xs : List α) : List α :=
  let rec merge (xs ys : List α) : List α :=
    match xs, ys with
    | [], ys => ys
    | xs, [] => xs
    | x :: xs', y :: ys' =>
      if Ord.compare x y == .lt then x :: merge xs' (y :: ys')
      else y :: merge (x :: xs') ys'
  match xs with
  | [] => []
  | [x] => [x]
  | xs =>
    let mid := xs.length / 2
    let (left, right) := xs.splitAt mid
    merge (mergeSort left) (mergeSort right)

def quickSort [Ord α] (xs : List α) : List α :=
  match xs with
  | [] => []
  | pivot :: xs =>
    let less := xs.filter (Ord.compare · pivot |>.isLT)
    let greater := xs.filter (!Ord.compare · pivot |>.isLT)
    quickSort less ++ [pivot] ++ quickSort greater

#eval bubbleSort [5, 3, 8, 1, 9, 2]
#eval insertionSort [5, 3, 8, 1, 9, 2]
#eval mergeSort [5, 3, 8, 1, 9, 2]
#eval quickSort [5, 3, 8, 1, 9, 2]
