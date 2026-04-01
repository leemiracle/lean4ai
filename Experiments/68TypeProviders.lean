-- 类型提供者 (Type Providers)
import Lean

-- 1. 数字字面量提供者
@[num 0]
def zeroLiteral : Nat := 0

@[num 1]
def oneLiteral : Nat := 1

@[num 42]
def answerLiteral : Nat := 42

-- 2. 字符串字面量提供者
instance : Quote String where
  quote := String.quote

def String.quote (s : String) : String := s

-- 3. 列表字面量提供者
instance : Quote (List Nat) where
  quote := List.quote

def List.quote (xs : List Nat) : List Nat := xs

-- 4. 标识符提供者
instance : Quote (String × Nat) where
  quote := Pair.quote

def Pair.quote (p : String × Nat) : String × Nat := p

-- 5. 自定义字面量类型
structure Vector3 where
  x y z : Float
  deriving Repr

instance : Quote Vector3 where
  quote := Vector3.quote

def Vector3.quote (v : Vector3) : Vector3 := v

-- 6. 解析字面量
instance : Quote (Option Nat) where
  quote := Option.quote

def Option.quote (o : Option Nat) : Option Nat := o

-- 7. 嵌套字面量
instance : Quote (List (Option Nat)) where
  quote := List.quote

-- 8. 带类型的字面量
structure Time where
  hours minutes seconds : Nat
  deriving Repr

instance : Quote Time where
  quote := Time.quote

def Time.quote (t : Time) : Time := t

-- 9. JSON 字面量
structure JSON where
  value : String
  deriving Repr

instance : Quote JSON where
  quote := JSON.quote

def JSON.quote (j : JSON) : JSON := j

-- 10. 正则表达式字面量
structure Regex where
  pattern : String
  deriving Repr

instance : Quote Regex where
  quote := Regex.quote

def Regex.quote (r : Regex) : Regex := r

-- 11. 日期字面量
structure Date where
  year month day : Nat
  deriving Repr

instance : Quote Date where
  quote := Date.quote

def Date.quote (d : Date) : Date := d

-- 12. 颜色字面量
structure RGB where
  red green blue : Nat
  deriving Repr

instance : Quote RGB where
  quote := RGB.quote

def RGB.quote (c : RGB) : RGB := c

-- 13. 复数字面量
structure Complex where
  real imaginary : Float
  deriving Repr

instance : Quote Complex where
  quote := Complex.quote

def Complex.quote (c : Complex) : Complex := c

-- 14. 分数字面量
structure Fraction where
  numerator denominator : Int
  deriving Repr

instance : Quote Fraction where
  quote := Fraction.quote

def Fraction.quote (f : Fraction) : Fraction := f

-- 15. 范围字面量
structure Range where
  start end : Nat
  deriving Repr

instance : Quote Range where
  quote := Range.quote

def Range.quote (r : Range) : Range := r

-- 使用示例
def testZero : Nat := zeroLiteral
def testOne : Nat := oneLiteral
def testAnswer : Nat := answerLiteral
def testVector : Vector3 := ⟨1.0, 2.0, 3.0⟩
def testTime : Time := ⟨12, 30, 45⟩

#eval testZero
#eval testOne
#eval testAnswer
