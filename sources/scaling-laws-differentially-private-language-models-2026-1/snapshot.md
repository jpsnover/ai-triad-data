<!--
  AI Triad Research Project — Document Snapshot
  Title      : Scaling Laws for Differentially Private Language Models
  Source     : 
  Type       : pdf
  Captured   : 2026-04-09
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Scaling Laws for Differentially Private Language Models

> **Snapshot captured:** 2026-04-09
> **Source:** 
> **Type:** pdf

---
|     |     | Scaling | Laws | for | Differentially |     | Private | Language |     | Models |     |     |
| --- | --- | ------- | ---- | --- | -------------- | --- | ------- | -------- | --- | ------ | --- | --- |
RyanMcKenna1 YangsiboHuang1 AmerSinha1 BorjaBalle2 ZacharyCharles1
ChristopherA.Choquette-Choo2 BadihGhazi1 GeorgiosKaissis2 RaviKumar1 RuiboLiu2 DaYu1
ChiyuanZhang1
Abstract ThescaleofdatadrivingLLMprogressalsocreatesacritical
|     |     |     |     |     |     |     | privacychallenge. | State-of-the-artmodelstrainonmassive, |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----------------- | ------------------------------------- | --- | --- | --- | --- |
Scalinglawshaveemergedasimportantcompo-
diversedatasets(Dubeyetal.,2024;GemmaTeametal.,
nents of large language model (LLM) training 2024a)thatarealsodistributed(Carlinietal.,2024)making
| as  | they can | predict | performance | gains | through |     |              |            |               |        |          |        |
| --- | -------- | ------- | ----------- | ----- | ------- | --- | ------------ | ---------- | ------------- | ------ | -------- | ------ |
|     |          |         |             |       |         |     | it difficult | to exclude | inadvertently | shared | personal | infor- |
scale,andprovideguidanceonimportanthyper-
|           |         |      |            |                     |        |     | mation.                                 | Paradoxically,userdata,akeyprivacyconcern,is |          |                |              |           |
| --------- | ------- | ---- | ---------- | ------------------- | ------ | --- | --------------------------------------- | -------------------------------------------- | -------- | -------------- | ------------ | --------- |
| parameter | choices |      | that would | otherwise           | be ex- |     |                                         |                                              |          |                |              |           |
|           |         |      |            |                     |        |     | alsocrucialforadvancingLLMcapabilities. |                                              |          |                | Userinterac- |           |
| pensive.  | LLMs    | also | rely on    | large, high-quality |        |     |                                         |                                              |          |                |              |           |
|           |         |      |            |                     |        |     | tions provide                           | invaluable                                   | feedback | for generating |              | realistic |
trainingdatasets,likethosesourcedfrom(some- syntheticdata(Xieetal.,2024;Kurakinetal.,2023)and
timessensitive)userdata.Trainingmodelsonthis
aligningmodelswithhumanvalues(Stiennonetal.,2020),
sensitiveuserdatarequirescarefulprivacyprotec-
reflectingreal-worldusecasesbetterthanweb-scrapedtext.
tionslikedifferentialprivacy(DP).However,the
However,directtrainingonsensitiveuserdataisriskydueto
dynamicsofDPtrainingaresignificantlydiffer-
memorizationandregurgitation(Carlinietal.,2021;2023;
ent,andconsequentlytheirscalinglawsarenot Ippolito et al., 2023; Lukas et al., 2023; Biderman et al.,
| yetfullyunderstood. |     |     | Inthiswork,weestablish |     |     |     |                            |     |     |                        |     |     |
| ------------------- | --- | --- | ---------------------- | --- | --- | --- | -------------------------- | --- | --- | ---------------------- | --- | --- |
|                     |     |     |                        |     |     |     | 2023;Prashanthetal.,2025). |     |     | Thistensionùtheneedfor |     |     |
scalinglawsthataccuratelymodeltheintricacies
userdataversusprotectinguserprivacyùisaddressedby
ofDPLLMtraining,providingacompletepicture
differentialprivacy(DP)(Dworketal.,2006).
ofthecompute-privacy-utilitytrade-offsandthe
WhileDPoffersaprincipledsolutiontothetensionbetween
optimaltrainingconfigurationsinmanysettings.
datautilityandprivacyinLLMtraining,applyingitinprac-
tice,especiallytolarge-scalemodels,presentssignificant
|     |     |     |     |     |     |     | challenges. | DP mechanisms |     | like DP-SGD | (Abadi | et al., |
| --- | --- | --- | --- | --- | --- | --- | ----------- | ------------- | --- | ----------- | ------ | ------- |
1.Introduction
|     |     |     |     |     |     |     | 2016) and | its variants | introduce | computational |     | overhead, |
| --- | --- | --- | --- | --- | --- | --- | --------- | ------------ | --------- | ------------- | --- | --------- |
Largelanguagemodels(LLMs)arerevolutionizinghowwe implementationcomplexity(Subramanietal.,2021),and
|     |     |     |     |     |     |     | utilitydegradation(Bassilyetal.,2014). |     |     |     | Whileitiswell- |     |
| --- | --- | --- | --- | --- | --- | --- | -------------------------------------- | --- | --- | --- | -------------- | --- |
interactwithtechnology,poweringeverythingfrominstant
translationsandconcisesummariestocomplexreasoning known that DP-SGD benefits substantially from training
andcreativecontentgeneration(Achiametal.,2023;Gem- withverylargebatchsizes(Aniletal.,2022;Deetal.,2022;
ini Team, 2023). Training increasingly large models on Ponomarevaetal.,2023),littleworkhasbeendonetoun-
everlargerdatasetsisakeysuccessfactorfortheseLLMs, derstandtheconditionsunderwhichthisholdsincompute-
|               |        |       |         |              |     |      | constrained | settings, | i.e., when | an increase | in  | batch size |
| ------------- | ------ | ----- | ------- | ------------ | --- | ---- | ----------- | --------- | ---------- | ----------- | --- | ---------- |
| with frontier | models | being | trained | for millions | of  | GPU- |             |           |            |             |     |            |
hours (Dubey et al., 2024) and trillions of tokens (Abdin mustbecoupledwithadecreaseinmodelsizeornumberof
et al., 2024; Gemma Team et al., 2024a;b). Scaling laws iterations. Inpartduetothisrelianceonlargebatchsizes,
forneurallanguagemodelsarecrucialbecausetheyprovide the largest models trained with DP today have hundreds
a framework for understanding and predicting the perfor- ofmillions,ratherthanbillions,ofparameters(Aniletal.,
2022;Lietal.,2022;Berradaetal.,2023;Ghalebikesabi
| mance | gains achievable |     | with increased | computational |     | re- |     |     |     |     |     |     |
| ----- | ---------------- | --- | -------------- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- |
sources, and importantly, guide the optimal allocation of etal.,2023;Charlesetal.,2024;Sanderetal.,2023).
thatcomputebudgetbetweenmodelsizeanddatasetsize
|     |     |     |     |     |     |     | To train | large models | with DP, | it is crucial | to  | spend both |
| --- | --- | --- | --- | --- | --- | --- | -------- | ------------ | -------- | ------------- | --- | ---------- |
(Kaplanetal.,2020;Hoffmannetal.,2022).
|     |     |     |     |     |     |     | thecomputebudgetandtheprivacybudgetjudiciously. |     |     |     |     | In  |
| --- | --- | --- | --- | --- | --- | --- | ----------------------------------------------- | --- | --- | --- | --- | --- |
1Google 2Google thiswork,wepavethewaytowardstrainingatthebillion-
|     | Research |     | DeepMind. | Correspondence |     | to: |     |     |     |     |     |     |
| --- | -------- | --- | --------- | -------------- | --- | --- | --- | --- | --- | --- | --- | --- |
parameterscalebyinitiatingastudyonthescalinglawsof
RyanMcKenna<mckennar@google.com>.
|     |     |     |     |     |     |     | DPtraining. | Tothatend,weextendtraditionalscalinglaws |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----------- | ---------------------------------------- | --- | --- | --- | --- |
Proceedingsofthe42nd
InternationalConferenceonMachine toconsideracompute-privacy-utilitytrade-off,accounting
Learning,Vancouver,Canada.PMLR267,2025.Copyright2025
|     |     |     |     |     |     |     | for intricacies | and additional |     | variables | introduced | by DP |
| --- | --- | --- | --- | --- | --- | --- | --------------- | -------------- | --- | --------- | ---------- | ----- |
bytheauthor(s).
1

ScalingLawsforDifferentiallyPrivateLanguageModels
training. Througharigoroussetofexperiments,weempiri- Algorithm1(Informal)GeneralizedDP-SGD.
callymodelthistrade-off,andprovideathoroughanalysis AppendixB.1discussestheinformalities.
oftheseexperimentalresultstoansweranumberofscaling Input: DatasetD,noise-batchratio?»,(expected)batchsize
law-stylequestions,finding(amongotherthings)that: B,iterationsT
Output: Modelparameters?.
ò Thecomputebudgetallocationpredictedbynon-private
|                                                |     |     |     |     |     | Initializemodelparameters? |     |     |     | ?RM |     |     |     |
| ---------------------------------------------- | --- | --- | --- | --- | --- | -------------------------- | --- | --- | --- | --- | --- | --- | --- |
| scalinglawsisfarfromoptimalunderDP,evenforhuge |     |     |     |     |     |                            |     |     |     | 0   |     |     |     |
|                                                |     |     |     |     |     | fort=1toT                  |     |     | do  |     |     |     |     |
privacybudgets,confirmingtheneedforourstudy.
|     |     |     |     |     |     |     | Selecta(possiblyrandom)size?BminibatchB |     |     |     |     |     | ?D  |
| --- | --- | --- | --- | --- | --- | --- | --------------------------------------- | --- | --- | --- | --- | --- | --- |
t
| ò However,                                     | we  | can accurately | predict | the optimal | break- |     |     | (cid:80) |           |     |      |     |     |
| ---------------------------------------------- | --- | -------------- | ------- | ----------- | ------ | --- | --- | -------- | --------- | --- | ---- | --- | --- |
|                                                |     |                |         |             |        |     | g»= | 1        | clip(??(? |     | ;x)) |     |     |
| downofthecomputebudgetintomodelsize,batchsize, |     |                |         |             |        |     |     | B x?Bt   |           | t?1 |      |     |     |
gÿ=g»+?»N(0,1)M
anditerationsforvirtuallyanyprivacybudgetanddataset
|                                                        |     |     |     |     |     |         | ? =OptimizerUpdate(? |     |     |     | ,gÿ) |     |     |
| ------------------------------------------------------ | --- | --- | --- | --- | --- | ------- | -------------------- | --- | --- | --- | ---- | --- | --- |
| size. Thesecompute-efficienttrainingconfigurationssave |     |     |     |     |     |         | t                    |     |     | t?1 |      |     |     |
| 5╫to100╫computecomparedtobaselineconfigurations,       |     |     |     |     |     | return? |                      | T   |     |     |      |     |     |
whileretainingcomparableprivacyandutility. DP-SGD. DP-SGD is a widely used algorithm to train
| ò The optimal |     | model | size is typically | at least | an order |     |     |     |     |     |     |     |     |
| ------------- | --- | ----- | ----------------- | -------- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
neuralnetworkswithDP.ItattainsprovableDPguarantees
of magnitude smaller with DP than without. This pro- throughlimitingthecontribution(sensitivity)ofeachexam-
videsinsightintothechallengesoftraininglargebillion- plebyclippingitsgradienttosome? -norm(wlog,1),and
2
parameterorlargerlanguagemodelswithDP.
thenaddingisotropicGaussiannoisetotheaveragedclipped
ò In the DP setting, increasing the compute budget can gradients;seeAlgorithm1forpseudo-code. Ouralgorithm
sometimesyieldlittletonoreductioninthelossunless
|     |     |     |     |     |     | is  | a slight | generalization |     | of the | original | DP-SGD | (Abadi |
| --- | --- | --- | --- | --- | --- | --- | -------- | -------------- | --- | ------ | -------- | ------ | ------ |
accompaniedbyacorrespondingincreaseintheprivacy etal.,2016): toenableadaptiveoptimizers,whichareoften
budgetordatasetsize. crucialfortrainingtransformermodels,thesubroutineOpti-
|     |     |     |     |     |     | mizerUpdatecanbeanyfirst-orderoptimizer. |     |     |     |     |     | Throughout |     |
| --- | --- | --- | --- | --- | --- | ---------------------------------------- | --- | --- | --- | --- | --- | ---------- | --- |
thiswork,wesetOptimizerUpdatetobeAdam(Kingma&
2.PreliminariesandProblemSetup
Ba,2015),whichwedenoteDP-Adam.Algorithm1satisfies
OurdatasetDconsistsoftext aformalDPguaranteethatcanreadilybecomputedasa
|     |     |     | Key | Definition |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
sequences, where each indi- functionof?»,B,N,andT usingasuitableprivacyaccoun-
|     |     |     | ?   | Privacybudget |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
vidualcontributesasinglese- N Databudget tant.Thedp_accountinglibraryprovidesfunctionsthatcan
quencex = (x ,...,x )of C Computebudget efficientlyandtightlycomputetheminimumvalueof?»asa
|     |     | 1   | S   |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
S tokens, and each token is B Batchsize functionof?,?,N,andB(GoogleDPTeam,2022).
|                         |        |     | T        | Iterations      |     |                   |     |     |                                  |     |     |     |     |
| ----------------------- | ------ | --- | -------- | --------------- | --- | ----------------- | --- | --- | -------------------------------- | --- | --- | --- | --- |
| drawnfromapredefinedvo- |        |     | S        | Sequencelength  |     |                   |     |     |                                  |     |     |     |     |
|                         |        |     |          |                 |     | Noise-BatchRatio. |     |     | NotethatweparameterizeAlgorithm1 |     |     |     |     |
| cabularyV.              | WeletN |     | denote M | Modelparameters |     |                   |     |     |                                  |     |     |     |     |
intermsofthenoise-batchratio?»,whichisthestandard
| thetotalnumberofindividu- |     |     | ?»  | Noise-batchratio |     |           |     |          |       |        |                |     |           |
| ------------------------- | --- | --- | --- | ---------------- | --- | --------- | --- | -------- | ----- | ------ | -------------- | --- | --------- |
|                           |     |     |     |                  |     | deviation |     | of noise | added | to the | mean minibatch |     | gradient, |
alscontributingtothedataset.
insteadoftheusualnoisemultiplierwhichistypicallyadded
|                         |     |     |                     |     |     | tothesummedminibatchgradient. |     |     |     |     | Whilethenoisemulti- |     |     |
| ----------------------- | --- | --- | ------------------- | --- | --- | ----------------------------- | --- | --- | --- | --- | ------------------- | --- | --- |
| MaskedLanguageModeling. |     |     | Inthisworkwefocuson |     |     |                               |     |     |     |     |                     |     |     |
pliertypicallygovernstheprivacypropertiesofthemecha-
themaskedlanguagemodelingtask(Devlinetal.,2019), nism,thenoise-batchratioisabetterproxyforthedown-
| whereeachsequencehasachosenfractionp |     |     |     |      | oftokens |        |          |     |              |     |               |       |         |
| ------------------------------------ | --- | --- | --- | ---- | -------- | ------ | -------- | --- | ------------ | --- | ------------- | ----- | ------- |
|                                      |     |     |     | mask |          | stream | learning |     | performance. |     | Specifically, | there | are two |
masked out, i.e., replaced with a special masking token sources of variance in the stochastic gradient estimate gÿ:
| [MASK], | uniformly | at  | random. The | goal is to | predict the |     |     |     |     |     |     |     |     |
| ------- | --------- | --- | ----------- | ---------- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- |
(1)theminibatchestimateofthetruepopulationgradient
originaltokenforeachmaskedtokenusingtheentirecontext
and(2)theGaussiannoiseaddedtoensureDP.Priorwork
(bidirectionally). Let»xrepresenttheoriginalsequenceof has shown that the latter dominates the variance in most
tokensbutmaskedusingtheaboveprocedureandMtheids
practicalregimes(Ponomarevaetal.,2023).
ofthemaskedtokensin»x.
|     |     |     | Foragivenparametervector? |     | ?   |     |     |     |     |     |     |     |     |
| --- | --- | --- | ------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
RM,thelanguagemodeldefinesaconditionalprobability
2.1.Compute-OptimalDPTraining
| p (x | | »x) for | each | j ? M, and | the goal is to | find ? to |     |     |     |     |     |     |     |     |
| ------ | ------- | ---- | ---------- | -------------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
? j
Weareinterestedinempiricallymodelinghowthecompute-
maximizethelikelihoodofallmaskedtrainingtokens.
privacy-utilitytrade-offchangesasafunctionoftheproblem
|                      |     |     |                             |     |     | parameters. |           | Wefollowideasusedtomodelthecompute- |                    |     |         |         |         |
| -------------------- | --- | --- | --------------------------- | --- | --- | ----------- | --------- | ----------------------------------- | ------------------ | --- | ------- | ------- | ------- |
| DifferentialPrivacy. |     |     | ArandomizedmechanismAsatis- |     |     |             |           |                                     |                    |     |         |         |         |
|                      |     |     |                             |     |     | utility     | trade-off |                                     | in the non-private |     | setting | (Kaplan | et al., |
fies(?,?)-DP(Dworketal.,2006)if,foranytwodatasets
|            |        |      |                    |             |      | 2020; | Hoffmann |     | et al., | 2022), | but extend | them | to study |
| ---------- | ------ | ---- | ------------------ | ----------- | ---- | ----- | -------- | --- | ------- | ------ | ---------- | ---- | -------- |
| D, D? that | differ | by a | single individual, | all subsets | O of |       |          |     |         |        |            |      |          |
theprivatesettingbyadditionallyconsideringtheprivacy
| possibleoutputsofAand?>0,0?? |     |     |     | <1: |     |                      |     |     |     |                    |     |     |     |
| ---------------------------- | --- | --- | --- | --- | --- | -------------------- | --- | --- | --- | ------------------ | --- | --- | --- |
|                              |     |     |     |     |     | budgetanddatabudget. |     |     |     | Thekeyconceptsare: |     |     |     |
Pr[A(D)?O]?e?Pr[A(D?)?O]+?. ò Compute Budget (C) refers to the total floating point
2

ScalingLawsforDifferentiallyPrivateLanguageModels
operations(FLOPs)requiredtotrainthemodel. Weuse compute. Further,itisimportanttoconsiderthatcollapsing
the standard approximation of Kaplan et al. (2020): 6╖ theprivacyanddatabudgetstoasinglequantityisunlikely
M╖B╖S╖T tomeasurethis,whichisproportionaltothe toprovidegeneralizableinsights.
modelsize(M)andthetotalnumberoftrainingtokens
(B╖S╖T).Notethatunlikethenon-privatescalinglaws,we
3.PrivateScalingLawMethodology
useBtorepresentthenumberofexamplesinabatch(not
tokens)becausethisquantityiswhatmattersforprivacy Inthissection,wedetailourmethodologyforestimatingthe
calculations. This approximation provides a platform- validationcross-entropylossfrommodelsize,noise-batch
independent estimate of compute requirements, and is ratio,andtrainingiterations,whichinturnletsusestimate
justifiedfurtherinAppendixB.3. theutilityunderafixedcompute,privacy,anddatabudget.
| ò PrivacyBudget(?)referstothevalueof?atfixed? |     |     |     |     | in  |     |     |     |     |     |
| --------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(?,?)-DP.Wefix? = 10?8 = ?(1/N)unlessotherwise 3.1.DecouplingNoiseCalibration
| mentioned, | which | is  | a common choice | in the literature |            |                    |     |                |         |     |
| ---------- | ----- | --- | --------------- | ----------------- | ---------- | ------------------ | --- | -------------- | ------- | --- |
|            |       |     |                 |                   | A key part | of our methodology |     | is to directly | analyze | the |
(Abadietal.,2016).
DataBudget(N)referstothenumberofindividualsin impactofthenoise-batchratiofor afixedbutreasonably
ò
|     |     |     |     |     | large physical | batch | size, rather | than indirectly |     | through |
| --- | --- | --- | --- | --- | -------------- | ----- | ------------ | --------------- | --- | ------- |
thetrainingdataset,|D|,whichcanbedifferentfromthe
|     |     |     |     |     | changestotheprivacybudgetorbatchsize. |     |     |     | Viapost-hoc |     |
| --- | --- | --- | --- | --- | ------------------------------------- | --- | --- | --- | ----------- | --- |
numberofexamplesprocessedbyDP-SGDundermultiple
accounting,wewillpredictwhatcouldhappenatdifferent
| passes. | Notethatouranalysisandinsightsalsoholdin |     |     |     |     |     |     |     |     |     |
| ------- | ---------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
hypotheticalbatchsizes,anapproachthatisjustifiedbythe
themoregeneralsettingwhereindividualscancontribute
factthattypicallythenoise-batchratioistheprimarysource
multipleexamples,althoughthedatabudgetmuststillbe
ofnoiseintheminibatchgradients,outweighingthenoise
interpretedasthenumberofindividualsratherthanthe
duetominibatchsampling(Ponomarevaetal.,2023).
numberofexamples(seeAppendixB.2).
Thisdecouplingenablesforabetterunderstandingofthe
Theprivacyanddatabudgetsareabsentinmostnon-private
|              |         |      |              |                  | underlying | trade-offs. | Without | this approach, |     | the non- |
| ------------ | ------- | ---- | ------------ | ---------------- | ---------- | ----------- | ------- | -------------- | --- | -------- |
| scaling laws | because | they | often assume | that an infinite |            |             |         |                |     |          |
linearitiesinDPaccounting(detailedinSection4.5)make
streamofdataisavailableandnoprivacyprotectionsare
|     |     |     |     |     | itdifficulttoassessthese. |     | Wenotethatanaivemethodology |     |     |     |
| --- | --- | --- | --- | --- | ------------------------- | --- | --------------------------- | --- | --- | --- |
needed. Intheprivatesetting,modeltrainingisoftencon-
thattriestodirectlymodelthescalinglawasafunctionof
| strained by | both | a fixed | data budget (i.e., | a limited | set of |     |     |     |     |     |
| ----------- | ---- | ------- | ------------------ | --------- | ------ | --- | --- | --- | --- | --- |
privacybudget(withoutgoingthroughthenoise-batchratio)
examples)andafixedprivacybudget(i.e.,?inDP).Bothof
wouldeitherprovidelessinsight(bynotgeneralizingacross
theseimpactmodeltraining;thus,itiscrucialtodetermine
databudgets),orrequiremuchmorecompute.
theoptimalcomputeusagegiventheconstraintsonprivacy
anddata,byfittingascalinglawaccountingforthis. Afterdecoupling,thefunctionwewanttofitrequiresthree
|     |     |     |     |     | inputs: themodelsizeM,thenumberofiterationsT,and |     |     |     |     |     |
| --- | --- | --- | --- | --- | ------------------------------------------------ | --- | --- | --- | --- | --- |
2.2.PrivateScalingLawChallenges thenoise-batchratio1. Werequirethefunctiontobewell-
definedforabroadrangeofpossibleinputsthatcouldbe
| AdditionalScalingFactors. |     |     | Asmentionedabove,ourpri- |     |                                 |     |     |                     |     |     |
| ------------------------- | --- | --- | ------------------------ | --- | ------------------------------- | --- | --- | ------------------- | --- | --- |
|                           |     |     |                          |     | encounteredinpracticalsettings. |     |     | Wealsoneedittocover |     |     |
vatescalinglawsaccountfortheadditionaldataandprivacy
extremepointsthatmaynotbelikelytobeusefulinpractice,
| considerations | not | present | in the non-private | scaling | law                                       |     |     |     |              |     |
| -------------- | --- | ------- | ------------------ | ------- | ----------------------------------------- | --- | --- | --- | ------------ | --- |
|                |     |         |                    |         | butmayprovideadditionalscientificinsight. |     |     |     | Themethodol- |     |
studies. TheseaddcomplexitybecauseDPaddsnoisebe-
ogydescribedbelowattemptstobalancethisneedwiththe
yondwhatisintroducedthroughthestochasticityoftraining.
goalofusingcomputeresponsibly.
| WithoutDP,trainingwithabatchsizeofBforT |     |     |     | iterations |     |     |     |     |     |     |
| --------------------------------------- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- |
isroughlyequivalenttotrainingwithabatchsizeof1for
3.2.DetailedExperimentalSetup
B╖T iterations,aslongasBisbelowtheso-calledôcritical
batchsizeö(McCandlishetal.,2018;Shallueetal.,2019; ModelsandDatasets. WetrainBERTmodelsrangingin
Zhang et al., 2025). However, this relationship does not scalefromTiny(4Mparameters)toMega(778Mparame-
holdinDPsettings,andfurther,DPtrainingrequireslarger ters),summarizedinTable1. WefocusonthedefaultBERT
batchsizestomitigatetheimpactoftheaddednoise(Anil dataset, which includes approximately 3.3B words (Zhu
etal.,2022;Deetal.,2022).
|     |     |     |     |     | etal.,2015;Devlinetal.,2019)beforetokenization. |     |     |     |     | Each |
| --- | --- | --- | --- | --- | ----------------------------------------------- | --- | --- | --- | --- | ---- |
exampleistruncatedorpaddedasnecessarytoasequence
| Compute                                         | Requirements. |     | Even without | DP, exhaustive |                |        |     |     |     |     |
| ----------------------------------------------- | ------------- | --- | ------------ | -------------- | -------------- | ------ | --- | --- | --- | --- |
|                                                 |               |     |              |                | offixedlengthS | =512.2 |     |     |     |     |
| hyperparametertuningisinfeasibleforlargemodels. |               |     |              |                | DP             |        |     |     |     |     |
trainingintroducesfurthercomplexitywithadditionalhy- 1Thelearningrateisahyperparameterthatisoptimizedover
perparametersandtheneedtoadaptstandarddefaults(e.g., andnotmodeleddirectly.
2Futureworkcouldfruitfullyconsiderothersequencelengths,
learningrate)tonewregimes,necessitatingcarefulprotocol
designtoachievenear-optimalselectionwithinreasonable astheyarelikelytoshowcaseinterestingtrade-offs.
3

ScalingLawsforDifferentiallyPrivateLanguageModels
numberofiterations,18uniquenoise-batchratios,andthree
Table1.Modelsusedinthisstudy,takenfromDevlinetal.(2019).
|       |     |        |       |      |           | learning | rates.    | While one      | can directly |            | query this | data to    |
| ----- | --- | ------ | ----- | ---- | --------- | -------- | --------- | -------------- | ------------ | ---------- | ---------- | ---------- |
| Model |     | Layers | Heads | Dims | Params(M) |          |           |                |              |            |            |            |
|       |     |        |       |      |           | answer   | a variety | of interesting |              | questions, | we         | ultimately |
BertTiny 2 2 128 4.5M needtoknowwhatmighthappenin-between(andpossibly
BertMini 4 4 256 11.4M outside of) the grid points we specifically evaluated. For
| BertSmall  |     | 4           | 4   | 512         | 29M         |                                 |                 |                |           |                      |          |          |
| ---------- | --- | ----------- | --- | ----------- | ----------- | ------------------------------- | --------------- | -------------- | --------- | -------------------- | -------- | -------- |
|            |     |             |     |             |             | that, we                        | need to         | fit a function | to        | the data,            | for      | which we |
| BertMedium |     | 8           | 8   | 512         | 41M         |                                 |                 |                |           |                      |          |          |
|            |     |             |     |             |             | follow a                        | semi-parametric |                | approach. | See                  | Appendix | E for    |
| BertBase   |     | 12          | 12  | 768         | 109M        |                                 |                 |                |           |                      |          |          |
| BertLarge  |     | 24          | 16  | 1024        | 335M        | studieswithfullyparametricfits. |                 |                |           |                      |          |          |
| BertMega   |     | 24          | 24  | 1536        | 778M        |                                 |                 |                |           |                      |          |          |
|            |     |             |     |             |             | DataCleaningandSmoothing.       |                 |                |           | First,wenotethatloss |          |          |
| Optimizer. | We  | use DP-Adam |     | throughout. | We use 1000 |                                 |                 |                |           |                      |          |          |
shouldmonotonicallyincreasewithincreasednoise-batch
| steps of | learning | rate | warm-up, | followed | by exponential |     |     |     |     |     |     |     |
| -------- | -------- | ---- | -------- | -------- | -------------- | --- | --- | --- | --- | --- | --- | --- |
ratio,andmonotonicallydecreasewithincreasediterations
learningratedecay,decreasingthelearningratebyafactor
(unlesstrainingdiverges),andwewantourfittedfunction
| of 10╫  | over a   | horizon | of 128K | iterations. | We use per-       |            |      |           |              |     |                |      |
| ------- | -------- | ------- | ------- | ----------- | ----------------- | ---------- | ---- | --------- | ------------ | --- | -------------- | ---- |
|         |          |         |         |             |                   | to capture | this | property. | In practice, |     | this invariant | only |
| example | clipping | with    | an ?    | clip norm   | of 1.0 across all |            |      |           |              |     |                |      |
2
holdsapproximatelyduetoinherentvarianceinthetraining
| experiments. | Weemploythenormalizedvariantofclipping |     |     |     |     |          |          |           |     |       |               |       |
| ------------ | -------------------------------------- | --- | --- | --- | --- | -------- | -------- | --------- | --- | ----- | ------------- | ----- |
|              |                                        |     |     |     |     | process. | To clean | the data, | we  | apply | the following | post- |
proposedbyDeetal.(2022),tohelpdecouplelearningrate
processingsteps:
| tuningfromclipnorm. |     |     | Weverifiedthatthissettingeffec- |     |     |     |     |     |     |     |     |     |
| ------------------- | --- | --- | ------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
tivelyclipsmostper-examplegradients,asrecommendedin 1. Foreachmodelsizeandnoise-batchratio,weapplya
priorwork(Lietal.,2022;Deetal.,2022). rolling average over the 10 previous measurements to
|          |        |     |      |              |                | calculateasmoothedlossvalue. |     |     |     | Thiscorrespondstoan |     |     |
| -------- | ------ | --- | ---- | ------------ | -------------- | ---------------------------- | --- | --- | --- | ------------------- | --- | --- |
| Learning | Rates. | We  | tune | the learning | rate with per- |                              |     |     |     |                     |     |     |
averageover10╖100╖1024totalexamples,butdoesnot
examplegradientclippingbutnonoise,findingthattheopti-
mallearningrateisconsistently2?7acrossallmodelscales. perfectlypreservetheexpectedinvariant.
2. Foreachmodelsizeandnoise-batchratioweapplyiso-
| Withnoise,weconsiderthreelearningrates: |     |     |     |     | 2?7,2?8,2?9. |     |     |     |     |     |     |     |
| --------------------------------------- | --- | --- | --- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- |
tonicregressiontoensurethe1280lossvaluesaremono-
Thismethodologicalchoicewasbasedonearlyablations
tonicallydecreasingwithrespecttothenumberofiter-
| that showed | that | when | adding | noise the | optimal learning |         |          |       |      |            |     |             |
| ----------- | ---- | ---- | ------ | --------- | ---------------- | ------- | -------- | ----- | ---- | ---------- | --- | ----------- |
|             |      |      |        |           |                  | ations. | For each | model | size | and number | of  | iterations, |
ratedoesdecrease,butgraduallyso;seeAppendixC.7.
weapplyisotonicregressionagaintoensurethe18loss
Batch Sizes. We use a fixed physical batch size of 1024 valuesaremonotonicallyincreasingwithrespecttothe
acrossallexperiments. Viapost-hocaccounting, wewill noise-batchratio. Wedonotenforceanymonotonicity
analyzewhatcouldhappenatdifferenthypotheticalbatch
withrespecttomodelsize.
| sizes, under | the | assumption |     | that cross-entropy | primarily |     |     |     |     |     |     |     |
| ------------ | --- | ---------- | --- | ------------------ | --------- | --- | --- | --- | --- | --- | --- | --- |
Weuseisotonicregressiontoenforcedesiredmonotonic-
dependsontheprivacybudgetandbatchsizethroughthe
|             |        |     |            |      |                   | ity properties,                      | rather | than | simpler | alternatives |              | like taking |
| ----------- | ------ | --- | ---------- | ---- | ----------------- | ------------------------------------ | ------ | ---- | ------- | ------------ | ------------ | ----------- |
| noise-batch | ratio. | We  | may expect | this | choice underesti- |                                      |        |      |         |              |              |             |
|             |        |     |            |      |                   | thecumulativeminacrosseachdimension. |        |      |         |              | Thelatterap- |             |
matesthebenefitoflargerbatchsizes,aquestionwestudy
proachsuffersfromastatisticalphenomenonknownasthe
empiricallyinAppendixC.3.
minimumselectionbias,whereoneoutliersamplecancom-
Noise-BatchRatio. Weconsider18valuesofnoise-batch promisethevalidityofthemeasurements. Wevisualizeour
| ratio: {2?k | | k | = 6,...,23}, |     | plus a baseline | value of 0 |     |     |     |     |     |     |     |
| ----------- | --- | ------------ | --- | --------------- | ---------- | --- | --- | --- | --- | --- | --- | --- |
smoothingprocessinAppendixC.9.
correspondingtonon-privatetraining.
Metrics. Every100trainingiterations, werecordtheav- TrainingStepExtrapolation. Next,weextrapolateour
smootheddatawithrespecttothenumberofiterations,by
| erage training |     | loss over | the | previous | 100 iterations (or |     |     |     |     |     |     |     |
| -------------- | --- | --------- | --- | -------- | ------------------ | --- | --- | --- | --- | --- | --- | --- |
fittingaparametricformtothetrainingcurveandpredicting
| 102,400 | training | examples). |     | Using training | loss instead |     |     |     |     |     |     |     |
| ------- | -------- | ---------- | --- | -------------- | ------------ | --- | --- | --- | --- | --- | --- | --- |
ofevaluationlossisstandardpracticeinscalinglawswork, wherethelosswouldhavegoneiftrainingcontinuedbeyond
|     |     |     |     |     |     | 128Kiterations. |     | Weuseasimpleparametricforminspired |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --------------- | --- | ---------------------------------- | --- | --- | --- | --- |
andisjustifiedbythefactthatwearetrainingforlessthan
A
asinglephysicalepoch,sotraininglossisanunbiasedesti- byHoffmannetal.(2022),namelyL=E+ . Wefitthis
T?
functionusingscipy.optimize.curve_fit,whichusesthe
mateofevaluationloss.
LevenbergûMarquardtalgorithmtosolveanonlinearleast
Weprovidedetailsonthecomputeplatformsandtraining
|     |     |     |     |     |     | squaresproblem(Nocedal&Wright,1999). |     |     |     |     | Weindepen- |     |
| --- | --- | --- | --- | --- | --- | ------------------------------------ | --- | --- | --- | --- | ---------- | --- |
throughputinAppendixC.5. dently fit a function for each model size and noise-batch
|     |     |     |     |     |     | ratioondatafromiterations16K |     |     |     | to128K. |     |     |
| --- | --- | --- | --- | --- | --- | ---------------------------- | --- | --- | --- | ------- | --- | --- |
3.3.Semi-ParametricModeling
Aftertrainingthemodelsdescribedabove,weobtainagrid Scaling Law Fitting. After data cleaning, our goal
|     |     |     |     |     |     | is to fit | a function |     | L(M,T,?») | that | estimates | the |
| --- | --- | --- | --- | --- | --- | --------- | ---------- | --- | --------- | ---- | --------- | --- |
ofmeasurementsover6uniquemodelsizes,1280unique
|     |     |     |     |     |     | loss under | a M-parameter |     | model | training |     | for T iter- |
| --- | --- | --- | --- | --- | --- | ---------- | ------------- | --- | ----- | -------- | --- | ----------- |
4

ScalingLawsforDifferentiallyPrivateLanguageModels
     I   
 4 V M Z E G ]  & Y H K I X  4 V M Z E G ]  & Y H K I X  4 V M Z E G ]  & Y H K I X
|                  |    |     |     |   I    |    |     |              |     |    |     |     |     |
| ---------------- | --- | --- | --- | ---------- | --- | --- | ------------ | --- | --- | --- | --- | --- |
|                  |    |     |     |            |     |     |        |     |     |     |     |     |
|      I    |     |     |     |            |    |     |              |     |    |     |     |     |
 I ^ M 7  P I H S 1     I ^ M 7  L G X E &   I         
|     |    |     |     |     |    |     |  W R S M X E V I X - |     |    |     |     |     |
| --- | ---- | --- | --- | --- | ---- | --- | -------------------- | --- | ---- | --- | --- | --- |
    I   
|     I    |     |     |     |        |     |     |     |     |     |     |     |     |
| -------------- | --- | --- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- | --- |
     
     
     I   
    
|     I    |     |     |     |     |     |     |     |      |     |     |     |     |
| -------------- | --- | --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | --- |
                                                                                                                       
 ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X
|     | (a)ModelSize |     |     |     | (b)BatchSize |     |     |     | (c)Iterations |     |     |     |
| --- | ------------ | --- | --- | --- | ------------ | --- | --- | --- | ------------- | --- | --- | --- |
Figure1.Optimalmodelsize,batchsize,anditerationsforvaryingprivacyandcomputebudgets,withafixeddatabudgetof108.Lines
showminimumvaluesforeachhyper-parameterthatachievewithin1%ofoptimalcross-entropyforconstant-computetraining.Shaded
regionsindicatethefullrangeofnear-optimalsettings.
Model Size (M) 1 Input budgets us a final estimate of the cross-entropy of these training
4.5M ? M ? 784M
Compute Budget  2 Constant-compute configs configurations. Inaddition,wecanalsospecifydirectlythe
(C)
trainingconfigurationsinsteadofthecomputebudgetforthe
3 Noise calibration
Batch Size (B)
|     |     |     |     | 4 Fitted function |     | purposesofconductingspecificablationsorcomparisons. |     |     |     |     |     |     |
| --- | --- | --- | --- | ----------------- | --- | --------------------------------------------------- | --- | --- | --- | --- | --- | --- |
Privacy Budget
(?)
|     |     |     | Iterations (T) | Predic | t e d Loss |                                     |     |     |     |     |     |     |
| --- | --- | --- | -------------- | ------ | ---------- | ----------------------------------- | --- | --- | --- | --- | --- | --- |
|     |     |     |                |        | ( L )      | 4.ExperimentalFindingsofScalingLaws |     |     |     |     |     |     |
Data Budget
|     | (N) |     |     |     |     | 4.1.OptimalComputeBudgetAllocation |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ---------------------------------- | --- | --- | --- | --- | --- | --- |
Noise-Batch Ratio
2-23 ? ? ? 2-6
|     |     |     |     |     |     | We first determine |     | how to | best | utilize | our compute | bud- |
| --- | --- | --- | --- | --- | --- | ------------------ | --- | ------ | ---- | ------- | ----------- | ---- |
Figure2.Workflowforestimatingcross-entropyofdifferenttrain-
|     |     |     |     |     |     | get in different | situations. |     | Specifically, |     | for a | given com- |
| --- | --- | --- | --- | --- | --- | ---------------- | ----------- | --- | ------------- | --- | ----- | ---------- |
ingconfigurationsundergivencompute,privacy,anddatabudgets.
pute/privacy/databudget,weaimtounderstandhowtoopti-
ations with a noise-batch ratio of ?». We fit this mallyallocateourcomputebudgetamongthemodelsize,
function using linear interpolation, and specifically batchsize,andnumberofiterations. Additionally,weseek
scipy.interpolate.RegularGridInterpolatorinPython. tounderstandhowtheoptimalallocationchangesperbud-
| Since | M, T, | and ?» | are all naturally | varied | in log- |     |     |     |     |     |     |     |
| ----- | ----- | ------ | ----------------- | ------ | ------- | --- | --- | --- | --- | --- | --- | --- |
get. Whilethisquestioncanbeansweredforvirtuallyany
space, weapplyinterpolationtothefunctionF suchthat settingofthebudgetswiththedatawecollected,wevisu-
F(logM,logT,log?») := L(M,T,?»)instead. Thisfunc- alize a few relevant slices of the data in Figure 1. More
tion is well-defined for any T and any M,?» within the comprehensiveresultscanbefoundinAppendixC.8. From
range of experimental settings considered; that is, M ? thisvisualization,wemakethefollowingobservations:
| [4.5M,784M],?» |     | ?[0.523,0.56]. | Becauseweuseinterpola- |     |     |     |     |     |     |     |     |     |
| -------------- | --- | -------------- | ---------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ò Forsmallcomputebudgets,theoptimalallocationofcom-
tion,ourfittedfunctionmatchesthesmootheddataexactly
|                   |     |         |                  |     |            | pute budget | does | not exhibit |     | a strong | dependence | on ?. |
| ----------------- | --- | ------- | ---------------- | --- | ---------- | ----------- | ---- | ----------- | --- | -------- | ---------- | ----- |
| at the evaluation |     | points, | and approximates | it  | in between |             |      |             |     |          |            |       |
However,thereisasmallbutconsistenttrendthatwith
them. InAppendixEwealsofitaparametricformforthis
|     |     |     |     |     |     | larger privacy | budgets, |     | one should | train | a larger | model |
| --- | --- | --- | --- | --- | --- | -------------- | -------- | --- | ---------- | ----- | -------- | ----- |
functionaswell,findingthatitislargelyconsistentwiththe
|     |     |     |     |     |     | with a smaller | batch | size | and | for more | iterations | than |
| --- | --- | --- | --- | --- | --- | -------------- | ----- | ---- | --- | -------- | ---------- | ---- |
non-parametricfit.
|     |     |     |     |     |     | onewouldtrainwithasmallerprivacybudget. |     |     |     |     |     | Thisfind- |
| --- | --- | --- | --- | --- | --- | --------------------------------------- | --- | --- | --- | --- | --- | --------- |
ingissomewhatsurprising,sinceastheprivacybudget
3.4.UsingtheFittedFunctions
getslarger,thepointatwhichincreasingbatchsizeleads
WearenowabletoanswerDPscalinglawsquestions. Fig- to diminishing returns in terms of noise-batch ratio in-
(cid:112)
ure2summarizesourapproach. Webeginwithinputs: the creases roughly according to ? N ?/T (Ponomareva
| computebudget,privacybudget,anddatabudget. |     |     |     |     | Second, | etal.,2023). |     |     |     |     |     |     |
| ------------------------------------------ | --- | --- | --- | --- | ------- | ------------ | --- | --- | --- | --- | --- | --- |
weproceedbyenumeratinganexhaustivesetofconstant- ò There are many settings of model size, batch size, and
|     |     |     |     |     |     | number | of iterations | that | achieve | near-optimal |     | loss, as |
| --- | --- | --- | --- | --- | --- | ------ | ------------- | ---- | ------- | ------------ | --- | -------- |
computetrainingconfigurations;i.e.,combinationsofmodel
size,batchsize,anditerationsthatrequirethegivencom- indicatedbythelargeshadedregions. Thissuggestssome
putebudget. Usingprivacyaccountingandnoisecalibration amountofrobustnessforcompute-optimaltraininghyper-
functionsfromthedp_accountinglibrary,wecomputethe parameters. Allelsebeingequal,trainingsmallermodels
noise-batchratioasafunctionoftheprivacybudget,data onmoretokensshouldgenerallybepreferredduetotheir
inference-timeefficiencyadvantages.
| budget, | iterations, | and (expected) | batch | size. | Finally, we |     |     |     |     |     |     |     |
| ------- | ----------- | -------------- | ----- | ----- | ----------- | --- | --- | --- | --- | --- | --- | --- |
queryourfittedfunctionwiththisnoise-batchratio,along ò Optimalmodelsizesaremuchsmallerthanpredictedby
withthegivenmodelsizeandnumberofiterations,giving non-private scaling laws. For instance, at 1022 FLOPs,
5

ScalingLawsforDifferentiallyPrivateLanguageModels
|    |     |     |     |    |     |     |     |            |     |                              |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- | ---------------------------- | --- |
|    |     |     |     |     |     |     |     |   I    |     |  4 V M Z E G ]  & Y H K I X |     |
|     |     |     |     |    |     |     |     |            |    |    102                     | 103 |
 ] T S V X R )  W W S V '  I ^ M 7  P I H S 1    W R I O S 8 104 105 106    ' L M R G L M P P E 
|    |                        |            |     |    |                        |          |        |        |        |     |     |
| --- | ---------------------- | ---------- | --- | --- | ---------------------- | -------- | ------ | ------------ | ------ | --- | --- |
|     |                        |     1   |     |     |                        |     1 |        |         |        |     |     |
|    |  ( E X E  & Y H K I X |            |     |    |  ( E X E  & Y H K I X |          |        |              |        |     |     |
|    | 1 0                    | 6          |     |    | 1 0 6                  |          |        |          |        |     |     |
|     | 1 0                    | 7     1 |     |     | 1 0 7                  |          |    1 |              |        |     |     |
|     | 108                    |            |     |     | 108                    |          |        |              |        |     |     |
|    |                        |            |     |    |                        |          |        |              |     |     |     |
|     | 109                    |            |     |     | 109                    |          |        |              |        |     |     |
  
                                                                                                                    
|     |     |  ' S Q T Y X I  & Y H K I X   * 0 3 4 W 
 |     |     |     |  ' S Q T Y X I  & Y H K I X   * 0 3 4 W 
 |     |     |     |     |     |
| --- | --- | -------------------------------------------- | --- | --- | --- | -------------------------------------------- | --- | --- | --- | --- | --- |
 ' S Q T Y X I  & Y H K I X
(a)PrivacyBudget:?=1 (b)PrivacyBudget:?=8 (c)Token-to-ModelRatio
Figure3.(a-b)Bestcross-entropylossachievedforvaryingcomputebudgets,fourdatabudgets,andtwodifferentprivacybudgets.Each
figureisannotatedwiththeoptimalmodelsizeattheinflectionpointfortwoofthecurves.(c)NumberoftrainingtokensS╖B╖T divided
bynumberofmodelparametersforthecompute-optimaltrainingconfiguration,fixingthedatabudgettoN =107.
? 108 parameters are compute-optimal, compared to ò Thetoken-to-modelratioincreaseswithcomputebudget,
?1010non-privately. especially for smaller privacy budgets. As the privacy
budgetincreases,theslopedecreases,andforasufficiently
4.2.BenefitsofIncreasedCompute largeprivacybudgetbecomesnearlyflataspredictedby
|     |     |     |     |     |     |     | the prior work. | However, | the | privacy budget | required |
| --- | --- | --- | --- | --- | --- | --- | --------------- | -------- | --- | -------------- | -------- |
Wenowaimtounderstandandmeasurehowmuchbene- to exhibit behavior similar to prior work is extremely
fitincreasedcomputebudgetscanprovideandunderwhat
|                |     |           |            |        |            |     | large. Notethataprivacybudgetof? |     |     | = 1000provides |     |
| -------------- | --- | --------- | ---------- | ------ | ---------- | --- | -------------------------------- | --- | --- | -------------- | --- |
| circumstances. |     | In Figure | 3a, welook | at how | theoptimal |     |                                  |     |     |                |     |
nomeaningfulformalmembershipinferenceprotection.3
achievablecross-entropydependsonthecomputebudget
Nonetheless,thenoiseaddedstillhasasignificantimpact
| fordifferentsettingsofdata/privacybudget. |     |     |     |     | Ourmainob- |     |                                               |                                       |     |     |     |
| ----------------------------------------- | --- | --- | --- | --- | ---------- | --- | --------------------------------------------- | ------------------------------------- | --- | --- | --- |
|                                           |     |     |     |     |            |     | ontraining:                                   | itsbehaviorinFigure3cismoresimilartoa |     |     |     |
| servationsare:                            |     |     |     |     |            |     | privacybudgetof1thannon-privatetraining(?=?). |                                       |     |     |     |
ò Increasing the compute budget can be a very effective ò For moderate privacy budgets in the range of [1,10], a
strategy for reducing cross-entropy under a fixed pri- goodtoken-to-modelratioistypicallybetween1000and
vacy/databudgetuptoalimit,butthereisaninflection 100,000,althoughforsufficientlylargecomputebudgets,
pointwhereincreasingthecomputebudgetbeyondthis it can go beyond this point. This connects back to an
earlierobservationthatevenwithinfinitecompute,there
| pointprovideslittletonobenefit. |     |     |     | Theôcriticalcompute |     |     |     |     |     |     |     |
| ------------------------------- | --- | --- | --- | ------------------- | --- | --- | --- | --- | --- | --- | --- |
budgetöwherethisinflectionpointoccursincreaseswith iseventuallynobenefittoincreasingthemodelsizewhen
bothprivacybudgetanddatabudget. Forexample,with usingamodestprivacybudget. Theseratiosroughlycor-
adatabudgetof108 andaprivacybudgetof1,thebest respondtotrainingmodels10╫to50╫smallerthanpre-
cross-entropyisachievedwithacomputebudget?1020 dictedbyHoffmannetal.(2022).
| andcorrespondstoamodelwith114Mparameters. |     |     |     |     |     | This |     |     |     |     |     |
| ----------------------------------------- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- |
isaqualitativelydifferentbehaviorthannon-privatescal- 4.4.ComparisonAgainstBaselines
inglaws,whereincreasingthecomputebudgetcontinues
|     |     |     |     |     |     |     | We now measure | the improvement |     | our compute-optimal |     |
| --- | --- | --- | --- | --- | --- | --- | -------------- | --------------- | --- | ------------------- | --- |
toprovidebenefitsevenattheextremescales.
|     |     |     |     |     |     |     | trainingconfigurationsprovideovernaturalbaselines. |     |     |     | In  |
| --- | --- | --- | --- | --- | --- | --- | -------------------------------------------------- | --- | --- | --- | --- |
More comprehensive analysis of the saturating compute theDPtrainingliterature,itiscommontofixthetraining
budgetforarepresentativesetofdataandprivacybudgets configuration(model,iterations,batchsize),andvarythe
canbefoundinAppendixC.1. privacybudget. Tothatend,weconsider3baselinetraining
configurations:BertLargetrainedfor7500stepswithabatch
4.3.Token-to-ModelRatio size of 1295, BertMedium trained for 5000 steps with a
batchsizeof15879andBertTinytrainedfor2500stepswith
| We  | now | aim to understand | more about | compute-optimal |     |     |                      |     |                               |     |     |
| --- | --- | ----------------- | ---------- | --------------- | --- | --- | -------------------- | --- | ----------------------------- | --- | --- |
|     |     |                   |            |                 |     |     | abatchsizeof283,061. |     | Inallthree,wefixthedatabudget |     |     |
trainingconfigurations,specificallytheratioofthenumber
|                                                   |     |     |     |     |     |     | toN =107. Eachofthesetrainingconfigurationsrequires |     |     |     |     |
| ------------------------------------------------- | --- | --- | --- | --- | --- | --- | --------------------------------------------------- | --- | --- | --- | --- |
| oftrainingtokens(asmeasuredbyS╖B╖T)tomodelsizeand |     |     |     |     |     |     | 1019FLOPs.                                          |     |     |     |     |
Thefirstconfigurationisclosetowhatwould
| privacybudget. |     | Inotherwords,westudyaformofsample |     |     |     |     |     |     |     |     |     |
| -------------- | --- | --------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
bepredictedbynon-privatescalinglaws(Hoffmannetal.,
complexity.IntheabsenceofDP,aconstanttoken-to-model
2022),whilethelastmightbeselectedbyanexpertinDP
ratioof20╫istherecommendedbestpractice(Hoffmann
etal.,2022). AsweseeinFigure3c,thebehaviorunderDP 3However,valuesevenlargerthanthishavebeenshowntobe
effectiveagainstreconstructionattacksinpriorworks(Balleetal.,
isnotassimple:
2022;Kaissisetal.,2023;Zilleretal.,2024).
6

ScalingLawsforDifferentiallyPrivateLanguageModels
|  
 I ^ M 7  L G X E &   X I K H Y &  I X Y T Q S ' |     |     |     |  
 I ^ M 7  L G X E &   X I K H Y &  I X Y T Q S ' 106 |     |     |     |     |    |     |     |     |     |
| ------------------------------------------------------ | --- | --- | --- | ---------------------------------------------------------- | --- | --- | --- | --- | ---- | --- | --- | --- | --- |
   
 
 R S P M W T )   X I K H Y &  ] G E Z M V 4
 
105
   
 
104
   
   
103
   
    
|                                              |       |    |    | 105 | 106                                    | 107 | 108 |     | 105 | 106 | 107 | 108 |     |
| ------------------------------------------------ | --------- | --- | ---- | --- | -------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
|  4 V M Z E G ]  & Y H K I X   ) T W M P S R 
 |           |     |      |     |  ( E X E  & Y H K I X   9 W I V W 
 |     |     |     |     |     |     |     |     |
 ( E X E  & Y H K I X   9 W I V W 
=224
| (a)DataBudget:N |     |     |     | (b)PrivacyBudget:?=4 |     |     |     |     | (c)BatchSize:B |     | =65536 |     |     |
| --------------- | --- | --- | --- | -------------------- | --- | --- | --- | --- | -------------- | --- | ------ | --- | --- |
Figure4.Marginalbenefitsofincreasingtheprivacybudget(?),computebudget(B),anddatabudget(N)onthenoise-batchratio.
who recognizes the importance of large batch sizes. The 4.5.SynergybetweenPrivacy/Data/ComputeBudgets
resultsareshowninFigure5,fromwhichwefind:
Whilemanyofthetrade-offsthatweexploreinthiswork
ò Formostprivacybudgets,thetrainingconfigurationpre- aredata-dependentandrequiresignificantempiricalinvesti-
dictedbynon-privatescalinglaws(BertLarge)yieldsvery gation,manygeneralizablescalinginsightscanbederived
lowutility. Whileutilityimprovesforsufficientlylarge purelybyexploringprivacyaccounting. Inthissectionwe
privacybudgets,thissuggeststhatprivatescalinglawsare detail some of these, which corroborate many of our ex-
fundamentallydistinctfromnon-privateones. perimentalevidenceaboveandrequireverylittlecompute.
ò Theoptimaltrainingconfigurationchangeswiththepri- Theseinsightsaredomain-agnostic,andthereforelikelyto
vacy budget, and naively using a fixed training config- generalizetoothermachinelearningsettingsbeyondlan-
urationacrossallprivacybudgets, asiscommoninthe guagemodels,whilealsohelpingusunderstandandexplain
literature,leavessignificantutilityonthetable. someoftheexperimentalobservationspresentedearlier.
ò Compute-optimaltrainingcaneithergivebetterutility,or
Weanalyzehowthenoise-batchratiobehavesasafunction
| savecompute/privacybudgetunderfixedutility. |     |     |     | Training |     |     |     |     |     |     |     |     |     |
| ------------------------------------------- | --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ofprivacybudget(asmeasuredby?),computebudget(as
acompute-optimalmodelwith2╫1018FLOPsyieldssim-
|     |     |     |     |     |     | measuredbyB),anddatabudget(asmeasuredbyN). |     |     |     |     |     |     | We  |
| --- | --- | --- | --- | --- | --- | ------------------------------------------ | --- | --- | --- | --- | --- | --- | --- |
ilarutilityasthebestbaselinemodelswith5╫theFLOPs
|                                        |     |     |     |            |     | fix | T = 16000 | training | steps | here,   | but        | our findings | hold   |
| -------------------------------------- | --- | --- | --- | ---------- | --- | --- | --------- | -------- | ----- | ------- | ---------- | ------------ | ------ |
| forthereasonablerangeofprivacybudgets. |     |     |     | Thisisjust |     |     |           |          |       |         |            |              |        |
|                                        |     |     |     |            |     | for | any fixed | number   | of    | steps4. | We compute | the          | noise- |
oneinstructiveexample.Thesavingsinothersettingsmay
batchratiofordifferentsettingsbyusingthedp_accounting
changedependingonfactorslikedatabudget,compute
library(GoogleDPTeam,2022).Althoughthefunctionthat
budget,andqualityofthebaselinetrainingconfigurations
computesthenoise-batchratioisgenerallywell-understood
(e.g.,thecomputesavingsoverBertLargeexceeds100╫,
inthesensethatweknowhowtocomputeittightlygiven
althoughthisisnotshown).
theprivacyandtrainingparameters,itsprecisebehavioras
|    |                            |     |                                |                  |     | afunctionoftheprivacybudget,computebudget,anddata |     |     |     |     |                    |     |     |
| --- | -------------------------- | --- | ------------------------------ | ---------------- | --- | ------------------------------------------------- | --- | --- | --- | --- | ------------------ | --- | --- |
|     |     & I V X 0 E V K I   |     |  ' S Q T Y X I  3 T X M Q E P |                  |     |                                                   |     |     |     |     |                    |     |     |
|     |     & I V X 1 I H M Y Q |     |    1                        | 1019  * 0 3 4 W |     |                                                   |     |     |     |     |                    |     |     |
|     |                            |     |                                |                  |     | budgetisnotcommonknowledge.                       |     |     |     |     | Indeed,duetolackof |     |     |
|    |     & I V X 8 M R ]     |     |    2                        | 1018  * 0 3 4 W |     |                                                   |     |     |     |     |                    |     |     |
 ] T S V X R )  W W S V ' clearandsimpleguidanceonhowtoconfigureDP-SGD,it
|     |     |     |     |     |     | is not | uncommon |     | to use or | compare | against | sub-optimal |     |
| --- | --- | --- | --- | --- | --- | ------ | -------- | --- | --------- | ------- | ------- | ----------- | --- |
 
configurationsofDP-SGD.
 
|     |     |     |     |     |     | In Figure | 4   | we plot | three | vector | fields. | Along each | axis |
| --- | --- | --- | --- | --- | --- | --------- | --- | ------- | ----- | ------ | ------- | ---------- | ---- |
 
wevarytheprivacybudget,computebudget,anddatabud-
|     |     |     |     |     |     | get. | The direction |     | and magnitude |     | of the | vectors | indicate |
| --- | --- | --- | --- | --- | --- | ---- | ------------- | --- | ------------- | --- | ------ | ------- | -------- |
 
|     |     |     |     |         |     |     |     |     |     |     |     |     |     |
| ------ | ------ | ------ | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
 4 V M Z E G ]  & Y H K I X   ) T W M P S R 
 howmuchdoublingeachofthesebudgetsreducesthenoise-
|     |     |     |     |     |     | batchratio. |     | Eachbudgetisvariedonalogarithmicscaleat |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ----------- | --- | --------------------------------------- | --- | --- | --- | --- | --- |
differentpowersof2.Thelengthofthexandycomponents
Figure5.Comparisonofacompute-optimaltrainingconfiguration
tosomenaturalbaselinesasafunctionoftheprivacybudget.All ofthevectorisdeterminedbyratioofnoise-batchratiomi-
modelsaretrainedwithacomputebudgetof1019FLOPsanda
4WhilecomputebudgetcouldalsobevariedthroughT,the
databudgetofN =107respectively.
|     |     |     |     |     |     | effectofchangingT |     |     | isdata-dependentandthenoisebatchratiois |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ----------------- | --- | --- | --------------------------------------- | --- | --- | --- | --- |
notdirectlycomparableacrossdifferentT.
7

ScalingLawsforDifferentiallyPrivateLanguageModels
nusone. Forexample,avectoroflength1alongtheprivacy these privacy guarantees are limited to downstream data,
budgetaxismeansdoublingtheprivacybudgetreducesthe leavingthepre-trainingprocessexposed. GiventhatLLMs
noise-batchratiobyafactoroftwo. are pre-trained on extensive Internet data, which is often
|     |     |     |     |     |     | sourced | without | explicit | user consent | (Gold | &   | Latonero, |
| --- | --- | --- | --- | --- | --- | ------- | ------- | -------- | ------------ | ----- | --- | --------- |
Astherearethreebudgetsthattogetherdeterminethenoise-
2017),thisraisesethicalandprivacyconcerns(TramΦretal.,
batchratioandtheyinteractinnuancedways,weshowthree
|                          |     |       |                            |            |              | 2024).        | Safeguarding | privacy | during | pre-training |            | remains |
| ------------------------ | --- | ----- | -------------------------- | ---------- | ------------ | ------------- | ------------ | ------- | ------ | ------------ | ---------- | ------- |
| plots in Figure          | 4,  | where | we vary                    | two of the | budgets at a |               |              |         |        |              |            |         |
|                          |     |       |                            |            |              | a significant | challenge.   | This    | study  | seeks        | to provide | new     |
| timewhilefixingthethird. |     |       | Theseplotstogetherprovidea |            |              |               |              |         |        |              |            |         |
insightstoadvanceprivacy-preservingpre-trainingoflan-
fairlycompletepictureofthebehaviorofthenoise-batch
guagemodels.
ratio. Ourmainobservationsareenumeratedbelow:
|             |        |          |         |                   |           | DPTrainingofVisionModels. |            |          |           | TrainingDPmodelsfrom |             |     |
| ----------- | ------ | -------- | ------- | ----------------- | --------- | ------------------------- | ---------- | -------- | --------- | -------------------- | ----------- | --- |
| ò In Figure | 4a we  | see that | varying | the privacy       | budget or |                           |            |          |           |                      |             |     |
|             |        |          |         |                   |           | scratch                   | for vision | tasks is | an active | area                 | of research | (Yu |
| compute     | budget | alone    | (while  | fixing the other) | leads to  |                           |            |          |           |                      |             |     |
etal.,2021;Deetal.,2022;Buetal.,2022;Kurakinetal.,
| diminishingreturns. |           | Increasingtheprivacyandcompute |               |     |             |                         |     |     |                            |     |     |     |
| ------------------- | --------- | ------------------------------ | ------------- | --- | ----------- | ----------------------- | --- | --- | -------------------------- | --- | --- | --- |
|                     |           |                                |               |     |             | 2022;Sanderetal.,2024). |     |     | Themostrelatedworkisthatof |     |     |     |
| budgets             | in tandem | leads                          | to consistent | and | predictable |                         |     |     |                            |     |     |     |
Sanderetal.(2023),whoinvestigatethescalingbehavior
reductionsinthenoise-batchratio.
ofDPtrainingonvisiontasksbyvaryingkeyhyperparame-
ò InFigure4bweseeasimilartrendwhenvaryingdataand
ters. Theydemonstratethat,underafixedprivacybudget,
| computebudgets. |     | Atsmallcomputebudgets,increasing |     |     |     |     |     |     |     |     |     |     |
| --------------- | --- | -------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
carefullytuningbatchsize,trainingsteps,andlearningrate
thedatabudgetprovideslimitedbenefit,andvice-versa.
|     |     |     |     |     |     | iscriticalforbetteraccuracy. |     |     | However,theydonotaccount |     |     |     |
| --- | --- | --- | --- | --- | --- | ---------------------------- | --- | --- | ------------------------ | --- | --- | --- |
Increasingthemsimultaneouslyleadstoconsistentand
foraboundedcomputebudget,acrucialfactorinscaling
predictableimprovementsinthenoise-batchratio.
|             |       |          |       |            |               | law studies | for | language | models | (Hoffmann | et al., | 2022). |
| ----------- | ----- | -------- | ----- | ---------- | ------------- | ----------- | --- | -------- | ------ | --------- | ------- | ------ |
| ò In Figure | 4c we | see that | while | increasing | data and pri- |             |     |          |        |           |         |        |
Additionally,itremainsunclearhowtheirfindingstranslate
vacybudgetscanbehelpful,forafixedcomputebudget,
|     |     |     |     |     |     | tolanguagemodelingtasks. |     |     | Inthiswork,weextendscal- |     |     |     |
| --- | --- | --- | --- | --- | --- | ------------------------ | --- | --- | ------------------------ | --- | --- | --- |
increasingeitherprovidesdiminishingandeventuallyneg-
|     |     |     |     |     |     | ing law | analyses | to language | models, | incorporating |     | both |
| --- | --- | --- | --- | --- | --- | ------- | -------- | ----------- | ------- | ------------- | --- | ---- |
ligiblebenefits.
standardoptimizationhyperparametersandaboundedcom-
putebudgetstoalignmorecloselywithrecentLLMscaling
Theseobservationsprovideguidanceonhowtoeffectively
| configureDP-SGDandcorroborateourscalinglawsabove. |     |     |     |     |     | research.                       |     |     |     |     |     |     |
| ------------------------------------------------- | --- | --- | --- | --- | --- | ------------------------------- | --- | --- | --- | --- | --- | --- |
| 5.RelatedWork                                     |     |     |     |     |     | 6.ConclusionandFutureDirections |     |     |     |     |     |     |
Thisworkestablishesaprincipledmethodologyforunder-
| ScalingLawsofLanguageModels. |     |     |     | Recentresearchhas |     |     |     |     |     |     |     |     |
| ---------------------------- | --- | --- | --- | ----------------- | --- | --- | --- | --- | --- | --- | --- | --- |
exploredthescalinglawsgoverningtheperformanceoflan- standingthecompute-privacy-utilitytrade-offoflanguage
guagemodelsastheyincreaseinsize. Kaplanetal.(2020) modelstrainedunderDP,anditrepresentsanimportantstep
foundapower-lawrelationshipbetweenmodelsize,dataset towardstraininglarger,morecapablemodelsefficientlyon
size,andcomputebudget,withperformanceondownstream sensitive user data. This endeavor will require collecting
increasinglylargerdatasetsoverlargergroupsofindividu-
| tasksfollowingpredictablescalingcurves. |     |     |     | Hoffmannetal. |     |     |     |     |     |     |     |     |
| --------------------------------------- | --- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- |
(2022)extendedthistoopen-endedlanguagemodels,ob- als,whilesimultaneouslyscalingupcompute. Forexample,
servingsmoothscalingover7ordersofmagnitude. Chowd- totrainabillionparametermodeloptimallywithDP,one
heryetal.(2022)trainedPaLM,a540Bparametermodel couldcollectdatafromonebillionindividuals,usingagen-
thatcontinuedthetrends. Theseresultssuggestlanguage erousprivacybudgetof??10,andtrainonlargecompute
|     |     |     |     |     |     | clusters | for ? | 1023 FLOPs. | This | is in | stark contrast | to  |
| --- | --- | --- | --- | --- | --- | -------- | ----- | ----------- | ---- | ----- | -------------- | --- |
modelsmaycontinueimprovingastheyscale,althoughGan-
gulietal.(2022)notescalingalonemaynotbesufficientfor non-private laws, e.g., Anil et al. (2023) suggest a much
open-endedintelligence. Inthecontextoftraininglanguage larger?20Bparametermodelcouldbetrainedwith?2B
examples.
modelswithDP,wheregradientclippingandnoiseaddition
(Abadietal.,2016)altertrainingdynamics,thescalinglaws
Thisworkraisesseveralnewquestionsworthexploringin
haveremainedlargelyunexploreduntilthiswork.
futurework,includinghowdothescalinglawschangewhen
ApplyingDPinFine-tuningorPrompting. Recentstud- (1)doingfine-tuninginsteadofpre-training,(2)usingbetter
ies demonstrate that fine-tuning (Bu et al., 2023; Wang underlyingmechanisms,and(3)whenallowedtovarythe
et al., 2024; Du et al., 2023; Thaker et al., 2023; Zhang sequencelength.Thesequestions(alongwithseveralothers)
etal.,2024b;Tobabenetal.,2023;Wuetal.,2024a;Zhang arediscussedingreaterdetailinAppendixA.
etal.,2024a;Chuaetal.,2024a)orprompting(Duanetal.,
2023b;a;Wuetal.,2024b;Tangetal.,2024;Hongetal.,
2024;Aminetal.,2024)LLMscanachievestrongperfor-
| mancewhileensuringdownstreamdataprivacy. |     |     |     |     | However, |     |     |     |     |     |     |     |
| ---------------------------------------- | --- | --- | --- | --- | -------- | --- | --- | --- | --- | --- | --- | --- |
8

ScalingLawsforDifferentiallyPrivateLanguageModels
ImpactStatement Bassily,R.,Smith,A.,andThakurta,A. Privateempirical
|     |     |     |     |     |     |     | risk minimization: |     |     | Efficient | algorithms | and tight | error |
| --- | --- | --- | --- | --- | --- | --- | ------------------ | --- | --- | --------- | ---------- | --------- | ----- |
Thispaperpresentsworkwhosegoalistoadvancethefield
|     |     |     |     |     |     |     | bounds. | InFOCS,pp.464û473,2014. |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------- | ----------------------- | --- | --- | --- | --- | --- |
ofmachinelearning,specificallyintheareaofdifferentially
| private | (DP) language | models. | It  | establishes | DP  | scaling |          |         |     |          |            |                |     |
| ------- | ------------- | ------- | --- | ----------- | --- | ------- | -------- | ------- | --- | -------- | ---------- | -------------- | --- |
|         |               |         |     |             |     |         | Berrada, | L., De, | S., | Shen, J. | H., Hayes, | J., Stanforth, | R., |
lawsthatshedlightonthetrade-offsbetweencompute,pri- Stutz,D.,Kohli,P.,Smith,S.L.,andBalle,B. Unlock-
vacy,andutility,andcanleadtomoreefficientandeffective ingaccuracyandfairnessindifferentiallyprivateimage
methodsfortrainingLLMsonuserdatawhilesatisfyingDP, classification. arXiv:2308.10888,2023.
| agoldstandardforboundingtheprivacyloss. |     |     |     |     | Thescaling |     |     |     |     |     |     |     |     |
| --------------------------------------- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
lawspresentedcanhelpresearchersandpractitionerschoose Biderman,S.,Prashanth,U.S.,Sutawika,L.,Schoelkopf,
|                                          |       |            |          |            |            |     | H.,Anthony,Q.,Purohit,S.,andRaff,E.           |     |     |     |     | Emergentand |     |
| ---------------------------------------- | ----- | ---------- | -------- | ---------- | ---------- | --- | --------------------------------------------- | --- | --- | --- | --- | ----------- | --- |
| model sizes,                             | batch | sizes, and | training | iterations | based      | on  |                                               |     |     |     |     |             |     |
|                                          |       |            |          |            |            |     | predictablememorizationinlargelanguagemodels. |     |     |     |     |             | In  |
| availablecompute,data,andprivacybudgets. |       |            |          |            | Bydevelop- |     |                                               |     |     |     |     |             |     |
NeurIPS,2023.
ingmethodstomakeDPtrainingmorefeasible,thepaper
contributestotheresponsibledevelopmentanddeployment
|                   |     |                               |     |     |     |     | Bu,Z.,Mao,J.,andXu,S. |     |     | Scalableandefficienttraining |     |     |     |
| ----------------- | --- | ----------------------------- | --- | --- | --- | --- | --------------------- | --- | --- | ---------------------------- | --- | --- | --- |
| ofAItechnologies. |     | Wepointoutthat,whenapplyingDP |     |     |     |     |                       |     |     |                              |     |     |     |
oflargeconvolutionalneuralnetworkswithdifferential
inpractice,theprivacyunithastobechosencarefully;in privacy. InNeurIPS,2022.
| particular, | a user-level | guarantee |     | may be | needed. | More- |                                    |     |     |     |     |                |     |
| ----------- | ------------ | --------- | --- | ------ | ------- | ----- | ---------------------------------- | --- | --- | --- | --- | -------------- | --- |
|             |              |           |     |        |         |       | Bu,Z.,Wang,Y.,Zha,S.,andKarypis,G. |     |     |     |     | Differentially |     |
over,whileavaluabletool,DPmaynotbesufficientwhen
trainingonuserdata;additionalmitigationsmayneedtobe private optimization on large model at small cost. In
simultaneouslyapplieddependingontheapplication. ICML,pp.3192û3218,2023.
Carlini,N.,Tramer,F.,Wallace,E.,Jagielski,M.,Herbert-
References Voss, A., Lee, K., Roberts, A., Brown, T., Song, D.,
|                          |             |                 |                        |              |               |        | Erlingsson,U.,etal. |     |     | Extractingtrainingdatafromlarge |     |     |     |
| ------------------------ | ----------- | --------------- | ---------------------- | ------------ | ------------- | ------ | ------------------- | --- | --- | ------------------------------- | --- | --- | --- |
| Abadi,                   | M., Chu,    | A., Goodfellow, |                        | I., McMahan, |               | H. B., |                     |     |     |                                 |     |     |     |
|                          |             |                 |                        |              |               |        | languagemodels.     |     |     | InUSENIXSecurity,2021.          |     |     |     |
| Mironov,                 | I., Talwar, | K.,             | and Zhang,             | L.           | Deep learning |        |                     |     |     |                                 |     |     |     |
| withdifferentialprivacy. |             |                 | InCCS,pp.308û318,2016. |              |               |        |                     |     |     |                                 |     |     |     |
Carlini,N.,Ippolito,D.,Jagielski,M.,Lee,K.,TramΦr,F.,
Abdin,M.,Aneja,J.,Awadalla,H.,Awadallah,A.,Awan, andZhang,C. Quantifyingmemorizationacrossneural
|     |     |     |     |     |     |     | languagemodels. |     |     | InICLR,2023. |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------------- | --- | --- | ------------ | --- | --- | --- |
A.A.,Bach,N.,Bahree,A.,Bakhtiari,A.,Bao,J.,Behl,
| H., etal. | Phi-3technicalreport: |     |     | Ahighlycapablelan- |     |     |     |     |     |     |     |     |     |
| --------- | --------------------- | --- | --- | ------------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Carlini,N.,Jagielski,M.,Choquette-Choo,C.A.,Paleka,
| guagemodellocallyonyourphone. |     |     |     | arXiv:2404.14219, |     |     |             |     |               |     |             |             |     |
| ----------------------------- | --- | --- | --- | ----------------- | --- | --- | ----------- | --- | ------------- | --- | ----------- | ----------- | --- |
|                               |     |     |     |                   |     |     | D., Pearce, |     | W., Anderson, |     | H., Terzis, | A., Thomas, | K., |
2024.
|     |     |     |     |     |     |     | andTramΦr,F. |     | Poisoningweb-scaletrainingdatasetsis |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------------ | --- | ------------------------------------ | --- | --- | --- | --- |
Achiam, J., Adler, S., Agarwal, S., Ahmad, L., Akkaya, practical. InS&P,pp.407û425,2024.
| I., Aleman, | F.           | L., Almeida, | D., | Altenschmidt,   |     | J., Alt- |           |             |           |              |           |                |       |
| ----------- | ------------ | ------------ | --- | --------------- | --- | -------- | --------- | ----------- | --------- | ------------ | --------- | -------------- | ----- |
|             |              |              |     |                 |     |          | Charles,  | Z., Ganesh, |           | A., McKenna, |           | R., McMahan,   | H.B., |
| man,        | S., Anadkat, | S., et       | al. | GPT-4 technical |     | report.  |           |             |           |              |           |                |       |
|             |              |              |     |                 |     |          | Mitchell, | N.,         | Pillutla, | K.,          | and Rush, | K. Fine-tuning |       |
arXiv:2303.08774,2023.
largelanguagemodelswithuser-leveldifferentialprivacy.
Amin, K., Bie, A., Kong, W., Kurakin, A., Ponomareva, arXiv:2407.07737,2024.
| N., Syed, | U., Terzis, | A., | and Vassilvitskii, |     | S.  | Private |     |     |     |     |     |     |     |
| --------- | ----------- | --- | ------------------ | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
Chen,X.,Liang,C.,Huang,D.,Real,E.,Wang,K.,Liu,Y.,
| prediction | for large-scale |     | synthetic | text | generation. | In  |     |     |     |     |     |     |     |
| ---------- | --------------- | --- | --------- | ---- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- |
Pham,H.,Dong,X.,Luong,T.,Hsieh,C.-J.,Lu,Y.,and
EMNLP(Findings),2024.
|                                                   |     |     |     |     |         |     | Le,Q.V.         | Symbolicdiscoveryofoptimizationalgorithms. |     |     |     |     |     |
| ------------------------------------------------- | --- | --- | --- | --- | ------- | --- | --------------- | ------------------------------------------ | --- | --- | --- | --- | --- |
| Anil,R.,Ghazi,B.,Gupta,V.,Kumar,R.,andManurangsi, |     |     |     |     |         |     | InNeurIPS,2023. |                                            |     |     |     |     |     |
| P. Large-scaledifferentiallyprivateBERT.          |     |     |     |     | InEMNLP |     |                 |                                            |     |     |     |     |     |
Chowdhery,A.,Narang,S.,Devlin,J.,Bosma,M.,Mishra,
(Findings),pp.6481û6491,2022.
|     |     |     |     |     |     |     | G., Roberts, |     | A., | Barham, | P., Chung, | H. W., | Sutton, |
| --- | --- | --- | --- | --- | --- | --- | ------------ | --- | --- | ------- | ---------- | ------ | ------- |
Anil,R.,Dai,A.M.,Firat,O.,Johnson,M.,Lepikhin,D., C., Gehrmann, S., Schuh, P., Shi, K., Tsvyashchenko,
Passos,A.,Shakeri,S.,Taropa,E.,Bailey,P.,Chen,Z., S., Maynez, J., Rao, A., Barnes, P., Tay, Y., Shazeer,
| etal. | Palm2technicalreport. |     | arXiv:2305.10403,2023. |     |     |     |                  |     |     |           |         |                 |     |
| ----- | --------------------- | --- | ---------------------- | --- | --- | --- | ---------------- | --- | --- | --------- | ------- | --------------- | --- |
|       |                       |     |                        |     |     |     | N., Prabhakaran, |     |     | V., Reif, | E., Du, | N., Hutchinson, | B., |
Pope,R.,Bradbury,J.,Austin,J.,Isard,M.,Gur-Ari,G.,
| Balle,B.,Barthe,G.,andGaboardi,M. |     |     |     | Privacyamplifica- |     |     |     |     |     |     |     |     |     |
| --------------------------------- | --- | --- | --- | ----------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Yin,P.,Duke,T.,Levskaya,A.,Ghemawat,S.,Dev,S.,
| tionbysubsampling: |     | Tightanalysesviacouplingsand |     |     |     |     |     |     |     |     |     |     |     |
| ------------------ | --- | ---------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Michalewski,H.,Garcia,X.,Misra,V.,Robinson,K.,Fe-
| divergences. | InNIPS,2018. |     |     |     |     |     |     |     |     |     |     |     |     |
| ------------ | ------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
dus,L.,Zhou,D.,Ippolito,D.,Luan,D.,Lim,H.,Zoph,
Balle,B.,Cherubin,G.,andHayes,J. Reconstructingtrain- B., Spiridonov, A., Sepassi, R., Dohan, D., Agrawal,
ingdatawithinformedadversaries. InS&P,pp.1138û S., Omernick, M., Dai, A. M., Pillai, T. S., Pellat, M.,
| 1156,2022. |     |     |     |     |     |     | Lewkowycz,A.,Moreira,E.,Child,R.,Polozov,O.,Lee, |     |     |     |     |     |     |
| ---------- | --- | --- | --- | --- | --- | --- | ------------------------------------------------ | --- | --- | --- | --- | --- | --- |
9

ScalingLawsforDifferentiallyPrivateLanguageModels
K., Zhou, Z., Wang, X., Saeta, B., Diaz, M., Firat, O., GeminiTeam. Gemini: afamilyofhighlycapablemulti-
Catasta,M.,Wei,J.,Meier-Hellstern,K.,Eck,D.,Dean, modalmodels. arXiv:2312.11805,2023.
| J., Petrov, | S., and Fiedel, | N.  | PaLM: | Scaling language |     |     |     |     |
| ----------- | --------------- | --- | ----- | ---------------- | --- | --- | --- | --- |
GemmaTeam,Mesnard,T.,Hardin,C.,Dadashi,R.,Bhu-
modelingwithpathways,2022.
patiraju,S.,Pathak,S.,Sifre,L.,RiviΦre,M.,Kale,M.S.,
Chua,L.,Ghazi,B.,Huang,Y.,Kamath,P.,Kumar,R.,Liu, Love,J.,etal. Gemma: Openmodelsbasedongemini
| D.,Manurangsi,P.,Sinha,A.,andZhang,C. |                                          |     |     | Mindthe |     |                        |                         |     |
| ------------------------------------- | ---------------------------------------- | --- | --- | ------- | --- | ---------------------- | ----------------------- | --- |
|                                       |                                          |     |     |         |     | researchandtechnology. | arXiv:2403.08295,2024a. |     |
| privacyunit!                          | user-leveldifferentialprivacyforlanguage |     |     |         |     |                        |                         |     |
modelfine-tuning. InCoLM,2024a. GemmaTeam,Riviere,M.,Pathak,S.,Sessa,P.G.,Hardin,
C.,Bhupatiraju,S.,Hussenot,L.,Mesnard,T.,Shahriari,
Chua,L.,Ghazi,B.,Kamath,P.,Kumar,R.,Manurangsi,P.,
|     |     |     |     |     |     | B.,RamΘ,A.,etal. Gemma2: | Improvingopenlanguage |     |
| --- | --- | --- | --- | --- | --- | ------------------------ | --------------------- | --- |
Sinha,A.,andZhang,C. ScalableDP-SGD:Shufflingvs. modelsatapracticalsize. arXiv:2408.00118,2024b.
| Poissonsubsampling. |     | InNeurIPS,2024b. |     |     |     |     |     |     |
| ------------------- | --- | ---------------- | --- | --- | --- | --- | --- | --- |
Ghalebikesabi,S.,Berrada,L.,Gowal,S.,Ktena,I.,Stan-
| De, S., Berrada, | L., Hayes, | J., | Smith, | S. L., and | Balle, |     |     |     |
| ---------------- | ---------- | --- | ------ | ---------- | ------ | --- | --- | --- |
forth,R.,Hayes,J.,De,S.,Smith,S.L.,Wiles,O.,and
B. Unlockinghigh-accuracydifferentiallyprivateimage
|     |     |     |     |     |     | Balle,B. Differentiallyprivatediffusionmodelsgenerate |     |     |
| --- | --- | --- | --- | --- | --- | ----------------------------------------------------- | --- | --- |
classificationthroughscale. arXiv:2204.13650,2022. arXiv:2302.13861,2023.
usefulsyntheticimages.
Devlin,J.,Chang,M.-W.,Lee,K.,andToutanova,K.BERT:
|              |                       |     |              |     |          | Gold,Z.andLatonero,M. | Robotswelcome: | Ethicaland |
| ------------ | --------------------- | --- | ------------ | --- | -------- | --------------------- | -------------- | ---------- |
| Pre-training | of deep bidirectional |     | transformers |     | for lan- |                       |                |            |
legalconsiderationsforwebcrawlingandscraping.Wash.
InNAACL-HLT,pp.4171û4186,
guageunderstanding.
JLTech.&Arts,2017.
2019.
|     |     |     |     |     |     | GoogleDPTeam. GoogleÆsdifferentialprivacylibraries., |     |     |
| --- | --- | --- | --- | --- | --- | ---------------------------------------------------- | --- | --- |
Du,M.,Yue,X.,Chow,S.S.,Wang,T.,Huang,C.,andSun,
2022. https://github.com/google/differential-
| H. DP-forward: | Fine-tuningandinferenceonlanguage |     |     |     |     |     |     |     |
| -------------- | --------------------------------- | --- | --- | --- | --- | --- | --- | --- |
privacy.
| modelswithdifferentialprivacyinforwardpass. |     |     |     |     | InCCS, |     |     |     |
| ------------------------------------------- | --- | --- | --- | --- | ------ | --- | --- | --- |
pp.2665û2679,2023.
Hoffmann,J.,Borgeaud,S.,Mensch,A.,Buchatskaya,E.,
Cai,T.,Rutherford,E.,Casas,D.d.L.,Hendricks,L.A.,
| Duan, H., | Dziedzic, A., | Papernot, | N., | and Boenisch, | F.  |     |     |     |
| --------- | ------------- | --------- | --- | ------------- | --- | --- | --- | --- |
Flocksofstochasticparrots:Differentiallyprivateprompt Welbl,J.,Clark,A.,etal.Trainingcompute-optimallarge
|                                 |     |     |                  |     |     | languagemodels. arXiv:2203.15556,2022. |     |     |
| ------------------------------- | --- | --- | ---------------- | --- | --- | -------------------------------------- | --- | --- |
| learningforlargelanguagemodels. |     |     | InNeurIPS,2023a. |     |     |                                        |     |     |
Hong,J.,Wang,J.T.,Zhang,C.,Li,Z.,Li,B.,andWang,
| Duan, H., | Dziedzic, A., | Yaghini, | M., | Papernot, N., | and |     |     |     |
| --------- | ------------- | -------- | --- | ------------- | --- | --- | --- | --- |
Boenisch,F. Ontheprivacyriskofin-contextlearning. Z. DP-OPT:Makelargelanguagemodelyourprivacy-
|     |     |     |     |     |     | preservingpromptengineer. | InICLR,2024. |     |
| --- | --- | --- | --- | --- | --- | ------------------------- | ------------ | --- |
InACL,2023b.
|     |     |     |     |     |     | Huber,P.J. Robustestimationofalocationparameter. |     | In  |
| --- | --- | --- | --- | --- | --- | ------------------------------------------------ | --- | --- |
Dubey,A.,Jauhri,A.,Pandey,A.,Kadian,A.,Al-Dahle,A.,
Letman,A.,Mathur,A.,Schelten,A.,Yang,A.,Fan,A., Breakthroughsinstatistics: Methodologyanddistribu-
etal. TheLlama3herdofmodels. arXiv:2407.21783, tion,pp.492û518.Springer,1992.
2024.
Ippolito,D.,TramΦr,F.,Nasr,M.,Zhang,C.,Jagielski,M.,
Dwork,C.,McSherry,F.,Nissim,K.,andSmith,A. Cal- Lee,K.,Choquette-Choo,C.A.,andCarlini,N. Prevent-
ibratingnoisetosensitivityinprivatedataanalysis. In ingverbatimmemorizationinlanguagemodelsgivesa
TCC,pp.265û284,2006. falsesenseofprivacy. InINLG-SIGDIAL,2023.
Gadre, S. Y., Smyrnis, G., Shankar, V., Gururangan, S., Kaissis,G.,Hayes,J.,Ziller,A.,andRueckert,D.Bounding
Wortsman, M., Shao, R., Mercat, J., Fang, A., Li, J., data reconstruction attacks with the hypothesis testing
| Keh,S.,etal.                  | Languagemodelsscalereliablywithover- |     |              |     |     |                                      |                   |     |
| ----------------------------- | ------------------------------------ | --- | ------------ | --- | --- | ------------------------------------ | ----------------- | --- |
|                               |                                      |     |              |     |     | interpretationofdifferentialprivacy. | arXiv:2307.03928, |     |
| trainingandondownstreamtasks. |                                      |     | InICLR,2025. |     |     | 2023.                                |                   |     |
Ganguli, D., Hernandez, D., Lovitt, L., Askell, A., Bai, Kaissis,G.,Kolek,S.,Balle,B.,Hayes,J.,andRueckert,D.
| Y., Chen, | A., Conerly, | T., Dassarma, |                     | N., Drain, | D., El- |                                                  |                       |     |
| --------- | ------------ | ------------- | ------------------- | ---------- | ------- | ------------------------------------------------ | --------------------- | --- |
|           |              |               |                     |            |         | Beyondthecalibrationpoint:                       | Mechanismcomparisonin |     |
| hage, N., | El Showk,    | S., Fort,     | S., Hatfield-Dodds, |            | Z.,     |                                                  |                       |     |
|           |              |               |                     |            |         | differentialprivacy. InICML,pp.22840û22860,2024. |                       |     |
Henighan,T.,Johnston,S.,Jones,A.,Joseph,N.,Kernian,
J.,Kravec,S.,Mann,B.,Nanda,N.,Ndousse,K.,Olsson, Kaplan, J., McCandlish, S., Henighan, T., Brown, T. B.,
C.,Amodei,D.,Brown,T.,Kaplan,J.,McCandlish,S., Chess,B.,Child,R.,Gray,S.,Radford,A.,Wu,J.,and
Olah, C., Amodei, D., andClark, J. Predictabilityand Amodei, D. Scaling laws for neural language models.
surpriseinlargegenerativemodels. InFAccT,2022. arXiv:2001.08361,2020.
10

ScalingLawsforDifferentiallyPrivateLanguageModels
Kingma,D.P.andBa,J. Adam: Amethodforstochastic Sander, T., Stock, P., and Sablayrolles, A. TAN without
optimization. InICLR,2015. aburn: ScalinglawsofDP-SGD. InICML,pp.29937û
29949,2023.
Kurakin,A.,Song,S.,Chien,S.,Geambasu,R.,Terzis,A.,
andThakurta,A. TowardtrainingatImageNetscalewith Sander,T.,Yu,Y.,Sanjabi,M.,Durmus,A.,Ma,Y.,Chaud-
differentialprivacy. arXiv:2201.12328,2022. huri,K.,andGuo,C. Differentiallyprivaterepresentation
|          |                 |     |           |     |                |     | learningviaimagecaptioning. |     |     | InICML,2024. |     |     |
| -------- | --------------- | --- | --------- | --- | -------------- | --- | --------------------------- | --- | --- | ------------ | --- | --- |
| Kurakin, | A., Ponomareva, |     | N., Syed, |     | U., MacDermed, | L., |                             |     |     |              |     |     |
andTerzis,A. Harnessinglarge-languagemodelstogen- Shallue, C. J., Lee, J., Antognini, J., Sohl-Dickstein, J.,
| erateprivatesynthetictext.               |     |     | arXiv:2306.01684,2023. |     |     |           |                                     |     |     |                           |            |     |
| ---------------------------------------- | --- | --- | ---------------------- | --- | --- | --------- | ----------------------------------- | --- | --- | ------------------------- | ---------- | --- |
|                                          |     |     |                        |     |     |           | Frostig,R.,andDahl,G.E.             |     |     | Measuringtheeffectsofdata |            |     |
|                                          |     |     |                        |     |     |           | parallelismonneuralnetworktraining. |     |     |                           | JMLR,2019. |     |
| Li,X.,TramΦr,F.,Liang,P.,andHashimoto,T. |     |     |                        |     |     | Largelan- |                                     |     |     |                           |            |     |
guagemodelscanbestrongdifferentiallyprivatelearners.
|     |     |     |     |     |     |     | Stiennon, | N., Ouyang, | L., Wu, | J., Ziegler, | D.  | M., Lowe, |
| --- | --- | --- | --- | --- | --- | --- | --------- | ----------- | ------- | ------------ | --- | --------- |
InICLR,2022.
|     |     |     |     |     |     |     | R., Voss,                                  | C., Radford, | A., | Amodei, | D., andChristiano, |     |
| --- | --- | --- | --- | --- | --- | --- | ------------------------------------------ | ------------ | --- | ------- | ------------------ | --- |
|     |     |     |     |     |     |     | P.F. Learningtosummarizewithhumanfeedback. |              |     |         |                    | In  |
Liu,P.J.,Novak,R.,Lee,J.,Wortsman,M.,Xiao,L.,Ev-
NeurIPS,2020.
erett,K.,Alemi,A.A.,Kurzeja,M.,Marcenac,P.,Gur,I.,
Kornblith,S.,Xu,K.,Elsayed,G.,Fischer,I.,Pennington,
|                                |     |     |     |                 |     |     | Subramani,P.,Vadivelu,N.,andKamath,G. |     |     |     |     | Enablingfast |
| ------------------------------ | --- | --- | --- | --------------- | --- | --- | ------------------------------------- | --- | --- | --- | --- | ------------ |
| J.,Adlam,B.,andDickstein,J.-S. |     |     |     | NanoDO:Aminimal |     |     |                                       |     |     |     |     |              |
differentiallyprivateSGDviajust-in-timecompilation
transformerdecoder-onlylanguagemodelimplementa-
|         |       |       |                               |     |     |     | andvectorization. | InNeurIPS,pp.26409û26421,2021. |     |     |     |     |
| ------- | ----- | ----- | ----------------------------- | --- | --- | --- | ----------------- | ------------------------------ | --- | --- | --- | --- |
| tion in | JAX., | 2024. | URL http://github.com/google- |     |     |     |                   |                                |     |     |     |     |
deepmind/nanodo. Tang,X.,Shin,R.,Inan,H.A.,Manoel,A.,Mireshghallah,
|             |        |         |     |           |        |       | F.,Lin,Z.,Gopi,S.,Kulkarni,J.,andSim,R. |     |     |     |     | Privacy- |
| ----------- | ------ | ------- | --- | --------- | ------ | ----- | --------------------------------------- | --- | --- | --- | --- | -------- |
| Loshchilov, | I. and | Hutter, | F.  | Decoupled | weight | decay |                                         |     |     |     |     |          |
preservingin-contextlearningwithdifferentiallyprivate
| regularization, |     | 2019. | URL | https://arxiv.org/abs/ |     |     |                     |     |            |     |     |     |
| --------------- | --- | ----- | --- | ---------------------- | --- | --- | ------------------- | --- | ---------- | --- | --- | --- |
|                 |     |       |     |                        |     |     | few-shotgeneration. |     | ICLR,2024. |     |     |     |
1711.05101.
|     |     |     |     |     |     |     | Thaker, P., | Setlur, A., | Wu, Z. | S., and | Smith, | V. Leverag- |
| --- | --- | --- | --- | --- | --- | --- | ----------- | ----------- | ------ | ------- | ------ | ----------- |
Lukas,N.,Salem,A.,Sim,R.,Tople,S.,Wutschitz,L.,and
|                   |     |     |           |         |     |            | ing public | representations |     | for private | transfer | learning. |
| ----------------- | --- | --- | --------- | ------- | --- | ---------- | ---------- | --------------- | --- | ----------- | -------- | --------- |
| Zanella-BΘguelin, |     | S.  | Analyzing | leakage | of  | personally |            |                 |     |             |          |           |
arXiv:2312.15551,2023.
| identifiableinformationinlanguagemodels. |     |     |     |     |     | InS&P, |     |     |     |     |     |     |
| ---------------------------------------- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- | --- |
2023.
Tobaben,M.,Shysheya,A.,Bronskill,J.,Paverd,A.,Tople,
S.,Zanella-Beguelin,S.,Turner,R.E.,andHonkela,A.
| McCandlish, | S., | Kaplan, | J., | Amodei, | D., | and Team, |     |     |     |     |     |     |
| ----------- | --- | ------- | --- | ------- | --- | --------- | --- | --- | --- | --- | --- | --- |
Ontheefficacyofdifferentiallyprivatefew-shotimage
| O. D. | An empirical |     | model | of large-batch |     | training. |                 |            |     |     |     |     |
| ----- | ------------ | --- | ----- | -------------- | --- | --------- | --------------- | ---------- | --- | --- | --- | --- |
|       |              |     |       |                |     |           | classification. | TMLR,2023. |     |     |     |     |
arXiv:1812.06162,2018.
|            |                                         |     |     |     |     |     | TramΦr, | F., Kamath, | G., | and Carlini, |     | N. Posi- |
| ---------- | --------------------------------------- | --- | --- | --- | --- | --- | ------- | ----------- | --- | ------------ | --- | -------- |
| Nocedal,J. | Updatingquasi-Newtonmatriceswithlimited |     |     |     |     |     |         |             |     |              |     |          |
tion:considerationsfordifferentiallyprivatelearningwith
| storage. | MathematicsofComputation,35(151):773û782, |     |     |     |     |     |                               |     |     |              |     |     |
| -------- | ----------------------------------------- | --- | --- | --- | --- | --- | ----------------------------- | --- | --- | ------------ | --- | --- |
|          |                                           |     |     |     |     |     | large-scalepublicpretraining. |     |     | InICML,2024. |     |     |
1980.
Wang,B.,Zhang,Y.,Cao,Y.,Li,B.,McMahan,H.,Oh,S.,
| Nocedal, | J. and | Wright, | S. J. | Numerical | Optimization. |     |     |     |     |     |     |     |
| -------- | ------ | ------- | ----- | --------- | ------------- | --- | --- | --- | --- | --- | --- | --- |
Springer,1999. Xu,Z.,andZaheer,M. Canpubliclargelanguagemodels
|     |     |     |     |     |     |     | helpprivatecross-devicefederatedlearning? |     |     |     |     | InNAACL |
| --- | --- | --- | --- | --- | --- | --- | ----------------------------------------- | --- | --- | --- | --- | ------- |
Ponomareva,N.,Hazimeh,H.,Kurakin,A.,Xu,Z.,Denison, (Findings),pp.934û949,2024.
| C., McMahan, |     | H. B., | Vassilvitskii, |     | S., Chien, | S., and |     |     |     |     |     |     |
| ------------ | --- | ------ | -------------- | --- | ---------- | ------- | --- | --- | --- | --- | --- | --- |
Thakurta,A.G. HowtoDP-fyML:Apracticalguideto Wu,F.,Inan,H.A.,Backurs,A.,Chandrasekaran,V.,Kulka-
|                                         |     |     |     |     |     |            | rni,J.,andSim,R.           | Privatelyaligninglanguagemodels |     |             |     |     |
| --------------------------------------- | --- | --- | --- | --- | --- | ---------- | -------------------------- | ------------------------------- | --- | ----------- | --- | --- |
| machinelearningwithdifferentialprivacy. |     |     |     |     |     | JAIR,2023. |                            |                                 |     |             |     |     |
|                                         |     |     |     |     |     |            | withreinforcementlearning. |                                 |     | ICLR,2024a. |     |     |
Prashanth,U.S.,Deng,A.,OÆBrien,K.,SV,J.,Khan,M.A.,
Borkar,J.,Choquette-Choo,C.A.,Fuehne,J.R.,Bider- Wu, T., Panda, A., Wang, J. T., and Mittal, P. Privacy-
preservingin-contextlearningforlargelanguagemodels.
| man,S.,Ke,T.,etal.                       |     |     | Recite,reconstruct,recollect:Mem- |     |     |         |               |     |     |     |     |     |
| ---------------------------------------- | --- | --- | --------------------------------- | --- | --- | ------- | ------------- | --- | --- | --- | --- | --- |
| orizationinLMsasamultifacetedphenomenon. |     |     |                                   |     |     | InICLR, | InICLR,2024b. |     |     |     |     |     |
2025.
Xie,C.,Lin,Z.,Backurs,A.,Gopi,S.,Yu,D.,Inan,H.A.,
Rush, J. K., Charles, Z., Garrett, Z., Augenstein, S., and Nori,H.,Jiang,H.,Zhang,H.,Lee,Y.T.,etal. Differen-
Mitchell,N.E.DrJAX:Scalableanddifferentiablemapre- tiallyprivatesyntheticdataviafoundationmodelAPIs2:
| duceprimitivesinJAX. |     |     | InWANT@ICML,2024. |     |     |     | Text. InICML,2024. |     |     |     |     |     |
| -------------------- | --- | --- | ----------------- | --- | --- | --- | ------------------ | --- | --- | --- | --- | --- |
11

ScalingLawsforDifferentiallyPrivateLanguageModels
Xu,Y.,Lee,H.,Chen,D.,Hechtman,B.,Huang,Y.,Joshi,
| R., Krikun, | M., | Lepikhin, | D., | Ly, A., Maggioni, | M., |
| ----------- | --- | --------- | --- | ----------------- | --- |
etal. GSPMD:generalandscalableparallelizationfor
| MLcomputationgraphs. |     |     | arXiv:2105.04663,2021. |     |     |
| -------------------- | --- | --- | ---------------------- | --- | --- |
Yeom,S.,Giacomelli,I.,Fredrikson,M.,andJha,S.Privacy
| risk in machine |                        | learning: | Analyzing | the connection | to  |
| --------------- | ---------------------- | --------- | --------- | -------------- | --- |
| overfitting.    | InCSF,pp.268û282,2018. |           |           |                |     |
You,Y.,Li,J.,Reddi,S.,Hseu,J.,Kumar,S.,Bhojanapalli,
| S., Song,                                 | X., Demmel, |       | J., Keutzer, | K., and            | Hsieh, C.- |
| ----------------------------------------- | ----------- | ----- | ------------ | ------------------ | ---------- |
| J. Largebatchoptimizationfordeeplearning: |             |       |              |                    | Training   |
| BERT in                                   | 76 minutes, | 2020. | URL          | https://arxiv.org/ |            |
abs/1904.00962.
| Yu,D.,Zhang,H.,Chen,W.,Yin,J.,andLiu,T.-Y.        |     |     |     |     | Large |
| ------------------------------------------------- | --- | --- | --- | --- | ----- |
| scaleprivatelearningvialow-rankreparametrization. |     |     |     |     | In    |
ICML,2021.
Yu,D.,Naik,S.,Backurs,A.,Gopi,S.,Inan,H.A.,Kamath,
| G., Kulkarni,           | J., | Lee, Y.T., | Manoel,                    | A., Wutschitz, | L., |
| ----------------------- | --- | ---------- | -------------------------- | -------------- | --- |
| Yekhanin,S.,andZhang,H. |     |            | Differentiallyprivatefine- |                |     |
| tuningoflanguagemodels. |     |            | InICLR,2022.               |                |     |
Zhang,H.,Morwani,D.,Vyas,N.,Wu,J.,Zou,D.,Ghai,
| U.,Foster,D.,andKakade,S.         |                                       |                                    |               | Howdoescriticalbatch |         |
| --------------------------------- | ------------------------------------- | ---------------------------------- | ------------- | -------------------- | ------- |
| sizescaleinpre-training?          |                                       |                                    | InICLR,2025.  |                      |         |
| Zhang, L.,                        | Li, B.,                               | Thekumparampil,                    |               | K. K., Oh,           | S., and |
| He,N. DPZero:                     |                                       | Privatefine-tuningoflanguagemodels |               |                      |         |
| withoutbackpropagation.           |                                       |                                    | InICML,2024a. |                      |         |
| Zhang,X.,Bu,Z.,Wu,Z.S.,andHong,M. |                                       |                                    |               | Differentially       |         |
| private SGD                       | without                               | clipping                           | bias:         | An error-feedback    |         |
| approach.                         | InICLR,2024b.                         |                                    |               |                      |         |
| Zhu, Y., Kiros,                   | R.,                                   | Zemel,                             | R. S.,        | Salakhutdinov,       | R., Ur- |
| tasun, R.,                        | Torralba,                             | A.,                                | and Fidler,   | S. Aligning          | books   |
| andmovies:                        | Towardsstory-likevisualexplanationsby |                                    |               |                      |         |
| watchingmoviesandreadingbooks.    |                                       |                                    |               | InICCV,pp.19û27,     |         |
2015.
Ziller,A.,Mueller,T.T.,Stieger,S.,Feiner,L.F.,Brandt,
| J.,Braren,R.,Rueckert,D.,andKaissis,G.   |     |     |     | Reconciling |        |
| ---------------------------------------- | --- | --- | --- | ----------- | ------ |
| privacyandaccuracyinaiformedicalimaging. |     |     |     |             | Nature |
MachineIntelligence,6(7):764û774,2024.
12

ScalingLawsforDifferentiallyPrivateLanguageModels
A.LimitationsandOpenQuestions
WhileourmethodologyrevealedanumberofinterestingfindingsaboutthebehaviorofscalinglawsunderDP,thereare
somelimitationsofourapproachandquestionsthatremainunansweredthatweenumeratebelow.
FixedPhysicalBatchSize. OurmethodologyreliescruciallyontheassumptionthattheGaussiannoiseintroducedto
preserveprivacyfaroutweighstherandomnessintroducedfromminibatchsampling,andthusitwouldbesufficientvarythe
noise-batchratiowhilekeepingthephysicalbatchsizefixedtoalargeconstantvalueof1024. AppendixC.3revealsthatthis
assumptionmaynotbefullytrue,andthatthephysicalbatchsizehasamorenuancedeffectthatwecannotfullyexplain.
RobustnesstoOtherTrainingSetups. OurmethodologyfocusesonasingleclassofBERTmodels,withafixeddataset
andDPmechanism,whichallowedustododeeperexperimentationonotherrelevantvariables. Ourgeneralmethodology
holdsfordifferentmodels,datasets,andmechanisms,buttheexactquantitativefindingsmaydifferunderdifferenttraining
setups.AsthefieldcontinuestomakeadvancementsontrainingtransformerswithDP,itwouldbeinterestingandinformative
torerunourexperimentswithbetterbasemechanisms.
Pre-trainingvs. Fine-tuning. Asanimportantfirststep,wefocusedonthepre-trainingregimeinthiswork,wherewe
startwithacompletelyrandommodelwhichwetrainfromscratch. Fine-tuningapre-trainedmodelwithDPisoftena
preferableapproachinpracticetogetthebestprivacy/utilitytrade-offs(Yuetal.,2022;Lietal.,2022). Thereareanumber
ofchallengestoovercometoquantifythescalinglawsinthisregime,butitremainsaninterestingquestionforfuturework.
SequenceLength. Ourexperimentsfocusonafixedsequencelengthof512tokens,whichwasthedefaultvalueinthe
experimentwebranched. However,thesequencelengthisyetanotherimportantknobthatcanbetunedalongsidethebatch
size,modelsize,andnumberofiterationsinlanguagemodelingtasks. Therearelikelyinterestingtrade-offstoexplorehere:
withsmallersequencelengths,lesscontextisavailabletopredictthenext/missingtokens,butthesavedcomputationcan
beusedtoincreasethebatchsize,modelsize,ornumberofiterations. Whetherthetrade-offisworthitlikelydependson
theexactsettingaswellasthedistributionalpropertiesofthetrainingdata.
Over-TrainingandInference-TimeCompute. WhilethisworkfocusesontheFLOPsrequiredtopre-trainamodeltoa
givenlossthreshold,inpracticelanguagemodelsareoftenover-trainedinordertoaccountforinference-timecosts(Gadre
etal.,2025). Ifamodelisgoingtobedeployed,itmaymakesensetoover-trainasmallermodel(whichischeapertoserve)
thantotrainalargermodelforacompute-optimalFLOPsbudget. Whilewedonotstudyover-traininginourwork,we
notethatsuchastudyisparticularlyfruitfulinthecaseofDPtraining;theprivacycostsalreadyoftenfavorsmallermodels
(whencomparedtonon-privatescalinglaws). InvestigatingthisconfluencewouldlikelyyieldvaluableinsightsintoDP
scalinglaws.
LargerModelSizes. Theaccuracyofanygivenscalinglawispredicatedtosomedegreeontherangeofmodelsizes
trainedon. Forexample,Hoffmannetal.(2022)trainmodelofupto16Bparameters. Duetothenecessityofusingvery
largebatchsizes,trainingmodelsofsuchscalerequiresasignificantamountofcompute. Weleavethetaskoftrainingon
modeloflargerscaletofuturework,alongwithanalysisofhowmuchthisaffectsthederivedscalinglaw.
EfficientImplementationsofPer-ExampleGradientClipping. Whenconsideringtouseasignificantcomputebudget
totrainalargelanguagemodelwithDP,itisimportantthatthatmodeltrainingcodeiscarefullyoptimizedtominimizethe
overheadsofDPtraining. Usingefficientvectorizedper-exampleclippingimplementationsinJAXhavebeenshownto
workperformwellwithareasonableoverheadcomparedtonon-privatetraining(Subramanietal.,2021),althoughthis
focusedonsingle-machinetrainingscenarios,andmorecarefulstudyisneededinthisareawhendoingmulti-machine
training,especiallywhenmovingbeyondpuredata-parallelism,whichwefocusedoninthispaper.
TheChoiceofOptimizer Ouranalysisreliesoncurrentoptimizationtechniques,whichmaynotbeoptimalforprivacy-
preservingtraining. Severalpotentialoptimizerimprovementscouldaffectourfindings. Auniformlybetteroptimizerwould
likelypreservetheobservedscalingrelationshipswhiletheactualoptimaloperatingpointsmightshift. Inpreviousscaling
lawstudieswedoseethebetteroptimizercansomehowsmoothoutthediscontinuitiesinscalingbehavior(Chenetal.,
2023;Loshchilov&Hutter,2019)orevenenablenewscalingregimessometimes(e.g.,LAMB(Youetal.,2020)forlarge
13

ScalingLawsforDifferentiallyPrivateLanguageModels
Algorithm2GeneralizedDP-SGD.
Input: DatasetD,noise-batchratio?»,(expected)batchsizeB,iterationsT
Output: Modelparameters?.
Initializemodelparameters? ?RM
0
fort=1toT do
Selecta(possiblyrandom)size?BminibatchB ?D
t
g»= 1 (cid:80) clip(??(? ;x))
B x?Bt t?1
gÿ=g+?»N(0,1)M
? =OptimizerUpdate(? ,gÿ)
t t?1
return?
T
batchsizepre-trainingshowsaverydifferentscalingbehavior). Theoptimizersspecificallydesignedforprivacy-preserving
trainingmightrecommendanewsetofparameterstoenablebetterabsoluteperformance.
B.AdditionalDetails
B.1.NotesonGeneralizedDP-SGD
MinibatchSelectionWewerevagueinourdescriptionoftheminibatchselectionstep. InmostdescriptionsofDP-SGD,
theminibatchisformedbyPoissonsubsamplingwithafixedprobability. Samplingwithorwithoutreplacement,aswell
asdeterministicbatchingarealsopossible(Balleetal.,2018). Inourpaper,wecalibratednoiseunderboththePoisson
sampling assumption and the deterministic batching strategy, picking the lower noise multiplier. When doing Poisson
sampling,weusethesamplingprobabilityB/N andnoisemultiplierB╖?».
KnownQuantitiesIfdoingPoissonsampling,wetypicallyareoperatingundertheadd/removeadjacencydefinition. Under
thisdefinition,N isconsideredasensitivequantitythatwedonothaveaccesstodirectly,hencewecannottechnically
definethesamplingprobabilityasB/N withoutviolatingDP.WealsorelyonN lateron,discussingitsimportanceasitis
interpretedasthedatabudget. Ifnecessary,onecanapproximateN quiteaccuratelywithDPsinceitisasimplecount.
Alternatively,onecansimplyusetheôzero-outöadjacencynotion(Chuaetal.,2024b),whereN isknownbutPoisson
samplingstillenjoysthesameprivacyanalysis.
ClippingFunctionWeomitaclippingnormparameterinthedefinitionofôclipö. Thiscanbeanyfunctionthatmapsan
arbitraryreal-valuedvectortoonewith? -normatmostone. OnestandardchoiceistoclipthenormtoC,andthendivide
2
byC (Deetal.,2022).
B.2.UnitofPrivacyandMultipleParticipations
Intraditionalscalinglawswork,itiscommontoassumeaccesstoanendlessstreamofdatathatdoesnotrequireprivacy
protections. Therefore,everytrainingexampleisonlyseenonce,whichsimplifiestheanalysisofthescalinglaws. Inour
case,wetrainedourmodelsfor128K iterationswithaphysicalbatchsizeof1024,whichisslightlylessthanasingle
passoverourentiredataset, satisfyingthetypicalassumption. However, inourdataanalysis, weestimatewhatwould
happenwithsignificantlylargerbatchsizesthanweranwith,andinsomecasesthiswouldinvolvemultiplepassesover
theactualprivatedataset,somethingwedidnotaccountfordirectlyinouranalysis. Therefore,theactuallysettingthatis
bestrepresentedbyourexperimentalmethodologyisnotactuallyexample-levelDP,butratheruser-levelDP.There,we
mayassumethatwehaveafinitenumberofusersN (whichweshouldnowinterpretasthedatabudget),butwehavean
endlessstreamofdataforeachuser. Thiscircumventsthemainconcern,whileallowingforuserstoparticipatemultiple
timesduringtrainingwhichistypicallyveryusefulunderDP.Alternatively,onecanstillconsidertheexample-levelDP
setting,whereeachbaseexamplehasmultipleaugmentations(e.g.,rewrittentextsequencesthataresemanticallysimilar)
thatwecantrainon. Allofourfindingsshouldhold,andbemorereliableinthissettingbasedonourmethodology.
B.3.FLOPsestimationunderDP
Asdiscussed,weapproximatethecomputecostC as6╖M╖B╖S╖T basedonthenon-privatescalinglaws(Kaplanetal.,
2020;Hoffmannetal.,2022)exceptthatBrepresentsthenumberofexamples(nottokens)inabatch,asthisdeterminesthe
privacybudget. Thiscostmodelisusefulbecausewecandirectlycomparetothenon-privatescalinglaws. Further,thiscost
modelisalsoaccuratebecausetheextraoverheadofDP-SGDcomparedtoAdamcanbedirectlyamortized: compiler-based
14

ScalingLawsforDifferentiallyPrivateLanguageModels
systemslikeGSPMD(Xuetal.,2021)andparallelmachinelearninglibraries(Rushetal.,2024)letusparallelizethe
per-examplegradientcomputationswithoutalinear(inB)increaseinmemoryusage. Thetotalclippingcostsareonly
asmalllinearcost(comprisingofonlyelement-wiseoperationsandnomatrixmultiplications)inM,T,andB (andare
independentofsequencelengthS);thetotalnoisingcostsareindependentofBandarelinearinonlyM andT. Thus,the
overallcomputeinDP-SGDisdominatedbythenon-privateapproximationabove.
C.AdditionalExperiments
C.1.SaturatingComputeBudget
Buildingonourfindingsabove,itisnaturaltoaskwherethesaturationpointoccursfordifferentprivacybudgetanddata
budgets. Thiscanbehelpfultodeterminehowmuchcomputeisneededtogetthemostutilityunderafixeddataandprivacy
budget,aswellashowtospendthatcomputeoptimally. TheseresultsareshowninTable2.
ò Withahigherdataandprivacybudget,webenefitsubstantiallyfromlargercomputebudgets.
ò WithDP,thecompute-optimaltrainingconfigurationsrequirestrainingsignificantlysmallermodelsoversignificantly
moretokensthanwithoutDP.Forthesetrainingconfigurations,theratiooftrainingtokenstomodelparametersvariesin
differentsettings,butinallsettingsitissignificantlylargerthanitwouldbewithoutDP,wherepriorworkfound20╫to
beagoodruleofthumb(Hoffmannetal.,2022).
Table2.Saturatingcomputebudgets,aswellasoptimaltrainingconfigurationsforthosecomputebudgetsacrossarepresentativesetof
dataandprivacybudgets.
| Data    | Privacy Compute | Cross Model  | Iterations | Batch   | Token/Model |
| ------- | --------------- | ------------ | ---------- | ------- | ----------- |
| Budget  | Budget Budget   | Entropy Size |            | Size    | Ratio       |
| 1.0╫105 | 1.3╫1016        | 4.6╫106      | 1.8╫103    | 5.1╫102 | 1.0╫102     |
|         | 1               | 7.28         |            |         |             |
|         | 4 1.1╫1017      | 6.65 4.6╫106 | 1.8╫103    | 4.1╫103 | 8.5╫102     |
|         | 16 2.0╫1018     | 5.60 1.7╫107 | 2.7╫103    | 1.4╫104 | 1.1╫103     |
|         | 7.5╫1018        | 2.0╫107      | 6.3╫103    | 1.9╫104 | 3.2╫103     |
|         | 64              | 4.63         |            |         |             |
| 1.0╫106 | 1 2.8╫1017      | 5.89 4.6╫106 | 2.5╫103    | 8.2╫103 | 2.3╫103     |
|         | 4 8.8╫1018      | 4.62 1.9╫107 | 6.5╫103    | 2.3╫104 | 4.1╫103     |
|         | 3.3╫1019        | 1.7╫107      | 1.4╫104    | 4.6╫104 | 1.9╫104     |
|         | 16              | 3.61         |            |         |             |
|         | 64 3.2╫1020     | 2.82 4.9╫107 | 1.2╫104    | 1.9╫105 | 2.2╫104     |
| 1.0╫107 | 1 3.8╫1019      | 3.73 1.7╫107 | 9.6╫103    | 7.8╫104 | 2.3╫104     |
|         | 4 3.8╫1020      | 2.81 4.9╫107 | 1.1╫104    | 2.2╫105 | 2.6╫104     |
|         | 16 2.0╫1021     | 2.15 7.0╫107 | 1.2╫104    | 7.4╫105 | 6.7╫104     |
|         | 64 4.4╫1022     | 1.66 3.3╫108 | 4.9╫104    | 8.8╫105 | 6.7╫104     |
| 1.0╫108 | 1 5.2╫1021      | 2.26 1.3╫108 | 5.8╫104    | 2.2╫105 | 4.9╫104     |
|         | 4 4.4╫1022      | 1.66 3.3╫108 | 4.9╫104    | 8.8╫105 | 6.7╫104     |
|         | 16 1.0╫1023     | 1.32 3.3╫108 | 9.3╫104    | 1.0╫106 | 1.5╫105     |
|         | 1.0╫1023        | 3.3╫108      | 1.1╫105    | 8.8╫105 | 1.5╫105     |
|         | 64              | 1.23         |            |         |             |
| 1.0╫109 | 1 8.5╫1022      | 1.36 3.3╫108 | 9.4╫104    | 8.8╫105 | 1.3╫105     |
|         | 4 1.0╫1023      | 1.23 3.3╫108 | 1.1╫105    | 8.8╫105 | 1.5╫105     |
|         | 16 1.0╫1023     | 1.22 3.3╫108 | 1.1╫105    | 8.8╫105 | 1.5╫105     |
|         | 64 1.2╫1023     | 1.20 3.3╫108 | 1.1╫105    | 1.1╫106 | 1.8╫105     |
C.2.FullExperimentGrid
InFigure6,weplotthecross-entropylossfordifferentprivacybudgets,databudgets,andcomputebudgetsundervarying
numbersofiterations,modelsizes,andbatchsizes. Muchcanbelearnedfromtheseplots,including:
ò TheoptimalnumberofiterationstypicallyfallsaroundT ?10K,andtheoptimalbatchsizeoftenfallsintherange
B ?10?100K,althoughneitheroftheseisuniversallytrueandasexpecteditdependsonthevaluesoftheprivacy,
data,andcomputebudgets. Batchsizeseemstobethemostimportantparameter,asindicatedbythesteepslopeof
thoselines.
C.3.PhysicalBatchSizeAblation
Centraltoourmethodologyisanassumptionthatforafixednoise-batchratio,thetrainingcurvesshouldbesimilarfor
differentphysicalbatchsizes. Inthissection,weconductablationstotestthishypothesis,andquantifytheimpactofvarying
physicalbatchsizeunderafixednoise-batchratio. Weconsider3valuesfornoise-batchratio: 0.520,0.515,and0.510,and
15

ScalingLawsforDifferentiallyPrivateLanguageModels
 
 ] T S V X R )  W W S V '  4 V M Z E G ]  & Y H K I X
 
 
4
  
 
  
 
                                               
|     |  - X I V E X M S R W |     |  1 S H I P  7 M ^ I |     |  & E X G L  7 M ^ I |
| --- | -------------------- | --- | -------------------- | --- | -------------------- |
 
 ( E X E  & Y H K I X
 ] T S V X R )  W W S V '
106
 
107
108
 
109
 
                                               
|     |  - X I V E X M S R W |     |  1 S H I P  7 M ^ I |     |  & E X G L  7 M ^ I |
| --- | -------------------- | --- | -------------------- | --- | -------------------- |
   ' S Q T Y X I  & Y H K I X
 ] T S V X R )  W W S V '
1017
 
1019
1021
 
1023
 
                                                   
|     |  - X I V E X M S R W |     |  1 S H I P  7 M ^ I |     |  & E X G L  7 M ^ I |
| --- | -------------------- | --- | -------------------- | --- | -------------------- |
Figure6.Cross-entropyofbestmodelstrainedineachsetting. Fromtoptobottom,wevarythePrivacyBudget,DataBudget,and
ComputeBudget,keepingtheothertwobudgetsfixedtodefaultvalues(bolded).Fromlefttoright,wevarythenumberofIterations,the
ModelSize,andtheBatchSize,andtreattheothertwoasnuisanceparameterswhichweminimizeover.
|     |     |  4 L ] W M G E P  & E X G L  7 M ^ I |     |  4 L ] W M G E P  & E X G L  7 M ^ I |     |
| ------ | --- | -------------------------------------- | --- | -------------------------------------- | --- |
|        |     |                                     |     |                                  |     |
   
|                                   |     |       |     |              |     |
| --------------------------------- | --- | -------- | --- | --------------- | --- |
|  ] T S V X R )  W W S V '     |     |      |     |          |     |
   
|        |     |      |     |                |                        |
| ------ | --- | -------- | --- | ------------------ | ---------------------- |
|     |     |          |     |  4 L ] W M G E P  |  &  E X  G L  7 M ^ I |
       
     
|     |     |     |     |     |     |
| ------ | --- | --- | --- | --- | ------ |
     
    
|    |     |     |     |     |      |
| --- | --- | --- | --- | --- | -------- |
 
                                       
|     |  - X I V E X M S R W |     |  - X I V E X M S R W |     |  - X I V E X M S R W |
| --- | -------------------- | --- | -------------------- | --- | -------------------- |
(a)noise-batchratio=0.520 (b)noise-batchratio=0.515 (c)noise-batchratio=0.510
Figure7.Cross-entropylossofBertTinyaveragedover3trialsfordifferentphysicalbatchsizesandnoise-batchratiovalues.
physicalbatchsizesof128,512,2048,and8192. ForthisablationwefocusontheBertTinymodel,whichwetrainfor
| 128Kiterations.                              | Weaveragethelossesacrossthreerandomtrials. |     |                        |     |     |
| -------------------------------------------- | ------------------------------------------ | --- | ---------------------- | --- | --- |
| TheresultsofthisexperimentareshowninFigure7. |                                            |     | Ourprimaryfindingsare: |     |     |
ò Atthesmallestnoise-batchratioinFigure7a,resultsareasexpected. Specifically,largerbatchsizesleadtobettermodel
performance,buttherearediminishingreturns. PhysicalBatchSizesof2048and8192havenearlyidenticaltraining
curves.
ò Atthemediumandlargernoise-batchratiovaluesshowninFigures7band7c,weobserveasurprisingphenomenon:
smallerphysicalbatchsizesleadtomodelswithlowerloss. TheeffectismostprominentinFigure7c. Wedonot
haveagoodexplanationforthisbehavior,butwedidadditionalexperimentstoruleoutsomeplausibleexplanationsin
AppendixC.4. Largephysicalbatchsizes(B =2048andB =8192)stillhaveverysimilarlearningcurves.
Whiletheresultsofthisexperimentdidnotfullymatchexpectations,asimilarbehaviorwasobservedinpriorwork(Sander
16

ScalingLawsforDifferentiallyPrivateLanguageModels
etal.,2023)(Figure4b).Moreover,forsufficientlylargebatchsizesthetrainingcurvesareverysimilaracrossallnoise-batch
ratiovaluestested. Thus,webelievethatthephysicalbatchsizeof1024thatweuseinourmainexperimentsisareasonable
(althoughnotperfect)indicatorofwhatwouldhappenwithmuchlargerbatchsizesthatwouldbeneededtogetfavorable
privacy/utilitytrade-offsinreal-worldsettings. Understandingwhenandwhythsibehaviormanifestsisaveryinteresting
directionforfuturework.
C.4.PhysicalBatchSizeAblation-Extended
InAppendixC.3weobservedasurprisingphenomenonwhereforsomevaluesofnoise-batchratio,smallerphysicalbatch
sizesperformbetterthanlargerphysicalbatchsizes. Thisisincontrasttoourinitialhypothesis, andourexperimental
resultsforverysmallvaluesofnoise-batchratiothatlargerphysicalbatchsizesshouldbeonparwithorbetterthansmaller
physicalbatchsizesforthesamenoise-batchratio.
Whilewedonothaveagreatexplanationfortheobservedphenomenon,wehaveruledoutseveralpossibleexplanations,
whichwediscussbelow:
1. LearningRateTuning. Whileourmainexperimentusedafixedlearningrateof0.58acrossallvaluesofnoise-batch
ratio,weranfurtherexperimentsforanoise-batchratioof0.515withfourdifferentlearningrates(0.56,0.57,0.58,0.59),
andreportthebestcross-entropyacrossalllearningratesonaper-iterationbasis. Evenwithlearningratetuning,the
conclusionisthesame: smallerphysicalbatchsizesachievelowerlossthanlargerones(seeFigure8).
    
 
    
   
    
 
    
   
           
 - X I V E X M S R W
 ] T S V X R )  W W S V '
 4 L ] W M G E P  & E X G L  7 M ^ I
   
   
    
    
Figure8. Smallerphysicalbatchsizesachievelowerlossthanlargerones.
2. DifferencesinTrain/EvalLoss. Ourmainexperimentmeasuresthetrainingloss,butsincethelossiscomputed
beforeincorporatingthegradientintothemodel,andbecausewetrainforlessthanonepassovertheentiredataset,
this is an unbiased estimate of the evaluation loss. It is natural to ask which models have lower final loss on the
trainingset(afterincorporatingthoseexamplesintothemodel). Totestwhetherlowerphysicalbatchsizessomehow
generalizebetter,orwhethertheyalsodobetteronthetrainingloss,wemeasuredthelossofthefinaltrainedmodel
on1Mexamplesfromthetrainingset. Wefocusonthenoise-batchratioof0.515inthistest. Thetablebelowshows
thatsmallerphysicalbatchsizesalsohavebetterperformanceonthealready-seentrainingexamples,rulingoutthis
explanation(seeTable3).
TrainingSet
BatchSize Cross-Entropy Accuracy
128 3.586 43.59%
512 3.971 37.27%
2048 4.01 37.55%
8192 4.057 36.73%
Table3. Lossovertheentiretrainingsetisalsobetterforlowerphysicalbatchsizes.
3. ModelSize. ThemainexperimentusesBertTiny,whichisarelativesmallmodel. Itisnaturaltoaskwhetherthesame
behaviorwouldbeobservedforalargermodellikeBertBase. Thefigurebelowshowsthatthesamephenomenon
happensforBertLarge, butonlyforthelargestnoise-batchratio. Theothertwovaluesofnoise-batchratiodonot
17

ScalingLawsforDifferentiallyPrivateLanguageModels
exhibitthisbehavior,althoughatthemiddlenoise-batchratio,thetrendlinesuggeststheremaybeacrossoverpoint
beyondthelimitsofthexaxis. Thus, increasingmodelsizeseemtoinfluenceandmitigatethisbehavior, butnot
| eliminateitcompletely. |     |     | SeeFigure9. |     |     |     |     |     |     |
| ---------------------- | --- | --- | ----------- | --- | --- | --- | --- | --- | --- |
    
|                                 |     |     |     |          |     |     |     |  4 L ] W M G E P  & E X G L  7 M ^ I |        |
| ----------------------------------- | --- | --- | --- | -------- | --- | --- | --- | -------------------------------------- | ------ |
|                                     |     |     |     |       |     |     |     |                                        |      |
|                                  |     |     |     |          |     |    |     |                                        |        |
|                                     |     |     |     |      |     |     |     |                                        |     |
|  ] T S V X R )  W W S V '      |     |     |     |          |     |     |     |                                        |     |
 
|    |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- |
    
    
|  4 L ] W M G E P  & E X G L  7 M ^ I |      |     |     |      4 L ] W M G E P  & E X G L  7 M ^ I |     |     |     |     |     |
| -------------------------------------- | ---- | --- | --- | --------------------------------------------- | --- | --- | --- | --- | --- |
|                                     |    |     |     |                                             |     |    |     |     |     |
    
|      |     |     |     |        |     |     |     |     |     |
| -------- | ------ | --- | --- | --------- | --- | --- | --- | --- | --- |
|          |     |     |     |       |     |     |     |     |     |
 
|     |     |                   |     |     |                   |         |     |                   |     |
| ------ | --- | -------------------- | --- | ------ | -------------------- | ------------- | --- | -------------------- | --- |
|        |     |  - X I V E X M S R W |     |        |  - X I V E X M S R W |               |     |  - X I V E X M S R W |     |
(a)noise-batchratio=0.520 (b)noise-batchratio=0.515 (c)noise-batchratio=0.510
Figure9.Cross-entropylossofBertLargeaveragedover3trialsfordifferentphysicalbatchsizesandnoise-batchratiovalues.
4. TrainingPipelines. Itisnaturaltoquestionwhetherthisbehaviorisexplainedbysomebuginthetrainingpipeline.
Wecarefullyreviewedtheimplementationanddidnotfindanybugsthatcouldexplainthisbehavior,andalsodid
additionalexperimentsonatotallyseparatetrainingpipelinebasedonNanoDO(Liuetal.,2024),whereweobserved
thesamequalitativebehaviorwhentraininga30Mparameterdecoder-onlytransformermodelwithDP-Adamfor32K
iterations. Thefiguresbelowshowthesmoothedcross-entropyaveragedover3randomtrials.
|     | 9.5367431640625e-07 |     |     |     | 3.0517578125e-05 |            |     | 0.0009765625 |            |
| --- | ------------------- | --- | --- | --- | ---------------- | ---------- | --- | ------------ | ---------- |
| 4.2 | batch_size          |     |     |     |                  | batch_size |     |              | batch_size |
4.8
|                   | 32  |     |     |     |     | 32  | 6.8 |     | 32  |
| ----------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|                   | 128 |     |     |     |     | 128 |     |     | 128 |
| yportnE ssorC 4.0 | 512 |     |     |     |     | 512 |     |     | 512 |
4.6
|     | 2048 |     |     |     |     | 2048 | 6.6 |     | 2048 |
| --- | ---- | --- | --- | --- | --- | ---- | --- | --- | ---- |
3.8
4.4
6.4
| 3.6 |     |     |     | 4.2 |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
6.2
| 3.4 |     |     |     | 4.0 |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
6.0
|     | 102 | 103        | 104 | 102       | 103                          | 104 | 102 | 103        | 104 |
| --- | --- | ---------- | --- | --------- | ---------------------------- | --- | --- | ---------- | --- |
|     |     | Iterations |     |           | Iterations                   |     |     | Iterations |     |
|     |     |            |     | Figure10. | LossonNanoDO(Liuetal.,2024). |     |     |            |     |
C.5.TrainingThroughput
Bylookingatintermediates,usingasinglephysicalbatchsize,andseparatingtheaccountingfromtheexperimentation
we greatly reduce the number of experiments to run. However, the set of experiments we outline above is still very
compute-intensive. WeutilizeTPUv3podstorunallexperiments,andconfiguredthemodelstousepuredataparallelism,
using more cores for larger models so that each experiment finishes within four to ten hours. was trained on
BertTiny
16 TPUv3 cores, while BertLarge was trained on 128. Table 4 provides the training throughputs for all models in our
experiments.
18

ScalingLawsforDifferentiallyPrivateLanguageModels
| Model    | Params Steps/sec | PerCoreBatchSize | Records/Sec |
| -------- | ---------------- | ---------------- | ----------- |
| BertTiny | 4.52M 8.959      | 64               | 573         |
| BertMini | 11.4M 5.494      | 64               | 352         |
|          | 29.0M 6.602      | 32               | 211         |
BertSmall
| BertMedium | 41.6M 4.196 | 32  | 134  |
| ---------- | ----------- | --- | ---- |
| BertBase   | 110M 3.621  | 16  | 54   |
| BertLarge  | 335M 2.225  | 8   | 17.8 |
| BertMega   | 729M 1.536  | 4   | 6.1  |
Table4. TrainingthroughputforvariousBERTmodels
C.6.Reproducingnon-privatescalinglawsresults
WenowconfirmthattheexperimentaldatawecollectedmatchestheexpectedbehaviorofHoffmannetal.(2022),specifically
thatintheabsenceofnoise,theoptimalmodelsizeandtokensshouldgrowinroughlyequalproportionwithincreasing
computebudget. Thisistruedespiteourseveralmethodologicaldifferences,including: (1)doingper-examplegradient
clipping,(2)usingadifferentoptimizerandnotretrainingforeachnumberofiterations,(3)usingalargephysicalbatch
size,etc. TheexactToken/Modelratiopredictedhereislargerthanpriorwork,butthatiswellexplainedbythefactthata
batchsizeof1024examplesiswellbeyondthecriticalbatchsizeofcompute-efficienttraining(McCandlishetal.,2018).
   
|     |  7 P S T I       |     |  7 P S T I       |
| --- | ---------------------- | --- | ---------------------- |
   
 ] T S V X R )  W W S V '
|     |  I ^ M 7  P I H S 1 |     |  W R S M X E V I X - |
| --- | -------------------- | --- | -------------------- |
   
   
   
   
   
   
                                                           
 ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X
Figure11. Compute-optimalcross-entropy,modelsize,andnumberofiterationswhenrunningDP-Adamwith?=0.
C.7.OptimalLearningRates
Wenowlookatthetrainingcurvesfordifferentlearningratesanddifferentnoise-batchratiovalues. Theseresultsgenerally
matchexpectationsanddemonstratethatthelearningrateswechosewereselectedfromthecorrectregime.
19

ScalingLawsforDifferentiallyPrivateLanguageModels
 
 0 I E V R M R K  6 E X I
|     |     |  0 I E V R M R K  6 E X I |     |     | 0.59 |      |     |
| --- | --- | -------------------------- | ------ | --- | ---- | -------- | --- |
0.59
|                           |     | 0.58 |    |     | 0.58 |     |     |
| -------------------------- | --- | ---- | --- | --- | ---- | --- | --- |
|  ] T S V X R )  W W S V ' |     |      |     |     | 0.57 |    |     |
0.57
|     |     |     |     |     |     |      |     |
| --- | --- | --- | ------ | --- | --- | -------- | --- |
 
 
     0 I E V R M R K  6 E X I
|    |     |     |     |     |     |      0.59 |     |
| --- | --- | --- | ------ | --- | --- | ------------- | --- |
0.58
|     |     |     |    |     |     |   0.57 |     |
| --- | --- | --- | --- | --- | --- | ------- | --- |
 
|     |     |     |     |       |     |     |     |
| --- | --- | --- | ------ | -------- | --- | ------ | --- |
             - X I V E  X M  S  R W              
|     |  - X I V E X M S R W |                               |     |     |                            |        |  - X I V E  X M  S  R W |
| --- | -------------------- | ----------------------------- | --- | --- | -------------------------- | ------ | ----------------------- |
|    |                      |                               |    |     |  0 I E V R M R K  6 E X I |        |                         |
|     |                      |  0 I E V R M  R K   6  E X I |     |     |                            |     |                         |
|     |                      | 0 .5 9                        |     |     | 0.59                       |        |                         |
|    |                      |                               |     |     | 0.58                       |     |                         |
0.58  
|  ] T S V X R )  W W S V ' |     | 0.57 |     |     | 0.57 |        |     |
| -------------------------- | --- | ---- | --- | --- | ---- | ------ | --- |
|                           |     |      |     |     |      |     |     |
 
|    |     |     |     |     |     |                                  |     |
| --- | --- | --- | --- | --- | --- | --------------------------------- | --- |
|     |     |     |    |     |     |      0 I E V R M R K  6 E X I |     |
|    |     |     |     |     |     | 0.59                              |     |
0.58
   
|    |     |     |    |     |     | 0.57 |     |
| --- | --- | --- | --- | --- | --- | ---- | --- |
   
                                   
|     |  - X I V E X M S R W |     |     |  - X I V E X M S R W |     |     |  - X I V E X M S R W |
| --- | -------------------- | --- | --- | -------------------- | --- | --- | -------------------- |
(a)noise-batchratio=0.520 (b)noise-batchratio=0.515 (c)noise-batchratio=0.510
Figure12.TrainingcurvesforBertTiny(top)andBertMedium(bottom)withvaryinglearningratesatdifferentnoise-batchratiovalues.
C.8.OptimalComputeBudgetAllocation
Inthissection,weextendtheresultsfromSection4.1,includingresultsformoresettingsofthedatabudget,rangingfrom
| 106 | 109. |     |     |     |     |     |     |
| --- | ---- | --- | --- | --- | --- | --- | --- |
N = to N = The full results are shown in Figure 13. Our findings are qualitatively similar to the ones we
identifiedinthemaintextacrossdifferentdatabudgets,butthepreciseconstantsmaydiffer.
C.9.SmoothingandExtrapolation
InFigure14wevisualizehowoursemi-parametricsmoothingapproachworks. Sinceeachrawmeasurementisanaverage
cross-entropyover1024╖100examples,itisnaturallyanoisyestimateoftheôtrueöcross-entropy. Oursmoothingstrategy
ensurestheappropriatemonotonicitypropertiesareenforced,whilematchingtheoveralltrendascloselyaspossible.
D.CaveatsonPrivacyCalibration
Throughoutthework,wehaveassumedthathyperparameterchoicesformodeltrainingaremadeagainstafixedprivacy
budget. Inparticular,weassumethecommonscenarioinwhichthemodeltrainerfixesan(?,?)-budgetandthenutilizesa
privacycalibrationalgorithmtochooseDP-SGDhyperparametercombinations(samplingprobability,trainingiterations
andnoisescale)whichsatisfythisprivacybudget. Notethatinthemainmanuscript,weexpressthischoiceintermsofthe
noise-batchratio?andthenumberofiterationsT,butthisismerelyamatterofnotation. Asalsonotedinthepreceding
subsection,thechoiceofsamplingprobability(andthustheresultingbatchsize)playanimportantroleindeterminingthe
AsdescribedintherecentworkofKaissisetal.(2024),calibratingagainstafixed(?,?)-budget
finalmodelÆscross-entropy.
whilevaryingDP-SGDhyperparametersmustbedonewithcare: Inbrief,onecannotassumethatDP-SGDwithdifferent
hyperparametersoffersthesameprivacyguaranteesdespitehavingthesamenominal(?,?)-budget. Thisisduetothefact
thattheprivacyguaranteesofDP-SGDcanonlybeadequatelyexpressedthroughaprivacyprofile,thatis,acollection
of(?,?(?))tuples. Insimpleterms, twoDP-SGDalgorithmscansharean(?,?)-budget, thatis, offerthesameprivacy
guaranteesforaspecific?whileoffering(sometimesdrastically)differentprivacyguaranteesatadifferentvalueof?. As
alsodescribedintheaforementionedwork,varyingthesamplingrate(andthusbatchsize)hasadrasticimpactonthis
differenceinprivacyguarantees. Theauthorsoftheaforementionedworkthusrecommendreportingtheexcessvulnerability
thatDP-SGDalgorithmsincurwithrespecttoeachotherwhentheyreplaceoneanotherinaworkflow. Werefertothe
aforementionedworkfortechnicaldetails. Here,wedemonstratethatmeaningfuldifferencescanindeedarisebetween
modelscalibratedtosatisfythesame(?,?)-budget.
Exemplarily,wefixedaprivacybudgetof(?,?) = (8,10?8)forspecificfixedcomputebudgetsandmodelsizeswhile
varyingthebatchsize(andadjustingthenoisetomaintaintheprivacybudget). Wethencomputedthescaling-lawpredicted
cross-entropyandthevulnerabilityofthemodelsagainstmembershipinferenceattack(MIA)adversariesmeasuredin
20

ScalingLawsforDifferentiallyPrivateLanguageModels
|      I    |     |     |     |     |   I    |     |
| ---------------- | --- | --- | --- | --- | ---------- | --- |
 4 V M Z E G ]  & Y H K I X   I     4 V M Z E G ]  & Y H K I X
 
|                      |     |                      |     |     |                      |     |
| -------------------- | ---- | -------------------- | --- | --- | -------------------- | ---- |
|      I        |      |                |     |     |   I              |     |
|  I ^ M 7  P I H S 1 |    |                      |     |     |                      |    |
|                      |    |  I ^ M 7  L G X E & |     |     |  W R S M X E V I X - |      |
|     I          |      |                      |     |     |                      |    |
|     I          |      |                 |     |     |                |      |
 4 V M Z E G ]  & Y H K I X
 
|      I    |     |      |     |    |       |     |
| ---------------- | --- | -------- | --- | --- | ---------- | --- |
  
  
|     I    |     |     |     |     |      |     |
| -------------- | --- | ------ | --- | --- | -------- | --- |
                                                                                                                       
 ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X
     I   
 4 V M Z E G ]  & Y H K I X   I     4 V M Z E G ]  & Y H K I X         4 V M Z E G ]  & Y H K I X
|     |    |     |    |     |     |    |
| --- | --- | --- | --- | --- | --- | --- |
 
|      I        |      |   I              |     |     |                      |     |
| -------------------- | ---- | -------------------- | ---- | --- | -------------------- | ---- |
|  I ^ M 7  P I H S 1 |    |                      |    |     |                      |    |
|                      |    |  I ^ M 7  L G X E & |      |     |  W R S M X E V I X - |      |
|     I          |      |                |    |     |                      |    |
|     I          |      |                      |      |     |                 |      |
     
     I   
    
|     I    |     |     |     |     |      |     |
| -------------- | --- | --- | --- | --- | -------- | --- |
                                                                                                                       
 ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X
     I   
 4 V M Z E G ]  & Y H K I X  4 V M Z E G ]  & Y H K I X  4 V M Z E G ]  & Y H K I X
|     |    |   I    |    |     |        |    |
| --- | --- | ---------- | --- | --- | ------------ | --- |
 
|      I    |     |     |    |     |     |    |
| ---------------- | --- | --- | --- | --- | --- | --- |
 I ^ M 7  P I H S 1     I ^ M 7  L G X E &   I         
|     |    |     |    |     |  W R S M X E V I X - |    |
| --- | ---- | --- | ---- | --- | -------------------- | ---- |
    I   
|     I    |     |        |     |     |     |     |
| -------------- | --- | ------------ | --- | --- | --- | --- |
     
     
     I   
    
    I   
    
                                                                                                                       
 ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X
     I   
 4 V M Z E G ]  & Y H K I X   I     4 V M Z E G ]  & Y H K I X  4 V M Z E G ]  & Y H K I X
|                  |    |     |    |     |              |    |
| ---------------- | --- | --- | --- | --- | ------------ | --- |
|                  |    |     |    |     |              |    |
|      I    |     |     |     |     |        |     |
 I ^ M 7  P I H S 1     I ^ M 7  L G X E &     W R S M X E V I X -   
|     |    |        |    |     |     |    |
| --- | ---- | ------------ | ---- | --- | --- | ---- |
    I   
    I   
     
|      I    |     |       |     |     |     |     |
| ---------------- | --- | ---------- | --- | --- | --- | --- |
    I   
                                                                                                             
 ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X
|     | (a)ModelSizes |     | (b)BatchSize |     |     | (c)Iterations |
| --- | ------------- | --- | ------------ | --- | --- | ------------- |
Figure13.Computeoptimalmodel-sizes,batchsizes,anditerationsforvaryingprivacybudgetsandcomputebudgets,anddatabudgets.
EachrowofplotscorrespondstoadifferentdatabudgetofN = 106,107,108,and109 respectively. Eachlinecorrespondstothe
minimumvalueofthathyper-parameterthatachieveswithin1%oftheoptimalcross-entropyacrossallconstant-computetraining
configurations.Theshadedregioncorrespondstothefullrangeofpossiblevaluesforthathyper-parameterthatareoptimaltowithin1%.
termsofMIAadvantage(Yeometal.,2018). WenotethatMIAadvantageisaproxymetricforotherattackssuchas
reconstructionattacksandisrelatedtothe?-divergencewhichquantifiesvulnerabilityasdescribedinKaissisetal.(2024).
Figure15demonstratesthephenomenon.
Notethatinallthreecases,itispossibletoachievevirtuallythesamecross-entropy(blue,leftverticalaxis)whilecontrolling
theMIAadvantagebyjudiciouslychoosingthebatchsize.Conversely,itisalsopossibletoincuranundulyhighvulnerability
withoutasubstantialdecrease(orsometimesevenanincrease)incross-entropythroughapoorchoiceofbatchsize. Asan
auxiliaryfinding,wenotethattherelationshipbetweencross-entropyandbatchsizefollowsthetrendobservedinDeetal.
(2022). Inbrief,thereisaParetooptimalbatchsizebeyondwhichboththecross-entropyandtheexcessvulnerabilitycan
onlybecomeworse(larger). Westressthatthemodelsshownhereallsatisfythesamenominal(?,?)-budgetbutexhibit
(substantial)differencesinvulnerabilityagainstatleastasubsetofadversarieswhichmaypassunnoticedifonlyreportinga
single(?,?)-DPguarantee.
Wethusrecommendpractitionerstomonitorchangesinexcessvulnerabilitythatmayarisedue
tohyperparametertuningandreportthemalongsidethe(?,?)-budgettowhichDP-SGDhasbeencalibrated.
21

ScalingLawsforDifferentiallyPrivateLanguageModels
|     |     |     |     |                                                |     |     |     |                  |     |     |     |     |
| ------ | --- | --- | --- | ---------------------------------------------- | --- | --- | ------ | ---------------- | --- | --- | --- | --- |
|        |     |     |     |  6 E [  ( E X E                               |     |     |        |  6 E [  ( E X E |     |     |     |     |
|        |     |     |     |  7 Q S S X L I H    ) \ X V E T S P E X I H |     |     |        |  7 Q S S X L I H |     |     |     |     |
   
 
|  ] T S V X R )  W W S V ' |     |     |     |     |     |  ] T S V X R )  W W S V ' |     |     |     |     |     |     |
| -------------------------- | --- | --- | --- | --- | --- | -------------------------- | --- | --- | --- | --- | --- | --- |
   
   
   
 
   
   
 
|     |     |     |     |                   |     |     |     |     |                                 |     |     |     |
| --- | ------ | --- | ------ | -------------------- | ------ | ------ | ------ | --- | ---------------------------------- | --- | ------ | --- |
|     |        |     |        |  - X I V E X M S R W |        |        |        |     |  2 S M W I  & E X G L  6 E X M S |     |        |     |
(a)noise-batchratio=0.515
|                    |     |     |     |           |                                                       |     |     |           | (b)T =32000   |     |     |                 |
| ------------------ | --- | --- | --- | --------- | ----------------------------------------------------- | --- | --- | --------- | ------------- | --- | --- | --------------- |
|                    |     |     |     | Figure14. | Demonstrationofoursemi-parametricsmoothingonBertTiny. |     |     |           |               |     |     |                 |
|                    |     |     |     | 0.18      |                                                       |     |     | 0.26      |               |     |     | 0.425           |
| 5.75               |     |     |     |           | 6.0                                                   |     |     |           |               |     |     |                 |
|                    |     |     |     |           |                                                       |     |     | 0.24      | 5.5           |     |     | 0.400           |
| 5.50               |     |     |     | 0.16      |                                                       |     |     |           |               |     |     |                 |
|                    |     |     |     |           | 5.5                                                   |     |     | 0.22      | 5.0           |     |     | 0.375           |
| yportnE ssorC 5.25 |     |     |     |           | yportnE ssorC                                         |     |     | egatnavdA | yportnE ssorC |     |     |                 |
|                    |     |     |     | 0.14      | egatnavdA                                             |     |     | 0.20      |               |     |     | 0.350 egatnavdA |
| 5.00               |     |     |     |           | 5.0                                                   |     |     |           | 4.5           |     |     |                 |
0.325
| 4.75 |     |     |     | 0.12 | 4.5 |     |     | 0.18 | 4.0 |     |     |     |
| ---- | --- | --- | --- | ---- | --- | --- | --- | ---- | --- | --- | --- | --- |
0.300
| 4.50 |     |            |     |      |     |            |     | 0.16 | 3.5 |     |            |       |
| ---- | --- | ---------- | --- | ---- | --- | ---------- | --- | ---- | --- | --- | ---------- | ----- |
|      |     |            |     | 0.10 | 4.0 |            |     |      |     |     |            | 0.275 |
| 4.25 |     |            |     |      |     |            |     | 0.14 |     |     |            |       |
| 4.00 |     |            |     |      |     |            |     |      | 3.0 |     |            | 0.250 |
|      |     |            |     | 0.08 | 3.5 |            |     | 0.12 |     |     |            |       |
|      | 103 |            | 104 |      | 103 | 104        |     | 105  |     | 104 | 105        |       |
|      |     | Batch Size |     |      |     | Batch Size |     |      |     |     | Batch Size |       |
|      |     | (a)        |     |      |     | (b)        |     |      |     |     | (c)        |       |
Figure15.Varyingthebatchsize(horizontalaxis,log-scale)hasadrasticeffectonexcessvulnerability(measuredasMIAadvantage,
red,rightverticalaxis)formodelswithafixedcomputebudgetandsizeandafixedprivacybudgetof(?,?)=(8,10?8).(a):Compute
budget:6╖1017,modelsize:4000000.(b)Computebudget:6.3╖1019,modelsize:200000000.(c)Computebudget:2.5╖1020,model
size:200000000.Thescaling-law-predictedcross-entropyisplottedontheleftverticalaxisinblue.
E.ParametricScalingLaws
Previousworkon(non-private)LLMscalinglawsuseafullyparametricformtopredictthecross-entropylossbasedon
severalkeyfactors. Forexample,theôChinchillaöscalinglaw(Hoffmannetal.,2022)canbeparameterizedasfollows:
|     |     |     |     |     |        |        | A   | B   |     |     |     |     |
| --- | --- | --- | --- | --- | ------ | ------ | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     | Lê(n   | )?E+   |     |     |     |     |     |     |
|     |     |     |     |     | ,n     |        |     | +   | .   |     |     |     |
|     |     |     |     |     | params | tokens | n?  | n?  |     |     |     |     |
params
tokens
In this section, we explore a similar methodology to fit a fully parametric form of scaling law in the setting of private
training. Followingthenotationofthispaper,wedefineaparametricformbasedonthefollowingkeyfactors: themodel
sizeM,thenumberofexamplesN andthenoise-batchratio?». NoteournotationsareslightlydifferentfromHoffmann
etal.(2022),andweusenumberofexamplesinsteadofnumberoftokensasitisamorerelevantquantityinprivatetraining.
Weconsiderseveralvariationsofparametricforms. ThefirstoneisanaiveextensionoftheChinchillascalinglaw,by
addinganadditionalterminvolvingthenoise-batchratio:
|     |     |     |     |     |                |     | A   | B      |     |     |     |     |
| --- | --- | --- | --- | --- | -------------- | --- | --- | ------ | --- | --- | --- | --- |
|     |     |     |     |     | Lê (M,N,?»)?E+ |     |     | +C?»?. |     |     |     |     |
|     |     |     |     |     | 1              |     | +   |        |     |     |     | (1) |
|     |     |     |     |     |                |     | M?  | N?     |     |     |     |     |
Wedidnotput?»? inthedenominatorbecausethelossincreaseswiththenoise-batchratio. FollowingHoffmannetal.
(2022),weestimatethecoefficients(E,A,B,C,?,?,?)byminimizingtheHuberloss(Huber,1992)betweenthepredicted
andtheobservedlossusingtheL-BFGSalgorithm(Nocedal,1980),andwetrymultipledifferentinitializationsandchoose
thebestfit. Werestrictthecurvefittingdatatoonlythesubsetsofdatapointswithmorethan100,000trainingiterations,
noise-batchratiolargerthan5╫10?7,andignorepointswithveryhighcross-entropyloss(>8).
Figure16showstheoptimalfit. Weobservethatthepredictionisgenerallyaccurateforlowlossvalueranges. However,the
predictionstartstodivergeathighlossvalueranges,correspondingtorunswithhighnoise-batchratio. Thisispartlydueto
22

ScalingLawsforDifferentiallyPrivateLanguageModels
Figure16.ParametricprivatescalinglawofLê
| 1 fromEquation(1).Optimalfitwith?=0.71,? |     |     | =12.87,? =0.19.Thetwopannels |     |     |
| ---------------------------------------- | --- | --- | ---------------------------- | --- | --- |
showthesameplotofobservedcross-entropylossagainstthepredictedlossfromthescalinglaw,exceptthedatapointsarecolored
differerently,accordingtothemodelsizeandnoise-batchratio,respectively.
Figure17.Relationbetweenthenoise-batchratioandthecross-entropyloss.(left)Thedataplottedinlog-logscale.(right)Thedata
plottedinlinearscale,wherethenoise-batchratio?»istransformedaccordingtoasimpleruleinEquation(2).
thefactthatthenoise-batchratiodoesnotimpactthelossinalog-linearfashion,asshownontheleftpanelofFigure17.
Therefore,theparametricformofEquation(1)cannotcapturetherelationaccurately. Instead,weobserveS-shapedcurves
inthelog-logplot. Toaccountforthis,weapplyasimpletransformtothenoise-batchratio?»:
|     | (cid:18) | (cid:19) |     |     |     |
| --- | -------- | -------- | --- | --- | --- |
?sigmoid log(?»)+8
| ?»? |     | .   |     |     | (2) |
| --- | --- | --- | --- | --- | --- |
1.6
TherightpanelofFigure17showsanapproximatelylinearrelationafterthistransformation. Furthermore,weobservethat
therelationbetweenthenoise-batchratioandthelosschangeswiththemodelsizes.
Afterincorporatingthoseobservations,weconsideranalternativevariantofprivatescalinglawparameterization:
C?»?
|                | A B   | ?   |     |     |     |
| -------------- | ----- | --- | --- | --- | --- |
| Lê (M,N,?»)?E+ | +     | + . |     |     | (3) |
| 2              | M? N? | M?2 |     |     |     |
TheoptimalfitaccordingtothisparameterizationisshowninFigure18. Weobservethatthepredictedlossmatcheswith
theobservedlossbetterthanthepreviousparameterizationinFigure16.
Figure18.ParametricprivatescalinglawofLê
| 2 fromEquation(3).Optimalfitwith?=0.47,? |     |     | =0.12,? =0.95,? | 2 =?0.07.The |     |
| ---------------------------------------- | --- | --- | --------------- | ------------ | --- |
twopannelsshowthesameplotofobservedcross-entropylossagainstthepredictedlossfromthescalinglaw,exceptthedatapointsare
coloreddiffererently,accordingtothemodelsizeandnoise-batchratio,respectively.
23

ScalingLawsforDifferentiallyPrivateLanguageModels
1010
109
108
107
1019 1020 1021 1022 1023
Compute Budget
eziS
ledoM
lamitpO
Chinchilla Scale (non-private)
Noise Batch Ratio = 9.5e-07
Noise Batch Ratio = 1.9e-06
Noise Batch Ratio = 3.8e-06
Noise Batch Ratio = 7.6e-06
Noise Batch Ratio = 1.5e-05
Noise Batch Ratio = 3.1e-05
Noise Batch Ratio = 6.1e-05
Noise Batch Ratio = 1.2e-04 Noise Batch Ratio = 2.4e-04
Noise Batch Ratio = 4.9e-04
Noise Batch Ratio = 9.8e-04
Noise Batch Ratio = 2.0e-03
Noise Batch Ratio = 3.9e-03
Noise Batch Ratio = 7.8e-03
Noise Batch Ratio = 1.6e-02
Figure19. OptimalmodelsizesunderaccordingtotheparametricprivatescalinglawinEquation(3).
IntheChinchillaparameterizationofscalinglawfornon-privateLLMs,theoptimalmodelsizeunderacertaincompute
budget(approximatelyrepresentedby6n n )canbedirectlysolvedandtakesapower-lawform(Hoffmannetal.,
params tokens
2022,Equation(4)). Inourcase,theparameterizationismorecomplicated,foragivencomputebudgetandnoise-batch
ratio,weusescipy.optimize.minimize_scalartofindtheoptimalmodelsizethatminimizesLê . Theresultsareplotted
2
inFigure19. Weobservethattheslopeislowerforcurveswithlargernoise-batchratio,indicatingthechallengestoscale
modelsizesunderheavyDPnoises. Asthenoisedecreases,thecurvesshiftupandtheslopesincrease,approachingtowards
thenon-privateChinchillascalinglawshownindashedline.
Whileafullyparametricscalinglawcanbeeasiertointerpretandunderstand,asnotedabove,thereisnotasimplelog-linear
relationbetweenthelossandthenoise-batchratio. Oursigmoidbasedtransformation(andthecouplingwiththemodelsize)
improvedthetightnessofthefitting. Butthetransformationisnotdesignedinaveryprincipledway. Asaresult,weopt
tousethesemi-parametricfittinginSection3inthemainanalysisofourresults. Wealsoleavetheexplorationofother
alternativeparametricfittingsuchasfittinga?»-dependingdeltatermontopofanon-privatescalinglawforfuturework.
24
