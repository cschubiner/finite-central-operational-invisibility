# Team 1 External Review Response Triage

Status: live maintainer-side triage protocol. This is not a frozen theorem
artifact and does not modify either Team 1 frozen package or SHA manifest.

Purpose: convert a written external response into the smallest source-level
action that preserves honesty. Do not treat silence, encouragement, or informal
interest as adjudication.

## Intake Rule

Before changing any theorem, manuscript, public mirror, or novelty language,
record the response in `docs/team1_external_review_outreach_tracker.md` with:

- reviewer and lane;
- response class;
- exact theorem name, citation, counterexample, or missing hypothesis;
- affected artifact and claim boundary;
- next action.

Private email replies may be summarized, but do not quote more than needed.
Public GitHub comments may be linked directly.

## Response Classes

| Response class | Required evidence | Immediate action |
| --- | --- | --- |
| Known theorem / demote novelty | Theorem name, source, or precise standard result. | Stop novelty language; add citation/demotion note before any further outreach. |
| False statement / counterexample | Concrete model, hypothesis set, or row where same-data claim fails. | Freeze outreach; write a counterexample patch or retraction note before publishing new claims. |
| Missing positive hypothesis | Named condition such as dynamical locality, source faithfulness, split/nuclearity, OAQEC maximality, full code algebra, or finite-alphabet/direct-measurement input. | Patch claim boundary around the missing hypothesis; do not alter frozen artifacts until the response is logged. |
| Too broad physically | Clear reason the comparison class is not admissible in the reviewer lane. | Narrow comparison class and mark the broader claim as nonphysical in that lane. |
| Proof-polish issue | Local prose, citation, or proof-gap issue without changing the theorem target. | Patch note/proof prose narrowly and preserve novelty status as undecided. |
| Package/hash/build issue | Command, file, hash, or reproducibility failure. | Fix package metadata or build surface; do not infer theorem status. |
| Lean abstraction mismatch | Finite formal kernel does not match the standard-language claim. | Patch formalization boundary; do not count Lean green status as theorem support until fixed. |
| New but checkable finite-central classification | Reviewer says not known/false in their lane and gives no missing standard hypothesis. | Preserve as candidate publishable result, but seek at least one independent corroborating review before arXiv novelty language is strengthened. |
| Decline / outside expertise | Reviewer declines or redirects. | Log recommendation; optionally route to named replacement only after current cold-outreach pause is lifted. |

## Artifact-Specific Actions

| Affected artifact | When to patch | Patch rule |
| --- | --- | --- |
| `docs/team1_positive_accountability_short_note.{tex,pdf}` | Response concerns the positive readout/accountability theorem or binary-rank corollary. | Patch only the stated theorem boundary, proof sentence, or citation. Rebuild PDF and preserve public note status as non-frozen. |
| `docs/team1_finite_center_residue_theorem_note.md` | Response concerns the negative same-data finite-center residue. | Patch residue statement or comparison class first; avoid adding downstream physics claims. |
| `docs/team1_standard_theorem_crosswalk.md` | Response gives a theorem name, missing hypothesis, or demotion lane. | Add the exact source under the matching standard theorem row. |
| `docs/team1_referee_claim_boundary_matrix.md` | Response classifies a claim as known, false, too broad, or missing-hypothesis. | Update the matrix row and recommended action. |
| Public mirrors | Any source-facing patch changes reviewer-facing files. | Publish as non-frozen review metadata; never mutate frozen hashes unless maintainer explicitly unfreezes. |
| Frozen manuscripts / Lean archives | Only written external feedback or maintainer unfreeze decision justifies mutation. | Log response first, patch narrowly, rebuild, and refresh manifests/hashes. |

## Stop Conditions

Stop further cold outreach immediately if any reviewer supplies:

1. an exact known theorem that covers the claim;
2. a decisive counterexample;
3. a missing hypothesis that is already present in the frozen statement and
   changes the theorem interpretation;
4. a package/hash/build defect in a public mirror.

Resume only after the response is logged and the corresponding demotion,
counterexample, boundary, or package patch is complete.

## Current Awaited Decisions

The current decisive questions are:

1. LCQFT/dynamical locality: do source faithfulness, timeslice/RCE, dynamical
   locality, or measurement coupling already exclude the hidden finite centers?
2. Operator algebras/split inclusions: is the finite-center descent package
   just central-projection quotient theory plus split/tensor hypotheses?
3. OAQEC/JLMS/black-hole algebra: do recovery/relative entropy/crossed-product
   entropy theorems imply maximality of the supplied algebra, or only recovery
   inside it?
4. Positive accountability: is the finite accountability quotient just
   Blackwell/Petz sufficiency in finite-center language?

Until one of these questions receives a written classification, the package is
externally reviewable but not externally adjudicated.
