-- 自定义策略系统
import Lean

syntax "trivial" : tactic
macro_rules | `(tactic| trivial) => `(tactic| simp [Nat.add_comm, Nat.add_assoc, Nat.mul_comm])

syntax "destruct" term : tactic
macro_rules
  | `(tactic| destruct $x:term) => `(tactic| induction $x)

syntax "cases" term,+ : tactic
macro_rules
  | `(tactic| cases $x:term) => `(tactic| cases $x)

syntax "auto_simp" : tactic
macro_rules
  | `(tactic| auto_simp) => `(tactic| simp_arith)

syntax "math_simp" : tactic
macro_rules
  | `(tactic| math_simp) => `(tactic| 
    simp [Nat.add_comm, Nat.add_assoc, Nat.mul_comm, Nat.mul_assoc,
         Nat.sub_comm, Nat.sub_assoc, Nat.div_comm])

syntax "prove" term "using" term,+ : tactic
macro_rules
  | `(tactic| prove $name:term using $body:term) => `(tactic| 
    have $name := $body; assumption)

syntax "debug" : tactic
macro_rules
  | `(tactic| debug) => `(tactic| 
    trace_state; 
    dbg_trace_state)

syntax "exfalso" : tactic
macro_rules
  | `(tactic| exfalso) => `(tactic| exfalso; revert)

syntax "exintro" : tactic
macro_rules
  | `(tactic| exintro) => `(tactic| exintro)

syntax "by_cases" term "=>" term "=>" term : tactic
macro_rules
  | `(tactic| by_cases $x => $y => $z) => `(tactic| 
    cases $x <;>
    | $y => rfl
    | $z => rfl

syntax "omega_or_simp" : tactic
macro_rules
  | `(tactic| omega_or_simp) => `(tactic| 
    first omega
    | try simp

syntax "induction_with" term : tactic
macro_rules
  | `(tactic| induction_with $h:term) => `(tactic| 
    induction with $h

syntax "generalize" term ":" term : tactic
macro_rules
  | `(tactic| generalize $x : $y) => `(tactic| 
    generalize $x : $y

syntax "specialize" term ":" term : tactic
macro_rules
  | `(tactic| specialize $x : $y) => `(tactic| 
    specialize $x : $y

syntax "rename" term "=>" term : tactic
macro_rules
  | `(tactic| rename $old => $new) => `(tactic| rename $old => $new)

syntax "set" term ":=" term : tactic
macro_rules
  | `(tactic| set $x := $v) => `(tactic| have $x := $v)

syntax "clear" : tactic
macro_rules
  | `(tactic| clear) => `(tactic| clear)

syntax "clear_except" term,+ : tactic
macro_rules
  | `(tactic| clear_except $xs:term,*) => `(tactic| 
    clear except $xs

theorem test_trivial1 (x y : Nat) : x + y = y + x := by
  trivial

theorem test_trivial2 (x y z : Nat) : (x + y) + z = x + (y + z) := by
  trivial

theorem test_math_simp (x y : Nat) : x * y + x = y * x := by
  math_simp

theorem test_omega_or_simp (x : Nat) : x + 0 > x := by
  omega_or_simp

theorem test_by_cases (x y : Nat) : 
  (if x > y then x else y) > 0 := by
  by_cases x y =>
    | 0, 0 => by simp
    | _, 0 => by simp
    | 0, _ => by simp
    | _, _ => by simp

theorem test_induction_with (xs : List Nat) : xs.length ≥ 0 := by
  induction_with xs.length ≥ 0

theorem test_generalize (x : Nat) : ∀ y : Nat, x + y ≥ x := by
  generalize x : ∀ y : Nat
  intro y
  omega

theorem test_specialize (x y : Nat) : x + y = y + x := by
  specialize y : Nat

example test_add_comm (x y : Nat) : x + y = y + x := by
  trivial

example test_mul_comm (x y : Nat) : x * y = y * x := by
  trivial

#check test_trivial1
#check test_math_simp
