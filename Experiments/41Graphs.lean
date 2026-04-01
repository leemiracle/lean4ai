-- 图表示
def Graph (α : Type) [BEq α] := List (α × List α)

def Graph.empty : Graph α := []

def Graph.addNode [BEq α] (node : α) (g : Graph α) : Graph α :=
  if g.any (·.1 == node) then g
  else (node, []) :: g

def Graph.addEdge [BEq α] (from to : α) (g : Graph α) : Graph α :=
  g.map fun (n, neighbors) =>
    if n == from then (n, to :: neighbors.filter (· != to))
    else (n, neighbors)

def Graph.neighbors [BEq α] (node : α) (g : Graph α) : List α :=
  match g.find? (·.1 == node) with
  | some (_, ns) => ns
  | none => []

def Graph.nodes (g : Graph α) : List α :=
  g.map (·.1)

def Graph.hasNode [BEq α] (node : α) (g : Graph α) : Bool :=
  g.any (·.1 == node)

def Graph.hasEdge [BEq α] (from to : α) (g : Graph α) : Bool :=
  (Graph.neighbors from g).contains to

def Graph.removeNode [BEq α] (node : α) (g : Graph α) : Graph α :=
  g.filter (·.1 != node) |>.map fun (n, neighbors) =>
    (n, neighbors.filter (· != node))

def exampleGraph : Graph String :=
  let g := Graph.empty
  let g := Graph.addNode "A" g |> Graph.addNode "B" |> Graph.addNode "C" |> Graph.addNode "D"
  let g := Graph.addEdge "A" "B" g |> Graph.addEdge "A" "C" |> Graph.addEdge "B" "D" |> Graph.addEdge "C" "D"
  g

#eval Graph.neighbors "A" exampleGraph
