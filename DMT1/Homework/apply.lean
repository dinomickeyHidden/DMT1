set_option linter.unusedVariables false

def zero {α : Type} : (α → α) → α → α
| f, a => a

def one {α : Type} : (α → α) → α → α
| f, a => (f a)

def two {α : Type} : (α → α) → α → α
| f, a => f (f a)

def three {α : Type} : (α → α) → α → α
| f, a => f (f (f a) )

def four {α : Type} : (α → α) → α → α
| f, a => f (f (f (f a)))

#check three
#check (@three Nat)
#reduce @two Nat

def inc (n : Nat) := n + 1
#eval zero inc 0
#eval one inc 0
#eval two inc 0
#eval three inc 0
#eval three inc (two inc 0)

#reduce ((@two Nat) ∘ (@three Nat))

--study lamba calculus

def whatIsThis := ((@three Nat inc) ∘ (@four Nat inc))
#reduce whatIsThis 0

theorem refl {P : Prop} : P → P := (fun p  => p)