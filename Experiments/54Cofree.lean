-- Cofree Comonad
structure Cofree (F : Type → Type) (α : Type) where
  head : α
  tail : F (Cofree F α)

def Cofree.map (f : α → β) (ca : Cofree F α) : Cofree F β :=
  ⟨f ca.head, ca.tail⟩

def Cofree.extract (ca : Cofree F α) : α := ca.head

def Cofree.duplicate (ca : Cofree F α) : Cofree F (Cofree F α) :=
  ⟨ca, ca.tail⟩

def Cofree.extend (f : Cofree F α → β) (ca : Cofree F α) : Cofree F β :=
  ⟨f ca, ca.tail⟩

def Cofree.ana (f : α → F α) (x : α) : Cofree F α :=
  ⟨x, f x⟩

structure CofreeState (σ α : Type) where
  state : σ
  value : α

def CofreeState.extract (ca : CofreeState σ α) : α := ca.value

def CofreeState.extend (f : CofreeState σ α → β) (ca : CofreeState σ α) : CofreeState σ β :=
  ⟨ca.state, f ca⟩

#eval CofreeState.extract ⟨42, "value"⟩
