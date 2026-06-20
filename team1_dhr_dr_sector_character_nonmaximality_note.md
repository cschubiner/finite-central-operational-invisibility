# Team 1 DHR/DR Sector-Character Nonmaximality Note

Status: live referee-facing theorem note. This is not a frozen manuscript or
Lean artifact.

Short TeX/PDF version:
`team1_dhr_dr_sector_character_nonmaximality_short_note.tex` /
`team1_dhr_dr_sector_character_nonmaximality_short_note.pdf`.

Purpose: turn the DHR/Doplicher-Roberts adjudication row into a concrete
standard-language test. The target is not a new DHR/DR reconstruction theorem.
The target is the exact boundary between:

- reconstruction from a supplied superselection sector category; and
- a stronger sector-faithfulness/accountability premise saying the supplied
  category retained finite central-character fibers before reconstruction.

## Primary-Source Pass

This note was written after checking the standard DHR/DR anchors:

- Doplicher-Haag-Roberts, "Fields, observables and gauge transformations I",
  `Commun. Math. Phys. 13 (1969), 1-23`: starts from a field algebra and
  compact gauge group, with observables as gauge invariants.
- Doplicher-Haag-Roberts, "Fields, observables and gauge transformations II",
  `Commun. Math. Phys. 15 (1969), 173-200`: continues the field/observable
  reconstruction framework.
- Doplicher-Haag-Roberts, "Local observables and particle statistics I",
  `Commun. Math. Phys. 23 (1971), 199-230`: defines localized sectors and
  their charge/statistics structure under locality assumptions.
- Doplicher-Haag-Roberts, "Local observables and particle statistics II",
  `Commun. Math. Phys. 35 (1974), 49-85`: develops the superselection-sector
  structure and particle interpretation.
- Doplicher-Roberts, "A new duality theory for compact groups",
  `Invent. Math. 98 (1989), 157-218`: supplies the categorical compact-group
  duality machinery.
- Doplicher-Roberts, "Why there is a field algebra with a compact gauge group
  describing the superselection structure in particle physics",
  `Commun. Math. Phys. 131 (1990), 51-107`: reconstructs the field algebra
  and compact gauge group from the supplied superselection structure.

## Lemma: Diagonal Restriction Forgets Finite Central Characters

Let `A` be a Haag-Kastler net and let `S(A)` be a chosen DHR-type sector
category. For `n >= 2`, form the finite central amplification

```text
A^(n)(O) = A(O) tensor l^\infty({1,...,n})
```

with diagonal subnet `a -> a tensor 1`. For each sector `pi` of `A` and each
minimal central character `chi_i`, define a sector of the amplified net by

```text
pi_i(a tensor z) = pi(a) chi_i(z).
```

The full central-character sector category is the disjoint union of `n` copies
of `S(A)`: same-character intertwiner spaces are the original intertwiner
spaces, and different-character intertwiner spaces vanish. But restriction to
the diagonal subnet sends every `(pi,i)` to the same sector `pi`.

Therefore the diagonal restricted sector datum is not faithful on finite
central-character fibers.

## Quotient-Visible Nonidentifiability

Applying DHR/DR reconstruction to the restricted category reconstructs the
field algebra and compact gauge group associated with that supplied restricted
category. It does not recreate central characters that were identified before
the category was supplied.

For `m,n >= 2`, the restricted sector categories of `A^(m)` and `A^(n)` are
both equivalent to `S(A)`. Thus finite central cardinality, and in particular
the predicate `n=2`, is not an invariant of the restricted DHR/DR input
category.

## Sharp Positive Exit

Let `F:C -> D` be the sector datum actually supplied to reconstruction, such as
restriction to a subnet or the identity on the retained full category. Let
`chi` be the finite central-character label on isomorphism classes in `C`.
Then `chi` is reconstructible from `F` if and only if

```text
F(rho) ~= F(sigma)  implies  chi(rho) = chi(sigma).
```

Equivalently, the supplied sector datum must be faithful on the central-character
fibers. The concrete exits are:

- retain the full amplified sector category `S(A) x {1,...,n}`;
- retain the minimal central projections or central characters;
- add a sector datum injective on the old restricted-sector fiber;
- impose an explicit quotient/factor/inadmissibility axiom excluding the
  finite central amplification.

## Proposition: Full Character Fiber Recovers Cardinality

There is a corresponding positive theorem, not merely a no-go. If the supplied
sector datum retains the full central-character category `S(A) x F`, and also
retains the projection to the base sector category, then the finite central
cardinality is readable as a fiber cardinality.

For any base sector `pi`, the retained fiber

```text
{ rho in Obj(S(A) x F)/isomorphism : rho maps to pi }
```

has exactly `|F|` objects. The representatives are `(pi,i)` for `i in F`;
different characters are nonisomorphic because their intertwiner spaces vanish,
and same-character copies carry the original intertwiner spaces of `S(A)`.
Thus `|F|=2` is reconstructible exactly when this retained fiber has two
objects.

This is the sharp boundary. DHR/DR need not recover forgotten labels if the
category was first diagonally projected, but there is no obstruction once the
character fiber is actually part of the supplied sector datum.

## Referee Classification

This note should be classified as one of:

- `known`: this is standard DHR/DR/categorical reconstruction theory; cite the
  exact theorem and demote Team 1 to an application note.
- `false`: DHR/DR hypotheses already recover central-character fibers even
  after the category supplied to reconstruction has identified them; name the
  hypothesis.
- `missing hypothesis`: sector reconstruction is relative to a supplied
  category, but the intended setup also assumes sector-faithfulness, full field
  algebra, central-character retention, quotienting, or factor-valuedness.
- `plausibly useful`: the mathematics is elementary, but the explicit
  black-hole/AQFT warning about sector-category nonfaithfulness and hidden
  finite central rank is worth a short expository no-go note.

## Consequence For Team 1

Team 1 should not claim a new DHR/DR theorem. The concrete claim is:

> DHR/DR reconstructs from the supplied superselection structure. If finite
> central-character fibers were forgotten before forming that supplied category,
> DHR/DR does not reconstruct them back. Finite central rank, and the predicate
> `n=2`, require a sector-faithful input, a center-separating datum, or an
> exclusion/quotient premise.

The positive counterpart is equally explicit: if the full character-labeled
sector category and its projection to the base sector category are retained,
then finite central rank is just the cardinality of the retained character
fiber.

That is the DHR/DR row for external adjudication.
