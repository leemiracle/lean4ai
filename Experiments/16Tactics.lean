-- 自定义策略
syntax "trivial_add" : tactic

macro_rules
  | `(tactic| trivial_add) => `(tactic| simp [Nat.add_comm, Nat.add_assoc])

syntax "try_omega" : tactic

macro_rules
  | `(tactic| try_omega) => `(tactic| omega)

syntax "use_assumptions" : tactic

macro_rules
  | `(tactic| use_assumptions) => `(tactic| assumption)

theorem test_trivial1 (x y : Nat) : x + y = y + x := by
  trivial_add

theorem test_trivial2 (x y z : Nat) : x + (y + z) = (x + y) + z := by
  trivial_add

theorem test_omega1 (x : Nat) : x + 0 = x := by
  try_omega

theorem test_omega2 (x y : Nat) : x + y + 0 = x + y := by
  try_omega

theorem test_assumption (h : x = y) : x = y := by
  use_assumptions

syntax "destruct_list" : tactic

macro_rules
  | `(tactic| destruct_list) => `(tactic| induction x with | nil => rfl | cons h t ih => simp)

#check test_trivial1
#check test_trivial2
