-- 基础证明
theorem add_comm (x y : Nat) : x + y = y + x := by
  omega

theorem add_assoc (x y z : Nat) : (x + y) + z = x + (y + z) := by
  omega

theorem mul_comm (x y : Nat) : x * y = y * x := by
  omega

theorem mul_assoc (x y z : Nat) : (x * y) * z = x * (y * z) := by
  omega

theorem add_zero (x : Nat) : x + 0 = x := by
  simp

theorem mul_zero (x : Nat) : x * 0 = 0 := by
  simp

theorem mul_one (x : Nat) : x * 1 = x := by
  simp

theorem zero_add (x : Nat) : 0 + x = x := by
  simp

theorem one_mul (x : Nat) : 1 * x = x := by
  simp

theorem distrib_left (x y z : Nat) : x * (y + z) = x * y + x * z := by
  omega

theorem distrib_right (x y z : Nat) : (x + y) * z = x * z + y * z := by
  omega

theorem even_add_even {x y : Nat} (hx : x % 2 = 0) (hy : y % 2 = 0) : (x + y) % 2 = 0 := by
  omega

theorem odd_add_odd {x y : Nat} (hx : x % 2 = 1) (hy : y % 2 = 1) : (x + y) % 2 = 0 := by
  omega

#check add_comm
#check mul_assoc
