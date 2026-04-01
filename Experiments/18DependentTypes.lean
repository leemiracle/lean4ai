-- 依赖类型
def head!' (xs : List α) (h : xs ≠ []) : α :=
  match xs with
  | x :: _ => x

def tail!' (xs : List α) (h : xs ≠ []) : List α :=
  match xs with
  | _ :: xs => xs

def nth' (xs : List α) (n : Nat) (h : n < xs.length) : α :=
  xs.get ⟨n, h⟩

def safeDiv (x y : Nat) (h : y ≠ 0) : Nat :=
  x / y

def safeHead {α : Type} (xs : List α) : xs ≠ [] → α
  | _, x :: _, _ => x

inductive Vect (α : Type) : Nat → Type where
  | nil : Vect α 0
  | cons : α → Vect α n → Vect α (n + 1)

def Vect.head : Vect α (n + 1) → α
  | cons x _ => x

def Vect.tail : Vect α (n + 1) → Vect α n
  | cons _ xs => xs

def Vect.append : Vect α n → Vect α m → Vect α (n + m)
  | nil, ys => ys
  | cons x xs, ys => cons x (append xs ys)

def Vect.map (f : α → β) : Vect α n → Vect β n
  | nil => nil
  | cons x xs => cons (f x) (map f xs)

def Vect.zip : Vect α n → Vect β n → Vect (α × β) n
  | nil, nil => nil
  | cons x xs, cons y ys => cons (x, y) (zip xs ys)

#eval Vect.head (Vect.cons 1 (Vect.cons 2 Vect.nil))
