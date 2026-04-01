-- 余递归和余代数
structure Coalgebra (F : Type → Type) (α : Type) where
  coalgebra : α → F α

structure Corec (F : Type → Type) (α : Type) where
  uncorec : Nat → α

def Corec.take (n : Nat) (c : Corec F α) : List α :=
  (List.range n).map c.uncorec

codata Stream' (α : Type) where
  | head : α
  | tail : Stream' α

def Stream'.corec (f : α → α) (x : α) : Stream' α where
  head := f x
  tail := Stream'.corec f (f x)

def Stream'.toList (n : Nat) (s : Stream' α) : List α :=
  match n with
  | 0 => []
  | n + 1 => s.head :: toList n s.tail

def Stream'.iterate (f : α → α) (x : α) : Stream' α where
  head := x
  tail := Stream'.iterate f (f x)

def Stream'.const (x : α) : Stream' α where
  head := x
  tail := Stream'.const x

#eval Stream'.toList 5 (Stream'.const 42)
