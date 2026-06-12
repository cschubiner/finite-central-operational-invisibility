# Finite-Center Lean Verification Archive

This archive is the standalone Lean 4 verification core accompanying the note
`Finite Central Invisibility in Operational Reconstructions of Tensor
Factorization and Horizon Entropy`.

It is intentionally small.  It imports only Lean's `Std` library and does not
depend on mathlib.  It is not a formalization of AQFT, Tomita--Takesaki theory,
DHR sectors, split inclusions, crossed products, or black-hole entropy.  Those
analytic and operator-algebraic hypotheses are stated and cited in the note.
The archive checks the finite logical and finite combinatorial descent kernels
used after those standard hypotheses reduce the question to finite central
fibers.

## Contents

- `lean-toolchain`: pins Lean to `leanprover/lean4:v4.30.0`.
- `lakefile.lean`: minimal Lake project.
- `FiniteCenterSupport.lean`: finite verification core.

## Build

From this directory:

```bash
lake build FiniteCenterSupport
lean FiniteCenterSupport.lean
```

Both commands should complete without proof-placeholder commands.

## Map To The Note

The note has one proposition and two theorem statements.  The Lean file checks
the finite core of each:

- Proposition "Fiber criterion":
  - `factorsThrough_iff_constantOnFibers`
  - `propertyFactorsThrough_iff_propertyConstantOnFibers`
  - `constantOnFibers_prod_iff`
  - `factorsThrough_prod_iff`
  - `constantOnFibers_pi_iff`
  - `factorsThrough_pi_iff`

- Theorem "Finite-central operational descent":
  - `mainFiniteCentralDescentClassificationCore`
  - `finiteCenterOperationalCompletenessCore`
  - `mainRefereeFormCore`
  - `quotientFactoredInvariantNoGoCore`
  - `quotientFactoredPropertyNoGoCore`
  - `quotientVisibleUniversalNoGoCore`
  - `representedCenterFaithful_iff_supportFull`
  - `familyRepresentedCenterFaithful_iff_familyCoversAtoms`
  - `centralReadoutCoverageLowerBoundCore`
  - `centralCalibrationRankCriterionCore`
  - `centralCharacterSectorRetentionSharpExitCore`
  - `completeFiniteCentralProcessTomographyExitCore`

- Theorem "Tensor factors and entropy coefficient from operational data":
  - `refereeTensorEntropyDescentCore`
  - `refereeTensorEntropyCriterionCore`
  - `generatedVsTensorTomographyFibersIffCore`
  - `generatedAlgebraTomographyTensorExitCore`
  - `productCoordinateSeesOffDiagonalKernelCore`
  - `tensorHorizonCoefficientCore`
  - `refereeBekensteinHawkingCoefficientCore`
  - `relativeEntropyTypeIIAreaIdentifiabilityCore`
  - `areaCoefficientDescentCriterionCore`

## Formalization Boundary

The Lean archive verifies statements about finite data maps, fiber constancy,
finite support coverage, finite central readout separation, finite tensor
kernel witnesses, finite process tables, and finite entropy-density descent.

It does not verify the infinite-dimensional analytic input that normal
functionals separate von Neumann algebras, that split inclusions imply
W*-tensor-product independence, that DHR/Doplicher--Roberts reconstruction
applies to a supplied sector category, or that crossed-product entropy
constructions have the cited physical interpretation.  Those are literature
inputs to the manuscript, not machine-checked claims of this archive.
