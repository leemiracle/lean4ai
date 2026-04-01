-- 宏系统
import Lean

-- 1. 基本宏定义
syntax "my_plus" : term
macro_rules | `(my_plus) => `(fun x y => x + y)

syntax "my_mult" : term
macro_rules | `(my_mult) => `(fun x y => x * y)

-- 2. 带参数的宏
syntax "compute" term "with" term : term
macro_rules | `(compute $x:term with $f:term) => `($f $x)

-- 3. 宏模式匹配
syntax "first_of" : term
macro_rules
  | `(first_of ($x:term)) => `($x)
  | `(first_of ($x:term, $ys:term,*)) => `($x)

syntax "second_of" "," term "," term : term
macro_rules | `(second_of , $x:term , $y:term) => `($y)

-- 4. 代码生成宏
syntax "generate_getters" term,+ : command
macro_rules
  | `(command| generate_getters $fields:term,*) => do
    let cmds ← fields.toListM fun f => `(def $(f.ident).toString! ($f) : $(f.ident).1)
    pure cmds

-- 5. 宏卫生（Macro Hygiene）
syntax "safe_var" : term
macro_rules | `(safe_var) => `(let x := 42 in x)

syntax "unsafe_var" : term
macro_rules | `(unsafe_var) => `(x + 1)

-- 6. 递归宏
syntax "repeat" num "times" : term
macro_rules
  | `(repeat 0 times) => `(pure ())
  | `(repeat $n:num times) => `(
    let _ := pure ();
    repeat $(Lean.quoteNat (n.getNat - 1)) times
  )

-- 7. 条件宏
syntax "if_positive" term "then" term "else" term : term
macro_rules
  | `(if_positive $n:term then $t:term else $e:term) => `(
    if $n > 0 then $t else $e
  )

-- 8. 宏组合
syntax "chain" : term
macro_rules
  | `(chain) => `(fun x => x)
  | `(chain $f:term) => `($f)
  | `(chain $f:term >>= $g:term) => `(fun x => $g ($f x))

-- 9. 字符串插值宏
syntax "interpolate" : term
macro_rules | `(interpolate) => `((s : String) => s!"Value: {s}")

-- 10. 模式匹配宏
syntax "match_pattern" : term
macro_rules
  | `(match_pattern ($x:term)) => `(
    match $x with
    | 0 => "zero"
    | n => s!"positive: {n}"
  )

-- 11. 列表生成宏
syntax "range" : term
macro_rules
  | `(range) => `([0])
  | `(range $n:num) => `(List.range $(Lean.quoteNat n.getNat))

-- 12. 类型注解宏
syntax "annotate" : term
macro_rules | `(annotate) => `(@[inline] fun x => x * 2)

-- 13. 文档生成宏
syntax "documented" : term
macro_rules | `(documented) => `(/--
  This is a documented function.
  -/ fun x => x + 1)

-- 14. 调试宏
syntax "debug_print" : term
macro_rules | `(debug_print $x:term) => `(
  let result := $x;
  dbg_trace s!"Debug: {result}";
  result
  )

-- 15. 性能测量宏
syntax "timed" : term
macro_rules | `(timed $x:term) => `(
  let start ← IO.monoMsNow;
  let result ← $x;
  let end ← IO.monoMsNow;
  IO.println s!"Time: {end - start}ms";
  pure result
  )

-- 使用示例
def testMyPlus : Nat := my_plus 3 5
def testCompute : Nat := compute 10 with (· * 2)
def testFirstOf : Nat := first_of (1, 2, 3)
def testChain : Nat → Nat := chain (· + 1) >>= (· * 2)
def testIfPositive : Nat := if_positive 5 then 100 else 0
def testMatchPattern : String := match_pattern (42)

#eval testMyPlus
#eval testCompute
#eval testFirstOf
#eval testChain 5
#eval testIfPositive
#eval testMatchPattern
