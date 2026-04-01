-- Option 和 Result 处理
def optionMap (f : α → β) (x : Option α) : Option β :=
  match x with
  | some a => some (f a)
  | none => none

def optionBind (x : Option α) (f : α → Option β) : Option β :=
  match x with
  | some a => f a
  | none => none

def optionOrElse (x y : Option α) : Option α :=
  match x with
  | some _ => x
  | none => y

def optionFilter (p : α → Bool) (x : Option α) : Option α :=
  match x with
  | some a => if p a then some a else none
  | none => none

def optionToList (x : Option α) : List α :=
  match x with
  | some a => [a]
  | none => []

def listToOption (xs : List α) : Option α :=
  xs.head?

def optionIsSome (x : Option α) : Bool :=
  match x with
  | some _ => true
  | none => false

def optionIsNone (x : Option α) : Bool :=
  match x with
  | some _ => false
  | none => true

def optionGetD (x : Option α) (default : α) : α :=
  x.getD default

def resultMap (f : α → β) (x : Result α ε) : Result β ε :=
  match x with
  | .ok a => .ok (f a)
  | .error e => .error e

def resultBind (x : Result α ε) (f : α → Result β ε) : Result β ε :=
  match x with
  | .ok a => f a
  | .error e => .error e

#eval optionMap (· + 1) (some 5)
#eval optionBind (some 2) (fun x => some (x * 10))
#eval optionFilter (· > 3) (some 5)
