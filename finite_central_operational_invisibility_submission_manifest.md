# Finite Central Operational Invisibility Submission Manifest

## Candidate arXiv Metadata

- Title: `Finite Central Invisibility in Operational Reconstructions of Tensor Factorization and Horizon Entropy`
- Primary category: `math-ph`
- Suggested cross-lists: `gr-qc`, `quant-ph`, `hep-th`
- MSC 2020: `81T05`, `46L10`, `46L55`; secondary `81P45`, `83C57`
- Author metadata: supplied by the uploader at submission time. The TeX keeps
  `\author{}` blank to avoid inventing authorship in the repository copy.

## Submission Files

- TeX source: `docs/finite_central_operational_invisibility_short_note.tex`
- Compiled PDF: `docs/finite_central_operational_invisibility_short_note.pdf`
- arXiv source bundle:
  `docs/finite_central_operational_invisibility_arxiv_source.tar.gz`
- Lean verification archive:
  `docs/finite_center_lean_verification_archive.tar.gz`
- External-review request:
  `docs/finite_central_operational_invisibility_external_review_request.md`
- Public verification package:
  <https://github.com/cschubiner/finite-central-operational-invisibility>
- Lean core: `formalization/FiniteCenterSupport.lean`
- Repository Lean core path after push:
  <https://github.com/cschubiner/quantum-relativity-unification-lab/blob/main/formalization/FiniteCenterSupport.lean>
- Repository standalone Lean archive source path after push:
  <https://github.com/cschubiner/quantum-relativity-unification-lab/tree/main/docs/finite_center_lean_verification>
- Repository Lean archive tarball path after push:
  <https://github.com/cschubiner/quantum-relativity-unification-lab/blob/main/docs/finite_center_lean_verification_archive.tar.gz>
- Source repository visibility at freeze check: `PRIVATE`.
- Public package repository visibility at public-host check: `PUBLIC`.
- Base commit inspected while preparing this package:
  `d41d5934b59ca1cf148f0f10245e3f1899192989`
- Artifact identity is fixed by the SHA-256 values below; the Git commit hash is
  intentionally not self-referential inside this manifest.

The TeX uses an inline `thebibliography`; no external `.bib` file is required
for the current submission package.

## SUBMISSION FREEZE

Status: frozen as of `2026-06-12 01:12 EDT`, subject only to author metadata,
posting logistics, build-failure repair, or written external-review feedback.

Frozen artifact hashes:

- TeX source SHA-256:
  `e41acd80ceca955517cc530447190d0af34ceed69294faeeb3441fe19926cb2f`
- Compiled PDF SHA-256:
  `b119dd80030bf836d03641eede3df40ba0063f7cd60f6ee49a7233dcd5dc1665`
- arXiv source bundle SHA-256:
  `eea5c9189623c70c8df94eb4f009d0f7d45090e5c3c51d7a38cd0d734d3f7de5`
- Standalone Lean archive SHA-256:
  `b0a3a06fbc4a2b7b7aeeda103451e4324e7a41e590e994ea6855fda71da77936`
- External-review request SHA-256:
  `98299a112300d2d58bde1dc74f075eddbac2393786551f37a8bd43f1d6d5c12f`

Frozen theorem surface:

- Proposition environments: `1`
- Theorem environments: `2`
- Corollary environments: `0`
- Lemma environments: `0`
- Compiled page count: `16`

Frozen novelty claim: the contribution is the joint finite-central descent
criterion in the "Exact Novelty Claim" section below.  In short, represented,
retracted, restricted, generated-algebra, or tested operational data determine
the listed full-algebra targets exactly when the matching finite-central
separator, tensor-kernel separator, sector-character datum, quotient/exclusion
rule, or entropy/area calibration is supplied; otherwise the retained
same-data witnesses show nonreconstructibility.

## arXiv Source Upload Bundle

- Bundle contents: `finite_central_operational_invisibility_short_note.tex`
  only.
- Bundle SHA-256:
  `eea5c9189623c70c8df94eb4f009d0f7d45090e5c3c51d7a38cd0d734d3f7de5`
- Creation command:

```bash
COPYFILE_DISABLE=1 tar -czf docs/finite_central_operational_invisibility_arxiv_source.tar.gz \
  -C docs finite_central_operational_invisibility_short_note.tex
```

The source bundle intentionally omits the generated PDF, auxiliary files, logs,
the manifest, and the Lean file.  arXiv should receive the TeX source bundle;
the compiled PDF is retained in the repository for local review.

Current compiled PDF SHA-256:
`b119dd80030bf836d03641eede3df40ba0063f7cd60f6ee49a7233dcd5dc1665`.

## Standalone Lean Verification Archive

- Archive contents:
  - `finite_center_lean_verification/lean-toolchain`
  - `finite_center_lean_verification/lakefile.lean`
  - `finite_center_lean_verification/FiniteCenterSupport.lean`
  - `finite_center_lean_verification/README.md`
- Archive SHA-256:
  `b0a3a06fbc4a2b7b7aeeda103451e4324e7a41e590e994ea6855fda71da77936`
- Clean-room verification command:

```bash
rm -rf /tmp/oqg-lean-archive-check
mkdir -p /tmp/oqg-lean-archive-check
tar -xzf docs/finite_center_lean_verification_archive.tar.gz -C /tmp/oqg-lean-archive-check
cd /tmp/oqg-lean-archive-check/finite_center_lean_verification
lake build FiniteCenterSupport
lean FiniteCenterSupport.lean
```

The archive imports only Lean `Std`, pins `leanprover/lean4:v4.30.0`, and
contains a README mapping the note's proposition and two theorem statements to
the finite Lean lemmas.  The README also states that AQFT, operator-algebraic,
DHR, split-property, and crossed-product entropy inputs are cited analytic
hypotheses rather than formalized Lean claims.

## External Review Request

The file
`docs/finite_central_operational_invisibility_external_review_request.md`
summarizes the main claim, states the novelty boundary, and asks three concrete
questions for an outside mathematical physicist to attack before posting.

## Build and Verification Commands

```bash
tectonic --outdir docs docs/finite_central_operational_invisibility_short_note.tex
pdfinfo docs/finite_central_operational_invisibility_short_note.pdf
tar -tzf docs/finite_central_operational_invisibility_arxiv_source.tar.gz
tar -tzf docs/finite_center_lean_verification_archive.tar.gz
cd docs/finite_center_lean_verification && lake build FiniteCenterSupport && lean FiniteCenterSupport.lean
lean formalization/FiniteCenterSupport.lean
PYTHONDONTWRITEBYTECODE=1 python3 scripts/team1_support_faithfulness_countermodel.py --summary --pretty
```

Expected PDF page count: `16`.

Expected countermodel headline:

```text
negative_quotient_visible_data_do_not_force_full_ambient_support_or_binary_rank
```

## Exact Novelty Claim

The note does not claim new Tomita--Takesaki theory, new DHR/DR
reconstruction, a new split-property theorem, new locally covariant QFT
foundations, new process tomography, or a new derivation of
Bekenstein--Hawking entropy.

The claimed contribution is the joint finite-central descent criterion:
for represented, retracted, restricted, generated-algebra, or tested
operational data, the following full-algebra targets are reconstructible
exactly when the corresponding finite-central exit is supplied:

- full central support;
- atoms and weights of a specified finite center;
- variable finite central cardinality, including the two-atom predicate;
- factor-valuedness of a retained local algebra;
- unquotiented spatial tensor-product coordinates;
- finite central channel dynamics;
- central-character labels in supplied sector data;
- absolute finite-center entropy contributions and the horizon entropy-density
  coefficient.

If the exit is absent and the comparison class contains the finite-central
same-data pair, the target is not reconstructible.  The three witnesses retained
in the short note are:

- quotient-visible support and finite rank;
- generated algebra versus spatial tensor product;
- entropy-density and Newton-normalization residuals.

## Nearest Prior-Art Boundary

- Normal quotients, weak-* closed ideals, and central support are standard von
  Neumann algebra structure theory.
- DHR/Doplicher--Roberts reconstruct from a supplied sector category.
- Doplicher--Longo split inclusions and related split-property criteria provide
  tensor-product independence when their hypotheses hold.
- BFV and Fewster--Verch formulate local covariance, relative Cauchy evolution,
  dynamical locality, and local measurement schemes for supplied functors and
  probes.
- Choi--Jamiolkowski/process tomography reconstructs channels relative to an
  informationally complete preparation/effect domain.
- No-broadcasting constrains universal broadcasting channels for noncommuting
  state families; it does not infer finite commutative central coordinates that
  were never supplied to the data.
- JLMS/OAQEC and crossed-product entropy identify entropy/recovery statements
  for specified algebras, channels, traces, and normalizations.

The note's finite-central theorem is a converse/fiber statement about what is
not determined when those positive inputs have already been quotiented,
retracted, restricted, or incompletely calibrated.

## Submission Caveats

- The current PDF is a working repository artifact, not a posted arXiv record.
- The source-repository Lean links point to tracked paths on `main`, but the
  source repository was private at freeze check.  Unauthenticated external
  review should use the public verification package linked above.  If exact
  source-repository reproducibility is desired in addition to artifact hashes,
  cite the pushed commit containing this manifest.
- Remaining TeX warnings are underfull boxes in tables; the latest log scan
  found no overfull boxes, undefined references/citations, or TeX errors.
