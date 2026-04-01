-- 递归和尾递归
def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) + sumTo n

def sumToTailAux (n acc : Nat) : Nat :=
  match n with
  | 0 => acc
  | n + 1 => sumToTailAux n (acc + n + 1)

def sumToTail (n : Nat) : Nat := sumToTailAux n 0

def reverseAux (xs ys : List α) : List α :=
  match xs with
  | [] => ys
  | x :: xs => reverseAux xs (x :: ys)

def reverse' (xs : List α) : List α := reverseAux xs []

def lengthAux (xs : List α) (acc : Nat) : Nat :=
  match xs with
  | [] => acc
  | _ :: xs => lengthAux xs (acc + 1)

def length' (xs : List α) : Nat := lengthAux xs 0

def factorialAux (n acc : Nat) : Nat :=
  match n with
  | 0 => acc
  | n + 1 => factorialAux n (acc * (n + 1))

def factorialTail (n : Nat) : Nat := factorialAux n 1

def fibonacciAux (n a b : Nat) : Nat :=
  match n with
  | 0 => a
  | n + 1 => fibonacciAux n b (a + b)

def fibonacciTail (n : Nat) : Nat := fibonacciAux n 0 1

#eval sumToTail 10
#eval reverse' [1, 2, 3, 4, 5]
#eval length' [1, 2, 3, 4]
#eval factorialTail 6
#eval fibonacciTail 10
