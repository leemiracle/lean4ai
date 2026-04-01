-- 类型类
class MyAdd (α : Type) where
  add : α → α → α

class MyMul (α : Type) where
  mul : α → α → α

class MyOne (α : Type) where
  one : α

class MyZero (α : Type) where
  zero : α

class MyNeg (α : Type) where
  neg : α → α

instance : MyAdd Nat where
  add := Nat.add

instance : MyMul Nat where
  mul := Nat.mul

instance : MyZero Nat where
  zero := 0

instance : MyOne Nat where
  one := 1

instance : MyAdd Int where
  add := Int.add

instance : MyMul Int where
  mul := Int.mul

instance : MyNeg Int where
  neg := Int.neg

instance : MyZero Int where
  zero := 0

instance : MyOne Int where
  one := 1

def mySum [MyAdd α] [MyZero α] (xs : List α) : α :=
  xs.foldl MyAdd.add MyZero.zero

def myProduct [MyMul α] [MyOne α] (xs : List α) : α :=
  xs.foldl MyMul.mul MyOne.one

#eval mySum [1, 2, 3, 4, 5]
#eval myProduct [1, 2, 3, 4, 5]
