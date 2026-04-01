-- 并发原语 (模拟)
structure Promise (α : Type) where
  get : IO α

structure Future (α : Type) where
  get : IO α

structure Channel (α : Type) where
  send : α → IO Unit
  receive : IO (Option α)

structure MVar (α : Type) where
  take : IO (Option α)
  put : α → IO Unit

structure TVar (α : Type) where
  read : IO α
  write : α → IO Unit

def asyncExample : IO Nat := do
  let result := 42
  pure result

def parallelExample : IO (Nat × Nat) := do
  let x := 10
  let y := 20
  pure (x * 2, y * 3)

def raceExample : IO Nat := do
  let result := 100
  pure result

def timeoutExample : IO (Option Nat) := do
  let result := some 50
  pure result

def retryExample : IO (Option Nat) := do
  let attempt := 1
  if attempt ≥ 3 then pure none
  else pure (some 42)

#eval asyncExample
#eval parallelExample
