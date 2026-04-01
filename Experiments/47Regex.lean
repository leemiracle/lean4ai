-- 正则表达式（简单实现）
inductive Regex where
  | epsilon : Regex
  | char : Char → Regex
  | concat : Regex → Regex → Regex
  | alt : Regex → Regex → Regex
  | star : Regex → Regex
  | plus : Regex → Regex
  | optional : Regex → Regex
  deriving Repr

def Regex.matches : Regex → String → Bool
  | .epsilon, s => s.isEmpty
  | .char c, s => s == String.singleton c
  | .concat r1 r2, s =>
    (List.range (s.length + 1)).any fun i =>
      matches r1 (s.take i) && matches r2 (s.drop i)
  | .alt r1 r2, s => matches r1 s || matches r2 s
  | .star r, s =>
    s.isEmpty || (List.range (s.length + 1)).any fun i =>
      matches r (s.take i) && matches (.star r) (s.drop i)
  | .plus r, s => matches (.concat r (.star r)) s
  | .optional r, s => s.isEmpty || matches r s

def Regex.toString : Regex → String
  | .epsilon => "ε"
  | .char c => s!"{c}"
  | .concat r1 r2 => s!"({toString r1}{toString r2})"
  | .alt r1 r2 => s!"({toString r1}|{toString r2})"
  | .star r => s!"({toString r})*"
  | .plus r => s!"({toString r})+"
  | .optional r => s!"({toString r})?"

def digitRegex : Regex := .alt (.char '0') (.alt (.char '1') (.alt (.char '2') (.alt (.char '3') (.alt (.char '4') (.alt (.char '5') (.alt (.char '6') (.alt (.char '7') (.alt (.char '8') (.char '9')))))))))

def letterRegex : Regex :=
  let letters := ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  letters.foldl (fun acc c => .alt acc (.char c)) (.char 'a')

def whitespaceRegex : Regex := .alt (.char ' ') (.alt (.char '\n') (.char '\t'))

def identifierRegex : Regex := .concat letterRegex (.star (.alt letterRegex digitRegex))

#eval Regex.matches (.char 'a') "a"
#eval Regex.matches (.star (.char 'a')) "aaa"
