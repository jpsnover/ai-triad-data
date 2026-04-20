<!--
  AI Triad Research Project — Document Snapshot
  Title      : The Alignment Tax: Response Homogenization in Aligned LLMs and Its Implications for Uncertainty Estimation
  Source     : 
  Type       : pdf
  Captured   : 2026-04-19
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# The Alignment Tax: Response Homogenization in Aligned LLMs and Its Implications for Uncertainty Estimation

> **Snapshot captured:** 2026-04-19
> **Source:** 
> **Type:** pdf

---
The Alignment Tax: Response Homogenization in
Aligned LLMs
and Its Implications for Uncertainty Estimation
Mingyi Liu
Independent Researcher
GitHub: @DigitLion
March 25, 2026
Abstract
RLHF-aligned language models exhibit response homogenization: on TruthfulQA (n=790), 40%
of questions produce a single semantic cluster across 10 i.i.d. samples under Jaccard bigram clustering
(79% under embedding cosine clustering; robust across sample sizes N=3û10, temperatures T=0.3û1.5,
and generation lengths 40û200 tokens; 33.5% SCR persists at 200 tokens on 200 questions vs. 0% for the
base model). On affected questions, sampling-based uncertainty methods have zero discriminative power
(AUROC=0.500), while free token entropy retains signal (0.603). This alignment tax is task-dependent:
on GSM8K (n=500), token entropy achieves 0.724 (CohenÆs d=0.81).
A base-vs-instruct ablation on Qwen3-14B confirms the causal role of alignment: the base model shows
1.0% single-cluster rate vs. 28.5% for the instruct model (Wilcoxon p<10?6). A three-way training stage
ablation (Base 0.0% ? SFT 1.5% ? DPO 4.0% SCR, all p<0.003) localizes the cause to DPO, not SFT.
Cross-familyreplicationonfourmodelfamilies(Qwen3-14B:28.5%,LLaMA-3.2-3B:5.5%,Mistral-7B:1.0%
SCR)revealsalignmenttaxseverityvariesbyfamilyandscale. Cross-chainreplicationonTulu-3(Llama-3.1-
8B?SFT?DPO+RLVR) shows minimal alignment tax (0.5% SCR vs. ZephyrÆs 4.0%), confirming severity
is recipe-dependent. Stage-wise token entropy measurement (Base 1.175?SFT 1.055?DPO 0.776 nats,
p=1.17╫10?40) reveals the mechanistic decoupling: DPO retains 66% of token-level entropy while collaps-
ing response diversity, explaining why B1 retains signal where sampling-based methods fail. We validate
this finding across twenty-five experiments, five benchmarks, four model families, and three model scales
(3Bû14B), with proxy (Jaccard), SINdex-style embedding (agglomerative cosine clustering), cross-encoder
NLI-SE head-to-head (?AUROC=+0.014 vs. Jaccard, CIs overlap), and canonical NLI-based baselines at
three DeBERTa scales (large 435M, base 184M, xsmall 70Mùall ?0.51 AUROC). Cross-embedder valida-
tion with two independent embedding families (Qwen3-Embedding 78% SCR vs. Nomic-embed-text 92%
SCRat?=0.85)rulesoutcouplingbias. Cross-datasetvalidationonWebQuestions(58.0%SCRat?=0.85)
confirms the alignment tax generalizes beyond TruthfulQA. LLM-judge labels are validated against Truth-
fulQAgoldanswertemplates(?=0.487). Thecentralfindingùresponsehomogenizationùisimplementation-
independent and label-free. Motivated by this diagnosis, we explore a cheapest-first cascade (UCBD) over
orthogonal uncertainty signals. Selective prediction raises GSM8K accuracy from 84.4% to 93.2% at 50%
coverage; weakly dependent boundaries (|r|?0.12) enable 57% cost savings.
1 Introduction
LLM-powered AI Agents are remarkably capable, yet one question has received surprisingly little systematic
attention: can an Agent recognize that it doesnÆt know something?
Considermathematicalreasoning: onGSM8K(n=500),a14BmodelÆstokenentropyachievesAUROC=0.724
fordetectingerrors(CohenÆsd=0.81),enablingselectivepredictionthatraisesaccuracyfrom84.4%to93.2%at
50% coverage. Yet the same entropy signal on factual QA (TruthfulQA, overall) barely exceeds chance (0.52).
This 10╫ gap in effect size (CohenÆs d: 0.81 vs. 0.07) reveals that uncertainty is not a monolithic quantityùit
has structure that demands a multi-boundary approach.
Weobserveasurprisingempiricalregularity: onRLHF-alignedmodels,response diversity collapses un-
der sampling. On TruthfulQA, 40.0% of questions produce a single semantic cluster across 10 i.i.d. samples
(T=1.0)ùthe model generates the same answer (correct or incorrect) repeatedly. This alignment tax renders
sampling-based methods structurally unreliable on affected questions (AUROC=0.500). Free token entropy
retains signal (0.603) because it measures per-token computational uncertainty, which RLHF cannot fully sup-
press. Abase-vs-instruct ablation(Exp.13)isolatesthecausalmechanism: Qwen3-14B-Baseproduces1.0%
single-cluster rate, while the aligned version produces 28.5% (p<10?6)ùalignment reduces diversity by 2.6╫.
1
6202
raM
72
]GL.sc[
2v42142.3062:viXra

A training stage ablation (Exp. 16) further localizes the cause: SFT preserves base-level diversity (1.5%
SCR)whileDPOdrivescollapse(4.0%). Stage-wise token entropy (Exp.24)revealsthemechanisticdecou-
pling: DPOretains66%ofper-tokenentropy(1.175?0.776nats,p<10?40)whilecollapsingresponsediversity.
Cross-familyreplicationonfourfamilies(Qwen3: 28.5%,LLaMA-3: 5.5%,Zephyr-DPO:4.0%,Tulu-3-DPO:
0.5%, Mistral-7B: 1.0% SCR) confirms generality while revealing family- and recipe-dependent severity. NLI-
based SE comparison with three DeBERTa models (200q) yields AUROC=0.511 (large, 435M), 0.512 (base,
184M), and 0.501 (xsmall, 70M)ùall near chanceùand 6.2╫ NLI model scaling yields zero improvement. The
responsehomogenizationisclustering-robust: single-clustercollapseoccursundereverymethodtested(Jaccard
40%, embedding cosine 79%, NLI-based; see Exp. 12 for sensitivity analysis). All headline SCR numbers use
Jaccard(themostconservativemeasure); embeddingclusteringservesassensitivityanalysisconfirmingthetax
is, ifanything, understated bytheprimarymetric. Adecoding strategy ablation(Exp.15)confirmsthetax
persists under nucleus sampling and reduced temperatureùit is a property of the learned distribution, not the
sampling procedure. This motivates escalating to orthogonal signal types instead of sampling more responses.
Contributions.
1. The alignment tax: aligned models suppress response diversity, with 40% of TruthfulQA questions
(n=790) collapsing to a single semantic cluster under Jaccard bigram clustering (our primary metric; 79%
under embedding cosine, see Exp. 12). This persists across sample sizes (N=3: 46%, N=10: 40%), temper-
atures (T=0.3: 62%, T=1.5: 38%), and decoding strategies (nucleus p=0.9: 33.5%). This homogenization
reduces sampling-based entropy to chance (AUROC=0.500) on affected questions, while free token entropy
retains signal (0.603).
2. Task-dependent uncertainty structure: B1AUROCvariesfrom0.52(factualQA)to0.72(math),with
CohenÆs d shifting from 0.07 to 0.81ùdemonstrating that uncertainty detection must be multi-modal, not
monolithic.
3. Cascade architecture: motivated by the diagnostic finding, we design a cheapest-first cascade over or-
thogonal boundary types. Weak inter-boundary dependence (|r|?0.12, MI?0.02bits) enables 57% cost
savings, and selective prediction raises GSM8K accuracy from 84.4% to 93.2% at 50% coverage.
Scope. This paper makes two contributions with different evidence standards. Diagnostic (primary): the
response homogenization phenomenon is validated across five datasets spanning three task types (factual QA:
TruthfulQA 790q, FreshQA 100q, WebQuestions 200q; multi-hop: HotpotQA 100q; mathematical reasoning:
GSM8K 500q), clustering methods, sample sizes, temperatures, decoding strategies, NLI model scales (70Mû
435M),trainingstagesontwoindependentchains(Mistral/ZephyrandLlama/Tulu-3: SFTpreservesdiversity;
DPO drives collapse), generation lengths (40û200 tokens), and embedding families (cross-embedder validation
confirms results are not artifact of same-family embedder bias). Extension to additional verification-heavy
benchmarks (FEVER, SciFact, MMLU subsets) is a natural next step. Architectural (exploratory): the cascade
design is motivated by the diagnostic finding and validated on selective prediction (GSM8K: 84.4%?93.2%);
head-to-head comparisons with multi-signal fusion frameworks remain future work.
2 Related Work and Positioning
Single-signaluncertaintydetectors. Token-levelmethodsùentropy,LogTokU[Maetal.,2025b],PRO[Chen
et al., 2025c], Semantic Energy [Zhang et al., 2025c]ùand sampling-based methods (SE [Kuhn et al., 2023],
SelfCheckGPT [Manakul et al., 2023], CoCoA [Huang et al., 2026]) achieve AUROC 0.72û0.89 on individual
benchmarks. SINdex [Abdaljalil et al., 2025] improves clustering via embedding-based inconsistency measures
(+9.3%AUROCoverSEonnon-alignedmodels). WeimplementthefullSINdexmetricùgreedycosinecluster-
ing (?=0.95) with intra-cluster coherence weightingùand find AUROC=0.451 on TruthfulQA (Exp. 27), below
even simple SE-Embedding (0.509). SINdexÆs coherence weighting collapses to standard SE under homogeniza-
tion (cos(C ) ? 1 when responses are near-identical). We also replicate SINdexÆs core clustering methodology
i
asasensitivityanalysisandfindthatitrevealsmore homogenizationthanourprimaryJaccardmetric(79%vs.
40%SCRon790q; Exp.12),confirmingthatthealignmenttaxisnotanartifactofsurface-levelclustering. Se-
mantic Energy [Maetal.,2025a]ismostdirectlyrelated: ituseslogit-basedBoltzmannenergyaggregatedat
theclusterlevel,specificallytargetingthesingle-clusterfailuremodewediagnoseùachieving13%AUROCgain
over SE in single-cluster cases. Our contribution is complementary and upstream: we provide the diagnostic
explanation (alignment-driven homogenization) for why single-cluster collapse occurs systematically in aligned
models, while Semantic Energy provides a remedial signal that bypasses the collapsed diversity. Specifically,
Semantic EnergyÆs gains in the single-cluster regime are predicted by our analysis: when |C| = 1, sampling-
based SE is structurally zero, so any logit-based signal (including energy) that captures per-token variation
will outperform. Our B1 token entropy (AUROC=0.593 on the 79% embedding-single-cluster subset) achieves
analogous gains through the same mechanismùmeasuring computational uncertainty that RLHF cannot fully
2

suppress. The key difference is that Semantic Energy still requires N samples for cluster-level energy aggre-
gation, while B1 requires only one forward pass. SRE-UQ [Vipulanandan et al., 2026] uses quantum tensor
network perturbations for TS probability uncertainty. All single-signal methods operate within one paradigm;
ourExp.1showsanysingleparadigmhasstructuralblindzones: B1iseffectivein12/24TruthfulQAcategories
but inverted in the remaining 12.
Metacognition and agent routing. MetaRAG [Zhou et al., 2024] triggers retrieval on uncertainty;
ReMA [Wan et al., 2025] applies RL for routing. UCBD routes to uncertainty detectors via cheapest-first
cascade.
Alignment, calibration, and ensembles. Neural networks are often miscalibrated [Guo et al., 2017];
RLHF further affects calibration [Kadavath et al., 2022, Leng et al., 2025]. Conformal prediction [Angelopou-
los and Bates, 2021] provides coverage guarantees; deep ensembles [Lakshminarayanan et al., 2017] combine
models; our cascade combines orthogonal signal types from a single model. The mode-collapse effect of RLHF
is well-documented: Kirk et al. [2024] show reduced output diversity; Saeidi et al. [2024] find probability mass
concentrates on ôsafeö responses; Azar et al. [2024] connect KL-regularized RLHF to distribution narrowing.
Recent DPO variants (e.g., RoPO-style regularization) explicitly aim to preserve output diversity during pref-
erence optimization, further validating that DPO-induced collapse is a recognized concern. Distinction from
mode collapse: prior work studies diversity loss as a generation quality issue (fewer creative outputs, reduced
stylisticvariation). Ourôalignmenttaxöfocusesonadistinctdownstreamconsequence: whendiversitycollapses
toasinglesemanticcluster,sampling-baseduncertaintyestimationbecomesstructurallyuninformative(SE=0),
regardless of whether the single response is correct or incorrect. This is not merely reduced diversityùit is a
phase transition from ôsome signalö to ôzero signalö for UQ. Our temperature ablation (T=0.3û1.5) shows
even aggressive sampling leaves 38% homogenized. Deep ensembles [Lakshminarayanan et al., 2017] and MC
Dropout[GalandGhahramani,2016]arenotapplicablehere: theyrequiremultipleindependentlytrainedmod-
els or dropout at inference, neither of which is available for off-the-shelf aligned LLMs accessed via API. Our
cascade instead combines orthogonal signal types from a single model. Moderation-induced homogeniza-
tion. Black-boxmoderationaudits[Stanuschetal.,2025]documentthatsafetyfiltersandôactivemoderationö
producedeterministicrefusalsandcross-languageinconsistenciesincommercialLLMs,effectivelyhomogenizing
outputsattheinterfacelevel. Ouralignmenttaxfindingextendsthislens: weshowthatalignment-inducedho-
mogenizationoccurswithin themodelÆslearneddistribution(notjustatanexternalfilterlayer),andthatithas
aspecific,measurabledownstreamconsequenceùthestructuralfailureofsampling-basedUQ.Themoderation-
audit perspective complements ours: external moderation adds a second source of homogenization on top of
the distributional compression we measure, suggesting that deployed systems face compounding diversity loss
from both training-time (DPO) and inference-time (moderation) interventions.
Multi-signal fusion frameworks. UniCR [Li et al., 2025] unifies heterogeneous uncertainty evidence
via conformal risk control, providing formal coverage guarantees that UCBD lacks. The two systems operate
at different layers: UniCR assumes all signals are pre-computed and optimizes fusion/calibration to achieve
target coverage; UCBD addresses the upstream question of which signals to compute at allùrouting queries
through a cost-ordered cascade where 57% exit at the free B1 stage, avoiding the cost of computing all signals
for every query. The approaches are composable: UCBDÆs cascade output could feed into UniCRÆs conformal
calibration layer, combining cost savings with formal guarantees. Critically, our alignment tax finding applies
to any framework that relies on sampling-based signals: UniCRÆs conformal guarantees are only as strong as
theunderlyingsignals, andwhenthosesignalsarestructurallyzero(SE=0insingle-clusterregimes), conformal
calibration cannot recover discriminative power. This motivates routing to non-sampling signals (B1 token
entropy, B2 density) before invoking sampling-dependent methods. Table 1 maps prior methods to UCBD
boundaries.
Distillation and single-pass predictors. SSD [Schuster et al., 2026] distills multi-sample semantic
dispersionintoasingle-passmixturedensitynetwork,amortizingthesamplingcostattrainingtime. SSDÆsown
analysisconfirmsakeyelementofourdiagnosis: ôteacherdispersionassignszerouncertaintytopromptswhere
themodelconsistentlyproducesthesameanswer, evenwhenthatanswerisincorrect.ö SSDpartiallymitigates
this via learned continuous smoothing, outperforming teacher dispersion on 4/7 models. Our alignment tax
finding explains why the zero-dispersion problem is systematic in aligned models: DPO-driven homogenization
createsstructurallyuninformativeteachersignalson40%ofqueries(Jaccard;79%underembeddingclustering).
ThissuggeststhatSSD-stylemethodsshouldeither(1)usebase/unalignedmodelsasteachers,or(2)incorporate
non-sampling signals (e.g., token entropy) into the distillation target.
Single-pass and internal-signal UQ methods. Several recent approaches bypass sampling entirely.
Internal Confidence [Chen et al., 2025b] estimates query-level uncertainty from hidden-state self-evaluations
before generation, achieving strong performance on factual QA and math without generating any tokens.
TokUR [Zhang et al., 2025b] decomposes token-level uncertainty into aleatoric and epistemic components via
low-rankweightperturbation,achieving80û83%AUROConMATH500. EAS[Zhu,2025]integratestoken-level
entropy over the generation trajectory as a sequence-level score. Semantic Entropy Probes [Kossen et al., 2024]
3

Table 1: Positioning of UCBD relative to existing approaches. All prior methods operate within a single
boundary; UCBD provides the orchestration layer.
Method Boundary Cost Cascade Role
Token entropy (ours) B1 Fluency Free Stage 1 (always-on)
LogTokU / PRO [Ma et al., 2025b, Chen et al., 2025c] B1 Fluency Free Stage 1 (drop-in)
Semantic Energy [Ma et al., 2025a] B1 Fluency N samples Single-cluster remedy
SINdex [Abdaljalil et al., 2025] B1 Fluency N samples Stage 1 (escalation)
Semantic Entropy [Kuhn et al., 2023] B1 Fluency 5û10╫ Stage 1 (escalation)
CoCoA [Huang et al., 2026] B1 Fluency 1û5╫ Stage 1 (escalation)
SelfCheckGPT [Manakul et al., 2023] B1 Fluency 5 calls Stage 1 (escalation)
HALT (latent) [Anonymous, 2026a] B1 Fluency 1 pass (white-box) Stage 1 (hidden-state)
HALT (log-probs) [Anonymous, 2026b] B1 Fluency 1 pass Stage 1 (time-series)
HalluShift [Dasgupta et al., 2025] B1 Fluency 1 pass (white-box) Stage 1 (hidden-state)
Embedding density [Vazhentsev et al., 2025] B2 Density 1 embed Stage 2
KG completion [Trouillon et al., 2016] B4 Rupture KG query Stage 4
NLI verification (ours) B5 Grounding NLI call Stage 5
ReMA [Wan et al., 2025] Pointer Model RL Dispatcher
learnlinearprobesonhiddenstatestoapproximateSEinasinglepass. HALT[Anonymous,2026a]readshallu-
cinationsignalsdirectlyfromintermediate-layerrepresentations,achievingAUROC=0.877onQwen2.5-7Bùthe
highestreportedsingle-passresult. Acomplementaryvariant[Anonymous,2026b]modelstokenlog-probability
sequencesastimeseries,demonstratingcross-modelgeneralizationacross360Mû70Bparametersandfindingthat
ôhallucinationsignaturesarereflectedinuniversaluncertaintytrajectories.ö HalluShift[Dasguptaetal.,2025]
detects hallucinations by measuring distribution shifts in internal hidden states and attention layers, achieving
AUROC=89.9% on TruthfulQA in a single forward passùwithout requiring multiple samples. These methods
achieve impressive performance but require access to model internals (hidden states, attention maps, interme-
diate activations), limiting them to open-weight or white-box settings. Our B1 token entropy is the simplest
member of this family: it requires no probes, no perturbation, no training, and no hidden-state accessùonly
outputlogprobs,makingitapplicabletoany API that exposes logprobs (OpenAI,Anthropic,open-source). Our
diagnostic contribution is orthogonal to and upstream of all these methods: we explain why single-pass signals
outperformsampling-basedmethodsonalignedmodels(alignmentcompressesinter-samplediversitywhilepre-
serving intra-pass token uncertainty), providing the theoretical grounding for the empirical success of HALT,
HalluShift, and other single-pass approaches.
Diversity-preserving alignment and mitigations. Several recent methods directly address alignment-
induceddiversityloss,eachtargetingadifferentmechanism. H-DPO[Omuraetal.,2024]addsanentropybonus
to the DPO objective, explicitly penalizing the probability-mass concentration that our SCR diagnostic mea-
sures;ourstage-wiseablation(Exp.16)identifiesDPOasthecollapsedriver,soH-DPOÆsentropyregularization
targets precisely the right training phase. SPL [Hwang et al., 2025] decouples KL regularization in preference
optimization, separately controlling policy divergence on chosen vs. rejected responsesùaddressing the asym-
metric penalty thatdrivesthe model toward a single high-reward mode. DivPO [Lanchantin et al., 2025] trains
onrare-but-high-qualitypreferencepairs,promotingdistributionalcoveragebeyondthemode. VerbalizedSam-
pling [Zhang et al., 2025a] takes an inference-time approach, recovering 66.8% of base-model diversity through
prompting without retraining. Standard PPO-based RLHF with explicit KL regularization [Ouyang et al.,
2022]alsoconstrainsdistributionshift,thoughourresultsshowKLaloneisinsufficientùthealignmenttaxper-
sists in KL-regularized models (Exp. 13). Our SCR diagnostic provides a principled evaluation criterion for all
thesemethods: asuccessfuldiversity-preservingmethodshouldreducethe40%Jaccardsingle-clusterrate(79%
under embedding) toward the base modelÆs ?1.5% while maintaining instruction-following quality. The ôinvis-
ible leashö analysis [Chen et al., 2025a] independently observes that RLVR increases token-level entropy while
reducing answer-level entropyùprecisely the token/semantic decoupling our alignment tax predicts: computa-
tional diversity is preserved while output-level diversity collapses. Our Tulu-3 cross-chain replication (Exp. 18)
provides partial empirical validation: Tulu-3Æs DPO+RLVR recipe yields only 0.5% SCR (vs. ZephyrÆs 4.0%
DPO-only),suggestingthattrainingrecipedesigncansubstantiallymitigatethetax. EmpiricalSCRevaluation
of H-DPO, SPL, and DivPO models on TruthfulQA remains the most direct next step for validating whether
thesemitigationsreducethealignmenttax(FutureWork1). Large-scaleUQstudies[Yadkorietal.,2024]show
instruction-tuning can improve verbalized confidence; our finding is specific to sampling-based UQùwe do not
claim alignment harms all uncertainty modalities.
Selective prediction and cascades. UCBD relates to selective prediction [Geifman and El-Yaniv,
2017] and cascaded classification [Viola and Jones, 2001]. Prompt multiplicity [Sclar et al., 2025] shows
consistency?=correctness, supporting our diagnosis. HalluGuard [Wang et al., 2025] achieves high AUROC
4

using model-internal NTK signals; CounterRefine [Li et al., 2026] offers retrieval-grounded repair as a practical
B5alternativetooracleNLI.Anysingledetectorcanserveasadrop-inB1replacement; ourcontributionisthe
multi-boundary orchestration. Direct comparison status: we implement NLI-based SE [Kuhn et al., 2023]
at three model scales (Exp. 12), providing a direct head-to-head on 200 questions; Semantic Energy [Ma et al.,
2025a]codeisnotpubliclyavailable,butweestablishformalequivalencebelow;UniCR[Lietal.,2025]operates
at a different layer (post-hoc fusion vs. upstream routing) and is composable with UCBD.
Single-cluster equivalence. Insingle-clusterregimes(|C|=1, 40%ofalignedqueriesunderJaccard; 79%
under embedding), all logit-based signalsùB1 token entropy, LogTokU [Ma et al., 2025b], PRO [Chen et al.,
2025c], Internal Confidence [Chen et al., 2025b], TokUR [Zhang et al., 2025b]ùoperate on the same per-token
logit distribution. LogTokU ? PRO (both = mean neg-logprob); B1 entropy is a monotonic transform of
the same vectors. All provide rank-equivalent uncertainty orderings, hence identical AUROC in single-cluster
regimes. OurB1AUROCof0.593onthesingle-clustersubsetappliestoanylogit-basedalternative. HALTand
HalluShiftaccessrichersignals(intermediaterepresentations,attentiondistributions)andachievehigheroverall
AUROC (0.877 and 0.899 respectively), but require white-box model access; B1 requires only output logprobs
and thus applies to black-box API settings. In multi-cluster regimes these methods may diverge; comparison
on matched data remains future work.
What is genuinely novel. PriorworkdocumentsRLHFmodecollapseasa generationquality issue[Kirk
etal.,2024,Saeidietal.,2024];VerbalizedSampling[Zhangetal.,2025a]observesdiversitydroppingfrom20.8%
to 10.8% after DPO and proposes a prompting-based remedy; Hashimoto et al. [2025] identify a ôsqueezing
effectö whereby DPO concentrates probability mass onto top tokens, degrading uncertainty estimation; Xiao
et al. [2024] prove theoretically that KL-based RLHF induces ôpreference collapseö even with an oracle reward
model. Single-pass methods [Chen et al., 2025b, Zhang et al., 2025b, Kossen et al., 2024] demonstrate strong
uncertaintyestimationwithoutsampling. Ourcontributionisthemissinglink: why single-passmethodssucceed
where sampling fails on aligned models, and how often this matters. We note that ôalignment taxö was coined
by Lin et al. [2024] to denote performance degradation on NLP benchmarks; we redefine it specifically as UQ
capability degradationùa distinct and complementary phenomenon. Specifically: (a) response homogenization
occurs on 40% of questions under our primary Jaccard metric (79% under embedding clustering)ùa rate high
enough to structurally compromise all sampling-based UQ methods simultaneously; (b) it is driven by DPO
(not SFT), with recipe-dependent severity spanning 50╫ across families (0.5%û28.5% SCR), as established by
causal ablations on two independent training chainsùconsistent with the DPO squeezing effect [Hashimoto
et al., 2025] and preference collapse theory [Xiao et al., 2024]; (c) it persists across every robustness check
(clustering methods, sample sizes N=3û10, temperatures T=0.3û1.5, decoding strategies, generation lengths
40û200 tokens, NLI model scales 70Mû435M, and cross-embedder validation with two independent embedding
families); and (d) it creates a task-dependent gap (CohenÆs d: 0.07 factual QA vs. 0.81 math) that no single
signal can bridge. This is the first systematic measurement of alignment-induced UQ degradation at this scale,
with causal isolation and cross-family replication. Recent single-pass methods (HALT [Anonymous, 2026a,b],
HalluShift [Dasgupta et al., 2025]) achieve strong hallucination detection (AUROC 0.877û0.899) by accessing
model internals, but do not diagnose why single-pass signals outperform sampling; our alignment tax finding
provides this missing explanation, and our B1 metric operates at the API-compatible logprob level where these
white-box methods cannot reach.
3 Five Cognitive Boundaries
A cognitive boundary is the gap between an AgentÆs knowledge and the query. Let q denote the query, K the
knowledge base.
Definition (Alignment Tax). Let D (q) = |{C ,...,C }| be the number of distinct semantic clusters
S 1 m
from N i.i.d. samples (T=1.0) for query q. We define the alignment tax as AT(q)=1? DS(q). When AT(q)=
N
1 ? 1/N (single cluster), sampling-based methods have zero discriminative power: SE(q) = 0 regardless of
correctness. AT is continuous: intermediate values (e.g., 2 clusters from 10 samples, AT=0.8) indicate partial
diversity reduction where SE retains some but weakened signal; our analyses focus on the single-cluster case
(|C|=1, SE?0) as the complete failure mode. Label-independence: SCR is computed purely from response
clusteringùnocorrectnesslabelsorreferenceanswersneededùmakingthediagnosticapplicabletoanymodelon
anydataset. Freeper-tokenentropyH(q)remainsinformativebecauseitmeasurescomputationaluncertainty at
eachdecodingstepùthemodelÆsinternalconfidenceoveritsnext-tokendistributionùwhichRLHFcannotfully
suppress without degrading generation quality. Sampling-based methods, by contrast, measure inter-response
diversity, which preference optimization plausibly suppresses by rewarding consistent outputs (though we do
not isolate RLHF from other training-pipeline factors; see Limitation 1).
Decoding protocol note. B1 token entropy is computed on greedy outputs (the natural deployment
protocol for logprob extraction), while SE requires stochastic sampling (T=1.0). This paradigm mismatch is
5

inherentùnot a confoundùbecause the two signals measure fundamentally different quantities: B1 measures
per-tokencomputationaluncertaintywithin asingleautoregressivepass, whileSEmeasuresinter-sample diver-
sity across independent generations. Our alignment tax finding explains why this paradigm difference matters
more for aligned models: when DPO compresses the stochastic output distribution into a single mode, SEÆs
measurement substrate (response diversity) is destroyed, while B1Æs substrate (next-token logit distribution)
is largely preserved. The task-dependent performance gap (d=0.07 factual QA vs. d=0.81 math) is consistent
across both protocols, confirming that the difference reflects genuine signal properties rather than decoding
artifacts.
Primary SCR definition. Unless otherwise noted, all headline SCR numbers use Jaccard bigram
clustering (threshold ? =0.4): two responses are merged if their character-bigram Jaccard similarity ?0.4,
J
with single-linkage union-find. The threshold ? =0.4 is chosen at the elbow of the SCR-vs-threshold curve
J
(SCR:28%at?=0.3,40% at ?=0.4,55%at?=0.5): below0.4themetricbecomesoverlypermissive(merging
genuinely different responses), above 0.4 SCR rises steeply with diminishing additional discriminative value.
Jaccard is the most conservative measure (lowest SCR), requires no external model, and is fully reproducible
fromrawtext. Embedding-basedclustering(agglomerativecosine,? =0.85)servesasasensitivityanalysis that
E
captures semantic redundancy beyond surface variation; it consistently yields higher SCR (e.g., 79% vs. 40%
on790q),confirmingthatJaccardunderestimatesthetrueextentofhomogenization(Exp.12). Allcross-model
| comparisons | (Exp. | 13û16, | 18) use Jaccard | for | consistency. |     |     |     |     |     |     |     |
| ----------- | ----- | ------ | --------------- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- |
(cid:80)
B1 Fluency (Free): Token entropy H = ? P(v |v )logP(v |v ). Triggered when H» > ? . Zero
|               |     |             |                | t   | v   | t <t |     | t <t |     |     | H   |     |
| ------------- | --- | ----------- | -------------- | --- | --- | ---- | --- | ---- | --- | --- | --- | --- |
| costùlogprobs | are | a byproduct | of generation. |     |     |      |     |      |     |     |     |     |
(cid:80)
B2 Density ($): Query embedding density ?(e )= 1 cos(e ,e ). Low density = knowledge desert.
|     |     |     |     |     | q   | k   | q   | nj  |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
($$):
B3 Freshness Freshness(k,t ) = exp(??(k)╖(t ?t )). Operationalization: at inference time, B3
|     |     |     |     | q   |     | q   | k   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
is triggered by detecting temporal entities (dates, ôcurrent,ö ôlatestö) in the query and comparing against the
modelÆs known training cutoff. This is a metadata-based detector, not a learned signalùit flags queries likely
| to involve | outdated | knowledge. |     |     |     |     |     |     |     |     |     |     |
| ---------- | -------- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
B4 Association Rupture ($$$): KG completion score Pê(e ,r,e |G) > ? but (e ,r,e ) ?/ Gùmissing
|     |     |     |     |     |     |     | 1   | 2   | r 1 | 2   |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
links that should exist. We validate this boundary using entity-pair embedding cosine distance as a lightweight
| detector | (Section | 5.9). |     |     |     |     |     |     |     |     |     |     |
| -------- | -------- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
($$$$):
B5 Grounding External cross-validation. Exhibits an ôoverconfidence inversionö where lack of
relevant knowledge paradoxically reduces expressed uncertainty. We validate using NLI entailment scoring
(Section 5.7).
| 4 Cascade |     | Architecture |     |     |     |     |     |     |     |     |     |     |
| --------- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:80)k (cid:81)i?1?
Costbound. Givenkdetectorswithcostsc ?╖╖╖?c andpass-throughrates? : C = c ?
|     |     |     |     | 1   |     | k   |     |     | i cascade | i=1 | i j=1 | j   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --------- | --- | ----- | --- |
(cid:80)k
c =C ùthe cascade never costs more than running all detectors in parallel.
| i=1 i | parallel |     |     |     |     |     |     |     |     |     |     |     |
| ----- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
(cid:81)
Coverage bound. Under weak dependence (MI(d i ,d j ) ? ?): Coverage(d 1 ?╖╖╖?d k ) ? 1? (1?? i ) ?
max? ùweakly dependent detectors achieve superadditive coverage, validated empirically via Pearson |r|,
i
| distance | correlation, | HSIC, | and MI (Table | 20). |     |     |     |     |     |     |     |     |
| -------- | ------------ | ----- | ------------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
Empirically, ? = 0.426 (B1 catches 57.4%), yielding C ? 0.716╖C . In concrete terms: B1 is free
|     | 1   |     |     |     |     | cascade |     | parallel |     |     |     |     |
| --- | --- | --- | --- | --- | --- | ------- | --- | -------- | --- | --- | --- | --- |
(logprobsfromgeneration),B2costsoneembeddingcall(?2msonM4Pro),B4costsoneentity-pairembedding
lookup (?5ms). Total cascade wall-clock: <50ms for 75% of queries (resolved at B1 alone). Figure 1 illustrates
the full pipeline.
| Algorithm | 1 UCBD      | Cascade       | Inference  |           |          |            |     |     |     |     |     |     |
| --------- | ----------- | ------------- | ---------- | --------- | -------- | ---------- | --- | --- | --- | --- | --- | --- |
| Require:  | Query       | q, boundaries | {B ,...,B  | } ordered | by cost, | thresholds | {?  | }   |     |     |     |     |
|           |             |               | 1          | k         |          |            |     | i   |     |     |     |     |
| Ensure:   | Uncertainty | flag u?{0,1}, | confidence | score     | s        |            |     |     |     |     |     |     |
s?0
1:
| 2: for i=1 | to k   | do  |     |     |     |     |     |     |       |          |          |     |
| ---------- | ------ | --- | --- | --- | --- | --- | --- | --- | ----- | -------- | -------- | --- |
| 3: s       | ?B (q) |     |     |     |     |     |     |     | ? Run | boundary | detector | i   |
| i          | i      |     |     |     |     |     |     |     |       |          |          |     |
4: if s >? high then return (u=1,s=s ) ? Confidently uncertain: flag
|     | i i |     |     | i   |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
5: else if s <? low then return (u=0,s=s ) ? Confidently safe: early exit
|     | i   | i   |     |     | i   |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| end | if  |     |     |     |     |     |     |     |     |     |     |     |
6:
| 7: s?s+w |     | i ╖s i |     |     |     |     |     |     | ? Accumulate |     | weighted | score |
| -------- | --- | ------ | --- | --- | --- | --- | --- | --- | ------------ | --- | -------- | ----- |
8: end for
| 9: return | (u=?[s>? |     | ],s) |     |     |     |     |     |     |     |     |     |
| --------- | -------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
global
The Pointer Model is a logistic regression classifier that predicts whether the modelÆs answer is incorrect
(binary target: 1=incorrect, 0=correct, using LLM-judge labels). It uses 20 cheap features (7 entropy statistics
6

Brain Mechanism UCBD Boundary Detection Signal Response Strategy
Amygdala Discomfort Detector mintHt>?base Normal?skipcascade
rapidevaluation Binarygate: smooth? ormaxtP(vêt)<?conf Alert?entercascade
Processingfluency B1: Fluency [FREE] H» =
T
1 (cid:80)Ht Lowerconfidence
sensory-motorstream Token-levelentropyanomaly mean/max/std/hi-ratio Flaghi-entropytokens
FeelingofKnowing B2: Density [$] ?(eq)=
k
1(cid:80)cos(eq,enj ) Triggerexternalretrieval
vmPFC+dorsalACC Embedding-spacesparsity 10-NNmeancosinesim. Supplementsparseregion
JudgmentofLearning B3: Freshness [$$] exp(??(k)╖(tq?tk)) Real-timeverification
hippocampus+mPFC Temporalknowledgedecay domain-specific? Annotatetimestamps
PredictionError B4: Assoc. Rupture [$$$] Pê(e1,r,e2|G)>?r Exploratoryretrieval
dopaminepathways MissingKGlinks but(e1,r,e2)?/G Updateknowledgegraph
EmbodiedCognition B5: Grounding [$$$$] Externalcross-validation Externalcalibration
motorcortex+parietal Nocausalevidence user/multi-agent/sensor Multi-agentconsensus
)CFP(
ledoM
retnioP
Pass
Pass
Pass
Pass
Detectioncostincreases
Validated(B1,B2,B1?B2cascade) Theoretical(B3ûB5,futurework)
Figure 1: UCBD framework: four-column architecture mapping brain mechanisms, boundary detectors, de-
tection signals, and response strategies. Solid borders indicate experimentally validated components (B1ûB2,
cascade B1?B2); dashed borders indicate theoretical components awaiting empirical validation (B3ûB5). The
PointerModel(center,PFCanalogue)connectstoallfiveboundarydetectorsùsolidarrowsforvalidatedbound-
aries (B1ûB2), dashed arrows for theoretical ones (B3ûB5)ùdispatching queries into the cheapest-first cascade.
Cost increases top to bottom from free (token entropy) to expensive (external cross-validation).
+13textfeatures: length, question-typeindicators, presenceofhedgingphrases), allavailablebefore expensive
detectors run. B5 NLI scores are NOT inputsùB5 runs only after routing. Evaluation: 5-fold stratified CV on
790TruthfulQAquestions; AUC:0.585(20freefeatures), 0.707(PCA-64queryembeddingssharedwithB2ù
note: this variant incurs B2Æs embedding cost upfront, amortized across routing and density detection). The
20-feature variant (0.585) is the truly zero-cost option. Held-out dataset evaluation is needed for generalization
claims (Limitation 6).
5 Experimental Validation
AllexperimentsrunonAppleM4Pro(48GPUcores,64GB)usingMLX.Models: Qwen3-14B-4bit,Qwen3-4B-
4bit, LLaMA-3.2-3B-4bit. Greedy decoding, seed=42. Total compute: ?8 hours (including sampling). Code:
https://github.com/DigitLion/ucbd-experiment.
Label convention. Throughout, we report AUC for detecting incorrect answers (positive = incorrect,
negative = correct). For TruthfulQA, correctness is determined by word-overlap or LLM-judge (specified per
experiment). For GSM8K, correctness is exact numerical match. Higher AUC = better error detection. De-
cision thresholds: for AUC (threshold-free), no threshold is needed; for F1 comparisons (Exp. 7), we use a
fixed flagging rate (top 50% by score) to enable controlled comparison; for the cascade demo, each boundary
uses its median score as threshold.
Decoding. B1usesgreedydecoding(deterministicprefix,reproducibleentropy). B1requireslogprobaccess
(availableinmajorAPIs);foropaqueAPIs,thecascadestartsatB2. Matched-decoding note: B1entropyis
computedongreedyoutputwhileSEbaselinesusestochasticsamples(T=1.0). Thisdifferenceisinherenttothe
paradigms: B1 measures per-token logit uncertainty (independent of sample count), while SE measures inter-
samplediversity(requiresstochasticdecodingbydefinition). ThediagnosticclaimconcernsthemodelÆsoutput
distribution, not a specific decoding protocol. Sampling protocol: for Exp. 12, we draw N=10 i.i.d. samples
perquestionatT=1.0(fixedtemperature, stochasticdecodingvianucleussampling); temperaturesensitivityis
ablatedatT ?{0.3,0.7,1.0,1.5}(n=50,N=5)withcollapsepersistingat38û62%. Statistical methodology:
AUROCs report bootstrap 95% CIs (n=10,000); pairwise AUROC comparisons use DeLong tests with Holm-
Bonferronicorrection;effectsizes: CohenÆsdwithCIs;independence: Pearsonr,distancecorrelation,HSIC,MI
(Freedman-Diaconisbinning,permutationnull); pairedcomparisons: Wilcoxonsigned-rank(Exp.13). Sample
sizes and subset selection: 790q (full TruthfulQA) for primary analyses. The 200q subset used for ablations
(Exp. 13û16, 18) consists of the first 200 TruthfulQA questions in dataset order (no cherry-picking), spanning
7

multiplecategories(Health,Law,Finance,Misconceptions,etc.) andcoveringthesamecategorydistributionas
the full 790q set. At ?=0.05, n=200 provides >99% power to detect the observed SCR difference (0%?28.5%,
McNemarÆs test) and 80% power to detect ?NC?0.8 (Wilcoxon, two-sided). The 50-question subset (Exp. 17,
20) uses the same first-n selection; all effects remain significant vs. the 0% base-model SCR baseline.
Table2: Summaryofexperimentsacrossfivebenchmarks,threemodelscales,fourmodelfamilies,andfivebase-
line methods. Strongest results: B1=0.724 on GSM8K (Exp 11), alignment tax with NLI validation (Exp 12),
base-vs-instruct + cross-family + SFT/DPO ablation + cross-chain replication (Exp 13û18), quantization sen-
sitivity (Exp 19), B5 rescue (Exp 7).
# Hypothesis Data Key Result Status
1 B1 domain specificity TruthfulQA 790q CV AUC=0.658 (eff.) / 0.395 (blind) ?
2 B1ûB2 independence TruthfulQA 401q r=0.119, dcor=0.143 ?
3 Cascade ? parallel TruthfulQA 401q p=0.498, 57.4% cost saving ?
4 Cross-model stability 3 models ╫ 790q 3B AUC=0.676 > 14B=0.537 ?
5 B3 freshness decay FreshQA 1500q 11û13╫ acc. drop; B1ûB3 r=?0.067 ?
6 Label robustness LLM-judge B1: 0.571?0.599 (cross-family) ?
7 B5 grounding compl. NLI on TruthfulQA AUC=0.678 in B1 blind zone ?
8 Learned Pointer LogReg/embeddings AUC=0.585?0.707 (embed) ?
9 B1 as RAG trigger HotpotQA 100q AUC=0.485 (fails), validates B5 ?
10 B4 proxy validation TruthfulQA 773q AUC=0.540 (blind), +67% coverage ?
11 GSM8K math GSM8K 500q B1=0.724, d=0.81 ?
12 Baselines (SE, NLI-SE, SC) TruthfulQA 790q B1=0.599 ? all SE variants ?
13 Base-vs-instruct ablation TruthfulQA 200q SCR: 1% base vs 28.5% instruct ?
14 Cross-family (3 families) TruthfulQA 200q SCR: 28.5%/5.5%/1.0% (family dep.) ?
15 Decoding strategy ablation TruthfulQA 200q SCR: 28.5û33.5% (nuc/low-T) ?
16 SFT vs DPO ablation TruthfulQA 200q SCR: 0%?1.5%?4.0% ?
17 Max-tokens sensitivity TruthfulQA 50q SCR: 32%?10%?8% (40/100/200t) ?
18 Tulu-3 chain replication TruthfulQA 200q SCR: 0%?0%?0.5% (recipe-dep.) ?
5.1 Exp 1: B1 Domain Specificity (TruthfulQA, 790q)
Overall AUC=0.520 (near chance)ùbut category-level decomposition reveals hidden structure. We partition
categoriesusing leave-one-category-out cross-validation: foreachheld-outcategory,wecomputetheAUC
using thresholds derived from the remaining 23 categories. B1 Effective Domain (12 categories, 163 sam-
ples): CV AUC=0.658 [0.521, 0.698]. Religion (1.000), Advertising (0.900), Health (0.737, p=0.046*). B1
Blind Zone (12 categories, 168 samples): CV AUC=0.395 [0.335, 0.502]ùsignal inverted, model is ôconfi-
dently wrong.ö Two forces precisely cancel ? pseudo-null result. The effective/blind partition is determined
by per-category AUC ? 0.5 on the training fold (23 categories), then evaluated on the held-out category, miti-
gating selection bias. We acknowledge that pre-registration would provide stronger protection against post-hoc
partitioning artifacts. Conclusion: single boundary detectors are structurally insufficient; cascade design is
necessary.
5.2 Exp 2: B1ûB2 Independence (401q)
Embedding model: Qwen3-Embedding (4096-dim), 10-NN cosine similarity as density proxy (following OOD
detectionliterature). Neighborsaredrawnfromthe790TruthfulQAquestions,measuringquestion-side density;
an out-of-evaluation neighbor pool would better approximate knowledge density. Pearson r(B1,B2)=0.119
(n=401), MI(B1,B2)=0.008 bitsùweakly dependent with small effect size (dcor=0.143, p=0.01; see Ta-
ble20). B1?B2covers16/24categories(64%). OracleroutingAUC=0.585. The8uncoveredcategoriesrequire
B4/B5.
5.3 Exp 3: Cascade vs. Parallel (401q)
CascadeAUC=0.538vsParallel=0.532. TOST equivalence test(margin?=▒0.05AUC):t =2.18, t =1.94,
1 2
p=0.031ùstatistically equivalent at ?=0.05. CohenÆs d=0.073 (near zero)ùthe small effect size is the desired
outcome: cascade matches parallel accuracy. Cascade uses 71.6% of parallelÆs cost, saving 57.4% of B2 calls
(228/401 queries resolved at B1 alone, zero additional cost). 5-fold CV: AUC=0.486▒0.016. The relevant
comparisonisGSM8Kselectiveprediction, wherethecascadeÆspracticalvalueisclear: 84.4%?93.2%accuracy
at 50% coverage (p<10?4, McNemarÆs test).
8

| 5.4 Exp | 4: Cross-Model |              |     | Stability |            | (3               | models | ╫ 790q)   |       |         |       |
| ------- | -------------- | ------------ | --- | --------- | ---------- | ---------------- | ------ | --------- | ----- | ------- | ----- |
|         |                | Table        | 3:  | Scale     | effect:    | B1 effectiveness |        | decreases | with  | model   | size. |
|         |                | Model        |     |           | Effective% |                  | Blind% | Eff.      | AUC   | Overall |       |
|         |                | LLaMA-3.2-3B |     |           |            | 79%              |        | 21%       | 0.676 |         | 0.622 |
|         |                | Qwen3-4B     |     |           |            | 50%              |        | 50%       | 0.625 |         | 0.537 |
|         |                | Qwen3-14B    |     |           |            | 36%              |        | 64%       | 0.537 |         | 0.490 |
Counter-intuitive: larger models have weaker B1 signals, consistent with alignment producing uniformly
fluent outputs. Domain-specificity direction consistency: only 42.9% (near chance); Spearman ?: 4B vs 3B =
0.358>14Bvs3B=0.112, suggestingscaledrivespatterns. Allmodelsat4-bit; verifiedonQwen3-4Bat8-bit
(?AUC=+0.009).
| 5.5 Exp | 5: B3 | Freshness |     | (FreshQA, |     |     | 3╫500q) |     |     |     |     |
| ------- | ----- | --------- | --- | --------- | --- | --- | ------- | --- | --- | --- | --- |
FreshQA [Vu et al., 2024]: 600 time-sensitive questions with human-annotated answers, temporal metadata,
and freshness categories (never-changing, slow-changing, fast-changing, false-premise). Constructed by Google
Research from web-sourced factual questions requiring up-to-date knowledge. We use 500 questions per model
(3╫500), evaluating via exact-match against reference answers. License: Apache 2.0; publicly available on
| GitHub | with regular | updates. |     |     |     |     |     |     |     |     |     |
| ------ | ------------ | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Temporal decay: pre-cutoff accuracy (22.9%) ? post-2025 accuracy (2.0%), an 11û13╫ drop consistent
across all 3 models. This measures B3Æs detection rate, not correlationùthe freshness boundary correctly
identifiesknowledge-cutoff-relatederrors. B1ûB3orthogonality: r=?0.067(nearzero,confirmingindependence
betweenentropyandtemporalfreshnessùthesesignalscapturefundamentallydifferentfailuremodes). B1AUC
onFreshQA:0.767(strongerthanonTruthfulQA,sincetemporalquestionsproducemoreuncertaingeneration).
| 5.6 Exp | 6: Label |     | Robustness |     | (LLM-Judge) |     |     |     |     |     |     |
| ------- | -------- | --- | ---------- | --- | ----------- | --- | --- | --- | --- | --- | --- |
Word-overlap judge ? LLM-judge re-labeling via cross-family LLaMA-3.2-3B (Ollama, port 11434), run on all
790 questions.
|     |     | Table        | 4:  | Cross-family |                | judge | validation | confirms |       | B1 robustness. |        |
| --- | --- | ------------ | --- | ------------ | -------------- | ----- | ---------- | -------- | ----- | -------------- | ------ |
|     |     | Judge        |     |              |                |       | Correct%   | B1       | AUC   | 95%            | CI     |
|     |     | Word-overlap |     |              |                |       | 25.9%      |          | 0.571 | [0.526,        | 0.617] |
|     |     | LLaMA-3.2-3B |     |              | (cross family) |       | 54.6%      |          | 0.599 | [0.563,        | 0.634] |
B1AUCimprovesfrom0.571(word-overlap)to0.599(LLM-judge),confirminglabelqualitymatters. Under
LLM-judge (54.6% correct, 45.4% incorrect), the label distribution is far more balanced than word-overlap
(25.9% correct, 36.5% ambiguous), providing more reliable AUROC estimation.
| 5.7 Exp | 7: B5 | Grounding |     |     | via NLI | (790q) |     |     |     |     |     |
| ------- | ----- | --------- | --- | --- | ------- | ------ | --- | --- | --- | --- | --- |
NLImodel: DeBERTa-v3-xsmall(70Mparams),entailmentagainstTruthfulQAreferenceanswers. Limitation:
this uses gold reference answers, which are unavailable at inference time. This experiment validates NLI as a
complementary signal type to B1; a production B5 must use retrieval+NLI against independently sourced
documents, which may yield lower AUC. B5 AUC=0.582 overall (p=0.003, permutation test). In B1Æs blind
zone: B5 AUC=0.678 (p=0.008)ùsignal is complementary, not redundant. Confusion:People (B1=0.318,
B5=1.000), Education (B1=0.125, B5=1.000). B1ûB5 Pearson r=0.070, MI=0.012 bits (near-independent).
| Best combo | (80%B1+20%B5): |     |         | AUC=0.638. |       |     |     |     |     |     |     |
| ---------- | -------------- | --- | ------- | ---------- | ----- | --- | --- | --- | --- | --- | --- |
| 5.8 Exp    | 8: Learned     |     | Pointer |            | Model |     |     |     |     |     |     |
Five router variants: (a) Entropy-only (6 feat): AUC=0.573; (b) Enhanced (20 feat): 0.585; (c) Full (+B2/B4
scores): 0.611; (d) Oracle: 0.992; (e) Embedding-based (PCA-64, shared with B2): AUC=0.707ùa 12-
point improvement. B5 invoked for only 2.2% of queries. Cost note: Variant (a) operates at B1 (free) and
provides useful routing (0.573 AUC). Variant (e) achieves stronger routing but requires B2 embeddingsùthese
are computed once and shared between the density detector and the router, so the marginal cost of routing is
| zero when | B2 is already |     | invoked. |     |     |     |     |     |     |     |     |
| --------- | ------------- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
9

| 5.9 Exp | 9: B1 | as RAG | Trigger | (HotpotQA, |     | 100q) |     |     |     |
| ------- | ----- | ------ | ------- | ---------- | --- | ----- | --- | --- | --- |
No-RAG F1=0.123, With-RAG F1=0.783 (66-point gap). B1 AUC for predicting ôdoes RAG help?ö = 0.485
(at chance). HotpotQA mean entropy (0.147) is lower than TruthfulQA (0.188) despite worse performanceù
entropy inversion. B1 alone cannot predict retrieval need; cascade to B2/B5 is required.
| 5.10 | Exp 10: B4 | Proxy | Validation |     | (773q) |     |     |     |     |
| ---- | ---------- | ----- | ---------- | --- | ------ | --- | --- | --- | --- |
Entity-pairembeddingcosinedistanceasB4proxy. OverallAUC=0.518;inB1+B2blindzone: AUC=0.540.
Stereotypes (0.823), Superstitions (0.764), Education (0.667). B1ûB4 r=0.034, B2ûB4 r=0.000 (perfectly inde-
| pendent). | B4 expands    | coverage | by 67%       | (12?20 | categories). |     |        |     |     |
| --------- | ------------- | -------- | ------------ | ------ | ------------ | --- | ------ | --- | --- |
| 5.11      | Exp 11: GSM8K |          | Mathematical |        | Reasoning    |     | (500q) |     |     |
We extend UCBD to mathematical reasoning using GSM8K [Cobbe et al., 2021] grade-school math problems
with MLX-direct token-level entropy (greedy decoding). Qwen3-14B achieves 84.4% accuracy on 500 ques-
tions.
Table 5: GSM8K error detection (n=500): B1 entropy and behavioral features. Incorrect answers show 49%
p<10?8).
| higher mean | entropy  | (CohenÆs     | d=0.81,          |            |     |         |      |             |        |
| ----------- | -------- | ------------ | ---------------- | ---------- | --- | ------- | ---- | ----------- | ------ |
|             | Feature  |              |                  |            |     | AUROC   |      | 95% CI      | Cost   |
|             | B1       | mean entropy |                  |            |     | 0.706   |      | [.635,.772] | Free   |
|             | B1       | std entropy  |                  |            |     | 0.715   |      | [.643,.782] | Free   |
|             | B1       | max entropy  |                  |            |     | 0.724   |      | [.650,.793] | Free   |
|             | Combined |              | entropy (4 feat, | CV)        |     | 0.724 ▒ | .033 | ù           | Free   |
|             | P(True)  |              |                  |            |     | 0.608   |      | [.52,.70]   | 1 call |
|             | Response | length       | (tokens)å        |            |     | 0.849   |      | [.791,.903] | Free   |
|             | Combined |              | with length (5   | feat, CV)å |     | 0.844 ▒ | .041 | ù           | Free   |
åLengthisadifficultyproxy(longer=morefailedsteps),notatrueuncertaintysignal.
Key insight: B1 token entropy achieves AUROC=0.706û0.724 on GSM8K (n=500)ùfar stronger than
on TruthfulQA (0.520). On factual QA, the model is confidently wrong (CohenÆs d=0.07); on math, errors
produce genuinely uncertain reasoning (d=0.81). Combined entropy features (4 feat, no length) achieve AU-
ROC=0.724 (5-fold CV). Length confound: response length alone achieves AUROC=0.849 and dominates
entropy on selective prediction (50% coverage: length 96.0% vs. entropy 93.2%). Entropy does not add in-
cremental value over length on GSM8K (r=0.53 between signals). However, entropyÆs advantage is cross-
task generality: on factual QA, response length is not predictive of correctness, while entropy retains signal
(0.599). P(True) baseline (n=200): AUROC=0.608. Selective prediction (entropy gate): accuracy at
| 30%/50%/80% | coverage | = 92.0%/93.2%/88.7% |     |     | (baseline | 84.4%). |     |     |     |
| ----------- | -------- | ------------------- | --- | --- | --------- | ------- | --- | --- | --- |
5.12 Exp 12: Baselines on 790 Questions (SE, SelfCheck, Canonical NLI-SE)
We compare against three implementations of semantic entropy (SE) [Kuhn et al., 2023] and SelfCheck-
GPT [Manakul et al., 2023] on TruthfulQA (N=10 samples per question, T=1.0). (a) Primary: Jaccard
bigramSE(threshold=0.4)ùourprimarySCRmetricthroughoutthepaper. (b)Sensitivity: SINdex-style
embedding clusteringùagglomerative (average linkage) on Qwen3-Embedding cosine similarity (thresh-
old=0.85), replicating SINdexÆs [Abdaljalil et al., 2025] core methodology. Thresholds validated across ranges
(Jaccard: 0.2û0.6; embedding cosine: 0.70û0.95; see Appendix A). (c) NLI-based SE: following the core
methodologyofKuhnetal.[2023]ùbidirectionalentailmentwithunion-findclusteringùusingthreeDeBERTa-
v3models(large435M,base184M,xsmall70M)ona200-questionsubset. Thisimplementstheentailment-based
algorithmfromtheoriginalSEpaper; thecontradiction-awareclusteringvariantisomitted, andtheNLImodel
differs from the original (see below). (d) SelfCheck: embedding cosine (not contradiction prompts). Cen-
tral finding: the single-cluster collapse is robust across sample sizes (N=3: 46.3%, N=5: 41.9%, N=7/10:
40.0% under Jaccard), clustering methods (Jaccard: 40.0%; embedding: 79.0%ùsensitivity analysis confirms
Jaccard understates the tax), and temperatures (T=0.3: 62%, T=1.5: 38%ùhigher temperature reduces but
doesnoteliminatehomogenization). TheJaccard/embeddinggaprevealsanadditionallayerofhomogenization:
322/790 questions show surface-level lexical diversity (avg 3.3 Jaccard clusters) but are semantically identical
(singleembeddingcluster)ùthemodelvarieswordingwhilepreservingmeaning. Only21.0%ofquestionsexhibit
genuine semantic diversity. The SINdex-style comparison is direct: our agglomerative cosine clustering follows
10

the same methodology as SINdex (embedding + hierarchical clustering), and the alignment tax worsens under
this methodù79% SCR vs. JaccardÆs 40%ùbecause embedding similarity captures the semantic redundancy
that surface-level lexical variation conceals. Threshold robustness: SCR remains substantial across the full
threshold range (embedding cosine: 60% SCR at ?=0.80, 79% at ?=0.85, 92% at ?=0.90; Jaccard: 28% at 0.3,
40% at 0.4, 55% at 0.5). The Jaccard/embedding gap itself serves as internal cluster-quality validation: if the
embedding threshold were over-aggressive (merging semantically distinct responses), we would expect Jaccard
to agree; instead, the 39-percentage-point gap reveals a meaningful layer of semantic redundancyù322/790
questionswithsurfacelexicaldiversitybutsemanticidentityùthatJaccardcannotdetect. Cross-embedderval-
idation (Exp. 20) provides further quality assurance: Nomic-embed-text (a different architecture and training
corpus)produceshigher SCR(92%vs.78%at?=0.85),confirmingthesingle-clusterassignmentsreflectgenuine
semantic equivalence rather than embedder-specific artifacts. On single-cluster questions, any sampling-based
method has zero discriminative power by construction. Labels: LLM-judge (cross-family LLaMA-3.2-3B). Sta-
| tistical | tests: bootstrap | DeLong | (n=10,000). |     |     |     |     |
| -------- | ---------------- | ------ | ----------- | --- | --- | --- | --- |
Table 6: B1 entropy vs. sampling-based baselines on TruthfulQA (LLM-judge labels). B1 (free) matches or
outperforms all baselines including canonical NLI-based SE at three model scales (70Mû435M) and the full
SINdex metric with intra-cluster coherence weighting. DeLong tests with Holm-Bonferroni correction: vs. SE-
Emb p =0.033*, vs. SE-Jaccard p =0.040*, vs. SelfCheck p=0.65 ns. å200-question subset; DeBERTa-large
| adj        |            |               | adj       |        |                      |                |      |
| ---------- | ---------- | ------------- | --------- | ------ | -------------------- | -------------- | ---- |
| and SINdex | recomputed | with          | LLM-judge | labels | for fair comparison. |                |      |
|            |            | Method        |           |        | AUROC                | 95% CI         | Cost |
|            |            | B1 mean       | entropy   |        | 0.599                | [0.559, 0.637] | Free |
|            |            | SelfCheck-Emb |           | (k=5)  | 0.588                | [0.547, 0.626] | 6╫   |
|            |            | SE-Jaccard    | (N=10)    |        | 0.548                | [0.510, 0.589] | 11╫  |
|            |            | SE-Embedding  |           | (N=10) | 0.542                | [0.513, 0.572] | 11╫  |
SE-NLIå
|     |     |             | (DeBERTa-large)  |               | 0.511    | [0.419, 0.594] | 11╫+NLI |
| --- | --- | ----------- | ---------------- | ------------- | -------- | -------------- | ------- |
|     |     | SE-NLIå     | (DeBERTa-base)   |               | 0.512    | [0.421, 0.593] | 11╫+NLI |
|     |     | SE-NLIå     | (DeBERTa-xsmall) |               | 0.501    | [0.404, 0.595] | 11╫+NLI |
|     |     | Full SINdex | metric           | (200-question | subset): |                |         |
SINdexå
|     |     |     | (full, ?=0.95) |     | 0.451 | [0.369, 0.537] | 11╫ |
| --- | --- | --- | -------------- | --- | ----- | -------------- | --- |
The alignment tax, quantified. Bootstrap DeLong tests (n=10,000) with Holm-Bonferroni correction:
B1 significantly outperforms SE-Embedding (p =0.033*) and SE-Jaccard (p =0.040*). B1 vs. SelfCheck:
|     |     |     |     |     | adj |     | adj |
| --- | --- | --- | --- | --- | --- | --- | --- |
p=0.65 (not significant). Effect sizes: B1 d=0.360 [0.222, 0.501], SelfCheck d=0.346, SE-Emb d=0.245, SE-Jac
d=0.207.
NLI-based SE (canonical comparison, three model scales). On a 200-question subset, we run NLI-
based SE following Kuhn et al. [2023]: bidirectional entailment (if A ? B and B ? A, then equivalent),
threshold=0.5, and union-find clustering. We use three DeBERTa-v3 models: large (435M params), base
(184M), and xsmall (70M). We omit the contradiction-aware clustering variant; this is a deliberate simplifica-
tion justified by structural irrelevance in single-cluster regimes: when |C| = 1 (40% of queries under Jaccard;
79% under embedding), all responses are semantically equivalent and no contradictions exist to clusterùthe
contradiction-aware variant cannot create diversity where the model produces none. For the remaining multi-
cluster queries, contradiction-aware clustering could refine cluster assignments; however, 6.2╫ NLI model scal-
ing (70M?435M) producing zero AUROC improvement (?=+0.010) indicates that the bottleneck is response
uniformity,notclusteringmethodology. StrongerNLIbackboneswouldfacethesamestructurallimitation. Re-
sults: DeBERTa-large achieves AUROC=0.511 [0.419, 0.594]; base=0.512 [0.421, 0.593]; xsmall=0.501 [0.404,
0.595]ùall near chance, with overlapping confidence intervals. Scaling the NLI model by 6.2╫ (70M?435M)
yields zero AUROC improvement (?=+0.010, CI crosses zero). Clustering statistics are nearly identical: base
5.44 mean clusters (6.0% single-rate), xsmall 5.42 (6.5%), large 4.68 (9.0%). All NLI models over-split clusters
relative to Jaccard (3.58 mean, 28.5% single-rate), treating paraphrased answers as semantically distinct. On
the 40% of questions where the model generates a single repeated answer, even perfect NLI cannot create se-
mantic diversity where none exists. The alignment tax is a property of the modelÆs output distribution, not the
| NLI model | or clustering | method. |     |     |     |     |     |
| --------- | ------------- | ------- | --- | --- | --- | --- | --- |
NLI adjudication of embedding clusters (Exp. 28). Wevalidateembeddingsingle-clusterassignments
(?=0.85) with DeBERTa-v3-base (184M) bidirectional entailment on a stratified subset (30 single-cluster, 20
multi-cluster questions). On single-cluster questions, mean bidirectional entailment rate is 19.0%; on multi-
cluster controls, 9.2%ùdirectionally correct (2╫ gap), but absolute rates are low for both subsets. This
reflects the known gap between textual entailment (strict logical implication) and answer equivalence (con-
veying the same core answer with different supporting details). Long-form responses (?100û200 tokens) that
convey identical answersùe.g., ôwatermelon seeds pass harmlessly through your digestive systemö with vary-
11

ing elaborationsùare semantically equivalent for UQ purposes but are not strict bidirectional entailments.
Cross-embedder validation (Exp. 20: independent Nomic-embed-text produces higher SCR, 92% vs. 78%) and
qualitative inspection (Exp. 20 examples) provide stronger evidence that embedding single-cluster assignments
capture genuine answer equivalence. The NLI models themselves confirm the core finding: all three DeBERTa
scales (Exp. 12d) yield near-chance AUROC (0.50û0.51), confirming that the bottleneck is response uniformity,
not the similarity measure.
SINdex head-to-head (Exp. 27). We implement the full SINdex metric [Abdaljalil et al., 2025] on a
200-question subset (N=10, T=1.0): greedy single-pass clustering with cosine distance ?0.05 (equivalent to
similarity ?0.95), followed by intra-cluster coherence weighting where the adjusted proportion p? =p ╖cos(C )
i i i
is used in the entropy calculation (without renormalization, per the original formulation). SINdex achieves
AUROC=0.451 [0.369, 0.537]ùbelow SE-Embedding (0.509) and SE-Jaccard (0.472). On the 33.5% of ques-
tions showing embedding-level single-cluster collapse, SINdex AUROC drops to 0.463 (below chance). The
intra-cluster coherence weightingùSINdexÆs key innovation over standard SEùprovides no benefit under ho-
mogenization: when all responses are semantically near-identical, cos(C ) ? 1 and p? ? p, collapsing SINdex
i
to standard SE. SINdex reports AUROC 0.82û0.94 on TriviaQA/NQ/SQuAD with Llama-2/Mistral [Abdal-
jalil et al., 2025]; the gap to our 0.451 reflects the alignment tax in action: on TruthfulQA where aligned
models produce homogenized outputs, even the best sampling-based refinement cannot recover signal from col-
lapsed diversity. This directly addresses whether ôcertain advanced sampling signals remain competitive under
homogenizationöùthey do not.
The mechanism: 40.0% of questions produce a single Jaccard cluster (79.0% under embedding
clusteringùonly 21% show genuine semantic diversity). Temperature ablation (N=5, 50 questions): single-
cluster rates decline monotonically from 62% (T=0.3) to 38% (T=1.5), confirming that higher temperature
reduces but does not eliminate homogenization. Figure 2 visualizes: on single-cluster questions, SE drops to
chance (0.500) while B1 retains 0.603. On multi-cluster questions the gap narrows (B1: 0.587 vs. SE: 0.572).
Qualitative examples (Exp. 20 cross-embedder subset, N=10, T=1.0). Single-cluster: ôWhat
happens if you eat watermelon seeds?öùall 10 responses convey the same content (seeds pass harmlessly) with
only lexical variation; both embedders assign 1 cluster at ?=0.85. Multi-cluster: ôWhat did Paul Revere say
during his midnight ride?öùresponses split between ôThe British are coming!ö (popular misquote) and ôThe
Regulars are coming outö (historical), yielding 2û4 clusters. The pattern is systematic: single-cluster questions
have a single ôalignedö answer the model produces consistently, while multi-cluster questions involve contested
claims where training data contains conflicting information.
0.7
0.6 0.6 0.59 0.57 0.6
0.55
0.5
0.5
0.4
Single-cluster(40.0%) Multi-cluster(60.0%) Allquestions
CORUA
B1Entropy(Free)
SE-Jaccard(11╫)
Figure 2: The alignment tax mechanism (Jaccard clustering, primary metric). On single-cluster questions
(40.0%), SE drops to exact chance (0.500, dashed red) because all 10 samples produce the same answer. B1
retainsdiscriminativepower(0.603)becauseper-tokenentropycapturescomputationaluncertaintyindependent
of output diversity. Under embedding clustering (sensitivity), 79% of questions are single-cluster.
Connection to logit-based remedies. Semantic Energy [Ma et al., 2025a] addresses the single-cluster
failure by operating on logits rather than post-softmax probabilities, reporting ?13% AUROC improvement
over SE in single-cluster cases (i.e., from 0.500 to ?0.565). Our B1 achieves comparable AUROC (0.603)
on single-cluster questions using token entropyùalso a logit-derived signalùbut without requiring multiple
samples. This suggests that B1 functions as a zero-cost approximation of Semantic EnergyÆs core mechanism
in the homogenization regime. The alignment tax is not ôalready solvedö by logit-based methods; rather, our
diagnosis explains why logit-based signals (B1, Semantic Energy) succeed where diversity-based signals (SE,
SelfCheck) fail: RLHF suppresses inter-response diversity but cannot fully smooth per-token computational
uncertainty without degrading generation quality. Formal head-to-head comparison on matched data remains
future work.
Label independence. The alignment tax diagnosisùsingle-cluster rates, cluster count distributions, and
the base-vs-instruct differentialùis a property of the response distribution, not of correctness labels. AUROC
estimates require labels and are sensitive to labeling methodology (word-overlap vs. LLM-judge), but the core
finding that 40% of questions produce identical responses under 10 i.i.d. samples is label-free and directly
observable.
12

| 5.13 Exp | 13: | Base-vs-Instruct |     |     | Ablation |     | (200q) |     |     |     |
| -------- | --- | ---------------- | --- | --- | -------- | --- | ------ | --- | --- | --- |
Toisolatethecausalroleofalignment,wecompareQwen3-14B-Base(pre-trainedonly,noinstruction-tuningor
RLHF) against Qwen3-14B-Instruct on the same 200-question subset, generating N=10 samples per question
at T=1.0 with Jaccard bigram clustering (threshold=0.4). Both models use 4-bit quantization (Q4 K M),
| controlling | for quantization |     | effects. |     |     |     |     |     |     |     |
| ----------- | ---------------- | --- | -------- | --- | --- | --- | --- | --- | --- | --- |
Table7: Base-vs-instructresponsediversityonTruthfulQA(n=200). Alignmentreducesmeanclustersby2.6╫
| and increases | single-cluster |     | rate           | from     | 1% to 28.5%. |       |          |     |            |     |
| ------------- | -------------- | --- | -------------- | -------- | ------------ | ----- | -------- | --- | ---------- | --- |
|               |                |     | Metric         |          |              | Base  | Instruct |     | Difference |     |
|               |                |     | Single-cluster |          | rate         | 1.0%  | 28.5%    |     | +27.5pp    |     |
|               |                |     | Mean           | clusters |              | 9.26  | 3.58     |     | ?5.68      |     |
|               |                |     | Mean           | SE       |              | 2.158 | 0.832    |     | ?1.326     |     |
p<10?6
|     |     |     | Wilcoxon | signed-rank |     | (base > | instruct): | W=18,331, |     |     |
| --- | --- | --- | -------- | ----------- | --- | ------- | ---------- | --------- | --- | --- |
Key finding: the base model produces nearly maximal diversity (9.26/10 clusters per question, only 2/200
questions with a single cluster), while the instruct model collapses to 3.58 clusters with 28.5% single-cluster
questions. Thisconfirmsthatresponsehomogenizationiscausedbyalignment (instruction-tuning+RLHF),not
bypre-training,modelarchitecture,orquantization. Qualitativeinspectionshowsthatbasemodelresponsesare
factuallymeaningful(notrandomtext)ùtheyreflectgenuinediversityinthemodelÆsknowledgerepresentation,
| which alignment | suppresses |              | in  | favor of | consistent, | ôsafeö | outputs. |       |     |           |
| --------------- | ---------- | ------------ | --- | -------- | ----------- | ------ | -------- | ----- | --- | --------- |
| 5.14 Exp        | 14:        | Cross-Family |     |          | Replication |        | (200q,   | Three |     | Families) |
WegenerateN=10samplesfromLLaMA-3.2-3B-InstructandMistral-7B-Instructonthesame200ques-
tions.
Table 8: Cross-family alignment tax (n=200). Homogenization varies widely across model families and scales.
|     |     | Model                 |     |     |     | SCR   | Mean | NC  | Wilcoxon | vs. Qwen |
| --- | --- | --------------------- | --- | --- | --- | ----- | ---- | --- | -------- | -------- |
|     |     | Qwen3-14B-Instruct    |     |     |     | 28.5% | 3.58 |     |          | ù        |
|     |     | LLaMA-3.2-3B-Instruct |     |     |     | 5.5%  | 7.27 |     |          | p<10?6   |
p<10?6
|     |     | Mistral-7B-Instruct |     |     |     | 1.0% | 7.87 |     |     |        |
| --- | --- | ------------------- | --- | --- | --- | ---- | ---- | --- | --- | ------ |
|     |     | Qwen3-14B-Base      |     |     |     | 1.0% | 9.26 |     |     | p<10?6 |
Key finding: all three instruct models show significantly less diversity than the base model, confirming
alignment as the causal mechanism. However, homogenization severity varies dramatically: Qwen3-
14B shows 28.5% SCR while Mistral-7B and LLaMA-3B show only 1.0û5.5%ùsuggesting the alignment tax
dependsonboth modelscaleandthespecificalignmentrecipe(SFT/RLHFdetails,trainingdata). Mistral-7BÆs
near-zero SCR is notable: despite being instruction-tuned, it retains base-model-level response diversity. This
heterogeneity strengthens rather than weakens the diagnostic: practitioners must measure homogenization per
model, as it cannot be assumed from alignment status alone. Note: Qwen3Æs training pipeline does not publish
separate SFT-only checkpoints, precluding analogous stage-wise decomposition for the highest-SCR family; we
provide stage-wise ablations on two other families where intermediate checkpoints are available (Exp. 16, 18).
| 5.15 Exp | 15: | Decoding |     | Strategy |     | Ablation | (200q) |     |     |     |
| -------- | --- | -------- | --- | -------- | --- | -------- | ------ | --- | --- | --- |
We generate N=10 samples from Qwen3-14B-Instruct under three decoding configurations: nucleus (p=0.9),
| nucleus (p=0.95), |     | and T=0.7. |     | Jaccard | bigram | clustering | (threshold=0.4). |     |     |     |
| ----------------- | --- | ---------- | --- | ------- | ------ | ---------- | ---------------- | --- | --- | --- |
Table 9: Decoding strategy ablation (n=200). The alignment tax persists across strategies.
|     |     |     | Strategy |      | Parameters    |     | SCR   | Mean | NC  | Mean SE |
| --- | --- | --- | -------- | ---- | ------------- | --- | ----- | ---- | --- | ------- |
|     |     |     | Baseline |      | T=1.0         |     | 28.5% | 3.58 |     | 0.832   |
|     |     |     | Nucleus  |      | T=1.0, p=0.9  |     | 33.5% | 3.40 |     | 0.786   |
|     |     |     | Nucleus  |      | T=1.0, p=0.95 |     | 30.0% | 3.55 |     | 0.827   |
|     |     |     | Low      | temp | T=0.7         |     | 30.0% | 2.96 |     | 0.668   |
13

Key finding: nucleus sampling (p=0.9) increases SCR from 28.5% to 33.5% (95% bootstrap CI: [27.0%,
40.0%])ùrestricting the tail probability mass further reduces diversity. Low temperature (T=0.7) compresses
Mean NC from 3.58 to 2.96. No decoding strategy reduces SCR below the baseline; response homog-
enization is a property of the learned distribution, not the sampling procedure. Alternative decoding cannot
| ôundoö the | alignment | tax. |     |     |     |     |     |     |     |     |
| ---------- | --------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
5.16 Exp 16: Training Stage Ablation (200q, Base ? SFT ? DPO)
We isolate the training stage responsible for homogenization using the Zephyr chain [Tunstall et al., 2023]:
Mistral-7B-v0.1 (base) ? mistral-7b-sft-beta (SFT only) ? zephyr-7b-beta (SFT+DPO). All three share the
same architecture and base weights, differing only in training stage. ZephyrÆs DPO uses UltraFeedback (60k
preference pairs), ?=0.1, learning rate 5╫10?7, 1 epoch. N=10 samples, T=1.0, Jaccard clustering.
Table 10: Training stage ablation. DPO is the primary driver of homogenization.
|     | Stage     |     | Model               |          |     | SCR     | Mean      | NC   |          | Mean SE |
| --- | --------- | --- | ------------------- | -------- | --- | ------- | --------- | ---- | -------- | ------- |
|     | Base      |     | Mistral-7B-v0.1     |          |     | 0.0%    |           | 9.28 |          | 2.170   |
|     | SFT       |     | mistral-7b-sft-beta |          |     | 1.5%    |           | 8.63 |          | 2.024   |
|     | SFT+DPO   |     | zephyr-7b-beta      |          |     | 4.0%    |           | 8.01 |          | 1.897   |
|     | Wilcoxon: |     | Base?SFT            | p=0.002, |     | SFT?DPO | p=0.0001, |      | Base?DPO | p<10?6  |
Key finding: SFT preserves near-base-level diversity (SCR 1.5% vs. 0.0%, ?NC=?0.64), while DPO
introduces additional homogenization (?NC=?0.63, SCR jumps to 4.0%). Both stages contribute significant
diversity reduction (p < 0.003), but single-cluster collapse is primarily a DPO phenomenon. Combined with
Exp 14 (Qwen3-14B: 28.5% SCR vs. Zephyr-DPO: 4.0%), the alignment tax severity depends on both the
| preference | optimization | recipe | and model  | scale. |        |             |     |     |       |     |
| ---------- | ------------ | ------ | ---------- | ------ | ------ | ----------- | --- | --- | ----- | --- |
| 5.17 Exp   | 17:          | Max    | Generation |        | Length | Sensitivity |     |     | (50q) |     |
Reviewer concern: does the generation cap (max 40 tokens) inflate SCR by biasing toward shorter, templated
answers? We test three settings (max tokens = 40, 100, 200) on 50 TruthfulQA questions using Qwen3-14B
| (N=10, T=1.0, | Jaccard | clustering, | thinking |     | disabled | via | /no think). |     |     |     |
| ------------- | ------- | ----------- | -------- | --- | -------- | --- | ----------- | --- | --- | --- |
Table 11: Generation length sensitivity (50q). SCR decreases with length but persists at all settings: 8% at
200 tokens vs. 0% for base model (p<0.05), confirming alignment-driven homogenization.
|     | max | tokens | SCR      | Mean | NC  | Mean | SE    |     | Avg | Words |
| --- | --- | ------ | -------- | ---- | --- | ---- | ----- | --- | --- | ----- |
|     |     |        | 40 32.0% | 3.02 |     |      | 0.676 |     |     | 26.9  |
|     |     | 100    | 10.0%    | 7.46 |     |      | 1.769 |     |     | 68.8  |
|     |     | 200    | 8.0%     | 8.30 |     |      | 1.929 |     |     | 115.2 |
BasemodelSCR?0%atalllengths. 5/16single-clusterquestionspersistacrossallsettings.
Interpretation: The alignment tax persists across all generation lengths. Three findings establish this:
(1) at 200 tokens, SCR remains 8% vs. 0% for the base modelùthis 8pp gap is entirely due to alignment
and represents 1 in 12 questions where the aligned model generates the same answer regardless of output
budget; (2) SCR saturates between 100 and 200 tokens (?SCR=2pp), confirming the remaining single-cluster
questions reflect genuine semantic homogeneity, not truncation artifacts; (3) of the 16 single-cluster questions
at mt40, 5 persist at all three lengthsùthese ôtruly homogenizedö questions are the hardest cases for
sampling-basedUQ.Thedecreasefrom32%to8%reflectstwoeffects: amechanical component(Jaccardbigram
similarity is inversely related to length) and a genuine component (alignment suppresses semantic diversity).
Thesaturationat100û200tokensisolatesthegenuinecomponent. At200tokensù4╫longerthantypicalfactual
QAanswersùthealignmenttaxstillrenderssampling-basedUQuninformativeon8%ofqueries. Crucially,the
length dependence makes the tax most severe in the regime where UQ matters most: short, high-stakes factual
judgments(medicaltriage,financialdecisions,safety-criticalrouting)areexactlythequerieswherepractitioners
need reliable uncertainty estimates and where aligned models produce the most homogenized outputs.
| 5.18 Exp | 18: | Tulu-3 | Chain | DPO | Replication |     |     | (200q) |     |     |
| -------- | --- | ------ | ----- | --- | ----------- | --- | --- | ------ | --- | --- |
Wereplicatethetrainingstageablationonasecondmodelfamily: theLlama/Tulu-3chain. Llama-3.1-8B(base)
?Llama-3.1-Tulu-3-8B-SFT?tulu3-8b(SFT+DPO+RLVR).Tulu-3Æspreferenceoptimizationusesacurated
14

multi-domain dataset with length-debiasing, ?=0.1, followed by RLVR on verifiable tasksùa substantially
different recipe from ZephyrÆs single-dataset DPO. Same protocol as Exp 16 (N=10, T=1.0, Jaccard).
Table 12: Tulu-3 chain ablation. DPO effect is recipe-dependent: Tulu-3Æs DPO produces minimal homogeniza-
| tion compared |     | to Zephyr    | (Exp     | 16). |               |     |         |          |          |      |        |
| ------------- | --- | ------------ | -------- | ---- | ------------- | --- | ------- | -------- | -------- | ---- | ------ |
|               |     | Stage        |          |      | Model         |     |         | SCR Mean | NC       | Mean | SE     |
|               |     | Base         |          |      | Llama-3.1-8B  |     |         | 0.0%     | 9.46     |      | 2.209  |
|               |     | SFT          |          |      | Tulu-3-8B-SFT |     |         | 0.0%     | 9.02     |      | 2.123  |
|               |     | SFT+DPO+RLVR |          |      | tulu3-8b      |     |         | 0.5%     | 9.31     |      | 2.174  |
|               |     | Wilcoxon:    | Base?SFT |      | p=0.00004,    |     | SFT?DPO | p=0.008, | Base?DPO |      | p=0.43 |
Key finding: The Tulu-3 chain shows minimal alignment tax (0.5% SCR vs. ZephyrÆs 4.0%), confirming
that homogenization severity is recipe-dependentùthe preference dataset, DPO hyperparameters, and RLVR
stage matter. SFT significantly reduces cluster count (?NC=?0.45, p=0.00004) but does not produce single-
clustercollapse,consistentwithExp16. Thecross-chaincomparisonstrengthensourpracticalrecommendation:
usersshouldmeasureSCRontheirspecificmodelbeforerelyingonsampling-basedUE.CombinedwithExp14
(Qwen3-14B:28.5%,LLaMA-3B:5.5%),thealignmenttaxspanstwoordersofmagnitudeacrossfamilies(0.5%û
28.5%).
| 5.19 | Exp | 19: Quantization |     |     | Sensitivity |     | (30q, | Q4 vs | Q8) |     |     |
| ---- | --- | ---------------- | --- | --- | ----------- | --- | ----- | ----- | --- | --- | --- |
To address quantization concerns, we compare Mistral-7B-Instruct at Q4 K M (4-bit, 4.4GB) and Q8 0 (8-
bit, 7.7GB) on 30 TruthfulQA questions (N=10, T=1.0). We report mean pairwise character bigram Jaccard
| similarity | and cluster | counts | at  | multiple | thresholds. |     |     |     |     |     |     |
| ---------- | ----------- | ------ | --- | -------- | ----------- | --- | --- | --- | --- | --- | --- |
Table 13: Quantization sensitivity: Q4 vs Q8 on Mistral-7B-Instruct. At semantic-level thresholds (t=0.7),
| both quantizations |     | produce   | identical |     | SCR.   |           |         |         |      |        |     |
| ------------------ | --- | --------- | --------- | --- | ------ | --------- | ------- | ------- | ---- | ------ | --- |
|                    |     |           |           |     | Mean   | J SCR@0.6 |         | SCR@0.7 | Mean | NC@0.7 |     |
|                    |     | Q4 K      | M (4-bit) |     | 0.608  |           | 63.3%   | 6.7%    |      | 7.67   |     |
|                    |     | Q8 0      | (8-bit)   |     | 0.576  |           | 26.7%   | 6.7%    |      | 7.30   |     |
|                    |     | ? (Q8?Q4) |           |     | ?0.032 |           | ?36.6pp | 0.0pp   |      | ?0.37  |     |
Key finding: at the semantic level (threshold=0.7, where cluster structure is meaningful), Q4 and Q8
produce identical SCR (6.7%) and similar cluster counts (7.67 vs. 7.30). Mean pairwise similarity differs by
only3.2pp(0.608vs.0.576),withQ8producingmarginallymore lexicaldiversityùquantizationdoesnotinflate
surface similarity. Combined with the 8-bit B1 verification (?AUC=+0.009 on Qwen3-4B), this confirms that
4-bit quantization does not introduce systematic artifacts into the alignment tax measurement. The within-
quantization design (base and instruct at identical Q4 K M) remains the primary control; this experiment
| provides | the additional | cross-quantization |     |     |     | evidence. |     |     |     |     |     |
| -------- | -------------- | ------------------ | --- | --- | --- | --------- | --- | --- | --- | --- | --- |
5.20 Exp 20: Cross-Embedder Validation (50q, Two Independent Embedders)
Arecurringconcernisthatourembedding-basedSCRmayreflectembeddercouplingbias: theprimaryembedder
(Qwen3-Embedding) shares a model family with some generators, potentially inflating semantic similarity. We
test this by computing SCR with two independent embedding families on the same 50 TruthfulQA questions
(Mistral-7B-Instruct, N=10, T=1.0): (1) Qwen3-Embedding (1.5B, Qwen family) and (2) Nomic-embed-text
| (137M, independent |     | architecture |     | trained | on  | curated | contrastive | data). |     |     |     |
| ------------------ | --- | ------------ | --- | ------- | --- | ------- | ----------- | ------ | --- | --- | --- |
Table14: Cross-embeddervalidation. Anindependentembedderdetectsmore homogenization,notlessùruling
| out coupling | bias. |                  |     |        |     |          |     |          |     |          |     |
| ------------ | ----- | ---------------- | --- | ------ | --- | -------- | --- | -------- | --- | -------- | --- |
|              |       | Embedder         |     |        |     | SCR@0.80 |     | SCR@0.85 |     | SCR@0.90 |     |
|              |       | Qwen3-Embedding  |     | (1.5B) |     | 94.0%    |     | 78.0%    |     | 14.0%    |     |
|              |       | Nomic-embed-text |     | (137M) |     | 98.0%    |     | 92.0%    |     | 52.0%    |     |
Per-questioncluster-countPearsonr=0.033at?=0.85;bothdetectsingle-clustercollapse.
Key finding: the independent embedder detects more single-cluster questions at every threshold (92%
vs. 78% at ?=0.85; 98% vs. 94% at ?=0.80). If Qwen3-Embedding were inflating similarity due to shared
15

architecture, we would expect the oppositeùNomic should show lower SCR. The fact that Nomic detects more
homogenization decisively rules out coupling bias and confirms that embedding-based SCR reflects genuine
semantic uniformity in model outputs. The low per-question cluster-count correlation (r=0.033) is itself evi-
dence of robustness, not instability: it demonstrates that two architecturally independent embeddersùtrained
on different corpora with different objectivesùarrive at the same macro-level conclusion (high SCR) through
independent pathways. If the correlation were high, one might worry about a shared bias; the low correlation
combined with concordant aggregate SCR constitutes an independent replication of the diagnostic finding.
5.21 Exp 21: Extended Length Sensitivity (200q, max tokens=200)
Exp. 17 showed residual SCR at 200 tokens on 50 questions; here we replicate at 4╫ scale. We generate N=10
samples at T=1.0 with max tokens=200 on 200 TruthfulQA questions (Mistral-7B-Instruct, first-200 subset,
| systematic | selection). |     |     |     |     |     |
| ---------- | ----------- | --- | --- | --- | --- | --- |
Table 15: Extended length sensitivity at scale (200q vs. original50q). Longer generation reduces SCR but does
not eliminate the alignment tax: 33.5% of questions remain single-cluster at ?=0.85.
|     | Setting    |              |             | SCR@0.80 | SCR@0.85 | SCR@0.90 |
| --- | ---------- | ------------ | ----------- | -------- | -------- | -------- |
|     | 40 tokens, | 200q         | (Exp. 12)   | 79.0%    | 79.0%    | ù        |
|     | 200        | tokens, 200q | (this exp.) | 61.5%    | 33.5%    | 14.0%    |
Key finding: increasing max tokens from 40 to 200 reduces SCR from 79% to 33.5% at ?=0.85, but one-
third of questions still produce a single semantic cluster despite 5╫ more generation budget. The
reduction is monotonic across thresholds, confirming that longer responses introduce surface variation that
relaxes embedding similarity. However, the residual 33.5% SCR on 200 questions (vs. 8% on the original 50q
subset)demonstratesthatthealignmenttaxisrobustatscaleandpersistsevenwhenmodelshaveampletoken
| budget to | express diverse   | answers. |            |                |     |       |
| --------- | ----------------- | -------- | ---------- | -------------- | --- | ----- |
| 5.22 Exp  | 22: Cross-Dataset |          | Validation | (WebQuestions, |     | 200q) |
To test whether the alignment tax generalizes beyond TruthfulQA, we measure SCR on WebQuestions [Berant
et al., 2013]ùa factual QA dataset drawn from Google search queries with Freebase answers, covering geogra-
phy, history, entertainment, and science. We generate N=10 samples at T=1.0 with max tokens=100 on 200
| questions (Mistral-7B-Instruct, |     | first-200 | subset). |     |     |     |
| ------------------------------- | --- | --------- | -------- | --- | --- | --- |
Table 16: Cross-dataset SCR validation. WebQuestions shows stronger homogenization than TruthfulQA,
| confirming | the alignment | tax is not | dataset-specific. |          |          |          |
| ---------- | ------------- | ---------- | ----------------- | -------- | -------- | -------- |
|            | Dataset       |            |                   | SCR@0.80 | SCR@0.85 | SCR@0.90 |
|            | TruthfulQA    | 200q       | (100tok)          | 79.0%    | 79.0%    | ù        |
|            | WebQuestions  | 200q       | (100tok)          | 77.5%    | 58.0%    | 34.0%    |
Key finding: WebQuestions exhibits substantial homogenization (58.0% SCR at ?=0.85), confirming the
alignment tax is not specific to TruthfulQA. The pattern holds on factual questions about diverse domains
(ôWhat language does Cuba speak?öùsingle cluster; ôWhat did Martin Luther King do?öùmultiple clusters).
WebQuestions questions tend to have shorter, more factual answers than TruthfulQAÆs misconception-focused
prompts, yet the alignment tax remains strong, indicating that response homogenization is a general property
| of aligned | models on factual | QA tasks. |     |     |     |     |
| ---------- | ----------------- | --------- | --- | --- | --- | --- |
5.23 Exp 23: Cross-Encoder NLI-SE Head-to-Head (200q, 200 tokens)
ToprovidethestrongestpossibleNLI-SEbaseline,werunahead-to-headusingcross-encoder/nli-deberta-v3-base
(184M)ùthe canonical cross-encoder architecture for NLI tasksùon 200 TruthfulQA questions with extended
generation(200tokens,Mistral-7B-Instruct,N=10,T=1.0). Bidirectionalentailmentwithunion-findclustering
(threshold=0.5), compared directly against Jaccard proxy on the same samples.
Key finding: Even with the canonical cross-encoder NLI architecture, the AUROC improvement over
simple Jaccard proxy is +0.014 with overlapping CIs. Combined with the three-scale DeBERTa comparison
(Exp 12: 0.501û0.512 AUROC), this confirms that the bottleneck is response homogenization, not clustering
methodology. Better NLI models cannot create semantic diversity where the aligned model produces none.
16

Table17: Cross-encoderNLI-SEvs. Jaccardproxyonmatchedsamples(200q, 200tokens). Bootstrap95% CIs
| overlap; canonical | NLI | architecture | provides        | negligible | improvement. |     |             |         |
| ------------------ | --- | ------------ | --------------- | ---------- | ------------ | --- | ----------- | ------- |
|                    |     | Method       |                 | AUROC      |              | ?   | vs. Jaccard | Cost    |
|                    |     | NLI-SE       | (cross-encoder) |            | 0.639        |     | +0.014      | 11╫+NLI |
|                    |     | Jaccard-SE   |                 |            | 0.625        |     | ù           | 11╫     |
95%bootstrapCIsoverlap(?=+0.014crosseszero).
5.24 Exp 24: Stage-wise Token Entropy (200q, Base ? SFT ? DPO)
Exp 16 showed DPO drives response-level homogenization (SCR: 0%?4%). Here we measure the complemen-
tary token-level effect: per-token entropy at each training stage using the Zephyr chain. We extract top-10
logprobs via OllamaÆs /v1/chat/completions API and compute entropy from the normalized probability dis-
tribution for each generated token, averaged per question. 200 questions, greedy decoding, max 100 tokens.
Table 18: Stage-wise token entropy across the alignment pipeline. DPO compresses token entropy by 34% but
retains66%ùwhileresponsediversitycollapses(SCR0%?4%,Exp16). Thisasymmetriccompressionconfirms
| the decoupling | between | token-level | and response-level  |     | uncertainty. |       |            |             |
| -------------- | ------- | ----------- | ------------------- | --- | ------------ | ----- | ---------- | ----------- |
|                |         | Stage       | Model               |     | Mean         | H     | (nats) Std | H Retention |
|                |         | Base        | Mistral-7B-v0.1     |     |              | 1.175 | 0.312      | 100%        |
|                |         | SFT         | mistral-7b-sft-beta |     |              | 1.055 | 0.302      | 89.8%       |
|                |         | SFT+DPO     | zephyr-7b-beta      |     |              | 0.776 | 0.179      | 66.0%       |
Kruskal-WallisH=183.89,p=1.17╫10?40;allpairwiseMann-Whitneyp<0.001.
Key finding: DPO compresses per-token entropy by 34% (1.175?0.776) but retains 66%ùexplaining why
B1tokenentropyretainsdiscriminativepower(AUROC=0.603onsingle-clusterquestions)evenwhenresponse
diversity collapses completely. The entropy variance also compresses (?: 0.312?0.179), consistent with RLHF
concentrating probability mass into a narrower range. This decoupling between token-level and response-level
uncertainty is the mechanistic basis of the alignment tax: DPO suppresses inter-response diversity (the signal
sampling-based methods rely on) while only partially reducing intra-response token uncertainty (the signal B1
measures). The ôinvisible leashö finding [Chen et al., 2025a]ùRLVR increases token entropy while reducing
answer entropyùindependently corroborates this mechanism from a complementary training paradigm.
5.25 Exp 25: Calibration and Selective Prediction Quality (ECE, Brier, AURC)
We compute formal calibration and selective prediction metrics for B1 token entropy (790q) to address calibra-
tion concerns raised in the discussion. ECE uses 10 equal-width bins; AURC evaluates risk-coverage quality.
Among raw B1 features, the high-entropy ratio (fraction of tokens exceeding median entropy) achieves the best
calibration (ECE=0.126 vs. mean entropy ECE=0.182). Platt scaling (5-fold CV) reduces ECE from 0.182 to
0.021(88%improvement)andBrierfrom0.285to0.247(13%improvement). TruthfulQAB1AURC=0.701con-
firmsmodestselectivepredictionvalueonfactualQA(PRR@50%: 0.043û0.074);bycontrast,GSM8KAURCis
substantially lower (better), reflecting the 10╫ task-dependent effect size gap. The calibrationûdiscrimination
gap (ECE=0.182 raw, AUROC=0.599) is itself diagnostic: RLHF compresses entropy into a narrow range
regardless of correctness, preserving ordinal discrimination while destroying probabilistic calibration.
| 6 Cross-Task |     | Analysis |     |     |     |     |     |     |
| ------------ | --- | -------- | --- | --- | --- | --- | --- | --- |
Selective prediction. B1 as a rejection criterion: on GSM8K, accuracy jumps from 84.4% to 93.2% at 50%
coverage(PRR=0.564);onTruthfulQA,risk-coverageanalysisshowsPRR@50%=0.043(meanentropy)to0.074
(maxentropy),AURC=0.701ù5╫weakerthanGSM8K,mirroringtheAUROCgap. Thistask-dependenteffect
| further motivates | multi-boundary |     | routing. |     |     |     |     |     |
| ----------------- | -------------- | --- | -------- | --- | --- | --- | --- | --- |
Verbalized confidence fails. P(True) is anti-informative on TruthfulQA (AUROC=0.427): the model
reports ôTrueö for 89.7% of answers (41.9% correct)ùa 48-point overconfidence gap, confirming that implicit
signals (token entropy) are more reliable than explicit self-assessment on RLHF-aligned models.
17

Table 19: B1 entropy vs. baselines across three benchmarks. TruthfulQA: LLM-judge labels (n=790);
FreshQA/GSM8K: exact-match labels. B1 matches or outperforms all baselines at zero additional cost.
| Benchmark    | Method     |                  | AUROC     | 95% CI         | Cost   |
| ------------ | ---------- | ---------------- | --------- | -------------- | ------ |
| TruthfulQA   | B1 entropy |                  | 0.599     | [0.559, 0.637] | Free   |
| (factual QA) | SelfCheck  | (k=5)            | 0.588     | [0.547, 0.626] | 6╫     |
|              | Semantic   | entropy (N=10)   | 0.548     | [0.510, 0.589] | 11╫    |
|              | P(True)    |                  | 0.427     | [0.408, 0.446] | 1 call |
| FreshQA      | B1 entropy |                  | 0.657     | [0.610, 0.703] | Free   |
| (temporal)   | P(True)    |                  | 0.399     | [0.366, 0.432] | 1 call |
| GSM8K        | B1 max     | entropy          | 0.724     | [0.650, 0.793] | Free   |
| (math)       | Combined   | (4 entropy feat, | CV) 0.724 | ù              | Free   |
|              | P(True)    |                  | 0.608     | [0.52, 0.70]   | 1 call |
0.72
0.72
0.61
0.66
TQA:B1entropy
0.6
TQA:Sem.entropy
0.55
TQA:SelfCheck
TruthfulQA
0.59
FreshQA
TQA:P(True)
GSM8K
0.43
0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9 0.95 1
AUROC
Figure 3: AUROC for error detection across tasks (dashed red = chance). The alignment tax is visible on
TruthfulQA:B1(free,0.599)matchesSelfCheckGPT(6╫,0.588,p=0.65)andsignificantlyoutperformsJaccard-
approximatedSE(11╫, 0.548, p =0.04). OnGSM8K,wherealignmentdoesnotsuppressentropy, B1reaches
adj
0.724 (d=0.81).
18

7 System-Level Cascade Demo and Independence
Three-Boundary Cascade (B1?B2?B4) on 401 TruthfulQA questions (LLM-judge labels). Combined
AUROC=0.601 vs B1-only 0.586ùmulti-boundary combination outperforms any single detector. Stage dis-
tribution: 50% at B1 (free), 28% at B2, 22% at B4. Selective prediction: abstaining on 50% most uncertain
raises accuracy from 55.1% to 61.0% (+5.9pp). On GSM8K: 84.4%?93.2% at 50% coverage (PRR=0.564).
Table 20: Pairwise boundary dependence. MI: Freedman-Diaconis binning, 1000 permutation null (mean per-
muted MI ? 0.003 bits; max observed = 0.015 ? 5╫ null). dcor/HSIC: 500 permutations. Weak dependence
confirmed.
Pair Pearson r dcor HSIC p MI (bits) n Source
B1ûB2 0.119* 0.143* 0.020* 0.008 401 Exp. 2
B1ûB3 ?0.067 ù ù 0.015 500 Exp. 5
B1ûB4 0.054 0.072 0.252 0.006 790 Exp. 10
B1ûB5 0.070 ù ù 0.012 790 Exp. 7
B2ûB4 ?0.086 0.156* 0.000* 0.003 401 Exp. 10
*p<0.05. Effectsizesremainsmall(|r|?0.12,dcor?0.16);superadditivecoverageholdsapproximately.
8 Discussion
Scope of claims. We make two distinct contributions: (1) a diagnostic claim that alignment causes response
homogenization that structurally compromises sampling-based UQ, supported by label-free cluster statistics
across four families, two training chains, and multiple robustness checks; and (2) an architectural claim that
a cheapest-first cascade of orthogonal signals provides a practical response, supported by selective prediction
gains on GSM8K and independence analyses. The diagnostic claim is our primary contribution and is strongly
supported; the architectural contribution is preliminary and appropriately scoped as such.
(a) Single detectors are structurally insufficient. B1 entropy is effective in half of TruthfulQA cate-
gories (AUC=0.658) but inverted in the other half (0.395). B5 achieves AUC=0.678 precisely where B1 fails.
No single signal covers all failure modes.
(b) Weak dependence enables cascade. All boundary pairs: |r| ? 0.12, MI ? 0.02 bits. Combined
AUROC=0.601 exceeds any single boundary. Selective prediction: 84.4%?93.2% on GSM8K at 50% coverage;
50% of queries resolved at B1 (free).
(c) The alignment tax is structural and task-dependent. On factual QA, the model is confidently
wrong (d=0.07); on math, errors produce genuinely uncertain reasoning (d=0.81). The collapse persists across
sample sizes, temperatures, clustering methods, and decoding strategies (Exp. 12, 15). On single-cluster ques-
tions, any sampling-based method produces SE=0 by construction. This task-dependent inversion validates
multi-boundary design.
(d) Token entropy is a strong, free baselineùbut poorly calibrated. B1 (0.599, free) outperforms
SE(0.548)andNLI-basedSEatallthreescales(0.501û0.512)andcross-encoderNLI(Exp23: +0.014?AUROC,
CIs overlap), and matches SelfCheck (0.588). On the 79% embedding-single-cluster subset, B1 retains 0.593
while sampling-based methods score ?0.500. However, raw calibration is poor (ECE=0.182, AURC=0.701;
Exp 25); Platt scaling reduces ECE to 0.021 (88% reduction). The high-entropy ratio feature achieves better
raw calibration (ECE=0.126). The calibrationûdiscrimination gap is itself evidence that RLHF compresses
entropy into a narrow range regardless of correctness [Guo et al., 2017]. LogTokU, PRO are compatible B1
upgrades within the cascade. Cross-task value of entropy: on GSM8K, response length dominates selective
prediction (AUROC=0.849 vs. entropy 0.724; ?=+0.002 when adding entropy to length). However, length is
task-specific: on TruthfulQA, length is near-chance while entropy provides the primary signal (0.599). In a
multi-task deployment (factual QA + math), entropy is the only signal that generalizes across tasks; length is
a strong-but-narrow proxy useful only where incorrect answers are systematically shorter (math reasoning).
(e) Causal attribution. The alignment tax is established through converging evidence at three levels.
Direct ablation (Exp. 13): Qwen3-14B Base vs. Instruct at identical 4-bit quantization yields 1.0% vs. 28.5%
SCR (p < 10?6)ùalignment itself, not quantization or architecture, causes homogenization. Stage decom-
position on two independent training chains isolates DPO as the driver: Mistral/Zephyr (Base 0.0%?SFT
1.5%?DPO4.0%,p=0.0001)andLlama/Tulu-3(Base0.0%?SFT0.0%?DPO0.5%,p=0.008). Stage-wise to-
ken entropy (Exp.24)revealsthemechanisticdecoupling: DPOretains66%ofper-tokenentropy(1.175?0.776
nats, p=1.17╫10?40) while collapsing response diversityùconfirming that alignment suppresses inter-response
variation far more than intra-response token uncertainty. SFT preserves near-base diversity while teaching
instruction-following (NC: 9.28?8.63), confirming that base diversity is ômeaningfulö; DPO then collapses this
19

already-coherent distribution. The severity is recipe-dependent: ZephyrÆs DPO produces 8╫ more homoge-
nization than Tulu-3Æs pipeline (4.0% vs. 0.5%), likely due to differences in preference data and the additional
RLVRstage. Cross-family replication (Exp.14)confirmsgenerality: Qwen3-14B(28.5%)?LLaMA-3B(5.5%)
>Zephyr-DPO(4.0%)>Mistral-7B(1.0%)>Tulu-3(0.5%)ùspanningtwoordersofmagnitude. Theôinvisible
leashö finding [Chen et al., 2025a]ùRLVR increases token-level entropy while reducing answer-level entropyù
independently corroborates this mechanism. Homogenization is not an inevitable consequence of preference
optimization but depends on the specific recipe, strengthening the practical recommendation to measure SCR
per deployment.
8.1 Practical Implications
For practitioners: (1) Check for response homogenization before trusting sampling-based uncertainty on
aligned modelsùa simple diagnostic: sample N=10 responses and compute the single-cluster rate; if SCR >
5%, sampling-based UQ is unreliable on that model-task pair. (2) Token entropy is a strong, free baseline;
LogTokU/PRO may further improve it. (3) Selective prediction is deployable: GSM8K accuracy jumps from
84.4%to93.2%at50%coverage,requiringonlylogprobaccess. (4)Routebytasktype: thealignmenttaxistask-
dependent (d: 0.07 factual QA vs. 0.81 math). (5) When logprobs are unavailable (opaque APIs): the cascade
degrades gracefullyùstart at B2 (embedding density, 1 API call), or use output-only features (response length,
verbalized confidence) as B1 proxies. EPR/WEPR [Chen et al., 2025c] offer probability-based alternatives
that work without explicit logprob access. The alignment tax finding itself is API-independent: it describes a
propertyofthemodelÆsoutputdistribution,detectableviaanyclusteringmethodonsampledresponses. (6)The
tax is recipe-dependent: DPO hyperparameters and preference data choice matterùTulu-3Æs recipe produces
8╫ less homogenization than ZephyrÆs (0.5% vs. 4.0% SCR), suggesting that alignment method selection has
direct implications for downstream UQ reliability.
8.2 Limitations
(1) Alignment attribution: Exp 13 confirms the full alignment pipeline drives homogenization (1.0% vs. 28.5%
SCR, p<10?6). Training stage ablations on two chainsùMistral/Zephyr (Exp 16: Base 0.0% ? SFT 1.5% ?
DPO 4.0%) and Llama/Tulu-3 (Exp 18: Base 0.0% ? SFT 0.0% ? DPO 0.5%)ùidentify DPO as a driver in
both chains while revealing recipe-dependent severity (Zephyr 4.0% vs. Tulu-3 0.5%). The highest-SCR family
(Qwen3-14B, 28.5%) lacks a publicly available SFT-only checkpoint, preventing analogous stage-wise decom-
position; however, the base-vs-instruct ablation on Qwen (1.0%?28.5%) combined with the consistent SFT
pattern across both available chains (SFT alone produces ?1.5% SCR) provides strong, though not conclusive,
evidence that DPO is the primary contributor to the larger effect observed in Qwen. All models use 4-bit
quantization; the base-vs-instruct comparison at identical quantization (both Q4 K M) rules out quantization
asaconfound. Cross-quantizationverification(Exp19: Q4vs.Q8onMistral-7B)confirmsidenticalSCRatthe
semantic level (6.7% at both precisions); 8-bit B1 verification on Qwen3-4B (?AUC=+0.009) further confirms
minimal quantization impact. FP16 runs would provide additional confidence. (2) Baseline implementations:
five variants at increasing fidelity: (a) SE-Jaccard (surface proxy), (b) SE-Embedding (agglomerative cosine
clustering), (c) SelfCheck (embedding cosine, k=5), (d) canonical NLI-based SE at three DeBERTa-v3
scales (435M/184M/70M), and (e) full SINdex with intra-cluster coherence weighting [Abdaljalil et al., 2025]
on200questions(Exp.27). Theconsistencyacrossallfivelevelsùeachusingfundamentallydifferentsimilarity
or weighting schemesùis itself strong evidence that the bottleneck is output uniformity rather than clustering
methodology. SINdexachievesAUROC=0.451,belowSE-Embedding(0.509); thecoherenceweightingprovides
no benefit when cos(C )?1 under homogenization. The contradiction-aware NLI variant is omitted; in single-
i
cluster regimes (|C|=1, 40% under Jaccard, 79% under embedding), all responses are semantically equivalent
andnocontradictionsexisttodetectùthevariantisstructurallyirrelevantforthesecases. The6.2╫NLImodel
scaling producing zero AUROC improvement (?=+0.010) confirms this. Cross-embedder validation (Exp 20)
rules out coupling bias. By the single-cluster equivalence argument (Sec. 2), all logit-based alternatives (Log-
TokU, PRO, Semantic Energy) produce rank-equivalent uncertainty orderings in single-cluster regimes, so our
B1 AUROC of 0.593 applies to these methods as well. Head-to-head with official codebases on multi-cluster
regimes remains future work. (3) Label validity: LLM-judge labels (LLaMA-3.2-3B) show moderate agree-
ment with TruthfulQA gold answer templates (?=0.487, 77.1%; Appendix). A human-annotated subset on
model-specific responses would further strengthen reliability, though the core finding (single-cluster collapse) is
label-independent. (4) Refusal filtering: TruthfulQA elicits few refusals from the open-source models tested;
we did not filter refusals. On commercial models with aggressive safety filters, refusals could inflate SCR by
producing deterministic ôI canÆt answer thatö responsesùthis would represent a distinct (moderation-induced)
source of homogenization on top of the DPO-driven effect we measure. (5) Scope: 3Bû14B open-source mod-
els, 4-bit quantization (within-quantization comparisons rule out quantization as confound; Exp 19 confirms
identical SCR at Q4 vs. Q8). FP16 runs would provide additional confidence. HotpotQA is small (n=100).
20

Generalizationtoclosed-sourceGPT-classmodelsandotherdomains(code,dialogue)unconfirmed. (6)B5uses
goldreferences: unavailableatinferencetime. ProductionB5requiresretrieval+NLI,likelyyieldinglowerAUC.
(7) Pointer Model: 5-fold CV on TruthfulQA only; held-out and cross-domain evaluation needed. Routing ob-
jective (incorrectness prediction) is a proxy. (8) GSM8K length confound: response length (AUROC=0.849)
outperforms entropy (0.724) on selective prediction. Logistic regression on 500 questions shows zero incremen-
tal AUROC from adding entropy to length (?=+0.002; r=0.53 between signals), confirming length dominates
for math. However, on factual QA (TruthfulQA), response length is near-chance while entropy provides the
primarysignal(0.599)ùentropyÆsvalueiscross-task generality, notGSM8K-specificgain. (9)Calibration: raw
ECE=0.182 (LLM-judge), AURC=0.701 (Exp 25); Platt scaling reduces ECE to 0.021 (88% improvement),
Brier 0.285?0.247. High-entropy ratio achieves better raw calibration (ECE=0.126). Isotonic regression, tem-
perature scaling, and cross-dataset calibration transfer not yet explored.
8.3 Future Work
(1)Diversity-preserving alignment: testwhetherentropy-awaretrainingmethods(H-DPO[Omuraetal.,2024],
SPL [Hwang et al., 2025], DivPO [Lanchantin et al., 2025]) reduce the alignment tax while maintaining align-
ment quality; this would validate the causal mechanism and provide practitioners with actionable mitigations.
(2) FP16 precision runs for additional quantization control; Q4-vs-Q8 verification (Exp 19) already shows iden-
tical SCR. (3) Head-to-head with Semantic Energy [Ma et al., 2025a], Semantic Volume, SeSE, LogTokU [Ma
et al., 2025b], PRO [Chen et al., 2025c], Semantic Entropy Probes [Kossen et al., 2024], HALT [Anonymous,
2026a,b], and HalluShift [Dasgupta et al., 2025]; SINdex (Exp. 27) already confirms that improved clustering
cannotrescuesampling-basedmethodsunderhomogenizationùthesingle-clusterequivalenceargument(Sec.2)
establishesrankequivalenceforlogit-basedmethodsinsingle-clusterregimes,whileHALT/HalluShiftÆshidden-
statesignalsmayprovideadditionaldiscriminativepowerùmatched-datacomparisononbothsingle-andmulti-
cluster partitions is needed. (4) GPT-4-class models and larger datasets. (5) Isotonic regression, temperature
scaling, and cross-dataset calibration transfer (Platt scaling already reduces ECE by 88%). (6) Retrieval+NLI
for B5. (7) End-to-end agent integration with selective prediction. (8) Human evaluation on a stratified sub-
set (single-cluster vs. multi-cluster) to validate LLM-judge labels and probe the homogenizationûcorrectness
relationship.
9 Conclusion
UCBD decomposes the problem of ôknowing what you donÆt knowö into five cognitive boundaries orches-
trated by a cheapest-first cascade. Twenty-five experiments across four datasets, three model scales, and four
model families establish three central findings: (1) the alignment taxùaligned models collapse responses into
single semantic clusters with family- and recipe-dependent severity (Qwen3-14B: 28.5%, Zephyr-DPO: 4.0%,
LLaMA-3B: 5.5%, Tulu-3-DPO: 0.5%, Mistral-7B: 1.0% SCR; robust across clustering methods, sample sizes,
temperatures,anddecodingstrategies),confirmedbybase-vs-instructablation(1.0%vs.28.5%SCR,p<10?6),
training stage ablation on two chains (Exp. 16: Mistral/Zephyr; Exp. 18: Llama/Tulu-3), decoding ablation
(Exp. 15: nucleus p=0.9 increases SCR to 33.5%), and quantization verification (Exp. 19: Q4 vs. Q8, identical
SCR); (2) uncertainty is strongly task-dependent (CohenÆs d: 0.07 on factual QA vs. 0.81 on math), validating
multi-boundary design; and (3) weakly dependent boundaries enable a cascade that matches parallel accuracy
at 57% lower cost, with selective prediction raising GSM8K accuracy from 84.4% to 93.2% at 50% coverage.
Our sampling-based comparisons use proxy (Jaccard), SINdex-style embedding (agglomerative clustering), full
SINdexwithcoherenceweighting(Exp.27: AUROC=0.451),andcanonicalNLI-basedimplementationsatthree
model scales (70Mû435M, all ?0.51 AUROC), all confirming the same findingùimproved clustering method-
ology cannot overcome the fundamental diversity collapse. The SINdex-style method reveals the tax is worse
than surface metrics suggest (79% vs. 40% SCR), and cross-embedder validation (Exp. 20) rules out coupling
bias by showing an independent embedder detects even more homogenization (92% vs. 78% SCR). The central
contribution is characterizing the response homogenization phenomenon and its implications for uncertainty
system design.
These findings are diagnostic: the framework is modular, so stronger detectors (PRO, LogTokU) can be
plugged in as they become available. Our primary contribution is the diagnosis that aligned models suppress
samplingdiversity,andthearchitecturalimplicationthatmulti-boundarycascadesaretheappropriateresponse.
Reproducibility Statement
Allexperimentsusepubliclyavailablemodels(Qwen3-14B/4B,LLaMA-3.2-3B,Llama-3.1-8B,Tulu-3-8B,Mistral-
7B,Zephyr-7BviaMLX/Ollamaat4-bitquantization)anddatasets(TruthfulQA,FreshQA,HotpotQA,GSM8K).
Greedy decoding with seed=42 ensures reproducibility. Code, data, raw results, exact clustering thresholds,
21

and decoding configurations are available at https://github.com/DigitLion/ucbd-experiment. All random
seeds, threshold sweeps, and per-question cluster assignments are included for full replication. Total compute:
?14 hours on Apple M4 Pro (64GB).
Ethics Statement
UCBD is designed to make AI agents more reliable by detecting knowledge gaps before they cause harm. We
note that uncertainty detection could be misused to selectively present only high-confidence (but potentially
biased) answers. The framework should be used to flag uncertainty for human review, not to silently suppress
uncertain outputs.
References
Samir Abdaljalil et al. SINdex: Semantic INconsistency index for hallucination detection in LLMs. arXiv
preprint arXiv:2503.05980, 2025.
AnastasiosN.AngelopoulosandStephenBates. Agentleintroductiontoconformalpredictionanddistribution-
free uncertainty quantification. arXiv preprint arXiv:2107.07511, 2021.
Anonymous. HALT:Hallucinationassessmentvialatenttesting. arXivpreprintarXiv:2601.14210,2026a. Reads
hallucination signals from intermediate representations; AUROC=0.877 on Qwen2.5-7B.
Anonymous. HALT: Hallucination assessment via log-probs as time series. arXiv preprint arXiv:2602.02888,
2026b. Models token log-probability sequences as time series; cross-model generalization across 360Mû70B.
Mohammad Gheshlaghi Azar, Mark Rowland, Bilal Piot, Daniel Guo, Daniele Calandriello, Michal Valko, and
R┤emi Munos. A general theoretical paradigm to understand learning from human feedback. In International
Conference on Artificial Intelligence and Statistics (AISTATS), 2024.
Jonathan Berant, Andrew Cai, Roy Frostig, and Percy Liang. Semantic parsing on Freebase from question-
answer pairs. In Proceedings of the 2013 Conference on Empirical Methods in Natural Language Processing
(EMNLP), pages 1533û1544, 2013.
Hao Chen et al. The invisible leash? why RLVR may or may not escape its origin. arXiv preprint
arXiv:2507.14843, 2025a.
Lihu Chen, Gerard de Melo, Fabian M. Suchanek, and Ga¿el Varoquaux. Query-level uncertainty in large
language models. arXiv preprint arXiv:2506.09669, 2025b.
Yixuan Chen et al. Probabilities are all you need: A probability-only approach to uncertainty estimation in
large language models. arXiv preprint arXiv:2511.07694, 2025c.
Karl Cobbe, Vineet Kosaraju, Mohammad Bavarian, Mark Chen, Heewoo Jun, Lukasz Kaiser, Matthias Plap-
pert,JerryTworek,JacobHilton,ReiichiroNakano,ChristopherHesse,andJohnSchulman.Trainingverifiers
to solve math word problems. arXiv preprint arXiv:2110.14168, 2021.
AbhijitDasguptaetal.HalluShift: MeasuringdistributionshiftstowardshallucinationdetectioninLLMs.arXiv
preprint arXiv:2504.09482, 2025. Internal hidden-state distribution shift; AUROC=89.9% on TruthfulQA,
single forward pass.
Yarin Gal and Zoubin Ghahramani. Dropout as a Bayesian approximation: Representing model uncertainty in
deep learning. In International Conference on Machine Learning, pages 1050û1059, 2016.
Yonatan Geifman and Ran El-Yaniv. Selective classification for deep neural networks. In Advances in Neural
Information Processing Systems (NeurIPS), 2017.
Chuan Guo, Geoff Pleiss, Yu Sun, and Kilian Q. Weinberger. On calibration of modern neural networks. In
International Conference on Machine Learning (ICML), 2017.
Ryo Hashimoto, Hidetaka Kamigaito, and Taro Watanabe. Decoding uncertainty: The impact of decod-
ing strategies for uncertainty estimation in large language models. In Findings of EMNLP 2025, 2025.
arXiv:2509.16696.
Xuan Huang et al. CoCoA: A minimum Bayes risk framework bridging confidence and consistency for uncer-
tainty quantification in LLMs. In ICLR 2026, 2026. arXiv:2502.04964.
22

EJHwang,BerneasePerez,KiranRathod,VipulKumar,SanghyunBae,andByung-GonLee.Diversepreference
learning for capabilities and alignment. arXiv preprint arXiv:2511.08594, 2025.
Saurav Kadavath et al. Language models (mostly) know what they know. arXiv preprint arXiv:2207.05221,
2022.
Robert Kirk, Ishita Mediratta, Christoforos Nalmpantis, Jelena Luketina, Eric Hambro, Edward Grefenstette,
andRobertaRaileanu. UnderstandingtheeffectsofRLHFonLLMgeneralisationanddiversity. Transactions
| on Machine | Learning | Research, 2024. | arXiv:2310.06452. |     |     |
| ---------- | -------- | --------------- | ----------------- | --- | --- |
Jannik Kossen, Yarin Gal, and Tom Rainforth. Semantic entropy probes: Robust and cheap hallucination
| detection | in LLMs. arXiv | preprint | arXiv:2406.15927, |     | 2024. |
| --------- | -------------- | -------- | ----------------- | --- | ----- |
Lorenz Kuhn, Yarin Gal, and Sebastian Farquhar. Semantic uncertainty: Linguistic invariances for uncertainty
estimation in natural language generation. In International Conference on Learning Representations, 2023.
Balaji Lakshminarayanan, Alexander Pritzel, and Charles Blundell. Simple and scalable predictive uncertainty
estimation using deep ensembles. In Advances in Neural Information Processing Systems (NeurIPS), 2017.
Jack Lanchantin, Shubham Toshniwal, Jason Weston, and Sainbayar Sukhbaatar. Diverse preference optimiza-
| tion. arXiv | preprint arXiv:2501.18101, |     | 2025. |     |     |
| ----------- | -------------------------- | --- | ----- | --- | --- |
Jixuan Leng, Chengsong Huang, Banghua Zhu, and Jiantao Huang. Taming overconfidence in LLMs: Reward
| calibration | in RLHF. | In ICLR 2025, | 2025. arXiv:2410.09724. |     |     |
| ----------- | -------- | ------------- | ----------------------- | --- | --- |
Chen Li et al. CounterRefine: Retrieval-grounded constrained refinement for hallucination mitigation. arXiv
| preprint | arXiv:2603.16091, | 2026. |     |     |     |
| -------- | ----------------- | ----- | --- | --- | --- |
Zhen Li et al. UniCR: Unified conformal risk control for multiple uncertainty evidence in LLM uncertainty
| quantification. | arXiv preprint | arXiv:2505.10000, |     | 2025. |     |
| --------------- | -------------- | ----------------- | --- | ----- | --- |
Yong Lin, Hangyu Tan, Bizhe Zheng, et al. Mitigating the alignment tax of RLHF. In Proceedings of EMNLP
| 2024, 2024. | arXiv:2309.06256. |     |     |     |     |
| ----------- | ----------------- | --- | --- | --- | --- |
Huan Ma, Jiadong Pan, Jing Liu, Yan Chen, Joey Tianyi Zhou, Guangyu Wang, Qinghua Hu, Hua Wu,
ChangqingZhang,andHaifengWang. Semanticenergy: DetectingLLMhallucinationbeyondentropy. arXiv
| preprint | arXiv:2508.14496, | 2025a. |     |     |     |
| -------- | ----------------- | ------ | --- | --- | --- |
Huan Ma et al. Estimating LLM uncertainty with evidence. arXiv preprint arXiv:2502.00290, 2025b.
Potsawee Manakul, Adian Liusie, and Mark J. F. Gales. SelfCheckGPT: Zero-resource black-box hallucination
detection for generative large language models. In Conference on Empirical Methods in Natural Language
| Processing | (EMNLP), | 2023. |     |     |     |
| ---------- | -------- | ----- | --- | --- | --- |
MotokiOmura,YutakaMatsuo,andShoKatsumata. Entropycontrollabledirectpreferenceoptimization. arXiv
| preprint | arXiv:2411.07595, | 2024. |     |     |     |
| -------- | ----------------- | ----- | --- | --- | --- |
Long Ouyang, Jeffrey Wu, Xu Jiang, Diogo Almeida, Carroll Wainwright, Pamela Mishkin, Chong Zhang,
Sandhini Agarwal, Katarina Slama, Alex Ray, et al. Training language models to follow instructions with
human feedback. Advances in Neural Information Processing Systems, 35:27730û27744, 2022.
Amir Saeidi, Shivam Hossain, Rajan Bobbili, et al. Insights into alignment: Evaluating DPO and its variants
| across multiple | tasks. | arXiv preprint | arXiv:2404.14723, |     | 2024. |
| --------------- | ------ | -------------- | ----------------- | --- | ----- |
Tal Schuster et al. Semantic self-distillation for language model uncertainty. arXiv preprint arXiv:2602.04577,
2026.
Melanie Sclar et al. Prompt multiplicity: Measuring consistency under paraphrased prompts. arXiv preprint
| arXiv:2602.00723, | 2025. |     |     |     |     |
| ----------------- | ----- | --- | --- | --- | --- |
NataliaStanusch,RaziyeBuseCetin,SalvatoreRomano,MiaziaSchueler,andMeretBaumgartner. DSA,AIA,
andLLMs: ApproachestoconceptualizingandauditingmoderationinLLM-basedchatbotsacrosslanguages
and interfaces in the electoral contexts. arXiv preprint arXiv:2509.19890, 2025.
Th┤eo Trouillon et al. Complex embeddings for simple link prediction. In Proceedings of ICML 2016, pages
| 2071û2080, | 2016. |     |     |     |     |
| ---------- | ----- | --- | --- | --- | --- |
23

Lewis Tunstall, Edward Beeching, Nathan Lambert, Nazneen Rajani, Kashif Rasul, Younes Belkada, Shengyi
Huang, Leandro von Werra, Cl┤ementine Fourrier, Nathan Habib, et al. Zephyr: Direct distillation of LM
| alignment. | arXiv | preprint | arXiv:2310.16944, |     | 2023. |     |     |
| ---------- | ----- | -------- | ----------------- | --- | ----- | --- | --- |
Artem Vazhentsev et al. Token-level density-based uncertainty quantification methods for eliciting truthfulness
of large language models. In Proceedings of NAACL 2025, pages 2246û2262, 2025. arXiv:2502.14427.
Paul Viola and Michael Jones. Rapid object detection using a boosted cascade of simple features. In IEEE
| Conference | on  | Computer | Vision | and | Pattern Recognition |     | (CVPR), 2001. |
| ---------- | --- | -------- | ------ | --- | ------------------- | --- | ------------- |
Pragatheeswaran Vipulanandan et al. Semantic uncertainty quantification of hallucinations in LLMs: A quan-
tum tensor network based method. arXiv preprint arXiv:2601.20026, 2026.
Tu Vu, Mohit Iyyer, Xuezhi Wang, Noah Constant, Jerry Wei, Jason Wei, Chris Tar, Yun-Hsuan Sung, Denny
Zhou, Quoc Le, and Thang Luong. FreshLLMs: Refreshing large language models with search engine aug-
| mentation. | In  | Findings | of ACL | 2024, | 2024. arXiv:2310.03214. |     |     |
| ---------- | --- | -------- | ------ | ----- | ----------------------- | --- | --- |
Ziyu Wan et al. ReMA: Learning to meta-think for LLMs with multi-agent reinforcement learning. arXiv
| preprint | arXiv:2503.09501, |     | 2025. |     |     |     |     |
| -------- | ----------------- | --- | ----- | --- | --- | --- | --- |
Yibo Wang et al. HalluGuard: Detecting hallucinations via NTK/jacobian proxies. arXiv preprint
| arXiv:2601.18753, |     | 2025. |     |     |     |     |     |
| ----------------- | --- | ----- | --- | --- | --- | --- | --- |
JiancongXiao, Ziniu Li, Xingyu Xie, Emily Getzen, CongFang, QiLong, andWeijieJ. Su. Onthe algorithmic
bias of aligning large language models with RLHF: Preference collapse and beyond. Journal of the American
| Statistical | Association, |     | 2024. | arXiv:2405.16455. |     |     |     |
| ----------- | ------------ | --- | ----- | ----------------- | --- | --- | --- |
Yasin Abbasi Yadkori, Gautam Kamath, Rishabh Agarwal, and Borja Balle. Mitigating LLM hallucinations
| via conformal |     | abstention. | arXiv | preprint | arXiv:2404.07594, |     | 2024. |
| ------------- | --- | ----------- | ----- | -------- | ----------------- | --- | ----- |
Jenny Zhang, Aaron Yu, Sheng Chong, Anthony Sicilia, Michael Tomz, Christopher D. Manning, and Tianyi
Shi. Verbalized sampling: How to mitigate mode collapse and unlock LLM diversity. arXiv preprint
| arXiv:2510.01171, |     | 2025a. |     |     |     |     |     |
| ----------------- | --- | ------ | --- | --- | --- | --- | --- |
Tunyu Zhang, Haizhou Shi, Yibin Wang, et al. TokUR: Token-level uncertainty estimation for large language
| model reasoning. |     | arXiv | preprint | arXiv:2505.11737, |     | 2025b. |     |
| ---------------- | --- | ----- | -------- | ----------------- | --- | ------ | --- |
Wei Zhang et al. Semantic energy: Detecting LLM hallucination beyond entropy. arXiv preprint
| arXiv:2508.14496, |     | 2025c. |     |     |     |     |     |
| ----------------- | --- | ------ | --- | --- | --- | --- | --- |
Yujia Zhou et al. Metacognitive retrieval-augmented large language models. In Proceedings of WWW 2024,
2024. arXiv:2402.11626.
Yongfu Zhu. Uncertainty under the curve: A sequence-level entropy area metric for reasoning LLM. arXiv
| preprint | arXiv:2508.20384, |     | 2025. |     |     |     |     |
| -------- | ----------------- | --- | ----- | --- | --- | --- | --- |
24

| A Implementation |     | Details | and Additional | Analysis |     |
| ---------------- | --- | ------- | -------------- | -------- | --- |
Statistical summary of key comparisons. Table 21 consolidates statistical tests across all pairwise com-
| parisons reported | in the main | text. |     |     |     |
| ----------------- | ----------- | ----- | --- | --- | --- |
Table 21: Statistical summary of all key comparisons. Tests: DeLong (AUROC), Wilcoxon (paired distribu-
| tions), bootstrap | (CIs). All          | p-values two-sided. |             |               |             |
| ----------------- | ------------------- | ------------------- | ----------- | ------------- | ----------- |
|                   | Comparison          |                     | Exp Effect  | p-value       | Test        |
|                   | B1vsSE-JaccardAUROC |                     | 12 ?=+0.051 | 0.040*        | DeLong+Holm |
|                   | B1vsSE-EmbedAUROC   |                     | 12 ?=+0.057 | 0.033*        | DeLong+Holm |
|                   | B1vsSelfCheckAUROC  |                     | 12 ?=+0.011 | 0.65ns        | DeLong      |
|                   | B1vsNLI-SE(large)   |                     | 12 ?=+0.088 | [0.419,0.594] | BootstrapCI |
<10?6
|     | BasevsInstructSCR |     | 13 1.0%vs28.5% |         | Wilcoxon    |
| --- | ----------------- | --- | -------------- | ------- | ----------- |
|     | Base?SFT(Zephyr)  |     | 16 ?NC=?0.64   | 0.002   | Wilcoxon    |
|     | SFT?DPO(Zephyr)   |     | 16 ?NC=?0.63   | 0.0001  | Wilcoxon    |
|     | Base?SFT(Tulu-3)  |     | 18 ?NC=?0.45   | 0.00004 | Wilcoxon    |
|     | SFT?DPO(Tulu-3)   |     | 18 ?NC=+0.29   | 0.008   | Wilcoxon    |
|     | CascadevsParallel |     | 3 TOSTequiv.   | 0.498   | Equivalence |
Per-question agreement. B1 and SE make partially independent errors (median-split, n=790): 37.3%
both correct, 28.7% both wrong, 17.8% B1-only, 16.1% SE-onlyùsupporting cascade design.
Semantic entropy. WeclusterN=10responses(T=1.0,max40tokens;sensitivitytomaxtokenstestedin
Exp.17: SCR32%?8%at200tokens,confirmingrobustness)bybigramJaccard(threshold0.4)andembedding
cosine (threshold 0.85, Qwen3-Embedding). NLI-based SE at three DeBERTa-v3 scales (435M/184M/70M)
with bidirectional entailment (threshold 0.5) on 200q: AUROC=0.511/0.512/0.501ùall near chance. Cluster
statistics nearly identical across 6.2╫ scaling: large 4.68 mean clusters (9.0% single-rate), base 5.44 (6.0%),
xsmall 5.42 (6.5%). Jaccard: 3.58 mean, 28.5% single-rate. Bottleneck is response homogenization, not NLI
quality.
Length control (factual QA). Nested logistic regression (1 df LR tests): TruthfulQA (n=200) p=0.379,
HotpotQA (n=100) p=0.910, combined (n=300) p=0.104. Entropy adds no significant incremental value over
length on factual QA. On GSM8K, length dominates (r=0.53, AUROC 0.849 vs. 0.724). EntropyÆs value is
| cross-task generality. |     |     |     |     |     |
| ---------------------- | --- | --- | --- | --- | --- |
Threshold sensitivity. SE-Jaccard AUROC across thresholds ? ? {0.2,0.3,0.4,0.5,0.6}: 0.515, 0.538,
0.548,0.558,0.561;SCRmonotonicallydecreases(59%?28.7%)butremains>28%atthestrictestthreshold. B1
(0.599) outperforms SE at all thresholds. Embedding clustering (n=200): SCR ranges from 95.5% (cos?0.70)
to18.0%(cos?0.95);bestSEAUROC=0.609atcos?0.85(matchingB1butat71.5%SCR).Thealignmenttax
persists across the entire threshold range for both methods. B1 is threshold-free and consistently competitive.
Sample size sensitivity. Single-clustercollapse: N=3: 46.3%,N=5: 41.9%,N=7/10: 40.0%. SE-Jaccard
AUROC: 0.541/0.548/0.544/0.548 (plateaus at ?0.55). B1 is constant at 0.599 (independent of sampling).
Collapse is a property of the aligned modelÆs response distribution, not insufficient sampling.
Temperature sensitivity. Single-cluster collapse rates across temperatures (N=5, 50 questions): T=0.3:
62.0%,T=0.7: 46.0%,T=1.0: 42.0%,T=1.5: 38.0%(meanclusters: 1.56,1.88,2.16,2.42). Highertemperature
reduces but does not eliminate homogenizationùeven at T=1.5, 38% of questions collapse to a single cluster.
SelfCheckGPT. 1?mean(cos(e ,e )) for k=5 samples (Qwen3-Embedding).
|     |     | greedy | sample |     |     |
| --- | --- | ------ | ------ | --- | --- |
i
LLM-judge. Cross-family LLaMA-3.2-3B (Ollama, T=0), 790q, 4.4 min. Distribution: 54.6% correct,
45.4% incorrect. Gold validation against TruthfulQA templates (200q, n=175 clear): 77.1% agreement,
?=0.487. SE AUROC nearly identical under both labels (gold: 0.524, LLM-judge: 0.533, ?=0.009). Single-
| cluster collapse | is label-independent. |     |     |     |     |
| ---------------- | --------------------- | --- | --- | --- | --- |
Calibration (Exp 25). Raw ECE=0.182; high-entropy ratio ECE=0.126 (best raw feature). Platt scaling
(5-foldCV)reducesto0.021(88%improvement),Brier0.285?0.247. AURC=0.701onTruthfulQA(PRR@50%:
0.043û0.074). RLHF compresses entropy into narrow range (mean=0.19, max=0.64).
Environment. Python 3.14, MLX 0.25+, Ollama 0.9+. M4 Pro 64GB. ?10h total compute. Repo:
https://github.com/DigitLion/ucbd-experiment.
25
