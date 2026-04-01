-- 状态和状态单子
def State (σ α : Type) := σ → (α × σ)

def State.pure (x : α) : State σ α := fun s => (x, s)

def State.bind (ma : State σ α) (f : α → State σ β) : State σ β :=
  fun s =>
    let (a, s') := ma s
    f a s'

def State.get : State σ σ := fun s => (s, s)

def State.set (s : σ) : State σ Unit := fun _ => ((), s)

def State.modify (f : σ → σ) : State σ Unit := fun s => ((), f s)

def State.run (ma : State σ α) (s : σ) : (α × σ) := ma s

def State.eval (ma : State σ α) (s : σ) : α := (ma s).1

def State.exec (ma : State σ α) (s : σ) : σ := (ma s).2

def counterExample : State Nat String := do
  let s ← State.get
  State.set (s + 1)
  let s' ← State.get
  pure s!"Count is {s'}"

def stackOps : State (List Nat) Nat := do
  State.modify (10 :: ·)
  State.modify (20 :: ·)
  State.modify (30 :: ·)
  let s ← State.get
  pure s.head!.get!

#eval State.run counterExample 0
#eval State.eval counterExample 5
#eval State.run stackOps []
