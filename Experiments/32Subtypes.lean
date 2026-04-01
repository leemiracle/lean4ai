-- 子类型和强制转换
abbrev Positive := {n : Nat // n > 0}

def Positive.mk (n : Nat) (h : n > 0) : Positive := ⟨n, h⟩

def Positive.val (p : Positive) : Nat := p.1

def Positive.add (p1 p2 : Positive) : Positive :=
  ⟨p1.1 + p2.1, by omega⟩

def Positive.mul (p1 p2 : Positive) : Positive :=
  ⟨p1.1 * p2.1, by omega⟩

def Positive.one : Positive := ⟨1, by omega⟩

def Positive.succ (n : Nat) : Positive := ⟨n + 1, by omega⟩

abbrev NonEmptyString := {s : String // s ≠ ""}

def NonEmptyString.mk (s : String) (h : s ≠ "") : NonEmptyString := ⟨s, h⟩

def NonEmptyString.val (nes : NonEmptyString) : String := nes.1

def NonEmptyString.head (nes : NonEmptyString) : Char :=
  nes.1.get! 0

abbrev EvenNat := {n : Nat // n % 2 = 0}

def EvenNat.mk (n : Nat) (h : n % 2 = 0) : EvenNat := ⟨n, h⟩

def EvenNat.add (e1 e2 : EvenNat) : EvenNat :=
  ⟨e1.1 + e2.1, by omega⟩

def EvenNat.mul (e1 e2 : EvenNat) : EvenNat :=
  ⟨e1.1 * e2.1, by omega⟩

def EvenNat.zero : EvenNat := ⟨0, by omega⟩

def EvenNat.two : EvenNat := ⟨2, by omega⟩

#eval Positive.add ⟨5, by omega⟩ ⟨3, by omega⟩
#eval EvenNat.add ⟨4, by omega⟩ ⟨6, by omega⟩
