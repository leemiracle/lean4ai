-- 简单解析器组合子
def Parser (α : Type) := String → Option (α × String)

def Parser.pure (x : α) : Parser α := fun s => some (x, s)

def Parser.bind (p : Parser α) (f : α → Parser β) : Parser β :=
  fun s =>
    match p s with
    | some (a, s') => f a s'
    | none => none

def Parser.fail : Parser α := fun _ => none

def Parser.run (p : Parser α) (s : String) : Option α :=
  match p s with
  | some (a, "") => some a
  | _ => none

def Parser.runPartial (p : Parser α) (s : String) : Option (α × String) :=
  p s

def char (c : Char) : Parser Char :=
  fun s =>
    if s.front == c then some (c, s.drop 1)
    else none

def string (str : String) : Parser String :=
  fun s =>
    if s.startsWith str then some (str, s.drop str.length)
    else none

def satisfy (p : Char → Bool) : Parser Char :=
  fun s =>
    if p s.front then some (s.front, s.drop 1)
    else none

def digit : Parser Char := satisfy Char.isDigit

def letter : Parser Char := satisfy Char.isAlpha

def space : Parser Char := satisfy Char.isWhitespace

def many (p : Parser α) : Parser (List α) :=
  fun s =>
    match p s with
    | some (a, s') =>
      match many p s' with
      | some (as, s'') => some (a :: as, s'')
      | none => some ([a], s')
    | none => some ([], s)

def many1 (p : Parser α) : Parser (List α) :=
  fun s =>
    match p s with
    | some (a, s') =>
      match many p s' with
      | some (as, s'') => some (a :: as, s'')
      | none => none
    | none => none

def natParser : Parser Nat :=
  fun s =>
    let digits := s.takeWhile Char.isDigit
    if digits.isEmpty then none
    else
      let n := digits.toNat? |>.get!
      some (n, s.drop digits.length)

def parseExample : Option Nat := Parser.run natParser "12345"

#eval parseExample
