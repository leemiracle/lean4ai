-- Lazy 和 thunk
def lazyValue : Lazy Nat := lazy (10 + 20)

def lazyList : Lazy (List Nat) := lazy [1, 2, 3, 4, 5]

def lazyString : Lazy String := lazy "Hello, Lazy!"

def lazyComputation : Lazy Nat := lazy (factorial 10)
where
  factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorial n

def lazyMap (f : α → β) (x : Lazy α) : Lazy β :=
  lazy (f x.get)

def lazyBind (x : Lazy α) (f : α → Lazy β) : Lazy β :=
  lazy (f x.get |>.get)

def lazySequence (xs : List (Lazy α)) : Lazy (List α) :=
  lazy (xs.map (·.get))

def lazyFilter (p : α → Bool) (x : Lazy α) : Lazy (Option α) :=
  lazy (if p x.get then some x.get else none)

#eval lazyValue.get
#eval lazyList.get
#eval lazyString.get
#eval lazyComputation.get
