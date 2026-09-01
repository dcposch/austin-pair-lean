/-
Copyright (c) 2026 Dan Clemens Posch. All rights reserved.
Released under the Apache License, Version 2.0; see LICENSE.
Authors: Dan Clemens Posch
-/
import Mathlib.Data.Finite.Defs

/-!
# An Austin pair (Equations 3588 and 3994)

A magma is a type with a binary operation. Mathlib records that structure as
`Mul`; the Equational Theories Project writes the same operation as `◇`.

**Equation 3588** is the identity
`x * y = z * ((x * y) * z)`.

**Equation 3994** is the identity
`x * y = (z * (x * y)) * z`.

These two laws form an *Austin pair*: they are equivalent on every finite
magma, but neither implies the other for magmas in general. (The ETP wiki
once writes “3944” for 3994; the Lean development uses 3994.)

This file is the audited statement surface. It imports only Mathlib.
-/

namespace AustinPair

/-- Equation 3588: `x ◇ y = z ◇ ((x ◇ y) ◇ z)`. -/
abbrev Equation3588 (G : Type*) [Mul G] : Prop :=
  ∀ x y z : G, x * y = z * ((x * y) * z)

/-- Equation 3994: `x ◇ y = (z ◇ (x ◇ y)) ◇ z`. -/
abbrev Equation3994 (G : Type*) [Mul G] : Prop :=
  ∀ x y z : G, x * y = (z * (x * y)) * z

/-- **Finite implication.** On every finite magma, Equation 3994 is equivalent
to Equation 3588. The two laws are duals, so one finite implication yields the
other. -/
theorem finite_equivalence (G : Type*) [Mul G] [Finite G] :
    Equation3994 G ↔ Equation3588 G := by
  sorry

/-- **Failure in general.** There is a magma satisfying Equation 3994 but not
Equation 3588, and a magma satisfying Equation 3588 but not Equation 3994.
The Equational Theories Project realises both on `ℕ`. -/
theorem not_in_general :
    (∃ (G : Type) (_ : Mul G), Equation3994 G ∧ ¬Equation3588 G) ∧
    (∃ (G : Type) (_ : Mul G), Equation3588 G ∧ ¬Equation3994 G) := by
  sorry

end AustinPair
