# Team 1 Discrete Spectroscopy Alphabet Boundary Note

Status: live referee-facing theorem-boundary note. This is not a frozen
manuscript or Lean artifact.

Short TeX/PDF version:
`team1_discrete_spectroscopy_alphabet_boundary_short_note.tex` /
`team1_discrete_spectroscopy_alphabet_boundary_short_note.pdf`.

Purpose: turn the discrete black-hole spectroscopy adjudication row into a
concrete standard-language test. The target is not a new derivation of the
Bekenstein-Mukhanov spectrum, the Bekenstein-Hawking entropy, or black-hole
quasinormal modes. The target is the exact boundary between:

- a finite-alphabet law or resolved line-spectrum measurement that directly
  supplies the alphabet size; and
- quotient-visible entropy, recovery, area spacing, or unresolved spectroscopy
  data that are compatible with more than one finite alphabet.

## Primary-Source Pass

This note was written after checking the standard black-hole spectroscopy
anchors:

- Bekenstein, "Black Holes and Entropy", `Phys. Rev. D 7 (1973), 2333`: black
  holes carry entropy proportional to area, with the numerical coefficient
  fixed later by Hawking temperature.
- Bekenstein-Mukhanov, "Spectroscopy of the quantum black hole",
  `arXiv:gr-qc/9505012`: assuming a uniformly spaced area spectrum and
  exponentially degenerate levels, black holes should emit in discrete lines;
  the thermal character is attributed to the level degeneracy.
- Bekenstein, "Quantum Black Holes as Atoms", `arXiv:gr-qc/9710076`: reviews
  the area-spectrum/atomic analogy and stresses that degeneracy grows
  exponentially with area.
- Maggiore, "The physical interpretation of the spectrum of black hole
  quasinormal modes", `arXiv:0711.3145`: quasinormal-mode arguments can motivate
  an area spacing, but the spacing depends on the physical interpretation and
  is not by itself a binary-alphabet theorem.

## Spectroscopy Alphabet Criterion

Let `q` be the proposed finite alphabet size of the microscopic horizon cell
or finite central primitive. Let `D(q)` be the actual reported spectroscopy
data under a specified physical law: for example a resolved fundamental line
spacing, transition intensities, level degeneracies, Planck/area units, and
the rule connecting those quantities to `q`.

Then `q = 2` is reconstructible from the spectroscopy data if and only if

```text
D(q) = D(2)  implies  q = 2
```

inside the declared comparison class. In other words, the spectroscopy route is
a positive exit only when the physical law and the measured data are injective
on the binary-vs-nonbinary fiber.

## Bekenstein-Mukhanov As A Positive Exit

In the Bekenstein-Mukhanov idealization, one assumes a level degeneracy of the
form

```text
g_n = k^n
```

with integer `k >= 2`. Matching entropy to area then gives a spacing of the
form

```text
Delta A = 4 log(k) * l_P^2
```

in the usual Bekenstein-Hawking normalization. Under this extra integer
degeneracy law, exact measurement of the fundamental area spacing in fixed
Planck/area units would determine `k`; if the measured spacing is
`4 log(2) l_P^2`, the law gives `k = 2`.

That is a genuine direct-measurement route. But the binary conclusion is doing
work through all of the following inputs:

- a resolved fundamental line or area spacing;
- fixed Planck/area normalization;
- the Bekenstein-Mukhanov integer degeneracy law `g_n = k^n`;
- the identification of the degeneracy base `k` with the finite central
  alphabet size `q`;
- and exclusion of hidden/gauge/null finite-center refinements that do not
  change the measured line data.

Without those inputs, the same entropy slope or qualitative discreteness claim
does not select `q = 2`.

## Nonidentifiability Without The Alphabet Law

Entropy alone is basis-free: a degeneracy count written as `exp(S)` can be
rewritten in base `2`, base `3`, or any other base after rescaling the level
label. Likewise, a uniformly spaced area spectrum with unspecified spacing
parameter `gamma`,

```text
A_n = gamma n l_P^2,
```

does not identify a finite alphabet. Different comparison theories can choose
`gamma = 4 log(2)`, `gamma = 4 log(3)`, `gamma = 8 pi`, or another value, and
the qualitative statement "there is a discrete spectrum" remains true while
the finite alphabet differs or is not defined.

Even a measured line spacing determines only the spacing parameter until the
model supplies the map from spacing to finite alphabet. Under the
Bekenstein-Mukhanov law, that map is `gamma = 4 log(k)`. Under a different
quantization or quasinormal-mode interpretation, the same style of area-spacing
data need not encode an integer alphabet at all.

## Referee Classification

This note should be classified as one of:

- `known`: this is standard black-hole spectroscopy bookkeeping; cite the exact
  theorem or review and demote Team 1 to an application note.
- `false`: entropy, area spacing, or quasinormal-mode spectroscopy already
  forces a binary alphabet under weaker accepted hypotheses; name the
  hypothesis.
- `missing hypothesis`: binary follows in the intended setting because a
  finite-alphabet law, exact line measurement, degeneracy law, or direct
  microscopic measurement channel is already assumed.
- `plausibly useful`: the mathematics is elementary, but the explicit warning
  that `q=2` requires a direct finite-alphabet route is useful for black-hole
  reconstruction arguments.

## Consequence For Team 1

Team 1 should not claim that entropy, area quantization, or generic black-hole
spectroscopy derives a binary primitive. The concrete claim is:

> Bekenstein-Mukhanov-type spectroscopy can be a positive exit from the finite
> central obstruction only when it supplies a resolved finite-alphabet law or a
> direct measurement channel whose data are injective on the binary fiber.
> Without that extra input, quotient-visible entropy, recovery, or area-spacing
> records do not force `q=2`.

That is the discrete spectroscopy row for external adjudication.
