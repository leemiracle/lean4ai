-- Partial 和部分函数
partial def fixpoint (f : α → α) (x : α) (limit : Nat := 1000) : α :=
  if limit = 0 then x
  else
    let x' := f x
    if x' == x then x'
    else fixpoint f x' (limit - 1)

partial def findFixedPoint (f : Nat → Nat) (start : Nat) : Nat :=
  let next := f start
  if next = start then start
  else findFixedPoint f next

partial def newtonSqrt (x : Float) (guess : Float := 1.0) (tolerance : Float := 0.0001) : Float :=
  let newGuess := (guess + x / guess) / 2
  if Float.abs (newGuess - guess) < tolerance then newGuess
  else newtonSqrt x newGuess tolerance

partial def collatzSteps (n : Nat) : Nat :=
  if n = 1 then 0
  else if n % 2 = 0 then 1 + collatzSteps (n / 2)
  else 1 + collatzSteps (3 * n + 1)

partial def ackermann' (m n : Nat) : Nat :=
  match m, n with
  | 0, n => n + 1
  | m + 1, 0 => ackermann' m 1
  | m + 1, n + 1 => ackermann' m (ackermann' (m + 1) n)

#eval findFixedPoint (fun x => x / 2 + 5) 100
#eval newtonSqrt 16.0
