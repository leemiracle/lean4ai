-- Free Monad
inductive Free (F : Type → Type) (α : Type) where
  | pure : α → Free F α
  | bind : F (Free F α) → Free F α

def Free.map (f : α → β) (fa : Free F α) : Free F β :=
  match fa with
  | .pure a => .pure (f a)
  | .bind fa => .bind (fun x => Free.map f (fa x))

def Free.bind (fa : Free F α) (f : α → Free F β) : Free F β :=
  match fa with
  | .pure a => f a
  | .bind fa => .bind (fun x => Free.bind (fa x) f)

def Free.run [Monad F] (fa : Free F α) : F α :=
  match fa with
  | .pure a => pure a
  | .bind fa => fa >>= Free.run

inductive FreeExpr (α : Type) where
  | add : α → α → FreeExpr α
  | mul : α → α → FreeExpr α
  | lit : Nat → FreeExpr α

def FreeExpr.addF (x y : Free FreeExpr α) : Free FreeExpr α :=
  .bind (.add x y)

def FreeExpr.mulF (x y : Free FreeExpr α) : Free FreeExpr α :=
  .bind (.mul x y)

def FreeExpr.litF (n : Nat) : Free FreeExpr α :=
  .bind (.lit n)

#eval Free.pure 42
