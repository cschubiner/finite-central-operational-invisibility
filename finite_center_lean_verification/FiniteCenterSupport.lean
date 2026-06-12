import Std

/-!
# Finite-center support core

This standalone Lean file formalizes several finite/logical cores used in
`docs/finite_central_descent_short_arxiv.tex`.

First, it proves the quotient/fiber criterion for operational reconstruction:
an invariant factors through an operational data map exactly when it is constant
on that map's fibers, joint reconstruction of a pair of invariants is equivalent
to reconstructing both components separately, indexed-family reconstruction is
coordinatewise, and the same fiber criterion holds for properties.  It also
proves comparison-relation versions for both ordinary
invariants and Prop-valued properties, matching the finite-central comparison
relations used in the manuscript.  The same logical block proves the
augmented-data repair lemma: if adding an exit datum reconstructs an invariant
or property that changes on an old observation fiber, then that exit datum must
separate the counterexample pair.  It also proves the hypothesis-class
counterexample lemma: if a proposed reconstruction theorem's hypotheses contain
two same-data candidates with different target values, then no reconstruction
function can be valid on that hypothesis class.
It also records the data-coarsening monotonicity used for labelled operational
data: forgetting labels cannot turn a nonreconstructible target into a
reconstructible one.

Second, it models the finite abelian algebra `C^(n+1)` by functions
`Fin (n+1) -> Nat` and the character state at the first atom by the seminorm
square `f 0 * f 0`.  It also models an arbitrary finite support by a Boolean
predicate, proves the corresponding represented-quotient relation, and proves
that the represented quotient is faithful on finite central functions exactly
when the support is full.  This is not a formalization of von Neumann algebras
or GNS representations; it is the finite support kernel that sits inside the
paper's GNS-support theorem.  It also models a family of represented supports:
the induced direct-sum representation is faithful on the finite center exactly
when the family covers every central atom.  Finally, it models the finite
Boolean skeleton of the central null-quotient rule: a quotient kills exactly the
atoms missed by the represented family iff its kill mask is the complement of
the family support.

Third, it models the finite-center part of the shared-center tensor
factorization obstruction.  The diagonal product map sends the off-diagonal
tensor atom `e_i tensor e_j` to zero when `i != j`, while that tensor atom is
nonzero in the unreduced finite tensor product.

Fourth, it models the atom-count part of the finite convex-state obstruction:
adding a duplicate hidden atom leaves the observed pure-atom image unchanged.

Fifth, it models the finite hidden-refinement core: a fixed fiber kernel is
recovered uniquely from its action on coarse point masses, the induced
refinement has the expected coordinate formula, and any point-mass-determined
refinement is exactly a fixed-kernel refinement.  It also records the finite
midpoint identity behind the state-independent recovery theorem: if a hidden
central weight coordinate satisfies the product condition forced by affine
state-independent recovery for every probe, then that coordinate is constant.

Sixth, it models the two-summand trace-weight core: diagonal trace
normalization sees only the sum of two central weights, so different central
weight vectors can give the same diagonal trace on every scalar diagonal
element.  It also records that the same two weight vectors have different
weight product, the finite algebraic shadow of the logarithmic trace-entropy
shift used in the area-density counterexample.

Seventh, it models the two-dimensional order-cone witness: two positivity tests
can accept a signed vector that is not coordinatewise positive.

Eighth, it models the two-summand process-tomography core: identity and swapped
central dynamics agree on the scalar unit but differ on an atomic central input.
It also records the finite-classical positive skeleton: a channel table is
determined by all atomic input/output process data.

Ninth, it models the two-summand local-probe readout core: scalar induced
observables give the same probe data for two distinct central laws.

Tenth, it models the finite coordinate-ray part of the order-cone criterion:
coordinate positivity tests reconstruct the full finite positive orthant exactly
when every coordinate is tested; if a coordinate is missing, a signed vector can
pass all supplied coordinate tests while failing positivity.

Eleventh, it models the trace-calibration core: atomic trace tests recover the
central trace weights, while the diagonal scalar trace test sees only their sum
in the two-summand witness.  It also proves the finite masked-calibration
alternative: masked atomic trace tests reconstruct all central trace weights
exactly when every atom is tested; otherwise two positive trace-weight vectors
agree on all supplied tests but differ on a missed atom.

Twelfth, it records that the two order-cone tests in the seventh core are
faithful, i.e. each assigns a strictly positive coefficient to each atom.  Thus
the false-positive vector is not caused by a zero coefficient; faithful smeared
tests can still miss atomic positivity.

Thirteenth, it models the finite blockwise skeleton of complete positivity for a
finite abelian algebra: a matrix over `C^n` is positive exactly when each atomic
block is positive.

Fourteenth, it models the finite sector-restriction collapse: different
central sector labels can have the same restricted diagonal sector datum after
applying the diagonal direct-sum functor, both in the two-summand witness and
for arbitrary point sectors of a finite center.

Fifteenth, it gives a concrete two-candidate no-reconstruction witness for
support totality itself: a full-support finite center and a character-supported
finite center have the same blind observation, but only one has full support.

Sixteenth, it gives the corresponding finite entropy-normalization witness:
two entropy conventions have the same blind observation but different
finite-central entropy coefficient.

Seventeenth, it gives the joint witness needed for the support/entropy
obstruction: two candidates have the same blind observation while both
support-totality and finite-central entropy coefficient differ.

Eighteenth, it gives finite no-cross-calibration witnesses and the matching
joint exit criterion: adding an entropy calibration datum that is constant on an
old blind fiber does not decide a tensor/factorization property, adding a
tensor/factorization datum that is constant on an old blind fiber does not
reconstruct an entropy coefficient, and a joint tensor/entropy target is
reconstructed by an added datum exactly when that datum separates every old
blind-fiber pair on which either coordinate changes.

Nineteenth, it gives the included-subalgebra witness behind the main no-go
corollary: a base factor and a finite central amplification have the same
included-subalgebra datum while factor-valuedness and entropy counting differ.
It also gives the matching finite exit criteria: an added datum decides
factor-valuedness, or the paired factor/entropy invariant, exactly when it
separates the base and amplified candidates.

Twentieth, it gives an explicit two-atom-vs-three-atom witness: two finite
central cardinalities, 2 and 3, have the same blind datum while the cardinality
invariant differs.  This is the finite machine-checked core of the
statement that nonseparating data do not single out the binary case.  It also
formalizes the sharper Prop-valued statement: the predicate "the finite center
is binary" itself is not decided by blind data, including on the all-candidates
hypothesis class.

Twenty-first, it records the finite direct-sum fixed-point calculation used in the
AQFT dynamical-locality argument: a componentwise family of transformations
fixes a finite vector exactly when it fixes every component.

Twenty-second, it records the finite affine-calibration skeleton behind the JLMS
area-term criterion: an affine central representative is fixed by calibrated
values at selected vertices exactly when every vertex is selected; otherwise a
nonzero affine ambiguity remains invisible to the calibration.

Twenty-third, it packages the machine-checked finite core of the manuscript's
self-contained finite-central descent theorem: blind included-subalgebra data do
not reconstruct the paired factor/entropy invariant, blind represented data do
not reconstruct full support, blind multiplicity data do not decide binaryness,
blind entropy data do not reconstruct the finite-center entropy coefficient,
and diagonal multiplication on a finite center with at least two atoms has a
nontrivial tensor kernel.

Twenty-fourth, it packages the finite Boolean/coordinate core of the short
manuscript's local-net reconstruction classification theorem: represented
families are centrally faithful exactly when their supports cover every atom,
coordinate readouts reconstruct the positive cone exactly when every coordinate
is tested, trace calibration reconstructs every finite central trace weight
exactly when every atom is tested, affine area calibration reconstructs every
vertex value exactly when every vertex is calibrated, and a finite center with
at least two atoms has a nontrivial diagonal-multiplication tensor kernel.  It
also records the sharper split-exit skeleton: diagonal multiplication on a
finite shared center is injective exactly when there are no two distinct atoms.

Twenty-fifth, it records the finite atom-readout separation skeleton: atom
labels are reconstructible exactly when the readout is injective, and adding a
duplicate hidden atom preserves the observed atom image while making the readout
noninjective.

Twenty-sixth, it records the finite central-readout quotient witness: the
two-atom sum readout is faithful on the positive cone, but is not injective and
has a kernel that is not closed under coordinatewise multiplication.  This is
the machine-checked skeleton of the manuscript's claim that faithful smeared
central readouts need not reconstruct the central product or finite central
cardinality.
It also proves directly that coordinatewise multiplication is not well-defined
on the quotient equivalence relation induced by this readout.

Twenty-seventh, it records the finite independence skeleton for the reconstruction
exits in the short manuscript: faithful positive readout need not separate atoms,
central separation need not imply tensor-product injectivity for a shared-center
bipartition, tensor injectivity need not supply affine entropy calibration, and
a nonempty affine calibration can coexist with absent support faithfulness and
absent atom separation.

Twenty-eighth, it adds a thin wrapper for the short manuscript's introductory
finite-center dichotomy: atom-label reconstruction, support faithfulness,
trace/area calibration, affine calibration, and diagonal tensor-kernel
injectivity are packaged in one statement.

Twenty-ninth, it records the finite positive-exit skeleton for full central
tomography: atomic readouts cover every central atom, the two-coordinate readout
separates a two-atom center, and supplying the finite central cardinality
decides the two-atom predicate.

Thirtieth, it records the finite affine-calibration exit skeleton: calibrated
vertex values reconstruct an affine entropy/area representative exactly when
every vertex is calibrated; otherwise two representatives agree on all
calibrated vertices while differing elsewhere.

Thirty-first, it records the finite generated-algebra tomography skeleton for
tensor factorization: diagonal/generated data reconstruct a one-atom tensor
product, but every center with at least two atoms has a nonzero off-diagonal
tensor element killed by diagonal multiplication.

Thirty-second, it records the finite process-tomography exit skeleton:
complete atomic input/output data determine a finite classical channel table,
while scalar-input data do not identify central dynamics.

Thirty-third, it packages the finite/logical skeleton of the short manuscript's
universal no-reconstruction theorem: without the corresponding exits, blind or
quotient-factored data have same-data witnesses for factor/entropy, full
support, the two-atom predicate, tensor factorization, process dynamics, and central-sector
labels; with the finite exits, positivity, trace, affine calibration, and full
atomic process tables are reconstructed by the corresponding labelled tests.

Thirty-fourth, it records the finite Boolean skeleton of the type-III/factor
distinction: "all central summands have the desired type" can be constant on a
base factor and a finite central amplification even though factor-valuedness
changes.

Thirty-fifth, it adds a named wrapper for the area-coefficient descent
criterion: an abstract coefficient is reconstructible from operational data
exactly when it is constant on same-data fibers.  In the manuscript this is
applied after the entropy assignment has been normalized by the area and the
relevant limits exist.

Thirty-sixth, it adds a named wrapper for the closure/exclusion alternative:
if a hypothesis class contains two same-data candidates with different retained
target values, no universal reconstruction rule from that data can be valid on
the class.

Thirty-seventh, it packages the finite positive reconstruction side: full
atomic central readouts cover support, coordinate readouts separate atoms,
one-atom diagonal multiplication is injective, complete atomic process data
determine a channel table, central-sector exits that separate all labels
reconstruct point sectors, and trace/affine calibration reconstruct exactly
when the tested mask is full.

Thirty-eighth, it adds a named wrapper for the on-support faithfulness no-go:
a faithful positive two-atom sum readout is still noninjective, does not support
a well-defined central product quotient, and blind multiplicity data still do
not decide the two-atom predicate.

Thirty-ninth, it adds a named wrapper for the Type II core corollary's finite
kernel: after post-retraction data have forgotten multiplicity, positive
support and coarse trace agreement still do not decide the two-atom predicate or the
entropy-relevant central trace term.

Fortieth, it adds a named wrapper for the operator-algebra QEC corollary's
finite kernel: exact represented-code data that are blind to the finite edge
center do not decide either binary edge rank or the finite-center entropy
coefficient.

Forty-first, it adds a named area-scale identifiability witness: two candidates
can have the same area-times-coefficient product while having different
coefficients, so product-visible entropy data do not reconstruct the coefficient
without calibrated area scale.

Forty-second, it adds a named generated-versus-tensor tomography wrapper:
diagonal/generated data have the same fibers as full tensor data exactly when
diagonal multiplication is injective.

Forty-third, it records the finite coordinate-readout lower-bound skeleton:
masked coordinate readouts reconstruct all finite central coordinates exactly
when every atom is tested; if an atom is missed, two distinct coordinate
assignments agree on every supplied readout.

Forty-fourth, it gives a named finite process-tomography fiber witness:
identity and atom-swap dynamics on a two-atom center agree on the scalar unit
input but differ on an atomic input.

Forty-fifth, it adds a named finite affine-calibration lower-bound skeleton:
calibrated vertex values reconstruct an affine central entropy/area
representative exactly when every finite central vertex is calibrated; if a
vertex is missed, two affine representatives agree on all calibrated vertices
but differ globally.

Forty-sixth, it records the finite arithmetic skeleton of central
area-operator shifts in subalgebra-code entropy formulas: adding a central
shift to the area term and subtracting the same affine expectation from the
algebraic entropy term preserves the total entropy value.

Forty-seventh, it adds a named retracted-measurement wrapper: if all
measurement readouts factor through a retraction, a target that changes inside
one retraction fiber cannot be reconstructed from those readouts.

Forty-eighth, it packages the finite skeleton of the relative-entropy/Type-II
area-term identifiability theorem: affine calibration, trace calibration, and
area-coefficient descent are exact under the same finite support and fiber
conditions.

Forty-eighth-bis, it records the finite independence witness for those two
calibrations: full affine vertex calibration can coexist with diagonal trace
data that do not determine the entropy-relevant trace term, and full trace
calibration can coexist with a one-vertex affine calibration that leaves a
nonzero affine ambiguity.

Forty-ninth, it records the generic finite counting-functional skeleton: any
finite-center counting value that differs between the binary and ternary
candidates is not reconstructed from blind multiplicity data, and an added
datum reconstructs it exactly when it separates that old binary/ternary fiber.

Fiftieth, it records the generic quotient-factored universal no-go core: if a
comparison relation is contained in the operational fibers, a single related
same-data pair with different target values kills reconstruction on the
hypothesis class, and any reconstruction rule would force the target to be
constant on all such comparison pairs in that class.

Fifty-first, it records the generic normal-quotient finite/logical kernel used
by the manuscript's support/readout theorem.  If all data on an ambient model
factor through a quotient map, then two ambient candidates with the same
quotient image but different invariant values or different property truth values
cannot be reconstructed from those quotient-factored data.  The Lean lemma is
purely logical; normality and central-support facts are supplied in the
operator-algebraic manuscript hypotheses.

Fifty-second, it records the finite arithmetic skeleton of the
entropy-density-to-Newton-normalization corollary: once area units and hbar are
fixed, two same-data entropy-density coefficients give two different inferred
Newton-coupling denominators, so the Newton-normalization label cannot descend
from the blind entropy data.

Fifty-third, it gives a named finite skeleton for the copied-center
dynamical-locality calculation: if the original kinematic predicate agrees with
the fixed-point predicate of the relative-Cauchy-evolution family, then the
componentwise finite direct-sum version has the same equality.

Fifty-fourth, it names the finite skeleton of relative-entropy/recovery descent:
fixed represented/recovered data that are blind to the finite center do not
reconstruct the ambient finite central cardinality or the two-atom
predicate.

Fifty-fifth, it names the generic fiber-descent core of the referee-form
tensor/entropy theorem: an indexed tensor target together with one entropy
coefficient descends from labelled operational data exactly when every indexed
coordinate is constant on those data fibers and the coefficient is constant on
those fibers.

Fifty-sixth, it names the finite process-tomography obstruction/repair core:
complete atomic input/output process data determine a finite-classical channel
table, while scalar-unit process data leave identity and atom-swap dynamics in
one data fiber.

Fifty-seventh, it names the finite sector-character obstruction/repair core:
distinct central point-sector labels can have the same restricted one-copy
sector datum, and an added datum repairs the reconstruction exactly when it
separates all central point labels.

Fifty-eighth, it packages the referee-form modular/crossed-product entropy
obstruction: represented modular data have already quotiented away an
off-support central atom, while crossed-product trace/entropy calibration still
has a finite central fiber unless every atom is calibrated.

Fifty-ninth, it packages the referee-form locally covariant readout obstruction:
copied relative-Cauchy fixed-point data preserve dynamical locality
componentwise, while post-retraction rank and entropy readouts still do not
determine finite central cardinality, the two-atom predicate, or finite-center entropy.

Sixtieth, it packages the referee-form OAQEC/JLMS area obstruction: represented
code data blind to an edge center do not determine binary edge rank or
finite-center entropy, and an absolute area representative is fixed exactly by
full affine calibration of the tested central simplex.

Sixty-first, it packages the referee-form Bekenstein-Hawking coefficient
obstruction: product-visible area data and same-data entropy-density residuals
do not determine the area coefficient or inferred Newton denominator; once the
coefficient is formed, the exact repair is constancy on operational fibers.

Sixty-second, it packages the referee-form irredundancy core: the original
finite exit-independence witnesses combine with the OAQEC edge-center witness
and the Bekenstein-Hawking coefficient witness, so neither recovery data nor
area-scale/product data replace the missing central or entropy calibrations.

Sixty-third, it names the finite quotient-zero/ambient-nonzero core: an
off-support atom is zero in the represented character quotient and lies in the
character-null kernel, while it remains a nonzero atom in the full finite
algebra.

Sixty-fourth, it names the finite central-face/relative-entropy calibration
core: after pairwise relative-entropy data reduce the remaining absolute
entropy/area freedom to affine central terms, the tested face fixes those terms
and the finite central trace weights exactly when the tested mask covers every
central vertex.

Sixty-fifth, it names the finite faithful-readout/algebra-quotient obstruction:
a faithful positive two-atom readout can be noninjective only by having a kernel
that is not closed under central multiplication, so its quotient is not a
finite central algebra quotient.

Sixty-sixth, it names the finite type-III/factor-boundary core: knowing that
all central summands have a desired factor type does not decide whether the full
algebra is factor-valued.

Sixty-seventh, it names the finite restricted-sector rank boundary: restricted
sector data that forget the finite central cardinality do not decide the
two-atom predicate.

Sixty-eighth, it names the finite standard-form boundary: standard-form or
represented modular data are already data of the represented quotient, so a
nonzero off-support atom can remain ambient-nonzero and the two-atom predicate is not
decided by those represented data.

Sixty-ninth, it packages the referee-form support-faithfulness obstruction:
quotient-zero is not ambient-zero, blind multiplicity data do not decide the
two-atom predicate, and any quotient-factored property reconstruction is killed
by a same-quotient pair with different truth values.

Seventieth, it names the finite distinction between the minimal support exit
and the stronger full-tomography package: a faithful positive two-atom readout
need not separate atoms, while full atomic tomography supplies both support
faithfulness and central separation.

Seventy-first, it names the finite no-restriction/effect-domain exit: a finite
effect mask reconstructs all central weights exactly when every atom is tested.
If an effect is missing, two positive central weight assignments agree on every
admitted effect while differing on the missed atom.  This is the machine-checked
finite skeleton of the manuscript's no-restriction corollary.

Seventy-second, it packages the finite/logical skeleton of the main
classification theorem: an abstract same-data pair kills reconstruction, blind
finite data supply the support/factor/cardinality/tensor/process/sector/entropy
witnesses, and the positive central, tensor, process, sector, trace, affine,
and coefficient exits reconstruct exactly under the corresponding finite
conditions.

Seventy-third, it names the finite witness package for the introductory corollary
`Universal finite-central witnesses`: quotient-visible support/cardinality blindness,
the shared-center diagonal tensor kernel, and the entropy-density/Newton
normalization same-data witness.

Seventy-fourth, it names the finite/logical core for the three introductory
obstruction theorems in the short manuscript: quotient-visible support/cardinality
nonreconstruction, generated-algebra-vs-spatial-tensor kernel obstruction, and
entropy-density/Newton normalization nonidentifiability.

Seventy-fifth, it names the finite/logical core for the tensor/horizon
coefficient corollary: generated-algebra data reconstruct the finite tensor
product in the one-atom case but have a nonzero diagonal-kernel witness in
every nontrivial finite center, while blind entropy-density data do not
determine either the finite coefficient or the inferred Newton denominator.

Seventy-sixth, it names the logical core of the closure/exit alternative:
after the manuscript's analytic hypotheses have supplied a same-data pair in
the hypothesis class with different retained target values, reconstruction on
that hypothesis class is impossible, and global reconstruction is equivalent
to constancy on operational fibers.

Seventy-seventh, it names the logical core of the quotient-kernel classifier
corollary: if quotient-visible data contain a comparison pair with two
different labels for the quotient kernel, then no reconstruction rule from the
quotient-visible data can recover that label.  A positive result must add a
classifier datum or restrict the hypothesis class so that the classifier is
constant on operational fibers.

Seventy-eighth, it names the finite core of the binary-coarse-graining
corollary: both the binary and ternary finite classical systems allow a
two-outcome coarse-graining, so the mere availability of binary tests does not
decide the Prop-valued predicate that the finite central cardinality is exactly two.

Seventy-ninth, it names the finite automorphism core: a sharp event on a
finite classical system that is invariant under all permutations is either
empty or full.  Hence full finite-center symmetry cannot select a nontrivial
binary event without extra labels or symmetry-breaking data.

Eightieth, it names the finite/logical core of the central-support quotient
and modular-core theorem: represented quotient/core data have already killed an
off-support atom, while blind core data do not reconstruct the discarded finite
central cardinality or the two-atom predicate.

Eighty-first, it names the finite tensor-product tomography core: a product
coordinate functional sees the off-diagonal tensor atom that diagonal/generated
algebra data kill.  This is the finite skeleton of the manuscript's
product-state-tomography corollary.

Eighty-second, it gives a named finite/logical wrapper for the front theorem in
referee form: fiber descent of a retained target, exclusion of a same-data pair
inside a hypothesis class, and the finite positive package of support/readout,
tensor, process, sector, trace, affine, and coefficient exits.
-/

namespace FiniteCenterSupport

/-- The subtype of data values actually realized by candidates. -/
def RealizedData {X D : Type} (observe : X -> D) : Type :=
  { d : D // ∃ x, observe x = d }

/-- An invariant factors through an operational data map when it is a function
of the realized data alone.  The reconstruction function is defined on
`RealizedData observe`, so no value has to be chosen for unrealized data. -/
def factorsThrough {X D Y : Type}
    (observe : X -> D) (invariant : X -> Y) : Prop :=
  ∃ reconstruct : RealizedData observe -> Y,
    ∀ x, reconstruct ⟨observe x, ⟨x, rfl⟩⟩ = invariant x

/-- An invariant is constant on operational fibers when operationally
indistinguishable candidates have the same invariant value. -/
def constantOnFibers {X D Y : Type}
    (observe : X -> D) (invariant : X -> Y) : Prop :=
  ∀ x y, observe x = observe y -> invariant x = invariant y

/-- A property factors through an operational data map when it is decidable from
the realized data alone. -/
def propertyFactorsThrough {X D : Type}
    (observe : X -> D) (property : X -> Prop) : Prop :=
  ∃ reconstruct : RealizedData observe -> Prop,
    ∀ x, reconstruct ⟨observe x, ⟨x, rfl⟩⟩ ↔ property x

/-- An invariant is reconstructed on a hypothesis class when one reconstruction
function works for every candidate satisfying the hypothesis. -/
def reconstructsOn {X D Y : Type}
    (hypothesis : X -> Prop) (observe : X -> D) (invariant : X -> Y) :
    Prop :=
  ∃ reconstruct : D -> Y,
    ∀ x, hypothesis x -> reconstruct (observe x) = invariant x

/-- A property is decided on a hypothesis class when one decision function works
for every candidate satisfying the hypothesis. -/
def propertyReconstructsOn {X D : Type}
    (hypothesis : X -> Prop) (observe : X -> D) (property : X -> Prop) :
    Prop :=
  ∃ reconstruct : D -> Prop,
    ∀ x, hypothesis x -> (reconstruct (observe x) ↔ property x)

/-- A property is constant on operational fibers when operationally
indistinguishable candidates have the same truth value for that property. -/
def propertyConstantOnFibers {X D : Type}
    (observe : X -> D) (property : X -> Prop) : Prop :=
  ∀ x y, observe x = observe y -> (property x ↔ property y)

/-- A comparison relation, such as the finite-central comparison relation in the
manuscript, is contained in operational fibers when every related pair has the
same operational datum. -/
def comparisonContainedInFibers {X D : Type}
    (observe : X -> D) (comparison : X -> X -> Prop) : Prop :=
  ∀ x y, comparison x y -> observe x = observe y

/-- An invariant is constant on a specified comparison relation. -/
def constantOnComparison {X Y : Type}
    (comparison : X -> X -> Prop) (invariant : X -> Y) : Prop :=
  ∀ x y, comparison x y -> invariant x = invariant y

/-- A property is constant on a specified comparison relation. -/
def propertyConstantOnComparison {X : Type}
    (comparison : X -> X -> Prop) (property : X -> Prop) : Prop :=
  ∀ x y, comparison x y -> (property x ↔ property y)

/-- Operational reconstruction of an invariant is exactly descent to the
quotient by the operational data map. -/
theorem factorsThrough_iff_constantOnFibers {X D Y : Type}
    (observe : X -> D) (invariant : X -> Y) :
    factorsThrough observe invariant <->
      constantOnFibers observe invariant := by
  constructor
  · intro h x y hxy
    rcases h with ⟨reconstruct, hrec⟩
    let sx : RealizedData observe := ⟨observe x, ⟨x, rfl⟩⟩
    let sy : RealizedData observe := ⟨observe y, ⟨y, rfl⟩⟩
    have hs : sx = sy := by
      apply Subtype.ext
      exact hxy
    calc
      invariant x = reconstruct sx := (hrec x).symm
      _ = reconstruct sy := by rw [hs]
      _ = invariant y := hrec y
  · intro h
    classical
    refine ⟨(fun d => invariant (Classical.choose d.property)), ?_⟩
    intro x
    let d : RealizedData observe := ⟨observe x, ⟨x, rfl⟩⟩
    have hd : observe (Classical.choose d.property) = observe x :=
      Classical.choose_spec d.property
    exact h (Classical.choose d.property) x hd

/-- Named finite/logical core of the manuscript's area-coefficient descent
criterion: once the coefficient has been formed as an invariant, it is
reconstructible from operational data exactly when same-data candidates have the
same coefficient. -/
theorem areaCoefficientDescentCriterionCore {X D C : Type}
    (observe : X -> D) (coefficient : X -> C) :
    factorsThrough observe coefficient <->
      ∀ x y, observe x = observe y -> coefficient x = coefficient y := by
  exact factorsThrough_iff_constantOnFibers observe coefficient

/-- A pair of invariants is constant on operational fibers exactly when each
component is constant on operational fibers. -/
theorem constantOnFibers_prod_iff {X D Y Z : Type}
    (observe : X -> D) (left : X -> Y) (right : X -> Z) :
    constantOnFibers observe (fun x => (left x, right x)) <->
      constantOnFibers observe left ∧ constantOnFibers observe right := by
  constructor
  · intro h
    constructor
    · intro x y hxy
      exact congrArg Prod.fst (h x y hxy)
    · intro x y hxy
      exact congrArg Prod.snd (h x y hxy)
  · intro h x y hxy
    exact Prod.ext (h.1 x y hxy) (h.2 x y hxy)

/-- Joint reconstruction of two invariants is equivalent to reconstructing both
components separately. -/
theorem factorsThrough_prod_iff {X D Y Z : Type}
    (observe : X -> D) (left : X -> Y) (right : X -> Z) :
    factorsThrough observe (fun x => (left x, right x)) <->
      factorsThrough observe left ∧ factorsThrough observe right := by
  rw [factorsThrough_iff_constantOnFibers,
    factorsThrough_iff_constantOnFibers,
    factorsThrough_iff_constantOnFibers,
    constantOnFibers_prod_iff]

/-- An indexed family of invariants is constant on operational fibers exactly
when each coordinate invariant is constant on operational fibers.  This is the
logical core behind applying a single descent criterion to every region or cut
in a local-net family. -/
theorem constantOnFibers_pi_iff {ι X D : Type} {Y : ι -> Type}
    (observe : X -> D) (target : ∀ i, X -> Y i) :
    constantOnFibers observe (fun x i => target i x) <->
      ∀ i, constantOnFibers observe (target i) := by
  constructor
  · intro h i x y hxy
    exact congrFun (h x y hxy) i
  · intro h x y hxy
    funext i
    exact h i x y hxy

/-- Reconstruction of an indexed family of invariants is equivalent to
reconstruction of every coordinate invariant. -/
theorem factorsThrough_pi_iff {ι X D : Type} {Y : ι -> Type}
    (observe : X -> D) (target : ∀ i, X -> Y i) :
    factorsThrough observe (fun x i => target i x) <->
      ∀ i, factorsThrough observe (target i) := by
  constructor
  · intro h i
    apply (factorsThrough_iff_constantOnFibers observe (target i)).mpr
    exact (constantOnFibers_pi_iff observe target).mp
      ((factorsThrough_iff_constantOnFibers observe
        (fun x i => target i x)).mp h) i
  · intro h
    apply (factorsThrough_iff_constantOnFibers observe
      (fun x i => target i x)).mpr
    apply (constantOnFibers_pi_iff observe target).mpr
    intro i
    exact (factorsThrough_iff_constantOnFibers observe (target i)).mp (h i)

/-- Finite/logical core of the local-net tensor/entropy criterion: a family of
targets together with one coefficient descends exactly when every family
coordinate descends and the coefficient descends. -/
theorem localNetFamilyEntropyDescentCore {ι X D C : Type} {Y : ι -> Type}
    (observe : X -> D) (target : ∀ i, X -> Y i) (coefficient : X -> C) :
    factorsThrough observe (fun x => ((fun i => target i x), coefficient x)) <->
      (∀ i, factorsThrough observe (target i)) ∧
        factorsThrough observe coefficient := by
  rw [factorsThrough_prod_iff, factorsThrough_pi_iff]

/-- Referee-form fiber criterion for the local-net tensor/entropy theorem:
an indexed target family together with one coefficient is reconstructible from
labelled data exactly when every coordinate target and the coefficient are
constant on the labelled data fibers.  Operator-algebraic hypotheses identify
these abstract fiber conditions with tested multiplication-kernel separation
and zero entropy-density residuals in the manuscript. -/
theorem refereeTensorEntropyDescentCore {ι X D C : Type} {Y : ι -> Type}
    (observe : X -> D) (target : ∀ i, X -> Y i) (coefficient : X -> C) :
    factorsThrough observe (fun x => ((fun i => target i x), coefficient x)) <->
      ((∀ i x y, observe x = observe y -> target i x = target i y) ∧
        ∀ x y, observe x = observe y -> coefficient x = coefficient y) := by
  rw [localNetFamilyEntropyDescentCore]
  constructor
  · intro h
    constructor
    · intro i x y hxy
      exact (factorsThrough_iff_constantOnFibers observe (target i)).mp
        (h.1 i) x y hxy
    · intro x y hxy
      exact (factorsThrough_iff_constantOnFibers observe coefficient).mp
        h.2 x y hxy
  · intro h
    constructor
    · intro i
      exact (factorsThrough_iff_constantOnFibers observe (target i)).mpr
        (h.1 i)
    · exact (factorsThrough_iff_constantOnFibers observe coefficient).mpr h.2

/-- Operational reconstruction of a property is exactly constancy of that
property on the operational fibers. -/
theorem propertyFactorsThrough_iff_propertyConstantOnFibers {X D : Type}
    (observe : X -> D) (property : X -> Prop) :
    propertyFactorsThrough observe property <->
      propertyConstantOnFibers observe property := by
  constructor
  · intro h x y hxy
    rcases h with ⟨reconstruct, hrec⟩
    have hs :
        (⟨observe x, ⟨x, rfl⟩⟩ : RealizedData observe) =
        (⟨observe y, ⟨y, rfl⟩⟩ : RealizedData observe) := by
      apply Subtype.ext
      exact hxy
    constructor
    · intro hx
      have hxData :
          reconstruct (⟨observe x, ⟨x, rfl⟩⟩ : RealizedData observe) :=
        (hrec x).mpr hx
      have hyData :
          reconstruct (⟨observe y, ⟨y, rfl⟩⟩ : RealizedData observe) := by
        rw [← hs]
        exact hxData
      apply (hrec y).mp
      exact hyData
    · intro hy
      have hyData :
          reconstruct (⟨observe y, ⟨y, rfl⟩⟩ : RealizedData observe) :=
        (hrec y).mpr hy
      have hxData :
          reconstruct (⟨observe x, ⟨x, rfl⟩⟩ : RealizedData observe) := by
        rw [hs]
        exact hyData
      apply (hrec x).mp
      exact hxData
  · intro h
    classical
    refine ⟨(fun d => property (Classical.choose d.property)), ?_⟩
    intro x
    let d : RealizedData observe := ⟨observe x, ⟨x, rfl⟩⟩
    have hd : observe (Classical.choose d.property) = observe x :=
      Classical.choose_spec d.property
    exact h (Classical.choose d.property) x hd

/-- If an invariant factors through a coarsening of an operational datum, then
it also factors through the finer operational datum.  In particular, forgetting
labels cannot add reconstruction power. -/
theorem factorsThrough_of_factorsThrough_coarsening {X D E Y : Type}
    (observe : X -> D) (coarsen : D -> E) (invariant : X -> Y) :
    factorsThrough (fun x => coarsen (observe x)) invariant ->
      factorsThrough observe invariant := by
  intro h
  apply (factorsThrough_iff_constantOnFibers observe invariant).mpr
  intro x y hxy
  have hcoarse : coarsen (observe x) = coarsen (observe y) := by
    rw [hxy]
  exact
    ((factorsThrough_iff_constantOnFibers
      (fun x => coarsen (observe x)) invariant).mp h) x y hcoarse

/-- Contrapositive of data-coarsening monotonicity for invariants: if a target
is not reconstructible from labelled/fine data, it is not reconstructible after
forgetting labels. -/
theorem not_factorsThrough_coarsened_of_not_factorsThrough_fine
    {X D E Y : Type}
    (observe : X -> D) (coarsen : D -> E) (invariant : X -> Y) :
    ¬ factorsThrough observe invariant ->
      ¬ factorsThrough (fun x => coarsen (observe x)) invariant := by
  intro hnot hcoarse
  exact hnot (factorsThrough_of_factorsThrough_coarsening
    observe coarsen invariant hcoarse)

/-- If a property is decidable from a coarsening of an operational datum, then
it is decidable from the finer operational datum. -/
theorem propertyFactorsThrough_of_propertyFactorsThrough_coarsening
    {X D E : Type}
    (observe : X -> D) (coarsen : D -> E) (property : X -> Prop) :
    propertyFactorsThrough (fun x => coarsen (observe x)) property ->
      propertyFactorsThrough observe property := by
  intro h
  apply (propertyFactorsThrough_iff_propertyConstantOnFibers
    observe property).mpr
  intro x y hxy
  have hcoarse : coarsen (observe x) = coarsen (observe y) := by
    rw [hxy]
  exact
    ((propertyFactorsThrough_iff_propertyConstantOnFibers
      (fun x => coarsen (observe x)) property).mp h) x y hcoarse

/-- Contrapositive of data-coarsening monotonicity for properties. -/
theorem not_propertyFactorsThrough_coarsened_of_not_propertyFactorsThrough_fine
    {X D E : Type}
    (observe : X -> D) (coarsen : D -> E) (property : X -> Prop) :
    ¬ propertyFactorsThrough observe property ->
      ¬ propertyFactorsThrough (fun x => coarsen (observe x)) property := by
  intro hnot hcoarse
  exact hnot (propertyFactorsThrough_of_propertyFactorsThrough_coarsening
    observe coarsen property hcoarse)

/-- A single operational fiber containing different truth values prevents
reconstruction of a property from the operational data. -/
theorem not_propertyFactorsThrough_of_fiber_counterexample {X D : Type}
    (observe : X -> D) (property : X -> Prop) {x y : X}
    (hxy : observe x = observe y) (hx : property x) (hy : ¬ property y) :
    ¬ propertyFactorsThrough observe property := by
  intro hfac
  have hconst :=
    (propertyFactorsThrough_iff_propertyConstantOnFibers observe property).mp hfac
  exact hy ((hconst x y hxy).mp hx)

/-- A same-data pair inside a hypothesis class with different property truth
values prevents any decision rule from being valid on that hypothesis class. -/
theorem not_propertyReconstructsOn_of_hypothesis_fiber_counterexample
    {X D : Type}
    (hypothesis : X -> Prop) (observe : X -> D) (property : X -> Prop)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : observe x = observe y) (hx : property x) (hy : ¬ property y) :
    ¬ propertyReconstructsOn hypothesis observe property := by
  intro hrec
  rcases hrec with ⟨reconstruct, hrec⟩
  have hxData : reconstruct (observe x) := (hrec x hhx).mpr hx
  have hyData : reconstruct (observe y) := by
    rw [← hxy]
    exact hxData
  exact hy ((hrec y hhy).mp hyData)

/-- If augmenting an observation by an extra datum decides a property that
changes on an old observation fiber, then the extra datum must separate that
counterexample pair. -/
theorem exitDatum_separates_property_fiber_counterexample {X D E : Type}
    (observe : X -> D) (exit : X -> E) (property : X -> Prop) {x y : X}
    (hobs : observe x = observe y) (hx : property x) (hy : ¬ property y) :
    propertyFactorsThrough (fun z => (observe z, exit z)) property ->
      exit x ≠ exit y := by
  intro hfac hexit
  have hpair :
      (observe x, exit x) = (observe y, exit y) := by
    exact Prod.ext hobs hexit
  have hconst :=
    (propertyFactorsThrough_iff_propertyConstantOnFibers
      (fun z => (observe z, exit z)) property).mp hfac
  exact hy ((hconst x y hpair).mp hx)

/-- If an added datum fails to distinguish an old fiber counterexample, then the
augmented observation still does not decide the changed property. -/
theorem not_propertyFactorsThrough_augmented_of_unseparated_counterexample
    {X D E : Type}
    (observe : X -> D) (exit : X -> E) (property : X -> Prop) {x y : X}
    (hobs : observe x = observe y) (hexit : exit x = exit y)
    (hx : property x) (hy : ¬ property y) :
    ¬ propertyFactorsThrough (fun z => (observe z, exit z)) property := by
  intro hfac
  exact
    (exitDatum_separates_property_fiber_counterexample observe exit property
      hobs hx hy hfac) hexit

/-- A single operational fiber containing different invariant values prevents
reconstruction of that invariant from the operational data. -/
theorem not_factorsThrough_of_fiber_counterexample {X D Y : Type}
    (observe : X -> D) (invariant : X -> Y) {x y : X}
    (hxy : observe x = observe y) (hneq : invariant x ≠ invariant y) :
    ¬ factorsThrough observe invariant := by
  intro hfac
  have hconst :=
    (factorsThrough_iff_constantOnFibers observe invariant).mp hfac
  exact hneq (hconst x y hxy)

/-- A same-data pair inside a hypothesis class with different invariant values
prevents any reconstruction rule from being valid on that hypothesis class. -/
theorem not_reconstructsOn_of_hypothesis_fiber_counterexample
    {X D Y : Type}
    (hypothesis : X -> Prop) (observe : X -> D) (invariant : X -> Y)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : observe x = observe y) (hneq : invariant x ≠ invariant y) :
    ¬ reconstructsOn hypothesis observe invariant := by
  intro hrec
  rcases hrec with ⟨reconstruct, hrec⟩
  have hvalue : invariant x = invariant y := by
    calc
      invariant x = reconstruct (observe x) := (hrec x hhx).symm
      _ = reconstruct (observe y) := by rw [hxy]
      _ = invariant y := hrec y hhy
  exact hneq hvalue

/-- Named core of the manuscript's closure/exclusion alternative.  A universal
reconstruction theorem on a hypothesis class must exclude each same-data
counterexample pair or add data that separates it; otherwise reconstruction on
that hypothesis class is impossible. -/
theorem closureExclusionDichotomyCore {X D Y : Type}
    (hypothesis : X -> Prop) (observe : X -> D) (invariant : X -> Y)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : observe x = observe y) (hneq : invariant x ≠ invariant y) :
    ¬ reconstructsOn hypothesis observe invariant := by
  exact not_reconstructsOn_of_hypothesis_fiber_counterexample
    hypothesis observe invariant hhx hhy hxy hneq

/-- Named finite/logical core of the manuscript's reconstruction criterion.  A
same-data counterexample inside the hypothesis class kills reconstruction, and
global reconstruction from the observation is exactly constancy on observation
fibers. -/
theorem operationalReconstructionCriterionCore {X D Y : Type}
    (hypothesis : X -> Prop) (observe : X -> D) (invariant : X -> Y)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : observe x = observe y) (hneq : invariant x ≠ invariant y) :
    (¬ reconstructsOn hypothesis observe invariant) ∧
      (factorsThrough observe invariant <->
        ∀ x y, observe x = observe y -> invariant x = invariant y) := by
  exact ⟨closureExclusionDichotomyCore hypothesis observe invariant
      hhx hhy hxy hneq,
    factorsThrough_iff_constantOnFibers observe invariant⟩

/-- Logical core of the closure/exit alternative.  The analytic
finite-central stability and exit analysis in the manuscript supplies the
same-data pair; once such a pair lies in the hypothesis class with different
target values, reconstruction on that class is impossible.  The accompanying
fiber criterion records the exact positive repair: the target must be constant
on operational fibers. -/
theorem closureExitAlternativeCore {X D Y : Type}
    (hypothesis : X -> Prop) (observe : X -> D) (invariant : X -> Y)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : observe x = observe y) (hneq : invariant x ≠ invariant y) :
    (¬ reconstructsOn hypothesis observe invariant) ∧
      (factorsThrough observe invariant <->
        ∀ x y, observe x = observe y -> invariant x = invariant y) := by
  exact operationalReconstructionCriterionCore hypothesis observe invariant
    hhx hhy hxy hneq

/-- Named logical core of the manuscript's quotient-factored universal no-go
corollary for ordinary invariants.  If the comparison relation is contained in
the operational fibers, one related same-data pair with different target values
kills reconstruction on the hypothesis class; conversely any reconstruction
rule on that class forces the target to be constant on every comparison pair in
the class. -/
theorem quotientVisibleUniversalNoGoCore {X D Y : Type}
    (hypothesis : X -> Prop) (observe : X -> D)
    (comparison : X -> X -> Prop) (invariant : X -> Y)
    (hcontained : comparisonContainedInFibers observe comparison)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : comparison x y) (hneq : invariant x ≠ invariant y) :
    (¬ reconstructsOn hypothesis observe invariant) ∧
      (reconstructsOn hypothesis observe invariant ->
        ∀ a b, hypothesis a -> hypothesis b -> comparison a b ->
          invariant a = invariant b) := by
  constructor
  · exact not_reconstructsOn_of_hypothesis_fiber_counterexample
      hypothesis observe invariant hhx hhy (hcontained x y hxy) hneq
  · intro hrec a b hha hhb hab
    rcases hrec with ⟨reconstruct, hrec⟩
    have hobs : observe a = observe b := hcontained a b hab
    calc
      invariant a = reconstruct (observe a) := (hrec a hha).symm
      _ = reconstruct (observe b) := by rw [hobs]
      _ = invariant b := hrec b hhb

/-- Property-valued version of `quotientVisibleUniversalNoGoCore`, used for
targets such as full support, factor-valuedness, or the two-atom predicate.
-/
theorem quotientVisibleUniversalPropertyNoGoCore {X D : Type}
    (hypothesis : X -> Prop) (observe : X -> D)
    (comparison : X -> X -> Prop) (property : X -> Prop)
    (hcontained : comparisonContainedInFibers observe comparison)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : comparison x y) (hx : property x) (hy : ¬ property y) :
    (¬ propertyReconstructsOn hypothesis observe property) ∧
      (propertyReconstructsOn hypothesis observe property ->
        ∀ a b, hypothesis a -> hypothesis b -> comparison a b ->
          (property a ↔ property b)) := by
  constructor
  · exact not_propertyReconstructsOn_of_hypothesis_fiber_counterexample
      hypothesis observe property hhx hhy (hcontained x y hxy) hx hy
  · intro hrec a b hha hhb hab
    rcases hrec with ⟨reconstruct, hrec⟩
    have hobs : observe a = observe b := hcontained a b hab
    constructor
    · intro ha
      have hdataA : reconstruct (observe a) := (hrec a hha).mpr ha
      have hdataB : reconstruct (observe b) := by
        rw [← hobs]
        exact hdataA
      exact (hrec b hhb).mp hdataB
    · intro hb
      have hdataB : reconstruct (observe b) := (hrec b hhb).mpr hb
      have hdataA : reconstruct (observe a) := by
        rw [hobs]
        exact hdataB
      exact (hrec a hha).mp hdataA

/-- Logical core of the manuscript corollary "Quotient data do not classify
their kernel".  The analytic manuscript supplies the quotient-visible
comparison pair; once two admitted candidates have the same operational data
but different kernel-classification labels, no rule from those data can
reconstruct the label. -/
theorem quotientKernelClassifierNoGoCore {X D C : Type}
    (hypothesis : X -> Prop) (observe : X -> D)
    (comparison : X -> X -> Prop) (kernelClass : X -> C)
    (hcontained : comparisonContainedInFibers observe comparison)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : comparison x y) (hneq : kernelClass x ≠ kernelClass y) :
    (¬ reconstructsOn hypothesis observe kernelClass) ∧
      (reconstructsOn hypothesis observe kernelClass ->
        ∀ a b, hypothesis a -> hypothesis b -> comparison a b ->
          kernelClass a = kernelClass b) := by
  exact quotientVisibleUniversalNoGoCore hypothesis observe comparison
    kernelClass hcontained hhx hhy hxy hneq

/-- Named finite/logical core of the copied-center probe-instrument theorem.
If all measurement data factor through a retraction, then a same-retraction
fiber with different target values prevents reconstruction from those
measurement data. -/
theorem retractedInstrumentReadoutNoGoCore {Y X D T : Type}
    (retract : Y -> X) (observe : X -> D) (target : Y -> T)
    {y y' : Y}
    (hobs : observe (retract y) = observe (retract y'))
    (hneq : target y ≠ target y') :
    ¬ factorsThrough (fun z : Y => observe (retract z)) target := by
  exact not_factorsThrough_of_fiber_counterexample
    (fun z : Y => observe (retract z)) target hobs hneq

/-- Generic finite/logical kernel for data that factor through a quotient.
If two ambient candidates have the same quotient image but different target
values, the target cannot be reconstructed from any data obtained after the
quotient.  In the manuscript the quotient is the normal quotient
`B_hat_q -> B`; Lean checks only the fiber logic after that operator-algebraic
reduction. -/
theorem quotientFactoredInvariantNoGoCore {X Q D Y : Type}
    (quotient : X -> Q) (observeQuotient : Q -> D)
    (invariant : X -> Y) {x y : X}
    (hquot : quotient x = quotient y) (hneq : invariant x ≠ invariant y) :
    ¬ factorsThrough (fun z : X => observeQuotient (quotient z)) invariant := by
  exact not_factorsThrough_of_fiber_counterexample
    (fun z : X => observeQuotient (quotient z)) invariant
    (congrArg observeQuotient hquot) hneq

/-- Property-valued version of `quotientFactoredInvariantNoGoCore`, used for
targets such as ambient support totality, factor-valuedness, or binary finite
rank. -/
theorem quotientFactoredPropertyNoGoCore {X Q D : Type}
    (quotient : X -> Q) (observeQuotient : Q -> D)
    (property : X -> Prop) {x y : X}
    (hquot : quotient x = quotient y) (hx : property x) (hy : ¬ property y) :
    ¬ propertyFactorsThrough (fun z : X => observeQuotient (quotient z)) property := by
  exact not_propertyFactorsThrough_of_fiber_counterexample
    (fun z : X => observeQuotient (quotient z)) property
    (congrArg observeQuotient hquot) hx hy

/-- Hypothesis-class version of the quotient-factored no-go: a reconstruction
theorem on a class containing two same-quotient candidates with different target
values is impossible. -/
theorem quotientFactoredReconstructsOnNoGoCore {X Q D Y : Type}
    (hypothesis : X -> Prop) (quotient : X -> Q)
    (observeQuotient : Q -> D) (invariant : X -> Y)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hquot : quotient x = quotient y) (hneq : invariant x ≠ invariant y) :
    ¬ reconstructsOn hypothesis
      (fun z : X => observeQuotient (quotient z)) invariant := by
  exact not_reconstructsOn_of_hypothesis_fiber_counterexample
    hypothesis (fun z : X => observeQuotient (quotient z)) invariant
    hhx hhy (congrArg observeQuotient hquot) hneq

/-- If augmenting an observation by an extra datum reconstructs an invariant
that changes on an old observation fiber, then the extra datum must separate
that counterexample pair. -/
theorem exitDatum_separates_fiber_counterexample {X D E Y : Type}
    (observe : X -> D) (exit : X -> E) (invariant : X -> Y) {x y : X}
    (hobs : observe x = observe y) (hneq : invariant x ≠ invariant y) :
    factorsThrough (fun z => (observe z, exit z)) invariant ->
      exit x ≠ exit y := by
  intro hfac hexit
  have hpair :
      (observe x, exit x) = (observe y, exit y) := by
    exact Prod.ext hobs hexit
  have hconst :=
    (factorsThrough_iff_constantOnFibers
      (fun z => (observe z, exit z)) invariant).mp hfac
  exact hneq (hconst x y hpair)

/-- If an added datum fails to distinguish an old fiber counterexample, then the
augmented observation still does not reconstruct the changed invariant. -/
theorem not_factorsThrough_augmented_of_unseparated_counterexample
    {X D E Y : Type}
    (observe : X -> D) (exit : X -> E) (invariant : X -> Y) {x y : X}
    (hobs : observe x = observe y) (hexit : exit x = exit y)
    (hneq : invariant x ≠ invariant y) :
    ¬ factorsThrough (fun z => (observe z, exit z)) invariant := by
  intro hfac
  exact
    (exitDatum_separates_fiber_counterexample observe exit invariant
      hobs hneq hfac) hexit

/-- Exact repair criterion for an augmented invariant datum.

Adding an exit datum to an old observation reconstructs an invariant exactly
when the exit datum separates every old same-observation pair on which the
invariant changes. -/
theorem factorsThrough_augmented_iff_exit_separates_changed_fibers
    {X D E Y : Type}
    (observe : X -> D) (exit : X -> E) (invariant : X -> Y) :
    factorsThrough (fun z => (observe z, exit z)) invariant <->
      ∀ x y,
        observe x = observe y -> invariant x ≠ invariant y -> exit x ≠ exit y := by
  constructor
  · intro hfac x y hobs hneq
    exact exitDatum_separates_fiber_counterexample observe exit invariant hobs hneq hfac
  · intro hsep
    apply (factorsThrough_iff_constantOnFibers
      (fun z => (observe z, exit z)) invariant).mpr
    intro x y hpair
    have hobs : observe x = observe y := congrArg Prod.fst hpair
    have hexit : exit x = exit y := congrArg Prod.snd hpair
    by_cases hval : invariant x = invariant y
    · exact hval
    · exact False.elim ((hsep x y hobs hval) hexit)

/-- Exact repair criterion for an augmented property datum.

Adding an exit datum decides a property exactly when the exit datum separates
every old same-observation pair on which the property truth value changes. -/
theorem propertyFactorsThrough_augmented_iff_exit_separates_changed_fibers
    {X D E : Type}
    (observe : X -> D) (exit : X -> E) (property : X -> Prop) :
    propertyFactorsThrough (fun z => (observe z, exit z)) property <->
      ∀ x y,
        observe x = observe y -> ¬ (property x ↔ property y) -> exit x ≠ exit y := by
  constructor
  · intro hfac x y hobs hdiff hexit
    have hpair :
        (observe x, exit x) = (observe y, exit y) := Prod.ext hobs hexit
    have hconst :=
      (propertyFactorsThrough_iff_propertyConstantOnFibers
        (fun z => (observe z, exit z)) property).mp hfac
    exact hdiff (hconst x y hpair)
  · intro hsep
    apply (propertyFactorsThrough_iff_propertyConstantOnFibers
      (fun z => (observe z, exit z)) property).mpr
    intro x y hpair
    have hobs : observe x = observe y := congrArg Prod.fst hpair
    have hexit : exit x = exit y := congrArg Prod.snd hpair
    by_cases hprop : property x ↔ property y
    · exact hprop
    · exact False.elim ((hsep x y hobs hprop) hexit)

/-- If a comparison relation is contained in operational fibers, then every
reconstructed invariant is constant on that comparison relation.  This is the
machine-checked logical form of restricting the operational fiber criterion to
finite-central comparison pairs. -/
theorem factorsThrough_implies_constantOnComparison {X D Y : Type}
    (observe : X -> D) (comparison : X -> X -> Prop)
    (invariant : X -> Y)
    (hsub : comparisonContainedInFibers observe comparison) :
    factorsThrough observe invariant ->
      constantOnComparison comparison invariant := by
  intro hfac x y hxy
  have hconst :=
    (factorsThrough_iff_constantOnFibers observe invariant).mp hfac
  exact hconst x y (hsub x y hxy)

/-- If a comparison relation is contained in operational fibers, then every
reconstructed property is constant on that comparison relation. -/
theorem propertyFactorsThrough_implies_propertyConstantOnComparison
    {X D : Type} (observe : X -> D) (comparison : X -> X -> Prop)
    (property : X -> Prop)
    (hsub : comparisonContainedInFibers observe comparison) :
    propertyFactorsThrough observe property ->
      propertyConstantOnComparison comparison property := by
  intro hfac x y hxy
  have hconst :=
    (propertyFactorsThrough_iff_propertyConstantOnFibers observe property).mp hfac
  exact hconst x y (hsub x y hxy)

/-- A single comparison pair lying inside an operational fiber and carrying
different invariant values prevents reconstruction. -/
theorem not_factorsThrough_of_comparison_counterexample {X D Y : Type}
    (observe : X -> D) (comparison : X -> X -> Prop)
    (invariant : X -> Y) {x y : X}
    (hsub : comparisonContainedInFibers observe comparison)
    (hxy : comparison x y) (hneq : invariant x ≠ invariant y) :
    ¬ factorsThrough observe invariant := by
  exact not_factorsThrough_of_fiber_counterexample observe invariant
    (hsub x y hxy) hneq

/-- A single comparison pair lying inside an operational fiber and carrying
different property truth values prevents property reconstruction. -/
theorem not_propertyFactorsThrough_of_comparison_counterexample
    {X D : Type} (observe : X -> D) (comparison : X -> X -> Prop)
    (property : X -> Prop) {x y : X}
    (hsub : comparisonContainedInFibers observe comparison)
    (hxy : comparison x y) (hx : property x) (hy : ¬ property y) :
    ¬ propertyFactorsThrough observe property := by
  exact not_propertyFactorsThrough_of_fiber_counterexample observe property
    (hsub x y hxy) hx hy

/-- A point is fixed by every transformation in a family. -/
def fixedByFamily {J X : Type} (action : J -> X -> X) (x : X) : Prop :=
  ∀ j, action j x = x

/-- Componentwise action of a family of transformations on a finite direct
sum. -/
def componentwiseAction {J X : Type} {m : Nat}
    (action : J -> X -> X) (j : J) (f : Fin m -> X) : Fin m -> X :=
  fun i => action j (f i)

/-- A componentwise family fixes a finite direct-sum vector exactly when it
fixes every component.  This is the finite skeleton of the fixed-point
calculation used for copied centers and dynamical locality. -/
theorem fixedByFamily_componentwise_iff {J X : Type} {m : Nat}
    (action : J -> X -> X) (f : Fin m -> X) :
    fixedByFamily (fun j => componentwiseAction action j) f <->
      ∀ i, fixedByFamily action (f i) := by
  constructor
  · intro h i j
    exact congrArg (fun g : Fin m -> X => g i) (h j)
  · intro h j
    funext i
    exact h i j

/-- Machine-checked finite skeleton of the copied-center dynamical-locality
argument: if the original kinematic local predicate agrees with the fixed-point
predicate of the relative-Cauchy-evolution family, then the finite direct-sum
copy has the corresponding componentwise equality.  The analytic content of
Fewster--Verch dynamical locality is supplied in the manuscript; this theorem is
the finite fixed-point calculation used after tensoring with a constant finite
center. -/
theorem copiedCenterDynamicalLocalityCore {J X : Type} {m : Nat}
    (kinematic : X -> Prop) (action : J -> X -> X)
    (hlocal : ∀ x, kinematic x <-> fixedByFamily action x)
    (f : Fin m -> X) :
    (∀ i, kinematic (f i)) <->
      fixedByFamily (fun j => componentwiseAction action j) f := by
  rw [fixedByFamily_componentwise_iff]
  constructor
  · intro hkin i
    exact (hlocal (f i)).mp (hkin i)
  · intro hfix i
    exact (hlocal (f i)).mpr (hfix i)

/-- A Nat-valued atomic idempotent of a finite abelian algebra. -/
def atomOn {m : Nat} (i : Fin m) : Fin m -> Nat :=
  fun j => if j = i then 1 else 0

theorem atomOn_self {m : Nat} (i : Fin m) :
    atomOn i i = 1 := by
  simp [atomOn]

/-- Vanishing on the represented support. -/
def supportedNull {m : Nat}
    (support : Fin m -> Bool) (f : Fin m -> Nat) : Prop :=
  ∀ i, support i = true -> f i = 0

/-- Equality after quotienting by functions vanishing on the represented
support. -/
def sameSupportedRepresentation {m : Nat}
    (support : Fin m -> Bool) (f g : Fin m -> Nat) : Prop :=
  ∀ i, support i = true -> f i = g i

/-- A Boolean projection in the finite abelian algebra. -/
def projectionOn {m : Nat} (mask : Fin m -> Bool) : Fin m -> Nat :=
  fun i => if mask i = true then 1 else 0

/-- The represented support has at most one atom. -/
def supportAtMostOne {m : Nat} (support : Fin m -> Bool) : Prop :=
  ∀ i j, support i = true -> support j = true -> i = j

/-- The represented support has at least one atom. -/
def supportNonempty {m : Nat} (support : Fin m -> Bool) : Prop :=
  ∃ i, support i = true

/-- The represented support is a singleton. -/
def supportSingleton {m : Nat} (support : Fin m -> Bool) : Prop :=
  ∃ i, support i = true ∧ ∀ j, support j = true -> j = i

/-- The represented support contains every atom of the finite center. -/
def supportFull {m : Nat} (support : Fin m -> Bool) : Prop :=
  ∀ i, support i = true

/-- Every represented Boolean projection is either zero or the unit.  This is
the finite commutative projection-lattice shadow of being a factor. -/
def allRepresentedProjectionsTrivial {m : Nat}
    (support : Fin m -> Bool) : Prop :=
  ∀ mask,
    sameSupportedRepresentation support (projectionOn mask) (fun _ => 0) ∨
    sameSupportedRepresentation support (projectionOn mask) (fun _ => 1)

/-- A represented Boolean projection is genuinely nontrivial when it is neither
zero nor the unit after quotienting by the represented support. -/
def representedProjectionNontrivial {m : Nat}
    (support : Fin m -> Bool) (mask : Fin m -> Bool) : Prop :=
  ¬ sameSupportedRepresentation support (projectionOn mask) (fun _ => 0) ∧
  ¬ sameSupportedRepresentation support (projectionOn mask) (fun _ => 1)

/-- The quotient map from finite central functions to the represented quotient is
faithful when only the zero function is represented as zero. -/
def representedCenterFaithful {m : Nat} (support : Fin m -> Bool) : Prop :=
  ∀ f : Fin m -> Nat,
    sameSupportedRepresentation support f (fun _ => 0) -> f = fun _ => 0

theorem sameSupportedRepresentation_iff_agree_on_support {m : Nat}
    (support : Fin m -> Bool) (f g : Fin m -> Nat) :
    sameSupportedRepresentation support f g <->
      ∀ i, support i = true -> f i = g i := by
  rfl

theorem sameSupportedRepresentation_refl {m : Nat}
    (support : Fin m -> Bool) (f : Fin m -> Nat) :
    sameSupportedRepresentation support f f := by
  intro i hi
  rfl

theorem sameSupportedRepresentation_symm {m : Nat}
    {support : Fin m -> Bool} {f g : Fin m -> Nat} :
    sameSupportedRepresentation support f g ->
    sameSupportedRepresentation support g f := by
  intro h i hi
  exact (h i hi).symm

theorem sameSupportedRepresentation_trans {m : Nat}
    {support : Fin m -> Bool} {f g h : Fin m -> Nat} :
    sameSupportedRepresentation support f g ->
    sameSupportedRepresentation support g h ->
    sameSupportedRepresentation support f h := by
  intro hfg hgh i hi
  exact (hfg i hi).trans (hgh i hi)

theorem sameSupportedRepresentation_zero_iff_supportedNull {m : Nat}
    (support : Fin m -> Bool) (f : Fin m -> Nat) :
    sameSupportedRepresentation support f (fun _ => 0) <->
      supportedNull support f := by
  rfl

/-- A Boolean projection is zero in the represented quotient exactly when its
mask is false on the represented support. -/
theorem projectionOn_same_zero_iff_false_on_support {m : Nat}
    (support mask : Fin m -> Bool) :
    sameSupportedRepresentation support (projectionOn mask) (fun _ => 0) <->
      ∀ i, support i = true -> mask i = false := by
  constructor
  · intro h i hi
    have hz := h i hi
    cases hm : mask i
    · rfl
    · simp [projectionOn, hm] at hz
  · intro h i hi
    have hm := h i hi
    simp [projectionOn, hm]

/-- A Boolean projection is the unit in the represented quotient exactly when
its mask is true on the represented support. -/
theorem projectionOn_same_one_iff_true_on_support {m : Nat}
    (support mask : Fin m -> Bool) :
    sameSupportedRepresentation support (projectionOn mask) (fun _ => 1) <->
      ∀ i, support i = true -> mask i = true := by
  constructor
  · intro h i hi
    have hone := h i hi
    cases hm : mask i
    · simp [projectionOn, hm] at hone
    · rfl
  · intro h i hi
    have hm := h i hi
    simp [projectionOn, hm]

/-- A represented Boolean projection is nontrivial exactly when its mask both
selects and omits represented atoms. -/
theorem representedProjectionNontrivial_iff_split_support {m : Nat}
    (support mask : Fin m -> Bool) :
    representedProjectionNontrivial support mask <->
      (∃ i, support i = true ∧ mask i = true) ∧
      (∃ j, support j = true ∧ mask j = false) := by
  unfold representedProjectionNontrivial
  constructor
  · intro h
    rcases h with ⟨hnotZero, hnotOne⟩
    constructor
    · by_cases hsel : ∃ i, support i = true ∧ mask i = true
      · exact hsel
      · exact False.elim (hnotZero (by
          rw [projectionOn_same_zero_iff_false_on_support]
          intro i hi
          cases hm : mask i
          · rfl
          · exact False.elim (hsel ⟨i, hi, hm⟩)))
    · by_cases homits : ∃ i, support i = true ∧ mask i = false
      · exact homits
      · exact False.elim (hnotOne (by
          rw [projectionOn_same_one_iff_true_on_support]
          intro i hi
          cases hm : mask i
          · exact False.elim (homits ⟨i, hi, hm⟩)
          · rfl))
  · intro h
    rcases h with ⟨⟨i, hi, hmaski⟩, ⟨j, hj, hmaskj⟩⟩
    constructor
    · intro hzero
      have hz := hzero i hi
      simp [projectionOn, hmaski] at hz
    · intro hone
      have ho := hone j hj
      simp [projectionOn, hmaskj] at ho

/-- If the represented support contains two distinct atoms, then the
represented quotient has a nontrivial Boolean projection. -/
theorem two_supported_atoms_give_nontrivial_projection {m : Nat}
    (support : Fin m -> Bool) {i j : Fin m}
    (hi : support i = true) (hj : support j = true) (hij : i ≠ j) :
    ∃ mask, representedProjectionNontrivial support mask := by
  let mask : Fin m -> Bool := fun k => decide (k = i)
  refine ⟨mask, ?_⟩
  rw [representedProjectionNontrivial_iff_split_support]
  constructor
  · exact ⟨i, hi, by simp [mask]⟩
  · have hji : ¬j = i := by
      intro h
      exact hij h.symm
    exact ⟨j, hj, by simp [mask, hji]⟩

theorem supportSingleton_iff_nonempty_atMostOne {m : Nat}
    (support : Fin m -> Bool) :
    supportSingleton support <->
      supportNonempty support ∧ supportAtMostOne support := by
  constructor
  · intro h
    rcases h with ⟨i, hi, huniq⟩
    constructor
    · exact ⟨i, hi⟩
    · intro j k hj hk
      exact (huniq j hj).trans (huniq k hk).symm
  · intro h
    rcases h with ⟨⟨i, hi⟩, huniq⟩
    exact ⟨i, hi, fun j hj => huniq j i hj hi⟩

/-- In a finite commutative represented quotient, all Boolean projections are
trivial exactly when the represented support contains at most one atom. -/
theorem allRepresentedProjectionsTrivial_iff_supportAtMostOne {m : Nat}
    (support : Fin m -> Bool) :
    allRepresentedProjectionsTrivial support <->
      supportAtMostOne support := by
  constructor
  · intro h i j hi hj
    by_cases hij : i = j
    · exact hij
    · have hproj := h (fun k => decide (k = i))
      cases hproj with
      | inl hzero =>
          have hz := hzero i hi
          simp [projectionOn] at hz
      | inr hone =>
          have hj_ne_i : ¬j = i := by
            intro hji
            exact hij hji.symm
          have ho := hone j hj
          simp [projectionOn, hj_ne_i] at ho
  · intro h mask
    by_cases exists_selected :
        ∃ i, support i = true ∧ mask i = true
    · rcases exists_selected with ⟨i, hi, hmaski⟩
      right
      intro j hj
      have hji := h j i hj hi
      subst j
      simp [projectionOn, hmaski]
    · left
      intro j hj
      have hmaskj : mask j ≠ true := by
        intro htrue
        exact exists_selected ⟨j, hj, htrue⟩
      have hmaskj_false : mask j = false := by
        cases hmask : mask j <;> simp [hmask] at hmaskj ⊢
      simp [projectionOn, hmaskj_false]

theorem allRepresentedProjectionsTrivial_iff_supportSingleton_of_nonempty
    {m : Nat} (support : Fin m -> Bool)
    (hne : supportNonempty support) :
    allRepresentedProjectionsTrivial support <->
      supportSingleton support := by
  rw [allRepresentedProjectionsTrivial_iff_supportAtMostOne,
    supportSingleton_iff_nonempty_atMostOne]
  constructor
  · intro h
    exact ⟨hne, h⟩
  · intro h
    exact h.2

/-- An atom outside the represented support vanishes in the represented
quotient. -/
theorem unsupported_atom_is_supportedNull {m : Nat}
    (support : Fin m -> Bool) (i : Fin m) (hi : support i = false) :
    supportedNull support (atomOn i) := by
  intro j hj
  by_cases hji : j = i
  · subst j
    rw [hi] at hj
    cases hj
  · simp [atomOn, hji]

theorem unsupported_atom_sameSupportedRepresentation_zero {m : Nat}
    (support : Fin m -> Bool) (i : Fin m) (hi : support i = false) :
    sameSupportedRepresentation support (atomOn i) (fun _ => 0) := by
  rw [sameSupportedRepresentation_zero_iff_supportedNull]
  exact unsupported_atom_is_supportedNull support i hi

/-- An atom is zero in the represented quotient exactly when it is outside the
represented support. -/
theorem atomOn_sameSupportedRepresentation_zero_iff_not_support {m : Nat}
    (support : Fin m -> Bool) (i : Fin m) :
    sameSupportedRepresentation support (atomOn i) (fun _ => 0) <->
      support i = false := by
  constructor
  · intro h
    cases hs : support i
    · rfl
    · have hz := h i hs
      simp [atomOn] at hz
  · intro hi
    exact unsupported_atom_sameSupportedRepresentation_zero support i hi

/-- The same unsupported atom is still nonzero in the full finite algebra. -/
theorem atomOn_not_zero_function {m : Nat} (i : Fin m) :
    Not (atomOn i = fun _ => 0) := by
  intro h
  have h1 := congrArg (fun f => f i) h
  simp [atomOn] at h1

/-- Full support is equivalent to having no unsupported atom. -/
theorem supportFull_iff_no_unsupported_atom {m : Nat}
    (support : Fin m -> Bool) :
    supportFull support <-> ¬ ∃ i, support i = false := by
  constructor
  · intro h hbad
    rcases hbad with ⟨i, hi⟩
    rw [h i] at hi
    cases hi
  · intro h i
    cases hs : support i
    · exact False.elim (h ⟨i, hs⟩)
    · rfl

/-- The represented quotient is faithful on finite central functions exactly when
the represented support is full. -/
theorem representedCenterFaithful_iff_supportFull {m : Nat}
    (support : Fin m -> Bool) :
    representedCenterFaithful support <-> supportFull support := by
  constructor
  · intro h i
    cases hs : support i
    · have hz :
          sameSupportedRepresentation support (atomOn i) (fun _ => 0) :=
        unsupported_atom_sameSupportedRepresentation_zero support i hs
      have hfun := h (atomOn i) hz
      have h1 := congrArg (fun f => f i) hfun
      simp [atomOn] at h1
    · rfl
  · intro h f hf
    funext i
    exact hf i (h i)

/-- If the represented support is not full, a nonzero central atom is represented
as zero. -/
theorem not_supportFull_gives_invisible_nonzero_atom {m : Nat}
    (support : Fin m -> Bool) :
    ¬ supportFull support ->
      ∃ i,
        sameSupportedRepresentation support (atomOn i) (fun _ => 0) ∧
          Not (atomOn i = fun _ => 0) := by
  intro hnot
  by_cases hunsupported : ∃ i, support i = false
  · rcases hunsupported with ⟨i, hi⟩
    exact ⟨i, unsupported_atom_sameSupportedRepresentation_zero support i hi,
      atomOn_not_zero_function i⟩
  · exact False.elim
      (hnot ((supportFull_iff_no_unsupported_atom support).mpr hunsupported))

/-- Failure of represented faithfulness is exactly the existence of a nonzero
central atom that is killed by the represented quotient. -/
theorem not_representedCenterFaithful_iff_exists_invisible_nonzero_atom
    {m : Nat} (support : Fin m -> Bool) :
    ¬ representedCenterFaithful support <->
      ∃ i,
        sameSupportedRepresentation support (atomOn i) (fun _ => 0) ∧
          Not (atomOn i = fun _ => 0) := by
  constructor
  · intro hnot
    have hnotFull : ¬ supportFull support := by
      intro hfull
      exact hnot ((representedCenterFaithful_iff_supportFull support).mpr hfull)
    exact not_supportFull_gives_invisible_nonzero_atom support hnotFull
  · intro hex hfaithful
    rcases hex with ⟨i, hzero, hnonzero⟩
    exact hnonzero (hfaithful (atomOn i) hzero)

/-- The support seen by a family of represented finite-center quotients is the
union of the atoms seen by at least one member of the family. -/
noncomputable def familySupport {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) : Fin m -> Bool :=
  by
    classical
    exact fun i => if ∃ b, supports b i = true then true else false

/-- A family of represented supports covers all finite central atoms. -/
def familyCoversAtoms {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) : Prop :=
  ∀ i, ∃ b, supports b i = true

/-- The direct-sum finite-center representation associated with a family of
supports is faithful when the union support is faithful. -/
def familyRepresentedCenterFaithful {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) : Prop :=
  representedCenterFaithful (familySupport supports)

theorem familySupport_true_iff {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) (i : Fin m) :
    familySupport supports i = true <->
      ∃ b, supports b i = true := by
  classical
  unfold familySupport
  by_cases h : ∃ b, supports b i = true
  · simp [h]
  · simp [h]

theorem supportFull_familySupport_iff_familyCoversAtoms
    {β : Type} {m : Nat} (supports : β -> Fin m -> Bool) :
    supportFull (familySupport supports) <->
      familyCoversAtoms supports := by
  constructor
  · intro hfull i
    exact (familySupport_true_iff supports i).mp (hfull i)
  · intro hcover i
    exact (familySupport_true_iff supports i).mpr (hcover i)

/-- A family of represented finite-center quotients is faithful on the full
finite center exactly when the family sees every central atom.  This is the
finite Boolean skeleton of the central-support family criterion in the
manuscript. -/
theorem familyRepresentedCenterFaithful_iff_familyCoversAtoms
    {β : Type} {m : Nat} (supports : β -> Fin m -> Bool) :
    familyRepresentedCenterFaithful supports <->
      familyCoversAtoms supports := by
  rw [familyRepresentedCenterFaithful,
    representedCenterFaithful_iff_supportFull,
    supportFull_familySupport_iff_familyCoversAtoms]

/-- Named finite skeleton of the joint central support criterion: the union of
the atoms detected by a readout family is full exactly when the family is
faithful on the finite central positive cone. -/
theorem jointCentralSupportReadoutFamilyCore
    {β : Type} {m : Nat} (supports : β -> Fin m -> Bool) :
    familyRepresentedCenterFaithful supports <->
      familyCoversAtoms supports := by
  exact familyRepresentedCenterFaithful_iff_familyCoversAtoms supports

/-- If a family of represented supports does not cover every central atom, then
some nonzero finite central atom is killed by the direct-sum represented
quotient. -/
theorem not_familyCoversAtoms_gives_family_invisible_nonzero_atom
    {β : Type} {m : Nat} (supports : β -> Fin m -> Bool) :
    ¬ familyCoversAtoms supports ->
      ∃ i,
        sameSupportedRepresentation (familySupport supports) (atomOn i)
          (fun _ => 0) ∧
          Not (atomOn i = fun _ => 0) := by
  intro hnot
  have hnotFull : ¬ supportFull (familySupport supports) := by
    intro hfull
    exact hnot
      ((supportFull_familySupport_iff_familyCoversAtoms supports).mp hfull)
  exact not_supportFull_gives_invisible_nonzero_atom (familySupport supports)
    hnotFull

/-- An atom is absent from the family support exactly when every member of the
family misses that atom. -/
theorem familySupport_false_iff_all_false {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) (i : Fin m) :
    familySupport supports i = false <->
      ∀ b, supports b i = false := by
  classical
  constructor
  · intro hfalse b
    cases hb : supports b i
    · rfl
    · have htrue : familySupport supports i = true :=
        (familySupport_true_iff supports i).mpr ⟨b, hb⟩
      rw [hfalse] at htrue
      cases htrue
  · intro hall
    cases hfs : familySupport supports i
    · rfl
    · rcases (familySupport_true_iff supports i).mp hfs with ⟨b, hb⟩
      rw [hall b] at hb
      cases hb

/-- A finite central quotient mask kills exactly the atoms outside a represented
support. -/
def killsExactlyUnsupported {m : Nat}
    (support killed : Fin m -> Bool) : Prop :=
  ∀ i, killed i = true ↔ support i = false

/-- A family null-quotient mask kills exactly the central atoms missed by every
represented member of the family. -/
def exactFamilyNullQuotientMask {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) (killed : Fin m -> Bool) : Prop :=
  ∀ i, killed i = true ↔ ∀ b, supports b i = false

/-- Exact family null quotients are exactly quotient masks that kill the
complement of the family support.  This is the finite Boolean skeleton of the
central null quotient criterion in the manuscript. -/
theorem exactFamilyNullQuotientMask_iff_killsExactlyFamilyUnsupported
    {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) (killed : Fin m -> Bool) :
    exactFamilyNullQuotientMask supports killed <->
      killsExactlyUnsupported (familySupport supports) killed := by
  constructor
  · intro h i
    constructor
    · intro hk
      exact (familySupport_false_iff_all_false supports i).mpr
        ((h i).mp hk)
    · intro hmiss
      exact (h i).mpr
        ((familySupport_false_iff_all_false supports i).mp hmiss)
  · intro h i
    constructor
    · intro hk
      exact (familySupport_false_iff_all_false supports i).mp
        ((h i).mp hk)
    · intro hall
      exact (h i).mpr
        ((familySupport_false_iff_all_false supports i).mpr hall)

/-- If the family misses an atom and the quotient mask is exact, then the
quotient kills a nonzero finite central atom. -/
theorem exactFamilyNullQuotientMask_kills_missed_nonzero_atom
    {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) (killed : Fin m -> Bool) :
    exactFamilyNullQuotientMask supports killed ->
    ¬ familyCoversAtoms supports ->
      ∃ i, killed i = true ∧ Not (atomOn i = fun _ => 0) := by
  intro hexact hnotCover
  by_cases hmissing : ∃ i, ∀ b, supports b i = false
  · rcases hmissing with ⟨i, hall⟩
    exact ⟨i, (hexact i).mpr hall, atomOn_not_zero_function i⟩
  · have hcover : familyCoversAtoms supports := by
      intro i
      by_cases hex : ∃ b, supports b i = true
      · exact hex
      · have hall : ∀ b, supports b i = false := by
          intro b
          cases hb : supports b i
          · rfl
          · exact False.elim (hex ⟨b, hb⟩)
        exact False.elim (hmissing ⟨i, hall⟩)
    exact False.elim (hnotCover hcover)

/-- Two candidate finite centers used to witness that blind represented data do
not reconstruct support totality. -/
inductive SupportTotalityCandidate where
  | full
  | character
  deriving DecidableEq

/-- The blind represented observation forgets whether the ambient support was
full or only the character support. -/
def blindSupportObservation (_ : SupportTotalityCandidate) : Unit :=
  ()

/-- The ambient support associated with the two support-totality candidates. -/
def supportOfCandidate : SupportTotalityCandidate -> Fin 2 -> Bool
  | SupportTotalityCandidate.full => fun _ => true
  | SupportTotalityCandidate.character => fun i => if i = 0 then true else false

/-- The property that the candidate has full finite-central support. -/
def candidateHasFullSupport (candidate : SupportTotalityCandidate) : Prop :=
  supportFull (supportOfCandidate candidate)

/-- The full-support candidate has full support. -/
theorem fullCandidate_hasFullSupport :
    candidateHasFullSupport SupportTotalityCandidate.full := by
  intro i
  rfl

/-- The character-supported candidate does not have full support. -/
theorem characterCandidate_notHasFullSupport :
    ¬ candidateHasFullSupport SupportTotalityCandidate.character := by
  intro hfull
  have hmissing := hfull (1 : Fin 2)
  simp [supportOfCandidate] at hmissing

/-- Full support is not reconstructible from a blind represented observation:
the full-support and character-support candidates lie in one operational fiber
but have different support-totality truth values. -/
theorem supportFull_not_propertyFactorsThrough_blindObservation :
    ¬ propertyFactorsThrough blindSupportObservation candidateHasFullSupport := by
  exact not_propertyFactorsThrough_of_fiber_counterexample
    blindSupportObservation
    candidateHasFullSupport
    (x := SupportTotalityCandidate.full)
    (y := SupportTotalityCandidate.character)
    rfl
    fullCandidate_hasFullSupport
    characterCandidate_notHasFullSupport

/-- The full-support and character-supported candidates have different support
masks. -/
theorem supportOfCandidate_full_ne_character :
    supportOfCandidate SupportTotalityCandidate.full ≠
      supportOfCandidate SupportTotalityCandidate.character := by
  intro hsame
  have hvalue := congrFun hsame (1 : Fin 2)
  simp [supportOfCandidate] at hvalue

/-- Sharp support-totality repair criterion for the two-candidate finite
witness: an added datum decides full support exactly when it separates the
full-support and character-supported candidates. -/
theorem supportTotality_augmented_iff_exit_separates_full_character
    {E : Type} (exit : SupportTotalityCandidate -> E) :
    propertyFactorsThrough
        (fun candidate => (blindSupportObservation candidate, exit candidate))
        candidateHasFullSupport <->
      exit SupportTotalityCandidate.full ≠
        exit SupportTotalityCandidate.character := by
  rw [propertyFactorsThrough_augmented_iff_exit_separates_changed_fibers]
  constructor
  · intro h
    exact h SupportTotalityCandidate.full SupportTotalityCandidate.character rfl
      (by
        intro hiff
        exact characterCandidate_notHasFullSupport
          (hiff.mp fullCandidate_hasFullSupport))
  · intro hsep x y _hobs hdiff
    cases x <;> cases y
    · simp at hdiff
    · exact hsep
    · intro h
      exact hsep h.symm
    · simp at hdiff

/-- Supplying the represented support mask as an added datum decides support
totality in the finite witness. -/
theorem supportOfCandidate_augmented_decides_candidateHasFullSupport :
    propertyFactorsThrough
        (fun candidate =>
          (blindSupportObservation candidate, supportOfCandidate candidate))
        candidateHasFullSupport := by
  rw [supportTotality_augmented_iff_exit_separates_full_character]
  exact supportOfCandidate_full_ne_character

/-- Two finite central cardinality candidates, used to isolate the special
two-atom-vs-non-two-atom question. -/
inductive MultiplicityCandidate where
  | binary
  | ternary
  deriving DecidableEq

/-- The blind observation records no finite central cardinality data. -/
def blindMultiplicityObservation (_ : MultiplicityCandidate) : Unit :=
  ()

/-- The finite central cardinality carried by the candidate. -/
def finiteCentralMultiplicity : MultiplicityCandidate -> Nat
  | MultiplicityCandidate.binary => 2
  | MultiplicityCandidate.ternary => 3

/-- The finite-central comparison pair between two and three central atoms. -/
def binaryTernaryComparison :
    MultiplicityCandidate -> MultiplicityCandidate -> Prop
  | MultiplicityCandidate.binary, MultiplicityCandidate.ternary => True
  | _, _ => False

/-- The binary and ternary candidates lie inside one blind operational fiber. -/
theorem binaryTernaryComparison_containedInFibers :
    comparisonContainedInFibers blindMultiplicityObservation
      binaryTernaryComparison := by
  intro _ _ _
  rfl

/-- Binary and ternary finite central cardinalities differ. -/
theorem finiteCentralMultiplicity_binary_ne_ternary :
    finiteCentralMultiplicity MultiplicityCandidate.binary ≠
      finiteCentralMultiplicity MultiplicityCandidate.ternary := by
  simp [finiteCentralMultiplicity]

/-- Blind data do not reconstruct finite central cardinality, even for the
specific two-atom-vs-three-atom comparison. -/
theorem finiteCentralMultiplicity_not_factorsThrough_blindObservation :
    ¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity := by
  exact not_factorsThrough_of_comparison_counterexample
    blindMultiplicityObservation
    binaryTernaryComparison
    finiteCentralMultiplicity
    binaryTernaryComparison_containedInFibers
    (show binaryTernaryComparison MultiplicityCandidate.binary
        MultiplicityCandidate.ternary from trivial)
    finiteCentralMultiplicity_binary_ne_ternary

/-- Compatibility predicate: the finite central cardinality is specifically two. -/
def isBinaryMultiplicity : MultiplicityCandidate -> Prop
  | MultiplicityCandidate.binary => True
  | MultiplicityCandidate.ternary => False

/-- Standard-language version of the same finite-center property: the hidden
finite central summand has exactly two minimal central atoms. -/
def hasExactlyTwoCentralAtoms (candidate : MultiplicityCandidate) : Prop :=
  finiteCentralMultiplicity candidate = 2

/-- Coarse binary tests are available in both the binary and ternary finite
classical systems.  This records only the existence of a two-outcome
coarse-graining, not the full list of such tests. -/
def hasBinaryCoarseGraining (_candidate : MultiplicityCandidate) : Prop :=
  True

/-- The observation that a binary coarse-graining is available is the same for
the binary and ternary candidates. -/
def binaryCoarseGrainingObservation (_candidate : MultiplicityCandidate) : Unit :=
  ()

/-- The binary candidate satisfies the binary predicate. -/
theorem binaryCandidate_isBinary :
    isBinaryMultiplicity MultiplicityCandidate.binary := by
  trivial

/-- The ternary candidate does not satisfy the binary predicate. -/
theorem ternaryCandidate_not_isBinary :
    ¬ isBinaryMultiplicity MultiplicityCandidate.ternary := by
  intro h
  exact h

/-- The binary candidate has exactly two finite central atoms. -/
theorem binaryCandidate_hasExactlyTwoCentralAtoms :
    hasExactlyTwoCentralAtoms MultiplicityCandidate.binary := by
  rfl

/-- The ternary candidate does not have exactly two finite central atoms. -/
theorem ternaryCandidate_not_hasExactlyTwoCentralAtoms :
    ¬ hasExactlyTwoCentralAtoms MultiplicityCandidate.ternary := by
  simp [hasExactlyTwoCentralAtoms, finiteCentralMultiplicity]

/-- Blind multiplicity data do not decide the standard property that the hidden
finite central summand has exactly two minimal central atoms. -/
theorem hasExactlyTwoCentralAtoms_not_propertyFactorsThrough_blindObservation :
    ¬ propertyFactorsThrough blindMultiplicityObservation
      hasExactlyTwoCentralAtoms := by
  exact not_propertyFactorsThrough_of_comparison_counterexample
    blindMultiplicityObservation
    binaryTernaryComparison
    hasExactlyTwoCentralAtoms
    binaryTernaryComparison_containedInFibers
    (show binaryTernaryComparison MultiplicityCandidate.binary
        MultiplicityCandidate.ternary from trivial)
    binaryCandidate_hasExactlyTwoCentralAtoms
    ternaryCandidate_not_hasExactlyTwoCentralAtoms

/-- Blind data do not even decide the Prop-valued question "does the hidden
finite center have exactly two atoms?" -/
theorem isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation :
    ¬ propertyFactorsThrough blindMultiplicityObservation isBinaryMultiplicity := by
  exact not_propertyFactorsThrough_of_comparison_counterexample
    blindMultiplicityObservation
    binaryTernaryComparison
    isBinaryMultiplicity
    binaryTernaryComparison_containedInFibers
    (show binaryTernaryComparison MultiplicityCandidate.binary
        MultiplicityCandidate.ternary from trivial)
    binaryCandidate_isBinary
    ternaryCandidate_not_isBinary

/-- Machine-checked finite core of the corrected support/cardinality split in the
front support theorem: support totality is refuted by the full-support versus
character-support pair, while finite cardinality and the two-atom predicate are
refuted by the separate binary-versus-ternary pair. -/
theorem supportTotalityAndBinaryRankSplitCore :
    (¬ propertyFactorsThrough blindSupportObservation candidateHasFullSupport) ∧
    (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
    (¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity) ∧
    candidateHasFullSupport SupportTotalityCandidate.full ∧
    (¬ candidateHasFullSupport SupportTotalityCandidate.character) ∧
    finiteCentralMultiplicity MultiplicityCandidate.binary = 2 ∧
    finiteCentralMultiplicity MultiplicityCandidate.ternary = 3 ∧
    isBinaryMultiplicity MultiplicityCandidate.binary ∧
    (¬ isBinaryMultiplicity MultiplicityCandidate.ternary) := by
  exact ⟨supportFull_not_propertyFactorsThrough_blindObservation,
    finiteCentralMultiplicity_not_factorsThrough_blindObservation,
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation,
    fullCandidate_hasFullSupport,
    characterCandidate_notHasFullSupport,
    rfl,
    rfl,
    binaryCandidate_isBinary,
    ternaryCandidate_not_isBinary⟩

/-- Standard-language wrapper for the front support theorem: support totality is
refuted by the full-support versus character-support pair, while hidden finite
central cardinality and the two-atom condition are refuted by the separate
two-versus-three atom pair. -/
theorem supportTotalityAndFiniteCentralCardinalitySplitCore :
    (¬ propertyFactorsThrough blindSupportObservation candidateHasFullSupport) ∧
    (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
    (¬ propertyFactorsThrough blindMultiplicityObservation
      hasExactlyTwoCentralAtoms) ∧
    candidateHasFullSupport SupportTotalityCandidate.full ∧
    (¬ candidateHasFullSupport SupportTotalityCandidate.character) ∧
    finiteCentralMultiplicity MultiplicityCandidate.binary = 2 ∧
    finiteCentralMultiplicity MultiplicityCandidate.ternary = 3 ∧
    hasExactlyTwoCentralAtoms MultiplicityCandidate.binary ∧
    (¬ hasExactlyTwoCentralAtoms MultiplicityCandidate.ternary) := by
  exact ⟨supportFull_not_propertyFactorsThrough_blindObservation,
    finiteCentralMultiplicity_not_factorsThrough_blindObservation,
    hasExactlyTwoCentralAtoms_not_propertyFactorsThrough_blindObservation,
    fullCandidate_hasFullSupport,
    characterCandidate_notHasFullSupport,
    rfl,
    rfl,
    binaryCandidate_hasExactlyTwoCentralAtoms,
    ternaryCandidate_not_hasExactlyTwoCentralAtoms⟩

/-- The all-candidates hypothesis class for the binary-vs-ternary witness. -/
def allMultiplicityCandidates (_candidate : MultiplicityCandidate) : Prop :=
  True

/-- Even on the all-candidates hypothesis class, blind data do not reconstruct
the finite central cardinality. -/
theorem finiteCentralMultiplicity_not_reconstructsOn_allCandidates :
    ¬ reconstructsOn allMultiplicityCandidates
        blindMultiplicityObservation finiteCentralMultiplicity := by
  exact not_reconstructsOn_of_hypothesis_fiber_counterexample
    allMultiplicityCandidates
    blindMultiplicityObservation
    finiteCentralMultiplicity
    (show allMultiplicityCandidates MultiplicityCandidate.binary from trivial)
    (show allMultiplicityCandidates MultiplicityCandidate.ternary from trivial)
    (show blindMultiplicityObservation MultiplicityCandidate.binary =
        blindMultiplicityObservation MultiplicityCandidate.ternary from rfl)
    finiteCentralMultiplicity_binary_ne_ternary

/-- Even on the all-candidates hypothesis class, blind data do not decide
whether the finite central summand has exactly two minimal central atoms. -/
theorem hasExactlyTwoCentralAtoms_not_propertyReconstructsOn_allCandidates :
    ¬ propertyReconstructsOn allMultiplicityCandidates
        blindMultiplicityObservation hasExactlyTwoCentralAtoms := by
  exact not_propertyReconstructsOn_of_hypothesis_fiber_counterexample
    allMultiplicityCandidates
    blindMultiplicityObservation
    hasExactlyTwoCentralAtoms
    (show allMultiplicityCandidates MultiplicityCandidate.binary from trivial)
    (show allMultiplicityCandidates MultiplicityCandidate.ternary from trivial)
    (show blindMultiplicityObservation MultiplicityCandidate.binary =
        blindMultiplicityObservation MultiplicityCandidate.ternary from rfl)
    binaryCandidate_hasExactlyTwoCentralAtoms
    ternaryCandidate_not_hasExactlyTwoCentralAtoms

/-- Compatibility version using the older predicate name. -/
theorem isBinaryMultiplicity_not_propertyReconstructsOn_allCandidates :
    ¬ propertyReconstructsOn allMultiplicityCandidates
        blindMultiplicityObservation isBinaryMultiplicity := by
  exact not_propertyReconstructsOn_of_hypothesis_fiber_counterexample
    allMultiplicityCandidates
    blindMultiplicityObservation
    isBinaryMultiplicity
    (show allMultiplicityCandidates MultiplicityCandidate.binary from trivial)
    (show allMultiplicityCandidates MultiplicityCandidate.ternary from trivial)
    (show blindMultiplicityObservation MultiplicityCandidate.binary =
        blindMultiplicityObservation MultiplicityCandidate.ternary from rfl)
    binaryCandidate_isBinary
    ternaryCandidate_not_isBinary

/-- Finite core of the manuscript corollary "Two-outcome coarse-grainings do not
select a two-atom center": two-atom and three-atom finite classical systems both
allow a two-outcome coarse-graining, but the same coarse-graining-availability
observation does not reconstruct the predicate that the finite center has
exactly two atoms. -/
theorem binaryCoarseGrainingDoesNotSelectBinaryRankCore :
    hasBinaryCoarseGraining MultiplicityCandidate.binary ∧
      hasBinaryCoarseGraining MultiplicityCandidate.ternary ∧
      ¬ propertyReconstructsOn allMultiplicityCandidates
        binaryCoarseGrainingObservation hasExactlyTwoCentralAtoms := by
  constructor
  · trivial
  constructor
  · trivial
  · exact not_propertyReconstructsOn_of_hypothesis_fiber_counterexample
      allMultiplicityCandidates
      binaryCoarseGrainingObservation
      hasExactlyTwoCentralAtoms
      (show allMultiplicityCandidates MultiplicityCandidate.binary from trivial)
      (show allMultiplicityCandidates MultiplicityCandidate.ternary from trivial)
      (show binaryCoarseGrainingObservation MultiplicityCandidate.binary =
          binaryCoarseGrainingObservation MultiplicityCandidate.ternary from rfl)
      binaryCandidate_hasExactlyTwoCentralAtoms
      ternaryCandidate_not_hasExactlyTwoCentralAtoms

/-- Finite skeleton of the manuscript theorem "exact recovery is downward
closed and is not a maximality proof": the observation that a supplied
diagonal subalgebra is exactly recovered is identical for binary and ternary
ambient finite-center completions. -/
def specifiedSubalgebraRecoveryObservation
    (_candidate : MultiplicityCandidate) : Unit :=
  ()

/-- Specified exact recovery does not reconstruct the maximal finite central
cardinality, nor decide whether that cardinality is two. -/
theorem specifiedExactRecoveryDoesNotCertifyMaximalityCore :
    ¬ factorsThrough specifiedSubalgebraRecoveryObservation
        finiteCentralMultiplicity ∧
      ¬ propertyFactorsThrough specifiedSubalgebraRecoveryObservation
        isBinaryMultiplicity := by
  constructor
  · exact not_factorsThrough_of_fiber_counterexample
      specifiedSubalgebraRecoveryObservation
      finiteCentralMultiplicity
      (show specifiedSubalgebraRecoveryObservation
          MultiplicityCandidate.binary =
          specifiedSubalgebraRecoveryObservation
            MultiplicityCandidate.ternary from rfl)
      finiteCentralMultiplicity_binary_ne_ternary
  · exact not_propertyFactorsThrough_of_fiber_counterexample
      specifiedSubalgebraRecoveryObservation
      isBinaryMultiplicity
      (show specifiedSubalgebraRecoveryObservation
          MultiplicityCandidate.binary =
          specifiedSubalgebraRecoveryObservation
            MultiplicityCandidate.ternary from rfl)
      binaryCandidate_isBinary
      ternaryCandidate_not_isBinary

/-- A sharp event on a finite classical system is fully permutation-invariant
when all atoms have the same truth value.  This is the Prop-valued skeleton of
invariance under the full automorphism group of `l^\infty` on a finite set. -/
def fullPermutationInvariantEvent {n : Nat} (event : Fin n -> Prop) : Prop :=
  ∀ i j, event i ↔ event j

/-- A sharp event is proper when it is neither empty nor full. -/
def properSharpEvent {n : Nat} (event : Fin n -> Prop) : Prop :=
  (∃ i, event i) ∧ (∃ j, ¬ event j)

/-- Finite core of the manuscript corollary "Full finite-center symmetry does
not select a nontrivial binary event": there is no proper sharp event that is
invariant under all permutations of the finite atom set. -/
theorem fullPermutationInvariantEvent_not_proper {n : Nat} :
    ¬ ∃ event : Fin n -> Prop,
      fullPermutationInvariantEvent event ∧ properSharpEvent event := by
  intro h
  rcases h with ⟨event, hinv, ⟨⟨i, hi⟩, ⟨j, hj⟩⟩⟩
  exact hj ((hinv i j).mp hi)

/-- Sharp binary-selection repair criterion for the two-candidate finite witness:
an added datum decides whether the hidden finite center is binary exactly when it
separates the binary and ternary candidates. -/
theorem binarySelection_augmented_iff_exit_separates_binary_ternary
    {E : Type} (exit : MultiplicityCandidate -> E) :
    propertyFactorsThrough
        (fun candidate => (blindMultiplicityObservation candidate, exit candidate))
        isBinaryMultiplicity <->
      exit MultiplicityCandidate.binary ≠ exit MultiplicityCandidate.ternary := by
  rw [propertyFactorsThrough_augmented_iff_exit_separates_changed_fibers]
  constructor
  · intro h
    exact h MultiplicityCandidate.binary MultiplicityCandidate.ternary rfl
      (by simp [isBinaryMultiplicity])
  · intro hsep x y _hobs hdiff
    cases x <;> cases y
    · simp [isBinaryMultiplicity] at hdiff
    · exact hsep
    · intro h
      exact hsep h.symm
    · simp [isBinaryMultiplicity] at hdiff

/-- Supplying the actual finite central cardinality as an added datum decides
the binary-selection predicate in the finite witness. -/
theorem finiteCentralMultiplicity_augmented_decides_isBinaryMultiplicity :
    propertyFactorsThrough
        (fun candidate =>
          (blindMultiplicityObservation candidate,
            finiteCentralMultiplicity candidate))
        isBinaryMultiplicity := by
  rw [binarySelection_augmented_iff_exit_separates_binary_ternary]
  exact finiteCentralMultiplicity_binary_ne_ternary

/-- Any finite-center counting value that differs between the binary and
ternary candidates is not reconstructible from blind multiplicity data. -/
theorem finiteCountingFunctional_not_factorsThrough_blindObservation {Y : Type}
    (count : MultiplicityCandidate -> Y)
    (hdiff : count MultiplicityCandidate.binary ≠
      count MultiplicityCandidate.ternary) :
    ¬ factorsThrough blindMultiplicityObservation count := by
  exact not_factorsThrough_of_comparison_counterexample
    blindMultiplicityObservation
    binaryTernaryComparison
    count
    binaryTernaryComparison_containedInFibers
    (show binaryTernaryComparison MultiplicityCandidate.binary
        MultiplicityCandidate.ternary from trivial)
    hdiff

/-- Sharp repair criterion for any finite-center counting value that differs
between the binary and ternary candidates: an added datum reconstructs it
exactly when it separates that old blind fiber. -/
theorem finiteCountingFunctional_augmented_iff_exit_separates_binary_ternary
    {E Y : Type} (exit : MultiplicityCandidate -> E)
    (count : MultiplicityCandidate -> Y)
    (hdiff : count MultiplicityCandidate.binary ≠
      count MultiplicityCandidate.ternary) :
    factorsThrough
        (fun candidate => (blindMultiplicityObservation candidate, exit candidate))
        count <->
      exit MultiplicityCandidate.binary ≠ exit MultiplicityCandidate.ternary := by
  rw [factorsThrough_augmented_iff_exit_separates_changed_fibers]
  constructor
  · intro h
    exact h MultiplicityCandidate.binary MultiplicityCandidate.ternary rfl hdiff
  · intro hsep x y _hobs hneq
    cases x <;> cases y
    · exact False.elim (hneq rfl)
    · exact hsep
    · intro h
      exact hsep h.symm
    · exact False.elim (hneq rfl)

/-- Two entropy-normalization conventions compatible with the same blind data. -/
inductive EntropyNormalizationCandidate where
  | ignoreHiddenCenter
  | countHiddenCenter
  deriving DecidableEq

/-- The blind entropy observation records no finite-central entropy convention. -/
def blindEntropyObservation (_ : EntropyNormalizationCandidate) : Unit :=
  ()

/-- A finite entropy coefficient in abstract log units: either the hidden
finite-center entropy is ignored, or one unit of it is counted. -/
def finiteCentralEntropyCoefficient : EntropyNormalizationCandidate -> Nat
  | EntropyNormalizationCandidate.ignoreHiddenCenter => 0
  | EntropyNormalizationCandidate.countHiddenCenter => 1

/-- The two entropy conventions have different finite-central coefficients. -/
theorem entropyCoefficient_ignore_ne_count :
    finiteCentralEntropyCoefficient
        EntropyNormalizationCandidate.ignoreHiddenCenter ≠
      finiteCentralEntropyCoefficient
        EntropyNormalizationCandidate.countHiddenCenter := by
  simp [finiteCentralEntropyCoefficient]

/-- A finite-central entropy coefficient is not reconstructible from blind data:
counting and ignoring the hidden finite center lie in one operational fiber but
have different coefficient values. -/
theorem entropyCoefficient_not_factorsThrough_blindObservation :
    ¬ factorsThrough blindEntropyObservation finiteCentralEntropyCoefficient := by
  exact not_factorsThrough_of_fiber_counterexample
    blindEntropyObservation
    finiteCentralEntropyCoefficient
    (x := EntropyNormalizationCandidate.ignoreHiddenCenter)
    (y := EntropyNormalizationCandidate.countHiddenCenter)
    rfl
    entropyCoefficient_ignore_ne_count

/-- Two candidates used to witness that blind data do not reconstruct the joint
support-totality and entropy-coefficient invariant. -/
inductive JointSupportEntropyCandidate where
  | bareFull
  | hiddenCounted
  deriving DecidableEq

/-- The blind joint observation forgets both the support defect and the hidden
finite-central entropy convention. -/
def blindJointObservation (_ : JointSupportEntropyCandidate) : Unit :=
  ()

/-- The support-totality coordinate of the joint finite witness. -/
def jointSupportTotality : JointSupportEntropyCandidate -> Bool
  | JointSupportEntropyCandidate.bareFull => true
  | JointSupportEntropyCandidate.hiddenCounted => false

/-- The entropy-coefficient coordinate of the joint finite witness. -/
def jointEntropyCoefficient : JointSupportEntropyCandidate -> Nat
  | JointSupportEntropyCandidate.bareFull => 0
  | JointSupportEntropyCandidate.hiddenCounted => 1

/-- The joint support/entropy invariant whose descent is obstructed by the
blind observation. -/
def jointSupportEntropyInvariant
    (candidate : JointSupportEntropyCandidate) : Bool × Nat :=
  (jointSupportTotality candidate, jointEntropyCoefficient candidate)

/-- The two joint-witness candidates have different support/entropy invariant
values. -/
theorem jointSupportEntropyInvariant_differs :
    jointSupportEntropyInvariant JointSupportEntropyCandidate.bareFull ≠
      jointSupportEntropyInvariant JointSupportEntropyCandidate.hiddenCounted := by
  simp [jointSupportEntropyInvariant, jointSupportTotality,
    jointEntropyCoefficient]

/-- The pair consisting of support totality and finite-central entropy
coefficient is not reconstructible from blind data: the two candidates lie in
one operational fiber while the joint invariant changes. -/
theorem jointSupportEntropy_not_factorsThrough_blindObservation :
    ¬ factorsThrough blindJointObservation jointSupportEntropyInvariant := by
  exact not_factorsThrough_of_fiber_counterexample
    blindJointObservation
    jointSupportEntropyInvariant
    (x := JointSupportEntropyCandidate.bareFull)
    (y := JointSupportEntropyCandidate.hiddenCounted)
    rfl
    jointSupportEntropyInvariant_differs

/-- Candidates for the finite no-cross-calibration witness between tensor
factorization and entropy normalization. -/
inductive TensorEntropyCrossCandidate where
  | entropyFixedTensorGood
  | entropyFixedTensorBad
  | tensorFixedEntropyZero
  | tensorFixedEntropyOne
  deriving DecidableEq

/-- The old blind datum sees neither the tensor/factorization coordinate nor the
entropy-normalization coordinate. -/
def blindTensorEntropyObservation (_candidate : TensorEntropyCrossCandidate) :
    Unit :=
  ()

/-- A calibrated entropy datum.  It is deliberately the same on the two
entropy-fixed candidates, so it cannot separate their tensor/factorization
status. -/
def entropyCalibrationDatum : TensorEntropyCrossCandidate -> Nat
  | TensorEntropyCrossCandidate.entropyFixedTensorGood => 0
  | TensorEntropyCrossCandidate.entropyFixedTensorBad => 0
  | TensorEntropyCrossCandidate.tensorFixedEntropyZero => 0
  | TensorEntropyCrossCandidate.tensorFixedEntropyOne => 1

/-- A calibrated tensor/factorization datum.  It is deliberately the same on the
two tensor-fixed candidates, so it cannot separate their entropy coefficient. -/
def tensorCalibrationDatum : TensorEntropyCrossCandidate -> Bool
  | TensorEntropyCrossCandidate.entropyFixedTensorGood => true
  | TensorEntropyCrossCandidate.entropyFixedTensorBad => false
  | TensorEntropyCrossCandidate.tensorFixedEntropyZero => true
  | TensorEntropyCrossCandidate.tensorFixedEntropyOne => true

/-- The Prop-valued full-algebra tensor/factorization target. -/
def tensorFactorizes : TensorEntropyCrossCandidate -> Prop
  | TensorEntropyCrossCandidate.entropyFixedTensorGood => True
  | TensorEntropyCrossCandidate.entropyFixedTensorBad => False
  | TensorEntropyCrossCandidate.tensorFixedEntropyZero => True
  | TensorEntropyCrossCandidate.tensorFixedEntropyOne => True

/-- A Boolean copy of the tensor/factorization target, used when pairing the
factorization coordinate with the entropy-normalization coordinate as a single
finite invariant. -/
def tensorFactorizationFlag : TensorEntropyCrossCandidate -> Bool
  | TensorEntropyCrossCandidate.entropyFixedTensorGood => true
  | TensorEntropyCrossCandidate.entropyFixedTensorBad => false
  | TensorEntropyCrossCandidate.tensorFixedEntropyZero => true
  | TensorEntropyCrossCandidate.tensorFixedEntropyOne => true

/-- The entropy-normalization target in abstract finite-center log units. -/
def tensorEntropyCoefficient : TensorEntropyCrossCandidate -> Nat
  | TensorEntropyCrossCandidate.entropyFixedTensorGood => 0
  | TensorEntropyCrossCandidate.entropyFixedTensorBad => 0
  | TensorEntropyCrossCandidate.tensorFixedEntropyZero => 0
  | TensorEntropyCrossCandidate.tensorFixedEntropyOne => 1

/-- The joint finite target consisting of tensor/factorization status and
entropy-normalization coefficient. -/
def tensorEntropyJointInvariant
    (candidate : TensorEntropyCrossCandidate) : Bool × Nat :=
  (tensorFactorizationFlag candidate, tensorEntropyCoefficient candidate)

theorem entropyFixedTensorGood_factorizes :
    tensorFactorizes TensorEntropyCrossCandidate.entropyFixedTensorGood := by
  trivial

theorem entropyFixedTensorBad_not_factorizes :
    ¬ tensorFactorizes TensorEntropyCrossCandidate.entropyFixedTensorBad := by
  intro h
  exact h

theorem tensorFixedEntropyZero_ne_one :
    tensorEntropyCoefficient TensorEntropyCrossCandidate.tensorFixedEntropyZero ≠
      tensorEntropyCoefficient TensorEntropyCrossCandidate.tensorFixedEntropyOne := by
  simp [tensorEntropyCoefficient]

/-- Exact finite repair criterion for the joint tensor/entropy target: an added
datum reconstructs the pair exactly when it separates every old blind fiber pair
where either the tensor coordinate or entropy coordinate changes. -/
theorem tensorEntropyJoint_augmented_iff_exit_separates_changed_pairs
    {E : Type} (exit : TensorEntropyCrossCandidate -> E) :
    factorsThrough
        (fun candidate =>
          (blindTensorEntropyObservation candidate, exit candidate))
        tensorEntropyJointInvariant <->
      ∀ x y,
        blindTensorEntropyObservation x = blindTensorEntropyObservation y ->
          tensorEntropyJointInvariant x ≠ tensorEntropyJointInvariant y ->
            exit x ≠ exit y := by
  rw [factorsThrough_augmented_iff_exit_separates_changed_fibers]

/-- Adding an entropy calibration that is constant on an old blind fiber does
not decide the tensor/factorization property. -/
theorem entropyCalibration_not_propertyFactorsThrough_tensorFactorization :
    ¬ propertyFactorsThrough
        (fun candidate =>
          (blindTensorEntropyObservation candidate,
            entropyCalibrationDatum candidate))
        tensorFactorizes := by
  exact not_propertyFactorsThrough_of_fiber_counterexample
    (fun candidate =>
      (blindTensorEntropyObservation candidate,
        entropyCalibrationDatum candidate))
    tensorFactorizes
    (x := TensorEntropyCrossCandidate.entropyFixedTensorGood)
    (y := TensorEntropyCrossCandidate.entropyFixedTensorBad)
    rfl
    entropyFixedTensorGood_factorizes
    entropyFixedTensorBad_not_factorizes

/-- An entropy calibration that is constant on a tensor-changing old blind fiber
does not reconstruct the joint tensor/entropy target. -/
theorem entropyCalibration_not_factorsThrough_tensorEntropyJoint :
    ¬ factorsThrough
        (fun candidate =>
          (blindTensorEntropyObservation candidate,
            entropyCalibrationDatum candidate))
        tensorEntropyJointInvariant := by
  exact not_factorsThrough_of_fiber_counterexample
    (fun candidate =>
      (blindTensorEntropyObservation candidate,
        entropyCalibrationDatum candidate))
    tensorEntropyJointInvariant
    (x := TensorEntropyCrossCandidate.entropyFixedTensorGood)
    (y := TensorEntropyCrossCandidate.entropyFixedTensorBad)
    rfl
    (by simp [tensorEntropyJointInvariant, tensorFactorizationFlag,
      tensorEntropyCoefficient])

/-- Adding tensor/factorization data that are constant on an old blind fiber
does not reconstruct the entropy-normalization coefficient. -/
theorem tensorCalibration_not_factorsThrough_entropyCoefficient :
    ¬ factorsThrough
        (fun candidate =>
          (blindTensorEntropyObservation candidate,
            tensorCalibrationDatum candidate))
        tensorEntropyCoefficient := by
  exact not_factorsThrough_of_fiber_counterexample
    (fun candidate =>
      (blindTensorEntropyObservation candidate,
        tensorCalibrationDatum candidate))
    tensorEntropyCoefficient
    (x := TensorEntropyCrossCandidate.tensorFixedEntropyZero)
    (y := TensorEntropyCrossCandidate.tensorFixedEntropyOne)
    rfl
    tensorFixedEntropyZero_ne_one

/-- A tensor/factorization calibration that is constant on an entropy-changing
old blind fiber does not reconstruct the joint tensor/entropy target. -/
theorem tensorCalibration_not_factorsThrough_tensorEntropyJoint :
    ¬ factorsThrough
        (fun candidate =>
          (blindTensorEntropyObservation candidate,
            tensorCalibrationDatum candidate))
        tensorEntropyJointInvariant := by
  exact not_factorsThrough_of_fiber_counterexample
    (fun candidate =>
      (blindTensorEntropyObservation candidate,
        tensorCalibrationDatum candidate))
    tensorEntropyJointInvariant
    (x := TensorEntropyCrossCandidate.tensorFixedEntropyZero)
    (y := TensorEntropyCrossCandidate.tensorFixedEntropyOne)
    rfl
    (by simp [tensorEntropyJointInvariant, tensorFactorizationFlag,
      tensorEntropyCoefficient])

/-- Two full-algebra candidates with the same included-subalgebra operational
datum: a base factor and a finite central amplification. -/
inductive IncludedSubalgebraCandidate where
  | baseFactor
  | finiteCentralAmplification
  deriving DecidableEq

/-- The included-subalgebra datum forgets the finite central amplification. -/
def includedSubalgebraDatum (_ : IncludedSubalgebraCandidate) : Unit :=
  ()

/-- Whether the full algebra is factor-valued in the finite witness. -/
def fullAlgebraFactorValued : IncludedSubalgebraCandidate -> Bool
  | IncludedSubalgebraCandidate.baseFactor => true
  | IncludedSubalgebraCandidate.finiteCentralAmplification => false

/-- Boolean skeleton of the statement that every central summand has the desired
factor type, e.g. type III.  Both the base factor and the finite central
amplification have only desired-type summands in this finite abstraction. -/
def allCentralSummandsDesiredType : IncludedSubalgebraCandidate -> Bool
  | IncludedSubalgebraCandidate.baseFactor => true
  | IncludedSubalgebraCandidate.finiteCentralAmplification => true

/-- The finite-central entropy count in abstract log units. -/
def includedSubalgebraEntropyCount : IncludedSubalgebraCandidate -> Nat
  | IncludedSubalgebraCandidate.baseFactor => 0
  | IncludedSubalgebraCandidate.finiteCentralAmplification => 1

/-- The joint full-algebra invariant changed by finite central amplification. -/
def includedSubalgebraFullInvariant
    (candidate : IncludedSubalgebraCandidate) : Bool × Nat :=
  (fullAlgebraFactorValued candidate,
    includedSubalgebraEntropyCount candidate)

/-- The base and amplified candidates have different full-algebra invariants. -/
theorem includedSubalgebraFullInvariant_differs :
    includedSubalgebraFullInvariant IncludedSubalgebraCandidate.baseFactor ≠
      includedSubalgebraFullInvariant
        IncludedSubalgebraCandidate.finiteCentralAmplification := by
  simp [includedSubalgebraFullInvariant, fullAlgebraFactorValued,
    includedSubalgebraEntropyCount]

/-- Full-algebra factor-valuedness together with finite-central entropy count
is not reconstructible from included-subalgebra data: the base and amplified
candidates lie in one operational fiber but have different invariant values. -/
theorem includedSubalgebraFullInvariant_not_factorsThrough :
    ¬ factorsThrough includedSubalgebraDatum
        includedSubalgebraFullInvariant := by
  exact not_factorsThrough_of_fiber_counterexample
    includedSubalgebraDatum
    includedSubalgebraFullInvariant
    (x := IncludedSubalgebraCandidate.baseFactor)
    (y := IncludedSubalgebraCandidate.finiteCentralAmplification)
    rfl
    includedSubalgebraFullInvariant_differs

/-- Knowing only that all central summands have the desired type, e.g. type III,
does not decide factor-valuedness: the finite central amplification has the same
summand-type datum as the base factor but is not a factor. -/
theorem desiredSummandType_not_factorsThrough_factorValued :
    ¬ factorsThrough allCentralSummandsDesiredType fullAlgebraFactorValued := by
  exact not_factorsThrough_of_fiber_counterexample
    allCentralSummandsDesiredType
    fullAlgebraFactorValued
    (x := IncludedSubalgebraCandidate.baseFactor)
    (y := IncludedSubalgebraCandidate.finiteCentralAmplification)
    rfl
    (by simp [fullAlgebraFactorValued])

/-- Named finite core of the type-III/factor boundary: the datum "all central
summands have the desired factor type" is identical for the base factor and its
finite central amplification, while factor-valuedness changes. -/
theorem desiredSummandTypeDoesNotDecideFactorValuedCore :
    ¬ factorsThrough allCentralSummandsDesiredType fullAlgebraFactorValued := by
  exact desiredSummandType_not_factorsThrough_factorValued

/-- Exact repair criterion for factor-valuedness in the base-vs-amplified finite
witness: an added datum decides factor-valuedness exactly when it separates the
base factor from the finite central amplification. -/
theorem includedSubalgebraFactorValued_augmented_iff_exit_separates_base_amp
    {E : Type} (exit : IncludedSubalgebraCandidate -> E) :
    factorsThrough
        (fun candidate => (includedSubalgebraDatum candidate, exit candidate))
        fullAlgebraFactorValued <->
      exit IncludedSubalgebraCandidate.baseFactor ≠
        exit IncludedSubalgebraCandidate.finiteCentralAmplification := by
  rw [factorsThrough_augmented_iff_exit_separates_changed_fibers]
  constructor
  · intro h
    exact h IncludedSubalgebraCandidate.baseFactor
      IncludedSubalgebraCandidate.finiteCentralAmplification rfl
      (by simp [fullAlgebraFactorValued])
  · intro hsep x y _hobs hdiff
    cases x <;> cases y
    · exact False.elim (hdiff rfl)
    · exact hsep
    · intro h
      exact hsep h.symm
    · exact False.elim (hdiff rfl)

/-- Exact repair criterion for the paired factor/entropy invariant in the
base-vs-amplified finite witness. -/
theorem includedSubalgebraFullInvariant_augmented_iff_exit_separates_base_amp
    {E : Type} (exit : IncludedSubalgebraCandidate -> E) :
    factorsThrough
        (fun candidate => (includedSubalgebraDatum candidate, exit candidate))
        includedSubalgebraFullInvariant <->
      exit IncludedSubalgebraCandidate.baseFactor ≠
        exit IncludedSubalgebraCandidate.finiteCentralAmplification := by
  rw [factorsThrough_augmented_iff_exit_separates_changed_fibers]
  constructor
  · intro h
    exact h IncludedSubalgebraCandidate.baseFactor
      IncludedSubalgebraCandidate.finiteCentralAmplification rfl
      includedSubalgebraFullInvariant_differs
  · intro hsep x y _hobs hdiff
    cases x <;> cases y
    · exact False.elim (hdiff rfl)
    · exact hsep
    · intro h
      exact hsep h.symm
    · exact False.elim (hdiff rfl)

/-- Pointwise multiplication in the finite abelian algebra. -/
def pointwiseMul {m : Nat} (f g : Fin m -> Nat) : Fin m -> Nat :=
  fun i => f i * g i

/-- The tensor-product basis atom `e_i tensor e_j`, modeled as a function on
the product of the two finite atomic sets. -/
def tensorAtom {m : Nat} (i j : Fin m) : Fin m × Fin m -> Nat :=
  fun p => if p.1 = i ∧ p.2 = j then 1 else 0

/-- Restrict a finite tensor-product function to the diagonal.  This is the
finite commutative skeleton of the multiplication map
`C^m tensor C^m -> C^m`. -/
def diagonalRestrict {m : Nat} (F : Fin m × Fin m -> Nat) : Fin m -> Nat :=
  fun k => F (k, k)

theorem tensorAtom_self {m : Nat} (i j : Fin m) :
    tensorAtom i j (i, j) = 1 := by
  simp [tensorAtom]

/-- A tensor-product basis atom is nonzero in the unreduced finite tensor
product. -/
theorem tensorAtom_not_zero_function {m : Nat} (i j : Fin m) :
    Not (tensorAtom i j = fun _ => 0) := by
  intro h
  have h1 := congrArg (fun f => f (i, j)) h
  simp [tensorAtom] at h1

/-- Diagonal multiplication kills off-diagonal finite-center tensor atoms. -/
theorem pointwiseMul_atomOn_distinct_zero {m : Nat} {i j : Fin m}
    (hij : i ≠ j) :
    pointwiseMul (atomOn i) (atomOn j) = fun _ => 0 := by
  funext k
  by_cases hki : k = i
  · subst k
    simp [pointwiseMul, atomOn, hij]
  · simp [pointwiseMul, atomOn, hki]

/-- Diagonal restriction kills off-diagonal tensor atoms. -/
theorem diagonalRestrict_tensorAtom_distinct_zero {m : Nat} {i j : Fin m}
    (hij : i ≠ j) :
    diagonalRestrict (tensorAtom i j) = fun _ => 0 := by
  funext k
  by_cases hki : k = i
  · subst k
    simp [diagonalRestrict, tensorAtom, hij]
  · simp [diagonalRestrict, tensorAtom, hki]

/-- The finite-center kernel witness behind the shared-center tensor
factorization obstruction: the off-diagonal tensor atom is nonzero before
diagonal multiplication and zero after diagonal multiplication. -/
theorem offDiagonal_tensorAtom_kernel_witness {m : Nat} {i j : Fin m}
    (hij : i ≠ j) :
    (pointwiseMul (atomOn i) (atomOn j) = fun _ => 0) ∧
      Not (tensorAtom i j = fun _ => 0) := by
  constructor
  · exact pointwiseMul_atomOn_distinct_zero hij
  · exact tensorAtom_not_zero_function i j

/-- In every finite center with at least two atoms, the `(0,1)` tensor atom is a
concrete nonzero element killed by diagonal multiplication. -/
theorem zero_one_tensorAtom_kernel_witness (n : Nat) :
    (pointwiseMul
        (atomOn (0 : Fin (n + 2)))
        (atomOn (1 : Fin (n + 2))) = fun _ => 0) ∧
      Not (tensorAtom (0 : Fin (n + 2)) (1 : Fin (n + 2)) = fun _ => 0) := by
  have h01 : (0 : Fin (n + 2)) ≠ (1 : Fin (n + 2)) := by
    intro h
    have hv := congrArg Fin.val h
    simp at hv
  exact offDiagonal_tensorAtom_kernel_witness h01

/-- In every finite center with at least two atoms, diagonal restriction is not
injective on the finite tensor-product function space. -/
theorem diagonalRestrict_not_injective_two_atoms (n : Nat) :
    ¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat) := by
  intro hinj
  let x := tensorAtom (0 : Fin (n + 2)) (1 : Fin (n + 2))
  let y : Fin (n + 2) × Fin (n + 2) -> Nat := fun _ => 0
  have h01 : (0 : Fin (n + 2)) ≠ (1 : Fin (n + 2)) := by
    intro h
    have hv := congrArg Fin.val h
    simp at hv
  have hdiag : diagonalRestrict x = diagonalRestrict y := by
    simpa [x, y] using diagonalRestrict_tensorAtom_distinct_zero h01
  have hxy : x = y := hinj hdiag
  have hxne : x ≠ y := by
    simpa [x, y] using
      tensorAtom_not_zero_function (0 : Fin (n + 2)) (1 : Fin (n + 2))
  exact hxne hxy

/-- Diagonal multiplication on a finite shared center is injective exactly when
there are no two distinct finite central atoms.  This is the finite Boolean
skeleton of the split/tensor-product exit: injective multiplication excludes
nontrivial shared finite central projections, while two distinct atoms give an
off-diagonal tensor-kernel witness. -/
theorem diagonalRestrict_injective_iff_no_distinct_atoms {m : Nat} :
    Function.Injective
      (diagonalRestrict : (Fin m × Fin m -> Nat) -> Fin m -> Nat) <->
      ∀ i j : Fin m, i ≠ j -> False := by
  constructor
  · intro hinj i j hij
    let x := tensorAtom i j
    let y : Fin m × Fin m -> Nat := fun _ => 0
    have hdiag : diagonalRestrict x = diagonalRestrict y := by
      simpa [x, y] using diagonalRestrict_tensorAtom_distinct_zero hij
    have hxy : x = y := hinj hdiag
    exact (tensorAtom_not_zero_function i j) hxy
  · intro hnodist F G hdiag
    funext p
    rcases p with ⟨i, j⟩
    have hij : i = j := by
      by_cases h : i = j
      · exact h
      · exact False.elim (hnodist i j h)
    cases hij
    have hcoord := congrFun hdiag i
    simpa [diagonalRestrict] using hcoord

/-- Machine-checked finite core of the self-contained finite-central descent
theorem in the manuscript.  This packages the five finite/logical obstructions
used there: same blind included-subalgebra data with different paired
factor/entropy invariant, same represented data with different support-totality
truth value, same blind multiplicity data with different binaryness truth value,
same blind entropy data with different entropy coefficient, and a nontrivial
diagonal-multiplication tensor kernel in every finite center with at least two
atoms. -/
theorem selfContainedFiniteCentralDescentCore (n : Nat) :
    (¬ factorsThrough includedSubalgebraDatum
        includedSubalgebraFullInvariant) ∧
    (¬ propertyFactorsThrough blindSupportObservation
        candidateHasFullSupport) ∧
    (¬ propertyFactorsThrough blindMultiplicityObservation
        isBinaryMultiplicity) ∧
    (¬ factorsThrough blindEntropyObservation
        finiteCentralEntropyCoefficient) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) := by
  exact ⟨includedSubalgebraFullInvariant_not_factorsThrough,
    supportFull_not_propertyFactorsThrough_blindObservation,
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation,
    entropyCoefficient_not_factorsThrough_blindObservation,
    diagonalRestrict_not_injective_two_atoms n⟩

/-- The observed image of pure finite atoms under an operational readout. -/
def observedAtomImage {A D : Type} (obs : A -> D) (d : D) : Prop :=
  ∃ a, obs a = d

/-- Add one hidden duplicate atom whose observed value is that of an existing
atom.  `none` is the new atom; `some a` are the old atoms. -/
def duplicateObservation {A D : Type} (base : A) (obs : A -> D) :
    Option A -> D
  | none => obs base
  | some a => obs a

theorem duplicateObservation_extra_matches_base {A D : Type}
    (base : A) (obs : A -> D) :
    duplicateObservation base obs none = obs base := by
  rfl

theorem duplicateObservation_old_atom {A D : Type}
    (base a : A) (obs : A -> D) :
    duplicateObservation base obs (some a) = obs a := by
  rfl

/-- Adding a duplicate hidden atom does not change the observed pure-atom image.
This is the discrete skeleton of the theorem that affine state-space data
determine only the observed polytope, not a nonminimal hidden central cardinality. -/
theorem duplicateObservation_image_same {A D : Type}
    (base : A) (obs : A -> D) (d : D) :
    observedAtomImage (duplicateObservation base obs) d <->
      observedAtomImage obs d := by
  constructor
  · intro h
    rcases h with ⟨a?, ha⟩
    cases a? with
    | none =>
        exact ⟨base, ha⟩
    | some a =>
        exact ⟨a, ha⟩
  · intro h
    rcases h with ⟨a, ha⟩
    exact ⟨some a, ha⟩

/-- The added duplicate atom is not one of the old atoms. -/
theorem duplicateObservation_has_extra_atom {A : Type} (a : A) :
    (none : Option A) ≠ some a := by
  intro h
  cases h

/-- Atom labels are reconstructible from a finite readout exactly when the
readout is injective. -/
theorem atomReadout_reconstructs_labels_iff_injective {A D : Type}
    (obs : A -> D) :
    Function.Injective obs <-> ∀ a b, obs a = obs b -> a = b := by
  rfl

/-- Adding a duplicate hidden atom preserves the observed atom image but makes
the atom readout noninjective.  This is the finite central-cardinality skeleton of the
state/effect central-separation criterion: the observed image alone does not
determine a nonminimal hidden central cardinality. -/
theorem duplicateObservation_same_image_not_injective {A D : Type}
    (base : A) (obs : A -> D) :
    (∀ d, observedAtomImage (duplicateObservation base obs) d <->
      observedAtomImage obs d) ∧
    ¬ Function.Injective (duplicateObservation base obs) := by
  constructor
  · intro d
    exact duplicateObservation_image_same base obs d
  · intro hinj
    have hsame :
        duplicateObservation base obs (none : Option A) =
          duplicateObservation base obs (some base) := rfl
    have hlabels := hinj hsame
    exact duplicateObservation_has_extra_atom base hlabels

/-- A refined atom readout that first maps to a coarse atom. -/
def coarseRefinementObservation {X Y D : Type} (pi : Y -> X) (obs : X -> D) :
    Y -> D :=
  fun y => obs (pi y)

/-- If two distinct refined atoms lie over the same coarse atom, then no readout
that factors through the coarse map can reconstruct refined atom labels.  This
is the finite skeleton of the faithful coarse-graining theorem: positive support
of every refined atom does not by itself imply atom-count reconstruction. -/
theorem coarseRefinementObservation_same_fiber_not_injective
    {X Y D : Type} (pi : Y -> X) (obs : X -> D) {y1 y2 : Y}
    (hneq : y1 ≠ y2) (hfiber : pi y1 = pi y2) :
    ¬ Function.Injective (coarseRefinementObservation pi obs) := by
  intro hinj
  have hsame :
      coarseRefinementObservation pi obs y1 =
        coarseRefinementObservation pi obs y2 := by
    simp [coarseRefinementObservation, hfiber]
  exact hneq (hinj hsame)

/-- A coarse point mass on a finite/classical atom set, represented with
Nat-valued weights for this finite skeleton. -/
def coarsePointMass {X : Type} [DecidableEq X] (x : X) : X -> Nat :=
  fun x' => if x' = x then 1 else 0

theorem coarsePointMass_self {X : Type} [DecidableEq X] (x : X) :
    coarsePointMass x x = 1 := by
  simp [coarsePointMass]

theorem coarsePointMass_ne {X : Type} [DecidableEq X] {x x' : X}
    (h : x' ≠ x) :
    coarsePointMass x x' = 0 := by
  simp [coarsePointMass, h]

/-- Refine a coarse finite distribution by a fixed fiber kernel.  The dependent
sum `Sigma Y` is the refined atom set whose atoms are pairs `(x,y)` with
`y : Y x`.  Nat-valued weights avoid analytic probability formalism; the
coordinate identities are the finite algebraic core used in the paper. -/
def sigmaFiberRefinement {X : Type} {Y : X -> Type}
    (kernel : ∀ x, Y x -> Nat) (weights : X -> Nat) :
    Sigma Y -> Nat :=
  fun a => weights a.1 * kernel a.1 a.2

/-- The fixed kernel is recovered from the refinement of a coarse point mass at
the same coarse atom. -/
theorem sigmaFiberRefinement_point_self {X : Type} [DecidableEq X]
    {Y : X -> Type} (kernel : ∀ x, Y x -> Nat) (x : X) (y : Y x) :
    sigmaFiberRefinement kernel (coarsePointMass x) ⟨x, y⟩ =
      kernel x y := by
  simp [sigmaFiberRefinement, coarsePointMass]

/-- Refining a point mass at `x` assigns zero weight to every different coarse
fiber. -/
theorem sigmaFiberRefinement_point_other {X : Type} [DecidableEq X]
    {Y : X -> Type} (kernel : ∀ x, Y x -> Nat) {x x' : X}
    (h : x' ≠ x) (y : Y x') :
    sigmaFiberRefinement kernel (coarsePointMass x) ⟨x', y⟩ = 0 := by
  simp [sigmaFiberRefinement, coarsePointMass, h]

/-- A fixed fiber kernel is uniquely determined by the refined images of the
coarse point masses.  This is the discrete point-mass skeleton of the theorem
that affine sections of finite coarse-grainings are fixed kernels. -/
theorem sigmaFiberRefinement_kernel_unique_from_pointMass {X : Type}
    [DecidableEq X] {Y : X -> Type}
    (kernel kernel' : ∀ x, Y x -> Nat)
    (h :
      ∀ x (y : Y x),
        sigmaFiberRefinement kernel (coarsePointMass x) ⟨x, y⟩ =
        sigmaFiberRefinement kernel' (coarsePointMass x) ⟨x, y⟩) :
    kernel = kernel' := by
  funext x y
  have hx := h x y
  simpa [sigmaFiberRefinement, coarsePointMass] using hx

/-- A refinement map is point-mass determined when every refined coordinate
depends only on the coarse weight of its own fiber and the image of that
fiber's coarse point mass. -/
def pointMassDeterminedRefinement {X : Type} [DecidableEq X] {Y : X -> Type}
    (R : (X -> Nat) -> Sigma Y -> Nat) : Prop :=
  ∀ (weights : X -> Nat) (a : Sigma Y),
    R weights a = weights a.1 * R (coarsePointMass a.1) a

/-- The fixed fiber kernel recovered from a point-mass-determined refinement. -/
def kernelFromPointMass {X : Type} [DecidableEq X] {Y : X -> Type}
    (R : (X -> Nat) -> Sigma Y -> Nat) (x : X) (y : Y x) : Nat :=
  R (coarsePointMass x) ⟨x, y⟩

/-- Any point-mass-determined finite refinement has the fixed-kernel coordinate
formula with kernel recovered from point masses. -/
theorem pointMassDeterminedRefinement_fixedKernel_formula {X : Type}
    [DecidableEq X] {Y : X -> Type}
    (R : (X -> Nat) -> Sigma Y -> Nat)
    (hR : pointMassDeterminedRefinement R)
    (weights : X -> Nat) (a : Sigma Y) :
    R weights a =
      sigmaFiberRefinement (kernelFromPointMass R) weights a := by
  cases a with
  | mk x y =>
      simp [pointMassDeterminedRefinement, sigmaFiberRefinement,
        kernelFromPointMass] at hR ⊢
      exact hR weights ⟨x, y⟩

/-- If a point-mass-determined refinement is presented by some fixed kernel,
that kernel is the one recovered from point masses. -/
theorem pointMassDeterminedRefinement_kernel_unique {X : Type}
    [DecidableEq X] {Y : X -> Type}
    (R : (X -> Nat) -> Sigma Y -> Nat)
    (_hR : pointMassDeterminedRefinement R)
    (kernel : ∀ x, Y x -> Nat)
    (hKernel :
      ∀ weights a,
        R weights a = sigmaFiberRefinement kernel weights a) :
    kernel = kernelFromPointMass R := by
  funext x y
  have h := hKernel (coarsePointMass x) ⟨x, y⟩
  simpa [sigmaFiberRefinement, coarsePointMass, kernelFromPointMass] using h.symm

/-- Finite midpoint/product skeleton of state-independent recovery.

In the manuscript proof of Theorem
`state-independent-recovery-fixed-center`, applying the product-state recovery
identity to midpoints of two states gives
`(probe x - probe y) * (weight x - weight y) = 0` for every probe.  Testing with
an indicator probe separating `x` and `y` forces the weight coordinate to be
constant.
-/
theorem recoveryProductMidpoint_forces_constantWeight {X : Type}
    [DecidableEq X]
    (weight : X -> Int)
    (h :
      ∀ (probe : X -> Int) x y,
        (probe x - probe y) * (weight x - weight y) = 0) :
    ∀ x y, weight x = weight y := by
  intro x y
  by_cases hxy : x = y
  · exact congrArg weight hxy
  · let probe : X -> Int := fun z => if z = x then 1 else 0
    have hyx : y ≠ x := by
      intro hyx
      exact hxy hyx.symm
    have hprod := h probe x y
    have hzero : weight x - weight y = 0 := by
      simpa [probe, hxy, hyx] using hprod
    omega

/-- A two-summand finite trace pairing with Nat-valued central weights.  This
is the finite coordinate shadow of a trace on `N direct_sum N` whose summand
weights are `weights 0` and `weights 1`. -/
def finiteTrace2 (weights values : Fin 2 -> Nat) : Nat :=
  weights 0 * values 0 + weights 1 * values 1

/-- A scalar diagonal element in a two-summand finite direct sum. -/
def diagonal2 (x : Nat) : Fin 2 -> Nat :=
  fun _ => x

/-- The total central trace weight seen by the scalar diagonal subalgebra. -/
def totalWeight2 (weights : Fin 2 -> Nat) : Nat :=
  weights 0 + weights 1

/-- On scalar diagonal elements, a two-summand trace pairing sees only the
total central trace weight. -/
theorem finiteTrace2_diagonal (weights : Fin 2 -> Nat) (x : Nat) :
    finiteTrace2 weights (diagonal2 x) = totalWeight2 weights * x := by
  simp [finiteTrace2, diagonal2, totalWeight2, Nat.add_mul]

/-- One trace-weight convention on two central summands. -/
def traceWeights13 : Fin 2 -> Nat :=
  fun i => if i = 0 then 1 else 3

/-- A different trace-weight convention with the same total diagonal weight. -/
def traceWeights22 : Fin 2 -> Nat :=
  fun i => if i = 0 then 2 else 2

/-- The two central trace-weight conventions are genuinely different. -/
theorem traceWeights13_ne_traceWeights22 :
    traceWeights13 ≠ traceWeights22 := by
  intro h
  have h0 := congrArg (fun f : Fin 2 -> Nat => f 0) h
  simp [traceWeights13, traceWeights22] at h0

/-- The two different central trace-weight conventions have the same total
weight on the scalar diagonal subalgebra. -/
theorem traceWeights13_total_eq_traceWeights22_total :
    totalWeight2 traceWeights13 = totalWeight2 traceWeights22 := by
  simp [totalWeight2, traceWeights13, traceWeights22]

/-- Hence scalar diagonal trace data cannot distinguish these different
central trace-weight conventions. -/
theorem traceWeights13_22_same_diagonal (x : Nat) :
    finiteTrace2 traceWeights13 (diagonal2 x) =
      finiteTrace2 traceWeights22 (diagonal2 x) := by
  rw [finiteTrace2_diagonal, finiteTrace2_diagonal,
    traceWeights13_total_eq_traceWeights22_total]

/-- The product of two central trace weights is the finite algebraic term whose
logarithm appears in the two-site trace-entropy contribution. -/
def traceWeightProduct2 (weights : Fin 2 -> Nat) : Nat :=
  weights 0 * weights 1

/-- The same two trace-weight conventions have different product terms. -/
theorem traceWeights13_product_ne_traceWeights22_product :
    traceWeightProduct2 traceWeights13 ≠
      traceWeightProduct2 traceWeights22 := by
  simp [traceWeightProduct2, traceWeights13, traceWeights22]

/-- Diagonal trace normalization can agree while the entropy-relevant product of
central trace weights differs. -/
theorem traceWeights13_22_same_total_different_product :
    totalWeight2 traceWeights13 = totalWeight2 traceWeights22 ∧
      traceWeightProduct2 traceWeights13 ≠
        traceWeightProduct2 traceWeights22 := by
  exact ⟨traceWeights13_total_eq_traceWeights22_total,
    traceWeights13_product_ne_traceWeights22_product⟩

/-- The first atomic trace-calibration input. -/
def traceAtom0 : Fin 2 -> Nat :=
  fun i => if i = 0 then 1 else 0

/-- The second atomic trace-calibration input. -/
def traceAtom1 : Fin 2 -> Nat :=
  fun i => if i = 0 then 0 else 1

/-- The first atomic trace test recovers the first central trace weight. -/
theorem finiteTrace2_traceAtom0 (weights : Fin 2 -> Nat) :
    finiteTrace2 weights traceAtom0 = weights 0 := by
  simp [finiteTrace2, traceAtom0]

/-- The second atomic trace test recovers the second central trace weight. -/
theorem finiteTrace2_traceAtom1 (weights : Fin 2 -> Nat) :
    finiteTrace2 weights traceAtom1 = weights 1 := by
  simp [finiteTrace2, traceAtom1]

theorem fin2_eq_one_of_ne_zero (i : Fin 2) (h : i ≠ 0) : i = 1 := by
  apply Fin.ext
  have hi : i.val < 2 := i.isLt
  have hval : i.val ≠ 0 := by
    intro hz
    apply h
    apply Fin.ext
    exact hz
  omega

/-- Atomic trace tests on both summands recover the two-summand central trace
weight vector. -/
theorem traceWeights_eq_of_atom_trace_tests {weights weights' : Fin 2 -> Nat}
    (h0 : finiteTrace2 weights traceAtom0 =
      finiteTrace2 weights' traceAtom0)
    (h1 : finiteTrace2 weights traceAtom1 =
      finiteTrace2 weights' traceAtom1) :
    weights = weights' := by
  have h0' : weights 0 = weights' 0 := by
    simpa [finiteTrace2_traceAtom0] using h0
  have h1' : weights 1 = weights' 1 := by
    simpa [finiteTrace2_traceAtom1] using h1
  funext i
  by_cases hi : i = 0
  · subst i
    exact h0'
  · have hi1 : i = 1 := fin2_eq_one_of_ne_zero i hi
    rw [hi1]
    exact h1'

/-- A normalized atomic trace-calibration datum for an arbitrary finite center:
testing the `i`th central atom reads out the `i`th trace weight.  This omits the
fixed nonzero factor `tau(h)` from the manuscript theorem. -/
def atomicTraceCalibrationData {m : Nat} (weights : Fin m -> Nat)
    (i : Fin m) : Nat :=
  weights i

/-- Atomic trace calibrations on every central atom recover the full finite
central trace-weight vector.  This is the finite coordinate skeleton of the
positive direction of the trace-weight calibration theorem. -/
theorem traceWeights_eq_of_all_atomic_trace_tests {m : Nat}
    {weights weights' : Fin m -> Nat}
    (h :
      ∀ i,
        atomicTraceCalibrationData weights i =
          atomicTraceCalibrationData weights' i) :
    weights = weights' := by
  funext i
  exact h i

/-- Positive Nat-valued trace weights, used as the finite skeleton of faithful
central trace weights. -/
def positiveNatWeights {m : Nat} (weights : Fin m -> Nat) : Prop :=
  ∀ i, 0 < weights i

/-- Agreement of atomic trace-calibration data on the coordinates selected by a
Boolean test mask. -/
def sameMaskedTraceCalibration {m : Nat}
    (mask : Fin m -> Bool) (weights weights' : Fin m -> Nat) : Prop :=
  ∀ i, mask i = true ->
    atomicTraceCalibrationData weights i =
      atomicTraceCalibrationData weights' i

/-- Masked atomic trace tests reconstruct all finite central trace weights exactly
when every atom is tested. -/
theorem maskedTraceCalibration_reconstruct_iff_supportFull {m : Nat}
    (mask : Fin m -> Bool) :
    (∀ weights weights' : Fin m -> Nat,
      sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask := by
  constructor
  · intro h i
    cases hm : mask i
    · let weights : Fin m -> Nat := fun _ => 1
      let weights' : Fin m -> Nat := fun j => if j = i then 2 else 1
      have hsame : sameMaskedTraceCalibration mask weights weights' := by
        intro j hj
        by_cases hji : j = i
        · subst j
          rw [hm] at hj
          cases hj
        · simp [atomicTraceCalibrationData, weights, weights', hji]
      have heq := h weights weights' hsame
      have hi := congrArg (fun f : Fin m -> Nat => f i) heq
      simp [weights, weights'] at hi
    · rfl
  · intro hfull weights weights' hsame
    funext i
    simpa [sameMaskedTraceCalibration, atomicTraceCalibrationData]
      using hsame i (hfull i)

/-- If a masked atomic trace calibration misses a coordinate, two positive
trace-weight vectors agree on all supplied atomic tests while differing on the
missed coordinate. -/
theorem not_supportFull_maskedTraceCalibration_counterexample {m : Nat}
    (mask : Fin m -> Bool) :
    ¬ supportFull mask ->
      ∃ weights weights' : Fin m -> Nat,
        positiveNatWeights weights ∧
        positiveNatWeights weights' ∧
        sameMaskedTraceCalibration mask weights weights' ∧
        weights ≠ weights' := by
  intro hnot
  by_cases hmissing : ∃ i, mask i = false
  · rcases hmissing with ⟨i, hi⟩
    let weights : Fin m -> Nat := fun _ => 1
    let weights' : Fin m -> Nat := fun j => if j = i then 2 else 1
    refine ⟨weights, weights', ?_, ?_, ?_, ?_⟩
    · intro j
      simp [weights]
    · intro j
      by_cases hji : j = i
      · simp [weights', hji]
      · simp [weights', hji]
    · intro j hj
      by_cases hji : j = i
      · subst j
        rw [hi] at hj
        cases hj
      · simp [atomicTraceCalibrationData, weights, weights', hji]
    · intro heq
      have hi_eq := congrArg (fun f : Fin m -> Nat => f i) heq
      simp [weights, weights'] at hi_eq
  · exact False.elim
      (hnot ((supportFull_iff_no_unsupported_atom mask).mpr hmissing))

/-- Masked atomic trace calibration has a sharp finite alternative: either the
selected atomic tests reconstruct every trace-weight vector and the mask is full,
or there are two positive trace-weight vectors indistinguishable by the selected
tests but different as full central trace weights. -/
theorem maskedTraceCalibration_reconstruct_or_counterexample {m : Nat}
    (mask : Fin m -> Bool) :
    ((∀ weights weights' : Fin m -> Nat,
      sameMaskedTraceCalibration mask weights weights' -> weights = weights') ∧
      supportFull mask) ∨
      ((∃ weights weights' : Fin m -> Nat,
        positiveNatWeights weights ∧
        positiveNatWeights weights' ∧
        sameMaskedTraceCalibration mask weights weights' ∧
        weights ≠ weights') ∧
        ¬ supportFull mask) := by
  by_cases hfull : supportFull mask
  · left
    exact ⟨(maskedTraceCalibration_reconstruct_iff_supportFull mask).mpr hfull,
      hfull⟩
  · right
    exact ⟨not_supportFull_maskedTraceCalibration_counterexample mask hfull,
      hfull⟩

/-- Machine-checked finite skeleton of the no-restriction/effect-domain exit.
If all atomic effects of a specified finite center are admitted, the full
central weight vector is reconstructed.  If the admitted effect mask is proper,
two positive central weight assignments agree on every admitted effect but
differ as full central weights. -/
theorem noRestrictionEffectDomainExitCore {m : Nat} (mask : Fin m -> Bool) :
    ((∀ weights weights' : Fin m -> Nat,
      sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    (¬ supportFull mask ->
      ∃ weights weights' : Fin m -> Nat,
        positiveNatWeights weights ∧
        positiveNatWeights weights' ∧
        sameMaskedTraceCalibration mask weights weights' ∧
        weights ≠ weights') := by
  exact ⟨maskedTraceCalibration_reconstruct_iff_supportFull mask,
    not_supportFull_maskedTraceCalibration_counterexample mask⟩

/-- An affine central entropy/area representative on a finite simplex is modeled
by its values on the atomic vertices.  This is the finite coordinate skeleton of
an affine function on the state simplex. -/
def centralAffineVertexValues {m : Nat} := Fin m -> Int

/-- Agreement of affine representative values on the calibrated central
vertices selected by a Boolean mask. -/
def sameMaskedAffineCalibration {m : Nat}
    (mask : Fin m -> Bool)
    (values values' : centralAffineVertexValues (m := m)) : Prop :=
  ∀ i, mask i = true -> values i = values' i

/-- Calibrating affine representative values at every finite central vertex
recovers the affine ambiguity exactly when every vertex is calibrated. -/
theorem maskedAffineCalibration_reconstruct_iff_supportFull {m : Nat}
    (mask : Fin m -> Bool) :
    (∀ values values' : centralAffineVertexValues (m := m),
      sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask := by
  constructor
  · intro h i
    cases hm : mask i
    · let values : centralAffineVertexValues (m := m) := fun _ => 0
      let values' : centralAffineVertexValues (m := m) :=
        fun j => if j = i then 1 else 0
      have hsame : sameMaskedAffineCalibration mask values values' := by
        intro j hj
        by_cases hji : j = i
        · subst j
          rw [hm] at hj
          cases hj
        · simp [values, values', hji]
      have heq := h values values' hsame
      have hi := congrArg (fun f : centralAffineVertexValues (m := m) => f i) heq
      simp [values, values'] at hi
    · rfl
  · intro hfull values values' hsame
    funext i
    exact hsame i (hfull i)

/-- If a finite affine calibration misses a central vertex, then two affine
representatives agree on every calibrated vertex while differing at the missed
one. -/
theorem not_supportFull_maskedAffineCalibration_counterexample {m : Nat}
    (mask : Fin m -> Bool) :
    ¬ supportFull mask ->
      ∃ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' ∧ values ≠ values' := by
  intro hnot
  by_cases hmissing : ∃ i, mask i = false
  · rcases hmissing with ⟨i, hi⟩
    let values : centralAffineVertexValues (m := m) := fun _ => 0
    let values' : centralAffineVertexValues (m := m) :=
      fun j => if j = i then 1 else 0
    refine ⟨values, values', ?_, ?_⟩
    · intro j hj
      by_cases hji : j = i
      · subst j
        rw [hi] at hj
        cases hj
      · simp [values, values', hji]
    · intro heq
      have hi_eq := congrArg (fun f : centralAffineVertexValues (m := m) => f i) heq
      simp [values, values'] at hi_eq
  · exact False.elim
      (hnot ((supportFull_iff_no_unsupported_atom mask).mpr hmissing))

/-- Coordinatewise positivity for a two-dimensional signed finite center. -/
def positivePair2 (x : Fin 2 -> Int) : Prop :=
  0 <= x 0 ∧ 0 <= x 1

/-- The first positive test from the order-cone counterexample. -/
def gamma1 (x : Fin 2 -> Int) : Int :=
  x 0 + x 1

/-- The second positive test from the order-cone counterexample. -/
def gamma2 (x : Fin 2 -> Int) : Int :=
  x 0 + 2 * x 1

/-- The cone reconstructed from the two positivity tests `gamma1` and `gamma2`. -/
def testedPositiveByGamma12 (x : Fin 2 -> Int) : Prop :=
  0 <= gamma1 x ∧ 0 <= gamma2 x

/-- A signed vector accepted by the two tests but outside the positive orthant. -/
def orderConeWitness : Fin 2 -> Int :=
  fun i => if i = 0 then 3 else -1

/-- The witness passes the two tested positivity inequalities. -/
theorem orderConeWitness_testedPositive :
    testedPositiveByGamma12 orderConeWitness := by
  simp [testedPositiveByGamma12, gamma1, gamma2, orderConeWitness]

/-- The same witness is not coordinatewise positive. -/
theorem orderConeWitness_not_positive :
    ¬ positivePair2 orderConeWitness := by
  intro h
  rcases h with ⟨_, h1⟩
  simp [orderConeWitness] at h1

/-- Hence the two-test cone strictly contains a nonpositive vector.  This is the
finite coordinate witness behind the order-cone no-reconstruction example. -/
theorem testedCone12_contains_nonpositive :
    ∃ x : Fin 2 -> Int, testedPositiveByGamma12 x ∧ ¬ positivePair2 x := by
  exact ⟨orderConeWitness, orderConeWitness_testedPositive,
    orderConeWitness_not_positive⟩

/-- The first two-test positivity functional has strictly positive coefficients
on both atoms. -/
theorem gamma1_coefficients_strictly_positive :
    0 < (1 : Int) ∧ 0 < (1 : Int) := by
  constructor <;> decide

/-- The second two-test positivity functional has strictly positive coefficients
on both atoms. -/
theorem gamma2_coefficients_strictly_positive :
    0 < (1 : Int) ∧ 0 < (2 : Int) := by
  constructor <;> decide

/-- Faithful two-coordinate positive tests can still accept a nonpositive
central vector. -/
theorem faithfulPositiveTests_can_miss_atomic_positivity :
    (0 < (1 : Int) ∧ 0 < (1 : Int)) ∧
      (0 < (1 : Int) ∧ 0 < (2 : Int)) ∧
      ∃ x : Fin 2 -> Int, testedPositiveByGamma12 x ∧ ¬ positivePair2 x := by
  exact ⟨gamma1_coefficients_strictly_positive,
    gamma2_coefficients_strictly_positive,
    testedCone12_contains_nonpositive⟩

/-- The faithful smeared readout on a two-atom finite center. -/
def sumReadout2 (x : Fin 2 -> Int) : Int :=
  x 0 + x 1

/-- The linear kernel of the two-atom sum readout. -/
def sumReadoutKernel2 (x : Fin 2 -> Int) : Prop :=
  sumReadout2 x = 0

/-- Coordinatewise multiplication in the two-atom finite center. -/
def centralMul2 (x y : Fin 2 -> Int) : Fin 2 -> Int :=
  fun i => x i * y i

/-- The zero vector in the two-atom integer finite center. -/
def zeroInt2 : Fin 2 -> Int :=
  fun _ => 0

/-- The first integer atom in the two-atom finite center. -/
def atom0Int2 : Fin 2 -> Int :=
  fun i => if i = 0 then 1 else 0

/-- The signed kernel witness `(1,-1)` for the two-atom sum readout. -/
def sumReadoutKernelWitness2 : Fin 2 -> Int :=
  fun i => if i = 0 then 1 else -1

/-- The sum readout is faithful on the positive cone: a positive vector with
zero total readout has zero value at both atoms. -/
theorem sumReadout2_faithful_on_positive_cone {x : Fin 2 -> Int}
    (hpos : positivePair2 x) (hzero : sumReadout2 x = 0) :
    x 0 = 0 ∧ x 1 = 0 := by
  rcases hpos with ⟨h0, h1⟩
  have hsum : x 0 + x 1 = 0 := by
    simpa [sumReadout2] using hzero
  have hx0 : x 0 = 0 := by omega
  have hx1 : x 1 = 0 := by omega
  exact ⟨hx0, hx1⟩

/-- The two-atom sum readout does not separate the two atomic projections. -/
theorem sumReadout2_not_injective :
    ¬ Function.Injective sumReadout2 := by
  intro hinj
  let e0 : Fin 2 -> Int := fun i => if i = 0 then 1 else 0
  let e1 : Fin 2 -> Int := fun i => if i = 0 then 0 else 1
  have hsame : sumReadout2 e0 = sumReadout2 e1 := by
    simp [sumReadout2, e0, e1]
  have heq := hinj hsame
  have hcoord := congrArg (fun f : Fin 2 -> Int => f 0) heq
  simp [e0, e1] at hcoord

/-- The sum-readout kernel contains `(1,-1)`, but multiplying by an atomic
projection gives `(1,0)`, which is no longer in the kernel. -/
theorem sumReadout2_kernel_not_closed_under_multiplication :
    sumReadoutKernel2 sumReadoutKernelWitness2 ∧
      ¬ sumReadoutKernel2
        (centralMul2 sumReadoutKernelWitness2 atom0Int2) := by
  constructor
  · simp [sumReadoutKernel2, sumReadout2, sumReadoutKernelWitness2]
  · intro h
    simp [sumReadoutKernel2, sumReadout2, centralMul2,
      sumReadoutKernelWitness2, atom0Int2] at h

/-- Two vectors have the same two-atom readout class when their difference lies
in the sum-readout kernel. -/
def sumReadoutEquivalent2 (x y : Fin 2 -> Int) : Prop :=
  sumReadout2 (fun i => x i - y i) = 0

/-- Coordinatewise multiplication would descend to the sum-readout quotient
only if it respected the readout equivalence relation in both variables. -/
def productDescendsToSumReadoutQuotient2 : Prop :=
  ∀ x x' y y' : Fin 2 -> Int,
    sumReadoutEquivalent2 x x' ->
    sumReadoutEquivalent2 y y' ->
    sumReadoutEquivalent2 (centralMul2 x y) (centralMul2 x' y')

/-- The two-atom sum readout identifies `(1,-1)` with zero. -/
theorem sumReadoutKernelWitness2_equiv_zero :
    sumReadoutEquivalent2 sumReadoutKernelWitness2 zeroInt2 := by
  simp [sumReadoutEquivalent2, sumReadout2, sumReadoutKernelWitness2, zeroInt2]

/-- Every vector is equivalent to itself for the sum-readout relation. -/
theorem sumReadoutEquivalent2_refl (x : Fin 2 -> Int) :
    sumReadoutEquivalent2 x x := by
  simp [sumReadoutEquivalent2, sumReadout2]

/-- The product of the kernel witness with the first atom is not equivalent to
the product of zero with that atom. -/
theorem sumReadoutKernelWitness2_product_not_equiv_zero_product :
    ¬ sumReadoutEquivalent2
      (centralMul2 sumReadoutKernelWitness2 atom0Int2)
      (centralMul2 zeroInt2 atom0Int2) := by
  intro h
  simp [sumReadoutEquivalent2, sumReadout2, centralMul2,
    sumReadoutKernelWitness2, zeroInt2, atom0Int2] at h

/-- Coordinatewise multiplication is not well-defined on the quotient induced
by the faithful two-atom sum readout. -/
theorem sumReadout2_product_not_well_defined_on_quotient :
    ¬ productDescendsToSumReadoutQuotient2 := by
  intro hdesc
  exact sumReadoutKernelWitness2_product_not_equiv_zero_product
    (hdesc sumReadoutKernelWitness2 zeroInt2 atom0Int2 atom0Int2
      sumReadoutKernelWitness2_equiv_zero
      (sumReadoutEquivalent2_refl atom0Int2))

/-- Machine-checked two-atom witness for the central-readout quotient theorem:
positive-cone faithfulness does not imply central algebra reconstruction. -/
theorem sumReadout2_faithful_not_injective_kernel_not_ideal :
    (∀ x : Fin 2 -> Int,
      positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
    ¬ Function.Injective sumReadout2 ∧
    (∃ k c : Fin 2 -> Int,
      sumReadoutKernel2 k ∧ ¬ sumReadoutKernel2 (centralMul2 k c)) ∧
    ¬ productDescendsToSumReadoutQuotient2 := by
  exact ⟨(fun x hpos hzero =>
      sumReadout2_faithful_on_positive_cone hpos hzero),
    sumReadout2_not_injective,
    ⟨sumReadoutKernelWitness2, atom0Int2,
      sumReadout2_kernel_not_closed_under_multiplication⟩,
    sumReadout2_product_not_well_defined_on_quotient⟩

/-- Named finite core of the strengthened central-readout quotient criterion:
positive-cone faithfulness plus noninjectivity forces the readout kernel to fail
the algebra-quotient condition in the two-atom witness. -/
theorem faithfulReadoutAlgebraQuotientObstructionCore :
    (∀ x : Fin 2 -> Int,
      positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
    ¬ Function.Injective sumReadout2 ∧
    (∃ k c : Fin 2 -> Int,
      sumReadoutKernel2 k ∧ ¬ sumReadoutKernel2 (centralMul2 k c)) ∧
    ¬ productDescendsToSumReadoutQuotient2 := by
  exact sumReadout2_faithful_not_injective_kernel_not_ideal

/-- Machine-checked finite core of the corollary that positive support
faithfulness alone does not select the two-atom finite center. -/
theorem positiveSupportFaithfulnessDoesNotSelectBinaryCore :
    (∀ x : Fin 2 -> Int,
      positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
    ¬ Function.Injective sumReadout2 ∧
    ¬ productDescendsToSumReadoutQuotient2 ∧
    ¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity := by
  exact ⟨(fun x hpos hzero =>
      sumReadout2_faithful_on_positive_cone hpos hzero),
    sumReadout2_not_injective,
    sumReadout2_product_not_well_defined_on_quotient,
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation⟩

/-- Machine-checked finite core of the Type II core corollary: post-retraction
data can be positive on all atoms and still fail to decide the two-atom predicate, while
coarse trace data can agree although the entropy-relevant central trace product
differs. -/
theorem typeIICorePostRetractionDoesNotSelectRankCore :
    (∀ x : Fin 2 -> Int,
      positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
    ¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity ∧
    totalWeight2 traceWeights13 = totalWeight2 traceWeights22 ∧
    traceWeightProduct2 traceWeights13 ≠
      traceWeightProduct2 traceWeights22 := by
  exact ⟨(fun x hpos hzero =>
      sumReadout2_faithful_on_positive_cone hpos hzero),
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation,
    traceWeights13_total_eq_traceWeights22_total,
    traceWeights13_product_ne_traceWeights22_product⟩

/-- Machine-checked finite skeleton of the crossed-product entropy calibration
criterion: post-retraction core data can be positive on every atom and still
not decide the two-atom predicate; scalar trace calibration can agree while the
entropy-relevant central trace product differs; full masked atomic trace
calibration is exact precisely under full support of the calibration mask; and
an area-density coefficient descends exactly when it is constant on data
fibers. -/
theorem crossedProductEntropyCalibrationFiberCore {m : Nat}
    (mask : Fin m -> Bool) :
    (∀ x : Fin 2 -> Int,
      positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
    ¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity ∧
    totalWeight2 traceWeights13 = totalWeight2 traceWeights22 ∧
    traceWeightProduct2 traceWeights13 ≠
      traceWeightProduct2 traceWeights22 ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y) := by
  exact ⟨(fun x hpos hzero =>
      sumReadout2_faithful_on_positive_cone hpos hzero),
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation,
    traceWeights13_total_eq_traceWeights22_total,
    traceWeights13_product_ne_traceWeights22_product,
    maskedTraceCalibration_reconstruct_iff_supportFull mask,
    (fun observe coefficient =>
      areaCoefficientDescentCriterionCore observe coefficient)⟩

/-- Machine-checked finite core of the operator-algebra QEC/edge-center
corollary: represented code data blind to the finite center decide neither the
two-atom edge predicate nor the finite-center entropy coefficient. -/
theorem exactRecoveryBlindEdgeCenterNoGoCore :
    ¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity ∧
    ¬ factorsThrough blindEntropyObservation
      finiteCentralEntropyCoefficient := by
  exact ⟨isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation,
    entropyCoefficient_not_factorsThrough_blindObservation⟩

/-- Machine-checked finite skeleton of the relative-entropy/recovery descent
corollary: fixed represented or recovered data that are blind to the finite
center do not reconstruct the ambient finite central cardinality, and do not
decide the two-atom predicate.  The analytic relative-entropy and recovery
hypotheses are supplied in the manuscript; this theorem is the finite
same-data-cardinality fiber. -/
theorem relativeEntropyRecoveryDescentCore :
    (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
    (¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity) := by
  exact ⟨finiteCentralMultiplicity_not_factorsThrough_blindObservation,
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation⟩

/-- Referee-form finite core of the locally covariant readout obstruction:
componentwise relative-Cauchy fixed-point data preserve the dynamical-locality
equality, but blind post-retraction readouts still reconstruct neither finite
central cardinality, nor the two-atom predicate, nor the finite-center entropy
coefficient. -/
theorem refereeLCQFTRetractedReadoutRankCore {J X : Type} {m : Nat}
    (kinematic : X -> Prop) (action : J -> X -> X)
    (hlocal : ∀ x, kinematic x <-> fixedByFamily action x)
    (f : Fin m -> X) :
    ((∀ i, kinematic (f i)) <->
      fixedByFamily (fun j => componentwiseAction action j) f) ∧
    (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
    (¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity) ∧
    (¬ factorsThrough blindEntropyObservation
      finiteCentralEntropyCoefficient) := by
  exact ⟨copiedCenterDynamicalLocalityCore kinematic action hlocal f,
    finiteCentralMultiplicity_not_factorsThrough_blindObservation,
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation,
    entropyCoefficient_not_factorsThrough_blindObservation⟩

/-- Two area-scale candidates with the same entropy product but different
area coefficient. -/
inductive AreaScaleCandidate where
  | base
  | rescaled
  deriving DecidableEq

/-- The calibrated geometric area assigned to the candidate, in arbitrary
integer units. -/
def areaScaleAreaNat : AreaScaleCandidate -> Nat
  | AreaScaleCandidate.base => 6
  | AreaScaleCandidate.rescaled => 3

/-- The entropy coefficient multiplying the area, in reciprocal arbitrary
integer units. -/
def areaScaleCoefficientNat : AreaScaleCandidate -> Nat
  | AreaScaleCandidate.base => 1
  | AreaScaleCandidate.rescaled => 2

/-- The product visible to an entropy formula that only sees coefficient times
area. -/
def areaScaleProductNat (candidate : AreaScaleCandidate) : Nat :=
  areaScaleCoefficientNat candidate * areaScaleAreaNat candidate

theorem areaScaleProduct_base_eq_rescaled :
    areaScaleProductNat AreaScaleCandidate.base =
      areaScaleProductNat AreaScaleCandidate.rescaled := by
  simp [areaScaleProductNat, areaScaleCoefficientNat, areaScaleAreaNat]

theorem areaScaleCoefficient_base_ne_rescaled :
    areaScaleCoefficientNat AreaScaleCandidate.base ≠
      areaScaleCoefficientNat AreaScaleCandidate.rescaled := by
  simp [areaScaleCoefficientNat]

/-- Machine-checked finite core of the Newton-coupling/area-scale calibration
corollary: product-visible entropy data do not reconstruct the area coefficient. -/
theorem areaScaleProductDoesNotReconstructCoefficientCore :
    ¬ factorsThrough areaScaleProductNat areaScaleCoefficientNat := by
  exact not_factorsThrough_of_fiber_counterexample
    areaScaleProductNat
    areaScaleCoefficientNat
    (x := AreaScaleCandidate.base)
    (y := AreaScaleCandidate.rescaled)
    areaScaleProduct_base_eq_rescaled
    areaScaleCoefficient_base_ne_rescaled

/-- Two entropy-density candidates with the same represented/retracted entropy
data but different area-density coefficients.  The second candidate models the
finite-center shift `c ↦ c + alpha` after area units and hbar have been fixed. -/
inductive EntropyNewtonCandidate where
  | base
  | shifted
  deriving DecidableEq

/-- Represented/retracted entropy data blind to the finite-center density
residual. -/
def entropyNewtonBlindData (_candidate : EntropyNewtonCandidate) : Unit :=
  ()

/-- The area-density coefficient in fixed units. -/
def entropyNewtonCoefficientNat : EntropyNewtonCandidate -> Nat
  | EntropyNewtonCandidate.base => 1
  | EntropyNewtonCandidate.shifted => 2

/-- With hbar and area units fixed, the denominator of the inferred Newton
coupling is proportional to the entropy-density coefficient.  This finite
skeleton records the denominator `4 hbar c` with hbar normalized to one. -/
def inferredNewtonDenominatorNat : EntropyNewtonCandidate -> Nat
  | EntropyNewtonCandidate.base => 4
  | EntropyNewtonCandidate.shifted => 8

theorem entropyNewtonBlindData_base_eq_shifted :
    entropyNewtonBlindData EntropyNewtonCandidate.base =
      entropyNewtonBlindData EntropyNewtonCandidate.shifted := by
  simp [entropyNewtonBlindData]

theorem entropyNewtonCoefficient_base_ne_shifted :
    entropyNewtonCoefficientNat EntropyNewtonCandidate.base ≠
      entropyNewtonCoefficientNat EntropyNewtonCandidate.shifted := by
  simp [entropyNewtonCoefficientNat]

theorem inferredNewtonDenominator_base_ne_shifted :
    inferredNewtonDenominatorNat EntropyNewtonCandidate.base ≠
      inferredNewtonDenominatorNat EntropyNewtonCandidate.shifted := by
  simp [inferredNewtonDenominatorNat]

/-- Machine-checked finite core of the entropy-normalization obstruction to
Newton-coupling identification: once area units and hbar are fixed, same blind
entropy data can still have different finite-center entropy-density coefficients
and therefore different inferred Newton-coupling denominators. -/
theorem entropyDensityResidualDoesNotReconstructNewtonCore :
    (¬ factorsThrough entropyNewtonBlindData entropyNewtonCoefficientNat) ∧
    (¬ factorsThrough entropyNewtonBlindData inferredNewtonDenominatorNat) := by
  exact ⟨
    not_factorsThrough_of_fiber_counterexample
      entropyNewtonBlindData
      entropyNewtonCoefficientNat
      (x := EntropyNewtonCandidate.base)
      (y := EntropyNewtonCandidate.shifted)
      entropyNewtonBlindData_base_eq_shifted
      entropyNewtonCoefficient_base_ne_shifted,
    not_factorsThrough_of_fiber_counterexample
      entropyNewtonBlindData
      inferredNewtonDenominatorNat
      (x := EntropyNewtonCandidate.base)
      (y := EntropyNewtonCandidate.shifted)
      entropyNewtonBlindData_base_eq_shifted
      inferredNewtonDenominator_base_ne_shifted⟩

/-- Machine-checked finite/logical core of the Bekenstein-Hawking coefficient
identifiability criterion: product-visible area data do not reconstruct the
coefficient, and once a coefficient is represented as an invariant, it descends
to operational data exactly when it is constant on data fibers. -/
theorem bekensteinHawkingCoefficientIdentifiabilityCore :
    (¬ factorsThrough areaScaleProductNat areaScaleCoefficientNat) ∧
    (¬ factorsThrough entropyNewtonBlindData inferredNewtonDenominatorNat) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y) := by
  exact ⟨areaScaleProductDoesNotReconstructCoefficientCore,
    entropyDensityResidualDoesNotReconstructNewtonCore.2,
    (fun observe coefficient =>
      areaCoefficientDescentCriterionCore observe coefficient)⟩

/-- Referee-form finite core of the Bekenstein-Hawking coefficient obstruction
and exact repair: product-visible area data do not determine the coefficient,
blind entropy-density data do not determine the inferred Newton denominator,
and any formed coefficient descends exactly when it is constant on operational
fibers. -/
theorem refereeBekensteinHawkingCoefficientCore :
    (¬ factorsThrough areaScaleProductNat areaScaleCoefficientNat) ∧
    (¬ factorsThrough entropyNewtonBlindData inferredNewtonDenominatorNat) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y) := by
  exact bekensteinHawkingCoefficientIdentifiabilityCore

/-- Machine-checked finite/logical core of the relative-entropy/Type-II
area-term identifiability theorem: masked affine calibration and masked trace
calibration are exact precisely under full support of the tested mask, and any
formed area coefficient descends exactly when it is constant on data fibers. -/
theorem relativeEntropyTypeIIAreaIdentifiabilityCore {m : Nat}
    (mask : Fin m -> Bool) :
    ((∀ values values' : centralAffineVertexValues (m := m),
      sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y) := by
  exact ⟨maskedAffineCalibration_reconstruct_iff_supportFull mask,
    maskedTraceCalibration_reconstruct_iff_supportFull mask,
    (fun observe coefficient =>
      areaCoefficientDescentCriterionCore observe coefficient)⟩

/-- Machine-checked finite skeleton of the central calibration-rank criterion:
masked affine and trace calibrations reconstruct all central coordinates exactly
under full support; if a central atom is missed, each calibration admits a
same-data counterexample.  A formed area coefficient descends exactly when it is
constant on data fibers. -/
theorem centralCalibrationRankCriterionCore {m : Nat}
    (mask : Fin m -> Bool) :
    (((∀ values values' : centralAffineVertexValues (m := m),
      sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (¬ supportFull mask ->
      ∃ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' ∧ values ≠ values')) ∧
    (((∀ weights weights' : Fin m -> Nat,
      sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    (¬ supportFull mask ->
      ∃ weights weights' : Fin m -> Nat,
        positiveNatWeights weights ∧ positiveNatWeights weights' ∧
        sameMaskedTraceCalibration mask weights weights' ∧ weights ≠ weights')) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y) := by
  exact ⟨
    ⟨maskedAffineCalibration_reconstruct_iff_supportFull mask,
      not_supportFull_maskedAffineCalibration_counterexample mask⟩,
    ⟨maskedTraceCalibration_reconstruct_iff_supportFull mask,
      not_supportFull_maskedTraceCalibration_counterexample mask⟩,
    (fun observe coefficient =>
      areaCoefficientDescentCriterionCore observe coefficient)⟩

/-- Referee-form finite core of the relative-entropy central-face criterion:
after relative-entropy data have reduced the remaining absolute entropy/area
freedom to affine central terms, a tested central face fixes those terms and the
finite central trace weights exactly when the tested mask covers every central
vertex.  If a vertex is missed, two representatives agree on the tested face but
differ globally. -/
theorem relativeEntropyCentralFaceCalibrationCore {m : Nat}
    (mask : Fin m -> Bool) :
    ((∀ values values' : centralAffineVertexValues (m := m),
      sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (¬ supportFull mask ->
      ∃ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' ∧ values ≠ values') ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) := by
  exact ⟨maskedAffineCalibration_reconstruct_iff_supportFull mask,
    not_supportFull_maskedAffineCalibration_counterexample mask,
    maskedTraceCalibration_reconstruct_iff_supportFull mask⟩

/-- Coordinatewise positivity on an arbitrary finite signed center. -/
def signedPositive {m : Nat} (x : Fin m -> Int) : Prop :=
  ∀ i, 0 <= x i

/-- Positivity certified only by the coordinate tests selected by `mask`. -/
def testedByCoordinateMask {m : Nat}
    (mask : Fin m -> Bool) (x : Fin m -> Int) : Prop :=
  ∀ i, mask i = true -> 0 <= x i

/-- Equality of all coordinate readouts selected by `mask`. -/
def sameMaskedCoordinateReadouts {m : Nat}
    (mask : Fin m -> Bool) (x y : Fin m -> Int) : Prop :=
  ∀ i, mask i = true -> x i = y i

/-- The coordinate-test family reconstructs the full positive orthant exactly
when every coordinate is tested.  This is the finite coordinate-ray skeleton of
the dual-cone/order-calibration criterion. -/
theorem coordinateTests_reconstruct_positive_iff_supportFull {m : Nat}
    (mask : Fin m -> Bool) :
    (∀ x : Fin m -> Int, testedByCoordinateMask mask x <-> signedPositive x) <->
      supportFull mask := by
  constructor
  · intro h i
    cases hm : mask i
    · let x : Fin m -> Int := fun j => if j = i then (-1 : Int) else 0
      have htested : testedByCoordinateMask mask x := by
        intro j hj
        by_cases hji : j = i
        · subst j
          rw [hm] at hj
          cases hj
        · simp [x, hji]
      have hpos : signedPositive x := (h x).mp htested
      have hi := hpos i
      simp [x] at hi
    · rfl
  · intro h x
    constructor
    · intro htested i
      exact htested i (h i)
    · intro hpos i _hi
      exact hpos i

/-- If a coordinate positivity test is missing, the tested cone contains a vector
outside the true positive orthant. -/
theorem not_supportFull_coordinateTests_false_positive {m : Nat}
    (mask : Fin m -> Bool) :
    ¬ supportFull mask ->
      ∃ x : Fin m -> Int,
        testedByCoordinateMask mask x ∧ ¬ signedPositive x := by
  intro hnot
  by_cases hmissing : ∃ i, mask i = false
  · rcases hmissing with ⟨i, hi⟩
    let x : Fin m -> Int := fun j => if j = i then (-1 : Int) else 0
    refine ⟨x, ?_, ?_⟩
    · intro j hj
      by_cases hji : j = i
      · subst j
        rw [hi] at hj
        cases hj
      · simp [x, hji]
    · intro hpos
      have hneg := hpos i
      simp [x] at hneg
  · exact False.elim
      (hnot ((supportFull_iff_no_unsupported_atom mask).mpr hmissing))

/-- Coordinate tests have a sharp finite alternative: either every coordinate is
tested and they reconstruct the true positive orthant, or a signed
false-positive vector passes all supplied tests. -/
theorem coordinateTests_reconstruct_or_false_positive {m : Nat}
    (mask : Fin m -> Bool) :
    ((∀ x : Fin m -> Int,
        testedByCoordinateMask mask x <-> signedPositive x) ∧
        supportFull mask) ∨
      ((∃ x : Fin m -> Int,
        testedByCoordinateMask mask x ∧ ¬ signedPositive x) ∧
        ¬ supportFull mask) := by
  by_cases hfull : supportFull mask
  · left
    exact ⟨(coordinateTests_reconstruct_positive_iff_supportFull mask).mpr hfull,
      hfull⟩
  · right
    exact ⟨not_supportFull_coordinateTests_false_positive mask hfull, hfull⟩

/-- Masked coordinate readouts reconstruct all finite central coordinates
exactly when every coordinate is tested. -/
theorem maskedCoordinateReadouts_reconstruct_iff_supportFull {m : Nat}
    (mask : Fin m -> Bool) :
    (∀ x y : Fin m -> Int,
      sameMaskedCoordinateReadouts mask x y -> x = y) <->
      supportFull mask := by
  constructor
  · intro h i
    cases hm : mask i
    · let x : Fin m -> Int := fun j => if j = i then (1 : Int) else 0
      let y : Fin m -> Int := fun _ => 0
      have hsame : sameMaskedCoordinateReadouts mask x y := by
        intro j hj
        by_cases hji : j = i
        · subst j
          rw [hm] at hj
          cases hj
        · simp [x, y, hji]
      have hxy := h x y hsame
      have hi := congrFun hxy i
      simp [x, y] at hi
    · rfl
  · intro h x y hsame
    funext i
    exact hsame i (h i)

/-- If a coordinate readout is missing, two distinct coordinate assignments
agree on every supplied readout. -/
theorem not_supportFull_maskedCoordinateReadouts_counterexample {m : Nat}
    (mask : Fin m -> Bool) :
    ¬ supportFull mask ->
      ∃ x y : Fin m -> Int,
        sameMaskedCoordinateReadouts mask x y ∧ x ≠ y := by
  intro hnot
  by_cases hmissing : ∃ i, mask i = false
  · rcases hmissing with ⟨i, hi⟩
    let x : Fin m -> Int := fun j => if j = i then (1 : Int) else 0
    let y : Fin m -> Int := fun _ => 0
    refine ⟨x, y, ?_, ?_⟩
    · intro j hj
      by_cases hji : j = i
      · subst j
        rw [hi] at hj
        cases hj
      · simp [x, y, hji]
    · intro hxy
      have hx := congrFun hxy i
      simp [x, y] at hx
  · exact False.elim
      (hnot ((supportFull_iff_no_unsupported_atom mask).mpr hmissing))

/-- Machine-checked finite core of the local-net reconstruction classification
theorem in the short manuscript.  It packages the four finite reconstruction
conditions and the tensor-kernel obstruction: family readouts are centrally
faithful exactly when they cover every atom, coordinate readouts reconstruct
the positive cone exactly when the test mask is full, masked trace calibration
reconstructs all central trace weights exactly when the mask is full, masked
affine calibration reconstructs all vertex values exactly when the mask is
full, and every finite center with at least two atoms has a nontrivial
diagonal-multiplication tensor kernel.  It also includes the exact finite
split-exit criterion: diagonal multiplication is injective iff there are no
two distinct central atoms. -/
theorem finiteCenterLocalNetClassificationCore
    {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) (mask : Fin m -> Bool) (n : Nat) :
    (familyRepresentedCenterFaithful supports <->
      familyCoversAtoms supports) ∧
    ((∀ x : Fin m -> Int,
        testedByCoordinateMask mask x <-> signedPositive x) <->
      supportFull mask) ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (Function.Injective
      (diagonalRestrict : (Fin m × Fin m -> Nat) -> Fin m -> Nat) <->
      ∀ i j : Fin m, i ≠ j -> False) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) := by
  exact ⟨familyRepresentedCenterFaithful_iff_familyCoversAtoms supports,
    coordinateTests_reconstruct_positive_iff_supportFull mask,
    maskedTraceCalibration_reconstruct_iff_supportFull mask,
    maskedAffineCalibration_reconstruct_iff_supportFull mask,
    diagonalRestrict_injective_iff_no_distinct_atoms,
    diagonalRestrict_not_injective_two_atoms n⟩

/-- Machine-checked wrapper for the short manuscript's main finite-center
dichotomy.  It collects the finite/logical cores corresponding to the four
reader-facing exits:

* atom-label reconstruction is exactly readout injectivity;
* full support is exactly family coverage of every central atom;
* trace and affine entropy/area calibration reconstruct all finite central
  weights or vertex values exactly when every relevant atom or vertex is tested;
* finite shared-center tensor factorization is injective exactly when there
  are no distinct central atoms, and every center with at least two atoms has a
  nontrivial diagonal-multiplication kernel. -/
theorem mainFiniteCenterDichotomyCore
    {A D β : Type} {m : Nat}
    (obs : A -> D) (supports : β -> Fin m -> Bool)
    (mask : Fin m -> Bool) (n : Nat) :
    (Function.Injective obs <-> ∀ a b, obs a = obs b -> a = b) ∧
    (familyRepresentedCenterFaithful supports <->
      familyCoversAtoms supports) ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (Function.Injective
      (diagonalRestrict : (Fin m × Fin m -> Nat) -> Fin m -> Nat) <->
      ∀ i j : Fin m, i ≠ j -> False) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) := by
  exact ⟨atomReadout_reconstructs_labels_iff_injective obs,
    familyRepresentedCenterFaithful_iff_familyCoversAtoms supports,
    maskedTraceCalibration_reconstruct_iff_supportFull mask,
    maskedAffineCalibration_reconstruct_iff_supportFull mask,
    diagonalRestrict_injective_iff_no_distinct_atoms,
    diagonalRestrict_not_injective_two_atoms n⟩

/-- Machine-checked finite skeleton of the support-faithfulness and finite
central cardinality
no-go corollary.  If a represented family misses a finite central atom, that
atom is nonzero in the full finite algebra but zero in the represented quotient.
Independently, blind finite-cardinality data reconstruct neither the finite
central cardinality nor the two-atom predicate. -/
theorem supportFaithfulnessBinaryRankNoGoCore
    {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool)
    (hmiss : ¬ familyCoversAtoms supports) :
    (∃ i,
      sameSupportedRepresentation (familySupport supports) (atomOn i)
        (fun _ => 0) ∧
        Not (atomOn i = fun _ => 0)) ∧
    (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
    (¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity) := by
  exact ⟨not_familyCoversAtoms_gives_family_invisible_nonzero_atom supports
      hmiss,
    finiteCentralMultiplicity_not_factorsThrough_blindObservation,
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation⟩

/-- The coordinate readout that records both atoms of a two-atom finite center. -/
def coordinateReadout2Nat (x : Fin 2 -> Nat) : Nat × Nat :=
  (x 0, x 1)

/-- Reading both coordinates separates a two-atom finite center. -/
theorem coordinateReadout2Nat_injective :
    Function.Injective coordinateReadout2Nat := by
  intro x y h
  have h0 : x 0 = y 0 := congrArg Prod.fst h
  have h1 : x 1 = y 1 := congrArg Prod.snd h
  funext i
  by_cases hi : i = 0
  · subst i
    exact h0
  · have hi1 : i = 1 := fin2_eq_one_of_ne_zero i hi
    rw [hi1]
    exact h1

/-- The family of all atomic support readouts for a finite center. -/
def fullAtomicSupportFamily {m : Nat} : Fin m -> Fin m -> Bool :=
  fun b i => decide (i = b)

theorem fullAtomicSupportFamily_covers {m : Nat} :
    familyCoversAtoms (fullAtomicSupportFamily (m := m)) := by
  intro i
  exact ⟨i, by simp [fullAtomicSupportFamily]⟩

theorem fullAtomicSupportFamily_faithful {m : Nat} :
    familyRepresentedCenterFaithful (fullAtomicSupportFamily (m := m)) := by
  rw [familyRepresentedCenterFaithful_iff_familyCoversAtoms]
  exact fullAtomicSupportFamily_covers

/-- Machine-checked finite skeleton of the full normal central tomography exit:
atomic readouts cover every central atom, two-coordinate readout separates the
two-atom center, and supplying the actual finite central cardinality decides the
two-atom predicate. -/
theorem fullCentralTomographySharpExitCore {m : Nat} :
    familyRepresentedCenterFaithful (fullAtomicSupportFamily (m := m)) ∧
    Function.Injective coordinateReadout2Nat ∧
    propertyFactorsThrough
      (fun candidate =>
        (blindMultiplicityObservation candidate,
          finiteCentralMultiplicity candidate))
      isBinaryMultiplicity := by
  exact ⟨fullAtomicSupportFamily_faithful, coordinateReadout2Nat_injective,
    finiteCentralMultiplicity_augmented_decides_isBinaryMultiplicity⟩

/-- Machine-checked finite core of the distinction used in the complete positive
package: central support faithfulness is the minimal support exit, while full
central tomography is a stronger package that also separates atoms and decides
the two-atom predicate. -/
theorem supportExitWeakerThanFullCentralTomographyCore :
    ((∀ x : Fin 2 -> Int,
        positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
      ¬ Function.Injective sumReadout2) ∧
    (familyRepresentedCenterFaithful (fullAtomicSupportFamily (m := 2)) ∧
      Function.Injective coordinateReadout2Nat ∧
      propertyFactorsThrough
        (fun candidate =>
          (blindMultiplicityObservation candidate,
            finiteCentralMultiplicity candidate))
        isBinaryMultiplicity) := by
  exact ⟨⟨(fun x hpos hzero =>
      sumReadout2_faithful_on_positive_cone hpos hzero),
      sumReadout2_not_injective⟩,
    fullCentralTomographySharpExitCore (m := 2)⟩

/-- Named finite core of the finite-center readout obstruction: faithful
positive support readout alone does not recover atoms or the two-atom predicate, while full
atomic central tomography is the sharp positive exit. -/
theorem finiteCenterReadoutObstructionCore :
    ((∀ x : Fin 2 -> Int,
        positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
      ¬ Function.Injective sumReadout2 ∧
      ¬ productDescendsToSumReadoutQuotient2 ∧
      ¬ propertyFactorsThrough blindMultiplicityObservation
        isBinaryMultiplicity) ∧
    (familyRepresentedCenterFaithful (fullAtomicSupportFamily (m := 2)) ∧
      Function.Injective coordinateReadout2Nat ∧
      propertyFactorsThrough
        (fun candidate =>
          (blindMultiplicityObservation candidate,
            finiteCentralMultiplicity candidate))
        isBinaryMultiplicity) := by
  exact ⟨positiveSupportFaithfulnessDoesNotSelectBinaryCore,
    fullCentralTomographySharpExitCore (m := 2)⟩

/-- Machine-checked finite skeleton of the central-readout lower bound: a
masked family of atomic coordinate readouts reconstructs all central
coordinates exactly when every atom is read; if one atom is missed, there are
two distinct coordinate assignments in the same readout fiber. -/
theorem centralReadoutCoverageLowerBoundCore {m : Nat}
    (mask : Fin m -> Bool) :
    ((∀ x y : Fin m -> Int,
      sameMaskedCoordinateReadouts mask x y -> x = y) <->
      supportFull mask) ∧
    (¬ supportFull mask ->
      ∃ x y : Fin m -> Int,
        sameMaskedCoordinateReadouts mask x y ∧ x ≠ y) := by
  exact ⟨maskedCoordinateReadouts_reconstruct_iff_supportFull mask,
    not_supportFull_maskedCoordinateReadouts_counterexample mask⟩

/-- Machine-checked finite skeleton of the affine calibration criterion for
absolute entropy/area terms: calibrated vertex values reconstruct the finite
affine representative exactly when every vertex is calibrated; if not, two
representatives agree on all calibrated vertices but differ somewhere. -/
theorem affineCalibrationSharpExitCore {m : Nat} (mask : Fin m -> Bool) :
    ((∀ values values' : centralAffineVertexValues (m := m),
      sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (¬ supportFull mask ->
      ∃ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' ∧ values ≠ values') := by
  exact ⟨maskedAffineCalibration_reconstruct_iff_supportFull mask,
    not_supportFull_maskedAffineCalibration_counterexample mask⟩

/-- Named finite skeleton of the affine calibration lower bound on a finite
central simplex: missing a vertex leaves an affine representative ambiguity. -/
theorem affineCalibrationDimensionLowerBoundCore {m : Nat}
    (mask : Fin m -> Bool) :
    ((∀ values values' : centralAffineVertexValues (m := m),
      sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (¬ supportFull mask ->
      ∃ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' ∧ values ≠ values') := by
  exact affineCalibrationSharpExitCore mask

/-- Finite arithmetic skeleton of a central area-operator shift: the total
entropy value is unchanged when the same central expectation is added to the
area term and subtracted from the algebraic entropy term. -/
theorem centralAreaOperatorShiftPreservesEntropyCore
    (area algebraic shift : Int) :
    (area + shift) + (algebraic - shift) = area + algebraic := by
  omega

/-- Referee-form finite core of the OAQEC/JLMS edge-center and area-operator
obstruction: represented code data blind to an edge center do not decide binary
rank or finite-center entropy, affine calibration is exact precisely under full
support of the calibrated vertices, central area shifts preserve total entropy,
and a formed area coefficient descends exactly when it is constant on data
fibers. -/
theorem refereeOAQECJLMSAreaObstructionCore {m : Nat}
    (mask : Fin m -> Bool) (area algebraic shift : Int) :
    (¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity ∧
    ¬ factorsThrough blindEntropyObservation
      finiteCentralEntropyCoefficient) ∧
    (((∀ values values' : centralAffineVertexValues (m := m),
      sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (¬ supportFull mask ->
      ∃ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' ∧ values ≠ values')) ∧
    ((area + shift) + (algebraic - shift) = area + algebraic) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y) := by
  exact ⟨exactRecoveryBlindEdgeCenterNoGoCore,
    affineCalibrationSharpExitCore mask,
    centralAreaOperatorShiftPreservesEntropyCore area algebraic shift,
    (fun observe coefficient =>
      areaCoefficientDescentCriterionCore observe coefficient)⟩

/-- Machine-checked finite skeleton of generated-algebra tomography for tensor
factorization: diagonal/generated-algebra data reconstruct the candidate finite
tensor product exactly when diagonal multiplication is injective; every finite
center with at least two atoms has a nonzero off-diagonal kernel witness. -/
theorem generatedAlgebraTomographyTensorExitCore (n : Nat) :
    (Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat)) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) ∧
    (∃ x : Fin (n + 2) × Fin (n + 2) -> Nat,
      x ≠ (fun _ => 0) ∧
      diagonalRestrict x = fun _ => 0) := by
  let x := tensorAtom (0 : Fin (n + 2)) (1 : Fin (n + 2))
  have h01 : (0 : Fin (n + 2)) ≠ (1 : Fin (n + 2)) := by
    intro h
    have hv := congrArg Fin.val h
    simp at hv
  have hone :
      Function.Injective
        (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat) := by
    rw [diagonalRestrict_injective_iff_no_distinct_atoms]
    intro i j hij
    exact hij (Subsingleton.elim i j)
  refine ⟨hone,
    diagonalRestrict_not_injective_two_atoms n, ?_⟩
  exact ⟨x, tensorAtom_not_zero_function (0 : Fin (n + 2)) (1 : Fin (n + 2)),
    diagonalRestrict_tensorAtom_distinct_zero h01⟩

/-- Machine-checked finite core of the statement that generated-algebra
tomography has the same fibers as tensor-product tomography exactly when
diagonal multiplication is injective.  Full tensor tomography is modeled by
equality of tensor-product functions. -/
theorem generatedVsTensorTomographyFibersIffCore {m : Nat} :
    (∀ x y : Fin m × Fin m -> Nat,
      diagonalRestrict x = diagonalRestrict y ↔ x = y) <->
    Function.Injective
      (diagonalRestrict : (Fin m × Fin m -> Nat) -> Fin m -> Nat) := by
  constructor
  · intro h x y hdiag
    exact (h x y).mp hdiag
  · intro hinj x y
    constructor
    · intro hdiag
      exact hinj hdiag
    · intro hxy
      rw [hxy]

/-- Finite core of the product-state tomography distinction: the off-diagonal
tensor atom is killed by diagonal/generated-algebra data, but the corresponding
product-coordinate functional evaluates it as `1`. -/
theorem productCoordinateSeesOffDiagonalKernelCore (n : Nat) :
    diagonalRestrict
        (tensorAtom (0 : Fin (n + 2)) (1 : Fin (n + 2))) = (fun _ => 0) ∧
      tensorAtom (0 : Fin (n + 2)) (1 : Fin (n + 2))
        ((0 : Fin (n + 2)), (1 : Fin (n + 2))) = 1 ∧
      Not (tensorAtom (0 : Fin (n + 2)) (1 : Fin (n + 2)) =
        (fun _ => 0)) := by
  have h01 : (0 : Fin (n + 2)) ≠ (1 : Fin (n + 2)) := by
    intro h
    have hv := congrArg Fin.val h
    simp at hv
  exact ⟨diagonalRestrict_tensorAtom_distinct_zero h01,
    tensorAtom_self (0 : Fin (n + 2)) (1 : Fin (n + 2)),
    tensorAtom_not_zero_function (0 : Fin (n + 2)) (1 : Fin (n + 2))⟩

/-- Diagonal restriction is injective on a one-atom finite center. -/
theorem diagonalRestrict_injective_one_atom :
    Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat) := by
  rw [diagonalRestrict_injective_iff_no_distinct_atoms]
  intro i j hij
  exact hij (Subsingleton.elim i j)

/-- A calibration mask that fixes only the first vertex of a two-atom affine
central entropy/area representative. -/
def oneVertexCalibrationMask2 : Fin 2 -> Bool :=
  fun i => decide (i = 0)

theorem oneVertexCalibrationMask2_calibrates_first :
    oneVertexCalibrationMask2 0 = true := by
  simp [oneVertexCalibrationMask2]

theorem oneVertexCalibrationMask2_not_supportFull :
    ¬ supportFull oneVertexCalibrationMask2 := by
  intro hfull
  have h1 := hfull 1
  simp [oneVertexCalibrationMask2] at h1

/-- With no state/effect readouts, the two-atom finite center is not support
faithful. -/
def emptyReadoutSupports2 : PEmpty -> Fin 2 -> Bool :=
  fun e => nomatch e

theorem emptyReadoutSupports2_not_faithful :
    ¬ familyRepresentedCenterFaithful emptyReadoutSupports2 := by
  rw [familyRepresentedCenterFaithful_iff_familyCoversAtoms]
  intro hcover
  rcases hcover 0 with ⟨b, _hb⟩
  cases b

/-- Machine-checked finite skeleton of the independence theorem for the
reconstruction exits.  It packages four finite witnesses:

* faithful positive readout need not imply atom separation;
* atom separation need not imply tensor-product injectivity for a shared center;
* tensor injectivity in a trivial one-atom split case need not provide affine
  entropy/area calibration on another finite center;
* a nonempty one-vertex affine calibration can coexist with absent support
  faithfulness and absent atom separation. -/
theorem reconstructionExitsIndependenceCore :
    ((∀ x : Fin 2 -> Int,
        positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
      ¬ Function.Injective sumReadout2) ∧
    (Function.Injective coordinateReadout2Nat ∧
      ¬ Function.Injective
        (diagonalRestrict : (Fin 2 × Fin 2 -> Nat) -> Fin 2 -> Nat)) ∧
    (Function.Injective
        (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat) ∧
      ∃ mask : Fin 2 -> Bool,
        ¬ supportFull mask ∧
        ∃ values values' : centralAffineVertexValues (m := 2),
          sameMaskedAffineCalibration mask values values' ∧ values ≠ values') ∧
    (oneVertexCalibrationMask2 0 = true ∧
      ¬ supportFull oneVertexCalibrationMask2 ∧
      (∃ values values' : centralAffineVertexValues (m := 2),
        sameMaskedAffineCalibration oneVertexCalibrationMask2 values values' ∧
          values ≠ values') ∧
      ¬ familyRepresentedCenterFaithful emptyReadoutSupports2 ∧
      ¬ Function.Injective sumReadout2) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact ⟨(fun x hpos hzero =>
      sumReadout2_faithful_on_positive_cone hpos hzero),
      sumReadout2_not_injective⟩
  · exact ⟨coordinateReadout2Nat_injective,
      diagonalRestrict_not_injective_two_atoms 0⟩
  · refine ⟨diagonalRestrict_injective_one_atom, ?_⟩
    exact ⟨oneVertexCalibrationMask2,
      oneVertexCalibrationMask2_not_supportFull,
      not_supportFull_maskedAffineCalibration_counterexample
        oneVertexCalibrationMask2 oneVertexCalibrationMask2_not_supportFull⟩
  · exact ⟨oneVertexCalibrationMask2_calibrates_first,
      oneVertexCalibrationMask2_not_supportFull,
      not_supportFull_maskedAffineCalibration_counterexample
        oneVertexCalibrationMask2 oneVertexCalibrationMask2_not_supportFull,
      emptyReadoutSupports2_not_faithful,
      sumReadout2_not_injective⟩

/-- Machine-checked finite core of the independence of the JLMS affine
calibration exit from the Type II trace-calibration exit.  On a two-atom
center, full affine vertex calibration can coexist with diagonal trace
calibration that cannot distinguish the `(1,3)` and `(2,2)` trace weights; and
full atomic trace calibration can coexist with a one-vertex affine calibration
that leaves a nonzero affine representative ambiguity. -/
theorem affineAreaTypeIITraceCalibrationIndependenceCore :
    ((∀ values values' : centralAffineVertexValues (m := 2),
      sameMaskedAffineCalibration (fun _ : Fin 2 => true) values values' ->
        values = values') ∧
      totalWeight2 traceWeights13 = totalWeight2 traceWeights22 ∧
      traceWeightProduct2 traceWeights13 ≠ traceWeightProduct2 traceWeights22) ∧
    ((∀ weights weights' : Fin 2 -> Nat,
      sameMaskedTraceCalibration (fun _ : Fin 2 => true) weights weights' ->
        weights = weights') ∧
      ¬ supportFull oneVertexCalibrationMask2 ∧
      ∃ values values' : centralAffineVertexValues (m := 2),
        sameMaskedAffineCalibration oneVertexCalibrationMask2 values values' ∧
          values ≠ values') := by
  exact ⟨
    ⟨(maskedAffineCalibration_reconstruct_iff_supportFull
      (m := 2) (fun _ : Fin 2 => true)).mpr (by
        intro i
        rfl),
      traceWeights13_total_eq_traceWeights22_total,
      traceWeights13_product_ne_traceWeights22_product⟩,
    ⟨(maskedTraceCalibration_reconstruct_iff_supportFull
      (m := 2) (fun _ : Fin 2 => true)).mpr (by
        intro i
        rfl),
      oneVertexCalibrationMask2_not_supportFull,
      not_supportFull_maskedAffineCalibration_counterexample
        oneVertexCalibrationMask2 oneVertexCalibrationMask2_not_supportFull⟩⟩

/-- Referee-form finite core of the irredundancy statement: the old
reconstruction-exit independence witnesses, the OAQEC edge-center witness, and
the Bekenstein-Hawking coefficient witness are all simultaneously available.
Thus recovery data and product-visible area data do not replace the missing
central, affine, or entropy-density exits. -/
theorem refereeReconstructionExitIrredundancyCore :
    (((∀ x : Fin 2 -> Int,
        positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
      ¬ Function.Injective sumReadout2) ∧
    (Function.Injective coordinateReadout2Nat ∧
      ¬ Function.Injective
        (diagonalRestrict : (Fin 2 × Fin 2 -> Nat) -> Fin 2 -> Nat)) ∧
    (Function.Injective
        (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat) ∧
      ∃ mask : Fin 2 -> Bool,
        ¬ supportFull mask ∧
        ∃ values values' : centralAffineVertexValues (m := 2),
          sameMaskedAffineCalibration mask values values' ∧ values ≠ values') ∧
    (oneVertexCalibrationMask2 0 = true ∧
      ¬ supportFull oneVertexCalibrationMask2 ∧
      (∃ values values' : centralAffineVertexValues (m := 2),
        sameMaskedAffineCalibration oneVertexCalibrationMask2 values values' ∧
          values ≠ values') ∧
      ¬ familyRepresentedCenterFaithful emptyReadoutSupports2 ∧
      ¬ Function.Injective sumReadout2)) ∧
    (¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity ∧
    ¬ factorsThrough blindEntropyObservation
      finiteCentralEntropyCoefficient) ∧
    (¬ factorsThrough areaScaleProductNat areaScaleCoefficientNat ∧
    ¬ factorsThrough entropyNewtonBlindData inferredNewtonDenominatorNat) := by
  exact ⟨reconstructionExitsIndependenceCore,
    exactRecoveryBlindEdgeCenterNoGoCore,
    ⟨bekensteinHawkingCoefficientIdentifiabilityCore.1,
      bekensteinHawkingCoefficientIdentifiabilityCore.2.1⟩⟩

/-- A toy encoding of a matrix over a finite abelian algebra by the positivity
status of each atomic block.  This avoids formalizing matrices while preserving
the direct-sum logic used by the manuscript. -/
def blockwiseMatrixPositive {m : Nat} (blockPositive : Fin m -> Bool) : Prop :=
  ∀ i, blockPositive i = true

/-- Complete positivity in a finite abelian direct sum is blockwise positivity.
This is the finite Boolean skeleton of `M_k(C^n)_+ = direct_sum_i M_k(C)_+`. -/
theorem finiteAbelian_completePositivity_blockwise {m : Nat}
    (blockPositive : Fin m -> Bool) :
    blockwiseMatrixPositive blockPositive <-> ∀ i, blockPositive i = true := by
  rfl

/-- A missing nonpositive atomic block prevents complete positivity. -/
theorem missing_block_not_completePositive {m : Nat}
    (blockPositive : Fin m -> Bool) :
    (∃ i, blockPositive i = false) ->
      ¬ blockwiseMatrixPositive blockPositive := by
  intro hmissing hpos
  rcases hmissing with ⟨i, hi⟩
  rw [hpos i] at hi
  cases hi

/-- A finite-classical channel table: the entry `(i,j)` is the `j`th output
coordinate produced by the `i`th atomic input.  This is only the finite
coordinate table, not a formalization of stochastic or completely positive
maps. -/
def finiteClassicalChannelTable (m : Nat) : Type :=
  Fin m -> Fin m -> Nat

/-- The atomic input/output process datum of a finite-classical channel table. -/
def finiteClassicalProcessDatum {m : Nat}
    (channel : finiteClassicalChannelTable m) (input output : Fin m) : Nat :=
  channel input output

/-- Complete atomic input/output process data determine the finite-classical
channel table.  This is the finite coordinate skeleton of input-output
separation in process tomography. -/
theorem finiteClassicalChannelTable_ext_of_processData {m : Nat}
    {channel channel' : finiteClassicalChannelTable m}
    (h :
      ∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) :
    channel = channel' := by
  funext input output
  exact h input output

/-- The scalar unit in a two-summand finite center. -/
def centralUnit2 : Fin 2 -> Nat :=
  fun _ => 1

/-- The first atomic central input. -/
def centralAtom0 : Fin 2 -> Nat :=
  fun i => if i = 0 then 1 else 0

/-- Identity central dynamics on a two-summand finite center. -/
def centralChannelId2 (x : Fin 2 -> Nat) : Fin 2 -> Nat :=
  x

/-- Swapped central dynamics on a two-summand finite center. -/
def centralChannelSwap2 (x : Fin 2 -> Nat) : Fin 2 -> Nat :=
  fun i => if i = 0 then x 1 else x 0

/-- Identity and swap dynamics agree on the scalar unit. -/
theorem centralChannelId2_swap2_agree_on_unit :
    centralChannelId2 centralUnit2 = centralChannelSwap2 centralUnit2 := by
  funext i
  by_cases h : i = 0
  · simp [centralChannelId2, centralChannelSwap2, centralUnit2, h]
  · simp [centralChannelId2, centralChannelSwap2, centralUnit2, h]

/-- Identity and swap dynamics differ on an atomic central input. -/
theorem centralChannelId2_swap2_differ_on_atom0 :
    centralChannelId2 centralAtom0 ≠ centralChannelSwap2 centralAtom0 := by
  intro h
  have h0 := congrArg (fun f : Fin 2 -> Nat => f 0) h
  simp [centralChannelId2, centralChannelSwap2, centralAtom0] at h0

/-- Scalar-unit process data do not identify central dynamics. -/
theorem centralUnitProcessData_do_not_identify_central_channel :
    ∃ D1 D2 : (Fin 2 -> Nat) -> (Fin 2 -> Nat),
      D1 centralUnit2 = D2 centralUnit2 ∧
      D1 centralAtom0 ≠ D2 centralAtom0 := by
  exact ⟨centralChannelId2, centralChannelSwap2,
    centralChannelId2_swap2_agree_on_unit,
    centralChannelId2_swap2_differ_on_atom0⟩

/-- Machine-checked finite skeleton of complete finite-central process
tomography: all atomic input/output entries determine the channel table, while
scalar-unit process data do not identify central dynamics. -/
theorem completeFiniteCentralProcessTomographyExitCore :
    (∀ {m : Nat} {channel channel' : finiteClassicalChannelTable m},
      (∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) ->
        channel = channel') ∧
    (∃ D1 D2 : (Fin 2 -> Nat) -> (Fin 2 -> Nat),
      D1 centralUnit2 = D2 centralUnit2 ∧
      D1 centralAtom0 ≠ D2 centralAtom0) := by
  exact ⟨fun h => finiteClassicalChannelTable_ext_of_processData h,
    centralUnitProcessData_do_not_identify_central_channel⟩

/-- Referee-form finite process tomography core: full atomic input/output data
determine a finite-classical channel table, but scalar-input data alone do not
determine central dynamics, as witnessed by identity and atom-swap dynamics on
a two-atom center. -/
theorem refereeProcessTomographyFiberCore :
    (∀ {m : Nat} {channel channel' : finiteClassicalChannelTable m},
      (∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) ->
        channel = channel') ∧
    (∃ D1 D2 : (Fin 2 -> Nat) -> (Fin 2 -> Nat),
      D1 centralUnit2 = D2 centralUnit2 ∧
      D1 centralAtom0 ≠ D2 centralAtom0) := by
  exact completeFiniteCentralProcessTomographyExitCore

/-- Named finite skeleton of incomplete central process tomography: scalar-unit
process data leave a same-data pair of central dynamics, represented here by
identity and atom-swap dynamics on a two-atom center. -/
theorem incompleteCentralProcessTomographyFiberCore :
    ∃ D1 D2 : (Fin 2 -> Nat) -> (Fin 2 -> Nat),
      D1 centralUnit2 = D2 centralUnit2 ∧
      D1 centralAtom0 ≠ D2 centralAtom0 := by
  exact centralUnitProcessData_do_not_identify_central_channel

/-- The left point-mass central law on a two-summand finite center. -/
def centralLawLeft2 : Fin 2 -> Nat :=
  fun i => if i = 0 then 1 else 0

/-- The right point-mass central law on a two-summand finite center. -/
def centralLawRight2 : Fin 2 -> Nat :=
  fun i => if i = 0 then 0 else 1

/-- A scalar induced observable on a two-summand finite center. -/
def scalarInducedObservable2 (a : Nat) : Fin 2 -> Nat :=
  fun _ => a

/-- The finite central probe datum after applying the noncentral state. -/
def centralProbeDatum2 (p e : Fin 2 -> Nat) : Nat :=
  p 0 * e 0 + p 1 * e 1

/-- The two central laws are distinct. -/
theorem centralLawLeft2_ne_right2 :
    centralLawLeft2 ≠ centralLawRight2 := by
  intro h
  have h0 := congrArg (fun f : Fin 2 -> Nat => f 0) h
  simp [centralLawLeft2, centralLawRight2] at h0

/-- Scalar induced observables give the same datum for the two distinct central
laws. -/
theorem centralLawLeftRight_same_scalarProbeDatum (a : Nat) :
    centralProbeDatum2 centralLawLeft2 (scalarInducedObservable2 a) =
      centralProbeDatum2 centralLawRight2 (scalarInducedObservable2 a) := by
  simp [centralProbeDatum2, centralLawLeft2, centralLawRight2,
    scalarInducedObservable2]

/-- Scalar probe data do not identify the central law. -/
theorem scalarProbeData_do_not_identify_central_law :
    ∃ p q : Fin 2 -> Nat,
      p ≠ q ∧
      ∀ a : Nat,
        centralProbeDatum2 p (scalarInducedObservable2 a) =
          centralProbeDatum2 q (scalarInducedObservable2 a) := by
  exact ⟨centralLawLeft2, centralLawRight2, centralLawLeft2_ne_right2,
    centralLawLeftRight_same_scalarProbeDatum⟩

/-- The left central-sector label in a two-summand direct sum, modeled by
multiplicity one in the first summand and zero in the second. -/
def sectorLeft2 : Fin 2 -> Nat :=
  centralLawLeft2

/-- The right central-sector label in a two-summand direct sum, modeled by
multiplicity zero in the first summand and one in the second. -/
def sectorRight2 : Fin 2 -> Nat :=
  centralLawRight2

/-- Diagonal restriction of a finite direct-sum sector records only the total
restricted multiplicity. -/
def restrictedSectorMultiplicity2 (sector : Fin 2 -> Nat) : Nat :=
  sector 0 + sector 1

/-- The two central-sector labels are distinct before restriction. -/
theorem sectorLeft2_ne_sectorRight2 :
    sectorLeft2 ≠ sectorRight2 := by
  exact centralLawLeft2_ne_right2

/-- The two central-sector labels have the same restricted multiplicity after
the diagonal direct-sum functor. -/
theorem sectorLeftRight_same_restrictedMultiplicity :
    restrictedSectorMultiplicity2 sectorLeft2 =
      restrictedSectorMultiplicity2 sectorRight2 := by
  simp [restrictedSectorMultiplicity2, sectorLeft2, sectorRight2,
    centralLawLeft2, centralLawRight2]

/-- Restricted diagonal sector data do not identify the central-sector
label. -/
theorem restrictedSectorMultiplicity_does_not_identify_central_label :
    ∃ p q : Fin 2 -> Nat,
      p ≠ q ∧ restrictedSectorMultiplicity2 p =
        restrictedSectorMultiplicity2 q := by
  exact ⟨sectorLeft2, sectorRight2, sectorLeft2_ne_sectorRight2,
    sectorLeftRight_same_restrictedMultiplicity⟩

/-- A point sector supported on one finite central summand. -/
def pointSector {m : Nat} (i : Fin m) : Fin m -> Nat :=
  atomOn i

theorem pointSector_self {m : Nat} (i : Fin m) :
    pointSector i i = 1 := by
  simp [pointSector, atomOn]

/-- Distinct point sectors have different full central-sector labels. -/
theorem pointSector_ne_of_ne {m : Nat} {i j : Fin m} (hij : i ≠ j) :
    pointSector i ≠ pointSector j := by
  intro h
  have hcoord := congrArg (fun f : Fin m -> Nat => f i) h
  simp [pointSector, atomOn, hij] at hcoord

/-- A restricted point-sector datum records the one-copy restricted
multiplicity and forgets the central summand where that copy lived. -/
def restrictedPointSectorMultiplicity {m : Nat} (_i : Fin m) : Nat :=
  1

/-- Distinct finite central point sectors can carry the same restricted
multiplicity datum. -/
theorem distinct_pointSectors_same_restrictedMultiplicity {m : Nat}
    {i j : Fin m} (hij : i ≠ j) :
    pointSector i ≠ pointSector j ∧
      restrictedPointSectorMultiplicity i =
        restrictedPointSectorMultiplicity j := by
  exact ⟨pointSector_ne_of_ne hij, rfl⟩

/-- If restricted sector data only remember the one-copy multiplicity, the full
central point-sector label is not reconstructed. -/
theorem pointSector_not_factorsThrough_restrictedPointMultiplicity
    {m : Nat} {i j : Fin m} (hij : i ≠ j) :
    ¬ factorsThrough
      (fun k : Fin m => restrictedPointSectorMultiplicity k)
      (fun k : Fin m => pointSector k) := by
  exact not_factorsThrough_of_fiber_counterexample
    (fun k : Fin m => restrictedPointSectorMultiplicity k)
    (fun k : Fin m => pointSector k)
    (x := i) (y := j) rfl (pointSector_ne_of_ne hij)

/-- Exact repair criterion for central point-sector labels: restricted
one-copy multiplicity plus an added datum reconstructs the full atomic central
sector label exactly when the added datum separates every pair of central
atoms. -/
theorem pointSector_augmented_iff_exit_separates_all_labels
    {m : Nat} {E : Type} (exit : Fin m -> E) :
    factorsThrough
        (fun k : Fin m => (restrictedPointSectorMultiplicity k, exit k))
        (fun k : Fin m => pointSector k) <->
      ∀ i j : Fin m, i ≠ j -> exit i ≠ exit j := by
  rw [factorsThrough_augmented_iff_exit_separates_changed_fibers]
  constructor
  · intro h i j hij
    exact h i j rfl (pointSector_ne_of_ne hij)
  · intro hsep i j _hobs hneq
    by_cases hij : i = j
    · subst j
      exact False.elim (hneq rfl)
    · exact hsep i j hij

/-- Named finite skeleton of the sharp sector-character exit: restricted
diagonal sector data plus an added central-character datum reconstructs the full
point-sector label exactly when the added datum separates all central
characters. -/
theorem centralCharacterSectorRetentionSharpExitCore
    {m : Nat} {E : Type} (exit : Fin m -> E) :
    factorsThrough
        (fun k : Fin m => (restrictedPointSectorMultiplicity k, exit k))
        (fun k : Fin m => pointSector k) <->
      ∀ i j : Fin m, i ≠ j -> exit i ≠ exit j := by
  exact pointSector_augmented_iff_exit_separates_all_labels exit

/-- Referee-form sector-character finite core: two distinct central point-sector
labels can have the same restricted sector datum, and an added datum repairs
the loss exactly when it separates all central point labels. -/
theorem refereeSectorCharacterRetentionCore {m : Nat} {i j : Fin m}
    (hij : i ≠ j) :
    (pointSector i ≠ pointSector j ∧
      restrictedPointSectorMultiplicity i =
        restrictedPointSectorMultiplicity j) ∧
    (∀ {E : Type} (exit : Fin m -> E),
      factorsThrough
          (fun k : Fin m => (restrictedPointSectorMultiplicity k, exit k))
          (fun k : Fin m => pointSector k) <->
        ∀ a b : Fin m, a ≠ b -> exit a ≠ exit b) := by
  exact ⟨distinct_pointSectors_same_restrictedMultiplicity hij,
    fun exit => centralCharacterSectorRetentionSharpExitCore exit⟩

/-- Named finite core of the restricted-sector cardinality boundary: data that have
forgotten the finite central cardinality do not decide whether the hidden
finite center has exactly two atoms. -/
theorem restrictedSectorDataDoesNotDecideBinaryRankCore :
    ¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity := by
  exact isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation

/-- Machine-checked finite skeleton of Theorem
`No universal reconstruction without finite-central exits` in the short
manuscript.  The theorem deliberately remains at the finite/logical level: it
packages the same-data counterexamples and the exact finite exits after the
standard operator-algebraic reductions have produced a finite central
comparison problem. -/
theorem noUniversalReconstructionWithoutFiniteCentralExitsCore
    {β : Type} {m : Nat}
    (supports : β -> Fin m -> Bool) (mask : Fin m -> Bool) (n : Nat)
    (hmiss : ¬ familyCoversAtoms supports) :
    (¬ factorsThrough includedSubalgebraDatum
      includedSubalgebraFullInvariant) ∧
    (¬ factorsThrough allCentralSummandsDesiredType
      fullAlgebraFactorValued) ∧
    (¬ propertyFactorsThrough blindSupportObservation
      candidateHasFullSupport) ∧
    (∃ i,
      sameSupportedRepresentation (familySupport supports) (atomOn i)
        (fun _ => 0) ∧
        Not (atomOn i = fun _ => 0)) ∧
    (¬ reconstructsOn allMultiplicityCandidates
      blindMultiplicityObservation finiteCentralMultiplicity) ∧
    (¬ propertyReconstructsOn allMultiplicityCandidates
      blindMultiplicityObservation isBinaryMultiplicity) ∧
    (¬ factorsThrough blindEntropyObservation
      finiteCentralEntropyCoefficient) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) ∧
    (∃ D1 D2 : (Fin 2 -> Nat) -> (Fin 2 -> Nat),
      D1 centralUnit2 = D2 centralUnit2 ∧
      D1 centralAtom0 ≠ D2 centralAtom0) ∧
    (∀ {k : Nat} {channel channel' : finiteClassicalChannelTable k},
      (∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) ->
        channel = channel') ∧
    (∃ p q : Fin 2 -> Nat,
      p ≠ q ∧ restrictedSectorMultiplicity2 p =
        restrictedSectorMultiplicity2 q) ∧
    ((∀ x : Fin m -> Int,
        testedByCoordinateMask mask x <-> signedPositive x) <->
      supportFull mask) ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) := by
  exact ⟨includedSubalgebraFullInvariant_not_factorsThrough,
    desiredSummandType_not_factorsThrough_factorValued,
    supportFull_not_propertyFactorsThrough_blindObservation,
    not_familyCoversAtoms_gives_family_invisible_nonzero_atom supports hmiss,
    finiteCentralMultiplicity_not_reconstructsOn_allCandidates,
    isBinaryMultiplicity_not_propertyReconstructsOn_allCandidates,
    entropyCoefficient_not_factorsThrough_blindObservation,
    diagonalRestrict_not_injective_two_atoms n,
    centralUnitProcessData_do_not_identify_central_channel,
    fun h => finiteClassicalChannelTable_ext_of_processData h,
    restrictedSectorMultiplicity_does_not_identify_central_label,
    coordinateTests_reconstruct_positive_iff_supportFull mask,
    maskedTraceCalibration_reconstruct_iff_supportFull mask,
    maskedAffineCalibration_reconstruct_iff_supportFull mask⟩

/-- Machine-checked finite skeleton of the manuscript's complete positive
reconstruction package.  It collects the finite exits that make the retained
targets descend: atomic central support readouts, coordinate separation, split
one-atom tensor injectivity, complete process tomography, sector-label
separation, trace calibration, affine calibration, and the abstract
area-coefficient fiber criterion. -/
theorem completePositiveReconstructionPackageCore {m : Nat}
    (mask : Fin m -> Bool) :
    familyRepresentedCenterFaithful (fullAtomicSupportFamily (m := m)) ∧
    Function.Injective coordinateReadout2Nat ∧
    Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat) ∧
    (∀ {k : Nat} {channel channel' : finiteClassicalChannelTable k},
      (∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) ->
        channel = channel') ∧
    (∀ {k : Nat} {E : Type} (exit : Fin k -> E),
      (∀ i j : Fin k, i ≠ j -> exit i ≠ exit j) ->
        factorsThrough
          (fun label : Fin k => (restrictedPointSectorMultiplicity label,
            exit label))
          (fun label : Fin k => pointSector label)) ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y) := by
  exact ⟨fullAtomicSupportFamily_faithful,
    coordinateReadout2Nat_injective,
    diagonalRestrict_injective_one_atom,
    (fun h => finiteClassicalChannelTable_ext_of_processData h),
    (fun exit hsep =>
      (pointSector_augmented_iff_exit_separates_all_labels exit).mpr hsep),
    maskedTraceCalibration_reconstruct_iff_supportFull mask,
    maskedAffineCalibration_reconstruct_iff_supportFull mask,
    (fun observe coefficient =>
      areaCoefficientDescentCriterionCore observe coefficient)⟩

/-- Machine-checked finite/logical skeleton of the front theorem
`Main theorem, referee form`.  The operator-algebraic hypotheses of the
manuscript are responsible for producing the same-data finite-central comparison
pair or for excluding it.  Once such a pair is supplied, Lean checks the precise
logical content: the retained target descends exactly when it is constant on
labelled-data fibers, the same-data pair kills reconstruction on the hypothesis
class, and the finite positive package records the support/readout, tensor,
process, sector, trace, affine, and coefficient exits. -/
theorem mainRefereeFormCore
    {X D Y : Type} {m : Nat}
    (hypothesis : X -> Prop) (observe : X -> D) (target : X -> Y)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : observe x = observe y) (hneq : target x ≠ target y)
    (mask : Fin m -> Bool) :
    (factorsThrough observe target <->
      ∀ x y, observe x = observe y -> target x = target y) ∧
    (¬ reconstructsOn hypothesis observe target) ∧
    (familyRepresentedCenterFaithful (fullAtomicSupportFamily (m := m)) ∧
    Function.Injective coordinateReadout2Nat ∧
    Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat) ∧
    (∀ {k : Nat} {channel channel' : finiteClassicalChannelTable k},
      (∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) ->
        channel = channel') ∧
    (∀ {k : Nat} {E : Type} (exit : Fin k -> E),
      (∀ i j : Fin k, i ≠ j -> exit i ≠ exit j) ->
        factorsThrough
          (fun label : Fin k => (restrictedPointSectorMultiplicity label,
            exit label))
          (fun label : Fin k => pointSector label)) ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y)) := by
  rcases operationalReconstructionCriterionCore hypothesis observe target
      hhx hhy hxy hneq with ⟨hno, hfiber⟩
  exact ⟨hfiber, hno, completePositiveReconstructionPackageCore mask⟩

/-- Machine-checked finite/logical skeleton of the manuscript
theorem `Main finite-central descent classification`.  It deliberately proves
only the finite descent core after the operator-algebraic reductions have
produced finite centers and labelled data fibers:

* an abstract same-data pair with different target value kills reconstruction
  and reconstruction is equivalent to constancy on operational fibers;
* blind or quotient/retraction-factored finite data have same-data witnesses
  for support, factor-valuedness, the two-atom predicate, tensor kernels, process
  dynamics, sector labels, and entropy coefficients;
* the corresponding finite positive exits reconstruct exactly by central
  support/readout coverage, coordinate separation, one-atom tensor
  injectivity, complete process tables, sector-label separation, trace
  calibration, affine calibration, and coefficient fiber descent. -/
theorem mainFiniteCentralDescentClassificationCore
    {X D Y β : Type} {m : Nat}
    (hypothesis : X -> Prop) (observe : X -> D) (invariant : X -> Y)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : observe x = observe y) (hneq : invariant x ≠ invariant y)
    (supports : β -> Fin m -> Bool) (mask : Fin m -> Bool) (n : Nat)
    (hmiss : ¬ familyCoversAtoms supports) :
    ((¬ reconstructsOn hypothesis observe invariant) ∧
      (factorsThrough observe invariant <->
        ∀ x y, observe x = observe y -> invariant x = invariant y)) ∧
    ((¬ factorsThrough includedSubalgebraDatum
      includedSubalgebraFullInvariant) ∧
    (¬ factorsThrough allCentralSummandsDesiredType
      fullAlgebraFactorValued) ∧
    (¬ propertyFactorsThrough blindSupportObservation
      candidateHasFullSupport) ∧
    (∃ i,
      sameSupportedRepresentation (familySupport supports) (atomOn i)
        (fun _ => 0) ∧
        Not (atomOn i = fun _ => 0)) ∧
    (¬ reconstructsOn allMultiplicityCandidates
      blindMultiplicityObservation finiteCentralMultiplicity) ∧
    (¬ propertyReconstructsOn allMultiplicityCandidates
      blindMultiplicityObservation isBinaryMultiplicity) ∧
    (¬ factorsThrough blindEntropyObservation
      finiteCentralEntropyCoefficient) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) ∧
    (∃ D1 D2 : (Fin 2 -> Nat) -> (Fin 2 -> Nat),
      D1 centralUnit2 = D2 centralUnit2 ∧
      D1 centralAtom0 ≠ D2 centralAtom0) ∧
    (∀ {k : Nat} {channel channel' : finiteClassicalChannelTable k},
      (∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) ->
        channel = channel') ∧
    (∃ p q : Fin 2 -> Nat,
      p ≠ q ∧ restrictedSectorMultiplicity2 p =
        restrictedSectorMultiplicity2 q) ∧
    ((∀ x : Fin m -> Int,
        testedByCoordinateMask mask x <-> signedPositive x) <->
      supportFull mask) ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask)) ∧
    (familyRepresentedCenterFaithful (fullAtomicSupportFamily (m := m)) ∧
    Function.Injective coordinateReadout2Nat ∧
    Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat) ∧
    (∀ {k : Nat} {channel channel' : finiteClassicalChannelTable k},
      (∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) ->
        channel = channel') ∧
    (∀ {k : Nat} {E : Type} (exit : Fin k -> E),
      (∀ i j : Fin k, i ≠ j -> exit i ≠ exit j) ->
        factorsThrough
          (fun label : Fin k => (restrictedPointSectorMultiplicity label,
            exit label))
          (fun label : Fin k => pointSector label)) ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y)) := by
  exact ⟨operationalReconstructionCriterionCore hypothesis observe invariant
      hhx hhy hxy hneq,
    noUniversalReconstructionWithoutFiniteCentralExitsCore supports mask n
      hmiss,
    completePositiveReconstructionPackageCore mask⟩

/-- Machine-checked finite wrapper for the manuscript theorem
`finite-center-operational-completeness`: central atom labels descend exactly
under injective readout, central support exactly under family coverage, complete
finite-classical process data determine the channel table, finite trace and
affine area calibrations are exact under full support of the tested mask, and
diagonal tensor data are faithful exactly when the finite center has no
distinct atoms. -/
theorem finiteCenterOperationalCompletenessCore
    {A D β : Type} {m : Nat}
    (obs : A -> D) (supports : β -> Fin m -> Bool)
    (mask : Fin m -> Bool) (n : Nat) :
    (Function.Injective obs <-> ∀ a b, obs a = obs b -> a = b) ∧
    (familyRepresentedCenterFaithful supports <->
      familyCoversAtoms supports) ∧
    Function.Injective coordinateReadout2Nat ∧
    (∀ {k : Nat} {channel channel' : finiteClassicalChannelTable k},
      (∀ input output,
        finiteClassicalProcessDatum channel input output =
          finiteClassicalProcessDatum channel' input output) ->
        channel = channel') ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (Function.Injective
      (diagonalRestrict : (Fin m × Fin m -> Nat) -> Fin m -> Nat) <->
      ∀ i j : Fin m, i ≠ j -> False) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) := by
  exact ⟨atomReadout_reconstructs_labels_iff_injective obs,
    familyRepresentedCenterFaithful_iff_familyCoversAtoms supports,
    coordinateReadout2Nat_injective,
    (fun h => finiteClassicalChannelTable_ext_of_processData h),
    maskedTraceCalibration_reconstruct_iff_supportFull mask,
    maskedAffineCalibration_reconstruct_iff_supportFull mask,
    diagonalRestrict_injective_iff_no_distinct_atoms,
    diagonalRestrict_not_injective_two_atoms n⟩

/-- Character-state seminorm square at the first atom. -/
def charNormSq {n : Nat} (f : Fin (n + 1) -> Nat) : Nat :=
  f 0 * f 0

/-- The finite character-null condition. -/
def charNull {n : Nat} (f : Fin (n + 1) -> Nat) : Prop :=
  charNormSq f = 0

/-- The represented value after quotienting by the character-null kernel. -/
def representedValue {n : Nat} (f : Fin (n + 1) -> Nat) : Nat :=
  f 0

/-- Two finite functions have the same represented value iff they agree on the
support of the character. -/
def sameRepresentation {n : Nat}
    (f g : Fin (n + 1) -> Nat) : Prop :=
  representedValue f = representedValue g

/-- The character-null functions are exactly those vanishing on the support. -/
theorem charNull_iff_vanish_zero {n : Nat} (f : Fin (n + 1) -> Nat) :
    charNull f <-> f 0 = 0 := by
  constructor
  · intro h
    cases h0 : f 0 with
    | zero => rfl
    | succ k =>
        simp [charNull, charNormSq, h0] at h
  · intro h
    simp [charNull, charNormSq, h]

theorem sameRepresentation_iff_agree_zero {n : Nat}
    (f g : Fin (n + 1) -> Nat) :
    sameRepresentation f g <-> f 0 = g 0 := by
  rfl

theorem sameRepresentation_refl {n : Nat} (f : Fin (n + 1) -> Nat) :
    sameRepresentation f f := by
  rfl

theorem sameRepresentation_symm {n : Nat}
    {f g : Fin (n + 1) -> Nat} :
    sameRepresentation f g -> sameRepresentation g f := by
  intro h
  exact h.symm

theorem sameRepresentation_trans {n : Nat}
    {f g h : Fin (n + 1) -> Nat} :
    sameRepresentation f g ->
    sameRepresentation g h ->
    sameRepresentation f h := by
  intro hfg hgh
  exact hfg.trans hgh

theorem sameRepresentation_zero_iff_charNull {n : Nat}
    (f : Fin (n + 1) -> Nat) :
    sameRepresentation f (fun _ => 0) <-> charNull f := by
  constructor
  · intro h
    rw [charNull_iff_vanish_zero]
    exact h
  · intro h
    rw [charNull_iff_vanish_zero] at h
    exact h

/-- Atomic idempotent of the finite abelian algebra, with Nat-valued entries. -/
def atom {n : Nat} (i : Fin (n + 1)) : Fin (n + 1) -> Nat :=
  atomOn i

theorem atom_self {n : Nat} (i : Fin (n + 1)) :
    atom i i = 1 := by
  simp [atom, atomOn]

/-- In an algebra with at least two atoms, the second atom is invisible to
the first character. -/
theorem off_atom_vanishes_at_zero (n : Nat) :
    atom (n := n + 1) (1 : Fin (n + 2)) (0 : Fin (n + 2)) = 0 := by
  simp [atom, atomOn]

/-- The same off-support atom is still nonzero in the full finite algebra. -/
theorem off_atom_nonzero_at_one (n : Nat) :
    atom (n := n + 1) (1 : Fin (n + 2)) (1 : Fin (n + 2)) = 1 := by
  simp [atom, atomOn]

/-- The off-support atom belongs to the character-null kernel. -/
theorem off_atom_is_char_null (n : Nat) :
    charNull (n := n + 1) (atom (n := n + 1) (1 : Fin (n + 2))) := by
  rw [charNull_iff_vanish_zero]
  exact off_atom_vanishes_at_zero n

/-- In the represented quotient, the off-support atom is identified with zero. -/
theorem off_atom_sameRepresentation_zero (n : Nat) :
    sameRepresentation
      (n := n + 1)
      (atom (n := n + 1) (1 : Fin (n + 2)))
      (fun _ => 0) := by
  rw [sameRepresentation_zero_iff_charNull]
  exact off_atom_is_char_null n

/-- But the off-support atom is not the zero function in the full algebra. -/
theorem off_atom_not_zero_function (n : Nat) :
    Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) := by
  intro h
  have h1 := congrArg (fun f => f (1 : Fin (n + 2))) h
  simp [atom, atomOn] at h1

/-- Machine-checked finite core of the quotient-visible support/readout no-go:
the represented quotient can identify a nonzero off-support atom with zero, and
blind finite-cardinality data reconstruct neither finite central cardinality nor
the old binary-vs-nonbinary predicate retained for compatibility. -/
theorem quotientVisibleSupportReadoutNoGoCore (n : Nat) :
    sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) ∧
      (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
      (¬ propertyFactorsThrough blindMultiplicityObservation
        isBinaryMultiplicity) := by
  exact ⟨off_atom_sameRepresentation_zero n, off_atom_not_zero_function n,
    finiteCentralMultiplicity_not_factorsThrough_blindObservation,
    isBinaryMultiplicity_not_propertyFactorsThrough_blindObservation⟩

/-- Standard-language wrapper for the quotient-visible support/readout no-go:
the represented quotient can identify a nonzero off-support atom with zero,
while blind finite-cardinality data reconstruct neither finite central
cardinality nor the property of having exactly two minimal central atoms. -/
theorem quotientVisibleSupportFiniteCardinalityNoGoCore (n : Nat) :
    sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) ∧
      (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
      (¬ propertyFactorsThrough blindMultiplicityObservation
        hasExactlyTwoCentralAtoms) := by
  exact ⟨off_atom_sameRepresentation_zero n, off_atom_not_zero_function n,
    finiteCentralMultiplicity_not_factorsThrough_blindObservation,
    hasExactlyTwoCentralAtoms_not_propertyFactorsThrough_blindObservation⟩

/-- Machine-checked finite skeleton of the front corollary `Universal
finite-central witnesses`: quotient-visible data do not reconstruct support,
finite central cardinality, or the two-atom condition; generated/diagonal tensor
data have a nonzero shared-center kernel in every nontrivial finite center; and
blind entropy data do not reconstruct either the finite-center entropy-density
coefficient or the inferred Newton denominator. -/
theorem universalFiniteCentralWitnessesCore (n : Nat) :
    (sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) ∧
      (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
      (¬ propertyFactorsThrough blindMultiplicityObservation
        hasExactlyTwoCentralAtoms)) ∧
    ((Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat)) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) ∧
    (∃ x : Fin (n + 2) × Fin (n + 2) -> Nat,
      x ≠ (fun _ => 0) ∧
      diagonalRestrict x = fun _ => 0)) ∧
    ((¬ factorsThrough entropyNewtonBlindData
      entropyNewtonCoefficientNat) ∧
    (¬ factorsThrough entropyNewtonBlindData
      inferredNewtonDenominatorNat)) := by
  exact ⟨quotientVisibleSupportFiniteCardinalityNoGoCore n,
    generatedAlgebraTomographyTensorExitCore n,
    entropyDensityResidualDoesNotReconstructNewtonCore⟩

/-- Machine-checked finite/logical core of the three introductory obstruction
theorems in the short manuscript: quotient-visible data do not reconstruct full
support, finite central cardinality, or the two-atom condition;
generated/diagonal algebra data reconstruct the finite tensor product exactly
only in the one-atom case and have a nonzero
kernel otherwise; and blind entropy-density data do not reconstruct either the
finite-center coefficient or the inferred Newton denominator.  The analytic
operator-algebraic hypotheses reducing the manuscript to this finite core are
supplied in the text, not formalized here. -/
theorem supportTensorEntropyObstructionsCore (n : Nat) :
    (sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) ∧
      (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
      (¬ propertyFactorsThrough blindMultiplicityObservation
        hasExactlyTwoCentralAtoms)) ∧
    ((Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat)) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) ∧
    (∃ x : Fin (n + 2) × Fin (n + 2) -> Nat,
      x ≠ (fun _ => 0) ∧
      diagonalRestrict x = fun _ => 0)) ∧
    ((¬ factorsThrough entropyNewtonBlindData
      entropyNewtonCoefficientNat) ∧
    (¬ factorsThrough entropyNewtonBlindData
      inferredNewtonDenominatorNat)) := by
  exact universalFiniteCentralWitnessesCore n

/-- Machine-checked finite/logical core of the front corollary "Tensor
factorization and horizon coefficient from operational data": generated/
diagonal algebra data reconstruct the one-atom finite tensor product but have
a nonzero diagonal-kernel witness in every finite center with at least two
atoms, and blind entropy-density data do not reconstruct either the
finite-center coefficient or the inferred Newton denominator.  The analytic
operator-algebraic reductions to multiplication kernels and zero-density
entropy residuals are supplied by the manuscript. -/
theorem tensorHorizonCoefficientCore (n : Nat) :
    ((Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat)) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) ∧
    (∃ x : Fin (n + 2) × Fin (n + 2) -> Nat,
      x ≠ (fun _ => 0) ∧
      diagonalRestrict x = fun _ => 0)) ∧
    ((¬ factorsThrough entropyNewtonBlindData
      entropyNewtonCoefficientNat) ∧
    (¬ factorsThrough entropyNewtonBlindData
      inferredNewtonDenominatorNat)) := by
  exact ⟨generatedAlgebraTomographyTensorExitCore n,
    entropyDensityResidualDoesNotReconstructNewtonCore⟩

/-- Machine-checked finite/logical core of Corollary
`Operational consequence for emergent-spacetime reconstructions`.  After the
analytic reductions have produced a same-data pair for a full-algebra target,
the abstract reconstruction rule is impossible; the finite support, two-atom,
tensor-kernel, and entropy/Newton obstructions are the named introductory
witnesses; and the listed positive exits are exactly support faithfulness,
central readout, trace/affine calibration, and coefficient fiber descent. -/
theorem emergentSpacetimeReconstructionConsequenceCore
    {X D Y : Type}
    (hypothesis : X -> Prop) (observe : X -> D) (target : X -> Y)
    {x y : X}
    (hhx : hypothesis x) (hhy : hypothesis y)
    (hxy : observe x = observe y) (hneq : target x ≠ target y)
    {m : Nat} (mask : Fin m -> Bool) (n : Nat) :
    ((¬ reconstructsOn hypothesis observe target) ∧
      (factorsThrough observe target <->
        ∀ x y, observe x = observe y -> target x = target y)) ∧
    (¬ propertyFactorsThrough blindSupportObservation
      candidateHasFullSupport) ∧
    (¬ propertyReconstructsOn allMultiplicityCandidates
      blindMultiplicityObservation hasExactlyTwoCentralAtoms) ∧
    (((Function.Injective
      (diagonalRestrict : (Fin 1 × Fin 1 -> Nat) -> Fin 1 -> Nat)) ∧
    (¬ Function.Injective
      (diagonalRestrict : (Fin (n + 2) × Fin (n + 2) -> Nat) ->
        Fin (n + 2) -> Nat)) ∧
    (∃ z : Fin (n + 2) × Fin (n + 2) -> Nat,
      z ≠ (fun _ => 0) ∧ diagonalRestrict z = fun _ => 0)) ∧
    ((¬ factorsThrough entropyNewtonBlindData
      entropyNewtonCoefficientNat) ∧
      ¬ factorsThrough entropyNewtonBlindData
      inferredNewtonDenominatorNat)) ∧
    (familyRepresentedCenterFaithful (fullAtomicSupportFamily (m := m)) ∧
    Function.Injective coordinateReadout2Nat ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    ((∀ values values' : centralAffineVertexValues (m := m),
        sameMaskedAffineCalibration mask values values' -> values = values') <->
      supportFull mask) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y)) := by
  rcases tensorHorizonCoefficientCore n with ⟨htensor, hentropy⟩
  rcases completePositiveReconstructionPackageCore mask with
    ⟨hfaithful, hreadout, _htensorOne, _hprocess, _hsector, htrace, haffine,
      hcoeff⟩
  exact ⟨operationalReconstructionCriterionCore hypothesis observe target
      hhx hhy hxy hneq,
    supportFull_not_propertyFactorsThrough_blindObservation,
    hasExactlyTwoCentralAtoms_not_propertyReconstructsOn_allCandidates,
    ⟨htensor, hentropy⟩,
    hfaithful, hreadout, htrace, haffine, hcoeff⟩

/-- Referee-named finite core of the statement "quotient-zero is not ambient
zero": the off-support atom is zero after the character quotient and belongs to
the quotient-null kernel, but is not the zero element of the full finite
algebra. -/
theorem quotientZeroNotAmbientZeroCore (n : Nat) :
    sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      charNull (n := n + 1) (atom (n := n + 1) (1 : Fin (n + 2))) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) := by
  exact ⟨off_atom_sameRepresentation_zero n, off_atom_is_char_null n,
    off_atom_not_zero_function n⟩

/-- Named finite core of the represented-modular support reduction: after the
character quotient, an off-support central atom is already zero in the
represented algebra while it remains nonzero in the full finite algebra.  Any
represented modular or crossed-product datum built after that quotient is
therefore a datum of the supported quotient. -/
theorem representedModularDataSupportedCore (n : Nat) :
    sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) := by
  exact ⟨off_atom_sameRepresentation_zero n, off_atom_not_zero_function n⟩

/-- Named finite/logical core of the manuscript theorem "Central-support
quotients commute with modular crossed products": quotient/core data of the
represented summand have already killed an off-support atom, and blind core
data do not reconstruct either the discarded finite central cardinality or the
two-atom predicate.  The analytic crossed-product direct-sum statement is
proved in the manuscript. -/
theorem centralSupportQuotientCrossedProductCore (n : Nat) :
    sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) ∧
      (¬ factorsThrough blindMultiplicityObservation finiteCentralMultiplicity) ∧
      (¬ propertyFactorsThrough blindMultiplicityObservation
        hasExactlyTwoCentralAtoms) := by
  exact ⟨off_atom_sameRepresentation_zero n, off_atom_not_zero_function n,
    finiteCentralMultiplicity_not_factorsThrough_blindObservation,
    hasExactlyTwoCentralAtoms_not_propertyFactorsThrough_blindObservation⟩

/-- Named finite core of the standard-form boundary: standard-form data of the
represented quotient have already killed an off-support central atom, and blind
finite-cardinality data do not decide the two-atom predicate. -/
theorem standardFormNotAmbientCompletionCore (n : Nat) :
    sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) ∧
      (¬ propertyFactorsThrough blindMultiplicityObservation
        hasExactlyTwoCentralAtoms) := by
  exact ⟨off_atom_sameRepresentation_zero n, off_atom_not_zero_function n,
    hasExactlyTwoCentralAtoms_not_propertyFactorsThrough_blindObservation⟩

/-- Referee-form finite core of the support-faithfulness obstruction: an atom
may be zero after the represented quotient while remaining nonzero in the full
finite algebra; blind cardinality data do not decide the two-atom predicate; and
any quotient-factored property reconstruction is killed by a same-quotient pair
with different property truth values. -/
theorem refereeSupportFaithfulnessObstructionCore (n : Nat) :
    (sameRepresentation
        (n := n + 1)
        (atom (n := n + 1) (1 : Fin (n + 2)))
        (fun _ => 0) ∧
      Not (atom (n := n + 1) (1 : Fin (n + 2)) = fun _ => 0) ∧
      (¬ propertyFactorsThrough blindMultiplicityObservation
        hasExactlyTwoCentralAtoms)) ∧
    (∀ {X Q D : Type} (quotient : X -> Q) (observeQuotient : Q -> D)
      (property : X -> Prop) {x y : X},
      quotient x = quotient y -> property x -> ¬ property y ->
        ¬ propertyFactorsThrough
          (fun z : X => observeQuotient (quotient z)) property) := by
  exact ⟨standardFormNotAmbientCompletionCore n,
    (fun {X Q D} quotient observeQuotient property {x} {y} hquot hx hy =>
      quotientFactoredPropertyNoGoCore
        (X := X) (Q := Q) (D := D)
        quotient observeQuotient property
        (x := x) (y := y) hquot hx hy)⟩

/-- Referee-form finite core of the modular/crossed-product entropy
obstruction: after a character quotient an off-support central atom is already
zero in the represented algebra, and post-retraction crossed-product
trace/entropy data still do not decide the two-atom predicate or central trace
normalization unless the calibration mask has full support. -/
theorem refereeModularCrossedProductEntropyCore {m : Nat}
    (mask : Fin m -> Bool) :
    (sameRepresentation
        (n := 1)
        (atom (n := 1) (1 : Fin 2))
        (fun _ => 0) ∧
      Not (atom (n := 1) (1 : Fin 2) = fun _ => 0)) ∧
    ((∀ x : Fin 2 -> Int,
      positivePair2 x -> sumReadout2 x = 0 -> x 0 = 0 ∧ x 1 = 0) ∧
    ¬ propertyFactorsThrough blindMultiplicityObservation
      isBinaryMultiplicity ∧
    totalWeight2 traceWeights13 = totalWeight2 traceWeights22 ∧
    traceWeightProduct2 traceWeights13 ≠
      traceWeightProduct2 traceWeights22 ∧
    ((∀ weights weights' : Fin m -> Nat,
        sameMaskedTraceCalibration mask weights weights' -> weights = weights') <->
      supportFull mask) ∧
    (∀ {X D C : Type} (observe : X -> D) (coefficient : X -> C),
      factorsThrough observe coefficient <->
        ∀ x y, observe x = observe y -> coefficient x = coefficient y)) := by
  exact ⟨representedModularDataSupportedCore 0,
    crossedProductEntropyCalibrationFiberCore mask⟩

end FiniteCenterSupport
