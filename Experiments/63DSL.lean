-- 领域特定语言 (DSL)
import Lean

-- 示例 1: SQL 查询 DSL
syntax "SELECT " term "FROM " term "WHERE " term : term

macro_rules
  | `(SELECT $cols:term FROM $table:term WHERE $cond:term) => `(
    let cols := $cols;
    let table := $table;
    let cond := $cond;
    buildQuery cols table cond
  )

def buildQuery (cols table cond : String) : String :=
  s!"SELECT {cols} FROM {table} WHERE {cond}"

-- SQL DSL 执行器
def executeSQL (query : String) : IO (List (String × String)) := do
  IO.println s!"Executing SQL: {query}"
  pure [("id", "1"), ("name", "Alice"), ("age", "30")]

-- 示例 2: HTML 构建 DSL
syntax "html" : term
syntax "tag" term "attr" term "body" term : term
syntax "text" : term

macro_rules
  | `(text $s:term) => `(Html.text $s)
  | `(tag $name:term attr $attrs:term body $children:term) => `(
    Html.tag $name $attrs $children
  )
  | `(html $content:term) => `(Html.document $content)

-- HTML AST
inductive Html where
  | text : String → Html
  | tag : String → List (String × String) → List Html → Html
  | document : Html → Html

def Html.toString : Html → String
  | .text s => s
  | .tag name attrs children =>
    let attrStr := String.intercalate " " (attrs.map fun (k, v) => s!"{k}=\"{v}\"")
    let childStr := String.intercalate "\n" (children.map toString)
    s!"<{name}{if attrStr.isEmpty then "" else " " ++ attrStr}>\n{childStr}\n</{name}>"
  | .document html => toString html

-- HTML DSL 示例
def exampleHTML : Html := html
  tag "div" attr [("class", "container"), ("id", "main")] body [
    tag "h1" attr [] body [text "Welcome"],
    tag "p" attr [] body [text "This is a paragraph"]
  ]

-- 示例 3: JSON 构建 DSL
syntax "json" : term
syntax "json_obj" : term
syntax "json_arr" : term
syntax "json_field" term ":" term : term

macro_rules
  | `(json_obj { $fields:term,* }) => `(Json.object [$fields,*])
  | `(json_arr [ $items:term,* ]) => `(Json.array [$items,*])
  | `(json_field $key:term : $value:term) => `(($key, $value))
  | `(json $j:term) => $j

inductive Json where
  | null : Json
  | bool : Bool → Json
  | number : Float → Json
  | string : String → Json
  | array : List Json → Json
  | object : List (String × Json) → Json

def Json.toString : Json → String
  | .null => "null"
  | .bool b => toString b
  | .number n => toString n
  | .string s => s!"\"{s}\""
  | .array items =>
    let strs := items.map toString
    s!"[{String.intercalate ", " strs}]"
  | .object fields =>
    let pairs := fields.map fun (k, v) => s!"\"{k}\": {toString v}"
    s!"{{{String.intercalate ", " pairs}}}"

def exampleJSON : Json := json
  json_obj {
    json_field "name" : "Alice",
    json_field "age" : 30,
    json_field "active" : true,
    json_field "tags" : json_arr ["lean", "programming"]
  }

-- 示例 4: 配置文件 DSL
syntax "config" : term
syntax "section" term "entries" term : term
syntax "entry" term "=" term : term

macro_rules
  | `(config $sections:term*) => `(Config.fromList [$sections,*])
  | `(section $name:term entries { $entries:term* }) => `(Section.mk $name [$entries,*])
  | `(entry $key:term = $value:term) => `(Entry.mk $key $value)

structure Entry where
  key : String
  value : String

structure Section where
  name : String
  entries : List Entry

structure Config where
  sections : List Section

def Config.toString : Config → String :=
  String.intercalate "\n\n" (sections.map fun s =>
    s!"[{s.name}]\n" ++ String.intercalate "\n" (s.entries.map fun e => s!"{e.key} = {e.value}"))

def exampleConfig : Config := config
  section "database" entries {
    entry "host" = "localhost",
    entry "port" = "5432",
    entry "name" = "mydb"
  }

-- 示例 5: 正则表达式 DSL
syntax "regex" : term
syntax "regex_match" : term
syntax "regex_group" : term
syntax "regex_seq" : term
syntax "regex_alt" : term
syntax "regex_star" : term

macro_rules
  | `(regex_seq $a:term $b:term) => `(Regex.seq $a $b)
  | `(regex_alt $a:term $b:term) => `(Regex.alt $a $b)
  | `(regex_star $a:term) => `(Regex.star $a)
  | `(regex_match $c:term) => `(Regex.char $c)

inductive Regex where
  | epsilon : Regex
  | char : Char → Regex
  | seq : Regex → Regex → Regex
  | alt : Regex → Regex → Regex
  | star : Regex → Regex

def Regex.toString : Regex → String
  | .epsilon => "ε"
  | .char c => s!"{c}"
  | .seq r1 r2 => s!"({toString r1}{toString r2})"
  | .alt r1 r2 => s!"({toString r1}|{toString r2})"
  | .star r => s!"({toString r})*"

def exampleRegex : Regex := regex
  regex_seq (regex_match 'a') (regex_star (regex_match 'b'))

-- 示例 6: 路由 DSL
syntax "route" : term
syntax "get" term "=>" term : term
syntax "post" term "=>" term : term
syntax "put" term "=>" term : term

macro_rules
  | `(get $path:term => $handler:term) => `(Route.get $path $handler)
  | `(post $path:term => $handler:term) => `(Route.post $path $handler)
  | `(put $path:term => $handler:term) => `(Route.put $path $handler)

structure Route where
  method : String
  path : String
  handler : String

def Route.toString : Route → String :=
  s!"{method} {path} => {handler}"

def exampleRoutes : List Route := [
  get "/users" => "listUsers",
  post "/users" => "createUser",
  put "/users/:id" => "updateUser"
]

-- DSL 演示
#eval buildQuery "*" "users" "age > 18"
#eval Html.toString exampleHTML
#eval Json.toString exampleJSON
#eval Config.toString exampleConfig
#eval Regex.toString exampleRegex
