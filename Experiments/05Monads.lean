-- Monad 和 Do 记法
def compose (f : β → γ) (g : α → β) (x : α) : γ := f (g x)

def double (x : Nat) : Nat := x * 2

def square (x : Nat) : Nat := x * x

def addOne (x : Nat) : Nat := x + 1

def computeWithDo : Option Nat := do
  let x ← some 5
  let y ← some (double x)
  let z ← some (square y)
  pure (addOne z)

def computeWithList : List Nat := do
  let x ← [1, 2, 3]
  let y ← [4, 5]
  pure (x + y)

def computeWithArray : Array Nat := do
  let x ← #[1, 2, 3]
  let y ← #[10, 20]
  pure (x + y)

def safeDivide (x y : Nat) : Option Nat :=
  if y == 0 then none else some (x / y)

def chainedDivide : Option Nat := do
  let a ← safeDivide 100 5
  let b ← safeDivide a 2
  let c ← safeDivide b 5
  pure c

#eval computeWithDo
#eval computeWithList
#eval computeWithArray
#eval chainedDivide
