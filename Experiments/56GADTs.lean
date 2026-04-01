-- 代数数据类型构造器
inductive Vec (α : Type) : Nat → Type where
  | nil : Vec α 0
  | cons : α → Vec α n → Vec α (n + 1)

def Vec.head : Vec α (n + 1) → α
  | cons x _ => x

def Vec.tail : Vec α (n + 1) → Vec α n
  | cons _ xs => xs

def Vec.get : Vec α n → Fin n → α
  | cons x _, ⟨0, _⟩ => x
  | cons _ xs, ⟨i + 1, h⟩ => get xs ⟨i, Nat.lt_of_succ_lt h⟩

def Vec.append : Vec α n → Vec α m → Vec α (n + m)
  | nil, ys => ys
  | cons x xs, ys => cons x (append xs ys)

def Vec.reverse : Vec α n → Vec α n
  | nil => nil
  | cons x xs => append (reverse xs) (cons x nil)

def Vec.map (f : α → β) : Vec α n → Vec β n
  | nil => nil
  | cons x xs => cons (f x) (map f xs)

def Vec.zip : Vec α n → Vec β n → Vec (α × β) n
  | nil, nil => nil
  | cons x xs, cons y ys => cons (x, y) (zip xs ys)

def Vec.foldl (f : β → α → β) (init : β) : Vec α n → β
  | nil => init
  | cons x xs => foldl f (f init x) xs

#eval Vec.head (Vec.cons 1 (Vec.cons 2 Vec.nil))
