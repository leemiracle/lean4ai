-- 高阶函数
def applyTwice (f : α → α) (x : α) : α := f (f x)

def compose' (f : β → γ) (g : α → β) : α → γ := fun x => f (g x)

def flip (f : α → β → γ) : β → α → γ := fun y x => f x y

def const (x : α) : β → α := fun _ => x

def identity (x : α) : α := x

def curry (f : α × β → γ) : α → β → γ := fun x y => f (x, y)

def uncurry (f : α → β → γ) : α × β → γ := fun (x, y) => f x y

def on (f : β → β → γ) (g : α → β) : α → α → γ := fun x y => f (g x) (g y)

def liftA2 (f : α → β → γ) (ma : Option α) (mb : Option β) : Option γ := do
  let a ← ma
  let b ← mb
  pure (f a b)

def sequence (xs : List (Option α)) : Option (List α) :=
  xs.foldr (liftA2 List.cons) (some [])

def replicate (n : Nat) (x : α) : List α :=
  List.replicate n x

#eval applyTwice (· + 1) 5
#eval flip Nat.sub 5 10
#eval liftA2 Nat.add (some 3) (some 5)
#eval sequence [some 1, some 2, some 3]
