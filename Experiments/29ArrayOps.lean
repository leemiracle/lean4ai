-- 数组切片和操作
def arraySlice (arr : Array α) (start stop : Nat) : Array α :=
  (arr.toList.drop start |>.take (stop - start)).toArray

def arrayTake (n : Nat) (arr : Array α) : Array α :=
  (arr.toList.take n).toArray

def arrayDrop (n : Nat) (arr : Array α) : Array α :=
  (arr.toList.drop n).toArray

def arrayChunk (size : Nat) (arr : Array α) : Array (Array α) :=
  let rec aux (acc : Array (Array α)) (remaining : List α) : Array (Array α) :=
    match remaining with
    | [] => acc
    | xs =>
      let (chunk, rest) := xs.splitAt size
      aux (acc.push chunk.toArray) rest
  aux #[] arr.toList

def arrayWindow (size : Nat) (arr : Array α) : Array (Array α) :=
  if size = 0 ∨ size > arr.size then #[]
  else (List.range (arr.size - size + 1)).map (fun i => arraySlice arr i (i + size)) |>.toArray

def arrayRotateLeft (n : Nat) (arr : Array α) : Array α :=
  let n := n % arr.size
  arraySlice arr n arr.size ++ arrayTake n arr

def arrayRotateRight (n : Nat) (arr : Array α) : Array α :=
  let n := n % arr.size
  arraySlice arr (arr.size - n) arr.size ++ arrayTake (arr.size - n) arr

def arrayUnique [BEq α] (arr : Array α) : Array α :=
  arr.foldl (fun acc x => if acc.contains x then acc else acc.push x) #[]

def arrayIntersect [BEq α] (arr1 arr2 : Array α) : Array α :=
  arr1.filter (arr2.contains ·)

def arrayDifference [BEq α] (arr1 arr2 : Array α) : Array α :=
  arr1.filter (!arr2.contains ·)

#eval arraySlice #[1, 2, 3, 4, 5, 6] 1 4
#eval arrayChunk 2 #[1, 2, 3, 4, 5, 6]
#eval arrayRotateLeft 2 #[1, 2, 3, 4, 5]
