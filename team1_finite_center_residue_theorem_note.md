# Team 1 Finite-Center Residue Theorem Note

Status: live referee-facing theorem note. This is not a frozen theorem artifact
and does not modify either Team 1 manuscript, Lean archive, public mirror, or
SHA manifest.

Standalone TeX/PDF review version:
`team1_finite_center_residue_short_note.tex` /
`team1_finite_center_residue_short_note.pdf`.

Purpose: isolate the smallest standard-language theorem residue that external
reviewers should classify. The point is to make the possible contribution easy
to demote, kill, or preserve.

## Standard Facts To Concede

Team 1 should concede the following before claiming novelty:

1. If `M` is a von Neumann algebra and `I` is an ultraweakly closed two-sided
   `*`-ideal, then `I = zM` for a central projection `z`, and
   `M/I ~= (1-z)M`. Thus ordinary normal quotients are already controlled by
   central projections.
2. Split inclusions, type-I interpolation, and tensor-factor separation are
   standard positive hypotheses, not Team 1 inventions.
3. Blackwell/Petz-style sufficiency and recovery are relative to declared
   experiments, channels, or subalgebras.
4. LCQFT, dynamical locality, DHR/DR, JLMS/OAQEC, crossed-product entropy, and
   discrete spectroscopy reconstruct or measure objects supplied by their own
   hypotheses; Team 1 does not claim new theorems in those subjects.

## Residue Lemma To Classify

Let `A` be a von Neumann algebra representing the supplied observable data.
For a finite set `F` with `|F| = q`, let

```text
    Ahat_q = A direct_sum (N tensor_bar ell_infty(F))
```

with normal quotient `pi_q : Ahat_q -> A` that is the identity on `A` and
annihilates the finite central summand. Let `D` be any record built only from
normal states, effects, channels, sector labels, recovery maps, modular data,
or entropy quantities after applying `pi_q`, so that `D` is constant on the
kernel fiber.

Then no rule whose input is only `D` can determine any target not constant on
the family of completions `Ahat_q`, including:

- whether the represented algebra was ambient-faithful;
- the nonzero finite central support in the hidden summand;
- the finite central cardinality `q`;
- the predicate `q = 2`;
- unquotiented tensor coordinates in the hidden central summand;
- an absolute finite-center entropy calibration attached to that summand.

Equivalently, those targets become determinate only after adding a positive
datum that separates, excludes, calibrates, or directly measures the hidden
finite central directions.

## Proof Skeleton

The proof is the elementary fiber argument.

1. By the central-projection quotient theorem, the kernel of `pi_q` is a normal
   central summand.
2. Any supplied record `D` that factors through `pi_q` is identical for all
   completions that share the same quotient `A`.
3. The listed targets vary across those completions: choose `q=2` and `q=3`,
   or vary the hidden central support, hidden tensor coordinate, or additive
   entropy calibration while keeping the quotient fixed.
4. Therefore a reconstruction rule from `D` alone would assign the same answer
   to completions on which the target differs, contradiction.
5. A positive route must break the fiber symmetry by adding a separator,
   source/readout-accountability condition, physical exclusion, null/gauge
   identification, calibration, finite-alphabet law, or direct measurement
   channel.

## Explicit Binary-Quotient Counterexample

The binary-rank warning has a completely finite counterexample. Let

```text
    Z_3 = ell_infty({0,1,2}),      V_3 = Z_3 / C1.
```

Define the pooled binary readout

```text
    R_3([x0,x1,x2]) = x0 - (x1+x2)/2.
```

Then `rank R_3 = 1`, but `dim V_3 = 2` and `[0,1,-1]` lies in `ker R_3`.
The readout sees the binary contrast "atom 0 versus the pooled pair {1,2}",
but it does not see the hidden split between atoms 1 and 2.

Equivalently, central probability vectors are sent by

```text
    (p0,p1,p2) |-> (p0, p1+p2).
```

Every record depending only on this pooled binary datum agrees with a genuine
two-atom center. Thus the accounted contrast rank is one in both cases, while
the hidden finite central cardinality is `q=2` in one model and `q=3` in the
other. A binary quotient is not a binary center; `q=2` follows only after an
extra maximality, admissibility, finite-alphabet, or direct-measurement premise
identifies the accounted quotient as the full physical center.

## Exact Reviewer Question

Is this residue:

- just the central-projection quotient theorem plus elementary functoriality;
- a known Blackwell/Petz/statistical-sufficiency corollary;
- false because a standard AQFT/OAQEC/sector hypothesis already supplies
  maximality or excludes the hidden central summand;
- too broad physically because the comparison class is never admissible in the
  intended setting;
- or a useful finite-center no-go corollary worth writing as an expository
  black-hole/AQFT reconstruction boundary?

## What Would Count As Progress

Progress is not another local verifier. Progress is a written classification
of the residue lemma above, with theorem name, counterexample, missing
hypothesis, or clear statement that the finite-center corollary is not already
standard in the reviewer's lane.

## Primary Anchors

- Von Neumann algebra quotient/ideal theory: ultraweakly closed ideals are
  central-projection summands.
- Doplicher-Longo split inclusions: split/tensor separation is a positive
  hypothesis.
- Brunetti-Fredenhagen-Verch LCQFT and Fewster-Verch dynamical locality:
  functorial/RCE/dynamical-locality structure is supplied theory data.
- Doplicher-Roberts reconstruction: sector reconstruction is relative to the
  supplied superselection structure.
- JLMS/Dong-Harlow-Wall/Harlow: recovery is relative to a specified code
  algebra or wedge.
- Blackwell/Petz: sufficiency and recovery are relative to a declared
  experiment/channel/subalgebra.
- Witten crossed product: black-hole-state entropy is well-defined up to a
  state-independent additive constant in the crossed-product setting.
- Bekenstein-Mukhanov spectroscopy: a finite alphabet can be supplied by direct
  spectral measurement rather than inferred from quotient-visible entropy.
