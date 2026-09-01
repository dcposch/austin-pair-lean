# Adapting this wrapper

This repository is a Palomar thin wrapper of
`teorth/equational_theories`. The compared statements are in
`Challenge.lean`; the proofs in `Solution.lean` exact upstream theorems.

Keep `Challenge.lean` Mathlib-only. Do not import `equational_theories`
from the Challenge. Pin the Equational Theories Project at a full
40-character commit SHA in `lakefile.toml` and
`formalization.yaml`.

Submissions go to <https://submit.palomar-registry.org/>.
