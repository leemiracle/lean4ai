-- 代数数据类型
inductive Expr where
  | const : Nat → Expr
  | add : Expr → Expr → Expr
  | mul : Expr → Expr → Expr
  | sub : Expr → Expr → Expr
  deriving Repr

def eval : Expr → Nat
  | .const n => n
  | .add e1 e2 => eval e1 + eval e2
  | .mul e1 e2 => eval e1 * eval e2
  | .sub e1 e2 => eval e1 - eval e2

def simplify : Expr → Expr
  | .add e (.const 0) => simplify e
  | .add (.const 0) e => simplify e
  | .mul e (.const 1) => simplify e
  | .mul (.const 1) e => simplify e
  | .mul _ (.const 0) => .const 0
  | .mul (.const 0) _ => .const 0
  | .sub e (.const 0) => simplify e
  | .add e1 e2 => .add (simplify e1) (simplify e2)
  | .mul e1 e2 => .mul (simplify e1) (simplify e2)
  | .sub e1 e2 => .sub (simplify e1) (simplify e2)
  | e => e

def exprToString : Expr → String
  | .const n => toString n
  | .add e1 e2 => s!"({exprToString e1} + {exprToString e2})"
  | .mul e1 e2 => s!"({exprToString e1} * {exprToString e2})"
  | .sub e1 e2 => s!"({exprToString e1} - {exprToString e2})"

inductive BoolExpr where
  | const : Bool → BoolExpr
  | and : BoolExpr → BoolExpr → BoolExpr
  | or : BoolExpr → BoolExpr → BoolExpr
  | not : BoolExpr → BoolExpr
  deriving Repr

def evalBool : BoolExpr → Bool
  | .const b => b
  | .and e1 e2 => evalBool e1 && evalBool e2
  | .or e1 e2 => evalBool e1 || evalBool e2
  | .not e => !evalBool e

#eval eval (.add (.const 3) (.mul (.const 4) (.const 5)))
#eval exprToString (.add (.const 3) (.mul (.const 4) (.const 5)))
#eval evalBool (.and (.const true) (.or (.const false) (.const true)))
