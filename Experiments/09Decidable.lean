-- Decidable 类型类
def isZero (n : Nat) : Bool :=
  if h : n = 0 then true else false

def isPositive (n : Int) : Bool :=
  if h : n > 0 then true else false

def classifyNumber (n : Nat) : String :=
  if n = 0 then "zero"
  else if n % 2 = 0 then "even"
  else "odd"

def compareNumbers (x y : Nat) : Ordering :=
  if x < y then Ordering.lt
  else if x > y then Ordering.gt
  else Ordering.eq

def filterPos (xs : List Int) : List Int :=
  xs.filter (· > 0)

def partitionEvenOdd (xs : List Nat) : List Nat × List Nat :=
  xs.partition (· % 2 == 0)

def allPositive (xs : List Int) : Bool :=
  xs.all (· > 0)

def anyZero (xs : List Nat) : Bool :=
  xs.any (· == 0)

def findFirst (p : α → Bool) (xs : List α) : Option α :=
  xs.find? p

#eval isZero 0
#eval classifyNumber 5
#eval compareNumbers 3 5
#eval filterPos [-1, 2, -3, 4, 5]
#eval partitionEvenOdd [1, 2, 3, 4, 5, 6]
