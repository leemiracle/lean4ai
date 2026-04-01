-- Map 和字典
def Map (κ ν : Type) [BEq κ] := List (κ × ν)

def Map.empty : Map κ ν := []

def Map.singleton (k : κ) (v : ν) : Map κ ν := [(k, v)]

def Map.insert [BEq κ] (k : κ) (v : ν) (m : Map κ ν) : Map κ ν :=
  (k, v) :: m.filter (·.1 != k)

def Map.lookup [BEq κ] (k : κ) (m : Map κ ν) : Option ν :=
  match m.find? (·.1 == k) with
  | some (_, v) => some v
  | none => none

def Map.delete [BEq κ] (k : κ) (m : Map κ ν) : Map κ ν :=
  m.filter (·.1 != k)

def Map.member [BEq κ] (k : κ) (m : Map κ ν) : Bool :=
  m.any (·.1 == k)

def Map.keys (m : Map κ ν) : List κ :=
  m.map (·.1)

def Map.values (m : Map κ ν) : List ν :=
  m.map (·.2)

def Map.toList (m : Map κ ν) : List (κ × ν) := m

def Map.fromList [BEq κ] (xs : List (κ × ν)) : Map κ ν :=
  xs.foldl (fun acc (k, v) => Map.insert k v acc) []

def Map.map [BEq κ] (f : ν → ν') (m : Map κ ν) : Map κ ν' :=
  m.map fun (k, v) => (k, f v)

def Map.filterKeys [BEq κ] (p : κ → Bool) (m : Map κ ν) : Map κ ν :=
  m.filter (p ·.1)

def Map.filterValues (p : ν → Bool) (m : Map κ ν) : Map κ ν :=
  m.filter (p ·.2)

#eval Map.lookup "b" (Map.insert "a" 1 (Map.insert "b" 2 Map.empty))
