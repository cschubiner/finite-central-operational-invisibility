# Team 1 DHR/DR Sector-Faithfulness Question

Status: one-page external classification request. This is not a frozen theorem
artifact, not a new DHR/DR reconstruction theorem, and not a verifier.

Purpose: ask a DHR/DR or tensor-category reviewer to classify the precise
sector-faithfulness boundary in the Team 1 finite-center package.

## Question

DHR/DR reconstructs from the supplied superselection structure. If finite
central-character fibers have already been forgotten before that structure is
supplied, does any standard DHR/DR hypothesis reconstruct them back?

Equivalently:

> Is faithfulness on finite central-character fibers an additional input, or is
> it forced by the usual DHR/DR reconstruction hypotheses?

## Primary-Source Checkpoint

This question is meant to be read against the standard anchors:

- Doplicher-Haag-Roberts, local observables and particle statistics I/II:
  sectors are the localized representation/superselection data under the DHR
  selection criterion.
- Doplicher-Roberts, new compact-group duality: the categorical duality
  reconstructs compact-group data from a symmetric tensor category.
- Doplicher-Roberts, field algebra with compact gauge group: the field algebra
  and compact gauge group are reconstructed from the superselection structure
  determined by the local observables.

Team 1 is not challenging those theorems. The issue is whether reconstruction
from a supplied category can invert an earlier nonfaithful restriction of that
category.

## Minimal Test Model

Let `A` be a Haag-Kastler net and let `S(A)` be a chosen DHR-type sector
category. For a finite set `F = {1,...,n}`, form the central amplification

`A^(n)(O) = A(O) tensor l^\infty(F)`.

For each sector `pi` of `A` and each minimal central character `chi_i`, define
the amplified sector

`pi_i(a tensor z) = pi(a) chi_i(z)`.

The full character-labeled sector category contains the fiber
`S(A) x F`. But after restricting along the diagonal subnet
`a -> a tensor 1`, all objects `(pi,i)` map to the same restricted sector
`pi`. Thus the restricted supplied category is equivalent to `S(A)` for every
`n`, while the full central-character fiber cardinality is `n`.

So the exact Team 1 boundary is:

- restricted supplied category only: `n`, and in particular `n=2`, is not
  determined;
- full character-labeled category plus projection to the base sector category:
  `n` is the retained fiber cardinality;
- sector-faithful functor, central-character labels, a center-separating
  observable, or a physical exclusion/factor axiom is a positive exit.

## Desired Classification

A useful response can be only one line:

- `known`: this is a standard DHR/DR or tensor-categorical quotient/forgetful
  functor fact; cite the theorem.
- `false`: DHR/DR hypotheses recover central-character fibers even after the
  diagonal restriction; name the hypothesis.
- `missing hypothesis`: reconstruction needs sector-faithfulness/full
  character-fiber retention for this target.
- `too broad`: physically admissible DHR sectors always exclude this
  finite-center comparison class; name the axiom.
- `plausibly useful`: the example is a clean black-hole/AQFT warning about
  overreading sector reconstruction as finite-center maximality.

If the answer is `known`, Team 1 should demote the DHR/DR row to the named
theorem. If the answer is `missing hypothesis` or `plausibly useful`, the row
can survive only as a supplied-category faithfulness boundary, not as a new
DHR/DR theorem.
