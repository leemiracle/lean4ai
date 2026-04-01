-- 优先级和结合性
infixl:65 " ⋆ " => Nat.mul
infixl:60 " ◦ " => Nat.add
infixr:55 " ▷ " => Nat.sub

def test1 : Nat := 5 ⋆ 3 ◦ 2
def test2 : Nat := 10 ◦ 5 ⋆ 2
def test3 : Nat := 20 ▷ 10 ▷ 5

notation:65 lhs:65 " ⊕ " rhs:66 => lhs + rhs
notation:60 lhs:60 " ⊗ " rhs:61 => lhs * rhs

def test4 : Nat := 3 ⊕ 2 ⊗ 4
def test5 : Nat := 3 ⊗ 2 ⊕ 4

prefix:100 "!" => Nat.succ
prefix:100 "#" => Nat.pred

def test6 : Nat := !5
def test7 : Nat := #5

postfix:100 "²" => fun x => x * x
postfix:100 "³" => fun x => x * x * x

def test8 : Nat := 5²
def test9 : Nat := 3³

#eval test1
#eval test2
#eval test3
#eval test4
#eval test5
