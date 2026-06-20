# Team 1 Crossed-Product Entropy Calibration Boundary Note

Status: live referee-facing theorem-boundary note. This is not a frozen
manuscript or Lean artifact.

Short TeX/PDF version:
`team1_crossed_product_entropy_calibration_short_note.tex` /
`team1_crossed_product_entropy_calibration_short_note.pdf`.

Purpose: turn the crossed-product entropy adjudication row into a concrete
standard-language test. The target is not a new crossed-product, Type II, or
black-hole entropy theorem. The target is the exact boundary between:

- entropy for a specified Type II/crossed-product algebra with its trace or
  normalization convention; and
- the stronger claim that such data also fix an omitted finite central
  calibration, finite-center trace weights, or an absolute entropy-density
  coefficient.

## Primary-Source Pass

This note was written after checking the standard crossed-product and
gravitational Type II anchors:

- Witten, "Gravity and the Crossed Product", `arXiv:2112.12828`: the large-`N`
  Type III algebra is replaced by a Type II_infty crossed product, and
  black-hole-state entropy is well-defined up to a state-independent additive
  constant.
- Longo-Witten, "A note on continuous entropy", `arXiv:2202.03357`: Segal-type
  entropy for semifinite von Neumann algebras is related to relative entropy.
- Chandrasekaran-Penington-Witten, "Large N algebras and generalized entropy",
  `arXiv:2209.10454`: a specified Type II_infty algebra in AdS/CFT is used to
  compute generalized entropy.
- Penington-Witten, "Algebras and States in JT Gravity", `arXiv:2301.07257`:
  Type II boundary algebras again come with a trace/normalization convention
  under which density matrices and entropy are defined.

## Lemma: Crossed Products Carry Finite Centers Along

Let `M` be a von Neumann algebra with faithful normal state `omega`, and let

```text
K = M rtimes_{sigma^omega} R
```

be the modular crossed product. For `n >= 2` and a faithful probability vector
`r = (r_1,...,r_n)`, set

```text
B_n = M tensor l^\infty({1,...,n}),      Omega_r = omega tensor r.
```

Because the modular action on the finite central factor is trivial,

```text
B_n rtimes_{sigma^{Omega_r}} R  ~=  K tensor l^\infty({1,...,n}).
```

Thus passing to the modular crossed product does not erase the finite center.
If the comparison reads the core only after a quotient, retraction, selected
central character, or diagonal trace test, then the omitted finite central
summands remain omitted from the readout.

## Trace-Calibration Fiber

Fix a faithful normal semifinite trace `tau` on `K`. On the full finite central
core `K tensor l^\infty({1,...,n})`, consider traces

```text
tau_a(x_1,...,x_n) = sum_i a_i tau(x_i),     a_i > 0.
```

For a central probability vector `p`, the part of the finite-center entropy
that changes when the trace weights change is

```text
L_a(p) = sum_i p_i log(a_i).
```

If the supplied calibration consists only of values

```text
T_a(c) = sum_i a_i c_i
```

on a subspace `C` of central tests, then `L_a(p)` is determined on an allowed
state family `P` if and only if

```text
T_a|_C = T_b|_C  implies  L_a(p) = L_b(p) for every p in P.
```

Scalar diagonal core trace tests are not enough. For `n = 2`, the weights
`a = (1,3)` and `b = (2,2)` agree on every scalar diagonal trace test because
both have total weight `4`, but at `p = (1/2,1/2)`,

```text
L_a(p) - L_b(p) = (1/2) log(3/4) != 0.
```

So a Type II trace/entropy construction for the supplied algebra is not by
itself a calibration principle for an omitted finite central trace density.

## Proposition: Atomic Calibration Recovers the Entropy Term

There is a sharp positive exit. If the full finite central core

```text
K tensor l^\infty({1,...,n})
```

is retained, and the supplied calibration includes atomic trace values

```text
tau_a(h tensor e_i) = a_i tau(h),     i = 1,...,n
```

for some positive finite-trace `h in K`, then the central trace weights `a_i`
are determined up to the same convention used to normalize `tau(h)`.
Consequently

```text
L_a(p) = sum_i p_i log(a_i)
```

is determined for every retained central probability vector `p`.

If the trace normalization is specified only projectively, so that
`a -> lambda a` is still allowed, then

```text
L_{lambda a}(p) = L_a(p) + log(lambda).
```

The ambiguity is a common state-independent additive constant. Thus entropy
differences between retained central states are determined exactly, while an
absolute entropy-density coefficient still needs the matching absolute trace,
area, or Newton-constant convention.

## Entropy-Density Boundary

If a black-hole or horizon calculation claims an absolute area-density
coefficient

```text
c = lim_Sigma S(Sigma) / Area(Sigma),
```

then quotient-visible crossed-product, relative-entropy, or Type II entropy
data determine `c` exactly when every same-data finite-center, trace-weight,
or affine entropy residual has zero normalized limiting density. Equivalently,
they need extra data that fix the relevant central entropy contribution:

- full retention of the finite central algebra in the Type II/crossed-product
  algebra and state family;
- atomic trace calibration on each central support;
- an affinely spanning set of absolute area/entropy calibration states;
- geometric area and Newton-constant normalization tied to the same entropy
  convention;
- or a quotient/factor/inadmissibility axiom excluding the finite center.

## Referee Classification

This note should be classified as one of:

- `known`: this is standard crossed-product/semifinite entropy bookkeeping;
  cite the exact theorem and demote Team 1 to an application note.
- `false`: a standard gravitational crossed-product hypothesis already fixes
  the finite central trace calibration above; name the hypothesis.
- `missing hypothesis`: Type II entropy is defined for the supplied algebra and
  trace, but the intended physical setup also supplies an absolute trace,
  area, or central-sector calibration.
- `plausibly useful`: the mathematics is elementary, but the explicit warning
  about overreading crossed-product entropy as finite-center maximality is
  worth a short black-hole/AQFT note.

## Consequence For Team 1

Team 1 should not claim a new crossed-product entropy theorem. The concrete
claim is:

> Crossed-product and gravitational Type II constructions define entropy for
> the algebra and trace/normalization data supplied to them. They do not, by
> themselves, identify a finite central calibration that was quotient-hidden,
> diagonally tested, or omitted before the Type II entropy calculation.

The positive counterpart is also explicit: retained atomic trace calibration
does recover the finite-center entropy term, modulo only the common additive
trace-normalization convention when that convention is intentionally left
projective.

That is the crossed-product entropy row for external adjudication.
