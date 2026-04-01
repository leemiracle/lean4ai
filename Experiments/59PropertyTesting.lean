-- 属性测试
def PropTest (α : Type) := α → Bool

def PropTest.forAll (p : α → Bool) : PropTest α := p

def PropTest.check (p : PropTest α) (x : α) : Bool := p x

def PropTest.and (p1 p2 : PropTest α) : PropTest α :=
  fun x => p1 x && p2 x

def PropTest.or (p1 p2 : PropTest α) : PropTest α :=
  fun x => p1 x || p2 x

def PropTest.not (p : PropTest α) : PropTest α :=
  fun x => !p x

def PropTest.implies (p1 p2 : PropTest α) : PropTest α :=
  fun x => !p1 x || p2 x

def quickCheck (p : PropTest Nat) (samples : Nat := 100) : Bool :=
  (List.range samples).all (fun i => p i)

def sampleProperties : PropTest Nat :=
  PropTest.forAll fun x => x + 0 = x

def commProperty : PropTest Nat :=
  PropTest.forAll fun x => fun y => x + y = y + x

def associativeProperty : PropTest Nat :=
  PropTest.forAll fun x => fun y => fun z => (x + y) + z = x + (y + z)

def evenOddProperty : PropTest Nat :=
  PropTest.forAll fun x => (x % 2 = 0) ≠ (x % 2 = 1)

#eval quickCheck sampleProperties
#eval quickCheck (PropTest.forAll fun x => x ≥ 0)
