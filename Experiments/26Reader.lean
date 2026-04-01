-- Reader 单子
def Reader (ρ α : Type) := ρ → α

def Reader.pure (x : α) : Reader ρ α := fun _ => x

def Reader.bind (ma : Reader ρ α) (f : α → Reader ρ β) : Reader ρ β :=
  fun r => f (ma r) r

def Reader.ask : Reader ρ ρ := fun r => r

def Reader.asks (f : ρ → α) : Reader ρ α := fun r => f r

def Reader.local (f : ρ → ρ) (ma : Reader ρ α) : Reader ρ α :=
  fun r => ma (f r)

def Reader.run (ma : Reader ρ α) (r : ρ) : α := ma r

structure Config where
  host : String
  port : Nat
  debug : Bool
  deriving Repr

def configExample : Reader Config String := do
  let cfg ← Reader.ask
  let host ← Reader.asks (·.host)
  pure s!"Connecting to {host}:{cfg.port}"

def configWithDebug : Reader Config String := do
  let msg ← Reader.local (fun cfg => {cfg with debug := true}) configExample
  pure s!"[DEBUG] {msg}"

#eval Reader.run configExample {host := "localhost", port := 8080, debug := false}
#eval Reader.run configWithDebug {host := "api.example.com", port := 443, debug := false}
