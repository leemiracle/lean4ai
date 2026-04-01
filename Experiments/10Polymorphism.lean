-- 多态和泛型
def id' (x : α) : α := x

def const' (x : α) : β → α := fun _ => x

def flip' (f : α → β → γ) : β → α → γ := fun b a => f a b

def compose'' (f : β → γ) (g : α → β) : α → γ := fun x => f (g x)

def curry' (f : α × β → γ) : α → β → γ := fun a b => f (a, b)

def uncurry' (f : α → β → γ) : α × β → γ := fun (a, b) => f a b

def fst (p : α × β) : α := p.1

def snd (p : α × β) : β := p.2

def swap (p : α × β) : β × α := (p.2, p.1)

def pair (x : α) (y : β) : α × β := (x, y)

def first (f : α → γ) (p : α × β) : γ × β := (f p.1, p.2)

def second (f : β → γ) (p : α × β) : α × γ := (p.1, f p.2)

def both (f : α → β) (p : α × α) : β × β := (f p.1, f p.2)

#eval id' 42
#eval swap (1, "hello")
#eval first String.length ("hello", 42)
