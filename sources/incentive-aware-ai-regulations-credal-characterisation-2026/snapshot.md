<!--
  AI Triad Research Project — Document Snapshot
  Title      : Incentive Aware AI Regulations: A Credal Characterisation
  Source     : 
  Type       : pdf
  Captured   : 2026-04-11
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Incentive Aware AI Regulations: A Credal Characterisation

> **Snapshot captured:** 2026-04-11
> **Source:** 
> **Type:** pdf

---
Incentive Aware AI Regulations:
A Credal Characterisation
Anurag Singh?1, Julian Rodemann1,2, Rajeev Verma3, Siu Lun Chau4, and
Krikamol Muandet1
1
RationalIntelligenceLab,CISPAHelmholtzCenterforInformationSecurity,Saarbrⁿcken,Germany
2
DepartmentofStatistics,LMUMunich,Germany
3
UvA-BoschDeltaLab,UniversityofAmsterdam,Netherlands
4
NanyangTechnologicalUniversity,Singapore
March 6, 2026
Abstract
Whilehigh-stakesMLapplicationsdemandstrictregulations,strategicMLprovidersoften
evade them to lower development costs. To address this challenge, we cast AI regulation
asamechanismdesignproblemunderuncertaintyandintroduceregulationmechanisms: a
frameworkthatmapsempiricalevidencefrommodelstoalicenseforsomemarketshare. The
providerscanselectfromasetoflicenses,effectivelyforcingthemtobetontheirmodelÆsability
tofulfilregulation. Weaimatregulationmechanismsthatachieveperfectmarketoutcome,i.e.
(a)drivenon-compliantproviderstoself-exclude,and(b)ensureparticipationfromcompliant
providers. We prove that a mechanism has perfect market outcome if and only if the set
of non-compliant distributions forms a credal set, i.e., a closed, convex set of probability
measures. Thisresultconnectsmechanismdesignandimpreciseprobabilitybyestablishing
a duality between regulation mechanisms and the set of non-compliant distributions. We
alsodemonstratethesemechanismsinpracticeviaexperimentsonregulatinguseofspurious
featuresforpredictionandfairness. Ourframeworkprovidesnewinsightsattheintersection
of mechanism design and imprecise probability, offering a foundation for development of
enforceableAIregulations.
Keywords: AI-Regulation,MechanismDesign,ImpreciseProbability,TestingbyBetting
1 Introduction
AsMLsystemsareincreasinglydeployedinhigh-stakesdomainsrangingfromcreditscoring(Bae-
sensetal.,2003)tosocialjustice(Angwinetal.,2022),theirassociatedriskshavebecomereal(Buo-
lamwini & Gebru, 2018; Laux et al., 2024). Policymakers have reacted to this threat with the
?Correspondingauthor:anurag.singh@cispa.de
⌐2025RationalIntelligenceLabatCISPA.AllRightsReserved
6202
raM
5
]GL.sc[
1v57150.3062:viXra

developmentofcomprehensiveAIgovernanceframeworks,suchastheEUAIAct(Edwards,2021).
In practice,the policymakers facea delicatebalancing act asthe goalof regulation istwofold: (1)
preventingthedeploymentofunsafemodelsbymakingthenon-compliantmodelprovidersself
exclude (e.g., those failing fairness or robustness standards) while simultaneously (2) fostering
safe innovationby encouraging compliantmodelproviders toparticipate in the market. We term
thistheperfectmarketoutcome. Regulatorscouldpossiblyachieveperfectmarketoutcomesvia
regulationswithwhiteboxaccesstomodels,i.e.,modelweights,gradients,includingaccessto
trainingprocedureandhyper-parameters(Shevlane,2022;Solaiman,2023).
However, in practice, regulators must often regulate models with limited black-box access, as
proprietaryinterestsandtradesecretsfrequentlyprecludethedisclosureofmodelarchitectures
or training data (Pasquale, 2015; Raji et al., 2020). Therefore, some policymakers argue for an
outcome-basedapproachtoregulation (Brundageetal.,2018;Hadfield&Clark,2023). Toenforce
outcome-basedregulations,regulatorsmustdetermineifmodelsfulfilregulationsviafinite-sample
benchmarks,andthusfacestatisticaluncertainty (Jansenetal.,2024;Renetal.,2024). Atthesame
time,modelproviderspossessmuchmoreknowledgethanregulatorsaboutmodelÆsabilitiesand
pitfalls. Thiscreatesaninformationasymmetry betweenprovidersandregulatorswhichcanbe
exploitedbythemodelproviders(Casperetal.,2024;Li&Goel,2025). Inthiswork,weformalise
this problem by casting AI regulation as a mechanism design problem under uncertainty. We
proposeregulationmechanisms whichpushtheburdenofproofontheproviders. Insteadoftrying
toproveôThismodelisunsafeö,theregulatornowjudges,ôIsthemodelproviderwillingtobet
theirowncapitalonthemodelÆssafety?ö
Whilerecentadvancesinhypothesistesting(Batesetal.,2022,2023)alsoformalizeinformation
asymmetryunderuncertainty,theyprimarilyfocusonmakinghypothesistestsrobusttostrategic
behaviours. In contrast, our focus is on addressing the question: under what conditions can a
regulatorachieveperfectmarketoutcomesusingsuchstatisticalmechanisms? Weprovideacomplete
characterisation,provingthataregulatoryrequirementisenforceableifandonlyifthesetofnon-
compliantdistributionsformsacredalset (Levi,1980)ùaclosed,convexsetofprobabilitymeasures.
Thecredalsetherereflectstheconditionsontheregulatortobeinternallyconsistentwithrespect
tohisregulatoryrequirements. Weassumethattheregulatorclaimstoachieveaparticularmarket
outcome with their regulatory requirements. If the set of non-compliant distributions is not
a credal set, any mechanism chosen to enforce regulation will either fail to prevent strategic
behaviourorinadvertentlydenymarketaccesstocompliantagents,demonstratingtheinherent
inconsistencyoftheregulatoryrequirements.
OurContributions. Wenowsummariseourmaincontributions. Firstly,weformaliseperfect
market outcomes in AI regulation as outcome of an implementable mechanism. Secondly, we
provide thefullcharacterisation ofperfectmarket outcome achievingregulatory requirements
via credal sets. Our result further shows that quasi-convexity and lower-semicontinuity are a
necessary and sufficient conditions for threshold-based regulations to achieve perfect market
outcomes. Theseresultsprovideinsightsforregulatorswhowishtousemechanismstoenforce
theirregulationswithperfectmarketoutcomes. Lastly,wederiveoptimalresponsesofrisk-neutral
andrisk-aversemodelprovidertotheregulationmechanisms. Wethendeveloppracticalregulation
mechanisms,whichcanachieve perfect marketoutcomesfordifferentregulatoryrequirements,
andextendthemtosettingswhereregulatorsdonothaveanexplicitrepresentationofthecredal
2

setviathetesting-by-bettingframework(Grⁿnwaldetal.,2024;Ramdas&Wang,2024;Shafer,
2021)byallowingthemodelproviderstobetontheirmodelÆsability. Wealsodemonstratehow
practical regulation mechanisms can achieve perfect market outcomes on both synthetic and
real-worlddatasets.
2 Preliminaries
Thissectionintroducesthenotation,presentstheproblemformulation,andreviewsthenecessary
backgroundonimpreciseprobabilitiesandmechanismdesign.
2.1 Notation and Problem Formulation
WeconsiderX ? Rd asourinstancespaceandY asourtargetspacewhereY ? Rforregression
tasksandY = {1,...,K}foraK-classclassificationproblem. Ourfocuswillbeonasupervised
learningscenariowherethegoalistolearnafunctionf : X ? Y fromahypothesisclassH on
the basis of data. The modelÆs performance is measured via a loss function ? : Y ╫ Y ? R
?0
where?(f(x),y)isthepoint-wiseerrorthemodelf ? H makesonadatapoint(x,y) ? X ╫Y.
Inoursetting,weconsidertwoplayers: amodeldesigner andaregulator. Themodeldesigneris
responsibleforlearningapredictivemodelfromdata,whereastheregulatorÆsroleistoensure
thatthemodelcomplieswithprescribedregulatoryrequirements.
Let(?,F)beanunderlyingmeasurablespaceoverwhichthereexistsafixedbutunknowndata
generatingprocessP. WedenotethecorrespondingmeasureasP,aswellasrandomvariables
associatedwith X andY asX : ? ? X andY : ? ? Y,respectively,suchthatX(?) = xand
Y(?) = y. Inaddition,weconsideranevidencespaceZ withcorrespondingrandomvariables
Z : ? ? Z indexed by f ? H. For example, loss values Z (?) = ?(f(X(?)),Y(?)) can
f f
be considered as an evidence associated with f. We denote the space of bounded continuous
functionsonZ asC(Z). Weconsider thetopologybetweenC(Z)andevidencedistributionP
throughthestandarddualpairing?╖,╖? : C(Z)╫?(Z) ? R,definedbytheexpectationforsome
? ? C(Z):
(cid:90)
??,P? := E [?(z)] = ?(z)dP(z).
z?P
Z
Consistentwiththispairing,weequipthespaceofprobabilitydistributions?(Z)withtheweak-*
topology. Convergence P ? P in this topology is defined precisely by the convergence of
n
expectationsagainstallcontinuousfunctions: ??,P ? ? ??,P?forall? ? C (Z).1
n b
2.2 Imprecise Probabilities and Credal Sets
Standard probability theory assigns a unique numerical measure to every event, implicitly as-
sumingcompleteinformation. Incontrast,impreciseprobability (IP)generalizesthisframework
to accommodate ambiguity, partial ignorance, or conflicting evidence by allowing a range of
1Extensiontodiscontinuousfunctions:WhileweconsiderC(Z),weoftenrelaxtothespaceofboundedmeasurable
functionsL(Z)equippedwiththetopologyfromL -norm.SinceC(Z)isdenseinL(Z)underL -norm,weuse
1 1
supremumtorefertosolutionsinL(Z).
3

plausibleprobabilitydistributions(Augustinetal.,2014;Walley,1991). Whileclassicalprobability
representsuncertaintyusingasingle(additive)probabilitydistributionP,variousIPmodelssuch
as lower probabilities, possibilitymeasure, andbelief functions are insteadcharacterised by sets
ofdistributions,commonlyreferredtoascredal sets.
Definition2.1(CredalSet). Acredalset P isaclosed,convexsetofprobabilitymeasuresona
0
measurablespace.
Thisextensionishistoricallygroundedinthesubjectiveinterpretationofprobability(deFinetti,
1974), which departs from frequentist views by interpreting probability as an agentÆs betting
dispositions ratherthan observedfrequencies. From arobust Bayesian perspective,a credal set
representstheagentÆsuncertainty: theôtrueöorôidealödata-generatingdistributionisassumed
to lie within P , although its exact identity remains unknown. Central to this interpretation is
0
the concept of a gamble. A gamble g : ? ? R is a bounded real-valued function interpreted as
an uncertain reward whose payoff is g(?) if the outcome ? ? ? occurs. In the case of precise
probability, the probability P(A) for an event A ? F coincides with the fair price at which
an agent is willing to buy or sell the associated indicator gamble 1 defined by 1 (?) = 1
A A
when ? ? A and 0 otherwise. Equivalently, the probability of an event equals the expected
payoff of its indicator gamble, that is, P(A) = E[1 ]. To accommodate imprecision, the IP
A
literaturereplacesasinglefairpricewithbounds: thesupremumacceptablebuyingprice(lower
prevision)andinfimumacceptablesellingprice(upperprevision)ofagamble. Thesearedefined
as the lower and upper envelopes of a credal set P , i.e., P(g) := E(g) = inf E [g] and
0 P?P0 P
P(g) := E(g) = sup E [g],respectively. Thetwoareconjugate,satisfyingP(g) = ?P(?g),
P?P0 P
andcoincideintheprecisecase. SeeAugustinetal.(2014)formoredetails.
ThelowerprevisionisthegenerativefunctionalforthebehaviouraldefinitionofIP,allowingus
to characterize the agentÆsbeliefs via the set of risksthey are willing to accept, known as theset
ofmarginallydesirablegambles.
Definition 2.2(Set of MarginallyDesirable Gambles). A gambleg is marginallydesirable with
respecttoa credalsetP ifthe agentexpectsanon-negative gainintheworst-casescenario. A
0
setofmarginallydesirablegambleswithrespecttoP isformallydefinedas
0
(cid:26) (cid:27)
G := g : ? ? R | inf E [g] ? 0 .
?0,P0
P?P0
P
Analogously, the set of marginally undesirable gambles is G := {?g | g ? G }. We
?0,P0 ?0,P0
denotethesetofgamblesthataredesirablewithrespecttoallpossibledistributionson?asD .
?0
Gambleseffectivelyserveasthegeometricdualtothecredalset. Inthecontextofregulation: P
0
represents the uncertainty in the model space, while G represents the gambles in the evidence
?0
space. This relationship isfundamentaltounderstandingactuarialrisk,whereregulationcanbe
framedascheckingwhetheraspecificfinancialposition(gamble)isdesirable(acceptable)undera
setofplausiblestress-testscenarios(thecredalset).
4

| 2.3 Mechanism |     | Design |     |     |     |     |     |
| ------------- | --- | ------ | --- | --- | --- | --- | --- |
Weframe the problemof private AIregulation as aspecific instanceof mechanismdesign. We
first review the general mechanism design framework (Hurwicz, 1973; Maskin, 1999) and then
highlighttheuniquechallengeswithformalisationofAIregulationasamechanismdesignproblem.
Mechanismdesignconcernsasettingwhereadesigner(orprincipal)aimstoimplementadesired
outcomebutlacksprivateinformationheldby strategicagents. Considerasetof n agents,where
each agent possesses private information, referred to as a drawn from a type
|     | i   |     |     |     | type ? | ? ? |     |
| --- | --- | --- | --- | --- | ------ | --- | --- |
i i
space . The joint type profile is denoted by ?, where ╫n . The
| ?   |     |     |     | ? = (? | ,...,? ) ? | ? := | ?     |
| --- | --- | --- | --- | ------ | ---------- | ---- | ----- |
|     | i   |     |     |        | 1 n        |      | i=1 i |
principalÆsdesiredoutcomescanthenbecharacterizedbyasocialchoicefunction.
Definition2.3(SocialChoiceFunction). LetO beaspaceofoutcomes(orallocations). Asocial
|                     |     |         | mapsthetypeprofile? |     | ?toadesiredoutcomeo |     | O.  |
| ------------------- | --- | ------- | ------------------- | --- | ------------------- | --- | --- |
| choicefunction(SCF) |     | f : ? ? | O                   |     | ?                   |     | ?   |
ThegoalofthemechanismdesigneristoimplementtheoptimaloutcomeofanSCFf basedon
the true type profile ?. Consider single-item auctions (Vickrey, 1961) as an example. Here, the
type? isthewillingness-to-payofagentifortheitem. Theoutcomeisapairo := (y,p)where
i
{0,1}calledallocationruleindicateswhatagentsreceiveandp R,calledpricing
| y : ? ? |     |     |     |     |     | : ? ? |     |
| ------- | --- | --- | --- | --- | --- | ----- | --- |
function tells the price they need to pay. An SCF collectively specifies both the allocation and
paymentsas: (y(?),p(?)). Acommongoalistomaximizesocialwelfare,i.e. toassignthe
f(?) =
item to the agent with the highest valuation. More precisely, if , where
|     |     |     |     |     | y(?) = | 1 ? = max | ?   |
| --- | --- | --- | --- | --- | ------ | --------- | --- |
|     |     |     |     |     | i      | i         | j j |
y(?) denotestheallocationforagenti. Thepaymentfunctionpisthenderivedtoensuresuch
i
allocationforstrategicagents(Myerson,1981).
The principal cannot directly apply to allocate outcomes because the true type profile is
|     |     |     | f   |     |     |     | ?   |
| --- | --- | --- | --- | --- | --- | --- | --- |
unobservableandagentsmaybestrategicbymisreportingthem. Instead,shedesignsamechanism
╫n
M = ?S,g? consisting of the joint strategy profile S = S of all n agents (e.g., bids or
i
i=1
reports) and an outcome function g : S ? O that maps strategy profiles to outcomes. Each
agentiwantstomaximizetheirownutilityu (g(s),? )wheres ? S. Thisinducesagamewhere
i i
each agent i selects a strategy s = argmax u (g(s ,s),? ), where s is a vector of joint
|     |     |     | i   | s?Si i | ¼i i | ¼i  |     |
| --- | --- | --- | --- | ------ | ---- | --- | --- |
strategiesofall theagentsexceptagenti. Typically,Misdesignedsuch thattheoutcomeof the
gamefortheagentsg(s)isactuallyf(?)where? isthetruetypeprofile(Nisanetal.,2007).
Definition2.4(Implementability). AmechanismMissaidtoimplement theSCFf indominant
strategiesifthereforevery? thereexistsajointstrategyprofiles? suchthatg(s?) = f(?),where
| s? = {s?,...,s?}ands? |     | isadominantstrategyforagenti. |     |     |     |     |     |
| --------------------- | --- | ----------------------------- | --- | --- | --- | --- | --- |
|                       | 1 n | i                             |     |     |     |     |     |
OneofthefundamentalresultsinmechanismdesignistheRevelationPrinciple (Gibbard,1973;
Myerson,1979;Roughgarden,2010),whichstatesanyimplementableSCFisimplementableby
a direct revelation mechanism. In such a mechanism, the strategy space is the type space itself
(S = ? ), and truthful reporting (s = ? ) constitutes a dominant strategy equilibrium. This
| i   | i   |     | i   | i   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
principleallowsustorestrictourattentiontodirectmechanismswithoutlossofgenerality.
5

| 3 Incentive | Aware | Regulation |     |     |     |
| ----------- | ----- | ---------- | --- | --- | --- |
WecastAIregulationasamechanismdesignproblemwheretheagentisanAImodelprovider
| whose private | type     | corresponds | to the                | generated | by the model |
| ------------- | -------- | ----------- | --------------------- | --------- | ------------ |
|               | ? ? ?(Z) |             | evidence distribution |           |              |
overtheevidencespaceZ. TheoutcomespaceO {0,1}representsmarketparticipation(1for
=
participation,0forself-exclusion). Aregulationcanthenbeformallydefinedwithrespecttothe
underlyingevidencedistribution.
Definition3.1(Requirement). LetR {0,1}bearequirementfunction. Anevidence
|               |                                             | : ?(Z) | ?   |     |     |
| ------------- | ------------------------------------------- | ------ | --- | --- | --- |
| distributionP | ?(Z)satisfiestheregulatoryrequirementifR(P) |        |     | 1.  |     |
|               | ?                                           |        |     | =   |     |
Therequirementformalisestheregulationandinmechanism-designterms,inducesasocialchoice
functionf whoseoutcomeforamodelproviderwithtypeP ? ?(Z)isR(P)2. Unlikestandard
mechanism design, where typesare typically representedby scalar values, the type in oursetting
correspondstotheentireevidence-generatingprocess. Formally,wemodelthetypeas? ?(Z),
?
that is, a probability distribution over the evidence space. This captures uncertainty over the
evidenceZ foreachh H. Sinceneithertheregulatornormodelprovidershaveaccesstothe
?
h
trueP,theSCFf Rcannotbeevaluateddirectly. Asaresult,strategicbehaviourisnottheonly
=
impediment: theintrinsicstatisticaluncertaintyplacesoursettingwithinthescopeofmechanism
designunderuncertainty.
Sinceinoursettingregulatorshaveonlyblack-boxaccesstomodels,
Outcome-basedRegulation.
things such asparameters, or other model-level featuresare unobservable, rendering regulation
onthesepropertiesunenforceable. Wethusadoptanoutcome-basednotionofrequirementsin
Definition3.1anddefinethemdirectlyontheobservableevidencecapturedbythedistributionP ?
?(Z). Inmanyscenarios,requirementsaredefinedasathresholdconstraintonsomequantifiable
metric r(P) : ?(Z) ? R such as accuracy, fairness, or worst-case subgroup performance, i.e.,
| 1[r(P)  | ?]where? | isapre-definedthreshold. |     |     |     |
| ------- | -------- | ------------------------ | --- | --- | --- |
| R (P) = | >        |                          |     |     |     |
?
| 3.1 Regulation | Mechanisms |     |     |     |     |
| -------------- | ---------- | --- | --- | --- | --- |
We define a regulation mechanism ? ? C(Z) as a set of non-negative, bounded, continuous
functions. Inpractice,?functionsasasetoflicenses. Amodelproviderchoosesalicense? ? ?
andreceivesrevenue?(Z),whichdependsontheobservedstatisticalevidenceZ ? Z. Weassume
that ??? = sup ?(z) ? R for all ? ? ?, which imposes a ômarket capö on the maximum
? z?Z
possible payout.3 The mechanism enforces the requirement by implementing the perfect
|     |     | ?   | R   |     |     |
| --- | --- | --- | --- | --- | --- |
marketoutcome.
Next,wedefinethenotionofobedience.
2InourcurrentformulationwefocusonthecasewheretheoutcomeR(P)foranagent(AImodelprovider)is
independentofotheragents.
3Note that ??? ? R acts only as a constraint on ? and does not imply ||╖|| norm on C(Z) which has
|     | ?   |     |     | ?   |     |
| --- | --- | --- | --- | --- | --- |
weak*-topology.Weconsider?tobesetofboundedfunctionsasE [?]?Rbecause||?|| ?R.
P ?
6

|     |     | P isnotacredalset |     |     |     | P isacredalset |     |
| --- | --- | ----------------- | --- | --- | --- | -------------- | --- |
|     |     | 0                 |     |     |     | 0              |     |
Implementable?ex-
|     |      | Randomisationallows  |           |      |      |      | istsandachievesper- |
| --- | ---- | -------------------- | --------- | ---- | ---- | ---- | ------------------- |
|     |      | gamingtheregulation. |           |      |      |      | fectmarketoutcome.  |
|     | Y=1) | P                    |           | Y=1) | P    | Y=1) | P                   |
|     |      | (Y                   |           |      | (Y   |      | (Y                  |
|     | P(   | = 3)                 |           | P(   | = 3) | P(   | = 3)                |
|     |      | Nofeasible?          | existsfor |      |      |      |                     |
somemodelprovider.
|     | P(Y=2) |     |     | P(Y=2) |     | P(Y=2) |     |
| --- | ------ | --- | --- | ------ | --- | ------ | --- |
Figure 1: An illustration for Theorem 3.5 for a classification task with K = 3 classes. The blue
regions represent the set of non-compliant distributionsP within the probability simplex. (Left)
0
Anon-credalP failsobedience: aprovidercanconstructacompliantmixture(reddot)fromtwo
0
non-compliantmodels(darkbluedots),thusbypassingtheregulation. (Middle)Non-credalP
0
further violates feasibility, as there are compliant distributions that cannot be separated from
such a non-credal by a linear functional (dotted red line), making perfect market outcome
P
0
impossible. (Right)WhenP isacredalset,alinearseparatinghyperplaneexists,guaranteeing
0
animplementable?.
Definition3.2(Obedience). Aregulationmechanism?issaidtoenforceobediencetotherequire-
mentRifthefollowingholdstrueex-antefortheagents: ForallP ? ?(Z)whereR(P) = 0,
E (1)
|     |     |     |     | sup | [?(Z)] ? C, |     |     |
| --- | --- | --- | --- | --- | ----------- | --- | --- |
Z?P
???
| whereC | < R | isthemarketentryfee. |     |     |     |     |     |
| ------ | --- | -------------------- | --- | --- | --- | --- | --- |
Obedience ensures that the non-compliant providers cannot recover their entry fee from any
license in ?, and therefore self-exclude. Furthermore, regulations must also be feasible, i.e., it
encouragesthecompliantproviderstoparticipate.
Definition3.3(Feasibility). Aregulationmechanism?isfeasible ifforallP ?(Z)suchthat
?
|      | 1,thereexistsalicense? |     |     | ?forwhichE |          | 0.  |     |
| ---- | ---------------------- | --- | --- | ---------- | -------- | --- | --- |
| R(P) | =                      |     | ?   |            | [?(Z)]?C | >   |     |
Z?P
While feasibility guarantees an incentive to participate, it does not by itself incentivize agents
toimprovemodelqualitybeyondmeetingtherequirement. Wediscussifregulationmechanism
can encourage model improvement in Appendix 14. Next, we formalize the notion of perfect
marketoutcomesintermsofmodelprovidersÆexanteparticipationdecisionsunderimplementable
regulatorymechanisms.
(ImplementableRegulationMechanism)LetP ?(Z)bethemodelproviderÆs
| Definition3.4. |     |     |     |     |     | ?   |     |
| -------------- | --- | --- | --- | --- | --- | --- | --- |
typeand?denotetheregulationmechanism. Also,letG(?,P) {0,1}betheproviderÆsdecision
?
toparticipateinthemarket. Then,themechanism?issaidtoimplement therequirementRif
| andonlyifR(P) |     | = G(?,P)forallP |     | ? ?(Z). |     |     |     |
| ------------- | --- | --------------- | --- | ------- | --- | --- | --- |
Wecall?thatsatisfiesDefinition3.4implementable. Aregulationmechanism?thatsatisfiesboth
obedienceandfeasibilityisimplementable. WhenmodelprovidersarecertainabouttheirtypeP,
theirdecisiontoparticipateinthemarketisgivenbyG(?,P) 1[sup E C]. Given
|     |     |     |     |     |     | =   | [?(Z)] > |
| --- | --- | --- | --- | --- | --- | --- | -------- |
|     |     |     |     |     |     | ??? | P        |
the obedience to regulations, G(?,P) = 0 whenever R(P) = 0 and based on the feasibility of
regulations, G(?,P) = 1 whenever R(P) = 1. Therefore, a ? that satisfies both obedience to
regulationandfeasibilityisalsoimplementable.
7

Theorem3.5. Animplementableregulationmechanism?forarequirementRexistsifandonlyif
P := {P ? ?(Z) | R(P) = 0}
0
isacredalset,i.e.,aclosed,convexsetofprobabilitymeasures. Inthespecialcasewheretherequirement
isdefinedviathresholdingrule,i.e.,R(P) := 1[r(P) > ?],animplementablemechanism?exists
foranythreshold? ifandonlyifr isquasi-convexandlowersemi-continuous. 4
Theorem3.5establishesasufficientandnecessaryconditionforany regulationrequirementR
to be implementable by a regulation mechanism ?, i.e., the set of non-compliant distributions
P mustbeclosedandconvex. Thecharacterisationofmetricsforthreshold-basedrequirements
0
is a favourable result for regulation design as many standard properties, such as accuracy and
worst-caseperformanceacrosssubgroups,areconvexintheinputdistribution(andthusquasi-
convex). Consequently,regulationsdefinedbylower-boundingthesemetricsyieldsacredalsetof
non-compliantdistributions. Figure1illustratesthisresult.
InterpretationofcredalsetinTheorem3.5. FromtheIPperspective,wecanviewAIregulation
as a game between the regulator (or a forecaster) and the model provider (or a skeptic). The
credalsetcharacterisestheconditionsontheregulatortonotbegamed(Dutchbooked;deFinetti
1974; Walley 1991). In classic IP, forecaster claims a forecast and releases gambles, the skeptic
canthencombinegamblestomakeforecasterincursureloss,thusrevealingforecasterÆsinternal
inconsistency. Inourcase,theregulatorclaimsasocialoutcomeviarequirementsandreleasesa
regulationmechanism. Modelproviderscanthenstrategiseontheevidencedistributiontobypass
regulation,revealing regulatorÆsinternalinconsistency. In Figure1,we showthatif P werenot
0
convex, the provider with non-compliant models f and f (where P ,P ? P ) could simply
1 2 f1 f2 0
randomize between them to produce a mixture distribution P = ?P + (1 ? ?)P that lies
? f1 f2
outsideP ,allowingthemtopurchaseaprofitablelicenseandbypassregulationwithoutactually
0
improving theirunderlying models. Conversely, if theregulator wereto declare suchbehaviour
acceptable,theywouldbeunabletodesignaregulatorymechanism?thatenablesthecompliant
providertoobtainalicensewithoutsimultaneouslyallowingnon-compliantproviderstodothe
same(seethemiddleofFigure1). ThiswouldexposeaninternalinconsistencyintheregulatorÆs
position.
Propertiesofobedientregulations. WhileTheorem3.5tellsusthatanimplementableregulation
mechanism exists. It does not tell us how to compute such a mechanism. To address this, we
define the mechanism of all obedient licenses, denoted as ?obd, which contains all licenses that
P0
satisfyobedience(Definition3.2)andshowthat:
Lemma3.6. If?obd isnotimplementable,thentheredoesnotexistanimplementable?. Additionally,
thelargestimplem P e 0 ntable? = ?obd .
P0
Lemma 3.6, together with Theorem3.5, tells us that ?obd will always be implementablewhenever
P0
Theorem 3.5 is satisfied. Therefore, from all implementable mechanisms, we can restrict our
attentionto?obd andgiveitscharacterisation.
P0
4Afunctionalrisquasi-convexifallitssublevelsetsareconvex.Equivalently,forallP ,P ??(Z)and??[0,1],
1 2
r(?P +(1??)P )?max{r(P ),r(P )}.
1 2 1 2
8

Theorem3.7(CharacterisationandInvarianceofObedientRegulations).
Givenasetofmarginally
undesirablegamblesG withrespecttoP andalldesirablegamblesD ,wecancharacterise
|                                              |     |     | ?0,P0 |     | 0   |     |     | ?0  |     |     |
| -------------------------------------------- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
| thesetofallobedientregulationswithrespecttoP |     |     |       |     |     | as  |     |     |     |     |
0
ob
|     |     |     |     | ?   | = {G  | +C}?D |     |     |     |     |
| --- | --- | --- | --- | --- | ----- | ----- | --- | --- | --- | --- |
|     |     |     |     | P0  | ?0,P0 | ?0    |     |     |     |     |
wheretheset{G +C} := {g+c | g ? G }. Additionally,?ob isinvariantuptotheconvex
|     |     | ?0,P0 |     |     |     | ?0,P0 |       | P0  |     |     |
| --- | --- | ----- | --- | --- | --- | ----- | ----- | --- | --- | --- |
|     |     | co(P  |     |     |     |       | co(╖) |     |     |     |
hull of P , i.e., ). Formally, ? = ? = ? where is the convex hull of a set and
|     | 0   |     | 0   | P0  | co(P0) | Q   |     |     |     |     |
| --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- |
co(P Giventheabovecharacterisationofallobedientregulations?ob
| P ? | Q ? | ).  |     |     |     |     |     |     | ,wecanwrite |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------- | --- |
| 0   |     | 0   |     |     |     |     |     |     | P0          |     |
themalternativelyas
|     |     |     |         | (cid:26) |         |                |     | (cid:27) |     |     |
| --- | --- | --- | ------- | -------- | ------- | -------------- | --- | -------- | --- | --- |
|     |     |     | ? ob := | ? : Z    | ? [0,R] | | sup E [?(Z)] | ?   | C .      |     | (2) |
P
P0
P?P0
A useful consequence of this characterisation for the regulators is that, once they decide the
marketentryfeeC,theycanofferan? ? ?ob tothemodelproviderstochoosefromorcheckif
P0
model providerÆs proposed ? belongs to ?ob via Equation 2. Theorem 3.7 also shows that ?ob
|     |     |     |     |     | P0  |     |     |     |     | P0  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
will remain obedient to regulation if the convex hull of P does not change by the change of
0
requirements. Inotherwords,Theorem3.7tellsusthatthesetofallobedientregulations?ob isa
P0
convexpolytopebuiltbytheintersectionofdualconeofalldistributions(D )andintersection
?0
ofhalf-spacesintroducedbylinearconstraintsE foreveryP ({G +C}).
|     |     |     |     |     |     | [?(Z)] ? C |     | ?   | P       |     |
| --- | --- | --- | --- | --- | --- | ---------- | --- | --- | ------- | --- |
|     |     |     |     |     |     | P          |     |     | 0 ?0,P0 |     |
Wealsoverifythat?ob asdefinedinEquation2satisfiesDefinition3.2andthat?ob isclosedand
|     |     |     | P0  |     |     |     |     |     | P0  |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
convex(seeAppendix9.3fortheproof).
|       |            |     |                   |     | While | ?ob is implementable |     | and characterized |     | in The- |
| ----- | ---------- | --- | ----------------- | --- | ----- | -------------------- | --- | ----------------- | --- | ------- |
| Model | providerÆs |     | optimal response. |     |       |                      |     |                   |     |         |
P0
orem 3.7, it is an infinite set. This creates practical difficulties on the model providerÆs side, in
particularforselectingtheoptimallicense? ?ob. Toaddressthisissue,wefirstdescribethe
?
P0
modelproviderÆsresponsetoanimplementable?. Weassumethatthemodelproviderselectsa
? ? ? that maximizes their expected utility. Given the evidence distribution Q ? ?(Z) as the
providerÆsprivateinformation,theirbestresponse?? isobtainedbysolvingthefollowing
Q
|     |     |     |     |     | supE | [?(Z)]. |     |     |     | (3) |
| --- | --- | --- | --- | --- | ---- | ------- | --- | --- | --- | --- |
Z?Q
???
WeknowfromLemma3.6that?ob isthelargestimplementablemechanism,i.e. ? ? ?ob. Hence,
|     |     |     |     | P   |     |     |     |     |     | P   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 0   |     |     |     |     |     | 0   |
thegloballyoptimalresponseisth e bestresponsewhenselectingfrom?ob. Wedenoteth e globally
P0
optimalresponseas?? . Therefore,themodelproviderscompute?? bysolving
|     |     |     | ob,Q  |     |        |                   |     | ob,Q |     |     |
| --- | --- | --- | ----- | --- | ------ | ----------------- | --- | ---- | --- | --- |
|     |     |     | sup   | E   | [?(Z)] | s.t. sup E [?(Z)] | ?   | C.   |     | (4) |
|     |     |     |       | Z?Q |        | P                 |     |      |     |     |
|     |     |     | ???ob |     |        | P?P0              |     |      |     |     |
P0
The model provider effectively need to solve a linear program in to select the best response
?
?? 5. Equation4isalinearprogramsinceitsconstraintsareaconvexpolyhedron. Therefore,
ob,Q
?? mustbeoneoftheextremepoints.
ob,Q
5AsEquation4maynotadmitamaximiserincontinuousfunctions,weanalysetheoptimalresponsebyconsidering
thelinearproblemoverthespaceofboundedmeasurablefunctionsL(Z).Given(C(Z),||╖|| )isdensein(L(Z),||╖|| ),
|     |     |     |     |     |     |     |     | 1   |     | 1   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
thesupremumiswelldefined.WeclarifythisfurtherintheappendixwithinProposition11.2.
9

Proposition3.8. AssumethatthecredalsetP iscompact. Then,theoptimalresponse?? foran
|     |     |     |     |     |     | 0   |     |     |     |     | ob,Q |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
agentoftypeQisanextremepointofaconvexpolyhedroninL(Z),thusanall-or-nothinggamble.
ForintuitionofProp3.8,letusconsiderasimplifiedcasewhereP isasingletonset{P}. Then,
0
Equation4becomes
|     |     |     |       | (cid:20) | (cid:21) |      | (cid:20) | (cid:21) |     |     |     |
| --- | --- | --- | ----- | -------- | -------- | ---- | -------- | -------- | --- | --- | --- |
|     |     |     |       | ?(Z)     |          |      | ?(Z)     |          | C   |     |     |
|     |     |     | sup E |          |          | s.t. | E        | ?        | ,   |     |     |
|     |     |     |       | Z?Q      |          |      | P        |          |     |     |     |
|     |     |     |       | R        |          |      |          | R        | R   |     |     |
???ob
P0
whichwecansolveinclosedformusingtheNeyman-PearsonLemma(Neyman&Pearson,1933)
asahypothesis testbetweenQ(alternate)andP (null)withfalsepositive rateofC/R asC R.
<
| We  | divide | ?ob     |          |         | E   |           |         | by R, i.e., |       | R?1 | ?ob where  |
| --- | ------ | ------- | -------- | ------- | --- | --------- | ------- | ----------- | ----- | --- | ---------- |
|     | ?      | ?       | = {? : Z | ? [0,R] | |   | [?(Z)]    | ? C}    |             | ?     | :=  | ╖          |
|     |        | P0      |          |         |     | P         |         |             |       |     | P0         |
|     |        |         | E        | C/R}.   |     | Then, the | optimal | license     | ??(z) |     | ??(z) is a |
| ? = | {? : Z | ? [0,1] | | [?(Z)] | ?       |     |           |         |             |       | =   | R ╖        |
|     |        |         | P        |         |     |           |         |             | Q     |     | Q          |
scaledversionofNeyman-PearsonTest,i.e.,
(cid:40)
if dQ(z)
|     |     |     |     |       | R   |          | > ? |     |     |     |     |
| --- | --- | --- | --- | ----- | --- | -------- | --- | --- | --- | --- | --- |
|     |     |     |     | ??(z) |     | dP(z)    |     |     |     |     |     |
|     |     |     |     |       | =   |          |     | ,   |     |     |     |
|     |     |     |     | Q     | 0   | if dQ(z) | < ? |     |     |     |     |
dP(z)
where is a threshold such that E is an all-or-nothing gamble. The provider
|     | ?   |     |     | [??(z)] |     | = C |     |     |     |     |     |
| --- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
P Q
identifiesaôrejectionregionöwherethelikelihoodoftheirprivateevidenceQissufficientlyhigh
relative to the constraint P, and stakes their entire capacity on these outcomes. Conversely,
R
for outcomes where the likelihood ratio is low, the provider stakes 0. This zero stake implies a
degenerategamble: theproviderissufficientlyconfidentthatsuchoutcomeswillnotoccur(under
Q)thattheyarewillingtoforgoanypotentialreturninthoseregionseffectivelyacceptingaôlossö
| oftheirfeesC |           | inexchangeforsatisfyingthesafetyconstraints. |            |            |     |     |     |     |     |     |     |
| ------------ | --------- | -------------------------------------------- | ---------- | ---------- | --- | --- | --- | --- | --- | --- | --- |
| 4            | Practical |                                              | Regulation | Mechanisms |     |     |     |     |     |     |     |
Under risk-neutral expected-utility maximization, the best response are ôall-or-nothingö gambles
that concentrate the entire stake on a single event to maximize return R. This is due to the
assumptionthatthemodelprovidersarefullycertainabouttheirtypeQ. Inpractice,whilemodel
providersstillpossesmoreinformationabouttheirmodelsthantheregulators,theymightalso
be uncertain about their types. This epistemic uncertainty fundamentally alters their strategic
behaviour: an epistemically uncertain agent lacks the incentive to place degenerate bets that risk
completefailure.
To handle this, we assume model designers to be risk-averse agents who maximize expected
logarithmicutilityoverlicenses. ThischoicemirrorsBernoulliÆsresolution(Bernoulli,1738)of
the St. Petersburg Paradox, where logarithmic utility replaces linear expected value to rule out
arbitrarily aggressive gambles(see also Peters, 2011). In oursetting, log-utility penalizes licenses
that assign zero payoff to any event with positive subjective probabilityùsince log0 = ??,
discouragingall-or-nothingbets. Modeldevelopersthereforeselecta? ?thatmaximizestheir
?
ex-anteexpectedlog-utility,
|     |     |     |     | argmaxE |     |                |     |     |     |     | (5) |
| --- | --- | --- | --- | ------- | --- | -------------- | --- | --- | --- | --- | --- |
|     |     |     | ??  | =       |     | [log(?(Z))]?C. |     |     |     |     |     |
Z?Q
???ob
P0
10

Proposition 4.1. Assume that the credal set P is compact and Q is the evidence generating
0
distribution (type) of a risk-averse model designer. Let A = {z : Q(z) > R} be the tail region of
P P(z) C
everyP ? P withrespecttoQ. Then,thebestresponse?? ofthemodeldesigneramongstthesetof
0
allimplementablelicenses?ob isthetruncatedlikelihoodratiobetweenQandsomeP? ? P ,i.e.,
P0 0
(cid:40) (cid:41)
Q(z)
??(z) := min C ,R , P? = argmin ? (P) (6)
P?(z) Q
P?P0
where
(cid:90) (cid:18) (cid:19)
Q(z)C
? (P) := KL(Q?P)? log Q(z)dz.
Q
P(z)R
AP
The model designerÆsoptimal response?? introduced in Proposition4.1 is a truncated version of
likelihoodratiobetweendesignerÆstypedistributionQandanotherdistributionP? ? P . Here,
0
theoptimal responseis acontinuous functionwith fullsupport onall z ? Z. The interpretation
forP? inP issimilartoReverseInformationProjection(Csiszßr&Matus,2003;Li,1999),thatit
0
isthemostsimilardistributioninP toQintermsofaôtruncatedöKL-divergencewhichexcludes
0
thetailregionsforP ? P . ThetruncationofboththelikelihoodratioandKLcomesfromthe
0
constraintthat??? ? R.
?
Inpractice,theregulatorwithanexplicitrepresentationofP canuseProposition4.1toassign
0
licenses based on Equation 6. Regulator enjoys the guarantee that model providers will not
strategise with their evidence as Equation 6 implements the best response for their type. The
regulatorcanalsoassignlicensesbasedonnobservations. ConsideradatasetD = {(X ,Y )}n ,
i i i=1
onwhichtheregulatorobservestheevidence{z }n forthemodelproviderÆsmodel. Themapping
i i=1
from(f,X ,Y )toz dependsonthedefinitionofevidencecorrespondingtotherequirementR.
i i i
Underthei.i.dassumption,theoptimalimplementablelicenseis
(cid:40) (cid:41)
n
(cid:89) Q(z )
??(z ) = min C i , R . (7)
1:n P?(z )
i
i=1
Thus, the optimal ?? assigns market-share based on the cumulative statistical evidence, while
enforcing market cap and P? is computed from Equation 6. Therefore, Proposition 4.1 also
characterizes optimal licenses in settings where evidence from multiple samples compounds
throughthelikelihoodratiobutthelicenseremainedbelowthemarketcapR.
Whenthecredalsetisimplicit. Earlier,we assumedthe regulatorcouldexplicitlyconstruct
P and compute the optimal license ?? by solving Equation 6. In practice, P is often defined
0 0
implicitlythrough fairnessor riskconstraintsand withoutan explicitrepresentationof P , exact
0
computation of?? is infeasible for the regulation. Conceptually, Proposition 4.1and Equation 5
correspondtoadirectrevelationmechanisminwhichtheregulatorcomputesoptimaloutcomes
fromreporteddataùanapproachthatiscomputationallyburdensome. Wethereforerelaxthisto
anindirect mechanisminwhichmodelprovidersoptimiseontheirownbehalf. Weoperationalise
thisrelaxation, underadditionalassumptions, usingthe testing-by-bettingframework(Grⁿnwald
etal.,2024;Ramdas&Wang,2024;Shafer,2021).
11

Supposerequirementscanbeobtainedfromathresholdingrule,i.e.,R(P)
| Assumption4.2. |     |     |     |     |     |     |     |     |     | =   |
| -------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
1[r(P) ?]onalinearisablemetricr(P) E [h(z)]whereh Risthebettingscoreor
|     | >   |     |     |     |     |     | :=  | : Z | ?   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
P
anunbiasedestimatorofthemetricr.
Letusconsiderthatregulatorobtainsfinitelymanyi.i.dsamples{z}n fromtheevidencegen-
i=1
erating distribution of the model designer. Under Assumption 4.2, the regulator can offer the
| followingregulationmechanism? |     |     |     |     |     |       | where? |          | [0,R]isthelicensebased |     |
| ----------------------------- | --- | --- | --- | --- | --- | ----- | ------ | -------- | ---------------------- | --- |
|                               |     |     |     |     |     | := {? | [?]}   | [?] : Zn | ?                      |     |
|                               |     |     |     |     | n   |       | n ?    | n        |                        |     |
onnsamplesfromevidencedistributionafterthresholdingwithR:
|     |     |     |     |     |     | (cid:40) |                    |     | (cid:41) |     |
| --- | --- | --- | --- | --- | --- | -------- | ------------------ | --- | -------- | --- |
|     |     |     |     |     |     |          | (cid:89)(cid:16) n |     | (cid:17) |     |
(8)
|     |     |     | ?   | [?](z | ) := | min | C 1+? | (h(z )??) | ,R  |     |
| --- | --- | --- | --- | ----- | ---- | --- | ----- | --------- | --- | --- |
|     |     |     | n   | 1:n   |      |     |       | i i       |     |     |
i=1
where ? = (? ) is a strategy selected by the model designer based on their type, i.e., their
|     |     | n n?1 |     |     |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
knowledge on the evidence generating distribution Q, subject to the admissibility constraint
|     |      | ]forsomeB |     | Rsuchthat1+? |     |     |           | 0almostsurely. |     |     |
| --- | ---- | --------- | --- | ------------ | --- | --- | --------- | -------------- | --- | --- |
| ? ? | [0,B |           |     | ?            |     |     | (h(z )??) | ?              |     |     |
| n   | n    |           | n   |              |     |     | n n       |                |     |     |
Tounderstandhowamodelprovidercanstrategisebychoosing?. Letusconsideracompliant
providerwithtypeQsatisfyingR(Q) = 1,i.e.,E [h(z)] > ?. ThemodelproviderÆsobjectiveisto
Q
chooseanoptimalbet??fornsamplesinordertomaximisetheirlicense. Sinceourmodelprovider
isriskaverse,theoptimalstrategymaximizestheirlicenseaccordingtoKellyÆscriterion(Kelly,
1956). Underthiscriterion,themodelprovidermayemployanadaptivestrategy?? .
= (? )
n n?1
Ateachroundn,thedesignerselects? withfullaccesstothepastoutcomes{z }n?1 (Shekhar&
n i i=1
Ramdas,2023;Waudby-Smith&Ramdas,2024)asfollows:
|     |     |     |     | ??  |       |     | E              |     |     | (9) |
| --- | --- | --- | --- | --- | ----- | --- | -------------- | --- | --- | --- |
|     |     |     |     |     | = arg | max | [ln(1+?h(z))]. |     |     |     |
|     |     |     |     |     | n     |     | z?Q            |     |     |     |
??[0,Bn]
|     |     |     |     | n   |     |     | n   | ? N |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Proposition 4.3. Given samples of evidence where and Assumption 4.2, the regulation
| mechanism? |     | :=  | {? (?)} | definedinEquation8isimplementable. |     |     |     |     |     |     |
| ---------- | --- | --- | ------- | ---------------------------------- | --- | --- | --- | --- | --- | --- |
|            |     | n   | n       | ?                                  |     |     |     |     |     |     |
5 Experiments
Weempiricallyvalidateourframeworkthroughthreedistinctexperiments: (1)StrategicGaming:
Wedemonstratethataregulatorusinganon-convexsetofprohibiteddistributionsisvulnerable
toarbitrageby strategicagents(Fig2a); (2)PerfectMarket viaOptimalLicensing:
Outcome
Weimplementtheoptimallicense?? withEquation5foraregulatorwhowishestoregulateuse
ofspuriousfeaturesforclassification,showingthatitcorrectlydistinguishescompliantmodels
fromnon-compliantones(Figs2b&2c);and(3)ImplicitRegulation: Wedemonstrateafairness
regulationwherethecredalsetisdefinedimplicitlyviathemechanism,eliminatingtheneedforits
Forreproducibilitywealsoopensourceourimplementation6.
explicitrepresentation(Fig2d).
| 5.1 | Datasets |     | and | Experiment |     | Setup |     |     |     |     |
| --- | -------- | --- | --- | ---------- | --- | ----- | --- | --- | --- | --- |
In Figure 2a we illustrate the necessity of convex regulation. We define a toy outcome space
with three prohibited distributions: P = [0.35,0.35,0.3], P = [0.35,0.3,0.35], and P =
|     |     |     |     |     |     | 1   |     | 2   |     | 3   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
[0.3,0.35,0.35]. Wesimulateastrategicmodelproviderwhosamplesuniformlyfrom{P ,P ,P3}
1 2
6https://github.com/muandet-lab/incentive-aware-ai-regulation
12

Gaming the Regulation Market Outcome What does the regulator look at? License for fairness gap ?<0.6
250
| 250 |     |     |     |     |     | 106 | Hard Samples (Minority) |     | 250 |     |     | ?=0.4  |
| --- | --- | --- | --- | --- | --- | --- | ----------------------- | --- | --- | --- | --- | ------ |
)??( eulaV esneciL
Naive Regulator b o? 0 P 200  to B  f u in rn d -   i P n ? 105 Easy Samples (Majority) 200 (Credal)
| 200 | Credal Regulator |     |             |     | ?E?RM      | MR?E  |     |     | )?( esneciL |     |     | ?=0.4      |
| --- | ---------------- | --- | ----------- | --- | ---------- | ----- | --- | --- | ----------- | --- | --- | ---------- |
|     | Cap (R=250)      |     | ??? lamitpO |     |            | 104   |     |     |             |     |     |            |
| 150 |                  |     | 150         |     | ? D ? R O  | ?/    |     |     | 150         |     |     | (Implicit) |
|     | Fee (C=15)       |     |             |     | (R=250)    | 103   |     |     |             |     |     | ?=0.6      |
|     |                  |     |             |     | C a p      | ORD?? |     |     | 100         |     |     |            |
| 100 |                  |     | 100         |     | Fee (C=15) | 102   |     |     |             |     |     | (Implicit) |
R=250
|     | 50  |     | 50  |     |     | 101 |     |     | 50  |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
C=15
100
0 0 500 1000 1500 2000 2500 00 200 400 600 800 1000 1200 1400 0 20 40 60 80 100 0 0 50 100 150 200 250 300 350 400
Samples (n) Samples (n) Number of Easy/Hard Examples Samples (n)
|     |     | (a) |     | (b) |     |     | (c) |     |     |     | (d) |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Figure2: FromLeft-to-Right: Fig(a)demonstratesthatanaiveregulatorwithanon-convexP
0
can be gamed by a strategic provider by mixing evidence from bad models. Fig (b) plots ?? vs
samples for ERM (non-compliant) and Group-DRO (compliant) agents on Waterbirds. Fig (c)
n
plotsRatio?? /?? evaluatedon100randomtestsamples,separatedintoeasy(majority)and
|     |     | DRO | ERM |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
hard(minority,counter-spurious)examplestoshowGroup-DROagentgets betterlicensedueto
itsperformanceonhardexamples. Fig(d)showsthepracticalregulationsforfairnessbasedwhen
credalsetisimplicit. Allfiguresarefor30runsandshadedregionsindicatestandarderror.
based on ? = (1/3,1/3,1/3), effectively simulating the evidence distribution Q = (cid:80)3 ? P .
i i
i=1
Theproviderattemptstopassaônaiveöregulatorwhogiveslicensesbytestingagainstthediscrete
|     |     |     |     |     |     |     |     |     | (cid:110) | (cid:111) |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --------- | --------- | --- | --- |
set{P }individuallyviaageneralisedlikelihoodratiomax dQ(z) whilethecredal
|     | ,P  | ,P  |     |     |     |     |     |     |           | ,R  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- |
|     | 1   | 2 3 |     |     |     |     |     |     | maxiPi(z) |     |     |     |
regulatorprovidesthelicensebasedonEquation6,effectivelytestingthestrategicprovideragainst
thecredalset.
We use the Waterbirds dataset (Sagawa et al., 2020)ùa popular benchmark for learning under
spurious correlationsùto evaluate the regulation mechanism. The task is to classify birds as
Landbirds orWaterbirds. Thetrainingdataisheavilybiased: 95%ofwaterbirdsappearonwater
backgrounds (spurious correlation). We compare two agents: (1) A Non-compliant Agent:
A model trained using ERM which often relies on the background to make prediction. (2) A
CompliantAgent: AmodeltrainedviaGroup-DRO(Sagawaetal.,2020)whichislesssusceptible
tothespuriousfeatures. WeuseResNet-50(Heetal.,2016)totrainbothmodels. Here,theregulator
definesP viatheconvexhullofanERM-trainedmodelmixedwitharandompredictor. Effectively,
0
represents the mixture of distributions which rely on the spurious features, background
P
0
informationinthecaseofERMandandrandomnoiseinthecaseofrandompredictor.
In Figure 2d we consider a regulator who enforces a demographic parity constraint: |E[Y|A
=
|     | E[Y|A |       | for | prediction |     |         | and subgroups |     |     | and   |     | 0.6. We |
| --- | ----- | ----- | --- | ---------- | --- | ------- | ------------- | --- | --- | ----- | --- | ------- |
| 1]  | ?     | = 0]| | < ? |            | Y   | ? {0,1} |               |     | A ? | {0,1} | ? = |         |
simulateproviderswithvaryingtruefairnessgaps? {0.4,0.6}bysettingthepredictionratesfor
?
thesubgroupstofixedBernoulliparametersasY = Bernoulli(0.1)andY = Bernoulli(?+0.1).
|     |     |     |     |     |     |     | 0   |     |     | 1   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Here,theregulatordoesnotmaintainarepresentationofôunfairdistributions". Instead,theyoffer
(cid:81)n
alicensebasedon thestatistic? = (1+? (? ?|Y ?Y |))where? indicatesthechosen
|     |     |     |     | n   |     |     | t 0 | 1   |     | t   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
t=1
bet that is selected adaptively based on the previous outcomes (Shekhar & Ramdas, 2023). We
alsosimulatetheregulatorwithexplicitrepresentationofthecredalsetP toshowthedifference
0
betweenthetwoscenarios. SeeAppendix16.2forfurtherexperimentaldetails.
13

5.2 Insights from Experiments
Credal regulators limit strategic behaviour. Figure 2a highlights the vulnerability of non-
convex regulation. The naive regulator (red) grants a license to the strategic provider because
the mixture distribution Q is statistically distinct from every individual prohibited evidence
distributionP . Incontrast, thecredalregulator(green)correctlyidentifiesthatQlieswithinthe
i
convexhullofprohibiteddistributionsandproviderselfexcludes. Thisdemonstratesthat,fora
regulationtoberobustagainststrategicbehaviour,itssetofprohibiteddistributionsmustbea
credalset.
Credal regulators achieve perfect market outcome. Figures 2b and 2c demonstrate the
mechanismontheWaterbirdsdataset. InFig2b,aftera300-sampleburn-inphasetocalibratethe
worst-casereferenceP?,thecompliantagentÆslicensegrowsexponentiallytothecapR = 250,
while the non-compliant agent fails to obtain a license that can recover its fee C = 15. By
plottingthe licenseon specifictestpoints inFig 2c,we showthat thelargerlicense valueof the
compliantagentisalmostentirelydrivenbyôHardExamples"(e.g.,WaterbirdsonLand),ason
ôEasyExamplesöbothagentsagreewiththeregulatorÆsbaseline(?D ? RO ? 1).
??
ERM
Regulationmechanismswithimplicitcredalset. Figure2dshowsthatregulatorsneednot
alwayskeepanexplicitcredalsettoprovidelicensesandimplementregulationmechanisms. The
regulatorscanoffermodelprovidersachancetobetontheirmodelÆsfairnessbychoosing?. This
allows the regulator to implicitly test against the credal set of all non-compliant distributions.
Evenborderlinenon-compliantproviders(? = 0.6)self-exclude. Conversely,compliantproviders
participate. Figure2dalsoshowsthataregulatorwithanexplicitcredalsetcangiveoptimal?? to
compliantprovidersfaster,thusencouragingparticipation.
6 Related Works
Strategic aspects in hypothesis testing. Several recent works study strategic behaviour in
hypothesis testing (Bates et al., 2022, 2023; Hossain et al., 2025; Min, 2023). In particular, Bates
etal.(2022,2023);Min(2023)adoptaprincipalûagentframework,whereasHossainetal.(2025)
formulatesthisasaBayesiangamewithknowntypedistributions,whileGauthieretal.(2026)
extendittotestingforNashequilibrium. Conceptually,ourworkismostrelatedtoBatesetal.(2022,
2023); Min (2023) as wealso addresses information asymmetry under uncertainty. However, our
focus isoncharacterising perfectmarket outcomes,rather thanon mitigatingstrategicbehaviour.
Also,ourmechanism-designformulationextendstosettingswithinterdependentoutcomesand
generalequilibriumsolutionconcepts. SeeAppendix15forfurtherdiscussion.
IP and testing by betting. Our results characterises the set of all obedient licenses as imple-
mentable mechanisms, leveraging tools from Imprecise Probability (Augustin et al., 2014; Crane,
2018;Walley,1991)andtheoryofdesirabililty(DeBock,2023;DeCooman&Quaeghebeur,2012).
IP theory offers rich literature on robust testing (Chau et al., 2024; Chugg et al., 2026; Huber &
Strassen,1973;Jⁿrgensetal.,2025)withpotentialforapplicationsinAIregulations. Closelyrelated
toIPtestingliteratureisliteratureontestingbybetting(Grⁿnwaldetal.,2024;Ramdasetal.,2023;
Shafer, 2021; Vovk & Shafer, 2014). Testing by betting framework has become the backbone of
methodsthatperformauditingofmachinelearningmodelsviasequentialtestswithapplicationsin
14

riskmonitoringandcontrol(Timansetal.,2025;Waudby-Smith&Ramdas,2024),fairness(Chugg
etal.,2023),differentialprivacy(Gonzßlezetal.,2025)andmanyotherapplications(Shekhar&
Ramdas, 2023; Xu & Ramdas, 2024). Given Assumption 4.2, our result in Prop 4.3 shows how
sequentialtestingmethodscanbeusedtoenforceregulations.
AI governance and regulation. The rapid AI adoption has significant societal consequences
and has led to a debate on AI governance (Dafoe, 2018; Taddeo & Floridi, 2018). As a result,
a growing body of research has approached these questions from a ethical (Hagendorff, 2020;
Huangetal.,2022;Jobinetal.,2019),policy(Diakopoulos,2016;OÆneil,2017),socio-cultural(Awad
et al., 2018; Vesnic-Alujevic et al., 2020), and political (Pavel et al., 2023; Schmid et al., 2025)
perspectives. Ourworkcontributestothisliteraturebyprovidinginsightsandsurfacingtechnical
challengesinoperationalisingpolicymakersÆnormativegoals. Wereviewthesechallengesfurther
inAppendix17.
7 Conclusion
Regulation mechanisms transform noisy, sample-based verification into incentive-compatible
enforcement, enabling regulators to achieve perfect market outcomes. Our analysis further
characterizeswhichregulatoryrequirementscanbeenforcedthroughsuchmechanismswhile
preserving perfect market outcomes. we operationalized these insights by deriving optimal
responses for risk-neutral and risk-averse agents and developing practical mechanisms based
on the testing-by-betting framework. With practical regulation mechanisms the regulator can
side step the need for perfect verification by relying on bets by model providers. This allows
regulatorstoavoidcostly,exhaustivemonitoringinprocess-basedregulationsandachieveperfect
marketoutcomesinanoutcome-focusedregulationsetting. Ourapproachlimitstheill-effectsof
information asymmetry under uncertainty and provides a theoretically grounded framework for
regulatoryenforcementviablack-boxaccess.
References
Amodei,D.,Olah,C.,Steinhardt,J.,Christiano,P.,Schulman,J.,andManΘ,D. Concreteproblems
inaisafety. arXivpreprintarXiv:1606.06565,2016.
Angwin, J.,Larson, J.,Mattu, S.,andKirchner, L. Machinebias. In Ethicsofdataand analytics,pp.
254û264.AuerbachPublications,2022.
Augustin, T., Coolen, F. P. A., De Cooman, G., and Troffaes, M. C. M. (eds.). Introduction to
impreciseprobabilities. Wileyseriesinprobabilityandstatistics.Wiley,Hoboken,NJ,2014. ISBN
978-0-470-97381-3.
Awad, E., Dsouza, S., Kim, R., Schulz, J., Henrich, J., Shariff, A., Bonnefon, J.-F., and Rahwan, I.
Themoralmachineexperiment. Nature,563(7729):59û64,2018.
Baesens,B.,VanGestel,T.,Viaene,S.,Stepanova,M.,Suykens,J.,andVanthienen,J. Benchmarking
state-of-the-artclassificationalgorithmsforcreditscoring. Journaloftheoperationalresearch
society,54(6):627û635,2003.
15

Bailie,J.andDerr,R.Propertyelicitationonimpreciseprobabilities.arXivpreprintarXiv:2507.05857,
2025.
Bates,S.,Jordan,M.I.,Sklar,M.,andSoloff,J.A. Principal-agenthypothesistesting. arXivpreprint
arXiv:2205.06812,2022.
Bates, S., Jordan, M. I., Sklar, M., and Soloff, J. A. Incentive-theoretic bayesian inference for
collaborativescience. arXivpreprintarXiv:2307.03748,2023.
Bender, E. M., Gebru, T., McMillan-Major, A., and Shmitchell, S. On the dangers of stochastic
parrots: Canlanguagemodelsbetoobig? InProceedingsofthe2021ACMconferenceonfairness,
accountability,andtransparency,pp.610û623,2021.
Bernoulli,D. Specimentheoriaenovaedemensurasortis. Econometrica,22(1):23û36,1738. URL
http://www.jstor.org/stable/1909829. Originallypublished1738,translated
in1954.Translation: ôExpositionofanewtheoryonthemeasurementofrisköbyL.Sommer.
Bertolini,A.andEpiscopo,F. TheexpertgroupÆsreportonliabilityforartificialintelligenceand
otheremergingdigitaltechnologies: acriticalassessment. EuropeanJournalofRiskRegulation,
12(3):644û659,2021.
Blum,A.andHardt,M. Theladder: Areliableleaderboardformachinelearningcompetitions. In
InternationalConferenceonMachineLearning,pp.1006û1014.PMLR,2015.
Brundage, M., Avin, S., Clark, J., et al. The malicious use of artificial intelligence: Forecasting,
prevention,andmitigation. Technicalreport,2018. Accessed2025-10-15.
Buolamwini,J.andGebru,T. Gendershades: Intersectionalaccuracydisparitiesincommercial
gender classification. In Conference on fairness, accountability and transparency, pp. 77û91.
PMLR,2018.
Casper, S.,Ezell,C.,Siegmann, C.,Kolt,N.,Curtis,T.L., Bucknall,B.,Haupt,A., Wei,K.,Scheurer,
J.,Hobbhahn,M.,etal. Black-boxaccessisinsufficientforrigorousaiaudits. InProceedingsof
the2024ACMConferenceonFairness,Accountability,andTransparency,pp.2254û2272,2024.
Chau,S.L.,Schrab,A.,Gretton,A.,Sejdinovic,D.,andMuandet,K. Credaltwo-sampletestsof
epistemicignorance. arXivpreprintarXiv:2410.12921,2024.
Chugg,B.,Cortes-Gomez,S.,Wilder,B.,andRamdas,A. Auditingfairnessbybetting. Advancesin
NeuralInformationProcessingSystems,36:6070û6091,2023.
Chugg,B.,Lardy,T.,Ramdas,A.,andGrⁿnwald,P. Onadmissibilityinpost-hochypothesistesting.
InternationalJournalofApproximateReasoning,pp.109634,2026.
Crane,H. Thefundamentalprincipleofprobability: Resolvingthereplicationcrisiswithskinin
thegame. Researchers.One,underreviewwww.researchers.one/article/2018-08-16,2018.
Csiszßr,I.andMatus,F. Informationprojectionsrevisited. IEEETransactionsonInformationTheory,
49(6):1474û1490,2003.
Dafoe, A. Ai governance: a research agenda. Governance of AI Program, Future of Humanity
Institute,UniversityofOxford: Oxford,UK,1442:1443,2018.
16

| De Bock, | J. A theory | of desirable | things. | In            |           |              |              |     |
| -------- | ----------- | ------------ | ------- | ------------- | --------- | ------------ | ------------ | --- |
|          |             |              |         | International | Symposium | on Imprecise | Probability: |     |
TheoriesandApplications,pp.141û152.PMLR,2023.
DeCooman, G.andQuaeghebeur,E. Exchangeabilityandsets ofdesirablegambles. International
JournalofApproximateReasoning,53(3):363û395,2012.
| deFinetti,B. | TheoryofProbability. |     | JohnWiley&Sons,1974. |     |     |     |     |     |
| ------------ | -------------------- | --- | -------------------- | --- | --- | --- | --- | --- |
Diakopoulos, N. Accountability in algorithmicdecision making. ACM, 59
|     |     |     |     |     | Communications |     | of the |     |
| --- | --- | --- | --- | --- | -------------- | --- | ------ | --- |
(2):56û62,2016.
| Edwards,L. | Theeuaiact: | asummaryofitssignificanceandscope. |     |     |     |     |     |     |
| ---------- | ----------- | ---------------------------------- | --- | --- | --- | --- | --- | --- |
ArtificialIntelligence(theEU
AIAct),1:25,2021.
Frongillo,R.andKash,I. Generaltruthfulnesscharacterizationsviaconvexanalysis. InWeband
InternetEconomics: 10thInternationalConference,WINE2014, Beijing,China, December14-17,
2014.Proceedings10,pp.354û370.Springer,2014.
Gauthier,E.,Bach,F.,andJordan,M.I. Bettingonequilibrium: Monitoringstrategicbehaviorin
| multi-agentsystems. |                 | arXivpreprintarXiv:2601.05427,2026. |          |           |               |     |         |        |
| ------------------- | --------------- | ----------------------------------- | -------- | --------- | ------------- | --- | ------- | ------ |
| Gibbard,            | A. Manipulation | of voting                           | schemes: | a general | result.       |     |         |        |
|                     |                 |                                     |          |           | Econometrica: |     | journal | of the |
EconometricSociety,pp.587û601,1973.
Gneiting,T.andRaftery,A.E. Strictlyproperscoringrules,prediction,andestimation.
Journalof
theAmericanstatisticalAssociation,102(477):359û378,2007.
Gonzßlez, T., Dulce-Rubio, M., Ramdas, A., and Ribero, M. Sequentially auditing differential
| privacy. | arXivpreprintarXiv:2509.07055,2025. |     |     |     |     |     |     |     |
| -------- | ----------------------------------- | --- | --- | --- | --- | --- | --- | --- |
Grⁿnwald, P., de Heide, R., and Koolen, W. Safe testing. Journal of the Royal Statistical Society
SeriesB:StatisticalMethodology,86(5):1091û1128,2024.
Hadfield, G. K. and Clark, J. Regulatory markets: The future of ai governance. arXiv preprint
arXiv:2304.04914,2023.
Hagendorff, T. The ethics of ai ethics: An evaluation of guidelines. machines, 30(1):
Minds and
99û120,2020.
Hardt, M. The emerging science of machine learning benchmarks. Online at
https://
| mlbenchmarks.org,2025. |     |     | Manuscript. |     |     |     |     |     |
| ---------------------- | --- | --- | ----------- | --- | --- | --- | --- | --- |
He,K.,Zhang,X.,Ren,S.,andSun,J. Deepresiduallearningforimagerecognition. InProceedings
oftheIEEEconferenceoncomputervisionandpatternrecognition,pp.770û778,2016.
Hossain,S.,Chen,Y., andChen,Y. Strategichypothesistesting. arXiv preprintarXiv:2508.03289,
2025.
Huang, C., Zhang, Z., Mao, B., and Yao, X. An overview of artificial intelligence ethics.
IEEE
TransactionsonArtificialIntelligence,4(4):799û819,2022.
Huber,P.J.andStrassen,V. Minimaxtestsandtheneyman-pearsonlemmaforcapacities.
The
AnnalsofStatistics,pp.251û263,1973.
17

Hurwicz,L. Thedesignofmechanismsforresourceallocation. TheAmericanEconomicReview,63
(2):1û30,1973.
Jansen,C.,Schollmeyer,G.,Rodemann,J.,Blocher,H.,andAugustin,T. Statisticalmulticriteria
benchmarkingviathegsd-front. AdvancesinNeuralInformationProcessingSystems,37:98143û
98179,2024.
Jobin, A.,Ienca, M., andVayena, E. Theglobal landscapeof aiethics guidelines. Naturemachine
intelligence,1(9):389û399,2019.
Jⁿrgens, M., Mortier, T., Hⁿllermeier, E., Bengs, V., and Waegeman, W. A calibration test for
evaluatingset-basedepistemicuncertaintyrepresentations. MachineLearning,114(9):202,2025.
Kelly,J.L. Anewinterpretationofinformationrate. thebellsystemtechnicaljournal,35(4):917û926,
1956.
Korinek, A. and Vipra, J. Concentrating intelligence: scaling and market structure in artificial
intelligence. EconomicPolicy,40(121):225û256,2025.
Kroll,J.A. Accountablealgorithms. PhDthesis,PrincetonUniversity,2015.
Laux,J.,Wachter,S.,andMittelstadt,B. Trustworthyartificialintelligenceandtheeuropeanunion
ai act: On the conflationof trustworthiness and acceptabilityof risk. Regulation& Governance,
18(1):3û32,2024.
Levi, I. The enterprise of knowledge: An essay on knowledge, credal probability, and chance. MIT
press,1980.
Li,Q.J. Estimationofmixturemodels. YaleUniversity,1999.
Li,Y.andGoel,S. Makingitpossiblefortheauditingofai: Asystematicreviewofaiauditsandai
auditability. InformationSystemsFrontiers,27(3):1121û1151,2025.
Lohn, A. and Musser, M. How much longer can computing power, drive artificial intelligence
progress?,2022.
Maskin,E. Nashequilibriumandwelfareoptimality. TheReviewofEconomicStudies,66(1):23û38,
1999.
Mazeika, M., Phan, L., Yin, X., Zou, A., Wang, Z., Mu, N., Sakhaee, E., Li, N., Basart, S., Li, B.,
et al. Harmbench: A standardizedevaluation framework for automated red teaming and robust
refusal. arXivpreprintarXiv:2402.04249,2024.
Min,D. Screeningforexperiments. GamesandEconomicBehavior,142:73û100,2023.
Myerson,R.B. Incentivecompatibilityandthebargainingproblem. Econometrica: journalofthe
EconometricSociety,pp.61û73,1979.
Myerson,R.B. Optimalauctiondesign. MathematicsofOperationsResearch,6(1):58û73,1981.
Neyman,J.andPearson,E.S. Ix.ontheproblemofthemostefficienttestsofstatisticalhypothe-
ses. PhilosophicalTransactionsoftheRoyalSocietyofLondon.SeriesA,ContainingPapersofa
MathematicalorPhysicalCharacter,231(694-706):289û337,1933.
18

Nisan, N. et al. Introduction to mechanism design (for computer scientists).
|     |     |     |     |     |     | Algorithmic | game |
| --- | --- | --- | --- | --- | --- | ----------- | ---- |
theory,9:209û242,2007.
OÆneil, C. Weapons ofmath destruction: How bigdata increasesinequality andthreatensdemocracy.
Crown,2017.
Pasquale,F. Theblackboxsociety: Thesecretalgorithmsthatcontrolmoneyandinformation. In
Theblackboxsociety.Harvarduniversitypress,2015.
Pavel, B., Ke, I., Spirtas, M., Ryseff, J., Sabbag, L., Smith, G., Scholl, K., and Lumpkin, D. Ai and
| geopolitics: | Howmightaiaffecttheriseandfallofnations?   |     |     |     | 2023. |     |     |
| ------------ | ------------------------------------------ | --- | --- | --- | ----- | --- | --- |
| Peters,O.    | Thetimeresolutionofthestpetersburgparadox. |     |     |     |       |     |     |
PhilosophicalTransactionsoftheRoyal
SocietyA:Mathematical,PhysicalandEngineeringSciences,369(1956):4913û4931,2011.
Raji, I. D. et al. Closing the ai accountability gap: Defining an end-to-end framework for internal
| algorithmic               | auditing. | In                  |             |            |              |                 |     |
| ------------------------- | --------- | ------------------- | ----------- | ---------- | ------------ | --------------- | --- |
|                           |           | Proceedings         | of the 2020 | Conference | on Fairness, | Accountability, | and |
| Transparency(FAccT),2020. |           | Accessed2025-10-15. |             |            |              |                 |     |
Ramdas,A.andWang,R. Hypothesistestingwithe-values. arXivpreprintarXiv:2410.23614,2024.
Ramdas,A.,Grⁿnwald,P.,Vovk,V.,andShafer,G. Game-theoreticstatisticsandsafeanytime-valid
| inference. | StatisticalScience,38(4):576û601,2023. |     |     |     |     |     |     |
| ---------- | -------------------------------------- | --- | --- | --- | --- | --- | --- |
Ren,R.,Basart,S.,Khoja,A.,Gatti,A.,Phan,L.,Yin,X.,Mazeika,M.,Pan,A.,Mukobi,G.,Kim,R.,
etal. Safetywashing: Doaisafetybenchmarksactuallymeasuresafetyprogress?
Advancesin
NeuralInformationProcessingSystems,37:68559û68594,2024.
Roughgarden,T. Algorithmicgametheory. CommunicationsoftheACM,53(7):78û86,2010.
| Rudin,W. | FunctionalAnalysis. | McGraw-Hill,2ndedition,1991. |     |     |     |     |     |
| -------- | ------------------- | ---------------------------- | --- | --- | --- | --- | --- |
Sagawa,S.,Koh,P.W.,Hashimoto,T.B.,andLiang,P. DistributionallyRobustNeuralNetworks
for Group Shifts: On the Importance of Regularization for Worst-Case Generalization, April
2020. URLhttp://arxiv.org/abs/1911.08731. arXiv:1911.08731[cs,stat].
Schmid,S.,Lambach,D.,Diehl,C.,andReuter,C. Armsraceorinnovationrace? geopoliticalai
| development. | Geopolitics,pp.1û30,2025. |     |     |     |     |     |     |
| ------------ | ------------------------- | --- | --- | --- | --- | --- | --- |
Shafer, G. Testingby betting: Astrategy forstatisticalandscientific communication.
Journal of
theRoyalStatisticalSocietySeriesA:StatisticsinSociety,184(2):407û431,2021.
Shafer,G.,Shen,A.,Vereshchagin,N.,andVovk,V. Testmartingales,bayesfactorsandp-values.
2011.
Shekhar,S.andRamdas,A. Reducingsequentialchangedetectiontosequentialestimation. arXiv
preprintarXiv:2309.09111,2023.
Shevlane, T. Structured access: an emerging paradigm for safe ai deployment.
|     |     |     |     |     |     | arXiv preprint |     |
| --- | --- | --- | --- | --- | --- | -------------- | --- |
arXiv:2201.05159,2022.
Singh, A., Sabanayagam, M., Muandet, K., and Ghoshdastidar, D. Robust feature inference: A
test-timedefensestrategyusingspectralprojections. arXivpreprintarXiv:2307.11672,2023.
19

Singh, A.,Chau, S.L.,Bouabid, S.,and Muandet,K. Domaingeneralisationvia impreciselearning.
InInternationalconferenceonmachinelearning,pp.5389û5400.PMLR,2024.
Singh, A.,Chau, S.L., andMuandet, K. Truthfulelicitation ofimprecise forecasts. InConference
onUncertaintyinArtificialIntelligence,pp.3898û3919.PMLR,2025.
Solaiman,I. Thegradientofgenerativeairelease: Methodsandconsiderations. InProceedingsof
the2023ACMconferenceonfairness,accountability,andtransparency,pp.111û122,2023.
Tabassi,E. Artificialintelligenceriskmanagementframework(airmf1.0). NIST,2023.
Taddeo,M.andFloridi,L. Howaicanbeaforceforgood. Science,361(6404):751û752,2018.
Timans, A., Verma, R., Nalisnick, E., and Naesseth, C. A. On continuous monitoring of risk
violationsunderunknownshift. arXivpreprintarXiv:2506.16416,2025.
UKAISafetySummit. Capabilitiesandrisksfromfrontierai. Technicalreport,2023. Accessed
2025-10-15.
Unesco. Recommendation on the ethics of artificial intelligence. United Nations Educational,
ScientificandCulturalOrganization,2022.
Vesnic-Alujevic, L., Nascimento, S., and Polvora, A. Societal and ethical impacts of artificial
intelligence: Criticalnotes oneuropean policyframeworks. Telecommunications Policy, 44(6):
101961,2020.
Vickrey,W. Counterspeculation,auctions,andcompetitivesealedtenders. TheJournaloffinance,
16(1):8û37,1961.
Vovk, V. and Shafer, G. Game-theoretic probability. Introduction to Imprecise Probabilities, pp.
114û134,2014.
Vovk,V.,Takemura,A.,andShafer,G. Defensiveforecasting. InInternationalWorkshoponArtificial
IntelligenceandStatistics,pp.365û372.PMLR,2005.
Wah,C., Branson,S.,Welinder, P.,Perona, P.,andBelongie,S. Thecaltech-ucsdbirds-200-2011
dataset. 2011.
Walley,P. StatisticalReasoningwithImpreciseProbabilities. ChapmanandHall,London,1991.
Waudby-Smith, I. and Ramdas, A. Estimating means of bounded random variables by betting.
JournaloftheRoyalStatisticalSocietySeriesB:StatisticalMethodology,86(1):1û27,2024.
Williams,D. Probabilitywithmartingales. Cambridgeuniversitypress,1991.
Wu,T.,Jia,F.,Qi,X.,Wang,J.T.,Sehwag,V.,Mahloujifar,S.,andMittal,P. Uncoveringadversarial
risksoftest-timeadaptation. arXivpreprintarXiv:2301.12576,2023.
Xu, Z. and Ramdas, A. Online multiple testing with e-values. In International Conference on
ArtificialIntelligenceandStatistics,pp.3997û4005.PMLR,2024.
Zhou,B.,Lapedriza,A.,Khosla,A.,Oliva,A.,andTorralba,A. Places: A10millionimagedatabase
for scene recognition. IEEE transactions on pattern analysis and machine intelligence, 40(6):
1452û1464,2017.
20

Part I
Appendix
Table of Contents
| 8 ProofofTheorem                                     | 3.5 | 22  |
| ---------------------------------------------------- | --- | --- |
| 9 CharacterisationandPropertiesofObedientRegulations |     | 25  |
9.1 ProofofTheorem3.7 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
9.2 ProofofAlternateCharacterisationinTheorem 3.7 . . . . . . . . . . . . . . . . 27
ob
9.3 PropertiesoftheMechanismofAllObedientRegulations? . . . . . . . . . . 28
P0
| 10 ProofofLemma3.6       |     | 29  |
| ------------------------ | --- | --- |
| 11 ProofofProposition3.8 |     | 30  |
11.1 ProofofProposition3.8 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
| 12 ProofofProposition4.1 |     | 33  |
| ------------------------ | --- | --- |
13 BackgroundonOperationalisingRegulationswithImplicitCredalSets 36
13.1 ProofofProposition4.3 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 37
| 14 IncentivisingModelProviderstoImprove   |     | 38  |
| ----------------------------------------- | --- | --- |
| 15 ConnectiontoStrategicHypothesisTesting |     | 40  |
| 16 AdditionalExperimentalDetails          |     | 43  |
16.1 DetailsontheWaterbirdsExperimentandDataset . . . . . . . . . . . . . . . . . 43
16.2 DetailsoftheFairnessRegulationExperiment . . . . . . . . . . . . . . . . . . . 44
| 17 ChallengesinAIRegulationsBeyondStatisticalIssues |     | 45  |
| --------------------------------------------------- | --- | --- |
21

8 Proof of Theorem 3.5
Inordertoproveourmaintheoremwedefinesomeadditionalauxilaryconceptsbelow. Ingeneral
the main idea of the proof is that we look at the set of distributions that are regulated by any
regulation mechanism ? and then ask under what conditions are the regulated distributions
exactlythedistributionsthatwewanttoregulatei.e. P = {P ? ?(Z|R(P) = 0}. Tothisend
0
wedefinethesetofregulateddistributions.
Definition8.1. WedefineasetofregulateddistributionsP (?)asthesetofdistributionsthat
reg
areregulatedbyamechanism? ? C(Z). Formally,thismeansthat
P ? P (?) iff supE [?(Z)] ? C
reg P
???
Carefulreaderscannotethattheconditioninthedefinitionofregulateddistributionsissimilarto
Definition 3.2. However, in general P (?) may not be similar to P . Also, P (?) is convex
reg 0 reg
andclosedforany? ? C(Z),i.e. P (?)isalwaysacredalset. Verifyingthisisactuallyquite
reg
straightforwardandweincludethisforcompletenessoftheproof. Letusconsideranarbitrary?,
then
Claim1: (P (?)isaconvexset) Letusassumethatthereexisttwoarbitrarydistributions
reg
such that P ,P ? P (?). And for ? ? [0,1] there exists a linear combination P := ?P +
1 2 reg ? 1
(1??)P ofP andP . SinceP ,P ? P (?),
2 1 2 1 2 reg
supE [?(Z)] ? C and supE [?(Z)] ? C
Z?P1 Z?P2
??? ???
Then,
?? ? [0,1] supE [?(Z)] ? ?supE [?(Z)]+(1??)supE [?(Z)]
Z?P? Z?P1 Z?P2
??? ??? ???
(P ? sup E [?(Z)]isconvexinP)
??? P
? ?C +(1??)C (P ,P ? P (?))
1 2 reg
= C
Sincesup E [?(Z)] ? C,P ? P (?). Thisholdsforall? ? [0,1]forarbitrarychoices
??? Z?P? ? reg
ofP andP inP (?). Therefore,P (?)isaconvexsetforany?.
1 2 reg reg
Claim2: (P (?) isaclosedset) Weconsiderweak-*topologyonourspace ofprobability
reg
measures?(Z). Weknowthat? ? C(Z)isasetofbounded,non-negative,continuousfunctions,
i.e. 0 ? ?(z) ? R forallz ? Z forall? ? ?. WealsoknowthatC ? R isaconstant. Andwe
?0
definedthesetP ? ?(Z)as:
reg
(cid:26) (cid:12) (cid:27)
P (?) = P ? ?(Z) (cid:12) (cid:12) supE [?(Z)] ? C
reg P
(cid:12)
???
22

| Therefore,theconditionsup |     |     |     | E      |     | issatisfiedifandonlyifE |     |     |        | holdsfor |     |
| ------------------------- | --- | --- | --- | ------ | --- | ----------------------- | --- | --- | ------ | -------- | --- |
|                           |     |     |     | [?(Z)] | ?   | C                       |     |     | [?(Z)] | ? C      |     |
|                           |     |     | ??? | P      |     |                         |     |     | P      |          |     |
everyindividual? ?. WecanrewritethesetP (?)asanintersectionofsetsdefinedbysingle
?
reg
constraints:
|     |     |     |     |     | (cid:92) |        | E   |          |     |     |     |
| --- | --- | --- | --- | --- | -------- | ------ | --- | -------- | --- | --- | --- |
|     |     | P   | (?) | =   | {P       | ? ?(Z) | |   | [?(Z)] ? | C}  |     |     |
|     |     |     | reg |     |          |        |     | P        |     |     |     |
???
| LetusdefinetheconstituentsetsasA |     |     |     |     | :   |     |     |     |     |     |     |
| -------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
?
|     |     |     | A   | :=  | {P ? ?(Z) |     | | E [?(Z)] | ? C} |     |     |     |
| --- | --- | --- | --- | --- | --------- | --- | ---------- | ---- | --- | --- | --- |
|     |     |     |     | ?   |           |     | P          |      |     |     |     |
Now, (cid:84) , and since arbitrary intersection of closed sets is closed, in order to
| P   | (?) = | A     |     |     |     |     |     |     |     |     |     |
| --- | ----- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| reg |       | ??? ? |     |     |     |     |     |     |     |     |     |
provethatP (?)isclosedweneedtoshowthatallA areclosedsets. LetÆschooseanarbitrary
|     | reg |     |     |     |     |     | ?   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
and since is a half space in the space of distributions ?(Z), equipped with weak-*
| ? ? ? |     | A   |     |     |     |     |     |     |     |     |     |
| ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
?
topology,weneedtoshowhalfspacesofprobabilitymeasuresareclosedintheweak-*topology.
Tothisendwestatethenotionofconvergenceofasequenceofdistributions{P }? toitslimit
n
n=1
P intheweak-*topology.
(Convergence of distributions in weak-* topology) We say that a sequence of
| Definition      | 8.2. |              |     |     |                       |     |     |     |     |     |     |
| --------------- | ---- | ------------ | --- | --- | --------------------- | --- | --- | --- | --- | --- | --- |
| distributions{P | }?   | convergestoP |     |     | intheweak-*topologyif |     |     |     |     |     |     |
n n=1
|     |     |     |     | E   |       | E   |      |      |     |     |     |
| --- | --- | --- | --- | --- | ----- | --- | ---- | ---- | --- | --- | --- |
|     |     |     |     |     | [f] ? | [f] | ?f ? | C(Z) |     |     |     |
|     |     |     |     | Pn  |       | P   |      |      |     |     |     |
WithinourarbitraryA ,letusnowconsiderasequenceof{P suchthat{P P.
|              |             |     |        |              |     |     |       | }?    | ? A          | }?        | ?   |
| ------------ | ----------- | --- | ------ | ------------ | --- | --- | ----- | ----- | ------------ | --------- | --- |
|              |             | ?   |        |              |     |     |       | n n=1 | ?            | n n=1     |     |
| This implies | convergence |     | of the | expectations |     |     |       | as    |              | according | to  |
|              |             |     |        |              |     | E   | [?] ? | E [?] | ? ? ? ? C(Z) |           |     |
|              |             |     |        |              |     | Pn  |       | P     |              |           |     |
Definition 8.2. Since }? , we know that for all n. Since the limit of a
|     |     | {P  |     | ? A |     |     | E   | [?] ? C |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- | --- | --- |
|     |     | n   | n=1 | ?   |     |     | Pn  |         |     |     |     |
sequenceofnumberslessthanorequaltoC mustalsobelessthanorequaltoC thatis:
|     |     |     |     | E   | [?] = | lim | E [?] | ? C |     |     |     |
| --- | --- | --- | --- | --- | ----- | --- | ----- | --- | --- | --- | --- |
|     |     |     |     |     | P     |     | Pn    |     |     |     |     |
n??
| Hence,P   | ? A andA | isclosed.                        |     | ThereforeP |     | (?)isclosed. |     |     |     |     |     |
| --------- | -------- | -------------------------------- | --- | ---------- | --- | ------------ | --- | --- | --- | --- | --- |
|           | ?        | ?                                |     |            |     | reg          |     |     |     |     |     |
| Lemma8.3. | P =      | P (?)ifanonlyif?isimplementable. |     |            |     |              |     |     |     |     |     |
|           | 0        | reg                              |     |            |     |              |     |     |     |     |     |
Proof. (?)
Weprovethiswithcontradiction. LetusassumethatP = P (?)and?isnotimplementable.
0 reg
| FromthedefinitionofP |     |     | (?)weknowthat |     |     |     |     |     |     |     |     |
| -------------------- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- |
reg
|     |     |     |     | (cid:26) |     |     | (cid:12) |     | (cid:27) |     |     |
| --- | --- | --- | --- | -------- | --- | --- | -------- | --- | -------- | --- | --- |
(cid:12) supE
|     |     | P   | (?) | =   | P ? | ?(Z) | (cid:12) | [?(Z)] ? | C   |     |     |
| --- | --- | --- | --- | --- | --- | ---- | -------- | -------- | --- | --- | --- |
|     |     |     | reg |     |     |      | (cid:12) | P        |     |     |     |
???
SinceP = P (?),thisimpliesthat?isobedienttotheregulation. However,?isimplementable
| 0   | reg |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
which means that it must not be feasible. As a consequence of infeasibility, there must exist a
suchthat
P ? ?(Z)\P
0
|     |     |      |     | E      |     |     | supE |        |     |     | (10) |
| --- | --- | ---- | --- | ------ | --- | --- | ---- | ------ | --- | --- | ---- |
|     |     | ?? ? | ?   | [?(Z)] | ?   | C   | =?   | [?(Z)] | ? C |     |      |
|     |     |      |     | P      |     |     |      | P      |     |     |      |
???
23

| Hence,                             |     |         | by definition |     | of  | (?). | Since | we assume | that |       | , then |     | .   |
| ---------------------------------- | --- | ------- | ------------- | --- | --- | ---- | ----- | --------- | ---- | ----- | ------ | --- | --- |
|                                    | P   | ? P (?) |               |     |     | P    |       |           |      | P = P |        | P ? | P   |
|                                    |     | reg     |               |     |     | reg  |       |           |      | 0     | reg    |     | 0   |
| Thisleadstoacontradictionas(?(Z)\P |     |         |               |     |     |      |       | ?.        |      |       |        |     |     |
|                                    |     |         |               |     |     | )?P  | =     |           |      |       |        |     |     |
|                                    |     |         |               |     |     | 0    | 0     |           |      |       |        |     |     |
(?)
Weprovethisbyprovingthecontrapostive. LetusassumethatP ?= P (?). Whichresultsin
0 reg
thefollowingtwocases.
|        |     |           |     |     |      |      | Thisimpliesthat |     |     | thereexistsaP |     |     | such |
| ------ | --- | --------- | --- | --- | ---- | ---- | --------------- | --- | --- | ------------- | --- | --- | ---- |
| Case1: | ?P  | suchthatP |     | ? P | butP | ?/ P | (?)             |     |     |               |     | ? P |      |
|        |     |           |     | 0   |      | reg  |                 |     |     |               |     | 0   |      |
that sup E [?(Z)] ?? C as P ?/ P (?). Therefore, ? is not obedient. Hence, ? is not
|     |     | P   |     |     |     | reg |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
???
implementable.
?P suchthatP ? P (?)butP ?/ P . ThisimpliesthatP ? ?(Z)\P . However,
| Case2: |     |     |     | reg |     |     | 0   |     |     |     |     | 0   |     |
| ------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
sinceP ? P (?),weknowthatsup E [?(Z)] ? C. Thisreachesacontradictionand?can
|     |     | reg |     |     |     | P   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
???
| notbefeasible. |     | Hence,?isnotimplementable.       |       |     |         |     |     |               |     |     |     |     |     |
| -------------- | --- | -------------------------------- | ----- | --- | ------- | --- | --- | ------------- | --- | --- | --- | --- | --- |
| Completing     |     | the                              | Proof | of  | Theorem |     | 3.5 |               |     |     |     |     |     |
| FirstPart:     |     | Thereexistsandimplementable?iffP |       |     |         |     |     | isaCredalSet. |     |     |     |     |     |
0
We now show that the existence of an implementable regulation mechanism ? implies that
P isCredal. Assumethereexistsanimplementable?. ByLemma8.3,thisimpliesP = P (?).
| 0   |     |     |     |     |     |     |     |     |     |     | 0   | reg |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ByClaims1and2,P (?)isalwaysconvexandclosed. Therefore,P mustbeacredalset.
|     |     |     | reg |     |     |     |     |     |     | 0   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Wenowshowtheoppositedirection. AssumeP isacredalsetthenthereexistsanimplementable
0
regulation mechanism ?. We rely on the Hahn-Banach Separation Theorem (See Chapter 3
(Rudin,1991)),whichstatesthatanyclosedconvexsetistheintersectionofallclosedhalf-spaces
containingit. Therefore,foreveryQ ?/ P ,thereexistsacontinuouslinearfunctionalh ? C(Z)
|     |     |     |     |     |     | 0   |     |     |     |     |     | Q   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
suchthat:
|     |     |     |     |     | E   |         |       | E       |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ------- | ----- | ------- | --- | --- | --- | --- | --- |
|     |     |     |     | sup |     | [h (Z)] | ? C < | [h (Z)] |     |     |     |     |     |
|     |     |     |     |     | P   | Q       |       | Q Q     |     |     |     |     |     |
P?P0
Letusdefinethemechanismasthecollectionoftheseseparatinghyperplanes: }.
|     |     |     |     |     |     |     |     |     |     | ?   | = {h | | Q ?/ | P   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | ------ | --- |
|     |     |     |     |     |     |     |     |     |     |     | Q    |        | 0   |
Thesetofdistributionsregulatedbythismechanismis:
(cid:92)
E
|     |     |     |     |     | P (?) | =   | {P | | [h] ? C} |     |     |     |     |     |
| --- | --- | --- | --- | --- | ----- | --- | ---- | -------- | --- | --- | --- | --- | --- |
|     |     |     |     |     | reg   |     |      | P        |     |     |     |     |     |
h??
Bythe separationtheorem, thisintersectionis exactlyP . ThusP (?) = P . Finally,applying
|     |     |     |     |     |     |     |     | 0   | reg | 0   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Lemma8.3inthereversedirection,sinceP (?),themechanism?isimplementable.
|     |     |     |     |     |     | =   | P   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     | 0   | reg |     |     |     |     |     |     |
SecondPart: Thresholdingruleareimplementableiffr isquasiconvexandlowersemi-
continuous
We now show the second part of the Proof of Theorem 3.5 which states that there exists an
implementableregulationmechanism?forarequirementobtainedviathresholdingametricr if
andonlyifthemetricisquasi-convexandlowersemi-conitnuous.
(?)
24

AssumethatR isimplementableforall? R. ByfirstpartoftheTheorem3.5,thisimpliesthat
?
?
| thesetP? |     |      |        | ?}isaCredalSet(convexandclosed)forevery?. |     |     |     |     |     |     |     |     |     |
| -------- | --- | ---- | ------ | ----------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|          |     | = {P | | r(P) | ?                                         |     |     |     |     |     |     |     |     |     |
0
Consider any two distributions P ,P ? ?(Z) and any ? ? [0,1]. Let ?? = max(r(P ),r(P )).
|     |     |     |     |     | 1 2 |     |     |     |     |     |     | 1   | 2   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Byconstruction,r(P ) ? ?? andr(P ) ? ??,whichimpliesP ? P?? andP ? P??. SinceR is
|     |     |     | 1   |     | 2   |     |     |     | 1   | 0   | 2 0 |     | ??  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
implementable,P?? isconvex. Therefore,themixtureP mustalsobelongto
|     |     |     |     |     |     |     |     |     | = ?P | +(1??)P |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | ------- | --- | --- | --- |
|     |     |     | 0   |     |     |     |     | ?   |      | 1       | 2   |     |     |
.
P
??
|     |     |     | P   | ? P | =?  | r(P ) | ? ?? | = max(r(P |     | ),r(P )). |     |     |     |
| --- | --- | --- | --- | --- | --- | ----- | ---- | --------- | --- | --------- | --- | --- | --- |
|     |     |     |     | ?   | ??  | ?     |      |           |     | 1 2       |     |     |     |
Therefore r is quasi-convex. By the initial assumption, P? is a closed set for all ?. Since the
0
sublevelsetsofr areclosedforall?,r islowersemi-continuousbydefinition.
(?)
Assume that is quasi-convex and lower semi-continuous. We must show that is a Credal
|     |     | r   |     |     |     |     |     |     |     |     | P?  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0
Setforanyarbitrary R. WenowshowtheconvexityofP?. Let P?. Bydefinition,
|     |        |     | ? ? |             |                 |     |         |     |       | P       | ,P ? |     |     |
| --- | ------ | --- | --- | ----------- | --------------- | --- | ------- | --- | ----- | ------- | ---- | --- | --- |
|     |        |     |     |             |                 |     |         |     |       | 0 1     | 2 0  |     |     |
|     | andr(P |     |     | ?. Becauser | isquasi-convex: |     |         |     |       |         |      |     |     |
| r(P | ) ? ?  |     | ) ? |             |                 |     |         |     |       |         |      |     |     |
| 1   |        |     | 2   |             |                 |     |         |     |       |         |      |     |     |
|     |        |     |     | r(?P        | +(1??)P         | ) ? | max(r(P |     | ),r(P | )) ? ?. |      |     |     |
|     |        |     |     | 1           |                 | 2   |         |     | 1     | 2       |      |     |     |
Thus, anyconvexcombinationof pointsinP? remainsinP?. The setisconvex. Sincer islower
|     |     |     |     |     |     | 0   |     |     | 0   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
semi-continuous,itssublevelsetsareclosedbydefinition. Thus,P? isclosed. SinceP? isboth
|     |     |     |     |     |     |     |     |     |     | 0   |     | 0   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
convex and closed, it is a Credal Set. Therefore by Theorem 3.5, R is implementable for all
?
?.
9 CharacterisationandPropertiesofObedientRegulations
| 9.1 | Proof | of  | Theorem |     | 3.7 |     |     |     |     |     |     |     |     |
| --- | ----- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Proposition9.1(CharacterisationofObedientRegulations).
Givenasetmarginallyundesirable
gamblesG withrespecttoP andalldesirablegamblesD ? 0,wecancharacterisethesetofall
|     | ?0,P |     |     |     | 0   |     |     |     |     |     |     |     |     |
| --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
obedientregulationswithrespecttoP
0 as
?ob
|     |     |     |     |     | =   | {G    | +C}?D |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ----- | ----- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     | P0  | ?0,P0 |       |     | ?0  |     |     |     |     |
wheretheset{G +C} := {g+c|g ? G }. Additionally,?ob isinvariantuptotheconvex
|     |     | ?0,P0 |     |     |     | ?0,P0 |     |     |     | P0  |     |     |     |
| --- | --- | ----- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
hull of P i.e. co(P ). Formally, ? = ? ) = ? , where co(╖) is the convex hull of a set and
|     | 0   |      | 0   |     | P0  | co(P0 |     | Q   |     |     |     |     |     |
| --- | --- | ---- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
| P ? | Q ? | co(P | ).  |     |     |       |     |     |     |     |     |     |     |
| 0   |     | 0    |     |     |     |       |     |     |     |     |     |     |     |
Proof. (?)
We want to show that ?ob . Let us assume that there exists a ?? ?ob.
|     |     |     |     | ?   | {G       | +C}?D |     |     |     |     |     |     | ?   |
| --- | --- | --- | --- | --- | -------- | ----- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | P0  | ? 0 ,P 0 |       | ? 0 |     |     |     |     |     | P 0 |
Since?? ?ob whichisa setofal l n o n-negativel ic enses,?? R . Therefore,?? b y
|     | ?   |     |     |     |     |     |     |     | : Z | ?   |     | ?   | D   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | P0  |     |     |     |     |     |     |     | ?0  |     |     | ?0  |
definition. Thisfollowsfromthefactthat,D issetofalwaysdesirablegambleswhichhavea
?0
| non-negativeoutput,i.e. |     |     |     | ?g ? | D ,g : | Z ? | R . |     |     |     |     |     |     |
| ----------------------- | --- | --- | --- | ---- | ------ | --- | --- | --- | --- | --- | --- | --- | --- |
|                         |     |     |     |      | ?0     |     | ?0  |     |     |     |     |     |     |
25

Since?? ? ?ob,itfollowsfromtheDefinitionof?ob that,
P0 P0
sup E [??(Z)] ? C
P
P?P0
sup E [??(Z)?C] ? 0
P
P?P0
=? ?? ?C ? G
?0,P0
=? ?? ? {G +C}
?0,P0
(?)
We want to show that {G + C} ? D ? ?ob. Let us assume that there exists a g ?
?0,P0 ?0 P0
{G +C}?D . Sinceg ? D weknowthatg : Z ? R . Wealsothatg ? {G +C}
?0,P0 ?0 ?0 ?0 ?0,P0
whichmeansthatg ?C ? G . Therefore,
?0,P0
sup E [g(Z)?C] ? 0 (ByDefinitionofg ?C ? G )
P ?0,P0
P?P0
sup E [g(Z)] ? C and g : Z ? R =? g ? ? ob
P ?0 P0
P?P0
Hence?ob = {G +C}?D . Wenowprovethesecondpartoftheproofrelatedtoinvariance
P0 ?0,P0 ?0
ofsetofobedienceregulationsuptotheconvexhullofP .
0
Claim1: (?ob isaconvexset)Toprove?ob isaconvexset,wemustshowthataconvexmixture
ofanytwoo P b 0 edientlicensesisalsoobedie P n 0 ttoregulation. Let? ,? ? ?ob. Bydefinition,this
1 2 P0
means:
?P ? P , E [? ] ? C and E [? ] ? C
0 P 1 P 2
Consideramixture? = ?? +(1??)? forany? ? [0,1]. Wetestif? satisfiestheconstraint
? 1 2 ?
foranarbitraryP ? P :
0
E [? ] = E [?? +(1??)? ]
P ? P 1 2
Bythelinearityoftheexpectationoperator(w.r.tthefunction):
E [? ] = ?E [? ]+(1??)E [? ]
P ? P 1 P 2
Since? ? 0and(1??) ? 0,wecanapplytheinequalitiesfromStep1:
?E [? ]+(1??)E [? ] ? ?C +(1??)C
P 1 P 2
= C(?+1??) = C
Therefore,sup E [? ] ? C. Themixture? isin?.
P?P0 P ? ?
Claim1: (?isainvariantuptoconvexhullofP )Additionally,wewanttoshowthat?is
0
invariantuptoconvexhullofP . WeclaimthatthesetoflicensesobedienttoP isidenticalto
0 0
thesetoflicensesobedienttoco(P ).
0
? = ?
P0 co(P0)
26

(?)
SinceP ? co(P ),anyconstraintthatappliestothelargersetco(P )automaticallyappliesto
| 0   | 0   |     |     |     |     |     |     |     | 0   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
thesubsetP . Ifsup E [?] ? C,thentriviallysup E [?] ? C. Thus,? ? ? .
|     | 0   | Q?co(P0) |     | Q   |     |     | P?P0 | P   |     | co(P0) P0 |
| --- | --- | -------- | --- | --- | --- | --- | ---- | --- | --- | --------- |
(?)
LetQbeanydistributionin theconvexhullco(P ). Bydefinitionofaconvexhull,Qisafinite
0
| convexcombinationofelementsinP |     |     |     |     | :   |     |     |     |     |     |
| ------------------------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0
n
(cid:88)
|     |     |     |     |     | Q = | ? P |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
i i
i=1
whereP ,? 0,and(cid:80) 1. Evaluatetheexpectedcostof? underQ:
|     | ? P | ?   |     | ? = |                       |     |     |     |     |     |
| --- | --- | --- | --- | --- | --------------------- | --- | --- | --- | --- | --- |
| i   | 0 i |     |     | i   |                       |     |     |     |     |     |
|     |     |     |     |     | E [?] = E(cid:80)?iPi | [?] |     |     |     |     |
Q
Bythelinearityoftheexpectationoperator(w.r.tthemeasure):
n
(cid:88)
E
|     |     |     |     |     | [?] = | ? E  | [?] |     |     |     |
| --- | --- | --- | --- | --- | ----- | ---- | --- | --- | --- | --- |
|     |     |     |     |     | Q     | i Pi |     |     |     |     |
i=1
| Since? | ,weknowthatE |     |     |          | foralli. | Substitutingthisbound: |     |     |     |     |
| ------ | ------------ | --- | --- | -------- | -------- | ---------------------- | --- | --- | --- | --- |
| ?      | ?            |     |     | [?] ?    | C        |                        |     |     |     |     |
|        | P0           |     |     | Pi       |          |                        |     |     |     |     |
|        |              |     |     | n        |          | n                      |     |     |     |     |
|        |              |     |     | (cid:88) |          | (cid:88)               |     |     |     |     |
|        |              |     |     |          | ? E [?]  | ?                      | ? C |     |     |     |
|        |              |     |     |          | i Pi     |                        | i   |     |     |     |
|        |              |     |     | i=1      |          | i=1                    |     |     |     |     |
n
(cid:88)
|     |     |     |     |     | = C ? | = C |     |     |     |     |
| --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- |
i
i=1
| Therefore,E |              | forallQ |     | co(P             | ).  |     |         |     |     |     |
| ----------- | ------------ | ------- | --- | ---------------- | --- | --- | ------- | --- | --- | --- |
|             | [?] ?        | C       |     | ?                |     |     |         |     |     |     |
|             | Q            |         |     |                  | 0   |     |         |     |     |     |
| 9.2 Proof   | of Alternate |         |     | Characterisation |     | in  | Theorem |     | 3.7 |     |
We prove the alternate characterisation by contradiction. Let us assume that is ?ob the
Proof.
P0
collectionofalllicensesthatareobedienttoregulationandisthereforeitselfobedienttoregulation
| bydefinition. | However, |     |     |     |     |     |     |     |     |     |
| ------------- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:12)
|     |     |     |     | (cid:26)         |        |     | (cid:27) |      |     |     |
| --- | --- | --- | --- | ---------------- | ------ | --- | -------- | ---- | --- | --- |
|     |     |     | ob  | (cid:12)         | E      |     |          |      |     |     |
|     |     |     | ?   | ?= ? (cid:12)sup | [?(Z)] | ?   | C :=     | ?    | .   |     |
|     |     |     | P0  |                  | P      |     |          | C,P0 |     |     |
(cid:12)
P?P0
| Thismeansthatthereexistsa? |     |     |     | ?ob | suchthat?   |      | . Therefore, |     |     |     |
| -------------------------- | --- | --- | --- | --- | ----------- | ---- | ------------ | --- | --- | --- |
|                            |     |     |     | ?   |             | ?? ? |              |     |     |     |
|                            |     |     |     | P0  |             |      | C,P0         |     |     |     |
|                            |     |     |     |     | sup E[?(Z)] | > C  |              |     |     |     |
P?P0
27

| However,since?ob |     | followsobediencetoregulationwecansaythat |     |     |     |     |     |     |     |     |     |
| ---------------- | --- | ---------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
P0
|     |     | sup | E[??(Z)] |     | ? C | ?P ? P |     |     |     |     |     |
| --- | --- | --- | -------- | --- | --- | ------ | --- | --- | --- | --- | --- |
0
????ob
P0
|     |     |     | E[?(Z)] |     | ? C | ?P ? P |     |     |     | (Because? | ? ?ob) |
| --- | --- | --- | ------- | --- | --- | ------ | --- | --- | --- | --------- | ------ |
0
P0
E[?(Z)]
|     |     | sup |     |     | ? C |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
P?P0
Thisleadstoacontradictionhence?ob mustequal? ifitisthesetofallobedientregulations.
|     |     |     |     | P0  |     | C,P0 |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- |
9.3 Properties of the Mechanism of All Obedient Regulations ?ob
P
0
Wenowprooftheadditionalclaimswemakeabout?ob.
P0
| Proposition9.2. |     | ?ob isclosedinweak-topologyonC(Z). |     |     |     |     |     |     |     |     |     |
| --------------- | --- | ---------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
P0
Proof. Westartwiththealternatecharacterisationof?ob fromTheorem3.7,i.e.
P0
|     |     |     |     |     | (cid:26) (cid:12) |     |     | (cid:27) |     |     |     |
| --- | --- | --- | --- | --- | ----------------- | --- | --- | -------- | --- | --- | --- |
(cid:12)
|     |     |     |     | ? ob = | ? (cid:12)sup | E [?(Z)] | ? C |     |     |     |     |
| --- | --- | --- | --- | ------ | ------------- | -------- | --- | --- | --- | --- | --- |
|     |     |     |     | P0     |               | P        |     |     |     |     |     |
(cid:12)
P?P0
|     |     |     |     |     | (cid:92) {?|E |        |      |     |     |     |     |
| --- | --- | --- | --- | --- | ------------- | ------ | ---- | --- | --- | --- | --- |
|     |     |     |     | =   |               | [?(Z)] | ? C} |     |     |     |     |
P
P?P0
(cid:92)
|     |     |     |     | =   | A   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
P
P?P0
ThesetofobedientregulationsistheintersectionofhalfplanesA foreachP ? P . Therefore,
|     |     |     |     |     |     |     |     | P   |     |     | 0   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
?ob isclosedifA isclosedforeveryP asarbitraryintersectionsofclosedsetsisclosed.
|     |     |     |     |     | ? P |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| P0  |     | P   |     |     |     | 0   |     |     |     |     |     |
WenowshowthatinourspaceofcontinuousfunctionsC(Z)withcorrespondingweaktopology
induced by the dual space of probability measures ?(Z), all half spaces such as are closed.
A
P
Given an arbitrary half space, let us now consider a sequence of }? such that
|     |     | A   |     |     |     |     |     |     | {?  | ?     | A   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- |
|     |     | P   |     |     |     |     |     |     |     | n n=1 | P   |
{? }? ? ?. Then,weak-topologyonC(Z)impliesconvergenceoftheexpectationsE [? ] ?
| n   |     |     |     |     |     |     |     |     |     |     | P n |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
n=1
E [?] for every P ? ?(Z). As {? }? ? A , we know that E [? ] ? C for all n. Since the
| P   |     |     |     | n   |     | P   |     | P   | n   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
n=1
limitofasequenceofnumberslessthanorequaltoC mustalsobelessthanorequaltoC:
|     |     |     |     | E   | [?] = lim | E [? | ] ? C |     |     |     |     |
| --- | --- | --- | --- | --- | --------- | ---- | ----- | --- | --- | --- | --- |
|     |     |     |     | P   |           | P    | n     |     |     |     |     |
n??
| Hence,? | andA | isclosed. |     | Therefore?ob |     | isclosed. |     |     |     |     |     |
| ------- | ---- | --------- | --- | ------------ | --- | --------- | --- | --- | --- | --- | --- |
? A
|     | P   | P   |     |     |     | P0  |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Lemma9.3. ?ob satistiesobediencetoregulation. Additionally,theredoesnotexistsamechanismof
P0
licenses? ?? ?ob thatsatisfiesDefinition3.2w.r.tasetofdistributionsP ? ?(Z). Inotherwords
|     | P0  |     |     |     |     |     |     |     | 0   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
?ob isindeedthesetofalllicensesobedienttoregulation.
P0
28

Inorder toshow thefirst partof theclaimthat ?ob satistiesobedience toregulation, we
Proof.
P0
| verifyif?ob |     | satisfiesDefinition3.2. |     |     |     | Weknowthat |     |     |     |     |     |
| ----------- | --- | ----------------------- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- |
P0
|     |     |     |     |      |        |     |      | ob  | (ByDefinitionof?ob) |     |     |
| --- | --- | --- | --- | ---- | ------ | --- | ---- | --- | ------------------- | --- | --- |
|     |     |     |     | supE | [?(Z)] | ? C | ?? ? | ?   |                     |     |     |
|     |     |     |     |      | P      |     |      | P0  |                     |     | P0  |
P?P
|     |     |     | sup | sup E | [?(Z)] | ? C |     |     |     |     |     |
| --- | --- | --- | --- | ----- | ------ | --- | --- | --- | --- | --- | --- |
P
|     |     |     | ???ob | P?P0 |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | ---- | --- | --- | --- | --- | --- | --- | --- |
P0
|     |     |     | sup | sup E | [?(Z)] | ? C |     |     |     |     |     |
| --- | --- | --- | --- | ----- | ------ | --- | --- | --- | --- | --- | --- |
P
P?P0???ob
P0
|     |     |     |     | sup E | [?(Z)] | ? C | ?P  | ? P |     |     |     |
| --- | --- | --- | --- | ----- | ------ | --- | --- | --- | --- | --- | --- |
|     |     |     |     |       | P      |     |     | 0   |     |     |     |
???ob
P0
Hence,?ob satistiesobediencetoregulation. Forthesecondpartoftheproof,letusassumethat
P0
thereexistsa?foranarbitrarysetofdistributionsP ? ?(Z)suchthat?satisfiesDefinition3.2
0
w.r.tP . However,? ?? ?ob. Thismeansthatthereexistsa?? ? ?suchthat?? ?? ?ob. Since?
|     | 0   |     |     | P0  |     |     |     |     |     | P0  |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
satisfiesDefinition3.2,
|     |     |     |     |      |        |     |      |     | (ByDefinition |     | 3.2) |
| --- | --- | --- | --- | ---- | ------ | --- | ---- | --- | ------------- | --- | ---- |
|     |     |     |     | supE | [?(Z)] | ?   | C ?P | ? P |               |     |      |
P
???
|     |     |     |     |     | [??(Z)] |     |      |     |     |     | (?? ?) |
| --- | --- | --- | --- | --- | ------- | --- | ---- | --- | --- | --- | ------ |
|     |     |     | =?  | E   |         | ?   | C ?P | ? P |     |     | ?      |
P
|     |     |     |     | supE | [??(Z)] | ?   | C   |     |     |     |     |
| --- | --- | --- | --- | ---- | ------- | --- | --- | --- | --- | --- | --- |
P
P?P
|     |     |     |     | =? ?? | ? ? | ob  |     |     | (ByDefinitionof?ob) |     |     |
| --- | --- | --- | --- | ----- | --- | --- | --- | --- | ------------------- | --- | --- |
|     |     |     |     |       |     | P0  |     |     |                     |     | P0  |
Thisleadstoacontradictionsinceweassumedthat?? ?ob. Therefore,? ?ob.
|     |       |     |          |     |     |     |     | ??  | ?   |     |     |
| --- | ----- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |       |     |          |     |     |     |     | P0  |     | P0  |     |
| 10  | Proof |     | of Lemma |     |     | 3.6 |     |     |     |     |     |
?obd
Lemma 10.1. If is not implementable then does not exists another mechanism that is im-
|     |     |     | P 0 |     |     |     |     |      |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- |
|     |     |     |     |     | P   |     |     | ?obd |     |     |     |
plementable. Additi on ally, when 0 is a credal set, is the largest implementable mechanism.
P0
Letusassumethat?obd isnotimplementableandthereexistsasetofcontinuousfunctions
Proof.
P
R }thatis i 0 mplementable. Thismeans that,either? ?obd or? ?obd. LetÆs
| ?   | = {? | : Z ? |     |     |     |     |     |     | ?   | ??  |     |
| --- | ---- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |      |       | ?0  |     |     |     |     |     | P0  |     | P0  |
considerthesetwocasesseparately.
?obd
|     | ò CaseI:? |     | ??  |     |     |     |     |     |     |     |     |
| --- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
P0
Since ? ?? ?obd, this implies that there exists a ?? ? ? such that ?? ?? ?obd. As ? is
|     |     |     | P0  |     |     |     |     |     |     | P0  |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
implementableitmustsatisfyobediencetoregulation,i.e.
|     |     |     |     |     | supE |        |     |        | (ByDefinition3.2) |     |     |
| --- | --- | --- | --- | --- | ---- | ------ | --- | ------ | ----------------- | --- | --- |
|     |     |     |     |     |      | [?(Z)] | ? C | ?P ? P |                   |     |     |
|     |     |     |     |     |      | P      |     | 0      |                   |     |     |
???
|     |     |     |     |     | E   |         |     |        |                      |     | (11) |
| --- | --- | --- | --- | --- | --- | ------- | --- | ------ | -------------------- | --- | ---- |
|     |     |     |     | =?  |     | [??(Z)] | ? C | ?P ? P |                      |     |      |
|     |     |     |     |     |     | P       |     | 0      |                      |     |      |
|     |     |     |     |     | ??  | obd     |     |        | (ByDefinitionof?obd) |     |      |
|     |     |     |     | =?  | ?   | ?       |     |        |                      |     |      |
|     |     |     |     |     |     | P0      |     |        |                      |     | P0   |
This leads to a contradiction, therefore any ? ?? ?obd cannot be implementable if ?obd is
|     |     |     |     |     |     |     |     | P0  |     |     | P0  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
notimplementable.
29

|     | ò        |     | ?obd |     |     |     |     |     |     |     |     |     |     |
| --- | -------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | CaseII:? |     | ?    |     |     |     |     |     |     |     |     |     |     |
P0
Since? ? ?obd. ?isobedienttoregulationsbydefinition. Since?isimplementableitmust
P0
also satisfy feasibility. Which means that for every P ? ?(Z)\P there exists a ? ? ?
0
|     |           |     |        |     |                     |     |     | ?obd. |          |     | mustalsobelongto?obd. |     |     |
| --- | --------- | --- | ------ | --- | ------------------- | --- | --- | ----- | -------- | --- | --------------------- | --- | --- |
|     | suchthatE |     | [?(Z)] |     | > C. However,since? |     |     | ?     | Anysuch? |     |                       |     |     |
|     |           |     | P      |     |                     |     |     |       | P        |     |                       |     | P   |
Which mak es ?obd feasible. Since ?obd is obedien t 0 by definition, it is also implementab l 0 e.
|     |     |     |     | P   |     |     | P   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
This leads to a c o 0 ntradiction, and th e 0 refore ?obd cannot be implementable if ?obd is
|     |     |     |     |     |     |     |     | ? ? |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     |     | P0  |     |     |     | P0  |
notimplementable.
Hence,if?obd
isnotimplementabletheredoesnotexistanyimplementablemechanism. Wenow
P0
moveonthesecondpartofourproofwhereweshowthatwhenP isthecredalset,i.e. whenan
0
implementablemechanismexists,?obd isthelargestimplementablemechanism. Letusassume
P0
that is a credal set which means that there exists an implementable mechanism and this
|     | P   |     |     |     |     |     |     |     |     |     |     |     | ?   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0
mechanism is bigger than ?obd. Then implies that ?obd and ?obd, and hence
|           |     |     |                 |     |     |     |     | ? ?= |     | ?   | ??  |     | ?? ? ? |
| --------- | --- | --- | --------------- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | ------ |
|           |     |     |                 |     | P 0 |     |     |      | P0  |     | P0  |     |        |
| suchthat? |     | ??  | ?obd. Therefore |     | ,   |     |     |      |     |     |     |     |        |
P0
|     |     |     |     |     |     | ?P ? P | s.t. | E [?(Z)] | >   | C   |     |     |     |
| --- | --- | --- | --- | --- | --- | ------ | ---- | -------- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |        | 0    | P        |     |     |     |     |     |
Thisdirectlycontradictsthat?satisfiesObediencetoRegulation(Defintion3.2). Hence?obd is
P0
| thelargestimplementablemechanismwhenP |     |     |     |     |     |     |     | isacredalset. |     |     |     |     |     |
| ------------------------------------- | --- | --- | --- | --- | --- | --- | --- | ------------- | --- | --- | --- | --- | --- |
0
| 11  | Proof |     | of  | Proposition |     |     | 3.8 |     |     |     |     |     |     |
| --- | ----- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
To prove the proposition 3.8 we first prove some auxiliary statements which help us with our
mainproof.
|                  |     |     |         |     |     | R   |      | RandanysetP |          |        |          |     |     |
| ---------------- | --- | --- | ------- | --- | --- | --- | ---- | ----------- | -------- | ------ | -------- | --- | --- |
| Proposition11.1. |     |     | Forany? |     | : Z | ?   | ,? ? |             |          | wehave |          |     |     |
|                  |     |     |         |     |     | ?0  |      |             |          | 0      |          |     |     |
|                  |     |     |         |     |     |     |      |             | (cid:40) |        | (cid:41) |     |     |
min{E
|     |     |     |     | sup |     | [?(z)],?} |     | ? min | sup[?(z)],? |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --------- | --- | ----- | ----------- | --- | --- | --- | --- |
P
|     |     |     |     | P?P0 |     |     |     |     | P?P0 |     |     |     |     |
| --- | --- | --- | --- | ---- | --- | --- | --- | --- | ---- | --- | --- | --- | --- |
Proof. Withthedefinitionofminweknowthat
|     |     |     |     | min{E |           |     | E      | and | min{E |     |           |     |        |
| --- | --- | --- | --- | ----- | --------- | --- | ------ | --- | ----- | --- | --------- | --- | ------ |
|     |     |     |     |       | [?(z)],?} | ?   | [?(z)] |     |       |     | [?(z)],?} | ? ? | ?P ? P |
|     |     |     |     |       | P         |     | P      |     |       | P   |           |     | 0      |
=? sup min{E [?(z)],?} ? sup E [?(z)] and sup min{E [?(z)],?} ? ?
|     |     |      |     | P   |     |      | P   |     |      |          | P   |          |     |
| --- | --- | ---- | --- | --- | --- | ---- | --- | --- | ---- | -------- | --- | -------- | --- |
|     |     | P?P0 |     |     |     | P?P0 |     |     | P?P0 |          |     |          |     |
|     |     |      |     |     |     |      |     |     |      | (cid:40) |     | (cid:41) |     |
min{E
|     |     |     |     | =?  | sup |     | [?(z)],?} | ?   | min | sup[?(z)],? |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- | ----------- | --- | --- | --- |
P
|     |     |     |     |     | P?P0 |     |     |     |     | P?P0 |     |     |     |
| --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | ---- | --- | --- | --- |
Proposition11.2. Givenasetofnon-negativeboundedmeasurablefunctions
|     |     |     | (cid:40) |     | (cid:12) |     |     |     |     |     |     | (cid:41) |     |
| --- | --- | --- | -------- | --- | -------- | --- | --- | --- | --- | --- | --- | -------- | --- |
(cid:12)
?L = ? ? L(Z)(cid:12) sup E [?(z)] ? C and 0 ? ?(z) ? R ?z ? Z
|     |     | P0  |     |     | (cid:12) | P   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:12)P?P0
| Then(?ob,||╖|| |     |     | )isdensein(?L |     |     | ,||╖|| | )forallP | ? ?(Z). |     |     |     |     |     |
| -------------- | --- | --- | ------------- | --- | --- | ------ | -------- | ------- | --- | --- | --- | --- | --- |
|                |     | P0  | 1             |     | P0  |        | 1        | 0       |     |     |     |     |     |
30

Proof. Foranarbitrary? ? ?L P0 thereexistsasequenceof{g n } n?N ?? C(Z)suchthat{g n } n?N ?
? asC(Z)isdenseinL(Z)underL norm. Wenowclampg intogÿ asfollows:
1 n n
?
0 ifg (z) ? 0
? ? n
gÿ (z) = R ifg (z) ? R
n n
? ?g (z) otherwise
n
Therefore,
|gÿ (z)??(z)| ? |g (z)??(z)| ?z ? Z ?n ? N
n n
=? |gÿ ??| ? |g ??| ?n ? N
n 1 n 1
Since lim |g ? ?| = 0 we can say that {gÿ } also converges to ?. We now transform
n?? n 1 n n?N
the sequence {gÿ } into another sequence {? } such that ? ? ?ob. Let us consider a
? ? ?ob where n su n? p N E [? ] := C ?? forso n m n e ?N ? > 0. Wenow n const P r 0 uctour? ? ?ob as
ref P0 P?P P ref n P0
follows
? (z) := (1?? )gÿ (z)+? ? (z) ?n ? N
n n n n ref
where? ? [0,1]. Ifgÿ ? ?ob wecanset? = 0otherwisewecanselectasuitable? forevery
n ? N as
n
? = ?n w
n
here ?
P0
:= sup E
n
[gÿ (z)]?C. Note that ? > 0 otherwise
n
gÿ ? ?ob.
Therefore,?
n
=
?n+
?n
?
? [0,1]
n
. Also,fo
P
r
?
e
P
v
0
ery
P
n
n
? N
n n P0
n ?n+?
sup E [? (z)] = sup(1?? )E [gÿ (z)]+? E [? (z)]
P n n P n n P ref
P?P0 P?P0
? (1?? ) sup E [gÿ (z)]+? sup E [? (z)]
n P n n P ref
P?P0 P?P0
(cid:32) (cid:33)(cid:32) (cid:33) (cid:32) (cid:33)
? ?
n n
= 1? C +? + C ??
n
? +? ? +?
n n
(cid:32) (cid:33)
C? ? C? ?
n n n n
= C ? + 1? ? + ? ?
n
? +? ? +? ? +? ? +?
n n n n
(cid:32) (cid:33)
? +? ?? ?
n n n
= C ? ? ? ?
n
? +? ? +?
n n
? ?
n n
= C + ? ? ?
? +? ? +?
n n
= C
Hence {pi } ? ?ob. Given that {gÿ } converges to ?. Hence lim ? = 0 and hence
lim ? n = n? 0 N . Ther P e 0 fore {pi } ? n ? n ob ?N also converges to ? ? ?LP . n? H ? enc n e (?ob,||╖|| ) is
n?? n n n?N P0 0 P0 1
densein(?L ,||╖|| ).
P0 1
31

| 11.1 | Proof | of  | Proposition |     | 3.8 |     |     |     |     |     |     |     |     |     |
| ---- | ----- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
NowletÆsbeginwiththeproofofthemainclaimsinProposition3.8. GivenProposition11.2we
| canwritetheoptimisationinEq.4over?ob |     |     |     |     |     |     | as  |     |     |     |     |     |     |     |
| ------------------------------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
P0
|     |     |     |     |     | (cid:40) |     | (cid:12) |     |     |     |     |     |     | (cid:41) |
| --- | --- | --- | --- | --- | -------- | --- | -------- | --- | --- | --- | --- | --- | --- | -------- |
(cid:12)
| argmaxE | [?(z)]where?L |     |     |     |     |              |          | E      |     | and0 |        |     |      |     |
| ------- | ------------- | --- | --- | --- | --- | ------------ | -------- | ------ | --- | ---- | ------ | --- | ---- | --- |
|         |               |     |     | =   | ? ? | L(Z)(cid:12) | sup      | [?(z)] | ?   | C    | ? ?(z) | ? R | ?z ? | Z   |
|         | Q             |     |     | P0  |     |              | (cid:12) | P      |     |      |        |     |      |     |
(cid:12)P?P0
???L
P0
(12)
since?ob isdensein?L . WenowanalysethesolutiontooptimisationinEq.4withrespectto
|                              | P0  |     | P0  |     |         |     |     |     |     |     |     |     |     |     |
| ---------------------------- | --- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| therelaxedoptimisationover?L |     |     |     |     | inEq12. |     |     |     |     |     |     |     |     |     |
P0
LetasassumeanarbitraryagentwithtypeQwhotriestooptimiseEquation12. Wemake
Proof.
anobservationaboutthegloballyoptimal?? ,i.e. thegloballyoptimalresponsemaxesoutthe
ob,Q
constraintsof?ob,i.e. sup E [?? ] = C. Weproofthisviacontradiction. Letusassumethat
|     |     |     |     | P?P0 | P ob,Q |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | ---- | ------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
P0
thereexistsaoptimalresponse?? suchthatK := sup E [?? (z)] < C. Weassumethat
|     |     |     |     |     | ob,Q |     |     |     | P?P0 | P   | ob,Q |     |     |     |
| --- | --- | --- | --- | --- | ---- | --- | --- | --- | ---- | --- | ---- | --- | --- | --- |
C < R,thenletusconsideranother?ÿ (z) = min{C?? (z),R}. Firstweverifythat?ÿ ? ?ob.
|     |     |     |     |     |     | Q   |     | ob,Q |     |     |     |     | Q   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     | K    |     |     |     |     |     | P0  |
C
|     |     |     | ||?ÿ | || = | supmin{ |     | ??   | (z),R} | ?   | supR | = R |     |     |     |
| --- | --- | --- | ---- | ---- | ------- | --- | ---- | ------ | --- | ---- | --- | --- | --- | --- |
|     |     |     |      | Q ?  |         |     | ob,Q |        |     |      |     |     |     |     |
K
|           |     |     |               |     | z?Z |     |     |     |     | z?Z |     |     |     |     |
| --------- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Hence||?ÿ |     | R.  | Additionally, |     |     |     |     |     |     |     |     |     |     |     |
|| ?
Q ?
|     |      | E   |            |       | E (cid:2) | (cid:8) |        |        | (cid:9)(cid:3) |     |                       |     |     |     |
| --- | ---- | --- | ---------- | ----- | --------- | ------- | ------ | ------ | -------------- | --- | --------------------- | --- | --- | --- |
|     | sup  |     | [? (z)]    | = sup |           | min     | C??    | (z),R  |                |     |                       |     |     |     |
|     |      | P   | (cid:101)Q |       | P         |         | K ob,Q |        |                |     |                       |     |     |     |
|     | P?P0 |     |            | P?P0  |           |         |        |        |                |     |                       |     |     |     |
|     |      |     |            |       |           | (cid:8) |        |        | (cid:9)        |     |                       |     |     |     |
|     |      |     |            | ? sup | min       | CE      | [??    | (z)],R |                |     | (Jensen;minisconcave) |     |     |     |
|     |      |     |            |       |           |         | P ob,Q |        |                |     |                       |     |     |     |
K
P?P0
|     |     |     |     |       | (cid:26) |     |        |        | (cid:27) |     |     |                   |     |     |
| --- | --- | --- | --- | ----- | -------- | --- | ------ | ------ | -------- | --- | --- | ----------------- | --- | --- |
|     |     |     |     |       |          | CE  | [??    |        |          |     |     | (Proposition11.1) |     |     |
|     |     |     |     | ? min | sup      |     |        | (z)],R |          |     |     |                   |     |     |
|     |     |     |     |       |          | K   | P ob,Q |        |          |     |     |                   |     |     |
P?P0
|     |     |     |     | = min{C,R} |     |     |     |     |     |     | (K := sup | E   | [??    | (z)]) |
| --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --------- | --- | ------ | ----- |
|     |     |     |     |            |     |     |     |     |     |     | P?P0      |     | P ob,Q |       |
= C
| Wealsoknowthat||?? |     |     | ||   | ?   | R. Therefore, |       |          |             |     |          |     |     |     |     |
| ------------------ | --- | --- | ---- | --- | ------------- | ----- | -------- | ----------- | --- | -------- | --- | --- | --- | --- |
|                    |     |     | ob,Q | ?   |               |       |          |             |     |          |     |     |     |     |
|                    |     |     |      |     | ??            |       | min{??   |             |     |          |     |     |     |     |
|                    |     |     |      |     | ob,Q          | (z) ? |          | ob,Q (z),R} |     | ?z       | ? Z |     |     |     |
|                    |     |     |      |     |               |       | (cid:40) |             |     | (cid:41) |     |     |     |     |
C
|     |     |     |     |     |     | <   | min | ??  | (z),R |     | ?z ? Z |     | (K  | < C) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | ------ | --- | --- | ---- |
ob,Q
K
|     |     |     |     |     |     |     | (cid:34) | (cid:40) |     |     | (cid:41)(cid:35) |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | -------- | --- | --- | ---------------- | --- | --- | --- |
C
|     |     |     | =?  | E [?? | (z)] | <   | E min |     | ??   | (z),R |     |     |     |     |
| --- | --- | --- | --- | ----- | ---- | --- | ----- | --- | ---- | ----- | --- | --- | --- | --- |
|     |     |     |     | Q     | ob,Q |     | Q     |     | ob,Q |       |     |     |     |     |
K
|     |     |     |     |     |     | =   | E [?ÿ | (z)] |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | ---- | --- | --- | --- | --- | --- | --- |
Q Q
Thus,wearriveatacontradictionandthereforeforanoptimal?? (z),sup E [?? (z)] = C.
|     |     |     |     |     |     |     |     |     |     | ob,Q |     | P   | ob,Q |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | ---- | --- |
P?P0
This means that one or more constraints would be active i.e. ?P ,P ? P which is identified
|     |     |     |     |     |     |     |     |     |     | 1   | 2 0 |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
with the dual variables ? and ? that are non-zero. Since P is a compact credal set, any
|     |     |     |     | 1   | 2   |     |     |     |     | 0   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
convex combination of constraints results in a unique P ? P such that ?E [?? (z)]+(1?
|     |     |     |     |     |     |     |     |     |     | 0   | P1  | ob,Q |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- |
32

?)E [?? (z)] = C where? = ?1 . ThisimpliesthatE [?? (z)] = C andsinceP
isac P r 2 ed o a b l ,Q set?P +(1??)P ? ?1 P +? .2Therefore,thereexis ? t P s 1 P +(1 ? ?? P )P2 su o c b h ,Q thatE [?? (z)] = C 0 .
1 2 0 0 P ob,Q
Wenowshowthattheoptimallicenseisoftheform,
? R ifdQ(z) > ?
? ? dP(z)
?? (z) = ?R where0 < ? < 1if dQ(z) = ?
ob,Q dP(z)
?
?0 dQ(z) < ?
dP(z)
Where ?? (z) is attained for the ? such that E [?? (z)] = C. We denote such ? as ??. Let
ob,Q P ob,Q
us consider a ? that is optimal but not of the form ?? (z). Note, E [?(z)] is also C since P is
ob,Q P
uniquegiventhetypeQasP isacompactcredalset. Then,
0
(cid:90) (cid:90)
dQ(z)
[?? (z)??(z)]dQ = [?? (z)??(z)] dP
ob,Q ob,Q
dP(z)
(cid:90)
(cid:104)dQ(z) (cid:105)
= [?? (z)??(z)] ??? +?? dP
ob,Q
dP(z)
(cid:90) (cid:90)
(cid:104)dQ(z) (cid:105)
= [?? (z)??(z)] ??? dP +?? [?? (z)??(z)]dP
ob,Q
dP(z)
ob,Q
(cid:90)
(cid:104)dQ(z) (cid:105)
= [?? (z)??(z)] ??? dP
ob,Q
dP(z)
ò CaseI: dQ(z) > ??
dP(z)
Then?? (z) = R andsince0 ? ?(Z) ? R wehave
ob,Q
(cid:90) (cid:90)
(cid:104)dQ(z) (cid:105) (cid:104)dQ(z) (cid:105)
[?? (z)??(z)] ??? dP = [R??(z)] ??? dP ? 0
ob,Q
dP(z) dP(z)
ò CaseII: dQ(z) < ??
dP(z)
Then?? (z) = 0andsince0 ? ?(Z) ? R wehave
ob,Q
(cid:90) (cid:90)
(cid:104)dQ(z) (cid:105) (cid:104)dQ(z) (cid:105)
[?? (z)??(z)] ??? dP = [0??(z)] ??? dP ? 0
ob,Q
dP(z) dP(z)
Therefore,
(cid:90) (cid:90)
(cid:104)dQ(z) (cid:105)
[?? (z)??(z)] ??? dP ? 0 =? [?? (z)??(z)]dQ ? 0.
ob,Q
dP(z)
ob,Q
Andhence?? (z)isindeedtheoptimallicensewhichisanallornothingbet.
ob,Q
12 Proof of Proposition 4.1
Proof. Thebestresponseofariskaverseagentwhomaynotknowtheirtypeisdescribedby
?? = arg max E [log(?(Z))]?C
Z?P
???ob
P0
33

Thentheaboveoptimisationtaskcanbere-writtenas
|     |     | max E  | [log(?(Z))] |     | subjectto |     | sup  | E   | [?(Z)] ? | C   |     |     |     |
| --- | --- | ------ | ----------- | --- | --------- | --- | ---- | --- | -------- | --- | --- | --- | --- |
|     |     |        | Z?P         |     |           |     |      | P   |          |     |     |     |     |
|     |     | ???o b |             |     |           |     |      |     |          |     |     |     |     |
|     |     | P      |             |     |           |     | P?P0 |     |          |     |     |     |     |
0
|     |     | E     |              |     | subjectto |     |      | E   |           |     |     | (DividingbyC) |     |
| --- | --- | ----- | ------------ | --- | --------- | --- | ---- | --- | --------- | --- | --- | ------------- | --- |
|     |     | max   | [log(?ÿ(Z))] |     |           |     | sup  |     | [?ÿ(Z)] ? | 1   |     |               |     |
|     |     |       | Z?P          |     |           |     |      | P   |           |     |     |               |     |
|     | ?ÿ? | 1?o b |              |     |           |     | P?P0 |     |           |     |     |               |     |
C P
0
We since the above optimisation task is a constraint optimisation problem over the scaled con-
|     |     | ÿob | 1?ob |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
strained set ? := = {?ÿ : Z ? [0, R]|sup E [?ÿ(z)] ? 1}. We consider the
|     |     | P0  | C P0 |     |     |     | C   | P?P0 | P   |     |     |     |     |
| --- | --- | --- | ---- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- |
Lagrangian of the above optimisation problem to reduce the constrained optimisation to an
unconstrainedversion.
(cid:33)
|     |     | (cid:90) |     |     | (cid:90) |     | (cid:18)(cid:90) |     |     |     | (cid:90) |     |     |
| --- | --- | -------- | --- | --- | -------- | --- | ---------------- | --- | --- | --- | -------- | --- | --- |
R
L(?ÿ,?,?) := log(?ÿ(z))dQ(z)? ?(P) ?ÿ(z)dP(z)?C ? ?(z)(?ÿ(z)? )dz
C
|     |     | Z   |     |     | P0  |     |     | Z   |     |     | Z   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:124) (cid:123)(cid:122) (cid:125) (cid:124) (cid:123)(cid:122) (cid:125)
|     |     |     | Objective |     | (cid:124) |     |           | (cid:123) (cid:122) |     | (cid:125) |          | R constraints |     |
| --- | --- | --- | --------- | --- | --------- | --- | --------- | ------------------- | --- | --------- | -------- | ------------- | --- |
|     |     |     |           |     |           |     | Obedience | C onstraints        |     |           | ||?ÿ||?? |               |     |
C
Where? : P ? R and? : Z ? R aredualvariables. Sincedualvariablesarenon-negative
|     |     | 0   | ?0  |     | ?0  |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
we interpret their normalised versions as ? and ╡ which then act as measures on P and Z
0
respectively. The necessary conditions for ?ÿ? is that ? L(?ÿ,?,╡) = 0. Therefore, taking the
?ÿ
derivativewithrespectto?ÿ
(cid:90)
| Q(z) |     |               |     |     |     |     |        |     |     | Q(z) |     | Q(z) |     |
| ---- | --- | ------------- | --- | --- | --- | --- | ------ | --- | --- | ---- | --- | ---- | --- |
|      | ?   | P(z)?(P)??(z) |     | =   | 0   | =?  | ?ÿ?(z) | =   |     |      |     | =    |     |
(cid:82)
| ?ÿ(z) |     |     |     |     |     |     |     |     | P(z)?(P)+?(z) |     |     | P (z)+?(z) |     |
| ----- | --- | --- | --- | --- | --- | --- | --- | --- | ------------- | --- | --- | ---------- | --- |
|       |     | P0  |     |     |     |     |     |     |               |     |     | ?          |     |
P0
WeknowthatP isacredalsetandP (cid:82) P(z)d?(P)thereforeisalsoadistributionwithin
|     |     |     |     |     | (z) | :=  |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | 0   |     |     | ?   |     | P   |     |     |     |     |     |     |
. LetÆs try to simplyfy the expres sion for 0 ?(z) further, we know from the complementary
| P   |     |     |     |     |     |     | ?ÿ  |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
0
slacknessconditionsthat?(z)(?ÿ?(z)? R) = 0andthat?(z) ? 0forallz ? Z. Letsconsiderthe
C
followingtwocases,
|     | ò CaseI: | Q(z) | R.  |     |     |     |     |     |     |     |     |     |     |
| --- | -------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
<
|     |     | P (z) | C   |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
?
Since Q(z) R itimpliesthat Q(z) R as?(z) 0. Therefore,?ÿ?(z) R andhence
|     |     | <     |     |     |            |     | <   |     | ?   |     |     | <   |     |
| --- | --- | ----- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | P (z) | C   |     | P (z)+?(z) |     | C   |     |     |     |     | C   |     |
|     |     | ?     |     |     | ?          |     |     |     |     |     |     |     |     |
?(z) = 0bycomplementaryslackness. Thismeansthat,?ÿ?(z) = Q(z)
P ? (z)
|     | ò CaseII: | Q(z) | R.  |     |     |     |     |     |     |     |     |     |     |
| --- | --------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
>
|     |     | P (z) | C   |     |     |     |     |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
?
Then there exists a ?(z) > 0, i.e. ?(z) := CQ(z) ? P (z) such that Q(z) = R, i.e.
?
|     |     |     |     |     |     |     |     | R   |     |     |     | P ? (z)+?(z) | C   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --- |
R. Whichagreeswiththecomplemntaryslacknessconditionsince?(z) 0and
|     | ?ÿ?(z) | =   |     |     |     |     |     |     |     |     |     |     | >   |
| --- | ------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
C
|     |        | R,therefore?(z)(?ÿ?(z)? |     |     |     | R)  | 0.  |     |     |     |     |     |     |
| --- | ------ | ----------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | ?ÿ?(z) | =                       |     |     |     |     | =   |     |     |     |     |     |     |
|     |        | C                       |     |     |     | C   |     |     |     |     |     |     |     |
Frombothcasesweseethat
(cid:40)
|     |     |     |     |        |     | Q(z) |     | if Q(z) | < R |     |     |     |     |
| --- | --- | --- | --- | ------ | --- | ---- | --- | ------- | --- | --- | --- | --- | --- |
|     |     |     |     | ?ÿ?(z) | =   | P ?  | (z) | P ? (z) | C   |     |     |     |     |
|     |     |     |     |        |     | R    |     | if Q(z) | R   |     |     |     |     |
>
|     |     |     |     |     |     | C   |     | P (z) | C   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- |
?
34

Hence, ?ÿ?(z) = min{Q(z) , R}. In order to write the exact ?ÿ?(z) in the closed form we discuss
P (z) C
?
how can one characterise P ? P . To this end we consider the dual problem as g(?,?) :=
? 0
max L(?ÿ,?,?). Thenwecanminimisethedualobjectivetofindbest?,i.e.
?
(cid:33)
(cid:90) (cid:90) (cid:18)(cid:90) (cid:90)
ming(?,?) := min log(?ÿ?(z))dQ(z)? ?(P) ?ÿ?(z)dP(z)?1 ? ?(z)(??(z)?R)dz
? ?
Z P0 Z Z
(cid:124) (cid:123)(cid:122) (cid:125)
(cid:124) (cid:123)(cid:122) (cid:125)
:=0(complementaryslackness)
?(z)(?ÿ?(z)?R)=0(slackness)
(cid:90)
= min log(??(z))dQ(z)
?
Z
(cid:32) (cid:40) (cid:41)(cid:33)
(cid:90)
Q(z) R
= min log min , dQ(z)
? Z P ? (z) C
As we know that P ? P since P is a credal set, we can rewrite the above minimisation of ?
? 0 0
insteadintermsofP ? P ,i.e.
0
(cid:34) (cid:32) (cid:40) (cid:41)(cid:33)(cid:35)
Q(z) R
P? = arg min E log min ,
Q
P?P0 P(z) C
and?ÿ?(z) = min{ Q(z) , R}. Therefore,
P?(z) C
(cid:32) (cid:33) (cid:32) (cid:33)
(cid:90) (cid:90)
Q(z) R
P? = arg min log dQ(z)+ log dQ(z)
P?P0 {z:Q(z)?R} P(z) {z:Q(z)>R} C
P(z) C P(z) C
(cid:32) (cid:33) (cid:32) (cid:33)
(cid:90) (cid:90)
Q(z) Q(z)
= arg min log dQ(z)+ log dQ(z)
P?P0 {z:Q(z)?R} P(z) {z:Q(z)>R} P(z)
P(z) C P(z) C
(cid:32) (cid:33) (cid:32) (cid:33)
(cid:90) (cid:90)
Q(z) R
? log dQ(z)+ log dQ(z)
P(z) C
{z:Q(z)>R} {z:Q(z)>R}
P(z) C P(z) C
(cid:32) (cid:33) (cid:32) (cid:33) (cid:32) (cid:33)
(cid:90) (cid:90) (cid:90)
Q(z) Q(z) R
= arg min log dQ(z)? log dQ(z)+ log dQ(z)
P?P0 Z P(z) {z:Q(z)>R} P(z) {z:Q(z)>R} C
P(z) C P(z) C
(cid:32) (cid:33)
(cid:90)
Q(z)C
=? P? = arg min KL(Q||P)? log dQ(z)
P?P0 {z:Q(z)>R} P(z)R
P(z) C
Given we now have the optimal solution ?ÿ ? ? ÿob is related to optimal solution ?? ? ?ob as
P0 P0
?ob = C? ÿob,wesaythat??(z) = C?ÿ(z).
P0 P0
?? ? argmaxE [log(?)] = argmaxE [log(C ╖?)] = argmax(logC +E [log(?ÿ)]).
Q Q Q
???ob ??C?ÿob ?ÿ??ÿob (cid:124)(cid:123)(cid:122)(cid:125)
P0 P0 P0 constant
35

Therefore,
|     | (cid:40) |      |     | (cid:41) |     |     |     |     |          |     | (cid:32) | (cid:33) |
| --- | -------- | ---- | --- | -------- | --- | --- | --- | --- | -------- | --- | -------- | -------- |
|     |          | Q(z) |     |          |     |     |     |     | (cid:90) |     | Q(z)C    |          |
where
| ??(z) = | min | C     | ,R  |     | P? = | arg min | KL(Q||P)? |     |             | log |       | dQ(z) |
| ------- | --- | ----- | --- | --- | ---- | ------- | --------- | --- | ----------- | --- | ----- | ----- |
|         |     | P?(z) |     |     |      | P?P0    |           |     | {z:CQ(z)>R} |     | P(z)R |       |
P(z)
| 13 Background |     |        |     | on Operationalising |     |     |     | Regulations |     | with | Im- |     |
| ------------- | --- | ------ | --- | ------------------- | --- | --- | --- | ----------- | --- | ---- | --- | --- |
| plicit        |     | Credal |     | Sets                |     |     |     |             |     |      |     |     |
In this section, we do a quick review of the background concepts underpinning our proof of
Proposition4.3whichallowstheregulatorsbuildimplementablemechanismswithimplicitcredal
sets. We focus specifically focusing on filtrations, martingales, and predictable processes. For
moredetailedtechnicalexpositionreadersmayrefertoWilliams(1991).
Definition13.1(FiltrationsandMeasurability). Givena probability space(?,F,P),afiltration
| isanon-decreasingsequenceofsub-?-algebras(F |     |     |     |     |     |     | ) suchthat: |     |     |     |     |     |
| ------------------------------------------- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- |
n n?0
|     |     |     |     | F ? | F ? ╖╖╖ | ? F | ? ╖╖╖ | ? F. |     |     |     | (13) |
| --- | --- | --- | --- | --- | ------- | --- | ----- | ---- | --- | --- | --- | ---- |
|     |     |     |     | 0   | 1       | n   |       |      |     |     |     |      |
Intuitively,F representstheinformationavailableattimen. Inourcontext,ifZ ,Z ,... isthe
|     |     | n   |     |     |     |     |     |     |     | 1   | 2   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
sequenceofobservedevidence,thenaturalfiltrationisdefinedasF ),withF
|     |     |     |     |     |     |     |     |     | = ?(Z ,...,Z |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --- | --- | --- |
|     |     |     |     |     |     |     |     |     | n 1          |     | n   | 0   |
being the trivial ?-algebra {?,?}. A stochastic process is said to be to
|     |     |     |     |     |     |     | M   | = (M | )   |     | adapted |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | ------- | --- |
n n?1
the filtration if is -measurable for all n. A key concept in defining valid betting
|     |     | (F )  |     | M F |     |     |     |     |     |     |     |     |
| --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | n n?0 |     | n n |     |     |     |     |     |     |     |     |
strategies is predictability. A process is called predictable with respect to the
|     |     |     |     |     | M = (M | )     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ------ | ----- | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     |        | n n?1 |     |     |     |     |     |     |
filtration(F ) ifM is measurablewith respectto theprevious timestepÆs information,F .
|     | n   | n?0 | n   |     |     |     |     |     |     |     |     | n?1 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Formally, for all n ? 1, M is F -measurable. This property ensures that a betting strategy
|     |     |     |     | n n?1 |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
(suchasthechoiceof? )dependsonlyonpastobservationsandnotontheoutcomeofthecurrent
n
round.
(Martingales and Supermartingales). Given a probability space (?,F,P), a
| Definition | 13.2 |     |     |     |     |     |     |     |     |     |     |     |
| ---------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
stochastic process M = (M ) adapted to a filtration (F ) is called a martingale with
|            |            |     |     | n n?0  |       |     |                 | n   | n?0 |     |     |      |
| ---------- | ---------- | --- | --- | ------ | ----- | --- | --------------- | --- | --- | --- | --- | ---- |
| respecttoP | if,foralln |     |     | ? 1:   |       |     |                 |     |     |     |     |      |
|            |            |     |     | E      |       |     | P-almostsurely. |     |     |     |     | (14) |
|            |            |     |     | [M | F | ] = M |     |                 |     |     |     |     |      |
|            |            |     |     | P n    | n?1   | n?1 |                 |     |     |     |     |      |
Similarly,M iscalledasupermartingalewithrespecttoP iftheexpectedfuturevalue
= (M )
|     |     |     | n n?0 |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
isnon-increasing:
|     |     |     |     | E      |       |     | P-almostsurely. |     |     |     |     | (15) |
| --- | --- | --- | --- | ------ | ----- | --- | --------------- | --- | --- | --- | --- | ---- |
|     |     |     |     | [M | F | ] ? M |     |                 |     |     |     |     |      |
|     |     |     |     | P n    | n?1   | n?1 |                 |     |     |     |     |      |
Themartingale representsa ôfairgameöbetween aforecaster andthenature wherethe expected
future value, given current information, equals the current value. Whereas super-martingales
representgamesthatareunfavourable(oratbestneutral)totheforecaster. Bythetowerproperty
ofconditionalexpectation,thisimpliesE[M E[M ]foralln. Weencouragethereadertorefer
] ?
|     |     |     |     |     | n   |     | 0   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
toVovketal.(2005)foradetailedexpositionoftheseqeuntialforecastinggameinterpretation.
36

This allows martingales to be used in hypothesis testing, as a martingale M with respect to a
n
distributionP atanystepnwouldinexpectationnotbemorethanM . Therefore,wecantreat
0
thevalueofM tobetheevidenceagainstthenull. However,inmanysettingsthenullhypothesis
n
isnota singledistributionbutasetof distributionsP ,oftenreferred toasacompositenull. To
0
thisend,wedefineatest(super)-martingale
Definition13.3(TestSupermartingale(Shaferetal.,2011)). Let(?,(F ) )beafilteredmea-
n n?0
surablespace,andletP beasetofprobabilitymeasureson(?,F). Then,aprocess(M ) isa
0 n n?0
testsupermartingalewithrespecttotheclassP if:
0
1. M isnon-negativeandadaptedtoF foralln ? 0,
n n
2. M = 1almostsurely,and
0
3. ForeverydistributionP ? P andalln ? 1,M isasupermartingaleunderP:
0 n
E [M | F ] ? M P-almostsurely. (16)
P n n?1 n?1
Thisconditionimpliesthat(M )yieldsvalidevidenceagainsttheentire setP . Althoughnotpart
n 0
of the original definition, it is easyto verify that (M ) is a test supermatringale withrespect
n n?0
toconv(P ),whereconv(╖)denotestheconvexhull. Thuswiththeclosureoftheconvexhull,the
0
process(M ) testsagainstanimplicitcredalsetconv(P ).
n n?0 0
13.1 Proof of Proposition 4.3
Proof. Thetheproofconsistsoftwoparts. First,weshowthatthemechanismsatisfiesobedience
(Definition 3.2) by proving that (? ) is a test supermartingale under the null hypothesis.
n n?0
Second,weshowfeasibility (Definition3.3)bydemonstratingexponentialgrowthundercompliant
distributions. Since the thresholding on ? occurs only once at the end when the license is
n
provided,wecaneffectivelyignorethethresholdinouranalysisforobedienceandfocusonthe
casewherelicensevalueislessthanR.
Part 1: Obedience. Let F = ?(z ,...,z ) be the natural filtration. Recall that our license
n 1 n
evolves as a wealth process i.e. ? = ? (1 + ? (h(z ) ? ?)). Consider any non-compliant
n n?1 n n
distributionP ? P . ByAssumption4.2,foranyP ? P ,wehaveE [h(z)] ? ?.
0 0 P
Takingtheconditionalexpectationof? withrespecttoF :
n n?1
E [? | F ] = E [? (1+? (h(z )??)) | F ]
P n n?1 P n?1 n n n?1
= ? (1+? (E [h(z ) | F ]??)).
n?1 n P n n?1
Here,? and? arefactoredoutoftheexpectationbecause? isF -measurableandthe
n?1 n n?1 n?1
strategy ? is predictable (determined by F ). Since z is i.i.d., E [h(z ) | F ] = E [h(z)].
n n?1 n P n n?1 P
SubstitutingthenullconstraintE [h(z)]?? ? 0:
P
E [? | F ] ? ? (1+? ╖0) = ? .
P n n?1 n?1 n n?1
This inequality confirms that (? ) is a non-negative super-martingale with respect to any
n n?0
P ? P . By the defining property of super-martingales, E [? ] ? E [? ] = C for all n ? N.
0 P n P 0
Consequently,themechanismsatisfiesobedience.
37

Now,considera compliantdistributionQsuchthatR(Q) 1. ByAssump-
| Part2: | Feasibility. |     |     |     |     |     |     |     |     | =   |
| ------ | ------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
tion4.2,thisimpliesE ?. Weexaminetheexpectedwealthgrowthunderafixedstrategy
[h(z)] >
Q
|     | [0,B]. | Sincez arei.i.d.,theexpectationfactorizes: |     |     |     |     |     |     |     |     |
| --- | ------ | ------------------------------------------ | --- | --- | --- | --- | --- | --- | --- | --- |
? ?
t
|     |     |     |     |     |     | (cid:34) |     |     | (cid:35) |     |
| --- | --- | --- | --- | --- | --- | -------- | --- | --- | -------- | --- |
n
(cid:89)
|     |     |     |     | E [? ] = | C ╖E | (1+?(h(z |     | )??)) |     |     |
| --- | --- | --- | --- | -------- | ---- | -------- | --- | ----- | --- | --- |
|     |     |     |     | Q n      | Q    |          |     | t     |     |     |
t=1
n
(cid:89)
E
|     |     |     |     | =   | C   | [1+?(h(z)??)] |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ------------- | --- | --- | --- | --- |
Q
t=1
|     |     |     |     |     | n (cid:32) |     |     |     | (cid:33) |     |
| --- | --- | --- | --- | --- | ---------- | --- | --- | --- | -------- | --- |
(cid:89)
1+?(E
|     |     |     |     | =   | C   |     | [h(z)]??) |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- |
Q
t=1
|     |     |     |     | =   | C(1+?(E |     | [h(z)]??))n. |     |     |     |
| --- | --- | --- | --- | --- | ------- | --- | ------------ | --- | --- | --- |
Q
| Let? |     | E        |     | 0. ThegrowthfactorisG(?) |     |     |     |      | . Since? | 0,thederivative |
| ---- | --- | -------- | --- | ------------------------ | --- | --- | --- | ---- | -------- | --------------- |
|      | =   | [h(z)]?? | >   |                          |     |     | =   | 1+?? |          | >               |
|      | Q   | Q        |     |                          |     |     |     |      | Q        | Q               |
ofthegrowthfactorwithrespectto?ispositiveat? 0. Thus,thereexistsasufficientlysmall
=
?? (satisfying the admissibility constraint ??(h(z) almost surely) such that
|       | > 0 |     |     |     |     | 1   | +   | ?   | ?) ? 0 |     |
| ----- | --- | --- | --- | --- | --- | --- | --- | --- | ------ | --- |
| G(??) | >   | 1.  |     |     |     |     |     |     |        |     |
For this choice of ??, we have E C(G(??))n. Since 1, the expected value of
|     |     |     |     | [?  | ] = |     |     | G(??) | >   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- |
Q n
thewealthprocess E ]divergesto?withenoughsamples. However,toassignthe
|     |     | lim |     | [?  |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     | n?? | Q n |     |     |     |     |     |     |
license we would threshold it to R. Thus, for any compliant Q, there exists a strategy ?? that
yieldsexpectedlicensestrictlygreaterthanC foralln,satisfyingthefeasibility.
| 14  | Incentivising |     |     | Model | Providers |     |     | to Improve |     |     |
| --- | ------------- | --- | --- | ----- | --------- | --- | --- | ---------- | --- | --- |
Todiscusshowcanregulationmechanismsincentivisemodelproviderstoimproveregulatorsneed
toquantifywhichevidencedistributionsarebetterthanothersinordertoformalisethenotion
ofimprovement. Tothisend,wedefineapreferencerelationship?onthespaceofevidencesZ
as
(Evidence Preference). A regulation requirement induces an incomplete
| Definition           |     | 14.1 |                         |     |     |     |     |     | R   |     |
| -------------------- | --- | ---- | ----------------------- | --- | --- | --- | --- | --- | --- | --- |
| preferencerelation(? |     |      | )onthespaceofevidenceZ. |     |     |     |     |     |     |     |
R
Theabove definitionstates thatin lightofa regulationrequirement aregulator hasapreference
forevidencei.e. assumethatZ ,Z ? Z areevidencesgeneratedbymodelsf andf respectively,
|     |     |     |     | 1 2 |     |     |     |     |     | 1 2 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
andR(f whileR(f respectively. ThenZ . Assumingthespaceofevidence
|     |     | ) = 1 |     | ) = 0 |     |     | ?   | Z   |     |     |
| --- | --- | ----- | --- | ----- | --- | --- | --- | --- | --- | --- |
|     |     | 1     |     | 2     |     |     | 1   | R 2 |     |     |
has a natural total order ?, then the must agree with this total order. For example, letÆs
| Z   |     |     |     |     | ?   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
R
assumetheevidencetobesomelossvaluei.e. R ,thenthetotalorderforloss
|     |     |     |     |     |     | Z = | ?(f(x),y) | ?   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- |
?0
wouldbeZ ifZ ,i.e. lowerthelossthe bettertheevidence. Thisallowsusto discuss
|     |     | ? Z | <   | Z   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | 1 2 | 1   | 2   |     |     |     |     |     |     |
aseconddesirablepropertyofamechanism?. Ideally,fromtheperspectiveofthemodeldesigner
who is presented with a regulation mechanism, they must not be penalised for improving upon
their evidence. We call such a mechanism improvement incentivising from the perspective of the
modelprovider. Abenevolentregulatorwouldalsoencourageimprovementoftheevidencefrom
themodelprovidersthusaligningtheirincentives. Formallywedefineimprovementincentive
as
38

Definition14.2(ImprovementIncentivisingMechanism). Assumingadesignercanmaketwo
models and such that they produce risks distributions and such that E
|     | f   | f   |     |     |     |     |     |     |     | P P |     |      | [Z] ? |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | ----- |
|     | 1   |     | 2   |     |     |     |     |     |     | 1 2 |     | Z?P1 |       |
E [Z]thenaMechanismoflicenseshasimprovementincentiveif
Z?P2
|     |     |     |     | maxE |     |        |     | maxE |      |        |     |     | (17) |
| --- | --- | --- | --- | ---- | --- | ------ | --- | ---- | ---- | ------ | --- | --- | ---- |
|     |     |     |     |      |     | [?(Z)] |     | >    |      | [?(Z)] |     |     |      |
|     |     |     |     |      |     | Z?P1   |     |      | Z?P0 |        |     |     |      |
|     |     |     |     |      | ??? |        |     | ???  |      |        |     |     |      |
Definition14.2statesthatforamodeldesignerwhoinvestseffortinimprovingtheirmodeland
thusprovidesbetterevidenceon average,thelicensing functionmustensure abetterexpected
revenue for that agent and hence present an incentive to strive for making a better model. An
improvement incentivising mechanism ? based on the outcomes, encourages self-governance.
Wealso discuss that the monotonicity of themechanism in evidence total order is sufficient to
ensureselfgovernance.
Proposition14.3. Amechanism?hasimprovementincentiveaccordingtoDef14.2ifforall? ? ?,
? ismonotoneintotalorderonZ.
Withoutanylossofgeneralityletusassumethatthepreferencerelation?onZ issuch
Proof.
that smaller the evidence the better, as in case of loss values. Therefore, in order to show that
mechanism?mustbemonotoneinthepreferenceorderofZ,weneedtoshowthatevery?
|     |     |     |     |     |     |     |     |     |     |     |     |     | ? ? |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ismonotonicallydecreasinginZ. (?)Letusassumethatthelicensefunctionmechanism?is
| monotonicallydecreasinginz |     |     |     |      | forevery? |       | ? ?. | Thatis, |     |              |     |     |     |
| -------------------------- | --- | --- | --- | ---- | --------- | ----- | ---- | ------- | --- | ------------ | --- | --- | --- |
|                            |     |     | ?z  | ,z ? | Z         | z < z | =?   | ?(z     | ) > | ?(z ) ?? ? ? |     |     |     |
|                            |     |     |     | 1 2  |           | 1     | 2    |         | 1   | 2            |     |     |     |
Fromwhichwecansaythat,foranytwodistributionsP andP in?(Z),whichareinducedby
|         |     |      |                     |     |     |     |     |     | 1   | 2   |     |     |     |
| ------- | --- | ---- | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| modelsf |     | andf | ,thefollowingholds, |     |     |     |     |     |     |     |     |     |     |
1 2
|     |     | E    | [Z] < | E    | [Z] | =?  | E    | [?(Z)] | >   | E [?(Z)] | ?? ? | ?   | (18) |
| --- | --- | ---- | ----- | ---- | --- | --- | ---- | ------ | --- | -------- | ---- | --- | ---- |
|     |     | Z?P1 |       | Z?P2 |     |     | Z?P1 |        |     | Z?P2     |      |     |      |
Intutively, for reductingthe expectedvalue of randomvariable Z, the distributionP must put
1
largermassonsmallervaluesofZ ascomparedtoP andsince? ismonotonicallydecreasing,for
2
smallervaluesofZ itwillbelarger,thusmakingtheexpectationE [?(Z)]largerincomparison
Z?P1
| toE | [?(Z)]. |     |     |     |     |     |     |     |     |     |     |     |     |
| --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Z?P2
|     | E    | [Z] | < E  | [Z] | maxE |      | [?(Z)] | >   | maxE | [?(Z)] (fromEq.18) |     |     | (19) |
| --- | ---- | --- | ---- | --- | ---- | ---- | ------ | --- | ---- | ------------------ | --- | --- | ---- |
|     | Z?P1 |     | Z?P2 |     |      | Z?P1 |        |     |      | Z?P2               |     |     |      |
|     |      |     |      |     | ???  |      |        |     | ???  |                    |     |     |      |
Since Equation 18 is elementwise valid for all ? ? ? we can say that max E [?(Z)] >
??? Z?P1
| max | E        | [?(Z)]andthus?isincentivecompatible. |     |     |     |     |     |     |     |     |     |     |     |
| --- | -------- | ------------------------------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|     | ??? Z?P2 |                                      |     |     |     |     |     |     |     |     |     |     |     |
Whileourdiscussionontheaspectofregulationsthatincentivisemodelproviderstoimproveis
limitedwesuspectfurtherconnectionswiththeliteratureonscoringrules(Gneiting&Raftery,
2007)andpropertyelicitation(Frongillo&Kash,2014)bothwithrespecttopreciseandimprecise
probability(Bailie&Derr,2025;Singhetal.,2025)aswithinthecurrentformulation,selectinga
? ? ? can be interpreted as the elicitation of the agentÆs type (P ? ?(Z)) based on incentive
| structureaccordingto? |     |     |     | .   |     |     |     |     |     |     |     |     |     |
| --------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
R
39

| 15 Connection |     | to Strategic |     | Hypothesis |     | Testing |     |
| ------------- | --- | ------------ | --- | ---------- | --- | ------- | --- |
We now formulate our regulation problem as a classical testing procedure in a non-parametrized
fashiontohighlightitsdifferencesfromincentiveawarestatisticalprotocolintroducedabove. Our
regulation can be formulated statistical decision making problem via a composite hypothesis test
asfollows:
H : P ? {Q ? ?(Z)s.t. R(Q) = 0} H : P ? {Q ? ?(Z)s.t. R(Q) = 1} (20)
| 0   |     |     |     | 1   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
Notice that the set of evidence distributions for both hypothesis H and H characterise the
|     |     |     |     |     |     | 0   | 1   |
| --- | --- | --- | --- | --- | --- | --- | --- |
parametersoftheevidencedistributionsarisingaccordingtotheDefinition3.1. Whileclassical
hypothesistests areavalidprotocol toensureregulation theydonotincorporate theincentives
of the model providers into the problem setup. To understand this better, let us assume that
the regulator enforces the requirementRwith the hypothesis test defined in Equation 20. This
hypothesis test will have some false positive rate, which we assume to be public information.
Withtheknowledgeofthisfalsepositiverate?,strategicmodelprovidersarethenincentivised
totrainandsubmitmanyborderlineorbadmodelsforwhichthetrueP ,whenitjustifies
? H
0
theircost-benefitcalculus. The? falsepositiverateensuresthat? percentofthesemodelswill
getthroughtheregulation. Thustheclassichypothesistestsoftenhaveincentivesforthenon-
compliantmodelprovidersto strategise(Batesetal.,2022; Hossainetal.,2025). Wedemonstrate
thiswithatoyexampleforregulationbelow
Hypothesis test for effective model dimension. We consider a toy linear model for our
simulations. Wefurtherassumethatitaimstoapproximateanoriginaldatageneratingprocess
of y = xT?? + ? where ? ? N(0,?). Additionally, assume that all features affect the model
| i   | i   |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
prediction equally. We now wish to regulate the number of parameters / features used by this
model. Eitherthemodeldesignercouldbeusingallthed +1featurestomaketheprediction,
= d
0
i.e.,designeralsousesthesensitiveattributetomaximisetheirpredictioncapabilityorthedesigner
couldfollowthe regulationandonlyuse non-sensitiveattributestomake prediction. Weframe
the use of sensitive attribute as the null hypothesis and use of only non sensitive attribute as
alternativetobuildanhypothesistestforregulation. Weformalisethetestasfollows
Modelisusingsensitiveattributed
|     | H   | :                                    |     |     |     | = d +1, |     |
| --- | --- | ------------------------------------ | --- | --- | --- | ------- | --- |
|     |     | 0                                    |     |     |     | 0       |     |
|     | H   | : Modelisnotusingsensitiveattributed |     |     |     | =       | d . |
|     |     | 1                                    |     |     |     |         | 0   |
We consider the standardized quadratic error for features under OLS estimator êas the test
X ?
| statistic. ThatisQ |     |       | ê                 |     | ê ???)whichisa?2 |     | distributedandwhich |
| ------------------ | --- | ----- | ----------------- | --- | ---------------- | --- | ------------------- |
|                    | =   | n Q = | n (? ???)?(XX?)(? |     |                  |     |                     |
|                    | std | ?2    | ?2                |     |                  |     | d                   |
under suitable regularity conditions follows a chi-square distribution with degrees of freedom
equal to the effective number of parameters used in the model. Since we know the parametric
model of both null and alternative distributions and they are simple singleton hypothesis we
can use a likelihood ratio test as it is the optimal test given Neyman Pearson Lemma. Let us
denotetheteststatisticL := L(d0+1;Q) whereQ ? ?2 andL(d;Q)isthelikelihoodofsampleQ
|     |     | L   | ( d h0;Q ) |     | d   |     |     |
| --- | --- | --- | ---------- | --- | --- | --- | --- |
fromchi-squareddistributionw i t p arameterd. Und erH ,assumingthattheteststatistichasa
0
distributionP (L). Weimplement thetesttorejectH ifL > ? where? isthe1?? quantile
|     | H0  |     |     |     | 0   | ?   | ?   |
| --- | --- | --- | --- | --- | --- | --- | --- |
40

|     | Type I error vs n |     |     | Empirical Power vs n |     |     |     |
| --- | ----------------- | --- | --- | -------------------- | --- | --- | --- |
|     | 1.0               |     |     | 1.0                  |     |     |     |
Type I error (H0 true)
|     | rorre I epyT | nominal 0.05 |     |     |     |     |     |
| --- | ------------ | ------------ | --- | --- | --- | --- | --- |
|     | 0.8          |              |     | 0.8 |     |     |     |
rewoP
|     | 0.6           |       |     | 0.6 |               |            |     |
| --- | ------------- | ----- | --- | --- | ------------- | ---------- | --- |
|     | 0.4           |       |     | 0.4 |               |            |     |
|     | 0.2           |       |     | 0.2 |               |            |     |
|     |               |       |     |     | Power (1-     | , H1 true) |     |
|     | 0.0           |       |     | 0.0 |               |            |     |
|     | 50 60         | 70 80 | 90  | 50  | 60 70 80      | 90         |     |
|     | Sample size n |       |     |     | Sample size n |            |     |
Figure3: PowervsType1intheChi-squaredtestofmodelparameters/featuresi.e. d = 50and
anothersensitiveattribute
Strategic properties of a test
1.0 Null agents under the test (C/R=0.15) =C/R is worst case optimal
|     |                   | 1.0 C/R< |     |     | 1.0                     | 111 ===000...214882541 |     |
| --- | ----------------- | -------- | --- | --- | ----------------------- | ---------------------- | --- |
|     | incentive aligned | C/R      |     |     | tekram ni llun-non fo % |                        |     |
0 . 8 null agents enter
tekram ni llun fo %
|       |     | 0.8 |     |      | 0.8 |          |     |
| ----- | --- | --- | --- | ---- | --- | -------- | --- |
|       |     |     |     | =1.0 |     | .699     |     |
| 0 . 6 |     |     |     | =0.5 |     | = 0      |     |
|       |     | 0.6 |     |      | 0.6 | 1 = 1 .0 |     |
|       |     |     |     | =0.2 |     | 1        |     |
| 0.4   |     | 0.4 |     |      | 0.4 |          |     |
=0.02
| 0.2 | deters honest agents | 0.2 |     |     | 0.2 |     | =0.05 |
| --- | -------------------- | --- | --- | --- | --- | --- | ----- |
=0.15
=0.5
|        |                 | 0.0     |                  | <=0.15  | 0.0         |                      | =1.0    |
| ------ | --------------- | ------- | ---------------- | ------- | ----------- | -------------------- | ------- |
| 0.00.0 |                 | 0.0 0.2 | 0.4              | 0.6 0.8 | 1.0 0.0 0.2 | 0.4 0.6              | 0.8 1.0 |
| 0.2    | 0.4 C/R 0.6 0.8 | 1.0     |                  |         |             |                      |         |
|        |                 |         | % of null agents |         |             | % of non-null agents |         |
|        | (a)             |         | (b)              |         |             | (c)                  |         |
Figure4: Thestrategicreactionofnullandnon-nullagentsinthemarkettoregulationsviatesting.
Theabovefigures(b)and(c)assumetheincentivesinthemarketbyfixingC/R = 0.15
ofP (L),sothatweobtainstrict? type1error. Figure3showsthatforreasonablen = 80the
H0
testhaspower1undertypeIerrorcontrol. Undertheseidealtestingconditionsitbecomeseasy
forustonowillustratethestrategicaspectsofenforcingregulationsviahypothesistests.
Strategic Aspects in the test The above testing procedure for enforcing regulation ignores
theincentivestothemodeldesigners. However,inrealworldthemodeldesignersoperateunder
incentives. In this section we consider some incentives that designers may have and try to
understand their behaviour under a statistical test for regulation of use of sensitive attributes
fortraining. Letusassumethatforregulationteststheregulatorchargesafee,thiscanalsobe
understoodasthetaxtooperateinthemarket,wedenoteitusingC andweassumethatthesizeof
themarketisdenotedbyR. Ideallyaregulationimplementedbyatestmustdeternullagentsfrom
enteringthemarket,i.e. nonobedientagentsselfoptoutofthemarketwhilekeepingtheobedient
agentsinthemarket. Withthestatisticaltestproposedabovetochecktheeffectivedimensionof
themodelandthusfortheuseofsensitiveattribute,letusassumethatthefinaltestimplemented
by the regulator has false positive rate ?, the type II error ?(?) is denoted as a function of the
choice? madebytheregulatorthusthechoiceoffalsepositiveratealsodictatesthepowerofthe
test1??(?). InanEx-anteanalysiswecanobservethatnullagentsparticipationin themarket
dependsdirectlyonthis?,asforanullagent,?R meansthatthegambletoenterintothe
? C
41

market has net positive expected utility. Thus for C, the market will see full participation
|     |     |     |     |     |     | ? > |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
R
for approval by the null agents (see Fig 4 a), and because of test properties proportion of the
?
nulagents willalsoget approved(seeFig 4b). Whereas forthenon-null agents,thedecision to
participateinthemarket dependsuponthepowerofthetest i.e. whichcanbe
|     |     |     |     |     |     |     |     | (1??(?))R | ? C |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- |
seenintheFig4cthatthetoostrictvalueof? resultsinapowerbelow0.15andthuslowerthan
C resultinginnoparticipantsinthemarket. As? graduallyincreasesto? = 0.15andthusequal
R
to C thepowerofthetestincreasesresultinginmoreandmorenon-nullagentsbeingapproved
R
andeventuallyforfurtherincreasein?,nullagentsalsostarttoparticipateinmarket. Weconsider
afixed-designlinearmodelwithGaussiannoise. Thedata-generatingprocessis
|     |     |     |     | x??? |     | N(0,?2) |     |     |     | (21) |
| --- | --- | --- | --- | ---- | --- | ------- | --- | --- | --- | ---- |
|     |     |     | y   | =    | +?, | ? ?     |     |     |     |      |
|     |     |     |     | i i  |     |         |     |     |     |      |
where R is the observed output, Rd is the input and ?? Rd is the true (unknown)
| y ? |     |     |     | x   | ?   |     |     | ?   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| i   |     |     |     | i   |     |     |     |     |     |     |
parametervector,X ? Rd╫n isthefixeddesignmatrix. ? ? N(0,?2I )isazero-meanGaussian
n
noise vector with independent entries and variance ?2. Thus in the matrix notation we will
write y = X?? + ?. The agent observes (X,y) and estimates ?? via Ordinary Least Squares
(OLS):
ê
|     |     | ? = | (X?X)?1X?y |     | = ?? | +(X?X)?1X??. |     |     |     | (22) |
| --- | --- | --- | ---------- | --- | ---- | ------------ | --- | --- | --- | ---- |
Undertheseassumptions,thecovarianceoftheestimatorisCov(? ê ) = ?2(X?X)?1 = ?2? ê?1.
n
TheagentÆsriskforsomeparameter?,evaluatedusingapositivesemi-definitematrix? ê = 1X?X,
n
is
|     |      |     | 1      |         |     | 1        |           |     |     |     |
| --- | ---- | --- | ------ | ------- | --- | -------- | --------- | --- | --- | --- |
|     | R(?) | =   | E [||y | ?X?||2] | =   | E [||X?? | +??X?||2] |     |     |     |
|     |      |     | y      |         |     | ?        |           |     |     |     |
|     |      |     | n      |         | 2   | n        |           |     | 2   |     |
1
|     |     | =   | E [||X(? | ???)||2 | +?T(X? |     | ?X??)+||?||2] |     |     |     |
| --- | --- | --- | -------- | ------- | ------ | --- | ------------- | --- | --- | --- |
|     |     |     | ?        |         | 2      |     |               |     | 2   |     |
n
|     |     |     | ???)??    | ê   | ???)+?2 |     |     |     |     |     |
| --- | --- | --- | --------- | --- | ------- | --- | --- | --- | --- | --- |
|     |     | =   | (?        | (?  |         |     |     |     |     |     |
|     |     | =   | ||? ???|| | +?2 |         |     |     |     |     |     |
?ê
.
Theexpectedriskisthen
| E[R(? | ê )] = | E[||? | ???|| | ]+?2 |     |     |     |     |     |     |
| ----- | ------ | ----- | ----- | ---- | --- | --- | --- | --- | --- | --- |
?ê
1
= E[??X(X?X)?1(X?X)(X?X)?1X??]+?2
n
1
E[??X(X?X)?1X??]+?2
=
n
1
= E[tr(??X(X?X)?1X??)]++?2
n
1
tr(E[???X(X?X)?1X?])+?2
=
n
1
= tr(E[???]X(X?X)?1X?)+?2
n
|     |     | ?2                |     |     |     |     | ?2   |      | ?2d    |     |
| --- | --- | ----------------- | --- | --- | --- | --- | ---- | ---- | ------ | --- |
|     | =   | tr(X?X(X?X)?1)+?2 |     |     |     | =   | tr(I | )+?2 | = +?2. |     |
d
|     |     | n   |     |     |     |     | n   |     | n   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
42

Letusdefinetheexcessriskinthequadraticformas
|     |     |     |     |        | ê    | (?ê???)?? | ê (?ê???), |     |     |     | (23) |
| --- | --- | --- | --- | ------ | ---- | --------- | ---------- | --- | --- | --- | ---- |
|     |     |     | Q   | := R(? | )??2 | =         |            |     |     |     |      |
Since?ê???
|     | =   | (X?X)?1X?y??? |     |     | = (X?X)?1X?X??+(X?X)?1X????? |     |     |     |     | = (X?X)?1X?? |     |
| --- | --- | ------------- | --- | --- | ---------------------------- | --- | --- | --- | --- | ------------ | --- |
isalinearfunctionofamultivariateGaussian?,wehave
?2
|     |     |     | ê       | (cid:0) | (cid:1) |                  |     |     | ê?1. |     |      |
| --- | --- | --- | ------- | ------- | ------- | ---------------- | --- | --- | ---- | --- | ---- |
|     |     |     | ? ??? ? | N 0,?   |         | , ? := ?2(X?X)?1 |     | =   | ?    |     | (24) |
|     |     |     |         |         | ?ê      | ?ê               |     |     |      |     |      |
n
TheexcessriskisaquadraticformofaGaussian:
|          |                      |     |     | ê         | ???)??(? | ê ???)     | Chi-squared. |     |     |     | (25) |
| -------- | -------------------- | --- | --- | --------- | -------- | ---------- | ------------ | --- | --- | --- | ---- |
|          |                      |     | Q   | = (?      |          |            | ?            |     |     |     |      |
| Let? 1/2 | denoteasquarerootof? |     |     |           | . Then   |            |              |     |     |     |      |
| ?ê       |                      |     |     |           | ?ê       |            |              |     |     |     |      |
|          |                      |     |     | (?1/2z)?? |          | ê (?1/2z), |              |     |     |     | (26) |
|          |                      |     | Q   | =         |          |            | z ? N(0,I    |     | )   |     |      |
|          |                      |     |     |           | ?        | ?          |              | d   |     |     |      |
?2
|     |     |     |     |     |      | ê?1/2? ê ê?1/2)z |     |     |     |     | (27) |
| --- | --- | --- | --- | --- | ---- | ---------------- | --- | --- | --- | --- | ---- |
|     |     |     |     | =   | z?(? | ?                |     |     |     |     |      |
n
?2
|     |     |     |     |     | z?I |     |     |     |     |     | (28) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
|     |     |     |     | =:  |     | z   |     |     |     |     |      |
n d
?2
|     |     |     |     |     | z?z |     |     |     |     |     | (29) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- |
=
n
?2?
ThereforeQ ? where? isaChi-squaredistributionwithdegreeoffreedomdwhichdenote
|     |     | n d | d   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
theparametersinourmodel.
| 16 Additional |         |     | Experimental   |     |     | Details    |     |         |     |     |     |
| ------------- | ------- | --- | -------------- | --- | --- | ---------- | --- | ------- | --- | --- | --- |
| 16.1          | Details | on  | the Waterbirds |     |     | Experiment | and | Dataset |     |     |     |
WeillustratetheproposedregulationmechanismontheWaterbirdsdataset,astandardbenchmark
forstudyingspuriouscorrelationsinimageclassification. Thedatasetisconstructedbysuperim-
posingbirdimagesfromCUB(Wahetal.,2011)ontobackgroundscenesfromPlaces (Zhou etal.,
2017). Thetaskisbinaryclassificationbetweenlandbirdsandwaterbirds. Thetrainingdistribution
exhibitsstrongspurious correlations: 73%ofexamples are waterbirdsonwater backgroundsand
22%arelandbirdsonland,whilecounter-spuriousgroups(waterbirdsonlandandlandbirdson
water)compriseonly4%and1%ofthedata,respectively. Validationandtestsplitsarebalanced
acrossbackgroundstoevaluaterobustness. Theregulatoroperatesalicensingmarketinwhich
agentsmustprovidestatisticalevidencethattheirpredictionsdonotrelyonspuriousbackground
features. Regulatory uncertainty over baseline behaviour is modelled via a compact credal set
consistingofERM-trainedResNet-50(Heetal.,2016)model,mixedwithuniformnoisetoforma
credalsetofdistributionnotobedienttoregulation
|     |     |     | P = {P | |   | ?P  | +(1??)P |         | ? ? | [0,1]} |     |     |
| --- | --- | --- | ------ | --- | --- | ------- | ------- | --- | ------ | --- | --- |
|     |     |     | 0      |     | ERM |         | uniform |     |        |     |     |
Where P is just randomised prediction for P(Y|X = x), i.e. randomly says if a bird is
uniform
waterbirdorlandbird. Effectively,P representsthemixture ofdistributionswhichrelyonthe
0
spuriousfeatures,backgroundinformationinthecaseofERMandandrandomnoiseinthecase
| ofP | .   |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
uniform
43

|     | Table1: |     | Waterbirdsdatasetdistributionacrossdifferentsub-groups. |     |     |     |     |     |     |     |     |     |     |     |
| --- | ------- | --- | ------------------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
GroupDescription LandbirdonLand LandbirdonWater WaterbirdonLand WaterbirdonWater
| ClassLabel      |         |     |       | 0        |            |       | 0          |     | 1   |     |     | 1     |     |     |
| --------------- | ------- | --- | ----- | -------- | ---------- | ----- | ---------- | --- | --- | --- | --- | ----- | --- | --- |
| AttributeLabel  |         |     |       | 0        |            |       | 1          |     | 0   |     |     | 1     |     |     |
| GroupLabel      |         |     |       | 0        |            |       | 1          |     | 2   |     |     | 3     |     |     |
| #TrainingData   |         |     | 3,498 |          |            | 184   |            |     | 56  |     |     | 1,057 |     |     |
| #ValidationData |         |     | 467   |          |            | 466   |            |     | 133 |     |     | 133   |     |     |
| #TestData       |         |     | 2,255 |          |            | 2,255 |            |     | 642 |     |     | 642   |     |     |
| 16.2            | Details | of  | the   | Fairness | Regulation |       | Experiment |     |     |     |     |       |     |     |
We nowdiscuss theimplementation ofthe betsforfairness regulation. We considerpaireddata
for both subgroups from the distributions Y ? Bernoulli(0.1) and Y ? Bernoulli(?+0.1) for
|     |     |     |     |     |     | 0   |     |     |     | 1   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
{0.4,0.6}. We now show that our test statistic (cid:81)n is a test
| ? ? |     |     |     |     |     |     | ?   | =   | (1+? | (|Y | ?Y  | |??)) |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | ----- | --- | --- |
|     |     |     |     |     |     |     | n   |     | t=1  | t   | 0   | 1     |     |     |
super-martingalefortheimplicitcredalsetdefinedbyourrequirements. ThenfromProposition4.3
wecanarguethattheregulationmechanism? willbeobedienttoregulation. Let
:= {?[?]}
???
| usdenotetheimplicitcredalsetasP |     |     |       |     |     |     | ?}where? |     |     | |E  | ]?E |     | ]|. Wecan |     |
| ------------------------------- | --- | --- | ----- | --- | --- | --- | -------- | --- | --- | --- | --- | --- | --------- | --- |
|                                 |     |     |       |     | :=  | {P  | | ? <    |     | :=  | [Y  |     | [Y  |           |     |
|                                 |     |     |       |     | 0   |     |          |     |     | P   | 0   | P   | 1         |     |
| saythatforsomeP                 |     |     | ? P : |     |     |     |          |     |     |     |     |     |           |     |
0
|     |     |      | (cid:104) | (cid:16)          |     |        | (cid:17)(cid:105) |     |     |     |     |     |     |     |
| --- | --- | ---- | --------- | ----------------- | --- | ------ | ----------------- | --- | --- | --- | --- | --- | --- | --- |
|     | E   | [? ] | = E ?     |                   | 1+? | (? ?|Y | ?Y |)             |     |     |     |     |     |     |     |
|     | P   | n    | P         | n?1               | n   |        | 0 1               |     |     |     |     |     |     |     |
|     |     |      |           | (cid:104)(cid:16) |     |        | (cid:17)          |     |     |     |     |     |     |     |
(cid:3)
|     |     |     | = ? | E        | 1+?       | (? ?|Y             | ?Y |)     |     |       |     |     |                |     |       |
| --- | --- | --- | --- | -------- | --------- | ------------------ | --------- | --- | ----- | --- | --- | -------------- | --- | ----- |
|     |     |     | n?1 | P        | n         |                    | 0 1       |     |       |     |     |                |     |       |
|     |     |     |     | (cid:16) |           |                    | (cid:17)  |     |       |     |     |                |     |       |
|     |     |     | = ? | 1+?      | (? ?E[|Y  |                    | ?Y |])    |     |       |     | (?  | ispredictable) |     |       |
|     |     |     | n?1 |          | n         | 0                  | 1         |     |       |     |     | n              |     |       |
|     |     |     |     | (cid:16) |           |                    | (cid:17)  |     |       |     |     |                |     |       |
|     |     |     | ? ? | 1+?      | (? ?|E[Y  |                    | ?Y ]|)    |     | (|E[Y | ?Y  | ]|  | ? E[|Y         | ?Y  | |])   |
|     |     |     | n?1 |          | n         | 0                  | 1         |     |       | 0   | 1   |                | 0   | 1     |
|     |     |     |     | (cid:16) |           |                    | (cid:17)  |     |       |     |     |                |     |       |
|     |     |     | = ? | 1+?      | (? ?|E[Y  |                    | ?Y ]|)    |     |       |     |     |                | (P  | ? P ) |
|     |     |     | n?1 |          | n         | 0                  | 1         |     |       |     |     |                |     | 0     |
|     |     |     |     |          | (cid:124) | (cid:123)(cid:122) | (cid:125) |     |       |     |     |                |     |       |
?0
|     |     |     | ? ? |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
n?1
Hence ? is a super-martingale under the implicit credal set. As |Y ? Y | is not an unbiased
|     | n   |     |     |     |     |     |     |     |     | 0   | 1   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
estimator of the fairness gap ?, it is possible that have some compliant agents who satisfy the
requirementswith? < 0.6bysomeverysmallmarginaredriventoselfexcludefromthemarket.
Wenowdescribehowweimplementtheoptimalresponseviaexplicitrepresentationofthecredal
set. Wenowrephrasethenotationalittlebittodescribetheimplementation. Insteadofsubgroup
wise Bernoulli random variables and . Consider the overall prediction and an
|     |     |     |     |     | Y   | Y   |     |     |     |     | Y   | ? {0,1} |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ------- | --- | --- |
|     |     |     |     |     | 0   | 1   |     |     |     |     |     |         |     |     |
attributerandomvariableA {0,1}indicatingtheattributesthenourcredalsetcanbewritten
=
as
|     |     |     |       |     | |E   |       | 0]?E     |     |       |       |     |     |     |     |
| --- | --- | --- | ----- | --- | ---- | ----- | -------- | --- | ----- | ----- | --- | --- | --- | --- |
|     |     | P   | := {P | |   | [Y|A | =     | [Y|A     | =   | 1]| < | ?}    |     |     |     |     |
|     |     |     | 0     |     | P    |       | P        |     |       |       |     |     |     |     |
|     |     |     | = {P  | |   | |P(Y | = 1|A | = 0)?P(Y | =   | 1|A = | 1)| < | ?}  |     |     |     |
44

Forourbinaryclassificationtask,anydistributionP canbeparametrisedwithfourparame-
|     |     |     |     | ? P |     |
| --- | --- | --- | --- | --- | --- |
0
ters?,where? j)fori,j {0,1}and(cid:80) 1. Wecannowparametrise
| := P(Y | = i,A | =   | ?   |     | ? =     |
| ------ | ----- | --- | --- | --- | ------- |
| i,j    |       |     |     |     | i,j i,j |
as
P
0
|     | (cid:40) | (cid:12)           |         |     | (cid:41)     |
| --- | -------- | ------------------ | ------- | --- | ------------ |
|     |          | (cid:12) (cid:12)  | ?       | ?   | (cid:12)     |
|     |          | (cid:12) (cid:12)  | 1,0     |     | 1,1 (cid:12) |
|     | P :=     | ?                  |         | ?   | < ?          |
|     | 0        | (cid:12) (cid:12)? | +?      | ?   | +? (cid:12)  |
|     |          | (cid:12)           | 1,0 0,0 | 1,1 | 0,1          |
WenowoptimiseforP? ? P viaEquation6tocomputetheoptimallicense??.
0
17 ChallengesinAIRegulationsBeyondStatisticalIssues
Statistical or technical challenges set aside, AI regulation has several non technical challenges
compared to classic regulations in the past as there are seldom any goods or process that are
as general as ôintelligenceö and have such close human interaction. One key issue is that the
liabilityofAImodelÆsriskisfragmentedacrossmodeldesigners,datasuppliers,integrators,and
deployers,complicatingenforcement(Bertolini&Episcopo,2021;Tabassi,2023). Anotheraspectis
ofJurisdictionalfragmentationandcross-borderdeployment,whichunderminecoherentremedies
andlegalactionsondesignersor otherstakeholders(Edwards,2021;UKAISafetySummit,2023).
There areno widely adopted technical standards orcertification regimes; proprietary intellectual-
propertyandtradesecretsconflict withtransparencyandauditability(Rajietal.,2020). Supply-
chainopacityindataprovenance,labelling,andcollectionpreventsreliableforensicsalsooffer
some additionalchallenges(Bender etal., 2021). Marketconcentration of somelarge scaleservice
providers also known as ôbig-techö in compute and data creates political-economy pressures
and regulatory capture (Korinek & Vipra, 2025; Lohn & Musser, 2022). Dual-use capabilities,
adversarial gaming, and benchmark overfitting lets actors satisfy narrow tests while retaining
harmfulcapacity(Blum&Hardt,2015;Hardt,2025;Mazeikaetal.,2024). Thesethreatsarefurther
exacerbatedbytesttimeadaptationofAImodelsandlackofstrongdefencesforthesecases(Singh
et al., 2023; Wu et al., 2023). Often evidence standards in courts and agencies are immature for
probabilistic,high-dimensionaltechnicalproofs(Kroll,2015). Certificationandcontinuousaudit
impose high fixed costs that raise market-entry barriers (Raji et al., 2020). Human-in-the-loop
requirementsarehardtospecifyandbrittleinpractice(Amodeietal.,2016). Finally,culturaland
ethicalpluralism,privacytrade-offsinmonitoring,andsystemicrisksfromcorrelateddeployments
meanregulationmustreconcilecompetingvaluesunderuncertainty(Unesco,2022)andrequire
new paradigms where such pluralism is baked in (Singh et al., 2024). These legal, economic,
organizational, and security frictions interact with the information asymmetry and statistical
uncertainty,tomakeAIregulationboth harder toformulateandeasierforstakeholderstoevade
thanconventionalregulations(Brundageetal.,2018).
45
