-- 异常处理
inductive MyError where
  | runtimeError : String → MyError
  | typeError : String → MyError
  | ioError : String → MyError
  deriving Repr, BEq

def MyError.toString : MyError → String
  | .runtimeError s => s!"RuntimeError: {s}"
  | .typeError s => s!"TypeError: {s}"
  | .ioError s => s!"IOError: {s}"

def MyError.message : MyError → String
  | .runtimeError s => s
  | .typeError s => s
  | .ioError s => s

def safeDivision (x y : Int) : Except MyError Int :=
  if y = 0 then .error (.runtimeError "Division by zero")
  else .ok (x / y)

def safeArrayAccess (arr : Array α) (idx : Nat) : Except MyError α :=
  match arr.get? idx with
  | some x => .ok x
  | none => .error (.runtimeError s!"Index {idx} out of bounds")

def safeHead (xs : List α) : Except MyError α :=
  match xs with
  | [] => .error (.runtimeError "Empty list")
  | x :: _ => .ok x

def safeTail (xs : List α) : Except MyError (List α) :=
  match xs with
  | [] => .error (.runtimeError "Empty list")
  | _ :: xs => .ok xs

def catchError (e : MyError) : String :=
  MyError.toString e

def handleError (action : Except MyError α) (handler : MyError → α) : α :=
  match action with
  | .ok x => x
  | .error e => handler e

#eval safeDivision 10 2
#eval safeDivision 10 0
#eval safeArrayAccess #[1, 2, 3] 1
