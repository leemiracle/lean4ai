-- 哈希函数
def djb2Hash (s : String) : Nat :=
  s.data.foldl (fun acc c => ((acc * 33) + c.toNat) % (2^64)) 5381

def sdbmHash (s : String) : Nat :=
  s.data.foldl (fun acc c =>
    let n := c.toNat
    (n + (acc * 65599) + (acc * 65599 * 256)) % (2^64)) 0

def fnv1Hash (s : String) : Nat :=
  let offsetBasis := 2166136261
  let prime := 16777619
  s.data.foldl (fun acc c =>
    ((acc * prime) % (2^32) ^^^ c.toNat) % (2^32)) offsetBasis

def jenkinsHash (s : String) : Nat :=
  let rec aux (cs : List Char) (hash : Nat) : Nat :=
    match cs with
    | [] => hash
    | c :: rest =>
      let hash := hash + c.toNat
      let hash := hash + (hash * 1024) % (2^32)
      let hash := hash ^^^ (hash / 4096)
      aux rest hash
  let hash := aux s.data 0
  let hash := hash + (hash * 8192) % (2^32)
  let hash := hash ^^^ (hash / 2048)
  let hash := hash + (hash * 32768) % (2^32)
  let hash := hash ^^^ (hash / 16)
  hash % (2^32)

def crc32Hash (s : String) : Nat :=
  let table := (List.range 256).map fun i =>
    (List.range 8).foldl (fun acc _ =>
      if acc % 2 = 1 then (acc / 2) ^^^ 0xEDB88320
      else acc / 2) i
  let init := 0xFFFFFFFF
  let crc := s.data.foldl (fun acc c =>
    let index := (acc ^^^ c.toNat) % 256
    (acc / 256) ^^^ (table.getD index 0)) init
  (crc ^^^ 0xFFFFFFFF) % (2^32)

#eval djb2Hash "hello"
#eval sdbmHash "world"
#eval fnv1Hash "test"
