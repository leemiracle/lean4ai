-- Elaborator (详细说明器)
import Lean

-- 1. 自定义 elaborator
elab "my_number" : term => do
  pure (Lean.mkConst ``Nat.zero)

-- 2. 带参数的 elaborator
elab "my_add " x:term " " y:term : term => do
  pure (Lean.mkApp2 (Lean.mkConst ``Nat.add) x y)

-- 3. 模式匹配 elaborator
elab "my_pattern" : term => do
  let x ← Lean.Expr.fvar `x
  pure (Lean.mkApp (Lean.mkConst ``Nat.succ) x)

-- 4. 类型类 elaborator
elab "my_infer" : term <= $_ => do
  pure (Lean.mkConst ``Nat.zero)

-- 5. 列表 elaborator
elab "my_list" : term => do
  pure (Lean.mkList #[])

-- 6. 字符串 elaborator
elab "my_string" : term => do
  pure (Lean.mkStrLit "Hello")

-- 7. 自然数 elaborator
elab "my_nat" : term => do
  pure (Lean.mkNatLit 42)

-- 8. 应用 elaborator
elab "my_app" x:term : term => do
  pure x

-- 9. Lambda elaborator
elab "my_lambda" : term => do
  let x ← Lean.Expr.fvar `x
  pure (Lean.mkLambda `x (Lean.mkConst ``Nat) x)

-- 10. Forall elaborator
elab "my_forall" : term => do
  let x ← Lean.Expr.fvar `x
  pure (Lean.mkForall `x (Lean.mkConst ``Nat) x)

-- 11. Let elaborator
elab "my_let" x:ident " := " v:term " in " b:term : term => do
  pure (Lean.mkLet x (Lean.mkConst ``Nat) v b)

-- 12. 数据类型 elaborator
elab "my_some" : term => do
  pure (Lean.mkApp (Lean.mkConst ``Option.some) (Lean.mkNatLit 42))

-- 13. 匹配 elaborator
elab "my_match" : term => do
  let x ← Lean.Expr.fvar `x
  pure (Lean.mkMatch #[] (Lean.mkConst ``Option.some) x)

-- 14. 策略 elaborator
elab "my_tac" : tactic => do
  Lean.Elab.Tactic.evalTactic (Lean.mkConst ``Nat.add_comm)

-- 15. 命令 elaborator
elab "my_cmd" : command => do
  pure ()

-- 测试 elaborators
def testMyNumber : Nat := my_number
def testMyAdd : Nat := my_add 3 5
def testMyString : String := my_string
def testMyNat : Nat := my_nat
def testMySome : Option Nat := my_some

#eval testMyNumber
#eval testMyAdd
#eval testMyString
#eval testMyNat
#eval testMySome
