# An Austin pair (Equations 3588 and 3994)

Thin Palomar wrapper of an Austin pair from the
[Equational Theories Project](https://github.com/teorth/equational_theories):
the magma laws

\[
x \diamond y = z \diamond ((x \diamond y) \diamond z)
\quad\text{(Equation 3588)}
\]

and

\[
x \diamond y = (z \diamond (x \diamond y)) \diamond z
\quad\text{(Equation 3994)}
\]

are equivalent on every finite magma, but neither implies the other for
magmas in general. The ETP wiki once writes “3944” for 3994; the Lean
development uses 3994.

This is a Palomar project. Submissions go to
<https://submit.palomar-registry.org/>.

## Repository map

- `Challenge.lean` — audited statements: `finite_equivalence` and
  `not_in_general`. Mathlib-only; the magma operation is `Mul`.
- `Solution.lean` — the same declarations, proved by exacting
  `InfModel.Finite.Equation3994_implies_Equation3588` and the two
  infinite countermodels in `teorth/equational_theories`.
- `comparator.json`, `formalization.yaml` — Palomar metadata.

## Verify

```sh
lake exe cache get
lake build Challenge Solution
```

Lean 4.29.1, matching `teorth/equational_theories` at
`e5a88a1479011ece4aad8e3c2e7e5c0ebc0a5b2a`. Forbidden: `native_decide`,
`Lean.ofReduceBool`. Permitted axioms: `propext`, `Classical.choice`,
`Quot.sound`.
