-- 编码和解码
def base64Encode (s : String) : String :=
  let chars := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  let bytes := s.data.map (fun c => c.toNat)
  let rec encodeBytes (bs : List Nat) : String :=
    match bs with
    | [] => ""
    | b1 :: b2 :: b3 :: rest =>
      let n := (b1 * 65536) + (b2 * 256) + b3
      let c1 := chars.get! (n / 262144)
      let c2 := chars.get! ((n / 4096) % 64)
      let c3 := chars.get! ((n / 64) % 64)
      let c4 := chars.get! (n % 64)
      String.singleton c1 ++ String.singleton c2 ++ String.singleton c3 ++ String.singleton c4 ++ encodeBytes rest
    | b1 :: b2 :: rest =>
      let n := (b1 * 65536) + (b2 * 256)
      let c1 := chars.get! (n / 262144)
      let c2 := chars.get! ((n / 4096) % 64)
      let c3 := chars.get! ((n / 64) % 64)
      String.singleton c1 ++ String.singleton c2 ++ String.singleton c3 ++ "=" ++ encodeBytes rest
    | b1 :: rest =>
      let n := b1 * 65536
      let c1 := chars.get! (n / 262144)
      let c2 := chars.get! ((n / 4096) % 64)
      String.singleton c1 ++ String.singleton c2 ++ "==" ++ encodeBytes rest
  encodeBytes bytes

def hexEncode (s : String) : String :=
  s.data.foldl (fun acc c => acc ++ (c.toNat.toHexStringUpper)) ""

def hexDecode (s : String) : Option String :=
  let chars := s.toList
  let rec decodeChars (cs : List Char) (acc : List Char) : Option (List Char) :=
    match cs with
    | [] => some acc
    | c1 :: c2 :: rest =>
      match (String.singleton c1 ++ String.singleton c2).toNat? 16 with
      | some n => decodeChars rest (acc ++ [Char.ofNat n])
      | none => none
    | _ :: _ => none
  (decodeChars chars []).map (·.asString)

def urlEncode (s : String) : String :=
  s.data.foldl (fun acc c =>
    if c.isAlphanum || c == '-' || c == '_' || c == '.' || c == '~' then
      acc ++ String.singleton c
    else
      acc ++ "%" ++ c.toNat.toHexStringUpper) ""

def urlDecode (s : String) : Option String :=
  let rec decode (cs : List Char) (acc : String) : Option String :=
    match cs with
    | [] => some acc
    | '%' :: c1 :: c2 :: rest =>
      match (String.singleton c1 ++ String.singleton c2).toNat? 16 with
      | some n => decode rest (acc ++ String.singleton (Char.ofNat n))
      | none => none
    | c :: rest => decode rest (acc ++ String.singleton c)
  decode s.data ""

#eval hexEncode "Hello"
#eval urlEncode "Hello World"
