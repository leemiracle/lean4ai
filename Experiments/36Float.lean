-- Float 计算
def floatAdd (x y : Float) : Float := x + y

def floatSub (x y : Float) : Float := x - y

def floatMul (x y : Float) : Float := x * y

def floatDiv (x y : Float) : Float := x / y

def floatNeg (x : Float) : Float := -x

def floatAbs (x : Float) : Float := Float.abs x

def floatSqrt (x : Float) : Float := Float.sqrt x

def floatPow (x y : Float) : Float := x ^ y

def floatSin (x : Float) : Float := Float.sin x

def floatCos (x : Float) : Float := Float.cos x

def floatTan (x : Float) : Float := Float.tan x

def floatExp (x : Float) : Float := Float.exp x

def floatLog (x : Float) : Float := Float.log x

def floatFloor (x : Float) : Float := Float.floor x

def floatCeil (x : Float) : Float := Float.ceil x

def floatRound (x : Float) : Float := Float.round x

def quadraticRoots (a b c : Float) : Option (Float × Float) :=
  let delta := b * b - 4 * a * c
  if delta < 0 then none
  else
    let sqrtDelta := Float.sqrt delta
    let x1 := (-b + sqrtDelta) / (2 * a)
    let x2 := (-b - sqrtDelta) / (2 * a)
    some (x1, x2)

def distance3D (p1 p2 : Float × Float × Float) : Float :=
  let (x1, y1, z1) := p1
  let (x2, y2, z2) := p2
  Float.sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2 + (z2 - z1) ^ 2)

#eval floatSqrt 16.0
#eval quadraticRoots 1.0 (-5.0) 6.0
#eval distance3D (0.0, 0.0, 0.0) (3.0, 4.0, 0.0)
