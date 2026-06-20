# Team 1 LCQFT Constant-Center Extension Note

Status: live referee-facing theorem note. This is not a frozen manuscript or
Lean artifact.

Short TeX/PDF version: `team1_lcqft_constant_center_short_note.tex` /
`team1_lcqft_constant_center_short_note.pdf`.

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
- Fewster's overview "The paradigm of local covariance" summarizes the
  relevant definitions as
  `A_kin(M;K)=A(iota_K)(A(M|K))` and
  `A_dyn(M;K)={a in A(M): rce_M[h]a=a for all h supported in K^perp}`.
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

## Proposition: Dynamical-Locality Inheritance

Assume `A` is dynamically local in the Fewster-Verch RCE sense: for each
admissible region `O` in `M`, the kinematic subalgebra

```text
A_kin(M;O) = A(iota_O)(A(M|O))
```

equals the dynamical subalgebra

```text
A_dyn(M;O) = {a in A(M) : rce_M[h](a)=a for all h supported in O^perp}.
```

Then the constant finite-center extension `A_q` is dynamically local in the
same RCE sense, provided the tensor product used in the target algebra category
identifies

```text
A_q(M) = A(M) tensor C^q ~= direct_sum_{j=1}^q A(M).
```

Indeed,

```text
(A_q)_kin(M;O) = A_kin(M;O) tensor C^q
```

by functoriality of the inclusion `iota_O`, while

```text
(A_q)_dyn(M;O) = A_dyn(M;O) tensor C^q
```

because `rce_q[h]=rce[h] tensor id_{C^q}` and a finite tuple
`(a_1,...,a_q)` is fixed by all such lifted RCE maps exactly when every
component `a_j` is fixed by the corresponding RCE map in `A`. Therefore
`A_kin=A_dyn` implies `(A_q)_kin=(A_q)_dyn`.

This proposition is deliberately narrow. It says that the standard
RCE-defined dynamical-locality equality does not by itself remove a constant
finite center. It does not say that every stronger physical admissibility
principle permits the extension.

## Positive Exits That Kill The Extension

The constant finite-center extension is killed by any axiom requiring the
center to be locally absent or experimentally separated. For example:

- **Extended locality:** if two causally disjoint nonempty regions must have
  kinematic algebras intersecting only in scalars, then `A_q` with `q>1`
  fails, because every local algebra contains the common central copy of
  `C^q`.
- **Local definiteness / trivial pointlike center:** if the intersection of
  local algebras shrinking to a point must be only `C`, then `A_q` fails for
  `q>1` for the same reason.
- **Center reduction:** if the theory is required to quotient away the
  nontrivial center, as in reduced Maxwell-type constructions, then the
  comparison class has already supplied the missing physical-exclusion
  premise.
- **Center-separating measurement:** if the probe/scattering/readout scheme is
  tomographically complete on `C^q`, then the data no longer factor through a
  single character `pi_j`; Team 1's quotient-visible non-identifiability
  hypothesis is false.

Thus the exact LCQFT classification question is not whether dynamical locality
is important. It is whether the intended physical setup assumes one of these
positive exits. If yes, Team 1 should demote the LCQFT row to that axiom. If
not, BFV functoriality, time-slice, and quotient-visible RCE still leave the
finite center unidentified.

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
