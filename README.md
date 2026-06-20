# Finite Central Operational Invisibility

This repository is a public verification package for the frozen short note
`Finite Central Invisibility in Operational Reconstructions of Tensor
Factorization and Horizon Entropy`.

External reviewers should start with `REVIEWER_START_HERE.md`. Public review
and verification status is tracked in `PUBLIC_REVIEW_STATUS.md`.
For a stricter first-pass classification, use
`team1_standard_theorem_crosswalk.md` and
`team1_referee_claim_boundary_matrix.md` before reading the full manuscript.
For the narrow theorem residue to classify directly, use
`team1_finite_center_residue_theorem_note.md`.

It contains only the frozen Team 1 package artifacts:

- `finite_central_operational_invisibility_short_note.tex`
- `finite_central_operational_invisibility_short_note.pdf`
- `finite_central_operational_invisibility_arxiv_source.tar.gz`
- `finite_center_lean_verification/`
- `finite_center_lean_verification_archive.tar.gz`
- `finite_central_operational_invisibility_external_review_request.md`
- `finite_central_operational_invisibility_submission_manifest.md`

Additional non-frozen review metadata on `main`:

- `REVIEWER_START_HERE.md`
- `REVIEW_RESPONSE_TEMPLATE.md`
- `PUBLIC_REVIEW_STATUS.md`
- `finite_central_literature_boundary_index.md`
- `team1_referee_claim_boundary_matrix.md`
- `team1_standard_theorem_crosswalk.md`
- `team1_finite_center_residue_theorem_note.md`
- `.github/workflows/verify-frozen-package.yml`
- `finite_central_operational_invisibility_SHA256SUMS.txt`

## Frozen Hashes

```text
e41acd80ceca955517cc530447190d0af34ceed69294faeeb3441fe19926cb2f  finite_central_operational_invisibility_short_note.tex
b119dd80030bf836d03641eede3df40ba0063f7cd60f6ee49a7233dcd5dc1665  finite_central_operational_invisibility_short_note.pdf
eea5c9189623c70c8df94eb4f009d0f7d45090e5c3c51d7a38cd0d734d3f7de5  finite_central_operational_invisibility_arxiv_source.tar.gz
b0a3a06fbc4a2b7b7aeeda103451e4324e7a41e590e994ea6855fda71da77936  finite_center_lean_verification_archive.tar.gz
98299a112300d2d58bde1dc74f075eddbac2393786551f37a8bd43f1d6d5c12f  finite_central_operational_invisibility_external_review_request.md
```

The submission manifest records the exact novelty claim and freeze boundary.

The same hashes are available as a command-line manifest:
`finite_central_operational_invisibility_SHA256SUMS.txt`.

## Build Checks

Compile the note:

```bash
tectonic finite_central_operational_invisibility_short_note.tex
```

Check the standalone Lean archive:

```bash
cd finite_center_lean_verification
lake build FiniteCenterSupport
lean FiniteCenterSupport.lean
```

Or check the archive tarball from a clean directory:

```bash
mkdir -p /tmp/finite-center-lean-check
tar -xzf finite_center_lean_verification_archive.tar.gz -C /tmp/finite-center-lean-check
cd /tmp/finite-center-lean-check/finite_center_lean_verification
lake build FiniteCenterSupport
lean FiniteCenterSupport.lean
```

## Formalization Boundary

The Lean archive checks finite fiber, support, tensor-kernel, process-table, and
entropy-density descent lemmas.  It does not formalize AQFT,
Tomita--Takesaki theory, DHR/Doplicher--Roberts reconstruction, split
inclusions, crossed products, or black-hole entropy.  Those analytic and
operator-algebraic inputs are cited in the note.

## Review Request

See `finite_central_operational_invisibility_external_review_request.md` for
the main claim, novelty boundary, and three concrete questions for external
reviewers.

For reviewers likely to classify the result as standard, start with
`team1_standard_theorem_crosswalk.md`. It concedes the standard theorem lanes
up front and isolates the possible publishable residue.
The shortest theorem target is in
`team1_finite_center_residue_theorem_note.md`.
