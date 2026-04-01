-- 整数和有理数
def intAbs (x : Int) : Nat := x.natAbs

def intSign (x : Int) : Int :=
  if x > 0 then 1
  else if x < 0 then -1
  else 0

def intDivMod (x y : Int) : Int × Int :=
  if y = 0 then (0, 0)
  else (x / y, x % y)

def intGcd (x y : Int) : Nat :=
  match x.natAbs, y.natAbs with
  | 0, y => y
  | x, 0 => x
  | x, y =>
    if x ≥ y then intGcd (x - y) y
    else intGcd x (y - x)

structure Rat where
  num : Int
  den : Nat
  denPos : den > 0
  deriving Repr

def Rat.add (r1 r2 : Rat) : Rat :=
  let newNum := r1.num * r2.den + r2.num * r1.den
  let newDen := r1.den * r2.den
  let g := intGcd newNum newDen
  ⟨newNum / g, newDen / g, by omega⟩

def Rat.mul (r1 r2 : Rat) : Rat :=
  let newNum := r1.num * r2.num
  let newDen := r1.den * r2.den
  let g := intGcd newNum newDen
  ⟨newNum / g, newDen / g, by omega⟩

def Rat.neg (r : Rat) : Rat := ⟨-r.num, r.den, r.denPos⟩

def Rat.inv (r : Rat) : Rat :=
  if r.num = 0 then ⟨0, 1, by omega⟩
  else if r.num > 0 then ⟨r.den, r.num.natAbs, by omega⟩
  else ⟨-r.den, r.num.natAbs, by omega⟩

def Rat.toString (r : Rat) : String :=
  s!"{r.num}/{r.den}"

#eval intAbs (-42)
#eval intSign (-10)
#eval Rat.toString ⟨3, 4, by omega⟩
