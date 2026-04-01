-- 类型类派生
inductive MyOption (α : Type) where
  | none : MyOption α
  | some : α → MyOption α
  deriving Repr, BEq

inductive MyEither (ε α : Type) where
  | left : ε → MyEither ε α
  | right : α → MyEither ε α
  deriving Repr, BEq

inductive MyPair (α β : Type) where
  | mk : α → β → MyPair α β
  deriving Repr, BEq

instance [Repr α] [Repr β] : Repr (α × β) where
  reprPrec p _ := s!"({repr p.1}, {repr p.2})"

instance [BEq α] [BEq β] : BEq (α × β) where
  beq p1 p2 := p1.1 == p1.1 && p2.1 == p2.2

instance [Hashable α] [Hashable β] : Hashable (α × β) where
  hash p := mixHash (hash p.1) (hash p.2)

instance [ToString α] : ToString (MyOption α) where
  toString
    | .none => "None"
    | .some x => s!"Some({x})"

instance [ToString α] [ToString β] : ToString (MyEither α β) where
  toString
    | .left e => s!"Left({e})"
    | .right a => s!"Right({a})"

def testBEq : Bool := MyOption.some 42 == MyOption.some 42
def testToString : String := toString (MyOption.some 42)

#eval testBEq
#eval testToString
