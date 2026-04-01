-- 结构体
structure Point where
  x : Float
  y : Float
  deriving Repr

structure Point3D where
  x : Float
  y : Float
  z : Float
  deriving Repr

structure Person where
  name : String
  age : Nat
  deriving Repr

structure Rectangle where
  width : Float
  height : Float
  deriving Repr

structure Circle where
  radius : Float
  deriving Repr

def Point.add (p1 p2 : Point) : Point := ⟨p1.x + p2.x, p1.y + p2.y⟩

def Point.sub (p1 p2 : Point) : Point := ⟨p1.x - p2.x, p1.y - p2.y⟩

def Point.scale (p : Point) (s : Float) : Point := ⟨p.x * s, p.y * s⟩

def Point.distance (p1 p2 : Point) : Float :=
  Float.sqrt ((p2.x - p1.x) ^ 2 + (p2.y - p1.y) ^ 2)

def Rectangle.area (r : Rectangle) : Float := r.width * r.height

def Circle.area (c : Circle) : Float := Float.pi * c.radius ^ 2

def Circle.circumference (c : Circle) : Float := 2 * Float.pi * c.radius

def origin : Point := ⟨0.0, 0.0⟩

def unitCircle : Circle := ⟨1.0⟩

#eval Point.add ⟨1.0, 2.0⟩ ⟨3.0, 4.0⟩
#eval Point.distance ⟨0.0, 0.0⟩ ⟨3.0, 4.0⟩
#eval Rectangle.area ⟨5.0, 10.0⟩
#eval Circle.area unitCircle
