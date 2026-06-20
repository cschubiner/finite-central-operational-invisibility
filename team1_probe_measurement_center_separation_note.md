# Team 1 Probe-Measurement Center-Separation Note

Status: live referee-facing theorem-boundary note. This is not a frozen
manuscript or Lean artifact.

Short TeX/PDF version:
`team1_probe_measurement_center_separation_short_note.tex` /
`team1_probe_measurement_center_separation_short_note.pdf`.

Purpose: turn the local measurement/probe adjudication row into a concrete
standard-language test. The target is not a new Fewster-Verch measurement
theorem. The target is the exact boundary between:

- a probe/instrument family whose induced system effects separate the finite
  central contrasts; and
- a measurement formalism, scattering map, or finite adaptive protocol whose
  reported effects still factor through a quotient or retraction that forgets
  some finite central directions.

## Primary-Source Pass

This note was written after checking the standard local-measurement anchors:

- Fewster-Verch, "Quantum fields and local measurements", `arXiv:1810.06512`:
  a system QFT is measured using a probe QFT coupled in a bounded spacetime
  region; the scattering map and probe state determine completely positive
  maps from probe observables to induced system observables, and Davies-Lewis
  instruments describe outcome-conditioned updates.
- Fewster-Verch, "Measurement in Quantum Field Theory", `arXiv:2304.13356`:
  reviews the same local, covariant measurement framework and its causal
  consistency motivation.
- Fewster-Verch, "Dynamical locality and covariance", `arXiv:1106.4785`:
  supplies the LCQFT/dynamical-locality setting in which local physical content
  is compared functorially.
- Mandrysch-Navascues, "Quantum Field Measurements in the Fewster-Verch
  Framework", `arXiv:2411.13605`: stresses that the FV framework is rich enough
  for tomography, while still depending on what probe measurements/effects are
  actually implemented.

## Effect-Span Criterion

Let `Z = l^\infty({1,...,q})` be the finite center of the comparison model and
let

```text
V_q = {x in R^q : sum_i x_i = 0}
```

be its central contrast space. A declared probe-measurement protocol supplies a
family of induced central effects. After restricting to the center, each effect
is a vector `e_alpha in R^q`, and the visible central data are the linear
functionals

```text
x -> <e_alpha, x>.
```

Then a finite-center target `T: V_q -> X` is reconstructible from the supplied
probe data if and only if `T` is constant on the common kernel

```text
N = {x in V_q : <e_alpha, x> = 0 for every supplied induced effect alpha}.
```

In particular, the full finite central state is reconstructible if and only if
the induced effects span `V_q^*`. The predicate `q = 2` is forced only if the
measurement data also determine that the represented contrast space is the
whole physical finite center, not merely a quotient of a larger hidden one.

## Proposition: Atomic Induced Effects Are Centrally Complete

There is a direct positive exit. If the supplied probe-measurement family
contains induced system effects whose restrictions to

```text
Z = l^\infty({1,...,q})
```

are the minimal central projections `e_1,...,e_q`, or any invertible linear
recombination of them modulo the scalar unit, then the protocol reconstructs
the retained finite central state.

For a central state `p = (p_1,...,p_q)`, the probability of the induced effect
`e_i` is exactly `p_i`. Hence the atomic effects recover the whole central
probability vector. Equivalently, the classes of the `e_i` modulo the scalar
unit span the contrast dual `V_q^*`.

This also separates `q=2` from retained nonbinary comparison models, but only
after one more premise: the measured retained center is the whole finite
central target. Without that premise, the measurement has reconstructed a
quotient or retained center, not ruled out a larger hidden one.

## Adaptive Protocol Boundary

Finite adaptive composition does not repair a missing separator by itself. If
every stage of a protocol has induced effects that factor through the same
coarse-graining or central retraction, then all joint outcome probabilities
still factor through that retraction. Hidden central directions in the common
kernel remain unmeasured.

The positive exit is concrete: include a probe preparation/coupling/readout
family whose induced system effects separate the finite central contrasts, or
assume a physical axiom excluding the hidden center. The Fewster-Verch
framework can host such probes, but the framework alone is not the separator;
the separator is the supplied induced observable/effect family.

## Referee Classification

This note should be classified as one of:

- `known`: this is standard Davies-Lewis/instrument tomography in finite
  central notation; cite the exact theorem and demote Team 1 to an application
  note.
- `false`: the Fewster-Verch measurement framework or LCQFT hypotheses already
  imply central separation under weaker assumptions; name the hypothesis.
- `missing hypothesis`: the intended physical setup includes center-separating
  probes, full state tomography, factor-valuedness, or a quotient/exclusion
  axiom.
- `plausibly useful`: the mathematics is elementary, but the explicit warning
  that local measurement formalisms require a central-separating effect family
  before they force finite rank is useful for black-hole/AQFT reconstruction.

## Consequence For Team 1

Team 1 should not claim that the existence of a local probe-measurement
framework alone forces hidden finite central rank or binary rank. The concrete
claim is:

> Probe measurements are a positive route only when the induced system effects
> are informationally complete for the finite central target. If all induced
> effects factor through a quotient or retraction, finite adaptive protocols
> preserve the same blindness and cannot reconstruct hidden central rank or
> `q=2`.

The positive counterpart is equally concrete: induced effects that are atomic
on the retained finite center recover the retained central state, and full
binary-rank accountability additionally requires knowing that this retained
center is the whole finite central target.

That is the local measurement/probe row for external adjudication.
