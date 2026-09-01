/-
Copyright (c) 2026 Dan Clemens Posch. All rights reserved.
Released under the Apache License, Version 2.0; see LICENSE.
Authors: Dan Clemens Posch
-/
import equational_theories.InfModel

/-!
# Proved solution

Comparator matches the identically named declarations in `Challenge.lean`.
The proofs exact `InfModel.Finite.Equation3994_implies_Equation3588` and the
two infinite countermodels in `equational_theories.InfModel`; the remaining
finite direction is the dual of that implication, as in
`InfModel.Equation3588_not_implies_Equation3994`.
-/

namespace AustinPair

abbrev Equation3588 (G : Type*) [Mul G] : Prop :=
  ∀ x y z : G, x * y = z * ((x * y) * z)

abbrev Equation3994 (G : Type*) [Mul G] : Prop :=
  ∀ x y z : G, x * y = (z * (x * y)) * z

theorem finite_equivalence (G : Type*) [Mul G] [Finite G] :
    Equation3994 G ↔ Equation3588 G := by
  letI : Magma G := ⟨(· * ·)⟩
  constructor
  · intro h
    exact InfModel.Finite.Equation3994_implies_Equation3588 G h
  · intro h
    haveI : Finite (Op G) := ‹Finite G›
    have h1 : Equation3994 G ↔ _root_.Equation3588 (Op G) := forall_comm
    have h2 : _root_.Equation3994 (Op G) ↔ Equation3588 G := forall_comm
    exact h1.mpr (InfModel.Finite.Equation3994_implies_Equation3588 (Op G) (h2.mpr h))

theorem not_in_general :
    (∃ (G : Type) (_ : Mul G), Equation3994 G ∧ ¬Equation3588 G) ∧
    (∃ (G : Type) (_ : Mul G), Equation3588 G ∧ ¬Equation3994 G) := by
  constructor
  · obtain ⟨G, inst, h⟩ := InfModel.Equation3994_not_implies_Equation3588
    exact ⟨G, ⟨inst.op⟩, h⟩
  · obtain ⟨G, inst, h⟩ := InfModel.Equation3588_not_implies_Equation3994
    exact ⟨G, ⟨inst.op⟩, h⟩

end AustinPair
