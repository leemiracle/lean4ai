-- 记忆化
def memoize (f : Nat → α) : Nat → α :=
  let cache : Array (Option α) := Array.mkArray 1000 none
  fun n =>
    match cache.get? n with
    | some (some x) => x
    | _ => f n

def fibMemo : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n => fibMemo (n - 1) + fibMemo (n - 2)

def factorialMemo : Nat → Nat
  | 0 => 1
  | n => n * factorialMemo (n - 1)

def ackermann : Nat → Nat → Nat
  | 0, n => n + 1
  | m + 1, 0 => ackermann m 1
  | m + 1, n + 1 => ackermann m (ackermann (m + 1) n)

def pascalTriangle (n : Nat) : List (List Nat) :=
  let rec row (k : Nat) : List Nat :=
    if k = 0 then [1]
    else
      let prev := row (k - 1)
      let middle := (prev.zip (prev.drop 1)).map (·.1 + ·.2)
      [1] ++ middle ++ [1]
  (List.range (n + 1)).map row

def collatzLength (n : Nat) : Nat :=
  let rec aux (m : Nat) (acc : Nat) : Nat :=
    if m = 1 then acc
    else if m % 2 = 0 then aux (m / 2) (acc + 1)
    else aux (3 * m + 1) (acc + 1)
  aux n 1

#eval fibMemo 20
#eval factorialMemo 10
#eval ackermann 3 4
#eval collatzLength 27
