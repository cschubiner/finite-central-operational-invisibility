# Team 1 LCQFT Dynamical-Locality Question

Status: one-page external classification request. This is not a frozen theorem
artifact, not a new LCQFT construction, and not a verifier.

Purpose: ask an LCQFT/dynamical-locality reviewer to classify the precise
positive axiom, if any, that excludes the Team 1 constant finite-center
comparison class.

## Question

Do BFV functoriality, the time-slice axiom, and relative Cauchy evolution
alone exclude a constant finite central extension, or is an additional
positive condition needed, such as extended locality, local definiteness,
indecomposability, center reduction, source faithfulness, or a
center-separating measurement scheme?

Equivalently:

> Which named LCQFT or dynamical-locality axiom is the first one that forbids
> the finite-center extension below?

## Primary-Source Checkpoint

This question is meant to be read against the standard anchors:

- Brunetti-Fredenhagen-Verch locally covariant QFT: a theory is a covariant
  functor from globally hyperbolic spacetimes to unital algebras; the
  time-slice axiom gives relative Cauchy evolution.
- Fewster-Verch dynamical locality: same-physics criteria compare
  kinematical and dynamical local subobjects.
- Fewster-Verch measurement theory: local measurements use a probe, coupling,
  scattering map, and induced system observables; a measurement route separates
  a finite center only if the induced effects distinguish that center.

Team 1 is not claiming a new LCQFT theorem. The issue is whether the standard
LCQFT hypotheses under discussion include a positive center-removal or
center-separation condition.

## Minimal Test Model

Let `A` be a BFV locally covariant theory valued in unital algebras, and let
`Z_q = C^q`. Define

`A_q(M) = A(M) tensor Z_q`,

with morphisms `A_q(psi) = A(psi) tensor id`. For a character
`pi_j : Z_q -> C`, define the quotient-visible natural map

`Q_j,M = id_{A(M)} tensor pi_j : A_q(M) -> A(M)`.

Then:

- functoriality is inherited componentwise;
- if `A` has the time-slice property, so does `A_q`;
- relative Cauchy evolution lifts as `rce_q[h] = rce[h] tensor id`;
- any record factoring through `Q_j` is insensitive to `q`, to nonselected
  central idempotents, and to all central contrasts in `ker(pi_j)`.

If dynamical locality is defined only by equality of kinematical and
RCE-dynamical subobjects, then the constant finite center appears to be
inherited componentwise:

`(A_q)_kin(M;O) = A_kin(M;O) tensor C^q`,

and

`(A_q)_dyn(M;O) = A_dyn(M;O) tensor C^q`.

But if the intended framework assumes extended locality or local definiteness,
then `A_q` with `q > 1` is excluded because every nonempty local algebra
contains the same central copy of `C^q`.

## Desired Classification

A useful response can be only one line:

- `known`: this is standard tensor/direct-sum stability plus quotient
  non-identifiability; cite the theorem.
- `false`: BFV/time-slice/RCE or dynamical locality already forbids `A_q`;
  name the exact axiom or definition.
- `missing hypothesis`: the construction is legal until extended locality,
  local definiteness, center reduction, source faithfulness, or a
  center-separating measurement is added.
- `too broad`: physically admissible LCQFTs always include a condition that
  removes the comparison class; name it.
- `plausibly useful`: the example is elementary but useful as a black-hole/AQFT
  warning about overreading quotient-visible RCE records as finite-center
  accountability.

If the answer is `known`, Team 1 should demote the LCQFT row to the named
theorem. If the answer is `missing hypothesis`, the row can survive only as a
positive-exit boundary: BFV/time-slice/RCE records do not certify hidden finite
central rank unless the center is removed or measured by an additional named
condition.
