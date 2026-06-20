# Team 1 Split/Tensor-Factor Boundary Note

Status: live referee-facing theorem-boundary note. This is not a frozen
manuscript or Lean artifact.

Short TeX/PDF version:
`team1_split_tensor_factor_boundary_short_note.tex` /
`team1_split_tensor_factor_boundary_short_note.pdf`.

Purpose: turn the split/tensor-factor adjudication row into a concrete
standard-language test. The target is not a new split-inclusion theorem. The
target is the exact boundary between:

- a genuine split or W*-tensor-product independence hypothesis that makes the
  multiplication map injective; and
- generated-algebra correlations that see only the product algebra and
  therefore reconstruct candidate tensor-product data only modulo the
  multiplication kernel.

## Primary-Source Pass

This note was written after checking the standard split-property anchors:

- Doplicher-Longo, "Standard and split inclusions of von Neumann algebras",
  `Invent. Math. 75 (1984), 493-536`: split inclusions and type-I
  interpolation provide the positive tensor-independence structure.
- Buchholz-Wichmann, "Causal independence and the energy-level density of
  states in local quantum field theory", `Commun. Math. Phys. 106 (1986),
  321-344`: nuclearity/energy-level density conditions are a standard route to
  split independence.
- Werner, "Local preparability of states and the split property in quantum
  field theory", `Lett. Math. Phys. 13 (1987), 325-329`: local preparability
  gives another route to the split property.

## Multiplication-Kernel Criterion

Let `A` and `B` be commuting von Neumann algebras on a Hilbert space, and let
`A vee B` be the von Neumann algebra they generate. Suppose multiplication
extends to a normal representation

```text
mu : A tensorbar B -> A vee B,        mu(a tensor b) = ab.
```

If the supplied bipartite data are generated-algebra correlations

```text
gamma(mu(x)),     gamma in Gamma subset (A vee B)_*,
```

then a candidate spatial tensor-product element `x in A tensorbar B` is
reconstructible from those data if and only if

```text
intersection_{gamma in Gamma} ker(gamma o mu) = {0}.
```

If `Gamma` separates `A vee B`, this is exactly `ker(mu) = 0`. Thus full
generated-algebra tomography reconstructs the unquotiented spatial tensor
product precisely when the multiplication representation is injective.

## Shared-Center Witness

If `A cap B` contains a nontrivial projection `p`, then

```text
p tensor (1-p) != 0 in A tensorbar B,
mu(p tensor (1-p)) = p(1-p) = 0.
```

So generated-algebra data cannot distinguish the zero tensor-product element
from this nonzero kernel direction. The hidden tensor coordinate is not a
function of the generated-algebra record.

## Positive Exits

This is exactly where split theory helps. If the physical hypotheses supply a
split inclusion, type-I interpolation, W*-tensor-product independence, or an
equivalent normal isomorphism

```text
A tensorbar B ~= A vee B,
```

then `mu` is injective and the tensor coordinate is reconstructed by `mu^{-1}`.
Likewise, one may supply extra tests that separate `ker(mu)`, or impose a
quotient/exclusion rule saying that kernel directions are not part of the
target.

## Referee Classification

This note should be classified as one of:

- `known`: this is standard split-inclusion/tensor-product independence
  bookkeeping; cite the exact theorem and demote Team 1 to an application note.
- `false`: generated-algebra correlations reconstruct the unquotiented spatial
  tensor product under weaker accepted hypotheses; name the hypothesis.
- `missing hypothesis`: the intended AQFT setup already assumes split
  independence, type-I interpolation, factor-valuedness, or kernel-separating
  tests.
- `plausibly useful`: the mathematics is elementary, but the explicit warning
  that generated-algebra correlations are quotient data until split/kernel
  separation is supplied is useful for black-hole/AQFT reconstruction.

## Consequence For Team 1

Team 1 should not claim a new split theorem or tensor-independence theorem. The
concrete claim is:

> Split inclusions and W*-tensor-product independence are positive exits. In
> their absence, correlations in the generated algebra reconstruct the
> candidate spatial tensor product only modulo the multiplication kernel, and a
> shared hidden finite center can live inside that kernel.

That is the split/tensor-factor row for external adjudication.
