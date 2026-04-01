-- 字符串操作
def greet (name : String) : String := s!"Hello, {name}!"

def repeat (s : String) (n : Nat) : String :=
  String.replicate n s

def joinStrings (xs : List String) : String :=
  String.intercalate ", " xs

def splitLines (s : String) : List String :=
  s.split (· == '\n')

def countChars (s : String) : Nat := s.length

def toUpper (s : String) : String :=
  s.map Char.toUpper

def toLower (s : String) : String :=
  s.map Char.toLower

def trim (s : String) : String := s.trim

def startsWith (s prefix : String) : Bool :=
  s.startsWith prefix

def endsWith (s suffix : String) : Bool :=
  s.endsWith suffix

def containsSubstring (s sub : String) : Bool :=
  s.isSubstrOf sub

def reverseString (s : String) : String :=
  s.toList.reverse.asString

def isPalindrome (s : String) : Bool :=
  s == reverseString s

def wordCount (s : String) : Nat :=
  s.split Char.isWhitespace |>.length

def charAt (s : String) (idx : Nat) : Option Char :=
  s.get? idx

#eval greet "Lean4"
#eval joinStrings ["apple", "banana", "cherry"]
#eval toUpper "hello world"
#eval reverseString "hello"
