-- 性能测试
def benchmark (name : String) (iterations : Nat) (action : IO α) : IO (α × Nat) := do
  let start ← IO.monoMsNow
  let mut result := none
  for _ in List.range iterations do
    result := some (← action)
  let end_ ← IO.monoMsNow
  pure (result.get!, end_ - start)

def measureTime (action : IO α) : IO (α × Nat) := do
  let start ← IO.monoMsNow
  let result ← action
  let end_ ← IO.monoMsNow
  pure (result, end_ - start)

def time (name : String) (action : IO α) : IO α := do
  let (result, elapsed) ← measureTime action
  IO.println s!"{name}: {elapsed}ms"
  pure result

def benchmarkListSum : IO Nat := do
  let xs := (List.range 1000000)
  let sum := xs.foldl (· + ·) 0
  pure sum

def benchmarkArraySum : IO Nat := do
  let arr := (List.range 1000000).toArray
  let sum := arr.foldl (· + ·) 0
  pure sum

def benchmarkStringConcat : IO String := do
  let parts := (List.range 1000).map toString
  pure (String.intercalate ", " parts)

def benchmarkQuickSort : IO (List Nat) := do
  let xs := [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
  pure (quickSort xs)
where
  quickSort [Ord α] : List α → List α
  | [] => []
  | pivot :: xs =>
    let less := xs.filter (Ord.compare · pivot |>.isLT)
    let greater := xs.filter (!Ord.compare · pivot |>.isLT)
    quickSort less ++ [pivot] ++ quickSort greater

#eval measureTime (pure 42)
