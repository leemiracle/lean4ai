-- 仿射类型
inductive Linear (α : Type) where
  | mk : α → Linear α

def Linear.use (x : Linear α) (f : α → β) : β :=
  match x with
  | .mk a => f a

def Linear.map (x : Linear α) (f : α → β) : Linear β :=
  match x with
  | .mk a => .mk (f a)

def Linear.bind (x : Linear α) (f : α → Linear β) : Linear β :=
  match x with
  | .mk a => f a

def Linear.dup (x : Linear α) : Linear (α × α) :=
  match x with
  | .mk a => .mk (a, a)

def Linear.drop (x : Linear α) : Unit :=
  match x with
  | .mk _ => ()

def Linear.consume (x : Linear α) : α :=
  match x with
  | .mk a => a

structure LinearState (σ α : Type) where
  run : σ → (α × σ)

def LinearState.pure (x : α) : LinearState σ α :=
  ⟨fun s => (x, s)⟩

def LinearState.bind (ma : LinearState σ α) (f : α → LinearState σ β) : LinearState σ β :=
  ⟨fun s =>
    let (a, s') := ma.run s
    (f a).run s'⟩

#eval Linear.use (.mk 42) (· * 2)
