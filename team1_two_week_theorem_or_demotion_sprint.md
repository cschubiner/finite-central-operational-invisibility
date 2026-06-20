# Team 1 Two-Week Theorem-Or-Demotion Sprint

Status: live frontier-work directive. This is not a verifier, certificate, or
frozen package artifact. It is the work queue for converting Team 1 from an
internally coherent finite-center package into either a referee-grade theorem
note, a cited demotion, or a killed route.

Date: 2026-06-20.

## Purpose

Team 1's current strongest honest claim is not a new operator-algebra theorem.
It is a reconstruction-boundary claim:

> Standard black-hole/AQFT reconstruction inputs reconstruct the quotient,
> functor, sector category, code algebra, channel, entropy normalization,
> generated algebra, or spectral law supplied in their hypotheses. They do not
> automatically certify maximality against hidden finite central refinements.
> Hidden finite support, finite central rank, tensor coordinates, central
> character labels, finite-center entropy calibration, or binary `q=2` require
> the corresponding separator, maximality, split/kernel-separation,
> source/readout accountability, physical exclusion, finite-alphabet law, or
> direct measurement premise.

The next two weeks should decide whether that paragraph is:

1. a known theorem package to cite and demote;
2. false or physically too broad;
3. missing one named positive hypothesis;
4. or a useful black-hole/AQFT boundary note worth external submission.

Anything that does not move one of those four outcomes is not Team 1 frontier
progress.

## Primary-Source Pass For This Sprint

The following sources are the current kill/demotion anchors. Before changing a
theorem row, recheck the relevant paper and quote the exact hypothesis being
used.

| Lane | Primary source to use first | What Team 1 must not claim | What remains to decide |
| --- | --- | --- | --- |
| LCQFT/RCE | Brunetti-Fredenhagen-Verch, `arXiv:math-ph/0112041` | No new LCQFT functor or relative-Cauchy-evolution construction. | Whether BFV/time-slice/RCE alone excludes hidden finite centers, or whether local definiteness/extended locality/source faithfulness is an extra positive exit. |
| Dynamical locality | Fewster-Verch, `arXiv:1106.4785` | No new same-physics criterion. | Whether the intended Team 1 setting assumes a condition strong enough to kill the constant finite-center comparison class. |
| DHR/DR sectors | Doplicher-Roberts, `Commun. Math. Phys. 131 (1990), 51-107` | No new field-algebra or compact-gauge reconstruction theorem. | Whether omitted finite central-character fibers can be recovered from a supplied category that already forgot them. |
| OAQEC/JLMS | JLMS `arXiv:1512.06431`; Dong-Harlow-Wall `arXiv:1601.05416`; Harlow `arXiv:1607.03901` | No new entanglement-wedge or algebraic-QEC reconstruction theorem. | Whether recovery/relative entropy implies maximality of the supplied logical algebra or only reconstruction inside that algebra. |
| Sufficiency/recovery | Blackwell 1953; Le Cam 1964; Petz 1986; Shmaya 2005; Buscemi 2012 | No novelty for the finite quotient/accountability theorem itself. | Whether the black-hole/AQFT translation is useful enough to publish as an application note. |
| Entropy calibration | Witten, `arXiv:2112.12828` | No new gravitational crossed-product entropy theorem. | Whether the construction fixes the same finite central trace/area calibration Team 1 isolates, or leaves it as an extra normalization. |
| Spectroscopy | Bekenstein-Mukhanov, `arXiv:gr-qc/9505012` | No entropy-only derivation of binary rank. | Whether an accepted finite-alphabet or resolved-line premise supplies `q=2`; otherwise binary remains an extra measurement/dynamics input. |

## Deliverable 1: LCQFT Positive-Exit Theorem Or Demotion

Target file:
`team1_lcqft_constant_center_extension_note.md`.

Referee-grade theorem target:

> BFV functoriality, time-slice, and RCE are stable under constant finite
> central direct-sum extension, but extended locality/local definiteness kill
> that extension for `q>1` because the same central copy lies in every nonempty
> local algebra.

This is useful only if written as a theorem-or-demotion statement:

- If Fewster-Verch-style dynamical locality plus the target's background
  axioms already include extended locality/local definiteness/center reduction,
  demote Team 1's LCQFT row to that named axiom.
- If not, the constant-center extension is the clean countermodel showing that
  quotient-visible BFV/RCE records alone do not force finite-center
  accountability.

Work to do:

1. Turn the current note into a compact proposition with hypotheses,
   conclusion, and proof in LCQFT notation.
2. Ask an LCQFT/dynamical-locality expert to classify exactly which axiom, if
   any, forbids the construction.
3. Record the answer as `known`, `false`, `missing hypothesis`, `too broad`, or
   `plausibly useful`.

Success in two weeks is not a green build. It is a theorem name, missing axiom,
or written expert verdict.

## Deliverable 2: OAQEC/JLMS Maximality Boundary

Target file:
`team1_oaqec_jlms_algebra_relative_nonmaximality_note.md`.

Referee-grade theorem target:

> OAQEC/JLMS recovery and relative-entropy equality are algebra-relative. A
> finite direct-sum extension preserves recovery blockwise, and a
> quotient-selected record forgets nonselected central blocks. Therefore hidden
> finite central rank is not certified unless full logical-algebra maximality,
> complementary recovery, full central-sector entropy data, center separation,
> or physical exclusion is supplied.

This row is promising because it sits closest to black-hole reconstruction
language. It is also easy to overclaim, so the sprint must make the positive
exit explicit:

- full central-sector probability data is a positive exit via the direct-sum
  relative-entropy formula;
- quotient-selected recovery data is the negative case;
- full-code-algebra maximality, if standard in the intended theorem, demotes
  the row immediately.

Work to do:

1. Rewrite the note's proposition so the negative case and positive exit share
   the same direct-sum notation.
2. Check Harlow's OAQEC theorem statement and Dong-Harlow-Wall/JLMS hypotheses
   for an explicit maximality premise.
3. Send the compact note to an OAQEC/JLMS reviewer asking only:
   "Does algebra-relative reconstruction imply maximality here, or is
   maximality an extra hypothesis?"

Success in two weeks is a named maximality theorem, a missing-hypothesis
classification, or permission to frame the row as an expository no-go.

## Deliverable 3: DHR/DR Sector-Faithfulness Boundary

Target file:
`team1_dhr_dr_sector_faithfulness_question.md`, with details in
`team1_dhr_dr_sector_character_nonmaximality_note.md`.

Referee-grade theorem target:

> DHR/DR reconstructs from the supplied superselection category. If a diagonal
> restriction identifies finite central-character fibers before the category is
> supplied, reconstruction of the restricted category cannot recover the
> forgotten fiber cardinality. If the full character-labeled category and its
> projection to the base category are retained, the finite cardinality is the
> retained fiber size.

This row should be pushed only as a supplied-category faithfulness boundary,
not as a new DHR/DR theorem.

Work to do:

1. Check Doplicher-Roberts for any hypothesis that already enforces
   sector-faithfulness/full central-character retention.
2. Send the one-page question in
   `team1_dhr_dr_sector_faithfulness_question.md` to a DHR/DR or
   tensor-category reviewer and ask whether diagonal restriction is already a
   standard quotient/forgetful-functor example.
3. If the answer is "standard", add the exact categorical theorem name and
   demote. If the answer is "useful boundary", prepare it as an example row in
   the short Team 1 note.

Success in two weeks is a standard theorem citation or a precise
sector-faithfulness hypothesis.

## Deliverable 4: Publishable Note Decision

Target files:

- `team1_referee_claim_boundary_matrix.md`
- `team1_standard_theorem_crosswalk.md`
- `team1_self_adjudication_decision_memo.md`
- `team1_external_review_response_triage.md`

At the end of the sprint, Team 1 should make exactly one of these decisions:

| Decision | Required evidence | Action |
| --- | --- | --- |
| Demote entirely | Exact theorem/citation covers the residue. | Write a citation/demotion note and stop novelty language. |
| Kill and replace | Counterexample or physical axiom kills the comparison class. | Make the counterexample/missing axiom the new theorem target. |
| Conditional application note | Experts say elementary but useful. | Prepare a short expository arXiv/referee note with no Clay/Nobel novelty language. |
| Candidate theorem note | At least one expert says the exact black-hole/AQFT support/readout boundary is not known/false/too broad. | Prepare a concise theorem note and seek a second independent review before stronger claims. |

## What Not To Do

- Do not add verifier layers.
- Do not add more generated dossiers unless they replace a longer artifact with
  a shorter expert-facing question.
- Do not mutate frozen public artifacts without logged external feedback.
- Do not describe the finite quotient/accountability theorem as new
  mathematics unless a sufficiency/operator-algebra expert explicitly says the
  formulation is not covered.
- Do not claim progress from passing tests, hash checks, or Lean builds unless
  the checked statement is itself a new or externally disputed mathematical
  claim.

## Immediate Next Step

Start with Deliverable 2. The OAQEC/JLMS row is closest to the black-hole
reconstruction literature and gives the best chance of a useful external
classification. The next concrete work item is to produce a one-page
OAQEC/JLMS maximality question:

```text
Does algebra-relative entanglement-wedge/OAQEC reconstruction imply that the
declared logical algebra is maximal against finite central direct-sum
refinements, or is maximality/full central-sector accountability an additional
hypothesis?
```

That question, not another internal certificate, is the current Team 1
frontier lever.
