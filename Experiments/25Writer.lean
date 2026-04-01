-- Writer 单子
def Writer (ω α : Type) := (α × ω)

def Writer.pure (x : α) [EmptyCollection ω] : Writer ω α := (x, ∅)

def Writer.bind [Append ω] (ma : Writer ω α) (f : α → Writer ω β) : Writer ω β :=
  let (a, w1) := ma
  let (b, w2) := f a
  (b, w1 ++ w2)

def Writer.tell (w : ω) : Writer ω Unit := ((), w)

def Writer.listen (ma : Writer ω α) : Writer ω (α × ω) :=
  let (a, w) := ma
  ((a, w), w)

def Writer.pass (ma : Writer ω (α, ω → ω)) : Writer ω α :=
  let ((a, f), w) := ma
  (a, f w)

def Writer.run (ma : Writer ω α) : (α × ω) := ma

def Writer.eval (ma : Writer ω α) : α := ma.1

def Writer.exec (ma : Writer ω α) : ω := ma.2

def loggingExample : Writer (List String) Nat := do
  let x := pure 5
  Writer.tell ["Starting computation"]
  let y := pure 10
  Writer.tell [s!"Computed {y}"]
  pure (x + y)

#eval Writer.run loggingExample
