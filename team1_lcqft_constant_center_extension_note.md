# Team 1 LCQFT Constant-Center Extension Note

Status: live referee-facing theorem note. This is not a frozen manuscript or
Lean artifact.

Purpose: turn the LCQFT/dynamical-locality adjudication row into a concrete
standard-language test. The target is not a new LCQFT construction. The target
is a precise finite-center countermodel family showing which positive
hypothesis is needed before quotient-visible LCQFT/RCE data can exclude hidden
finite central rank.

## Primary-Source Pass

This note was written after checking the standard LCQFT and dynamical-locality
anchors:

- Brunetti-Fredenhagen-Verch, "The generally covariant locality principle",
  `arXiv:math-ph/0112041`: locally covariant QFTs are functors from globally
  hyperbolic spacetimes to unital *-algebras, and the time-slice axiom gives
  relative Cauchy evolution.
- Fewster-Verch, "Dynamical locality and covariance", `arXiv:1106.4785`:
  dynamical locality identifies kinematical and dynamical local subobjects and
  gives a strong same-physics criterion.
- Fewster-Verch, "Quantum fields and local measurements", `arXiv:1810.06512`,
  and "Measurement in Quantum Field Theory", `arXiv:2304.13356`: measurement
  in LCQFT is implemented through a probe, coupling, and scattering map; a
  measurement route distinguishes a finite center only if the probe/readout is
  separating for that center.
- Fewster-Lang, "Dynamical locality of the free Maxwell field",
  `arXiv:1401.1871`: nontrivial centers can be the obstruction in concrete
  LCQFT examples. This is a warning not to say "dynamical locality never sees
  centers"; the correct claim is conditional on which local-definiteness,
  extended-locality, or center-reduction axiom is included.

## Lemma: Constant Finite-Center Extension

Let `A` be a BFV locally covariant theory valued in unital *-algebras. Let
`Z_q = C^q` be a finite-dimensional commutative algebra, and define

```text
A_q(M) = A(M) tensor Z_q,
A_q(psi) = A(psi) tensor id_{Z_q}
```

for every spacetime `M` and admissible embedding `psi`. Let
`pi_j : Z_q -> C` be any character and define the quotient-visible natural
map

```text
Q_j,M = id_{A(M)} tensor pi_j : A_q(M) -> A(M).
```

Then:

1. If `A` is a BFV functor with injective morphisms, so is `A_q`.
2. If `A` obeys the time-slice axiom, so does `A_q`.
3. Relative Cauchy evolution lifts as
   `rce_q[h] = rce[h] tensor id_{Z_q}`.
4. Any record that factors through `Q_j` is insensitive to `q`, to all
   nonselected central idempotents, and to all nonconstant central contrasts.
5. Therefore quotient-visible LCQFT/RCE data do not reconstruct hidden finite
   central cardinality or `q=2` unless an additional premise supplies
   center-accountability, physical exclusion, local definiteness, extended
   locality, center reduction, or a center-separating measurement channel.

If the chosen definition of dynamical locality is formulated so that the
kinematic and dynamic local subobjects of `A_q` are exactly the corresponding
subobjects of `A` tensored with `Z_q`, then dynamical locality is inherited
from `A`. If the adopted physical framework also requires extended locality,
local definiteness, trivial local centers, or a reduced Maxwell-type quotient,
then those assumptions are precisely the positive exits that kill the constant
finite-center extension.

## Proof

Functoriality is componentwise. Composition and identities are preserved
because tensoring with `id_{Z_q}` changes neither.

Injectivity is preserved because `A(psi)` is injective and tensoring with the
finite-dimensional algebra `Z_q` is exact in this finite setting.

For a Cauchy morphism `psi`, `A(psi)` is an isomorphism by the time-slice axiom,
so `A(psi) tensor id_{Z_q}` is also an isomorphism. Hence `A_q` obeys
time-slice.

The BFV relative Cauchy evolution is built from the time-slice isomorphisms
associated with a metric perturbation. Every map in the defining zig-zag is
tensored with `id_{Z_q}` in `A_q`, so the resulting automorphism is
`rce[h] tensor id_{Z_q}`.

Finally, if a record `R_q` factors as `R o Q_j`, then for any `a in A(M)` and
any two central elements `z,z' in Z_q` with `pi_j(z)=pi_j(z')`, one has

```text
R_q(a tensor z) = R(a pi_j(z)) = R(a pi_j(z')) = R_q(a tensor z').
```

Thus the entire kernel of `pi_j` is operationally invisible to that record.
Changing `q`, or changing the hidden finite center while preserving the
selected character, leaves the quotient-visible record unchanged.

## Referee Classification

This lemma should be classified as one of:

- `known`: standard tensor/direct-sum stability of LCQFT plus quotient
  non-identifiability; cite the exact source and demote Team 1 to an
  application note.
- `false`: the adopted definition of dynamical locality, local covariance, or
  admissible LCQFT already forbids the extension above; name the axiom.
- `missing hypothesis`: the extension is legal under BFV/time-slice/RCE but is
  killed by extended locality, local definiteness, center reduction,
  indecomposability, or a center-separating probe.
- `plausibly useful`: the elementary construction is standard but the explicit
  black-hole/AQFT warning about quotient-visible finite central rank is worth
  a short expository no-go note.

## Consequence For Team 1

The Team 1 claim should not be that dynamical locality is irrelevant. The
claim should be:

> BFV functoriality, time-slice, and quotient-visible RCE records alone do not
> supply finite-center accountability. A positive theorem must add the exact
> axiom that removes or measures the finite center.

That is the concrete LCQFT row for external adjudication.
