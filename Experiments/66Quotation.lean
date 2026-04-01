-- 引用和反射 (Quotation & Reflection)
import Lean

-- 1. 基本引用
def quotedNat : Lean.Expr := `(Nat.zero)

-- 2. 类型引用
def quotedType : Lean.Expr := `(Nat)

-- 3. 函数应用引用
def quotedApp : Lean.Expr := `(Nat.succ 0)

-- 4. Lambda 引用
def quotedLambda : Lean.Expr := `(fun x => x + 1)

-- 5. Pi 类型引用
def quotedPi : Lean.Expr := `((α : Type) → α → α)

-- 6. 列表引用
def quotedList : Lean.Expr := `([1, 2, 3])

-- 7. 结构体引用
def quotedStruct : Lean.Expr := `({ x := 1, y := 2 : Point })

-- 8. 模式匹配引用
def quotedMatch : Lean.Expr := `
  match some 42 with
  | some x => x
  | none => 0

-- 9. 类型类实例引用
def quotedInstance : Lean.Expr => `(instBEqNat)

-- 10. 策略证明引用
def quotedTactic : Lean.Expr := `(by simp)

-- 11. 反引（Unquoting）
def unquoteExample : Nat := $(Lean.quoteNat 42)

-- 12. 类型模式
def typePattern (e : Lean.Expr) : String :=
  match e with
  | .app _ _ => "application"
  | .lam _ _ _ => "lambda"
  | .forallE _ _ _ => "forall"
  | .sort _ => "sort"
  | .const _ _ => "constant"
  | .fvar _ => "free variable"
  | .mvar _ => "meta variable"
  | .lit _ => "literal"
  | _ => "unknown"

-- 13. 表达式遍历
def countNodes (e : Lean.Expr) : Nat :=
  match e with
  | .app f a => 1 + countNodes f + countNodes a
  | .lam _ _ b => 1 + countNodes b
  | .forallE _ _ b => 1 + countNodes b
  | .letE _ _ _ b => 1 + countNodes b
  | _ => 1

-- 14. 表达式替换
def replaceVar (e : Lean.Expr) (old new : Lean.Expr.FVarId) : Lean.Expr :=
  match e with
  | .fvar id => if id == old then Lean.Expr.fvar new else e
  | .app f a => Lean.Expr.app (replaceVar f old new) (replaceVar a old new)
  | .lam n t b => Lean.Expr.lam n t (replaceVar b old new)
  | _ => e

-- 15. 宏展开
def expandMacro (e : Lean.Expr) : Lean.Expr :=
  match e with
  | .app (Lean.Expr.const n _) a =>
    if n == ``List.map then
      Lean.Expr.app (Lean.Expr.const ``List.map') a
    else e
  | _ => e

-- 16. 类型推断
def inferType (e : Lean.Expr) : Lean.Expr :=
  match e with
  | .lam _ t _ => Lean.Expr.forall (Lean.Name.mkFresh `x) t (Lean.Expr.bvar 0)
  | _ => Lean.Expr.sort Level.zero

-- 17. 表达式大小
def exprSize (e : Lean.Expr) : Nat :=
  Lean.Expr.size e

-- 18. 自由变量收集
def collectFVars (e : Lean.Expr) : Lean.Expr.FVarIdSet :=
  Lean.Expr.collectFVars e

-- 19. 表达式哈希
def hashExpr (e : Lean.Expr) : UInt64 :=
  Lean.Expr.hash e

-- 20. 表达式相等性
def exprEqual (e1 e2 : Lean.Expr) : Bool :=
  Lean.Expr.equal e1 e2

-- 测试引用
#eval typePattern quotedNat
#eval countNodes quotedApp
#eval exprSize quotedLambda
