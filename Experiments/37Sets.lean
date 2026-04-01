-- 集合操作
def Set (α : Type) := α → Bool

def Set.empty : Set α := fun _ => false

def Set.singleton (x : α) [BEq α] : Set α := fun y => y == x

def Set.insert (x : α) [BEq α] (s : Set α) : Set α :=
  fun y => y == x || s y

def Set.delete (x : α) [BEq α] (s : Set α) : Set α :=
  fun y => y != x && s y

def Set.member (x : α) (s : Set α) : Bool := s x

def Set.union (s1 s2 : Set α) : Set α :=
  fun x => s1 x || s2 x

def Set.inter (s1 s2 : Set α) : Set α :=
  fun x => s1 x && s2 x

def Set.diff (s1 s2 : Set α) : Set α :=
  fun x => s1 x && !s2 x

def Set.complement (s : Set α) : Set α :=
  fun x => !s x

def Set.subset (s1 s2 : Set α) : Bool :=
  ∀ x, s1 x → s2 x

def Set.equal (s1 s2 : Set α) : Bool :=
  ∀ x, s1 x == s2 x

def Set.filter (p : α → Bool) (s : Set α) : Set α :=
  fun x => p x && s x

def Set.map [BEq α] [BEq β] (f : α → β) (s : Set α) : Set β :=
  fun y => ∃ x, f x == y && s x

#eval Set.member 3 (Set.insert 2 (Set.insert 3 Set.empty))
