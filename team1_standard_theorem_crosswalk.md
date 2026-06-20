# Team 1 Standard-Theorem Crosswalk

Status: live claim-demotion and referee-routing note. This is not a frozen
artifact and does not modify either Team 1 manuscript, Lean archive, public
mirror, or SHA manifest.

Purpose: separate what Team 1 must concede as standard mathematics from the
remaining claim that might be worth external review or publication.

## Current Honest Assessment

The finite-center package should not be pitched as new operator algebra,
AQFT, superselection reconstruction, OAQEC, sufficiency theory, crossed-product
entropy, or black-hole spectroscopy. Those subjects already contain the
positive reconstruction theorems and many of the negative lessons Team 1 uses.

The possible publishable residue is narrower:

> In black-hole/AQFT reconstruction language, quotient-visible operational,
> sector, recovery, modular, continuum, or entropy records do not by themselves
> certify hidden finite central support, ambient faithfulness, finite central
> rank, or binary rank. To force those targets one must add the corresponding
> separator, source/readout-accountability, maximality, physical-exclusion,
> entropy-calibration, finite-alphabet, or direct measurement premise.

This residue may still be known. The point of external review is to identify
the exact theorem name if it is known, or the precise missing hypothesis if it
is too broad.

## Demote Before Review

| Team 1 ingredient | Standard source lane | What should be demoted now | Remaining question for reviewers |
| --- | --- | --- | --- |
| Weak-* quotient / central support obstruction | Sakai/Takesaki-style von Neumann algebra ideal and central-projection theory | Do not claim novelty for the fact that weak-* closed ideals in a von Neumann algebra are central-projection controlled. | Is Team 1's multi-row "iff supplied datum" table an existing theorem or only an elementary corollary package? |
| Split/tensor-factor rows | Doplicher-Longo split inclusions, `Invent. Math. 75 (1984), 493-536` | Do not claim a new tensor-splitting theorem. Split inclusions/type-I interpolation are standard positive hypotheses. | Does the manuscript accidentally assume the split/nuclearity condition that would already kill the row? |
| LCQFT/RCE rows | Brunetti-Fredenhagen-Verch, `arXiv:math-ph/0112041` | Do not claim a new locally covariant QFT or new relative-Cauchy-evolution construction. | Can quotient-visible RCE records force the hidden finite center, or is source faithfulness an additional positive input? |
| Dynamical-locality exit | Fewster-Verch, `arXiv:1106.4785` | Treat dynamical locality as a named standard exit, not Team 1 terminology. | Is dynamical locality implicit in the target physical setting, making the finite-center comparison class too broad? |
| DHR/DR sector reconstruction | Doplicher-Roberts, `Commun. Math. Phys. 131 (1990), 51-107` | Do not claim new field-algebra or compact-gauge-group reconstruction. | If the supplied sector category omits central-character fibers, is there a standard theorem that recovers them anyway? |
| OAQEC/JLMS rows | JLMS `arXiv:1512.06431`; Dong-Harlow-Wall `arXiv:1601.05416`; Harlow `arXiv:1607.03901` | Do not claim new entanglement-wedge or algebraic-QEC reconstruction. | Does reconstruction relative to a declared algebra imply maximality against hidden finite central extensions? |
| Support/readout accountability | Blackwell comparison; Le Cam deficiency; Petz sufficiency and recovery; Shmaya/Buscemi quantum comparison | Demote generic "data-processing/recovery is relative to a channel" content. | Is Team 1's finite rank-accountability condition exactly a known sufficiency/comparison criterion? |
| Entropy calibration | Witten crossed product, `arXiv:2112.12828` | Do not claim new crossed-product entropy or black-hole entropy theorem. | Does the crossed-product additive constant leave the finite-center calibration freedom Team 1 isolates? |
| Binary spectroscopy | Bekenstein-Mukhanov, `arXiv:gr-qc/9505012` | Do not claim entropy alone derives a binary alphabet. Resolved spectroscopy is a separate measurement route. | Is there a weaker standard axiom forcing `q=2` without a finite-alphabet law or direct binary measurement? |

## Publication Triage

| External classification | What Team 1 should do |
| --- | --- |
| Exact known theorem | Rewrite both review requests as a citation/demotion note; do not post as a new result. |
| Elementary corollary but useful boundary | Prepare a short expository note only if it cleanly translates standard theorems into the black-hole/AQFT reconstruction problem. |
| Missing standard hypothesis | Patch the claim boundary around that hypothesis; do not change frozen artifacts until the response is logged. |
| Natural counterexample | Make the counterexample the new theorem target and freeze the old claim as superseded. |
| Plausibly new residue | Prepare the paired short notes for arXiv/referee submission, preserving the demoted novelty language above. |

## Referee-Ready Residue Statement

The cleanest version to test externally is:

> Standard reconstruction theorems reconstruct what their hypotheses supply:
> a functor, a dynamically local theory, a superselection category, a code
> algebra, a channel, or a spectral observable. They do not automatically
> certify that this supplied object is maximal with respect to hidden finite
> central extensions. In finite rank, a hidden center is removed only by
> source/readout accountability, physical exclusion, null/gauge identification,
> or direct finite-alphabet measurement. In particular, quotient-visible
> entropy/recovery data do not force `q=2`.

This is the sentence to ask experts to classify as `known`, `false`, `missing
hypothesis`, `too broad`, or `plausibly new`.

For the explicit finite-center theorem residue and proof skeleton, see
`team1_finite_center_residue_theorem_note.md`.

For the constructive positive exit from that residue, see
`team1_positive_accountability_theorem_note.md`.
The shortest referee-facing version is the four-page TeX/PDF note
`team1_positive_accountability_short_note.tex` /
`team1_positive_accountability_short_note.pdf`.

For the current internal verdict on novelty and publication posture, see
`team1_self_adjudication_decision_memo.md`.

## Next External Action

Send the crosswalk together with
`team1_referee_claim_boundary_matrix.md` and
`team1_finite_center_residue_theorem_note.md` to the first-wave reviewers when
they ask for a narrower target. If they ask for the positive route rather than
the obstruction, add `team1_positive_accountability_short_note.pdf` plus
`team1_positive_accountability_theorem_note.md`. The best response is not a
long report; it is the exact standard theorem or missing hypothesis that
decides whether the residue above is publishable.
