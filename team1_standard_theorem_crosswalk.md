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

For the concrete LCQFT/RCE countermodel family now under review, see
`team1_lcqft_constant_center_extension_note.md`.

## Positive-Exit Adjudication Map

This is the current referee-grade fork.  A standard theorem kills or demotes
Team 1 only when it supplies the missing maximality/accountability premise,
not merely when it reconstructs inside a declared quotient, algebra, category,
channel, or experiment.

| Lane | Standard result to try first | Premise that would kill or demote Team 1 | If that premise is absent |
| --- | --- | --- | --- |
| LCQFT functor/RCE | BFV locally covariant QFT and relative Cauchy evolution, `arXiv:math-ph/0112041` | The stated data include a faithful full theory functor, not only quotient-visible RCE records. | RCE is supplied structure; it does not by itself certify absence of hidden finite central completions. |
| SPASs/dynamical locality | Fewster-Verch dynamical locality, `arXiv:1106.4785` | Dynamical locality is an assumed same-physics axiom and the hidden finite-center completion violates it. | Dynamical locality is the named positive exit, not an automatic consequence of quotient-visible records. |
| Local measurement/probe route | Fewster-Verch measurement framework, `arXiv:1810.06512`; Fewster-Verch review, `arXiv:2304.13356` | A probe/scattering/measurement scheme is actually center-separating or tomographically complete for the finite center. | A measurement formalism alone does not force binary rank; it must include the separating finite-alphabet readout. |
| Split/tensor factorization | Doplicher-Longo split inclusions, `Invent. Math. 75 (1984), 493-536` | The target statement assumes split/nuclearity/type-I interpolation strongly enough to supply the tensor coordinate or maximal support. | Tensor-factor claims remain quotient-relative; Team 1 should state split as a positive hypothesis, not a conclusion. |
| Superselection reconstruction | Doplicher-Roberts reconstruction, `Commun. Math. Phys. 131 (1990), 51-107` | The supplied superselection category already contains the central-character fibers and DR hypotheses recover the full field algebra. | Reconstruction of the supplied category does not recover sectors omitted before forming the category. |
| OAQEC/JLMS | JLMS `arXiv:1512.06431`; Dong-Harlow-Wall `arXiv:1601.05416`; Harlow `arXiv:1607.03901` | The code algebra is stipulated to be the full logical algebra, or complementary recovery/maximality is part of the hypothesis. | Recovery and relative entropy hold inside the declared algebra; hidden finite central refinements remain outside the target. |
| Classical/quantum comparison | Blackwell; Le Cam; Petz; Shmaya; Buscemi | A theorem states exactly that the finite-center contrast target is recoverable iff the comparison channel/model is sufficient for that target. | Team 1 must demote the math to sufficiency theory, but the black-hole/AQFT warning may remain as an application note. |
| Crossed-product entropy | Witten black-hole crossed product, `arXiv:2112.12828` | The construction fixes the same finite-center additive/calibration constant under the Team 1 hypotheses. | Entropy rows should be framed as calibration non-identifiability, not a new entropy theorem. |
| Discrete spectroscopy | Bekenstein-Mukhanov, `arXiv:gr-qc/9505012` | There is a direct finite-alphabet measurement law, or a standard physical axiom deriving binary rank without one. | Entropy/recovery records alone do not force `q=2`; binary rank is a separate measurement or dynamics input. |

The LCQFT row has now been sharpened to a concrete constant-center extension
test in `team1_lcqft_constant_center_extension_note.md`.  A reviewer can
kill it by naming the LCQFT axiom that forbids the construction; otherwise the
row becomes an explicit BFV/time-slice/RCE non-identifiability example.

For a two-week frontier push, Team 1 should attempt to turn one row above into
a precise theorem-or-demotion statement:

1. prove that a named positive exit supplies center accountability under its
   published hypotheses;
2. find a counterexample showing it does not;
3. or cite the exact standard theorem that already states the row.

Any of these is real progress.  Another internal consistency gate is not.

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
