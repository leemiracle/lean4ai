-- 元编程基础
syntax "hello!" : term

macro_rules | `(hello!) => `("Hello, World!")

syntax "add_num!" num num : term

macro_rules | `(add_num! $x $y) => `($x + $y)

syntax "myif!" term "then" term "else" term : term

macro_rules | `(myif! $cond then $t else $e) => `(if $cond then $t else $e)

syntax "mylet!" ident " := " term "in" term : term

macro_rules | `(mylet! $x:ident := $v in $body) => `(let $x := $v; $body)

syntax "double!" num : term
macro_rules | `(double! $n) => `($n * 2)

syntax "triple!" num : term
macro_rules | `(triple! $n) => `($n * 3)

syntax "square!" num : term
macro_rules | `(square! $n) => `($n * $n)

syntax "factorial!" num : term
macro_rules
  | `(factorial! 0) => `(1)
  | `(factorial! $n) => `($n * factorial! ($n - 1))

#eval hello!
#eval add_num! 10 20
#eval myif! true then 1 else 2
#eval mylet! x := 5 in x + 10
#eval double! 21
#eval triple! 14
#eval square! 12
