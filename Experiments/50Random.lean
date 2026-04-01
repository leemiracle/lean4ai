-- 随机数生成（伪随机）
def lcg (seed : Nat) : Nat × Nat :=
  let a := 1103515245
  let c := 12345
  let m := 2^31
  let newSeed := (a * seed + c) % m
  (newSeed, newSeed)

def randomNat (seed : Nat) (max : Nat) : Nat × Nat :=
  let (newSeed, value) := lcg seed
  (newSeed, value % max)

def randomFloat (seed : Nat) : Nat × Float :=
  let (newSeed, value) := lcg seed
  (newSeed, value.toFloat / (2^31).toFloat)

def randomBool (seed : Nat) : Nat × Bool :=
  let (newSeed, value) := lcg seed
  (newSeed, value % 2 == 0)

def randomList (seed : Nat) (len : Nat) (max : Nat) : Nat × List Nat :=
  let rec aux (seed : Nat) (acc : List Nat) (remaining : Nat) : Nat × List Nat :=
    if remaining = 0 then (seed, acc)
    else
      let (newSeed, value) := randomNat seed max
      aux newSeed (value :: acc) (remaining - 1)
  aux seed [] len

def randomShuffle (seed : Nat) (xs : List α) : Nat × List α :=
  let arr := xs.toArray
  let rec aux (seed : Nat) (arr : Array α) (i : Nat) : Nat × Array α :=
    if i = 0 then (seed, arr)
    else
      let (newSeed, j) := randomNat seed i
      let arr := if j < arr.size && i - 1 < arr.size then
        let tmp := arr.get! j
        let arr := arr.set! j (arr.get! (i - 1))
        arr.set! (i - 1) tmp
      else arr
      aux newSeed arr (i - 1)
  let (newSeed, result) := aux seed arr xs.length
  (newSeed, result.toList)

def randomChoice (seed : Nat) (xs : List α) : Nat × Option α :=
  if xs.isEmpty then (seed, none)
  else
    let (newSeed, idx) := randomNat seed xs.length
    (newSeed, xs.get? idx)

#eval randomNat 42 100
#eval randomList 123 10 100
