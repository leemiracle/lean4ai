-- 基础类型和函数
def add (x y : Nat) : Nat := x + y

def subtract (x y : Nat) : Nat := x - y

def multiply (x y : Nat) : Nat := x * y

def divide (x y : Nat) : Nat := x / y

def modulo (x y : Nat) : Nat := x % y

def power (x y : Nat) : Nat := x ^ y

def factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorial n

def fibonacci : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => fibonacci n + fibonacci (n + 1)

def isEven (n : Nat) : Bool := n % 2 == 0

def isOdd (n : Nat) : Bool := n % 2 == 1

def abs (n : Int) : Nat := if n < 0 then (-n).toNat else n.toNat

def max (x y : Nat) : Nat := if x ≥ y then x else y

def min (x y : Nat) : Nat := if x ≤ y then x else y

#eval add 3 5
#eval factorial 5
#eval fibonacci 10
#eval isEven 4
#eval abs (-5)
