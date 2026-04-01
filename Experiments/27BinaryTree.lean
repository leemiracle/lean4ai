-- 二叉树
inductive BinaryTree (α : Type) where
  | leaf : BinaryTree α
  | node : α → BinaryTree α → BinaryTree α → BinaryTree α
  deriving Repr

def BinaryTree.size : BinaryTree α → Nat
  | .leaf => 0
  | .node _ left right => 1 + size left + size right

def BinaryTree.height : BinaryTree α → Nat
  | .leaf => 0
  | .node _ left right => 1 + max (height left) (height right)

def BinaryTree.toList : BinaryTree α → List α
  | .leaf => []
  | .node x left right => toList left ++ [x] ++ toList right

def BinaryTree.toListPreOrder : BinaryTree α → List α
  | .leaf => []
  | .node x left right => [x] ++ toListPreOrder left ++ toListPreOrder right

def BinaryTree.toListPostOrder : BinaryTree α → List α
  | .leaf => []
  | .node x left right => toListPostOrder left ++ toListPostOrder right ++ [x]

def BinaryTree.map (f : α → β) : BinaryTree α → BinaryTree β
  | .leaf => .leaf
  | .node x left right => .node (f x) (map f left) (map f right)

def BinaryTree.fold (f : α → β → β → β) (acc : β) : BinaryTree α → β
  | .leaf => acc
  | .node x left right => f x (fold f acc left) (fold f acc right)

def BinaryTree.sum [Add α] [OfNat α 0] : BinaryTree α → α
  | .leaf => 0
  | .node x left right => x + sum left + sum right

def BinaryTree.max? [LT α] : BinaryTree α → Option α
  | .leaf => none
  | .node x .leaf .leaf => some x
  | .node x left .leaf =>
    match max? left with
    | some m => some (if m < x then x else m)
    | none => some x
  | .node x .leaf right =>
    match max? right with
    | some m => some (if m < x then x else m)
    | none => some x
  | .node x left right =>
    let ml := max? left
    let mr := max? right
    match ml, mr with
    | some l, some r => some (if l < r then (if r < x then x else r) else (if l < x then x else l))
    | some l, none => some (if l < x then x else l)
    | none, some r => some (if r < x then x else r)
    | none, none => some x

#eval BinaryTree.toList (.node 5 (.node 3 (.node 1 .leaf .leaf) (.node 4 .leaf .leaf)) (.node 7 .leaf .leaf) : BinaryTree Nat)
