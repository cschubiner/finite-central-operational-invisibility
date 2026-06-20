# Reviewer Start Here

This repository is a public verification mirror for a frozen mathematical
physics package:

`Finite Central Invisibility in Operational Reconstructions of Tensor
Factorization and Horizon Entropy`

The review standard is deliberately adversarial. A useful response classifies
the main claim as one of:

- already standard under a known theorem name;
- false, with a counterexample or missing hypothesis;
- proof-polish needed;
- package/hash/build issue;
- new but checkable finite-central classification.

Public verification workflow:
<https://github.com/cschubiner/finite-central-operational-invisibility/actions/workflows/verify-frozen-package.yml>

Public review and verification status:
`PUBLIC_REVIEW_STATUS.md`

## What To Inspect First

1. Read `PUBLIC_REVIEW_STATUS.md`.
2. Read `finite_central_operational_invisibility_external_review_request.md`.
3. Read `finite_central_operational_invisibility_short_note.pdf`.
4. Check the frozen claim boundary in
   `finite_central_operational_invisibility_submission_manifest.md`.
5. Check the primary-source attack map in
   `finite_central_literature_boundary_index.md`.
6. For a quick standard-theorem demotion pass, read
   `team1_standard_theorem_crosswalk.md` and
   `team1_referee_claim_boundary_matrix.md`.
7. For the shortest theorem target, read
   `team1_finite_center_residue_theorem_note.md`.
8. Verify the finite Lean kernel if desired:

```bash
shasum -a 256 -c finite_central_operational_invisibility_SHA256SUMS.txt
cd finite_center_lean_verification
lake build FiniteCenterSupport
lean FiniteCenterSupport.lean
```

The Lean file checks only finite fiber, support, tensor-kernel, process-table,
and entropy-density descent lemmas. It is not a formalization of AQFT,
Tomita-Takesaki theory, DHR/DR reconstruction, split inclusions, crossed
products, or black-hole entropy.

## Main Questions

1. Is the joint finite-central descent criterion already standard under another
   theorem name?
2. Is any row of Theorem 1 false or too broad, especially generated algebras
   versus spatial tensor products, sector-character retention, or
   entropy-density/Newton-coupling normalization?
3. Does the entropy-coefficient theorem require an additional analytic
   hypothesis on the area limit, trace normalization, or comparison class?
4. Does the Lean finite kernel faithfully abstract the standard-language claim?
5. Is the surviving residue in `team1_standard_theorem_crosswalk.md` already a
   named theorem or only an elementary corollary package?
6. Is the residue lemma in `team1_finite_center_residue_theorem_note.md`
   standard, false, too broad, or publishable as a finite-center corollary?

## Response Format

Use `REVIEW_RESPONSE_TEMPLATE.md` if convenient. The most useful response is
short, source-specific, and decisive enough to drive one of these actions:

- demote the novelty claim and cite the standard theorem;
- record a counterexample or missing hypothesis;
- patch proof or package presentation narrowly;
- preserve the frozen package as a new-but-checkable classification.

Silence, informal interest, or encouragement is not adjudication.
