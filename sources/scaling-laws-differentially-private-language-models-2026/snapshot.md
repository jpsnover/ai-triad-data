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
|     | Scaling Laws | for | Differentially | Private | Language | Models |     |     |     |
| --- | ------------ | --- | -------------- | ------- | -------- | ------ | --- | --- | --- |
RyanMcKenna1 YangsiboHuang1 AmerSinha1 BorjaBalle2 ZacharyCharles1
ChristopherA.Choquette-Choo2 BadihGhazi1 GeorgeKaissis2 RaviKumar1 RuiboLiu2 DaYu1
ChiyuanZhang1
|     | Abstract |     |     | diversedatasets(Dubeyetal.,2024;GemmaTeametal., |     |     |     |     |     |
| --- | -------- | --- | --- | ----------------------------------------------- | --- | --- | --- | --- | --- |
5202 naJ 13  ]GL.sc[  1v41981.1052:viXra Scalinglawshaveemergedasimportantcompo- 2024a)thatarealsodistributed(Carlinietal.,2024)making
|          |                      |       |          | it difficult | to exclude inadvertently |     | shared | personal | infor- |
| -------- | -------------------- | ----- | -------- | ------------ | ------------------------ | --- | ------ | -------- | ------ |
| nents of | large language model | (LLM) | training |              |                          |     |        |          |        |
mation. Paradoxically,userdata,akeyprivacyconcern,is
| as they | can predict performance | gains | through |     |     |     |     |     |     |
| ------- | ----------------------- | ----- | ------- | --- | --- | --- | --- | --- | --- |
scale,andprovideguidanceonimportanthyper- alsocrucialforadvancingLLMcapabilities. Userinterac-
|           |                    |           |        | tions provide | invaluable | feedback | for generating |     | realistic |
| --------- | ------------------ | --------- | ------ | ------------- | ---------- | -------- | -------------- | --- | --------- |
| parameter | choices that would | otherwise | be ex- |               |            |          |                |     |           |
pensive. LLMs also rely on large, high-quality syntheticdata(Afonjaetal.,2024;Kurakin&Ponomareva,
|     |     |     |     | 2024) and | aligning models | with | human | values | (Stiennon |
| --- | --- | --- | --- | --------- | --------------- | ---- | ----- | ------ | --------- |
trainingdatasets,likethosesourcedfrom(some-
etal.,2020),reflectingreal-worldusecasesbetterthanweb-
timessensitive)userdata.Trainingmodelsonthis
sensitiveuserdatarequirescarefulprivacyprotec- scrapedtext. However,directtrainingonsensitiveuserdata
isriskyduetomemorizationandregurgitation(Carlinietal.,
tionslikedifferentialprivacy(DP).However,the
dynamicsofDPtrainingaresignificantlydiffer- 2021;2023;Ippolitoetal.,2022;Lukasetal.,2023;Bider-
|     |     |     |     | manetal.,2023;Prashanthetal.,2024). |     |     |     | Thistensionùthe |     |
| --- | --- | --- | --- | ----------------------------------- | --- | --- | --- | --------------- | --- |
ent,andconsequentlytheirscalinglawsarenot
|                     |                        |     |     | need for | user data versus | protecting | user | privacyùis | ad- |
| ------------------- | ---------------------- | --- | --- | -------- | ---------------- | ---------- | ---- | ---------- | --- |
| yetfullyunderstood. | Inthiswork,weestablish |     |     |          |                  |            |      |            |     |
scalinglawsthataccuratelymodeltheintricacies dressedbydifferentialprivacy(DP)(Dworketal.,2006).
ofDPLLMtraining,providingacompletepicture WhileDPoffersaprincipledsolutiontothetensionbetween
ofthecompute-privacy-utilitytradeoffsandthe
datautilityandprivacyinLLMtraining,applyingitinprac-
optimaltrainingconfigurationsinmanysettings. tice,especiallytolarge-scalemodels,presentssignificant
|     |     |     |     | challenges. | DP mechanisms | like |     | (Abadi | et al., |
| --- | --- | --- | --- | ----------- | ------------- | ---- | --- | ------ | ------- |
DP-SGD
|     |     |     |     | 2016) and | its variants | introduce | computational |     | overhead, |
| --- | --- | --- | --- | --------- | ------------ | --------- | ------------- | --- | --------- |
1.Introduction
implementationcomplexity(Subramanietal.,2021),and
Largelanguagemodels(LLMs)arerevolutionizinghowwe utilitydegradation(Bassilyetal.,2014). Whileitisgener-
|     |     |     |     | ally well-known | that DP-SGD | benefits |     | substantially | from |
| --- | --- | --- | --- | --------------- | ----------- | -------- | --- | ------------- | ---- |
interactwithtechnology,poweringeverythingfrominstant
trainingwithverylargebatchsizes(Aniletal.,2022;De
translationsandconcisesummariestocomplexreasoning
andcreativecontentgeneration(Achiametal.,2023;Gem- etal.,2022;Ponomarevaetal.,2023),littleworkhasbeen
donetounderstandtheconditionsunderwhichthisholds
| iniTeam,2023). | Trainingincreasinglylargemodelsover |     |     |     |     |     |     |     |     |
| -------------- | ----------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
increasingly large datasets has been a key driver of suc- incompute-constrainedsettings,i.e.,whenanincreasein
batchsizemustbecoupledwithadecreaseinmodelsize
cessfortheseLLMs,withfrontiermodelsbeingtrainedfor
|     |     |     |     | orthenumberofiterations. |     | Inpartduetothisrelianceon |     |     |     |
| --- | --- | --- | --- | ------------------------ | --- | ------------------------- | --- | --- | --- |
millionsofGPU-hours(Aniletal.,2023)andincreasingly
many trillions of tokens (Gemma Team et al., 2024a;b). largebatchsizes,thelargestmodelstrainedwithDPtoday
havehundredsofmillions,ratherthanbillions,ofparame-
Scalinglawsforneurallanguagemodelshavebeencrucial
becausetheyprovideaframeworkforunderstandingand ters(Aniletal.,2022;Lietal.,2022;Berradaetal.,2023;
Ghalebikesabietal.,2023;Charlesetal.,2024).
predictingtheperformancegainsachievablewithincreased
computationalresources,andimportantly,guidetheoptimal
|     |     |     |     | To train | large models with | DP, | it is crucial | to spend | both |
| --- | --- | --- | --- | -------- | ----------------- | --- | ------------- | -------- | ---- |
allocationofthatcomputebudgetbetweenmodelsizeand
|     |     |     |     | thecomputebudgetandtheprivacybudgetjudiciously. |     |     |     |     | In  |
| --- | --- | --- | --- | ----------------------------------------------- | --- | --- | --- | --- | --- |
datasetsize(Kaplanetal.,2020;Hoffmannetal.,2022). thiswork,wepavethewaytowardstrainingatthebillion-
ThescaleofdatadrivingLLMprogressalsocreatesacritical parameterscalebyinitiatingastudyonthescalinglawsof
|                   |                                       |     |     | DPtraining. | Tothatend,weextendtraditionalscalinglaws |     |     |     |     |
| ----------------- | ------------------------------------- | --- | --- | ----------- | ---------------------------------------- | --- | --- | --- | --- |
| privacychallenge. | State-of-the-artmodelstrainonmassive, |     |     |             |                                          |     |     |     |     |
toconsideracompute-privacy-utilitytradeoff,accounting
| 1Google | 2Google |     |     |     |     |     |     |     |     |
| ------- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
Research DeepMind. Correspondence to: for intricacies and additional variables introduced by DP
RyanMcKenna<mckennar@google.com>. training. Througharigoroussetofexperiments,weempiri-
callymodelthistrade-off,andprovideathoroughanalysis
1

ScalingLawsforDifferentiallyPrivateLanguageModels
oftheseexperimentalresultstoansweranumberofscaling Algorithm1(Informal)GeneralizedDP-SGD.
law-stylequestions,finding(amongotherthings)that: AppendixB.1discussestheinformalities.
Input: DatasetD,noise-batchratio?»,(expected)batchsize
ò Thecomputebudgetallocationpredictedbynon-private
B,iterationsT
scalinglawsisfarfromoptimalunderDP,evenforhuge
Output: Modelparameters?.
privacybudgets,confirmingtheneedforourstudy.
|            |     |                |         |     |             |        | Initializemodelparameters? |     |     |     |     | ?RM |     |     |
| ---------- | --- | -------------- | ------- | --- | ----------- | ------ | -------------------------- | --- | --- | --- | --- | --- | --- | --- |
| ò However, | we  | can accurately | predict |     | the optimal | break- |                            |     |     |     |     | 0   |     |     |
|            |     |                |         |     |             |        | fort=1toT                  |     |     | do  |     |     |     |     |
downofthecomputebudgetintomodelsize,batchsize,
|     |     |     |     |     |     |     |     | Selecta(possiblyrandom)size?BminibatchB |     |     |     |     |     | ?D  |
| --- | --- | --- | --- | --- | --- | --- | --- | --------------------------------------- | --- | --- | --- | --- | --- | --- |
t
| anditerationsforvirtuallyanyprivacybudgetanddataset |     |     |     |     |     |     |     |     | (cid:80) |           |     |      |     |     |
| --------------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | -------- | --------- | --- | ---- | --- | --- |
|                                                     |     |     |     |     |     |     |     | g»= | 1        | clip(??(? |     | ;x)) |     |     |
size. Thesecompute-efficienttrainingconfigurationssave B x?Bt t?1
gÿ=g+?»N(0,1)M
5╫to100╫computecomparedtobaselineconfigurations,
|                                            |     |     |     |     |     |     |     | ? =OptimizerUpdate(? |     |     |     | ,gÿ) |     |     |
| ------------------------------------------ | --- | --- | --- | --- | --- | --- | --- | -------------------- | --- | --- | --- | ---- | --- | --- |
| whileretainingcomparableprivacyandutility. |     |     |     |     |     |     |     | t                    |     |     |     | t?1  |     |     |
return? T
| ò The optimal |     | model | size is typically |     | at least | an order |     |     |     |     |     |     |     |     |
| ------------- | --- | ----- | ----------------- | --- | -------- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
of magnitude smaller with DP than without. This pro- DP-SGD. DP-SGD is a widely used algorithm to train
videsinsightintothechallengesoftraininglargebillion-
neuralnetworkswithDP.ItattainsprovableDPguarantees
parameterorlargerlanguagemodelswithDP. throughlimitingthecontribution(sensitivity)ofeachexam-
ò In the DP setting, increasing the compute budget can plebyclippingitsgradienttosome? -norm(wlog,1),and
2
sometimesyieldlittletonoreductioninthelossunless thenaddingisotropicGaussiannoisetotheaveragedclipped
accompaniedbyacorrespondingincreaseintheprivacy gradients;seeAlgorithm1forpseudo-code. Ouralgorithm
budgetordatasetsize.
|     |     |     |     |     |     |     | is           | a slight | generalization                           |     | of  | the original | DP-SGD | (Abadi |
| --- | --- | --- | --- | --- | --- | --- | ------------ | -------- | ---------------------------------------- | --- | --- | ------------ | ------ | ------ |
|     |     |     |     |     |     |     | etal.,2016): |          | toenableadaptiveoptimizers,whichareoften |     |     |              |        |        |
crucialfortrainingtransformermodels,thesubroutineOpti-
2.PreliminariesandProblemSetup
|     |     |     |     |     |     |     | mizerUpdatecanbeanyfirst-orderoptimizer. |     |     |     |     |     |     | Throughout |
| --- | --- | --- | --- | --- | --- | --- | ---------------------------------------- | --- | --- | --- | --- | --- | --- | ---------- |
OurdatasetDconsistsoftext thiswork,wesetOptimizerUpdatetobeAdam(Kingma&
|     |     |     |     | Key | Definition |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
sequences, where each indi- Ba,2015),whichwedenoteDP-Adam.Algorithm1satisfies
|     |     |     |     | ?   | Privacybudget |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
vidualcontributesasinglese- N Databudget aformalDPguaranteethatcanreadilybecomputedasa
quencex = (x ,...,x )of C Computebudget functionof?»,B,N,andT usingasuitableprivacyaccoun-
|     | 1   |     | S   |     |           |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| S   |     |     |     | B   | Batchsize |     |     |     |     |     |     |     |     |     |
tokens, and each token is tant.Thedp_accountinglibraryprovidesfunctionsthatcan
|     |     |     |     | T   | Iterations |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
drawnfromapredefinedvo- efficientlyandtightlycomputetheminimumvalueof?»asa
|     |     |     |     | S   | Sequencelength |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
cabularyV. WeletN denote M Modelparameters functionof?,?,N,andB(GoogleDPTeam,2022).
|     |     |     |     | ?»  | noise-batchratio |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
thetotalnumberofindividu-
|     |     |     |     |     |     |     | Noise-BatchRatio. |     |     | NotethatweparameterizeAlgorithm1 |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----------------- | --- | --- | -------------------------------- | --- | --- | --- | --- |
alscontributingtothedataset.
intermsofthenoise-batchratio?»,whichisthestandard
|                         |     |     |     |                     |     |     | deviation |     | of noise | added | to  | the mean | minibatch | gradient, |
| ----------------------- | --- | --- | --- | ------------------- | --- | --- | --------- | --- | -------- | ----- | --- | -------- | --------- | --------- |
| MaskedLanguageModeling. |     |     |     | Inthisworkwefocuson |     |     |           |     |          |       |     |          |           |           |
insteadoftheusualnoisemultiplierwhichtypicallyadded
themaskedlanguagemodelingtask(Devlinetal.,2019),
|                                      |            |          |      |           |         |          | to      | the summed |           | minibatch | gradient. |             | While the  | noise mul- |
| ------------------------------------ | ---------- | -------- | ---- | --------- | ------- | -------- | ------- | ---------- | --------- | --------- | --------- | ----------- | ---------- | ---------- |
| whereeachsequencehasachosenfractionp |            |          |      |           |         | oftokens |         |            |           |           |           |             |            |            |
|                                      |            |          |      |           | mask    |          | tiplier | is         | typically | governs   |           | the privacy | properties | of the     |
| masked                               | out, i.e., | replaced | with | a special | masking | token    |         |            |           |           |           |             |            |            |
mechanism,thenoise-batchratioisabetterproxyforthe
| [MASK], | uniformly | at  | random. | The goal | is to | predict the |                                |     |     |     |     |     |                       |     |
| ------- | --------- | --- | ------- | -------- | ----- | ----------- | ------------------------------ | --- | --- | --- | --- | --- | --------------------- | --- |
|         |           |     |         |          |       |             | downstreamlearningperformance. |     |     |     |     |     | Specifically,thereare |     |
originaltokenforeachmaskedtokenusingtheentirecontext
twosourcesofvarianceinthestochasticgradientestimate
| (bidirectionally). |     | Let»xrepresenttheoriginalsequenceof |     |     |     |     |     |     |     |     |     |     |     |     |
| ------------------ | --- | ----------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
gÿ:
(1)theminibatchestimateofthetruepopulationgradient
tokensbutmaskedusingtheaboveprocedureandMtheids
and(2)theGaussiannoiseaddedtoensureDP.Priorwork
| ofthemaskedtokensin»x. |     |     | Foragivenparametervector? |     |     | ?   |     |       |      |            |           |     |              |         |
| ---------------------- | --- | --- | ------------------------- | --- | --- | --- | --- | ----- | ---- | ---------- | --------- | --- | ------------ | ------- |
|                        |     |     |                           |     |     |     | has | shown | that | the latter | dominates |     | the variance | in most |
RM,thelanguagemodeldefinesaconditionalprobability
practicalregimes(Ponomarevaetal.,2023).
| p (x | | »x) for | each | j ? M, and | the | goal is to | find ? to |     |     |     |     |     |     |     |     |
| ------ | ------- | ---- | ---------- | --- | ---------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
? j
maximizethelikelihoodofallmaskedtrainingtokens.
2.1.Compute-OptimalDPTraining
DifferentialPrivacy. ArandomizedmechanismAsatis- Weareinterestedinempiricallymodelinghowthecompute-
fies(?,?)-DP(Dworketal.,2006)if,foranytwodatasets privacy-utilitytradeoffchangesasafunctionoftheproblem
D, D? that differ by a single individual, all subsets O of parameters. Wefollowideasusedtomodelthecompute-
| possibleoutputsofAand?>0,0?? |     |     |     |     | <1: |     |         |           |     |         |             |     |                 |          |
| ---------------------------- | --- | --- | --- | --- | --- | --- | ------- | --------- | --- | ------- | ----------- | --- | --------------- | -------- |
|                              |     |     |     |     |     |     | utility | trade-off |     | in the  | non-private |     | setting (Kaplan | et al.,  |
|                              |     |     |     |     |     |     | 2020;   | Hoffmann  |     | et al., | 2022),      | but | extend them     | to study |
Pr[A(D)?O]?e?Pr[A(D?)?O]+?.
|     |     |     |     |     |     | (1) | theprivatesettingbyadditionallyconsideringtheprivacy |     |     |     |                    |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ---------------------------------------------------- | --- | --- | --- | ------------------ | --- | --- | --- |
|     |     |     |     |     |     |     | budgetanddatabudget.                                 |     |     |     | Thekeyconceptsare: |     |     |     |
2

ScalingLawsforDifferentiallyPrivateLanguageModels
ò Compute Budget (C) refers to the total floating point designtoachievenear-optimalselectionwithinreasonable
operations(FLOPs)requiredtotrainthemodel. Weuse compute. Further,itisimportanttoconsiderthatcollapsing
the standard approximation of Kaplan et al. (2020): 6╖ theprivacyanddatabudgetstoasinglequantityisunlikely
M╖B╖S╖T tomeasurethis,whichisproportionaltothe toprovidegeneralizableinsights.
modelsize(M)andthetotalnumberoftrainingtokens
(B╖S╖T).Notethatunlikethenon-privatescalinglaws,we 3.PrivateScalingLawMethodology
useBtorepresentthenumberofexamplesinabatch(not
tokens)becausethisquantityiswhatmattersforprivacy Inthissection,wedetailourmethodologyforestimatingthe
calculations. This approximation provides a platform- validationcross-entropylossfrommodelsize,noise-batch
independent estimate of compute requirements, and is ratio,andtrainingiterations,whichinturnletsusestimate
justifiedfurtherinAppendixB.3. theutilityunderafixedcompute,privacy,anddatabudget.
| ò PrivacyBudget(?)referstothevalueof?atfixed? |     |     |     | in  |     |     |     |     |
| --------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
10?8
(?,?)-DP.Wefix? = = ?(1/N)unlessotherwise 3.1.DecouplingNoiseCalibration
| mentioned, | which is | a common choice | in the literature |     |     |     |     |     |
| ---------- | -------- | --------------- | ----------------- | --- | --- | --- | --- | --- |
(Abadietal.,2016;Deetal.,2022). A key part of our methodology is to directly analyze the
|     |     |     |     | impactofthenoise-batchratiofor |     |     | afixedbutreasonably |     |
| --- | --- | --- | --- | ------------------------------ | --- | --- | ------------------- | --- |
ò DataBudget(N)referstothenumberofindividualsin
|     |     |     |     | large physical | batch | size, rather | than indirectly | through |
| --- | --- | --- | --- | -------------- | ----- | ------------ | --------------- | ------- |
thetrainingdataset,|D|,whichcanbedifferentthanthe
|     |     |     |     | changestotheprivacybudgetorbatchsize. |     |     | Viapost-hoc |     |
| --- | --- | --- | --- | ------------------------------------- | --- | --- | ----------- | --- |
numberofexamplesprocessedbyDP-SGDundermultiple
accounting,wewillpredictwhatcouldhappenatdifferent
| passes. | Notethatouranalysisandinsightsalsoholdin |     |     |     |     |     |     |     |
| ------- | ---------------------------------------- | --- | --- | --- | --- | --- | --- | --- |
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
|              |              |              |                  | underlying | trade-offs. | Without | this approach, | the non- |
| ------------ | ------------ | ------------ | ---------------- | ---------- | ----------- | ------- | -------------- | -------- |
| scaling laws | because they | often assume | that an infinite |            |             |         |                |          |
linearitiesinDPaccounting(detailedinSection4.5)make
streamofdataisavailableandnoprivacyprotectionsare
|     |     |     |     | itdifficulttoassessthese. |     | Wenotethatanaivemethodology |     |     |
| --- | --- | --- | --- | ------------------------- | --- | --------------------------- | --- | --- |
needed. Intheprivatesetting,modeltrainingisoftencon-
thattriestodirectlymodelthescalinglawasafunctionof
| strained by | both a fixed | data budget (i.e., | a limited | set of |     |     |     |     |
| ----------- | ------------ | ------------------ | --------- | ------ | --- | --- | --- | --- |
privacybudget(withoutgoingthroughthenoise-batchratio)
examples)andafixedprivacybudget(i.e.,?inDP).Bothof
wouldeitherprovidelessinsight(bynotgeneralizingacross
theseimpactmodeltraining;thus,itiscrucialtodetermine
databudgets),orrequiremuchmorecompute.
theoptimalcomputeusagegiventheconstraintsonprivacy
anddata,byfittingascalinglawaccountingforthis.
Afterdecoupling,thefunctionwewanttofitrequiresthree
|     |     |     |     | inputs: themodelsizeM,thenumberofiterationsT,and |     |     |     |     |
| --- | --- | --- | --- | ------------------------------------------------ | --- | --- | --- | --- |
2.2.PrivateScalingLawChallenges thenoise-batchratio1. Werequirethefunctiontobewell-
definedforabroadrangeofpossibleinputsthatcouldbe
| AdditionalScalingFactors. |     | Asmentionedabove,ourpri- |     |                                 |     |     |                     |     |
| ------------------------- | --- | ------------------------ | --- | ------------------------------- | --- | --- | ------------------- | --- |
|                           |     |                          |     | encounteredinpracticalsettings. |     |     | Wealsoneedittocover |     |
vatescalinglawsaccountfortheadditionaldataandprivacy
extremepointsthatmaynotbelikelytobeusefulinpractice,
| considerations | not present | in the non-private | scaling | law                                       |     |     |              |     |
| -------------- | ----------- | ------------------ | ------- | ----------------------------------------- | --- | --- | ------------ | --- |
|                |             |                    |         | butmayprovideadditionalscientificinsight. |     |     | Themethodol- |     |
studies. TheseaddcomplexitybecauseDPaddsnoisebe-
ogydescribedbelowattemptstobalancethisneedwiththe
yondwhatisintroducedthroughthestochasticityoftraining.
goalofusingcomputeresponsibly.
| WithoutDP,trainingwithabatchsizeofBforT |     |     | iterations |     |     |     |     |     |
| --------------------------------------- | --- | --- | ---------- | --- | --- | --- | --- | --- |
isroughlyequivalenttotrainingwithabatchsizeof1for
3.2.DetailedExperimentalSetup
B╖T iterations,aslongasBisbelowtheso-calledôcritical
batchsizeö(McCandlishetal.,2018;Shallueetal.,2019; ModelsandDatasets. WetrainBERTmodelsrangingin
Zhangetal.,2024a). However,thisrelationshipdoesnot scalefromTiny(4Mparameters)toMega(778Mparame-
holdinDPsettings,andfurther,DPtrainingrequireslarger ters),summarizedinTable1. WefocusonthedefaultBERT
batchsizestomitigatetheimpactoftheaddednoise(Anil
|     |     |     |     | dataset, which | includes | approximately | 3.3B | words (Zhu |
| --- | --- | --- | --- | -------------- | -------- | ------------- | ---- | ---------- |
etal.,2022;Deetal.,2022). etal.,2015;Devlinetal.,2019)beforetokenization. Each
exampleistruncatedorpaddedasnecessarytoasequence
| Compute                                         | Requirements. | Even without | DP, exhaustive |                |        |     |     |     |
| ----------------------------------------------- | ------------- | ------------ | -------------- | -------------- | ------ | --- | --- | --- |
|                                                 |               |              |                | offixedlengthS | =512.2 |     |     |     |
| hyperparametertuningisinfeasibleforlargemodels. |               |              |                | DP             |        |     |     |     |
trainingintroducesfurthercomplexitywithadditionalhy- 1Thelearningrateisahyperparameterthatisoptimizedover
perparametersandtheneedtoadaptstandarddefaults(e.g., andnotmodeleddirectly.
learningrate)tonewregimes,necessitatingcarefulprotocol 2Futureworkcouldfruitfullyconsiderothersequencelengths,
3

ScalingLawsforDifferentiallyPrivateLanguageModels
3.3.Semi-parametricModeling
Table1.Modelsusedinthisstudy,takenfromDevlinetal.(2019).
Model Layers Heads Dims Params(M) Aftertrainingthemodelsdescribedabove,weobtainagrid
ofmeasurementsover6uniquemodelsizes,1280unique
| BertTiny |     | 2   | 2 128 | 4.5M |     |     |     |     |     |     |
| -------- | --- | --- | ----- | ---- | --- | --- | --- | --- | --- | --- |
numberofiterations,18uniquenoise-batchratios,andthree
| BertMini |     | 4   | 4 256 | 11.4M |     |     |     |     |     |     |
| -------- | --- | --- | ----- | ----- | --- | --- | --- | --- | --- | --- |
BertSmall 4 4 512 29M learning rates. While one can directly query this data to
BertMedium 8 8 512 41M answer a variety of interesting questions, we ultimately
| BertBase |     | 12  | 12 768 | 109M |     |     |     |     |     |     |
| -------- | --- | --- | ------ | ---- | --- | --- | --- | --- | --- | --- |
needtoknowwhatmighthappenin-between(andpossibly
| BertLarge |     | 24  | 16 1024 | 335M |          |              |                |                 |                     |     |
| --------- | --- | --- | ------- | ---- | -------- | ------------ | -------------- | --------------- | ------------------- | --- |
|           |     |     |         |      | outside  | of) the grid | points         | we specifically | evaluated.          | For |
| BertMega  |     | 24  | 24 1536 | 778M |          |              |                |                 |                     |     |
|           |     |     |         |      | that, we | need to      | fit a function | to              | the data, for which | we  |
Optimizer. We use DP-Adam throughout. We use 1000 follow a semi-parametric approach. See Appendix E for
steps of learning rate warm-up, followed by exponential studieswithfullyparametricfits.
learningratedecay,decreasingthelearningratebyafactor
| of 10╫       | over a                                 | horizon of | 128K iterations. | We use per-       |                                                     |     |     |     |                      |     |
| ------------ | -------------------------------------- | ---------- | ---------------- | ----------------- | --------------------------------------------------- | --- | --- | --- | -------------------- | --- |
|              |                                        |            |                  |                   | DataCleaningandSmoothing.                           |     |     |     | First,wenotethatloss |     |
| example      | clipping                               | with an    | ? clip norm      | of 1.0 across all |                                                     |     |     |     |                      |     |
|              |                                        |            | 2                |                   | shouldmonotonicallyincreasewithincreasednoise-batch |     |     |     |                      |     |
| experiments. | Weemploythenormalizedvariantofclipping |            |                  |                   |                                                     |     |     |     |                      |     |
ratio,andmonotonicallydecreasewithincreasediterations
proposedbyDeetal.(2022),tohelpdecouplelearningrate
(unlesstrainingdiverges),andwewantourfittedfunction
| tuningfromclipnorm. |     | Weverifiedthatthissettingeffec- |     |     |            |      |           |              |                |      |
| ------------------- | --- | ------------------------------- | --- | --- | ---------- | ---- | --------- | ------------ | -------------- | ---- |
|                     |     |                                 |     |     | to capture | this | property. | In practice, | this invariant | only |
tivelyclipsmostper-examplegradients,asrecommendedin
holdsapproximatelyduetoinherentvarianceinthetraining
priorwork(Lietal.,2022;Deetal.,2022).
|          |        |         |              |                | process.         | To clean | the data, | we  | apply the following | post- |
| -------- | ------ | ------- | ------------ | -------------- | ---------------- | -------- | --------- | --- | ------------------- | ----- |
| Learning | Rates. | We tune | the learning | rate with per- | processingsteps: |          |           |     |                     |       |
examplegradientclippingbutnonoise,findingthattheopti-
1. Foreachmodelsizeandnoise-batchratio,weapplya
mallearningrateisconsistently2?7acrossallmodelscales.
|                                         |     |     |     |              | rolling                      | average | over | the 10 previous | measurements        | to  |
| --------------------------------------- | --- | --- | --- | ------------ | ---------------------------- | ------- | ---- | --------------- | ------------------- | --- |
| Withnoise,weconsiderthreelearningrates: |     |     |     | 2?7,2?8,2?9. |                              |         |      |                 |                     |     |
|                                         |     |     |     |              | calculateasmoothedlossvalue. |         |      |                 | Thiscorrespondstoan |     |
Thismethodologicalchoicewasbasedonearlyablations
averageover10╖100╖1024totalexamples,butdoesnot
| that showed | that | when adding | noise the | optimal learning |     |     |     |     |     |     |
| ----------- | ---- | ----------- | --------- | ---------------- | --- | --- | --- | --- | --- | --- |
perfectlypreservetheexpectedinvariant.
ratedoesdecrease,butgraduallyso;seeAppendixC.7.
2. Foreachmodelsizeandnoise-batchratioweapplyiso-
Batch Sizes. We use a fixed physical batch size of 1024 tonicregressiontoensurethe1280lossvaluesaremono-
acrossallexperiments. Viapost-hocaccounting, wewill tonicallydecreasingwithrespecttothenumberofiter-
analyzewhatcouldhappenatdifferenthypotheticalbatch
|     |     |     |     |     | ations. | For each | model | size | and number of iterations, |     |
| --- | --- | --- | --- | --- | ------- | -------- | ----- | ---- | ------------------------- | --- |
sizes, under the assumption that cross entropy primarily weapplyisotonicregressionagaintoensurethe18loss
dependsontheprivacybudgetandbatchsizethroughthe valuesaremonotonicallyincreasingwithrespecttothe
noise-batch ratio. We may expect this choice underesti- noise-batchratio. Wedonotenforceanymonotonicity
matesthebenefitoflargerbatchsizes,aquestionwestudy withrespecttomodelsize.
empiricallyinAppendixC.3.
Weuseisotonicregressiontoenforcedesiredmonotonic-
Noise-BatchRatio. Weconsider18valuesofnoise-batch ity properties, rather than simpler alternatives like taking
| ratio: {2?k | | k | = 6,...,23}, | plus a baseline | value of 0 |                                      |     |     |     |              |     |
| ----------- | --- | ------------ | --------------- | ---------- | ------------------------------------ | --- | --- | --- | ------------ | --- |
|             |     |              |                 |            | thecumulativeminacrosseachdimension. |     |     |     | Thelatterap- |     |
correspondingtonon-privatetraining. proachsuffersfromastatisticalphenomenonknownasthe
minimumselectionbias,whereoneoutliersamplecancom-
| Metrics.       | Every100trainingiterations, |           |              | werecordtheav-     |                                      |     |     |     |                |     |
| -------------- | --------------------------- | --------- | ------------ | ------------------ | ------------------------------------ | --- | --- | --- | -------------- | --- |
|                |                             |           |              |                    | promisethevalidityofthemeasurements. |     |     |     | Wevisualizeour |     |
| erage training |                             | loss over | the previous | 100 iterations (or |                                      |     |     |     |                |     |
smoothingprocessinAppendixC.9.
| 102,400 | training | examples). | Using training | loss instead |     |     |     |     |     |     |
| ------- | -------- | ---------- | -------------- | ------------ | --- | --- | --- | --- | --- | --- |
ofevaluationlossisstandardpracticeinscalinglawswork,
andisjustifiedbythefactthatwearetrainingforlessthan TrainingStepExtrapolation. Next,weextrapolateour
asinglephysicalepoch,sotraininglossisanunbiasedesti- smootheddatawithrespecttothenumberofiterations,by
mateofevaluationloss. fittingaparametricformtothetrainingcurveandpredicting
wherethelosswouldhavegoneiftrainingcontinuedbeyond
Weprovidedetailsonthecomputeplatformsandtraining
|     |     |     |     |     | 128Kiterations. |     | Weuseasimpleparametricforminspired |     |     |     |
| --- | --- | --- | --- | --- | --------------- | --- | ---------------------------------- | --- | --- | --- |
throughputinAppendixC.5.
|     |     |     |     |     | byHoffmannetal.(2022),namelyL=E+ |     |     |     | A . Wefitthis |     |
| --- | --- | --- | --- | --- | -------------------------------- | --- | --- | --- | ------------- | --- |
T?
functionusingscipy.optimize.curve_fit,whichusesthe
LevenbergûMarquardtalgorithmtosolveanonlinearleast
|     |     |     |     |     | squaresproblem(Nocedal&Wright,1999). |     |     |     | Weindepen- |     |
| --- | --- | --- | --- | --- | ------------------------------------ | --- | --- | --- | ---------- | --- |
astheyarelikelytoshowcaseinterestingtrade-offs.
4

ScalingLawsforDifferentiallyPrivateLanguageModels
     I   
 4 V M Z E G ]  & Y H K I X  4 V M Z E G ]  & Y H K I X  4 V M Z E G ]  & Y H K I X
|                  |     |    |     |     |   I    |    |     |              |    |     |     |     |
| ---------------- | --- | --- | --- | --- | ---------- | --- | --- | ------------ | --- | --- | --- | --- |
|                  |     |    |     |     |            |     |     |        |     |     |     |     |
|      I    |     |     |     |     |            |    |     |              |    |     |     |     |
 I ^ M 7  P I H S 1     I ^ M 7  L G X E &   I         
|     |     |    |     |     |     |    |     |  W R S M X E V I X - |    |     |     |     |
| --- | --- | ---- | --- | --- | --- | ---- | --- | -------------------- | ---- | --- | --- | --- |
    I   
|     I    |     |     |     |     |        |     |     |     |     |     |     |     |
| -------------- | --- | --- | --- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- |
     
     
     I   
    
|     I    |     |     |     |     |     |     |     |      |     |     |     |     |
| -------------- | --- | --- | --- | --- | --- | --- | --- | -------- | --- | --- | --- | --- |
                                                                                                                       
 ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X  ' S Q T Y X I  & Y H K I X
|     |     | (a)ModelSize |     |     |     | (b)BatchSize |     |     |     | (c)Iterations |     |     |
| --- | --- | ------------ | --- | --- | --- | ------------ | --- | --- | --- | ------------- | --- | --- |
Figure1.Optimalmodelsize,batchsize,anditerationsforvaryingprivacyandcomputebudgets,withafixeddatabudgetof108.Lines
showminimumvaluesforeachhyper-parameterthatachievewithin1%ofoptimalcross-entropyforconstant-computetraining.Shaded
regionsindicatethefullrangeofnear-optimalsettings.
Model Size (M) 1 Input budgets putebudget. Usingprivacyaccountingandnoisecalibration
4.5M ? M ? 784M
Compute Budget  2 Constant-compute configs functionsfromthedp_accountinglibrary,wecomputethe
(C)
noise-batchratioasafunctionoftheprivacybudget,data
3 Noise calibration
Batch Size (B)
|     |     |     |     |     | 4 Fitted function |     | budget, iterations, | and | (expected) | batch | size. | Finally, we |
| --- | --- | --- | --- | --- | ----------------- | --- | ------------------- | --- | ---------- | ----- | ----- | ----------- |
Privacy Budget
|     | (?) |     |     |                |     |                   | queryourfittedfunctionwiththisnoise-batchratio,along |                 |       |         |          |          |
| --- | --- | --- | --- | -------------- | --- | ----------------- | ---------------------------------------------------- | --------------- | ----- | ------- | -------- | -------- |
|     |     |     |     | Iterations (T) |     | Predic t e d Loss |                                                      |                 |       |         |          |          |
|     |     |     |     |                |     | ( L )             | withthegivenmodelsizeandnumberofiterations,giving    |                 |       |         |          |          |
|     |     |     |     |                |     |                   | us a final                                           | estimate of the | cross | entropy | of these | training |
Data Budget
|     | (N) |     |     |     |     |     | configurations. | Inaddition,wecanalsospecifydirectlythe |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------------- | -------------------------------------- | --- | --- | --- | --- |
Noise-Batch Ratio
2-23 ? ? ? 2-6
trainingconfigurationsinsteadofthecomputebudgetforthe
purposesofconductingspecificablationsorcomparisons.
Figure2.Workflowforestimatingcrossentropyofdifferenttrain-
ingconfigurationsundergivencompute,privacy,anddatabudgets.
dently fit a function for each model size and noise-batch 4.ExperimentalFindingsofScalingLaws
| ratioondatafromiterations16K |     |     |     | to128K. |     |     |     |     |     |     |     |     |
| ---------------------------- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
4.1.OptimalComputeBudgetAllocation
|         |     |          |     |            |           |          | We first determine | how         | to best       | utilize | our compute | bud-         |
| ------- | --- | -------- | --- | ---------- | --------- | -------- | ------------------ | ----------- | ------------- | ------- | ----------- | ------------ |
| Scaling | Law | Fitting. |     | After data | cleaning, | our goal |                    |             |               |         |             |              |
|         |     |          |     |            |           |          | get in different   | situations. | Specifically, |         | for         | a given com- |
is to fit a function L(M,T,?») that estimates the pute/privacy/databudget,weaimtounderstandhowtoopti-
| loss | under | a M-parameter |     | model | training | for T iter- |     |     |     |     |     |     |
| ---- | ----- | ------------- | --- | ----- | -------- | ----------- | --- | --- | --- | --- | --- | --- |
mallyallocateourcomputebudgetamongthemodelsize,
ations with a noise-batch ratio of ?». We fit this batchsize,andnumberofiterations. Additionally,weseek
function using linear interpolation, and specifically tounderstandhowtheoptimalallocationchangesperbud-
scipy.interpolate.RegularGridInterpolatorinPython.
get. Whilethisquestioncanbeansweredforvirtuallyany
Since M, T, and ?» are all naturally varied in log- settingofthebudgetswiththedatawecollected,wevisu-
| space, | weapplyinterpolationtothefunctionF |     |     |     |     | suchthat |             |                 |     |          |           |         |
| ------ | ---------------------------------- | --- | --- | --- | --- | -------- | ----------- | --------------- | --- | -------- | --------- | ------- |
|        |                                    |     |     |     |     |          | alize a few | relevant slices | of  | the data | in Figure | 1. More |
:=
F(logM,logT,log?») L(M,T,?»)instead. Thisfunc- comprehensiveresultscanbefoundinAppendixC.8. From
tion is well-defined for any T and any M,?» within the thisvisualization,wemakethefollowingobservations:
| range | of experimental |     | settings | considered; |     | that is, M ? |     |     |     |     |     |     |
| ----- | --------------- | --- | -------- | ----------- | --- | ------------ | --- | --- | --- | --- | --- | --- |
?[0.523,0.56]. ò Forsmallcomputebudgets,theoptimalallocationofcom-
| [4.5M,784M],?» |     |     |     | Becauseweuseinterpola- |     |     |             |          |         |          |            |       |
| -------------- | --- | --- | --- | ---------------------- | --- | --- | ----------- | -------- | ------- | -------- | ---------- | ----- |
|                |     |     |     |                        |     |     | pute budget | does not | exhibit | a strong | dependence | on ?. |
tion,ourfittedfunctionmatchesthesmootheddataexactly
However,thereisasmallbutconsistenttrendthatwith
| at the | evaluation | points, |     | and approximates |     | it in between |                |          |     |        |         |              |
| ------ | ---------- | ------- | --- | ---------------- | --- | ------------- | -------------- | -------- | --- | ------ | ------- | ------------ |
|        |            |         |     |                  |     |               | larger privacy | budgets, | one | should | train a | larger model |
them. InAppendixEwealsofitaparametricformforthis
functionaswell,findingthatitislargelyconsistentwiththe with a smaller batch size and for more iterations than
|     |     |     |     |     |     |     | onewouldtrainwithasmallerprivacybudget. |     |     |     |     | Thisfind- |
| --- | --- | --- | --- | --- | --- | --- | --------------------------------------- | --- | --- | --- | --- | --------- |
non-parametricfit.
ingissomewhatsurprising,sinceastheprivacybudget
getslarger,thepointatwhichincreasingbatchsizeleads
3.4.UsingtheFittedFunctions
|                                             |     |     |     |                    |     |      | to diminishing | returns           | in terms | of     | noise-batch | ratio in-   |
| ------------------------------------------- | --- | --- | --- | ------------------ | --- | ---- | -------------- | ----------------- | -------- | ------ | ----------- | ----------- |
| WearenowabletoanswerDPscalinglawsquestions. |     |     |     |                    |     | Fig- |                |                   |          |        | (cid:112)   |             |
|                                             |     |     |     |                    |     |      | creases        | roughly according |          | to ? N | ?/T         | (Ponomareva |
| ure2summarizesourapproach.                  |     |     |     | Webeginwithinputs: |     | the  | etal.,2023).   |                   |          |        |             |             |
computebudget,privacybudget,anddatabudget. Second, ò There are many settings of model size, batch size, and
weproceedbyenumeratinganexhaustivesetofconstant- number of iterations that achieve near-optimal loss, as
computetrainingconfigurations;i.e.,combinationsofmodel indicatedbythelargeshadedregions. Thissuggestssome
size,batchsize,anditerationsthatrequirethegivencom-
5

ScalingLawsforDifferentiallyPrivateLanguageModels
|    |     |     |     |     |    |     |     |     |     |            |     |                              |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- | ---------------------------- | --- | --- |
|    |     |     |     |     |     |     |     |     |     |   I    |     |  4 V M Z E G ]  & Y H K I X |     |     |
|     |     |     |     |     |    |     |     |     |     |            |    |                            | 102 | 103 |
 ] T S V X R )  W W S V '  I ^ M 7  P I H S 1    W R I O S 8 104 105 106    ' L M R G L M P P E 
|    |                        |          |          |     |    |                        |          |        |     |        |        |     |     |     |
| --- | ---------------------- | -------- | -------- | --- | --- | ---------------------- | -------- | ------ | --- | ------------ | ------ | --- | --- | --- |
|     |                        |     1 |          |     |     |                        |     1 |        |     |         |        |     |     |     |
|    |  ( E X E  & Y H K I X |          |          |     |    |  ( E X E  & Y H K I X |          |        |     |              |        |     |     |     |
|    | 1 0                    | 6        |          |     |    | 1 0 6                  |          |        |     |          |        |     |     |     |
|     | 1 0                    | 7        |     1 |     |     | 1 0 7                  |          |    1 |     |              |        |     |     |     |
|     | 108                    |          |          |     |     | 108                    |          |        |     |              |        |     |     |     |
|    |                        |          |          |     |    |                        |          |        |     |              |     |     |     |     |
|     | 109                    |          |          |     |     | 109                    |          |        |     |              |        |     |     |     |
  
                                                                                                                    
|     |     |  ' S Q T Y X I  & Y H K I X   * 0 3 4 W 
 |     |     |     |     |  ' S Q T Y X I  & Y H K I X   * 0 3 4 W 
 |     |     |     |     |     |     |     |
| --- | --- | -------------------------------------------- | --- | --- | --- | --- | -------------------------------------------- | --- | --- | --- | --- | --- | --- | --- |
 ' S Q T Y X I  & Y H K I X
(a)PrivacyBudget:?=1 (b)PrivacyBudget:?=8 (c)Token-to-ModelRatio
Figure3.(a-b)Bestcross-entropylossachievedforvaryingcomputebudgets,fourdatabudgets,andtwodifferentprivacybudgets.Each
figureisannotatedwiththeoptimalmodelsizeattheinflectionpointfortwoofthecurves.(c)NumberoftrainingtokensS╖B╖T divided
bynumberofmodelparametersforthecompute-optimaltrainingconfiguration,fixingthedatabudgettoN =107.
amountofrobustnessforcompute-optimaltraininghyper- complexity.IntheabsenceofDP,aconstanttoken-to-model
parameters. Allelsebeingequal,trainingsmallermodels ratioof20╫istherecommendedbestpractice(Hoffmann
onmoretokensshouldgenerallybepreferredduetotheir etal.,2022). AsweseeinFigure3c,thebehaviorunderDP
| inference-timeefficiencyadvantages. |     |     |     |     |     |     |     | isnotassimple: |     |     |     |     |     |     |
| ----------------------------------- | --- | --- | --- | --- | --- | --- | --- | -------------- | --- | --- | --- | --- | --- | --- |
ò Optimalmodelsizesaremuchsmallerthanpredictedby
ò Thetoken-to-modelratioincreaseswithcomputebudget,
| non-private |     | scaling |     | laws. For instance, |     | at 1022 | FLOPs, |            |     |         |         |          |        |         |
| ----------- | --- | ------- | --- | ------------------- | --- | ------- | ------ | ---------- | --- | ------- | ------- | -------- | ------ | ------- |
|             |     |         |     |                     |     |         |        | especially | for | smaller | privacy | budgets. | As the | privacy |
?108 parametersarecompute-optimal,comparedto?
budgetincreases,theslopedecreases,andforasufficiently
1010non-privately.
largeprivacybudgetbecomesnearlyflataspredictedby
|     |     |     |     |     |     |     |     | the prior | work. | However, | the | privacy | budget | required |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | ----- | -------- | --- | ------- | ------ | -------- |
4.2.BenefitsofIncreasedCompute
|     |     |     |     |     |     |     |     | to exhibit                       | behavior | similar |     | to prior work | is             | extremely |
| --- | --- | --- | --- | --- | --- | --- | --- | -------------------------------- | -------- | ------- | --- | ------------- | -------------- | --------- |
|     |     |     |     |     |     |     |     | large. Notethataprivacybudgetof? |          |         |     |               | = 1000provides |           |
Wenowaimtounderstandandmeasurehowmuchbenefit
increasedcomputebudgetscanprovideandwhenitcanpro- nomeaningfulformalmembershipinferenceprotection.3
Nonetheless,thenoiseaddedstillhasasignificantimpact
videit. InFigure3a,welookathowtheoptimalachievable
crossentropydependsonthecomputebudgetfordifferent ontraining: itsbehaviorinFigure3cismoresimilartoa
privacybudgetof1thannon-privatetraining(?=?).
| settingsofdata/privacybudget. |     |     |         | Ourmainobservationsare: |          |                |     |                |     |         |         |              |     |           |
| ----------------------------- | --- | --- | ------- | ----------------------- | -------- | -------------- | --- | -------------- | --- | ------- | ------- | ------------ | --- | --------- |
|                               |     |     |         |                         |          |                |     | ò For moderate |     | privacy | budgets | in the range | of  | [1,10], a |
| ò Increasing                  |     | the | compute | budget                  | can be a | very effective |     |                |     |         |         |              |     |           |
goodtoken-to-modelratioistypicallybetween1000and
strategy for reducing cross entropy under a fixed pri- 100000,althoughforsufficientlylargecomputebudgets,
vacy/databudgetuptoalimit,butthereisaninflection
|     |     |     |     |     |     |     |     | it can go | beyond | this | point. | This connects | back | to an |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | ------ | ---- | ------ | ------------- | ---- | ----- |
pointwhereincreasingthecomputebudgetbeyondthis
earlierobservationthatevenwithinfinitecompute,there
| pointprovideslittletonobenefit. |     |     |     |     | Theôcriticalcompute |     |     |     |     |     |     |     |     |     |
| ------------------------------- | --- | --- | --- | --- | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
iseventuallynobenefittoincreasingthemodelsizewhen
budgetöwherethisinflectionpointoccursincreaseswith
|                                 |     |     |     |     |                 |     |     | usingamodestprivacybudget. |     |     |     | Theseratiosroughlycor- |     |     |
| ------------------------------- | --- | --- | --- | --- | --------------- | --- | --- | -------------------------- | --- | --- | --- | ---------------------- | --- | --- |
| bothprivacybudgetanddatabudget. |     |     |     |     | Forexample,with |     |     |                            |     |     |     |                        |     |     |
respondtotrainingmodels10╫to50╫smallerthanpre-
| adatabudgetof108 |     |     |     | andaprivacybudgetof1,thebest |     |     |     |     |     |     |     |     |     |     |
| ---------------- | --- | --- | --- | ---------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
dictedbyHoffmannetal.(2022).
crossentropyisachievedwithacomputebudget?1020
| andcorrespondstoamodelwith114M |     |     |     |     | parameters. |     | This |     |     |     |     |     |     |     |
| ------------------------------ | --- | --- | --- | --- | ----------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
4.4.ComparisonAgainstBaselines
isaqualitativelydifferentbehaviorthannon-privatescal-
inglaws,whereincreasingthecomputebudgetcontinues We now measure the improvement our compute-optimal
toprovidebenefitsevenattheextremescales. trainingconfigurationsprovideovernaturalbaselines. In
theDPtrainingliterature,itiscommontofixthetraining
| More | comprehensive |     |     | analysis of | the saturating | compute |     |     |     |     |     |     |     |     |
| ---- | ------------- | --- | --- | ----------- | -------------- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
configuration(model,iterations,batchsize),andvarythe
budgetforarepresentativesetofdataandprivacybudgets
|     |     |     |     |     |     |     |     | privacybudget. | Tothatend,weconsider3baselinetraining |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | -------------- | ------------------------------------- | --- | --- | --- | --- | --- |
canbefoundinAppendixC.1.
configurations:BertLargetrainedfor7500stepswithabatch
|     |     |     |     |     |     |     |     | size of 1295, | BertMedium |     | trained | for 5000 | steps | with a |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------- | ---------- | --- | ------- | -------- | ----- | ------ |
4.3.Token-to-ModelRatio
|     |     |        |            |      |                       |     |     | batch size | of 15879 | and | BertTiny | trained | for 2500 | steps |
| --- | --- | ------ | ---------- | ---- | --------------------- | --- | --- | ---------- | -------- | --- | -------- | ------- | -------- | ----- |
| We  | now | aim to | understand | more | about compute-optimal |     |     |            |          |     |          |         |          |       |
3However,valuesevenlargerthanthishavebeenshowntobe
trainingconfigurations,specificallytheratioofthenumber
effectiveagainstreconstructionattacksinpriorworks(Balleetal.,
oftrainingtokens(asmeasuredbyS╖B╖T)tomodelsizeand 2022;Kaissisetal.,2023;Zilleretal.,2024).
| privacybudget. |     |     | Inotherwords,westudyaformofsample |     |     |     |     |     |     |     |     |     |     |     |
| -------------- | --- | --- | --------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
6

ScalingLawsforDifferentiallyPrivateLanguageModels
|     |  
 I ^ M 7  L G X E &   X I K H Y &  I X Y T Q S ' |     |     |     |  
 I ^ M 7  L G X E &   X I K H Y &  I X Y T Q S ' 106 |     |     |     |    |     |     |
| --- | ------------------------------------------------------ | --- | --- | --- | ---------------------------------------------------------- | --- | --- | --- | ---- | --- | --- |
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
|     |                                              |     |     |    | 105 | 106 107                                | 108 |     | 105 | 106 | 107 108 |
| --- | ------------------------------------------------ | ------ | ----- | ---- | --- | -------------------------------------- | --- | --- | --- | --- | ------- |
|     |  4 V M Z E G ]  & Y H K I X   ) T W M P S R 
 |        |       |      |     |  ( E X E  & Y H K I X   9 W I V W 
 |     |     |     |     |         |
 ( E X E  & Y H K I X   9 W I V W 
=224
|     | (a)DataBudget:N |     |     |     | (b)PrivacyBudget:?=4 |     |     |     | (c)BatchSize:B |     | =65536 |
| --- | --------------- | --- | --- | --- | -------------------- | --- | --- | --- | -------------- | --- | ------ |
Figure4.Marginalbenefitsofincreasingtheprivacybudget(?),computebudget(B),anddatabudget(N)onthenoise-batchratio.
| with              | a batch size | of 283061.                         | In  | all three, | we fix the | data |    |     |                            |     |                                |
| ----------------- | ------------ | ---------------------------------- | --- | ---------- | ---------- | ---- | --- | --- | -------------------------- | --- | ------------------------------ |
|                   |              |                                    |     |            |            |      |     |     |     & I V X 0 E V K I   |     |  ' S Q T Y X I  3 T X M Q E P |
| budgettoN         | = 107.       | Eachofthesetrainingconfigurations  |     |            |            |      |     |     |                            |     |                                |
|                   |              |                                    |     |            |            |      |     |     |     & I V X 1 I H M Y Q |     |    1 1019  * 0 3 4 W       |
| require1019FLOPs. |              | Thefirstconfigurationisclosetowhat |     |            |            |      |    |     |                            |     |                                |
|                   |              |                                    |     |            |            |      |     |     |     & I V X 8 M R ]     |     |    2 1018  * 0 3 4 W       |
 ] T S V X R )  W W S V '
wouldbepredictedbynon-privatescalinglaws(Hoffmann
 
etal.,2022),whilethelastmightbeselectedbyanexpert
| inDPwhorecognizestheimportanceoflargebatchsizes. |     |     |     |     |     |     |    |     |     |     |     |
| ------------------------------------------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
TheresultsareshowninFigure5,fromwhichwefind:
 
ò Formostprivacybudgets,thetrainingconfigurationpre-
 
dictedbynon-privatescalinglaws(BertLarge)yieldsvery                    
lowutility. Whileutilityimprovesforsufficientlylarge  4 V M Z E G ]  & Y H K I X   ) T W M P S R 
privacybudgets,thissuggeststhatprivatescalinglawsare
Figure5.Comparisonofacompute-optimaltrainingconfiguration
fundamentallydistinctfromnon-privateones.
tosomenaturalbaselinesasafunctionoftheprivacybudget.All
ò Theoptimaltrainingconfigurationchangeswiththepri- modelsaretrainedwithacomputebudgetof1019FLOPsanda
| vacy                            | budget, | and naively | using | a fixed         | training | config-       |     |                   |     |     |     |
| ------------------------------- | ------- | ----------- | ----- | --------------- | -------- | ------------- | --- | ----------------- | --- | --- | --- |
|                                 |         |             |       |                 |          | databudgetofN |     | =107respectively. |     |     |     |
| urationacrossallprivacybudgets, |         |             |       | asiscommoninthe |          |               |     |                   |     |     |     |
someoftheexperimentalobservationspresentedearlier.
literature,leavessignificantutilityonthetable.
ò Compute-optimaltrainingcaneithergivebetterutility,or Weanalyzehowthenoise-batchratiobehavesasafunction
savecompute/privacybudgetunderfixedutility. Training ofprivacybudget(asmeasuredby?),computebudget(as
acompute-optimalmodelwith2╫1018FLOPsyieldssim- measuredbyB),anddatabudget(asmeasuredbyN). We
ilarutilityasthebestbaselinemodelswith5╫theFLOPs
|     |     |     |     |     |     | fix | T = 16000 | training | steps | here, | but our findings hold |
| --- | --- | --- | --- | --- | --- | --- | --------- | -------- | ----- | ----- | --------------------- |
forthereasonablerangeofprivacybudgets. Thisisjust for any fixed number of steps4. We compute the noise-
oneinstructiveexample.Thesavingsinothersettingsmay batchratiofordifferentsettingsbyusingthedp_accounting
changedependingonfactorslikedatabudget,compute library(GoogleDPTeam,2022).Althoughthefunctionthat
budget,andqualityofthebaselinetrainingconfigurations computesthenoise-batchratioisgenerallywell-understood
(e.g.,thecomputesavingsoverBertLargeexceeds100╫,
inthesensethatweknowhowtocomputeittightlygiven
althoughthisisnotshown). theprivacyandtrainingparameters,itsprecisebehavioras
afunctionoftheprivacybudget,computebudget,anddata
4.5.SynergybetweenPrivacy/Data/ComputeBudgets budgetisnotcommonknowledge. Indeed,duetolackof
clearandsimpleguidanceonhowtoconfigureDP-SGD,it
Whilemanyofthetrade-offsthatweexploreinthiswork
|     |     |     |     |     |     | is not | uncommon |     | to use or | compare | against sub-optimal |
| --- | --- | --- | --- | --- | --- | ------ | -------- | --- | --------- | ------- | ------------------- |
aredata-dependentandrequiresignificantempiricalinvesti-
configurationsofDP-SGD.
gation,manygeneralizablescalinginsightscanbederived
purelybyexploringprivacyaccounting. Inthissectionwe In Figure 4 we plot three vector fields. Along each axis
detail some of these, which corroborate many of our ex- wevarytheprivacybudget,computebudget,anddatabud-
perimentalevidenceaboveandrequireverylittlecompute. get. The direction and magnitude of the vectors indicate
Theseinsightsaredomain-agnostic,andthereforelikelyto
4WhilecomputebudgetcouldalsobevariedthroughT,the
generalizetoothermachinelearningsettingsbeyondlan-
|     |     |     |     |     |     | effectofchangingT |     |     | isdata-dependentandthenoisebatchratiois |     |     |
| --- | --- | --- | --- | --- | --- | ----------------- | --- | --- | --------------------------------------- | --- | --- |
guagemodels,whilealsohelpingusunderstandandexplain notdirectlycomparableacrossdifferentT.
7

ScalingLawsforDifferentiallyPrivateLanguageModels
howmuchdoublingeachofthesebudgetsreducesthenoise- Tobabenetal.,2023;Wuetal.,2024a;Zhangetal.,2024b;
batchratio. Eachbudgetisvariedonalogarithmicscaleat Chuaetal.,2024a)orprompting(Duanetal.,2023b;a;Wu
differentpowersof2.Thelengthofthexandycomponents et al., 2024b; Tang et al., 2024; Hong et al., 2024; Amin
ofthevectorisdeterminedbyratioofnoise-batchratiomi- etal.,2024)LLMscanachievestrongperformancewhile
nusone. Forexample,avectoroflength1alongtheprivacy ensuringdownstreamdataprivacy. However,theseprivacy
budgetaxismeansdoublingtheprivacybudgetreducesthe guaranteesarelimitedtodownstreamdata,leavingthepre-
noise-batchratiobyafactoroftwo. trainingprocessexposed. GiventhatLLMsarepre-trained
onextensiveInternetdata,whichisoftensourcedwithout
Astherearethreebudgetsthattogetherdeterminethenoise-
explicituserconsent(Gold&Latonero,2017),thisraises
batchratioandtheyinteractinnuancedways,weshowthree
|                 |          |         |            |              | ethical and privacy | concerns (TramΦr | et al., 2022). | Safe- |
| --------------- | -------- | ------- | ---------- | ------------ | ------------------- | ---------------- | -------------- | ----- |
| plots in Figure | 4, where | we vary | two of the | budgets at a |                     |                  |                |       |
guardingprivacyduringpre-trainingremainsasignificant
| timewhilefixingthethird. |     | Theseplotstogetherprovidea |     |     |                                                    |     |     |     |
| ------------------------ | --- | -------------------------- | --- | --- | -------------------------------------------------- | --- | --- | --- |
|                          |     |                            |     |     | challenge. Thisstudyseekstoprovidenewinsightstoad- |     |     |     |
fairlycompletepictureofthebehaviorofthenoise-batch
vanceprivacy-preservingpre-trainingoflanguagemodels.
ratio. Ourmainobservationsareenumeratedbelow:
|             |                |         |                   |           | DPTrainingofVisionModels. |                    | TrainingDPmodelsfrom |     |
| ----------- | -------------- | ------- | ----------------- | --------- | ------------------------- | ------------------ | -------------------- | --- |
| ò In Figure | 4a we see that | varying | the privacy       | budget or |                           |                    |                      |     |
|             |                |         |                   |           | scratch for vision        | tasks is an active | area of research     | (Yu |
| compute     | budget alone   | (while  | fixing the other) | leads to  |                           |                    |                      |     |
etal.,2021;Deetal.,2022;Buetal.,2022;Kurakinetal.,
| diminishingreturns. | Increasingtheprivacyandcompute |               |     |             |                         |                            |     |     |
| ------------------- | ------------------------------ | ------------- | --- | ----------- | ----------------------- | -------------------------- | --- | --- |
|                     |                                |               |     |             | 2022;Sanderetal.,2024). | ThemostrelatedworkisSander |     |     |
| budgets             | in tandem leads                | to consistent | and | predictable |                         |                            |     |     |
etal.(2023),whichinvestigatesthescalingbehaviorofDP
reductionsinthenoise-batchratio.
|     |     |     |     |     | training on vision | tasks by varying | key hyperparameters. |     |
| --- | --- | --- | --- | --- | ------------------ | ---------------- | -------------------- | --- |
ò InFigure4bweseeasimilartrendwhenvaryingdataand
Theydemonstratethat,underafixedprivacybudget,care-
| computebudgets. | Atsmallcomputebudgets,increasing |     |     |     |     |     |     |     |
| --------------- | -------------------------------- | --- | --- | --- | --- | --- | --- | --- |
fullytuningbatchsize,trainingsteps,andlearningrateis
thedatabudgetprovideslimitedbenefit,andvice-versa.
criticalforbetteraccuracy.However,Sanderetal.(2023)do
Increasingthemsimultaneouslyleadstoconsistentand
notaccountforaboundedcomputebudget,acrucialfactor
predictableimprovementsinthenoise-batchratio.
inscalinglawstudiesforlanguagemodels(Hoffmannetal.,
| ò In Figure | 4c we see that | while | increasing | data and pri- |     |     |     |     |
| ----------- | -------------- | ----- | ---------- | ------------- | --- | --- | --- | --- |
2022). Additionally,itremainsunclearhowtheirfindings
vacybudgetscanbehelpful,forafixedcomputebudget,
|     |     |     |     |     | translatetolanguagemodelingtasks. |     | Inthiswork,weex- |     |
| --- | --- | --- | --- | --- | --------------------------------- | --- | ---------------- | --- |
increasingeitherprovidesdiminishingandeventuallyneg-
tendscalinglawanalysestolanguagemodels,incorporating
ligiblebenefits.
bothstandardoptimizationhyperparametersandabounded
Theseobservationsprovideguidanceonhowtoeffectively compute budgets to align more closely with recent LLM
scalingresearch.
configureDP-SGDandcorroborateourscalinglawsabove.
| 5.RelatedWork |     |     |     |     | 6.ConclusionandFutureDirections |     |     |     |
| ------------- | --- | --- | --- | --- | ------------------------------- | --- | --- | --- |
ScalingLawsofLanguageModels. Recentresearchhas Thisworkestablishesaprincipledmethodologyforunder-
standingthecompute-privacy-utilitytradeoffoflanguage
exploredthescalinglawsgoverningtheperformanceoflan-
guagemodelsastheyincreaseinsize. Kaplanetal.(2020) modelstrainedunderDP,anditrepresentsanimportantstep
foundapower-lawrelationshipbetweenmodelsize,dataset towardstraininglarger,morecapablemodelsefficientlyon
size,andcomputebudget,withperformanceondownstream sensitive user data. This endeavor will require collecting
tasksfollowingpredictablescalingcurves. Hoffmannetal. increasinglylargerdatasetsoverlargergroupsofindividu-
|     |     |     |     |     | als,whilesimultaneouslyscalingupcompute. |     | Forexample, |     |
| --- | --- | --- | --- | --- | ---------------------------------------- | --- | ----------- | --- |
(2022)extendedthistoopen-endedlanguagemodels,ob-
servingsmoothscalingover7ordersofmagnitude. Chowd- totrainabillionparametermodeloptimallywithDP,one
hery et al. (2022) trained PaLM, a 540 billion parameter couldcollectdatafromonebillionindividuals,usingagen-
erousprivacybudgetof??10,andtrainonlargecompute
| modelthatcontinuedthetrends. |     |     | Theseresultssuggestlan- |     |     |     |     |     |
| ---------------------------- | --- | --- | ----------------------- | --- | --- | --- | --- | --- |
guage models may continue improving as they scale, al- clusters for ? 1023 FLOPs. This is in stark contrast to
though Ganguli et al. (2022) note scaling alone may not non-privatelaws,e.g.,Aniletal.(2023)suggestsamuch
besufficientforopen-endedintelligence. Inthecontextof larger?20Bparametermodelcouldbetrainedwith?2B
| traininglanguagemodelswithDP,wheregradientclipping |     |     |     |     | examples. |     |     |     |
| -------------------------------------------------- | --- | --- | --- | --- | --------- | --- | --- | --- |
andnoiseaddition(Abadietal.,2016)altertrainingdynam-
Thisworkraisesseveralnewquestionsworthexploringin
ics,thescalinglawshaveremainedlargelyunexploreduntil
futurework,includinghowdothescalinglawschangewhen
thiswork.
(1)doingfinetuninginsteadofpretraining,(2)usingbetter
ApplyingDPinFine-tuningorPrompting.Recentstudies underlyingmechanisms,and(3)whenallowedtovarythe
demonstratethatfine-tuning(Buetal.,2023;Wangetal., sequencelength.Thesequestions(alongwithseveralothers)
2024;Duetal.,2023;Thakeretal.,2023;Zhangetal.,2023; arediscussedingreaterdetailinAppendixA.
8

ScalingLawsforDifferentiallyPrivateLanguageModels
ImpactStatement Berrada,L.,De,S.,Shen,J.H.,Hayes,J.,Stanforth,R.,Stutz,
|     |     |     |     |     |     |     | D., Kohli, | P., Smith, | S. L., and Balle, | B. Unlocking | accu- |
| --- | --- | --- | --- | --- | --- | --- | ---------- | ---------- | ----------------- | ------------ | ----- |
Thispaperpresentsworkwhosegoalistoadvancethefield racyandfairnessindifferentiallyprivateimageclassification.
ofmachinelearning,specificallyintheareaofdifferentially arXiv:2308.10888,2023.
| private | (DP) language | models. | It  | establishes | DP  | scaling |           |                |                  |                 |     |
| ------- | ------------- | ------- | --- | ----------- | --- | ------- | --------- | -------------- | ---------------- | --------------- | --- |
|         |               |         |     |             |     |         | Biderman, | S., Prashanth, | U. S., Sutawika, | L., Schoelkopf, | H., |
lawsthatshedlightonthetrade-offsbetweencompute,pri-
|     |     |     |     |     |     |     | Anthony,Q.,Purohit,S.,andRaff,E. |     |     | Emergentandpredictable |     |
| --- | --- | --- | --- | --- | --- | --- | -------------------------------- | --- | --- | ---------------------- | --- |
vacy,andutility,andcanleadtomoreefficientandeffective
|     |     |     |     |     |     |     | memorizationinlargelanguagemodels. |     |     | InNeurIPS,2023. |     |
| --- | --- | --- | --- | --- | --- | --- | ---------------------------------- | --- | --- | --------------- | --- |
methodsfortrainingLLMsonuserdatawhilesatisfyingDP,
|                                         |     |     |     |     |            |     | Bu, Z., Mao, | J., and Xu, | S. Scalable | and efficient training | of  |
| --------------------------------------- | --- | --- | --- | --- | ---------- | --- | ------------ | ----------- | ----------- | ---------------------- | --- |
| agoldstandardforboundingtheprivacyloss. |     |     |     |     | Thescaling |     |              |             |             |                        |     |
largeconvolutionalneuralnetworkswithdifferentialprivacy.In
lawspresentedcanhelpresearchersandpractitionerschoose
NeurIPS,2022.
| model sizes, | batch sizes, | and | training | iterations |     | based on |     |     |     |     |     |
| ------------ | ------------ | --- | -------- | ---------- | --- | -------- | --- | --- | --- | --- | --- |
availablecompute,data,andprivacybudgets. Bydevelop- Bu,Z.,Wang,Y.,Zha,S.,andKarypis,G. Differentiallyprivate
|     |     |     |     |     |     |     | optimizationonlargemodelatsmallcost. |     |     | InICML,pp.3192û |     |
| --- | --- | --- | --- | --- | --- | --- | ------------------------------------ | --- | --- | --------------- | --- |
ingmethodstomakeDPtrainingmorefeasible,thepaper
3218,2023.
contributestotheresponsibledevelopmentanddeployment
| ofAItechnologies. | Wepointoutthat,whenapplyingDP |     |     |     |     |     |     |     |     |     |     |
| ----------------- | ----------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Carlini,N.,Tramer,F.,Wallace,E.,Jagielski,M.,Herbert-Voss,
inpractice,theprivacyunithastobechosencarefully;in A.,Lee,K.,Roberts,A.,Brown,T.,Song,D.,Erlingsson,U.,
particular, a user-level guarantee may be needed. More- etal. Extractingtrainingdatafromlargelanguagemodels. In
USENIXSecurity,2021.
over,whileavaluabletool,DPmaynotbesufficientwhen
trainingonuserdata;additionalmitigationsmayneedtobe Carlini,N.,Ippolito,D.,Jagielski,M.,Lee,K.,TramΦr,F.,and
simultaneouslyapplieddependingontheapplication. Zhang,C. Quantifyingmemorizationacrossneurallanguage
|     |     |     |     |     |     |     | models. | InICLR,2023. |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------- | ------------ | --- | --- | --- |
References Carlini, N., Jagielski, M., Choquette-Choo, C. A., Paleka, D.,
Pearce,W.,Anderson,H.,Terzis,A.,Thomas,K.,andTramΦr,
Abadi,M.,Chu,A.,Goodfellow,I.,McMahan,H.B.,Mironov,
|                          |     |     |                              |     |     |     | F. Poisoningweb-scaletrainingdatasetsispractical. |     |     | InS&P, |     |
| ------------------------ | --- | --- | ---------------------------- | --- | --- | --- | ------------------------------------------------- | --- | --- | ------ | --- |
| I.,Talwar,K.,andZhang,L. |     |     | Deeplearningwithdifferential |     |     |     |                                                   |     |     |        |     |
pp.407û425,2024.
| privacy. | InCCS,pp.308û318,2016. |     |     |     |     |     |     |     |     |     |     |
| -------- | ---------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Charles,Z.,Ganesh,A.,McKenna,R.,McMahan,H.B.,Mitchell,
N.,Pillutla,K.,andRush,K.Fine-tuninglargelanguagemodels
Achiam,J.,Adler,S.,Agarwal,S.,Ahmad,L.,Akkaya,I.,Aleman,
|     |     |     |     |     |     |     | withuser-leveldifferentialprivacy. |     | arXiv:2407.07737,2024. |     |     |
| --- | --- | --- | --- | --- | --- | --- | ---------------------------------- | --- | ---------------------- | --- | --- |
F.L.,Almeida,D.,Altenschmidt,J.,Altman,S.,Anadkat,S.,
| etal. | GPT-4technicalreport. |     | arXiv:2303.08774,2023. |     |     |     |     |     |     |     |     |
| ----- | --------------------- | --- | ---------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
Chen,X.,Liang,C.,Huang,D.,Real,E.,Wang,K.,Liu,Y.,Pham,
|                |              |            |       |          |           |      | H., Dong,                                  | X., Luong, | T., Hsieh, C.-J., | Lu, Y., andLe, | Q.V. |
| -------------- | ------------ | ---------- | ----- | -------- | --------- | ---- | ------------------------------------------ | ---------- | ----------------- | -------------- | ---- |
| Afonja,        | G., Sim, R., | Lin, Z.,   | Inan, | A., and  | Yekhanin, | S.   |                                            |            |                   |                |      |
|                |              |            |       |          |           |      | Symbolicdiscoveryofoptimizationalgorithms, |            |                   | 2023.          | URL  |
| The crossroads | of           | innovation | and   | privacy: | Private   | syn- |                                            |            |                   |                |      |
https://arxiv.org/abs/2302.06675.
| thetic | data for generative |     | AI. | Blog post, | 2024. | URL |     |     |     |     |     |
| ------ | ------------------- | --- | --- | ---------- | ----- | --- | --- | --- | --- | --- | --- |
https://www.microsoft.com/en-us/research/blog/
Chowdhery,A.,Narang,S.,Devlin,J.,Bosma,M.,Mishra,G.,
the-crossroads-of-innovation-and-privacy-private-
Roberts,A.,Barham,P.,Chung,H.W.,Sutton,C.,Gehrmann,
synthetic-data-for-generative-ai.
S.,Schuh,P.,Shi,K.,Tsvyashchenko,S.,Maynez,J.,Rao,A.,
Barnes,P.,Tay,Y.,Shazeer,N.,Prabhakaran,V.,Reif,E.,Du,
Amin,K.,Bie,A.,Kong,W.,Kurakin,A.,Ponomareva,N.,Syed,
N.,Hutchinson,B.,Pope,R.,Bradbury,J.,Austin,J.,Isard,M.,
| U.,Terzis,A.,andVassilvitskii,S. |     |     | Privatepredictionforlarge- |     |     |     |          |                    |               |               |     |
| -------------------------------- | --- | --- | -------------------------- | --- | --- | --- | -------- | ------------------ | ------------- | ------------- | --- |
|                                  |     |     |                            |     |     |     | Gur-Ari, | G., Yin, P., Duke, | T., Levskaya, | A., Ghemawat, | S., |
| scalesynthetictextgeneration.    |     |     | arXi:2407.12108,2024.      |     |     |     |          |                    |               |               |     |
Dev,S.,Michalewski,H.,Garcia,X.,Misra,V.,Robinson,K.,
Fedus,L.,Zhou,D.,Ippolito,D.,Luan,D.,Lim,H.,Zoph,B.,
Anil, R., Ghazi, B., Gupta, V., Kumar, R., and Manurangsi, P. Spiridonov,A.,Sepassi,R.,Dohan,D.,Agrawal,S.,Omernick,
| Large-scaledifferentiallyprivateBERT. |     |     |     | InEMNLP(Findings), |     |     |     |     |     |     |     |
| ------------------------------------- | --- | --- | --- | ------------------ | --- | --- | --- | --- | --- | --- | --- |
M.,Dai,A.M.,Pillai,T.S.,Pellat,M.,Lewkowycz,A.,Moreira,
pp.6481û6491,2022.
E.,Child,R.,Polozov,O.,Lee,K.,Zhou,Z.,Wang,X.,Saeta,
B.,Diaz,M.,Firat,O.,Catasta,M.,Wei,J.,Meier-Hellstern,
Anil,R.,Dai,A.M.,Firat,O.,Johnson,M.,Lepikhin,D.,Passos, K.,Eck,D.,Dean,J.,Petrov,S.,andFiedel,N. PaLM:Scaling
A.,Shakeri,S.,Taropa,E.,Bailey,P.,Chen,Z.,etal. Palm2 languagemodelingwithpathways,2022.
| technicalreport. | arXiv:2305.10403,2023. |     |     |     |     |     |     |     |     |     |     |
| ---------------- | ---------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Chua,L.,Ghazi,B.,Huang,Y.,Kamath,P.,Kumar,R.,Liu,D.,
Manurangsi,P.,Sinha,A.,andZhang,C.Mindtheprivacyunit!
| Balle, B., | Barthe, G., and | Gaboardi, |     | M. Privacy | amplification |     |     |     |     |     |     |
| ---------- | --------------- | --------- | --- | ---------- | ------------- | --- | --- | --- | --- | --- | --- |
user-leveldifferentialprivacyforlanguagemodelfine-tuning.
bysubsampling:Tightanalysesviacouplingsanddivergences,
InCoLM,2024a.
2018.
Chua,L.,Ghazi,B.,Kamath,P.,Kumar,R.,Manurangsi,P.,Sinha,
Balle,B.,Cherubin,G.,andHayes,J.Reconstructingtrainingdata
|                          |     |                          |     |     |     |     | A., andZhang, | C. ScalableDP-SGD:Shufflingvs.Poisson |     |     |     |
| ------------------------ | --- | ------------------------ | --- | --- | --- | --- | ------------- | ------------------------------------- | --- | --- | --- |
| withinformedadversaries. |     | InS&P,pp.1138û1156,2022. |     |     |     |     |               |                                       |     |     |     |
|                          |     |                          |     |     |     |     | subsampling.  | InNeurIPS,2024b.                      |     |     |     |
Bassily,R.,Smith,A.,andThakurta,A. Privateempiricalrisk De,S.,Berrada,L.,Hayes,J.,Smith,S.L.,andBalle,B.Unlocking
minimization:Efficientalgorithmsandtighterrorbounds. In high-accuracydifferentiallyprivateimageclassificationthrough
| FOCS,pp.464û473,2014. |     |     |     |     |     |     | scale. | arXiv:2204.13650,2022. |     |     |     |
| --------------------- | --- | --- | --- | --- | --- | --- | ------ | ---------------------- | --- | --- | --- |
9

ScalingLawsforDifferentiallyPrivateLanguageModels
Devlin, J., Chang, M.-W., Lee, K., and Toutanova, K. BERT: Hong, J., Wang, J. T., Zhang, C., Li, Z., Li, B., and Wang, Z.
Pre-training of deep bidirectional transformers for language DP-OPT:Makelargelanguagemodelyourprivacy-preserving
understanding. InNAACL-HLT,pp.4171û4186,2019. promptengineer. InICLR,2024.
Du,M.,Yue,X.,Chow,S.S.,Wang,T.,Huang,C.,andSun,H.DP- Huber,P.J. Robustestimationofalocationparameter. InBreak-
forward: Fine-tuningandinferenceonlanguagemodelswith throughsinstatistics:Methodologyanddistribution,pp.492û
| differentialprivacyinforwardpass. |     |     | InCCS,pp.2665û2679, |     |     | 518.Springer,1992. |     |     |     |     |     |
| --------------------------------- | --- | --- | ------------------- | --- | --- | ------------------ | --- | --- | --- | --- | --- |
2023.
Ippolito,D.,TramΦr,F.,Nasr,M.,Zhang,C.,Jagielski,M.,Lee,
| Duan,H.,Dziedzic,A.,Papernot,N.,andBoenisch,F. |     |     |     |     | Flocks |     |     |     |     |     |     |
| ---------------------------------------------- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- | --- |
K.,Choquette-Choo,C.A.,andCarlini,N.Preventingverbatim
ofstochasticparrots:Differentiallyprivatepromptlearningfor
memorizationinlanguagemodelsgivesafalsesenseofprivacy.
| largelanguagemodels. | InNeurIPS,2023a. |     |     |     |     |     |     |     |     |     |     |
| -------------------- | ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
arXiv:2210.17546,2022.
Duan,H.,Dziedzic,A.,Yaghini,M.,Papernot,N.,andBoenisch,
|                                          |     |     |     |              |     | Kaissis,G.,Hayes,J.,Ziller,A.,andRueckert,D. |     |     |     | Boundingdata |     |
| ---------------------------------------- | --- | --- | --- | ------------ | --- | -------------------------------------------- | --- | --- | --- | ------------ | --- |
| F. Ontheprivacyriskofin-contextlearning. |     |     |     | InACL,2023b. |     |                                              |     |     |     |              |     |
reconstructionattackswiththehypothesistestinginterpretation
|            |                     |     |         |               |     | ofdifferentialprivacy. | arXiv:2307.03928,2023. |     |     |     |     |
| ---------- | ------------------- | --- | ------- | ------------- | --- | ---------------------- | ---------------------- | --- | --- | --- | --- |
| Dubey, A., | Jauhri, A., Pandey, | A., | Kadian, | A., Al-Dahle, | A., |                        |                        |     |     |     |     |
Letman,A.,Mathur,A.,Schelten,A.,Yang,A.,Fan,A.,etal.
|                        |     |                        |     |     |     | Kaissis, G., | Kolek, S., Balle, | B., Hayes, | J., | and Rueckert, | D.  |
| ---------------------- | --- | ---------------------- | --- | --- | --- | ------------ | ----------------- | ---------- | --- | ------------- | --- |
| TheLlama3herdofmodels. |     | arXiv:2407.21783,2024. |     |     |     |              |                   |            |     |               |     |
Beyondthecalibrationpoint:Mechanismcomparisonindiffer-
Dwork,C.,McSherry,F.,Nissim,K.,andSmith,A. Calibrating entialprivacy. InICML,pp.22840û22860,2024.
| noisetosensitivityinprivatedataanalysis. |     |     |     | InTCC,pp.265û |     |     |     |     |     |     |     |
| ---------------------------------------- | --- | --- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- |
284,2006. Kaplan,J.,McCandlish,S.,Henighan,T.,Brown,T.B.,Chess,
B.,Child,R.,Gray,S.,Radford,A.,Wu,J.,andAmodei,D.
Gadre, S.Y., Smyrnis, G., Shankar, V., Gururangan, S., Worts- Scalinglawsforneurallanguagemodels. arXiv:2001.08361,
| man,M.,Shao,R.,Mercat,J.,Fang,A.,Li,J.,Keh,S.,etal. |     |     |     |     |     | 2020. |     |     |     |     |     |
| --------------------------------------------------- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- |
Languagemodelsscalereliablywithover-trainingandondown-
streamtasks. arXiv:2403.08540,2024. Kingma,D.P.andBa,J.Adam:Amethodforstochasticoptimiza-
|     |     |     |     |     |     | tion. InICLR,2015. |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ------------------ | --- | --- | --- | --- | --- |
Ganguli,D.,Hernandez,D.,Lovitt,L.,Askell,A.,Bai,Y.,Chen,
A.,Conerly,T.,Dassarma,N.,Drain,D.,Elhage,N.,ElShowk, Kurakin,A.andPonomareva,N. Protectinguserswithdifferen-
S., Fort, S., Hatfield-Dodds, Z., Henighan, T., Johnston, S., tiallyprivatesynthetictrainingdata. Blogpost,2024. URL
Jones,A.,Joseph,N.,Kernian,J.,Kravec,S.,Mann,B.,Nanda, https://research.google/blog/protecting-users-with-
N.,Ndousse,K.,Olsson,C.,Amodei,D.,Brown,T.,Kaplan, differentially-private-synthetic-training-data/.
| J.,McCandlish,S.,Olah,C.,Amodei,D.,andClark,J. |     |     |     |     | Pre- |     |     |     |     |     |     |
| ---------------------------------------------- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- |
dictabilityandsurpriseinlargegenerativemodels. InFAccT, Kurakin,A.,Song,S.,Chien,S.,Geambasu,R.,Terzis,A.,and
2022. Thakurta,A.TowardtrainingatImageNetscalewithdifferential
|             |                                          |     |     |     |     | privacy. arXiv:2201.12328,2022.                 |     |     |     |               |         |
| ----------- | ---------------------------------------- | --- | --- | --- | --- | ----------------------------------------------- | --- | --- | --- | ------------- | ------- |
| GeminiTeam. | Gemini: afamilyofhighlycapablemultimodal |     |     |     |     |                                                 |     |     |     |               |         |
| models.     | arXiv:2312.11805,2023.                   |     |     |     |     |                                                 |     |     |     |               |         |
|             |                                          |     |     |     |     | Li,X.,TramΦr,F.,Liang,P.,andHashimoto,T.        |     |     |     | Largelanguage |         |
|             |                                          |     |     |     |     | modelscanbestrongdifferentiallyprivatelearners. |     |     |     |               | InICLR, |
GemmaTeam,Mesnard,T.,Hardin,C.,Dadashi,R.,Bhupatiraju,
2022.
| S., Pathak,   | S., Sifre, L.,          | RiviΦre, | M., Kale, | M. S., Love, | J., |                   |              |           |     |           |          |
| ------------- | ----------------------- | -------- | --------- | ------------ | --- | ----------------- | ------------ | --------- | --- | --------- | -------- |
| et al. Gemma: | Open models             | based    | on gemini | research     | and |                   |              |           |     |           |          |
|               |                         |          |           |              |     | Liu, P.J., Novak, | R., Lee, J., | Wortsman, | M., | Xiao, L., | Everett, |
| technology.   | arXiv:2403.08295,2024a. |          |           |              |     |                   |              |           |     |           |          |
K.,Alemi,A.A.,Kurzeja,M.,Marcenac,P.,Gur,I.,Kornblith,
S.,Xu,K.,Elsayed,G.,Fischer,I.,Pennington,J.,Adlam,B.,
GemmaTeam,Riviere,M.,Pathak,S.,Sessa,P.G.,Hardin,C.,
|     |     |     |     |     |     | andDickstein,J.-S. | NanoDO:Aminimaltransformerdecoder- |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ------------------ | ---------------------------------- | --- | --- | --- | --- |
Bhupatiraju,S.,Hussenot,L.,Mesnard,T.,Shahriari,B.,RamΘ,
|            |                    |     |               |        |      | only language | model implementation |     | in JAX., | 2024. | URL |
| ---------- | ------------------ | --- | ------------- | ------ | ---- | ------------- | -------------------- | --- | -------- | ----- | --- |
| A., et al. | Gemma 2: Improving |     | open language | models | at a |               |                      |     |          |       |     |
http://github.com/google-deepmind/nanodo.
| practicalsize. | arXiv:2408.00118,2024b. |            |            |                |     |                           |                                      |     |     |     |     |
| -------------- | ----------------------- | ---------- | ---------- | -------------- | --- | ------------------------- | ------------------------------------ | --- | --- | --- | --- |
|                |                         |            |            |                |     | Loshchilov,I.andHutter,F. | Decoupledweightdecayregulariza-      |     |     |     |     |
| Ghalebikesabi, | S., Berrada,            | L., Gowal, | S., Ktena, | I., Stanforth, |     |                           |                                      |     |     |     |     |
|                |                         |            |            |                |     | tion,2019.                | URLhttps://arxiv.org/abs/1711.05101. |     |     |     |     |
| R., Hayes,     | J., De, S., Smith,      | S.         | L., Wiles, | O., and Balle, | B.  |                           |                                      |     |     |     |     |
Differentiallyprivatediffusionmodelsgenerateusefulsynthetic
arXiv:2302.13861,2023. Lukas, N., Salem, A., Sim, R., Tople, S., Wutschitz, L., and
images.
|     |     |     |     |     |     | Zanella-BΘguelin, | S. Analyzing | leakage | of  | personally | iden- |
| --- | --- | --- | --- | --- | --- | ----------------- | ------------ | ------- | --- | ---------- | ----- |
Gold,Z.andLatonero,M. Robotswelcome: Ethicalandlegal tifiableinformationinlanguagemodels. InS&P,2023.
| considerationsforwebcrawlingandscraping. |     |     |     | Wash.JLTech. |     |     |     |     |     |     |     |
| ---------------------------------------- | --- | --- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- |
&Arts,2017. McCandlish, S., Kaplan, J., Amodei, D., andTeam, O.D. An
|               |                                             |     |     |     |     | empirical | model of large-batch | training. | arXiv:1812.06162, |     |     |
| ------------- | ------------------------------------------- | --- | --- | --- | --- | --------- | -------------------- | --------- | ----------------- | --- | --- |
| GoogleDPTeam. | GoogleÆsdifferentialprivacylibraries.,2022. |     |     |     |     | 2018.     |                      |           |                   |     |     |
https://github.com/google/differential-privacy.
|     |     |     |     |     |     | Nocedal,J. Updatingquasi-Newtonmatriceswithlimitedstorage. |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ---------------------------------------------------------- | --- | --- | --- | --- | --- |
Hoffmann,J.,Borgeaud,S.,Mensch,A.,Buchatskaya,E.,Cai, MathematicsofComputation,35(151):773û782,1980.
| T., Rutherford, | E., Casas, | D.d.L., | Hendricks, | L.A., | Welbl, |     |     |     |     |     |     |
| --------------- | ---------- | ------- | ---------- | ----- | ------ | --- | --- | --- | --- | --- | --- |
J.,Clark,A.,etal. Trainingcompute-optimallargelanguage Nocedal,J.andWright,S.J. Numericaloptimization. Springer,
| models. | arXiv:2203.15556,2022. |     |     |     |     | 1999. |     |     |     |     |     |
| ------- | ---------------------- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- |
10

ScalingLawsforDifferentiallyPrivateLanguageModels
Ponomareva,N.,Hazimeh,H.,Kurakin,A.,Xu,Z.,Denison,C., Yeom,S.,Giacomelli,I.,Fredrikson,M.,andJha,S. Privacyrisk
McMahan, H. B., Vassilvitskii, S., Chien, S., and Thakurta, inmachinelearning: Analyzingtheconnectiontooverfitting.
A.G. HowtoDP-fyML:Apracticalguidetomachinelearning InCSF,pp.268û282,2018.
| withdifferentialprivacy. | JAIR,2023. |     |     |     |     |     |
| ------------------------ | ---------- | --- | --- | --- | --- | --- |
You,Y.,Li,J.,Reddi,S.,Hseu,J.,Kumar,S.,Bhojanapalli,S.,
Prashanth, U. S., Deng, A., OÆBrien, K., SV, J., Khan, M. A., Song,X.,Demmel,J.,Keutzer,K.,andHsieh,C.-J.Largebatch
Borkar,J.,Choquette-Choo,C.A.,Fuehne,J.R.,Biderman,S., optimization for deep learning: Training bert in 76 minutes,
Ke,T.,etal. Recite,reconstruct,recollect: Memorizationin 2020. URLhttps://arxiv.org/abs/1904.00962.
| LMsasamultifacetedphenomenon. |     | arXiv:2406.17746,2024. |                                            |     |     |            |
| ----------------------------- | --- | ---------------------- | ------------------------------------------ | --- | --- | ---------- |
|                               |     |                        | Yu,D.,Zhang,H.,Chen,W.,Yin,J.,andLiu,T.-Y. |     |     | Largescale |
Rush,J.K.,Charles,Z.,Garrett,Z.,Augenstein,S.,andMitchell, privatelearningvialow-rankreparametrization. InICML,2021.
N.E. DrJAX:Scalableanddifferentiablemapreduceprimitives
inJAX. InWANT@ICML,2024. Yu,D.,Naik,S.,Backurs,A.,Gopi,S.,Inan,H.A.,Kamath,G.,
Kulkarni,J.,Lee,Y.T.,Manoel,A.,Wutschitz,L.,Yekhanin,
Sander,T.,Stock,P.,andSablayrolles,A. TANwithoutaburn: S.,andZhang,H. Differentiallyprivatefine-tuningoflanguage
ScalinglawsofDP-SGD. InICML,pp.29937û29949,2023. models. InICLR,2022.
|     |     |     | Zhang, H., | Morwani, D., Vyas, | N., Wu, J., | Zou, D., Ghai, U., |
| --- | --- | --- | ---------- | ------------------ | ----------- | ------------------ |
Sander,T.,Yu,Y.,Sanjabi,M.,Durmus,A.,Ma,Y.,Chaudhuri,
|                                                          |              |     | Foster,D.,andKakade,S. | Howdoescriticalbatchsizescalein |        |                    |
| -------------------------------------------------------- | ------------ | --- | ---------------------- | ------------------------------- | ------ | ------------------ |
| K.,andGuo,C. Differentiallyprivaterepresentationlearning |              |     |                        |                                 |        |                    |
|                                                          |              |     | pre-training?          | arXiv:2410.21676,2024a.         |        |                    |
| viaimagecaptioning.                                      | InICML,2024. |     |                        |                                 |        |                    |
|                                                          |              |     | Zhang, L.,             | Li, B., Thekumparampil,         | K. K., | Oh, S., and He, N. |
Shallue,C.J.,Lee,J.,Antognini,J.,Sohl-Dickstein,J.,Frostig,R.,
DPZero:Privatefine-tuningoflanguagemodelswithoutback-
| andDahl,G.E. Measuringtheeffectsofdataparallelismon |            |     |              |               |     |     |
| --------------------------------------------------- | ---------- | --- | ------------ | ------------- | --- | --- |
|                                                     | JMLR,2019. |     | propagation. | InICML,2024b. |     |     |
neuralnetworktraining.
|     |     |     | Zhang,X.,Bu,Z.,Wu,Z.S.,andHong,M. |     |     | Differentiallypri- |
| --- | --- | --- | --------------------------------- | --- | --- | ------------------ |
Stiennon,N.,Ouyang,L.,Wu,J.,Ziegler,D.M.,Lowe,R.,Voss,
vateSGDwithoutclippingbias:Anerror-feedbackapproach.
| C.,Radford,A.,Amodei,D.,andChristiano,P.F. |     | Learningto |     |     |     |     |
| ------------------------------------------ | --- | ---------- | --- | --- | --- | --- |
arXiv:2311.14632,2023.
| summarizewithhumanfeedback. |     | InNeurIPS,2020. |     |     |     |     |
| --------------------------- | --- | --------------- | --- | --- | --- | --- |
Zhu,Y.,Kiros,R.,Zemel,R.S.,Salakhutdinov,R.,Urtasun,R.,
| Subramani,P.,Vadivelu,N.,andKamath,G. |     | Enablingfastdiffer- |     |     |     |     |
| ------------------------------------- | --- | ------------------- | --- | --- | --- | --- |
Torralba,A.,andFidler,S.Aligningbooksandmovies:Towards
entiallyprivateSGDviajust-in-timecompilationandvectoriza-
story-likevisualexplanationsbywatchingmoviesandreading
tion. InNeurIPS,pp.26409û26421,2021.
|     |     |     | books. | InICCV,pp.19û27,2015. |     |     |
| --- | --- | --- | ------ | --------------------- | --- | --- |
Tang,X.,Shin,R.,Inan,H.A.,Manoel,A.,Mireshghallah,F.,Lin,
|                                  |     |                       | Ziller, A.,                         | Mueller, T. T., Stieger, | S., Feiner,        | L. F., Brandt, J., |
| -------------------------------- | --- | --------------------- | ----------------------------------- | ------------------------ | ------------------ | ------------------ |
| Z.,Gopi,S.,Kulkarni,J.,andSim,R. |     | Privacy-preservingin- |                                     |                          |                    |                    |
|                                  |     |                       | Braren,R.,Rueckert,D.,andKaissis,G. |                          | Reconcilingprivacy |                    |
contextlearningwithdifferentiallyprivatefew-shotgeneration.
|                                            |     |                   | andaccuracyinaiformedicalimaging. |     | NatureMachineIntelli- |     |
| ------------------------------------------ | --- | ----------------- | --------------------------------- | --- | --------------------- | --- |
| ICLR,2024.                                 |     |                   | gence,6(7):764û774,2024.          |     |                       |     |
| Thaker,P.,Setlur,A.,Wu,Z.S.,andSmith,V.    |     | Leveragingpublic  |                                   |     |                       |     |
| representationsforprivatetransferlearning. |     | arXiv:2312.15551, |                                   |     |                       |     |
2023.
Tobaben,M.,Shysheya,A.,Bronskill,J.,Paverd,A.,Tople,S.,
| Zanella-Beguelin,S.,Turner,R.E.,andHonkela,A. |     |     | Onthe |     |     |     |
| --------------------------------------------- | --- | --- | ----- | --- | --- | --- |
efficacyofdifferentiallyprivatefew-shotimageclassification.
TMLR,2023.
| TramΦr,F.,Kamath,G.,andCarlini,N. |     | Considerationsfordif- |     |     |     |     |
| --------------------------------- | --- | --------------------- | --- | --- | --- | --- |
ferentiallyprivatelearningwithlarge-scalepublicpretraining.
arXiv:2212.06470,2022.
Wang,B.,Zhang,Y.,Cao,Y.,Li,B.,McMahan,H.,Oh,S.,Xu,Z.,
| andZaheer,M. Canpubliclargelanguagemodelshelpprivate |           |                      |     |     |     |     |
| ---------------------------------------------------- | --------- | -------------------- | --- | --- | --- | --- |
| cross-device federated                               | learning? | In NAACL (Findings), | pp. |     |     |     |
934û949,2024.
Wu,F.,Inan,H.A.,Backurs,A.,Chandrasekaran,V.,Kulkarni,J.,
andSim,R. Privatelyaligninglanguagemodelswithreinforce-
| mentlearning. ICLR,2024a.                 |     |                    |     |     |     |     |
| ----------------------------------------- | --- | ------------------ | --- | --- | --- | --- |
| Wu,T.,Panda,A.,Wang,J.T.,andMittal,P.     |     | Privacy-preserving |     |     |     |     |
| in-contextlearningforlargelanguagemodels. |     | InICLR,2024b.      |     |     |     |     |
Xu,Y.,Lee,H.,Chen,D.,Hechtman,B.,Huang,Y.,Joshi,R.,
| Krikun,M.,Lepikhin,D.,Ly,A.,Maggioni,M.,etal. |     | GSPMD: |     |     |     |     |
| --------------------------------------------- | --- | ------ | --- | --- | --- | --- |
generalandscalableparallelizationforMLcomputationgraphs.
arXiv:2105.04663,2021.
11

ScalingLawsforDifferentiallyPrivateLanguageModels
A.LimitationsandOpenQuestions
WhileourmethodologyrevealedanumberofinterestingfindingsaboutthebehaviorofscalinglawsunderDP,thereare
somelimitationsofourapproachandquestionsthatremainunansweredthatweenumeratebelow.
FixedPhysicalBatchSize. OurmethodologyreliescruciallyontheassumptionthattheGaussiannoiseintroducedto
preserveprivacyfaroutweighstherandomnessintroducedfromminibatchsampling,andthusitwouldbesufficientvarythe
noise-batchratiowhilekeepingthephysicalbatchsizefixedtoalargeconstantvalueof1024. AppendixC.3revealsthatthis
assumptionmaynotbefullytrue,andthatthephysicalbatchsizehasamorenuancedeffectthatwecannotfullyexplain.
Robustnesstoothertrainingsetups. OurmethodologyfocusesonasingleclassofBERTmodels,withafixeddatasetand
DPmechanism,whichallowedustododeeperexperimentationonotherrelevantvariables. Ourgeneralmethodologyholds
fordifferentmodels,datasets,andmechanisms,buttheexactquantitativefindingsmaydifferunderdifferenttrainingsetups.
AsthefieldcontinuestomakeadvancementsontrainingtransformerswithDP,itwouldbeinterestingandinformativeto
rerunourexperimentswithbetterbasemechanisms.
Pretrainingvs. Finetuning. Asanimportantfirststep,wefocusedonthepretrainingregimeinthiswork,wherewe
start with a completely random model which we train from scratch. Finetuning a pretrained model with DP is often a
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
etal.,2024). Ifamodelisgoingtobedeployed,itmaymakesensetoover-trainasmallermodel(whichischeapertoserve)
thantotrainalargermodelforacompute-optimalFLOPsbudget. Whilewedonotstudyover-traininginourwork,we
notethatsuchastudyisparticularlyfruitfulinthecaseofDPtraining;theprivacycostsalreadyoftenfavorsmallermodels
(whencomparedtonon-privatescalinglaws). InvestigatingthisconfluencewouldlikelyyieldvaluableinsightsintoDP
scalinglaws.
LargerModelSizes. Theaccuracyofanygivenscalinglawispredicatedtosomedegreeontherangeofmodelsizes
trainedon. Forexample,Hoffmannetal.(2022)trainmodelofupto16billionparameters. Duetothenecessityofusing
verylargebatchsizes(forprivacyreasons)trainingmodelsofsuchscalerequiresasignificantamountofcompute. Weleave
thetaskoftrainingonmodeloflargerscaletofuturework,alongwithanalysisofhowmuchthisaffectsthederivedscaling
law.
Efficientimplementationsofper-examplegradientclipping Whenconsideringtouseasignificantcomputebudgetto
trainalargelanguagemodelwithDP,itisimportantthatthatmodeltrainingcodeiscarefullyoptimizedtominimizethe
overheadsofDPtraining. Usingefficientvectorizedper-exampleclippingimplementationsinJAXhavebeenshownto
workperformwellwithareasonableoverheadcomparedtonon-privatetraining(Subramanietal.,2021),althoughthis
focusedonsingle-machinetrainingscenarios,andmorecarefulstudyisneededinthisareawhendoingmulti-machine
training,especiallywhenmovingbeyondpuredata-parallelismwhichwefocusedoninthispaper.
Thechoiceofoptimizer Ouranalysisreliesoncurrentoptimizationtechniqueswhichmaynotbeoptimalforprivacy-
preservingtraining. Severalpotentialoptimizerimprovementscouldaffectourfindings. Auniformlybetteroptimizerwould
likelypreservetheobservedscalingrelationshipswhiletheactualoptimaloperatingpointsmightshift. Inpreviousscaling
lawstudieswedoseethebetteroptimizercansomehowsmoothoutthediscontinuitiesinscalingbehavior(Chenetal.,
2023;Loshchilov&Hutter,2019)orevenenablenewscalingregimessometimes(e.g.,LAMB(Youetal.,2020)forlarge
12

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
B.1.NotesonAlgorithm1(GeneralizedDP-SGD)
MinibatchSelectionWewerevagueinourdescriptionoftheminibatchselectionstep. InmostdescriptionsofDP-SGD,
theminibatchisformedbyPoissonsubsamplingwithafixedprobability. Samplingwithorwithoutreplacement,aswell
asdeterministicbatchingarealsopossible(Balleetal.,2018). Inourpaper,wecalibratednoiseunderboththePoisson
sampling assumption and the deterministic batching strategy, picking the lower noise multiplier. When doing Poisson
sampling,weusethesamplingprobabilityB/N andnoisemultiplierB╖?».
KnownQuantitiesIfdoingPoissonsampling,wetypicallyareoperatingundertheadd/removeadjacencydefinition. Under
thisdefinition,N isconsideredasensitivequantitywhichwedonothaveaccesstodirectly,hencewecannottechnically
definethesamplingprobabilityasB/N withoutviolatingDP.WealsorelyonN lateron,discussingitsimportanceasitis
interpretedasthedatabudget. Ifnecessary,onecanapproximateN quiteaccuratelywithDPsinceitisasimplecount.
Alternatively,onecansimplyusetheôzero-outöadjacencynotion(Chuaetal.,2024b),whereN isknownbutPoisson
samplingstillenjoysthesameprivacyanalysis.
ClippingFunctionWeomitaclippingnormparameterinthedefinitionofôclipö. Thiscanbeanyfunctionthatmapsan
arbitraryreal-valuedvectortoonewith? normatmostone. OnestandardchoiceistoclipthenormtoC,andthendivide
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
AsdefinedinSection2.1,weapproximatethecomputecostC as6╖M╖B╖S╖T basedonthenon-privatescalinglaws(Kaplan
et al., 2020; Hoffmann et al., 2022) except that B represents the number of examples (not tokens) in a batch, as this
determinestheprivacybudget. Thiscostmodelisusefulbecausewecandirectlycomparetothenon-privatescalinglaws.
Further,thiscostmodelisalsoaccuratebecausetheextraoverheadofDP-SGDinAlgorithm1comparedtoAdamcanbe
13

ScalingLawsforDifferentiallyPrivateLanguageModels
directlyamortized: compiler-basedsystemslikeGSPMD(Xuetal.,2021)andparallelmachinelearninglibraries(Rush
etal.,2024)letusparallelizetheper-examplegradientcomputationswithoutalinear(inB)increaseinmemoryusage. The
totalclippingcostsareonlyasmalllinearcost(comprisingofonlyelement-wiseoperationsandnomatrixmultiplications)
inM,T,andB(andareindependentofsequencelengthS);thetotalnoisingcostsareindependentofBandislinearin
onlyM andT. Thus,theoverallcomputeinDP-SGDisdominatedbythenon-privateapproximationabove.
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
InFigure6,weplotthecrossentropylossfordifferentprivacybudgets,databudgets,andcomputebudgetsundervarying
numbersofiterations,modelsizes,andbatchsizes. Muchcanbelearnedfromtheseplots,including:
ò TheoptimalnumberofiterationstypicallyfallsaroundT ?10K,andtheoptimalbatchsizeoftenfallsintherange
B ?10?100K,althoughneitheroftheseareuniversallytrueandasexpecteditdependsonthevaluesoftheprivacy,
data,andcomputebudgets. Batchsizeseemstobethemostimportantparameter,asindicatedbythesteepslopeof
thoselines.
C.3.PhysicalBatchSizeAblation
Centraltoourmethodologyisanassumptionthatforafixednoise-batchratio,thetrainingcurvesshouldbesimilarfor
differentphysicalbatchsizes. Inthissection,weconductablationstotestthishypothesis,andquantifytheimpactofvarying
physicalbatchsizeunderafixednoise-batchratio. Weconsider3valuesfornoise-batchratio: 0.520,0.515,and0.510,and
14

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
Figure6.Crossentropyofbestmodelstrainedineachsetting. Fromtoptobottom,wevarythePrivacyBudget,DataBudget,and
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
Figure7.CrossEntropyLossofBertTinyaveragedover3trialsfordifferentphysicalbatchsizesandnoise-batchratiovalues.
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
15

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
andreportthebestcrossentropyacrossalllearningratesonaper-iterationbasis. Evenwithlearningratetuning,the
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
generalizebetter,orwhethertheyalsodobetteronthetrainingloss,wemeasuredthelossofthefinaltrainedmodelon
1millionexamplesfromthetrainingset. Wefocusonthenoise-batchratioof0.515inthistest. Thetablebelowshows
thatsmallerphysicalbatchsizesalsohavebetterperformanceonthealready-seentrainingexamples,rulingoutthis
explanation(seeTable3).
TrainingSet
BatchSize CrossEntropy Accuracy
128 3.586 43.59%
512 3.971 37.27%
2048 4.01 37.55%
8192 4.057 36.73%
Table3. Lossovertheentiretrainingsetisalsobetterforlowerphysicalbatchsizes.
3. ModelSize. ThemainexperimentusesBertTiny,whichisarelativesmallmodel. Itisnaturaltoaskwhetherthesame
behaviorwouldbeobservedforalargermodellikeBertBase. Thefigurebelowshowsthatthesamephenomenon
happensforBertLarge, butonlyforthelargestnoise-batchratio. Theothertwovaluesofnoise-batchratiodonot
16

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
Figure9.CrossEntropyLossofBertLargeaveragedover3trialsfordifferentphysicalbatchsizesandnoise-batchratiovalues.
4. TrainingPipelines. Itisnaturaltoquestionwhetherthisbehaviorisexplainedbysomebuginthetrainingpipeline.
Wecarefullyreviewedtheimplementationanddidnotfindanybugsthatcouldexplainthisbehavior,andalsodid
additionalexperimentsonatotallyseparatetrainingpipelinebasedonNanoDO(Liuetal.,2024),whereweobserved
thesamequalitativebehaviorwhentraininga30millionparameterdecoder-onlytransformermodelwithDP-Adamfor
32Kiterations. Thefiguresbelowshowthesmoothedcrossentropyaveragedover3randomtrials.
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
17

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
Figure11. Compute-optimalcrossentropy,modelsize,andnumberofiterationswhenrunningDP-Adamwith?=0.
C.7.OptimalLearningRates
Wenowlookatthetrainingcurvesfordifferentlearningratesanddifferentnoise-batchratiovalues. Theseresultsgenerally
matchexpectationsanddemonstratethatthelearningrateswechosewereselectedfromthecorrectregime.
18

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
crossentropyover1024╖100examples,itisnaturallyanoisyestimateoftheôtrueöcrossentropy. Oursmoothingstrategy
ensurestheappropriatemonotonicitypropertiesareenforced,whilematchingtheoveralltrendascloselyaspossible.
D.CaveatsonPrivacyCalibration
Throughoutthework,wehaveassumedthathyperparameterchoicesformodeltrainingaremadeagainstafixedprivacy
budget. Inparticular,weassumethecommonscenarioinwhichthemodeltrainerfixesan(?,?)-budgetandthenutilisesa
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
19

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
minimumvalueofthathyper-parameterthatachieveswithin1%oftheoptimalcrossentropyacrossallconstant-computetraining
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
20

ScalingLawsforDifferentiallyPrivateLanguageModels
|     |     |     |     |                                                |     |     |     |     |                  |     |     |     |     |
| ------ | --- | --- | --- | ---------------------------------------------- | --- | --- | ------ | --- | ---------------- | --- | --- | --- | --- |
|        |     |     |     |  6 E [  ( E X E                               |     |     |        |     |  6 E [  ( E X E |     |     |     |     |
|        |     |     |     |  7 Q S S X L I H    ) \ X V E T S P E X I H |     |     |        |     |  7 Q S S X L I H |     |     |     |     |
   
 
|  ] T S V X R )  W W S V ' |     |     |     |     |     |     |  ] T S V X R )  W W S V ' |     |     |     |     |     |     |
| -------------------------- | --- | --- | --- | --- | --- | --- | -------------------------- | --- | --- | --- | --- | --- | --- |
   
   
   
 
   
   
 
|     |     |     |     |                   |     |     |     |     |     |                                 |     |     |     |
| --- | ------ | --- | ------ | -------------------- | ------ | --- | ------ | ------ | --- | ---------------------------------- | --- | ------ | --- |
|     |        |     |        |  - X I V E X M S R W |        |     |        |        |     |  2 S M W I  & E X G L  6 E X M S |     |        |     |
(a)noise-batchratio=0.515
|                    |     |     |     |           |                                                       |     |     |     |           | (b)T =32000   |     |     |                 |
| ------------------ | --- | --- | --- | --------- | ----------------------------------------------------- | --- | --- | --- | --------- | ------------- | --- | --- | --------------- |
|                    |     |     |     | Figure14. | Demonstrationofoursemi-parametricsmoothingonBertTiny. |     |     |     |           |               |     |     |                 |
|                    |     |     |     | 0.18      |                                                       |     |     |     | 0.26      |               |     |     | 0.425           |
| 5.75               |     |     |     |           | 6.0                                                   |     |     |     |           |               |     |     |                 |
|                    |     |     |     |           |                                                       |     |     |     | 0.24      | 5.5           |     |     | 0.400           |
| 5.50               |     |     |     | 0.16      |                                                       |     |     |     |           |               |     |     |                 |
|                    |     |     |     |           | 5.5                                                   |     |     |     | 0.22      | 5.0           |     |     | 0.375           |
| yportnE ssorC 5.25 |     |     |     |           | yportnE ssorC                                         |     |     |     | egatnavdA | yportnE ssorC |     |     |                 |
|                    |     |     |     | 0.14      | egatnavdA                                             |     |     |     | 0.20      |               |     |     | 0.350 egatnavdA |
| 5.00               |     |     |     |           | 5.0                                                   |     |     |     |           | 4.5           |     |     |                 |
0.325
| 4.75 |     |     |     | 0.12 | 4.5 |     |     |     | 0.18 | 4.0 |     |     |     |
| ---- | --- | --- | --- | ---- | --- | --- | --- | --- | ---- | --- | --- | --- | --- |
0.300
| 4.50 |     |            |     |      |     |     |            |     | 0.16 | 3.5 |     |            |       |
| ---- | --- | ---------- | --- | ---- | --- | --- | ---------- | --- | ---- | --- | --- | ---------- | ----- |
|      |     |            |     | 0.10 | 4.0 |     |            |     |      |     |     |            | 0.275 |
| 4.25 |     |            |     |      |     |     |            |     | 0.14 |     |     |            |       |
| 4.00 |     |            |     |      |     |     |            |     |      | 3.0 |     |            | 0.250 |
|      |     |            |     | 0.08 | 3.5 |     |            |     | 0.12 |     |     |            |       |
|      | 103 |            | 104 |      |     | 103 | 104        |     | 105  |     | 104 | 105        |       |
|      |     | Batch Size |     |      |     |     | Batch Size |     |      |     |     | Batch Size |       |
|      |     | (a)        |     |      |     |     | (b)        |     |      |     |     | (c)        |       |
Figure15.Varyingthebatchsize(horizontalaxis,log-scale)hasadrasticeffectonexcessvulnerability(measuredasMIAadvantage,
red,rightverticalaxis)formodelswithafixedcomputebudgetandsizeandafixedprivacybudgetof(?,?)=(8,10?8).(a):Compute
budget:6╖1017,modelsize:4000000.(b)Computebudget:6.3╖1019,modelsize:200000000.(c)Computebudget:2.5╖1020,model
size:200000000.Thescaling-law-predictedcross-entropyisplottedontheleftverticalaxisinblue.
E.ParametricScalingLaws
Previousworkon(non-private)LLMscalinglawsuseafullyparametricformtopredictthecrossentropylossbasedon
severalkeyfactors. Forexample,theôChinchillaöscalinglaw(Hoffmannetal.,2022)canbeparameterizedasfollows:
|     |     |     |     |     |        |     |        | A   | B   |     |     |     |     |
| --- | --- | --- | --- | --- | ------ | --- | ------ | --- | --- | --- | --- | --- | --- |
|     |     |     |     |     | Lê(n   |     | )?E+   |     |     |     |     |     |     |
|     |     |     |     |     |        | ,n  |        |     | +   |     |     |     | (2) |
|     |     |     |     |     | params |     | tokens | n?  | n?  |     |     |     |     |
params
tokens
In this section, we explore a similar methodology to fit a fully parametric form of scaling law in the setting of private
training. Followingthenotationofthispaper,wedefineaparametricformbasedonthefollowingkeyfactors: themodel
sizeM,thenumberofexamplesN andthenoise-batchratio?». NoteournotationsareslightlydifferentfromHoffmann
etal.(2022),andweusenumberofexamplesinsteadofnumberoftokensasitisamorerelevantquantityinprivatetraining.
Weconsiderseveralvariationsofparametricforms. ThefirstoneisanaiveextensionoftheChinchillascalinglaw,by
addinganadditionalterminvolvingthenoise-batchratio:
|     |     |     |     |     |                |     |     | A   | B     |     |     |     |     |
| --- | --- | --- | --- | --- | -------------- | --- | --- | --- | ----- | --- | --- | --- | --- |
|     |     |     |     |     | Lê (M,N,?»)?E+ |     |     |     | +C?»? |     |     |     |     |
|     |     |     |     |     | 1              |     |     | +   |       |     |     |     | (3) |
|     |     |     |     |     |                |     |     | M?  | N?    |     |     |     |     |
Wedidnotput?»? inthedenominatorbecausethelossincreaseswiththenoise-batchratio. FollowingHoffmannetal.
(2022),weestimatethecoefficients(E,A,B,C,?,?,?)byminimizingtheHuberloss(Huber,1992)betweenthepredicted
andtheobservedlossusingtheL-BFGSalgorithm(Nocedal,1980),andwetrymultipledifferentinitializationsandchoose
thebestfit. Werestrictthecurvefittingdatatoonlythesubsetsofdatapointswithmorethan100,000trainingiterations,
noise-batchratiolargerthan5╫10?7,andignorepointswithveryhighcrossentropyloss(>8).
Figure16visualizetheoptimalfit. Weobservethatthepredictionisgenerallyaccurateforlowlossvalueranges. However,
thepredictionstartstodivergeathighlossvalueranges,correspondingtorunswithhighnoise-batchratio. Thisispartlydue
21

ScalingLawsforDifferentiallyPrivateLanguageModels
10
19
6
8
)oitaR hctaB esioN(gol
| ssoL detciderP |     |     | 18 )eziS ledoM(gol |     |     |     |     |
| -------------- | --- | --- | ------------------ | --- | --- | --- | --- |
| 6              |     |     |                    |     | 8   |     |     |
17
4
10
16
| 2   |     |     |     |     | 12  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
15
0
|     | 0 2           | 4 6 | 0 2           | 4 6 |     |     |     |
| --- | ------------- | --- | ------------- | --- | --- | --- | --- |
|     | Observed Loss |     | Observed Loss |     |     |     |     |
Figure16.ParametricprivatescalinglawofLê
|     | 1 fromEquation(3).Optimalfitwith?=0.71,? |     |     |     | =12.87,? =0.19.Thetwopannels |     |     |
| --- | ---------------------------------------- | --- | --- | --- | ---------------------------- | --- | --- |
showthesameplotofobservedcrossentropylossagainstthepredictedlossfromthescalinglaw,exceptthedatapointsarecolored
differerently,accordingtothemodelsizeandnoise-batchratio,respectively.
| 6╫100 |     |     | 19 7 |     | 19  |     |     |
| ----- | --- | --- | ---- | --- | --- | --- | --- |
6
| ssoL yportnE ssorC 4╫100 |     |     | 18 )eziS ledoM(gol ssoL yportnE ssorC |     | 18 )eziS ledoM(gol |     |     |
| ------------------------ | --- | --- | ------------------------------------- | --- | ------------------ | --- | --- |
5
| 3╫100 |     |     | 17  |     | 17  |     |     |
| ----- | --- | --- | --- | --- | --- | --- | --- |
4
| 2╫100 |     |     | 16 3 |     | 16  |     |     |
| ----- | --- | --- | ---- | --- | --- | --- | --- |
2
|     |     |     | 15  |     | 15  |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
1
|     | 106 105           | 104 103 102 | 0.0 0.2                       | 0.4 0.6 0.8 |     |     |     |
| --- | ----------------- | ----------- | ----------------------------- | ----------- | --- | --- | --- |
|     | Noise Batch Ratio |             | Transformed Noise Batch Ratio |             |     |     |     |
Figure17.Relationbetweenthenoise-batchratioandthecrossentropyloss. (left)Thedataplottedinlog-logscale. (right)Thedata
plottedinlinearscale,wherethenoise-batchratio?»istransformedaccordingtoasimpleruleinEquation(4).
tothefactthatthenoise-batchratiodoesnotimpactthelossinalog-linearfashion,asshownontheleftpanelofFigure17.
Therefore,theparametricformofEquation(3)cannotcapturetherelationaccurately. Instead,weobserveS-shapedcurves
inthelog-logplot. Toaccountforthis,weapplyasimpletransformtothenoise-batchratio?»:
|     |     |          | (cid:18)  | (cid:19) |     |     |     |
| --- | --- | -------- | --------- | -------- | --- | --- | --- |
|     |     | ?sigmoid | log(?»)+8 |          |     |     |     |
|     |     | ?»?      |           |          |     |     | (4) |
1.6
TherightpanelofFigure17showsanapproximatelylinearrelationafterthistransformation. Furthermore,weobservethat
therelationbetweenthenoise-batchratioandthelosschangeswiththemodelsizes.
Afterincorporatingthoseobservations,weconsideranalternativevariantofprivatescalinglawparameterization:
C?»?
|     |                |     | A B   | ?   |     |     |     |
| --- | -------------- | --- | ----- | --- | --- | --- | --- |
|     | Lê (M,N,?»)?E+ |     | +     | +   |     |     | (5) |
|     | 2              |     | M? N? | M?2 |     |     |     |
TheoptimalfitaccordingtothisparameterizationisshowninFigure18. Weobservethatthepredictedlossmatcheswith
theobservedlossbetterthanthepreviousparameterizationinFigure16.
| 8   |     |     | 19  |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
6
)oitaR hctaB esioN(gol
| ssoL detciderP 6 |     |     | 18 )eziS ledoM(gol |     |     |     |     |
| ---------------- | --- | --- | ------------------ | --- | --- | --- | --- |
8
| 4   |     |     | 17  |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
10
| 2   |     |     | 16  |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
12
15
0
| 0   | 2             | 4 6 | 0 2           | 4 6 |     |     |     |
| --- | ------------- | --- | ------------- | --- | --- | --- | --- |
|     | Observed Loss |     | Observed Loss |     |     |     |     |
Figure18.ParametricprivatescalinglawofLê
|     | 2 fromEquation(5).Optimalfitwith?=0.47,? |     |     |     | =0.12,? =0.95,? | 2 =?0.07.The |     |
| --- | ---------------------------------------- | --- | --- | --- | --------------- | ------------ | --- |
twopannelsshowthesameplotofobservedcrossentropylossagainstthepredictedlossfromthescalinglaw,exceptthedatapointsare
coloreddiffererently,accordingtothemodelsizeandnoise-batchratio,respectively.
22

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
Figure19. OptimalmodelsizesunderaccordingtotheparametricprivatescalinglawinEquation(5).
IntheChinchillaparameterizationofscalinglawfornon-privateLLMs,theoptimalmodelsizeunderacertaincompute
budget(approximatelyrepresentedby6n n )canbedirectlysolvedandtakesapower-lawform(Hoffmannetal.,
params tokens
2022,Equation(4)). Inourcase,theparameterizationismorecomplicated,foragivencomputebudgetandnoise-batch
ratio,weusescipy.optimize.minimize_scalartofindtheoptimalmodelsizethatminimizesLê . Theresultsareplotted
2
inFigure19. Weobservethattheslopislowerforcurveswithlargernoise-batchratio,indicatingthechallengestoscale
modelsizesunderheavyDPnoises. Asthenoisedecreases,thecurvesshiftupandtheslopesincrease,approachingtowards
thenon-privateChinchillascalinglawshownindashedline.
Whileafullyparametricscalinglawcanbeeasiertointerpretandunderstand,asnotedabove,thereisnotasimplelog-linear
relationbetweenthelossandthenoise-batchratio. Oursigmoidbasedtransformation(andthecouplingwiththemodelsize)
improvedthetightnessofthefitting. Butthetransformationisnotdesignedinaveryprincipledway. Asaresult,weopt
tousethesemi-parametricfittinginSection3inthemainanalysisofourresults. Wealsoleavetheexplorationofother
alternativeparametricfittingsuchasfittinga?»-dependingdeltatermontopofanon-privatescalinglawforfuturework.
23
