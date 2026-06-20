# Team 1 OAQEC/JLMS Algebra-Relative Nonmaximality Note

Status: live referee-facing theorem note. This is not a frozen manuscript or
Lean artifact.

Short TeX/PDF version:
`team1_oaqec_jlms_algebra_relative_nonmaximality_short_note.tex` /
`team1_oaqec_jlms_algebra_relative_nonmaximality_short_note.pdf`.

Purpose: turn the OAQEC/JLMS adjudication row into a concrete standard-language
test. The target is not a new entanglement-wedge reconstruction theorem. The
target is the exact boundary between:

- recovery/relative-entropy equality for a supplied code algebra; and
- a stronger maximality/accountability premise saying the supplied algebra is
  the full logical algebra with no hidden finite central refinement.

## Primary-Source Pass

This note was written after checking the standard holographic/OAQEC anchors:

- Jafferis-Lewkowycz-Maldacena-Suh, "Relative entropy equals bulk relative
  entropy", `arXiv:1512.06431`: relative entropy equality and modular-flow
  statements are made for the bulk algebra/entanglement wedge under discussion.
- Dong-Harlow-Wall, "Reconstruction of bulk operators within the entanglement
  wedge", `arXiv:1601.05416`: entanglement-wedge operators are reconstructed
  in the boundary region when the code/algebraic hypotheses are met.
- Harlow, "The Ryu-Takayanagi formula from quantum error correction",
  `arXiv:1607.03901`: the final theorem is stated in operator-algebra quantum
  error-correction language for a specified finite-dimensional von Neumann
  algebra `M` acting on the code. The algebraic entropy includes the classical
  distribution over the center of that supplied algebra.
- Kamal-Penington, "The Ryu-Takayanagi formula from quantum error correction:
  an algebraic treatment of the boundary CFT", `arXiv:1912.02240`: later
  algebraic treatments emphasize that both boundary and bulk algebras may have
  centers, and formulate reconstruction from a specified boundary algebra.

The question for this note is therefore not whether OAQEC/JLMS reconstructs a
declared algebra. It does. The question is whether reconstructability of that
declared algebra also certifies that the declared algebra is maximal against a
larger finite central direct-sum refinement. If a standard theorem supplies that
maximality implication, Team 1 should cite it and demote this row.

## Lemma: Direct-Sum Algebra-Relative Extension

Let `H_code` be a finite-dimensional code Hilbert space and let
`M subset B(H_code)` be a finite-dimensional von Neumann algebra that is
reconstructable on a boundary region/algebra `A` in the OAQEC sense. Equivalently,
for every `x in M` there is a boundary representative `R_A(x)` with the same
action on the code, and the corresponding state/recovery/relative-entropy
tests are evaluated relative to `M`.

For any `q >= 2`, form the direct-sum code

```text
H_code^(q) = direct_sum_{j=1}^q H_code
```

and the extended algebra

```text
M_q = M tensor C^q ~= direct_sum_{j=1}^q M.
```

If the boundary representation is extended blockwise, then `M_q` is again
reconstructable blockwise: each `(x_1,...,x_q) in M_q` is represented by the
direct sum of the representatives `R_A(x_j)`. The center of `M_q` contains the
new finite classical algebra `C^q`.

Thus algebraic QEC recovery is stable under finite direct sums. Recovery of
`M` does not by itself imply that `M` was maximal as a logical algebra.

## Lemma: Quotient-Visible Nonidentifiability

Let `pi_k : C^q -> C` be a central character and let

```text
Q_k : M_q = M tensor C^q -> M
```

be `id_M tensor pi_k`. Any declared boundary/recovery/JLMS record that factors
through `Q_k` is constant on the nonselected central summands.

Concretely, two elements `(x_1,...,x_q)` and `(y_1,...,y_q)` with
`x_k = y_k` have the same quotient-visible representative, same
quotient-visible recovery task, and same quotient-visible relative-entropy
test, even if their hidden central support, hidden central cardinality, or
nonselected block data differ.

Therefore quotient-visible OAQEC/JLMS data reconstruct the declared algebra or
declared entanglement-wedge target. They do not reconstruct hidden finite
central rank, or the predicate `q=2`, unless the comparison class includes an
additional premise:

- the supplied code algebra is stipulated to be the full logical algebra;
- complementary recovery/maximality identifies the complete algebra;
- all central sectors are included in the state family and entropy comparison;
- a center-separating boundary operation/readout is supplied;
- or a physical exclusion rule removes the finite central extension.

Equivalently, for this finite test model, the implication under review is:

```text
reconstructable supplied algebra M
    does not imply
maximal logical algebra, full hidden finite center, or q=2.
```

The implication becomes valid only after one of the positive exits above is
added to the hypotheses. That is the exact missing-hypothesis question for an
OAQEC/JLMS reviewer.

## Proof Sketch

Finite-dimensional von Neumann algebras are finite direct sums of matrix
algebras. Tensoring with `C^q` simply repeats the algebra in `q` central blocks.
If `x in M` has a boundary representative, then each block component `x_j`
has the corresponding representative. The direct sum of these representatives
represents `(x_1,...,x_q)` on the direct-sum code.

Relative entropy and modular/recovery checks used on a declared block, or
after applying the quotient `Q_k`, depend only on the selected component. They
cannot distinguish changes in nonselected central components. Hence hidden
finite central rank is not a function of the quotient-visible OAQEC/JLMS data.

## Proposition: Central-Sector Entropy Is A Positive Exit

The quotient-visible obstruction disappears if the JLMS/OAQEC comparison
includes the full central-sector probability distribution.

Let `rho,sigma` be block-diagonal states on

```text
M_q ~= direct_sum_{j=1}^q M
```

written as

```text
rho   = direct_sum_j p_j rho_j,
sigma = direct_sum_j r_j sigma_j,
```

where `p,r` are probability vectors and `rho_j,sigma_j` are normalized states
on the `j`th copy of `M`. If `supp rho subset supp sigma`, then

```text
S(rho || sigma)
  = D(p || r) + sum_{j:p_j>0} p_j S(rho_j || sigma_j),
```

where

```text
D(p || r) = sum_{j:p_j>0} p_j log(p_j/r_j).
```

This is just the standard direct-sum formula for relative entropy: the
logarithm and trace split blockwise. The first term is the classical relative
entropy of the central-sector distributions. Therefore a state family or JLMS
comparison that varies the full central distribution no longer factors through
a single character `Q_k`; it detects the finite center through `D(p||r)`.

This is a positive exit, not a contradiction of the nonmaximality lemma. The
Team 1 obstruction applies to quotient-selected or algebra-relative records
that have already discarded the central distribution. If the intended
holographic setup includes all central sectors and their probabilities in the
bulk/boundary relative-entropy comparison, finite-center accountability has
been supplied.

This also gives the clean demotion criterion. If the cited OAQEC/JLMS theorem
is being invoked with the full central-sector state family and a maximal
logical algebra as part of its hypotheses, Team 1's hidden-center comparison is
outside that theorem's intended setup. Team 1 should then record the exact
maximality/full-center hypothesis and demote the row to that named positive
exit.

## Referee Classification

This note should be classified as one of:

- `known`: this is standard finite-dimensional OAQEC/direct-sum algebra
  theory; cite the exact theorem and demote Team 1 to an application note.
- `false`: a standard OAQEC/JLMS hypothesis already makes the supplied algebra
  maximal and forbids the extension above; name the hypothesis.
- `missing hypothesis`: recovery is relative to the supplied algebra, but the
  intended holographic setup also assumes full-code-algebra maximality,
  complementary recovery, center separation, or a physical exclusion rule.
- `plausibly useful`: the mathematics is elementary, but the explicit
  black-hole/AQFT warning about algebra-relative reconstruction and hidden
  finite central rank is worth a short expository no-go note.

## Consequence For Team 1

Team 1 should not claim a new JLMS/OAQEC theorem. The concrete claim is:

> Algebra-relative recovery and relative-entropy equality reconstruct the
> declared algebra. They do not certify that the declared algebra is maximal
> against hidden finite central direct-sum refinements unless maximality,
> complementary recovery, center separation, or physical exclusion is part of
> the hypothesis.

That is the OAQEC/JLMS row for external adjudication.
