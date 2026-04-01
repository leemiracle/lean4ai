-- 类型级编程
inductive BoolTy where
  | trueTy : BoolTy
  | falseTy : BoolTy

def BoolTy.toBool : BoolTy → Bool
  | .trueTy => true
  | .falseTy => false

inductive NatTy where
  | zero : NatTy
  | succ : NatTy → NatTy

def NatTy.toNat : NatTy → Nat
  | .zero => 0
  | .succ n => 1 + toNat n

inductive ListTy (α : Type) where
  | nil : ListTy α
  | cons : α → ListTy α → ListTy α

def ListTy.toList : ListTy α → List α
  | .nil => []
  | .cons x xs => x :: toList xs

inductive HList : List Type → Type where
  | nil : HList []
  | cons : α → HList αs → HList (α :: αs)

def HList.toList : HList αs → List String
  | .nil => []
  | .cons x xs => toString x :: toList xs

inductive Sum (α β : Type) where
  | inl : α → Sum α β
  | inr : β → Sum α β

def Sum.mapLeft (f : α → γ) : Sum α β → Sum γ β
  | .inl x => .inl (f x)
  | .inr y => .inr y

def Sum.mapRight (f : β → γ) : Sum α β → Sum α γ
  | .inl x => .inl x
  | .inr y => .inr (f y)

#eval BoolTy.toBool .trueTy
#eval NatTy.toNat (.succ (.succ (.succ .zero)))
#eval ListTy.toList (.cons 1 (.cons 2 (.cons 3 .nil)))
