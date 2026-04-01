-- 归纳类型
inductive Color where
  | red : Color
  | green : Color
  | blue : Color
  deriving Repr

inductive Weekday where
  | monday : Weekday
  | tuesday : Weekday
  | wednesday : Weekday
  | thursday : Weekday
  | friday : Weekday
  | saturday : Weekday
  | sunday : Weekday
  deriving Repr

inductive NatTree where
  | leaf : NatTree
  | node : Nat → NatTree → NatTree → NatTree
  deriving Repr

inductive List' (α : Type) where
  | nil : List' α
  | cons : α → List' α → List' α
  deriving Repr

inductive Option' (α : Type) where
  | none : Option' α
  | some : α → Option' α
  deriving Repr

inductive Result (α : Type) (ε : Type) where
  | ok : α → Result α ε
  | error : ε → Result α ε
  deriving Repr

def nextDay : Weekday → Weekday
  | .monday => .tuesday
  | .tuesday => .wednesday
  | .wednesday => .thursday
  | .thursday => .friday
  | .friday => .saturday
  | .saturday => .sunday
  | .sunday => .monday

def isWeekend : Weekday → Bool
  | .saturday | .sunday => true
  | _ => false

#eval Color.red
#eval nextDay Weekday.friday
#eval isWeekend Weekday.saturday
