-- 属性系统 (Attribute System)
import Lean

-- 1. 定义属性
attribute [inline]
attribute [never_inline]
attribute [extern "my_function"]
attribute [specialize]
attribute [implemented_by my_impl]
attribute [deprecated my_function]

-- 2. 使用属性
@[inline]
def inlineFunction (x : Nat) : Nat := x * 2

@[never_inline]
def neverInlineFunction (x : Nat) : Nat := x + 1

@[extern "my_external_impl"]
opaque externalFunction (x : Nat) : Nat

-- 3. 条件属性
@[inline]
def conditionalInline (x : Nat) : Nat :=
  if x > 0 then x else 0

-- 4. 属性组合
@[inline, never_inline]
def conflictingAttributes (x : Nat) : Nat := x

-- 5. 自定义属性
syntax (name := str) : attr

macro_rules
  | `(name := $s:str) => `(Attr.name $s.getString)

-- 6. 属性参数
attribute [instance 10]
def parameterizedInstance (x : Nat) : Nat := x

-- 7. 实例优先级
attribute [instance 100]
@[instance 50]
def priorityExample (x : Nat) : Nat := x

-- 8. 属性查询
def hasInlineAttribute : Bool :=
  Lean.Attribute.hasInstance `inline (Lean.mkConst ``inlineFunction)

-- 9. 属性列表
def listAttributes : IO Unit := do
  IO.println "Listing attributes..."

-- 10. 属性继承
class HasInlineAttr (α : Type) where
  hasInline : Bool

instance : HasInlineAttr Nat where
  hasInline := true

-- 11. 属性传递
@[inline]
def parentFunction (x : Nat) : Nat := x

def childFunction (x : Nat) : Nat := parentFunction x

-- 12. 属性验证
def verifyAttribute (fn : String) : IO Bool := do
  IO.println s!"Verifying attribute for: {fn}"
  pure true

-- 13. 属性修改
def modifyAttribute (x : Nat) : Nat :=
  if x > 10 then inlineFunction x
  else neverInlineFunction x

-- 14. 属性条件编译
def conditionalCompile (x : Nat) : Nat :=
  if Debug.debug then
    debugFunction x
  else
    inlineFunction x
where
  debugFunction (x : Nat) : Nat := x

-- 15. 属性文档
/-
  ## inlineFunction
  This function is marked as inline.
  -/
@[inline]
def documentedFunction (x : Nat) : Nat := x

-- 测试
#eval inlineFunction 5
#eval neverInlineFunction 10
#eval hasInlineAttribute
