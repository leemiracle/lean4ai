-- 反射和元数据
macro "getType" t:term : term => `(typeCheck $t)

def reflectNat : Nat := 42

def reflectString : String := "hello"

def reflectBool : Bool := true

def reflectList : List Nat := [1, 2, 3]

def reflectPair : Nat × String := (42, "answer")

#check reflectNat
#check reflectString
#check reflectBool
#check reflectList
#check reflectPair

def describeType (α : Type) : String :=
  match α with
  | _ => "some type"

macro "typeName" t:term : term => `(quote $(⟨t.raw⟩.getId))

#check Nat
#check String
#check Bool
#check List
