-- 数组和列表操作
def arraySum (arr : Array Nat) : Nat :=
  arr.foldl (· + ·) 0

def arrayProduct (arr : Array Nat) : Nat :=
  arr.foldl (· * ·) 1

def arrayMap (f : α → β) (arr : Array α) : Array β :=
  arr.map f

def arrayFilter (p : α → Bool) (arr : Array α) : Array α :=
  arr.filter p

def arrayReverse (arr : Array α) : Array α :=
  arr.reverse

def arrayFlatten (arr : Array (Array α)) : Array α :=
  arr.flatten

def listSum (xs : List Nat) : Nat :=
  xs.foldl (· + ·) 0

def listProduct (xs : List Nat) : Nat :=
  xs.foldl (· * ·) 1

def listMap (f : α → β) (xs : List α) : List β :=
  xs.map f

def listFilter (p : α → Bool) (xs : List α) : List α :=
  xs.filter p

def listReverse (xs : List α) : List α :=
  xs.reverse

def listFlatten (xss : List (List α)) : List α :=
  xss.flatten

def listConcat (xs ys : List α) : List α :=
  xs ++ ys

def arrayConcat (arr1 arr2 : Array α) : Array α :=
  arr1 ++ arr2

#eval arraySum #[1, 2, 3, 4, 5]
#eval listMap (· * 2) [1, 2, 3, 4]
#eval listFilter (· % 2 == 0) [1, 2, 3, 4, 5, 6]
