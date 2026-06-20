# Team 1 OAQEC/JLMS Maximality Question

Status: one-page external classification request. This is not a frozen
manuscript, theorem claim, Lean artifact, or certificate.

## Question

In algebraic entanglement-wedge reconstruction / OAQEC / JLMS settings, does
reconstruction of a declared logical algebra imply that the declared algebra is
maximal against hidden finite central direct-sum refinements?

Equivalently:

```text
Does algebra-relative recovery/relative-entropy equality imply full
finite-center accountability, or is maximality/full central-sector
accountability an additional hypothesis?
```

## Minimal Test Model

Let `M` be a finite-dimensional logical von Neumann algebra that is
reconstructable on a boundary region/algebra in the OAQEC sense. For `q >= 2`,
form

```text
M_q = M tensor C^q ~= direct_sum_{j=1}^q M.
```

Blockwise recovery reconstructs `M_q` whenever each block is included in the
declared code/logical data. But if the declared records factor through a
selected central character

```text
Q_k : M_q -> M,       Q_k(x_1,...,x_q)=x_k,
```

then all nonselected central blocks are invisible to those records. The
quotient-visible recovery/JLMS data are identical for `q=2` and `q>2`, while
the hidden finite central rank differs.

## Positive Exit

The obstruction disappears if the OAQEC/JLMS comparison includes the full
central-sector probability distribution or if the theorem hypotheses state
that the supplied algebra is the full/maximal logical algebra.

For block-diagonal states

```text
rho   = direct_sum_j p_j rho_j,
sigma = direct_sum_j r_j sigma_j,
```

on `M_q`, the direct-sum relative-entropy formula is

```text
S(rho || sigma) = D(p || r) + sum_j p_j S(rho_j || sigma_j).
```

The classical term `D(p||r)` detects the central-sector distribution. Thus
full central-sector JLMS data are a positive accountability premise; a
single-character quotient record is not.

## Desired Classification

Please classify this as one of:

1. `known`: this is a standard OAQEC/JLMS/direct-sum theorem; cite the exact
   source and Team 1 will demote it.
2. `false`: a standard OAQEC/JLMS hypothesis already forbids `M_q -> M`
   quotient-visible comparison; name the hypothesis.
3. `missing hypothesis`: reconstruction is algebra-relative, but the intended
   holographic setup separately assumes full logical-algebra maximality,
   complementary recovery, or full central-sector accountability.
4. `too broad physically`: hidden finite central direct-sum refinements are
   excluded in the intended black-hole setting by a standard physical axiom.
5. `plausibly useful`: elementary, but worth stating as a black-hole/AQFT
   reconstruction-boundary warning.

## Sources Team 1 Is Not Claiming To Extend

- Jafferis-Lewkowycz-Maldacena-Suh, `arXiv:1512.06431`.
- Dong-Harlow-Wall, `arXiv:1601.05416`.
- Harlow, `arXiv:1607.03901`.

Team 1 is not claiming a new JLMS or OAQEC theorem. The only question is
whether recovery/relative entropy for a supplied algebra is sometimes overread
as maximality against hidden finite centers.
