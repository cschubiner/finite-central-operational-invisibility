# Team 1 Relative-Entropy Central-Face Calibration Note

Status: live referee-facing theorem-boundary note. This is not a frozen
manuscript, Lean archive, or public SHA manifest artifact.

Short TeX/PDF version:
`docs/team1_relative_entropy_central_face_calibration_short_note.tex` /
`docs/team1_relative_entropy_central_face_calibration_short_note.pdf`.

Purpose: isolate the finite-center boundary between:

- relative entropy, recovery, and JLMS/OAQEC comparisons for a supplied
  algebra and state family; and
- the stronger claim that such comparisons also determine an omitted finite
  central trace/area calibration or an absolute entropy representative.

This note is deliberately not a new relative-entropy theorem. The intended
contribution is the black-hole/AQFT reconstruction translation: pairwise
relative entropies detect central probability ratios on the central face that
is actually varied, but they do not determine the affine central entropy term
or trace weights unless absolute central calibration is supplied.

## Primary-Source Pass

This note was written after checking:

- Araki, "Relative entropy of states of von Neumann algebras", Publ. RIMS 11
  (1976), 809-833: relative entropy is defined and monotonic for normal states
  of von Neumann algebras.
- Jafferis-Lewkowycz-Maldacena-Suh, "Relative entropy equals bulk relative
  entropy", `arXiv:1512.06431`: the holographic equality concerns the bulk and
  boundary algebras under discussion.
- Dong-Harlow-Wall, "Reconstruction of bulk operators within the entanglement
  wedge", `arXiv:1601.05416`, and Harlow, "The Ryu-Takayanagi formula from
  quantum error correction", `arXiv:1607.03901`: reconstruction and the
  entropy formula are algebra-relative OAQEC statements.
- Witten, "Gravity and the Crossed Product", `arXiv:2112.12828`, and
  Chandrasekaran-Penington-Witten, "Large N algebras and generalized entropy",
  `arXiv:2209.10454`: black-hole Type II/crossed-product entropy is defined
  for a specified algebra and trace/normalization convention.

These sources are positive anchors. Team 1 should not claim novelty for
relative entropy, JLMS, OAQEC, or crossed-product entropy.

## Finite Central Face Model

Let

```text
Z_m = l^\infty({1,...,m})
```

be a finite central algebra, and let a state on its retained face be a
probability vector `p=(p_i)`. Let a faithful central trace calibration be a
positive vector `a=(a_i)`, so that

```text
tau_a(c) = sum_i a_i c_i .
```

The density of `p` with respect to `tau_a` is `p_i/a_i`. For two probability
vectors `p,r` with common support,

```text
S_{tau_a}(p || r)
  = sum_i p_i log((p_i/a_i)/(r_i/a_i))
  = sum_i p_i log(p_i/r_i).
```

The central trace weights cancel. Therefore pairwise relative entropies on a
fixed retained central face determine probability-ratio information, not the
absolute trace weights `a_i`.

The associated absolute entropy contains the affine central calibration term

```text
H_{tau_a}(p) = -sum_i p_i log(p_i/a_i)
             = H(p) + sum_i p_i log(a_i).
```

Thus an absolute entropy, area, or Newton-denominator coefficient needs data
that fixes the affine functional

```text
p |-> sum_i p_i log(a_i)
```

on the state family being used.

## Proposition: Relative Entropies Do Not Fix Trace Calibration

Fix a finite central face `F` and a state family `P` supported on `F`. Suppose
two trace calibrations `a,b` are both faithful on `F`. Then every pairwise
relative entropy among states in `P` is the same for `tau_a` and `tau_b`.

Consequently relative-entropy equality, by itself, cannot determine the
central trace weights on `F`, the absolute affine entropy term, or any
entropy-density coefficient that depends on that term.

Concrete two-atom witness:

```text
a = (1,3),   b = (2,2),   p = (1/2,1/2).
```

The pairwise relative entropies on the two-atom probability simplex are
unchanged when replacing `a` by `b`, but

```text
H_{tau_a}(p) - H_{tau_b}(p) = (1/2) log(3/4) != 0.
```

So relative entropy can agree while the absolute central entropy
representative differs.

## Positive Criterion: Affine Central Calibration

There is a sharp positive exit. Let `L_a(p)=sum_i p_i log(a_i)`. A supplied
absolute calibration determines the central entropy term on a state family `P`
exactly when it determines the affine functional `L_a` on the affine hull of
`P`.

In particular:

- if `P` contains every central vertex and the calibration gives the absolute
  entropy/area value at each vertex, then every `log(a_i)` is recovered up to
  the common normalization convention;
- if only a proper face is tested, the trace weights outside that face remain
  unconstrained;
- if only entropy differences inside the tested face are required, a common
  shift `log(a_i) -> log(a_i)+c` is invisible and corresponds to the usual
  state-independent additive trace/entropy convention;
- if an absolute entropy-density coefficient is claimed, that common shift must
  be fixed by a matching absolute area, trace, or Newton-constant
  normalization.

This is the standard finite-dimensional affine criterion. It is also the
meaning of the Lean skeleton
`maskedTraceCalibration_reconstruct_iff_supportFull` and
`not_supportFull_maskedTraceCalibration_counterexample` in
`formalization/FiniteCenterSupport.lean`.

## Relation To JLMS/OAQEC

JLMS and OAQEC relative-entropy equalities are powerful positive statements for
the supplied algebra and supplied code/state family. They become a positive
exit from Team 1's finite-center obstruction exactly when the supplied
comparison includes the central face and its absolute calibration.

If the comparison factors through a quotient, selected central character,
declared code algebra, or state family that omits some central vertices, then
relative entropy remains algebra-relative. It does not certify maximality of
the finite center or determine the omitted trace/area calibration.

## Referee Classification

Classify this note as one of:

- `known`: this is standard finite-dimensional relative-entropy and affine
  calibration bookkeeping; cite the exact theorem and demote Team 1 to an
  application note.
- `false`: a standard JLMS/OAQEC/crossed-product hypothesis already fixes the
  finite central affine calibration under Team 1's stated assumptions; name it.
- `missing hypothesis`: relative entropy is algebra-relative, but the intended
  physical setup also supplies full central-face calibration or an absolute
  area/trace convention.
- `plausibly useful`: the mathematics is elementary, but the explicit warning
  about overreading relative entropy as finite-center calibration is useful in
  black-hole/AQFT reconstruction language.

## Consequence For Team 1

Team 1 should not claim a new relative-entropy theorem. The concrete
claim-boundary is:

> Relative entropy and JLMS/OAQEC recovery comparisons determine the
> information present in the supplied algebra and state family. They do not, by
> themselves, determine an omitted finite central trace/area calibration or an
> absolute entropy-density representative. That requires full central-face
> retention plus affine/atomic calibration, or an explicit physical axiom
> excluding the hidden finite center.

That is the relative-entropy central-face calibration row for external
adjudication.
