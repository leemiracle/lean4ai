-- 数值计算
def gcd : Nat → Nat → Nat
  | 0, y => y
  | x, 0 => x
  | x, y =>
    if x ≥ y then gcd (x - y) y
    else gcd x (y - x)

def gcd' : Nat → Nat → Nat
  | 0, y => y
  | x, 0 => x
  | x, y => gcd' y (x % y)

def lcm (x y : Nat) : Nat :=
  (x * y) / gcd x y

def isPrime (n : Nat) : Bool :=
  if n < 2 then false
  else if n = 2 then true
  else if n % 2 = 0 then false
  else
    let rec check (k : Nat) : Bool :=
      if k * k > n then true
      else if n % k = 0 then false
      else check (k + 2)
    check 3

def primeFactors (n : Nat) : List Nat :=
  let rec aux (k n : Nat) (acc : List Nat) : List Nat :=
    if k * k > n then if n = 1 then acc else n :: acc
    else if n % k = 0 then aux k (n / k) (k :: acc)
    else aux (k + 1) n acc
  aux 2 n []

def divisors (n : Nat) : List Nat :=
  (List.range (n + 1)).filter (· ≠ 0) |>.filter (n % · == 0)

def perfectNumbers (limit : Nat) : List Nat :=
  (List.range limit).filter fun n =>
    n > 0 ∧ (divisors n).sum > n

def binomial (n k : Nat) : Nat :=
  if k = 0 ∨ k = n then 1
  else if k > n then 0
  else binomial (n - 1) (k - 1) + binomial (n - 1) k

def catalan (n : Nat) : Nat :=
  binomial (2 * n) n / (n + 1)

#eval gcd 48 18
#eval lcm 12 18
#eval isPrime 17
#eval primeFactors 60
#eval binomial 5 2
