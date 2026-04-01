-- 变换器
structure StateT (σ : Type) (m : Type → Type) (α : Type) where
  run : σ → m (α × σ)

def StateT.pure [Monad m] (x : α) : StateT σ m α :=
  ⟨fun s => pure (x, s)⟩

def StateT.bind [Monad m] (ma : StateT σ m α) (f : α → StateT σ m β) : StateT σ m β :=
  ⟨fun s => do
    let (a, s') ← ma.run s
    (f a).run s'⟩

def StateT.get [Monad m] : StateT σ m σ :=
  ⟨fun s => pure (s, s)⟩

def StateT.set [Monad m] (s : σ) : StateT σ m Unit :=
  ⟨fun _ => pure ((), s)⟩

def StateT.modify [Monad m] (f : σ → σ) : StateT σ m Unit :=
  ⟨fun s => pure ((), f s)⟩

structure ReaderT (ρ : Type) (m : Type → Type) (α : Type) where
  run : ρ → m α

def ReaderT.pure [Monad m] (x : α) : ReaderT ρ m α :=
  ⟨fun _ => pure x⟩

def ReaderT.bind [Monad m] (ma : ReaderT ρ m α) (f : α → ReaderT ρ m β) : ReaderT ρ m β :=
  ⟨fun r => do
    let a ← ma.run r
    (f a).run r⟩

def ReaderT.ask [Monad m] : ReaderT ρ m ρ :=
  ⟨fun r => pure r⟩

def ReaderT.local [Monad m] (f : ρ → ρ) (ma : ReaderT ρ m α) : ReaderT ρ m α :=
  ⟨fun r => ma.run (f r)⟩

#eval StateT.run (StateT.get >>= fun s => StateT.set (s + 1)) 0
