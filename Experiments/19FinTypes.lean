-- Fin 和向量操作
def finExample1 : Fin 5 := ⟨2, by omega⟩

def finExample2 : Fin 10 := ⟨7, by omega⟩

def finAdd (x y : Fin n) : Fin n :=
  ⟨(x.val + y.val) % n, by omega⟩

def finMul (x y : Fin n) : Fin n :=
  ⟨(x.val * y.val) % n, by omega⟩

def finSub (x y : Fin n) : Fin n :=
  ⟨(x.val + n - y.val) % n, by omega⟩

def finPred (x : Fin n) : Fin n :=
  if h : x.val = 0 then ⟨n - 1, by omega⟩
  else ⟨x.val - 1, by omega⟩

def finSucc (x : Fin n) : Fin n :=
  ⟨(x.val + 1) % n, by omega⟩

def sumFin (n : Nat) : Fin (n + 1) :=
  ⟨List.range n |>.foldl (· + ·) 0 % (n + 1), by
    simp [List.range, List.foldl]
    omega⟩

def toFin {n : Nat} (k : Nat) (h : k < n) : Fin n := ⟨k, h⟩

def fromFin (f : Fin n) : Nat := f.val

#eval finExample1.val
#eval finExample2.val
#eval finAdd ⟨2, by omega⟩ ⟨3, by omega : Fin 10⟩
