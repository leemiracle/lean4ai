-- 流和无限序列
def Stream (α : Type) := Nat → α

def Stream.const (x : α) : Stream α := fun _ => x

def Stream.iterate (f : α → α) (x : α) : Stream α
  | 0 => x
  | n + 1 => f (iterate f x n)

def Stream.map (f : α → β) (s : Stream α) : Stream β :=
  fun n => f (s n)

def Stream.zip (s1 : Stream α) (s2 : Stream β) : Stream (α × β) :=
  fun n => (s1 n, s2 n)

def Stream.take (n : Nat) (s : Stream α) : List α :=
  (List.range n).map s

def Stream.drop (n : Nat) (s : Stream α) : Stream α :=
  fun m => s (n + m)

def Stream.nats : Stream Nat := fun n => n

def Stream.natsFrom (n : Nat) : Stream Nat := fun m => n + m

def Stream.evens : Stream Nat := fun n => 2 * n

def Stream.odds : Stream Nat := fun n => 2 * n + 1

def Stream.fibs : Stream Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => fibs n + fibs (n + 1)

def Stream.factorials : Stream Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorials n

def Stream.primes : Stream Nat :=
  let rec isPrime (n : Nat) : Bool :=
    if n < 2 then false
    else if n = 2 then true
    else if n % 2 = 0 then false
    else
      let rec check (k : Nat) : Bool :=
        if k * k > n then true
        else if n % k = 0 then false
        else check (k + 2)
      check 3
  let rec nthPrime (idx : Nat) : Nat :=
    if idx = 0 then 2
    else
      let rec findNext (n : Nat) (count : Nat) : Nat :=
        if count = idx + 1 then n
        else if isPrime (n + 1) then findNext (n + 1) (count + 1)
        else findNext (n + 1) count
      findNext 2 0
  nthPrime

#eval Stream.take 10 Stream.nats
#eval Stream.take 10 Stream.evens
#eval Stream.take 10 Stream.fibs
