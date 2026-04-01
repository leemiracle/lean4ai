-- 计算证明
def nat.add_comm' (x y : Nat) : x + y = y + x := by
  induction x with
  | zero => simp
  | succ x ih => simp [Nat.add_succ, Nat.succ_add, ih]

def nat.add_assoc' (x y z : Nat) : (x + y) + z = x + (y + z) := by
  induction x with
  | zero => simp
  | succ x ih => simp [Nat.add_succ, ih]

def nat.mul_comm' (x y : Nat) : x * y = y * x := by
  induction x with
  | zero => simp
  | succ x ih => simp [Nat.mul_succ, Nat.succ_mul, ih]

def nat.zero_add' (x : Nat) : 0 + x = x := by
  simp

def nat.succ_add' (x y : Nat) : (x + 1) + y = (x + y) + 1 := by
  omega

def nat.mul_zero' (x : Nat) : x * 0 = 0 := by
  simp

def nat.mul_one' (x : Nat) : x * 1 = x := by
  simp

def nat.mul_succ' (x y : Nat) : x * (y + 1) = x * y + x := by
  omega

def nat.add_mul' (x y z : Nat) : (x + y) * z = x * z + y * z := by
  omega

def nat.mul_add' (x y z : Nat) : x * (y + z) = x * y + x * z := by
  omega

#check nat.add_comm'
#check nat.mul_comm'
