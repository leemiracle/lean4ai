-- JSON 表示
inductive Json where
  | null : Json
  | bool : Bool → Json
  | number : Float → Json
  | string : String → Json
  | array : Array Json → Json
  | object : Array (String × Json) → Json
  deriving Repr

def Json.toString : Json → String
  | .null => "null"
  | .bool b => toString b
  | .number n => toString n
  | .string s => s!"\"{s}\""
  | .array arr =>
    let elems := arr.map toString |>.toList
    s!"[{String.intercalate ", " elems}]"
  | .object kvs =>
    let pairs := kvs.map fun (k, v) => s!"\"{k}\": {toString v}" |>.toList
    s!"{{{String.intercalate ", " pairs}}}"

def Json.get? (key : String) : Json → Option Json
  | .object kvs =>
    match kvs.find? (·.1 == key) with
    | some (_, v) => some v
    | none => none
  | _ => none

def Json.getIndex? (idx : Nat) : Json → Option Json
  | .array arr => arr.get? idx
  | _ => none

def Json.isArray : Json → Bool
  | .array _ => true
  | _ => false

def Json.isObject : Json → Bool
  | .object _ => true
  | _ => false

def Json.isNull : Json → Bool
  | .null => true
  | _ => false

def exampleJson : Json :=
  .object #[
    ("name", .string "Alice"),
    ("age", .number 30.0),
    ("active", .bool true),
    ("tags", .array #[.string "lean", .string "programming"]),
    ("address", .object #[
      ("city", .string "Boston"),
      ("zip", .string "02101")
    ])
  ]

#eval Json.toString exampleJson
#eval Json.get? "name" exampleJson
