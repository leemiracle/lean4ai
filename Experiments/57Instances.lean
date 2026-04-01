-- 实例优先级和重叠
class Show (α : Type) where
  show : α → String

instance : Show Nat where
  show := toString

instance : Show Int where
  show := toString

instance : Show Bool where
  show := toString

instance : Show String where
  show := id

instance [Show α] : Show (List α) where
  show xs := "[" ++ String.intercalate ", " (xs.map Show.show) ++ "]"

instance [Show α] [Show β] : Show (α × β) where
  show p := "(" ++ Show.show p.1 ++ ", " ++ Show.show p.2 ++ ")"

instance [Show α] : Show (Option α) where
  show
    | none => "None"
    | some x => "Some(" ++ Show.show x ++ ")"

instance [Show α] [Show β] : Show (Sum α β) where
  show
    | .inl x => "Inl(" ++ Show.show x ++ ")"
    | .inr y => "Inr(" ++ Show.show y ++ ")"

def showExample1 : String := Show.show [1, 2, 3]
def showExample2 : String := Show.show (some 42)
def showExample3 : String := Show.show (1, "hello")

#eval showExample1
#eval showExample2
