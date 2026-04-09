<!--
  AI Triad Research Project — Document Snapshot
  Title      : 2506.10408v1
  Source     : 
  Type       : pdf
  Captured   : 2026-04-09
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# 2506.10408v1

> **Snapshot captured:** 2026-04-09
> **Source:** 
> **Type:** pdf

---
Reasoning RAG via System 1 or System 2: A Survey on Reasoning Agentic
|     |     | Retrieval-Augmented |     |     | Generation | for | Industry |     | Challenges |     |     |     |
| --- | --- | ------------------- | --- | --- | ---------- | --- | -------- | --- | ---------- | --- | --- | --- |
JintaoLiang1, GangSu2, HuifengLin3, YouWu3, RuiZhao5,6 ZiyueLi4?
and
1BeijingUniversityofPostsandTelecommunications
2UniversityofGeorgia
3SouthChinaUniversityofTechnology
4TechnicalUniversityofMunich,UniversityofCologne
5SenseTimeResearch
6QingyuanResearchInstitute,ShanghaiJiaotongUniversity
5202 nuJ 21  ]IA.sc[  1v80401.6052:viXra ljt2021@bupt.edu.cn,{gangsuedu,huifeng.work,wuyouscut}@gmail.com,zhaorui@sensetime.com,
zlibn@wiso.uni-koeln.de
Abstract ity to provide accurate, up-to-date information in dynamic
[Rawte
|                     |     |     |            |     |           | or knowledge-intensive |       |     | tasks       | et                  | al., 2023; | Zhang |
| ------------------- | --- | --- | ---------- | --- | --------- | ---------------------- | ----- | --- | ----------- | ------------------- | ---------- | ----- |
| Retrieval-Augmented |     |     | Generation |     | (RAG) has |                        |       |     |             |                     |            |       |
|                     |     |     |            |     |           | et al., 2023;          | Huang | et  | al., 2025]. | Retrieval-Augmented |            |       |
emergedasapowerfulframeworktoovercomethe
|     |     |     |     |     |     | Generation | (RAG) | [Chen | et al., | 2024; Lewis | et  | al., 2020; |
| --- | --- | --- | --- | --- | --- | ---------- | ----- | ----- | ------- | ----------- | --- | ---------- |
knowledgelimitationsofLargeLanguageModels
|     |     |     |     |     |     | Gao et | al., 2023] | has attracted |     | significant | attention | as a |
| --- | --- | --- | --- | --- | --- | ------ | ---------- | ------------- | --- | ----------- | --------- | ---- |
(LLMs) by integrating external retrieval with promisingapproachtoovercometheknowledgelimitations
| language | generation. |     | While | early RAG | systems |                                       |     |     |     |     |                   |     |
| -------- | ----------- | --- | ----- | --------- | ------- | ------------------------------------- | --- | --- | --- | --- | ----------------- | --- |
|          |             |     |       |           |         | ofLLMsresultingfromstaticpretraining. |     |     |     |     | Byintegratingrel- |     |
basedonstaticpipelineshaveshowneffectiveness
evantinformationfromexternalknowledgebasesorsearch
inwell-structuredtasks,theystruggleinreal-world
|           |           |         |     |            |         | engines, | RAG      | enhances   | factual  | accuracy | and broadens | the        |
| --------- | --------- | ------- | --- | ---------- | ------- | -------- | -------- | ---------- | -------- | -------- | ------------ | ---------- |
| scenarios | requiring | complex |     | reasoning, | dynamic |          |          |            |          |          |              |            |
|           |           |         |     |            |         | model�s  | temporal | and domain | coverage | [Zhao    | et           | al., 2024; |
retrieval,andmulti-modalintegration. Toaddress Li et al., 2024a]. Traditional RAG methods have demon-
| these | challenges, | the | field | has shifted | toward |     |     |     |     |     |     |     |
| ----- | ----------- | --- | ----- | ----------- | ------ | --- | --- | --- | --- | --- | --- | --- |
stratedstrongperformancewhenqueriesarewell-formedand
| Reasoning | Agentic | RAG, | a paradigm |     | that embeds |     |     |     |     |     |     |     |
| --------- | ------- | ---- | ---------- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- |
thenecessaryinformationisreadilyavailableintheretrieved
| decision-making |     | and | adaptive | tool | use directly |     |     |     |     |     |     |     |
| --------------- | --- | --- | -------- | ---- | ------------ | --- | --- | --- | --- | --- | --- | --- |
context.
| intotheretrievalprocess. |     |     | Inthispaper,wepresent |     |     |     |     |     |     |     |     |     |
| ------------------------ | --- | --- | --------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
DespitetheeffectivenessofbasicRAGmethods,theyoften
| a comprehensive |     | review | of  | Reasoning | Agentic |     |     |     |     |     |     |     |
| --------------- | --- | ------ | --- | --------- | ------- | --- | --- | --- | --- | --- | --- | --- |
strugglewhenappliedtoreal-world,industrial-scaleapplica-
RAGmethods,categorizingthemintotwoprimary
|          |            |     |            |       |        | tionsinvolvingcomplexandheterogeneousdata. |     |     |     |     | Forexample, |     |
| -------- | ---------- | --- | ---------- | ----- | ------ | ------------------------------------------ | --- | --- | --- | --- | ----------- | --- |
| systems: | predefined |     | reasoning, | which | follow |                                            |     |     |     |     |             |     |
inmulti-documentscenarios,relevantinformationisspread
| fixed | modular | pipelines | to boost | reasoning, | and |     |     |     |     |     |     |     |
| ----- | ------- | --------- | -------- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
acrosssources,requiringnotjustretrievalbutalsocoherent
agenticreasoning,wherethemodelautonomously
|              |                |                  |            |        |            |               | [Wang     | et al.,  |      | et al.,  | 2024b].       |         |
| ------------ | -------------- | ---------------- | ---------- | ------ | ---------- | ------------- | --------- | -------- | ---- | -------- | ------------- | ------- |
|              |                |                  |            |        |            | synthesis     |           | 2025;    | Wang |          |               | Naively |
| orchestrates |                | tool interaction |            | during | inference. |               |           |          |      |          |               |         |
|              |                |                  |            |        |            | concatenating | retrieved | passages |      | can lead | to fragmented | or      |
| We analyze   | representative |                  | techniques |        | under both |               |           |          |      |          |               |         |
contradictoryresponses,particularlyindomainslikelegalor
paradigms,coveringarchitecturaldesign,reasoning
|             |     |                    |     |     |             | biomedicalQAwheremulti-hopreasoningiscritical. |     |     |     |     |     | Addi- |
| ----------- | --- | ------------------ | --- | --- | ----------- | ---------------------------------------------- | --- | --- | --- | --- | --- | ----- |
| strategies, | and | tool coordination. |     |     | Finally, we |                                                |     |     |     |     |     |       |
tionally,mostRAGsystemsarelimitedtotext-onlyprocessing
discusskeyresearchchallengesandproposefuture
andcannotnativelyhandlemulti-modalinputssuchastables,
directionstoadvancetheflexibility,robustness,and
|               |     |              |         |     |          | charts,orimages[Maetal.,2024;Yuetal.,2025]. |     |     |     |     |     | Thislimits |
| ------------- | --- | ------------ | ------- | --- | -------- | ------------------------------------------- | --- | --- | --- | --- | --- | ---------- |
| applicability |     | of reasoning | agentic | RAG | systems. |                                             |     |     |     |     |     |            |
theirabilitytooperateindata-richenvironmentslikeenterprise
Ourcollectionoftherelevantresearcheshasbeen
intelligence,scientificreporting,ortechnicalsupport,where
organizedintoaGithubRepository.
visualandstructureddataplayacentralrole[Linetal.,2023a;
Yuetal.,2024].
1 Introduction ToaddresstheselimitationsofbasicRAGinhandlingcom-
plex,real-worldtasks,recentresearchhasturnedtoAgentic
| Large Language |     | Models | (LLMs) | [Singh, | 2023; Zhao et |     |     |     |     |     |     |     |
| -------------- | --- | ------ | ------ | ------- | ------------- | --- | --- | --- | --- | --- | --- | --- |
RAG[Ravuruetal.,2024],aparadigmthattightlyintegrates
| al., 2023; | Zhu et | al., 2024] | have demonstrated |     | remarkable |     |     |     |     |     |     |     |
| ---------- | ------ | ---------- | ----------------- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- |
capabilities in natural language understanding and gener- retrievalwithreasoninganddecision-making. Unlikestatic
pipelines,AgenticRAGtreatsretrievalnotasaone-offpre-
| ation, enabling | a   | wide array | of  | applications | from open- |            |       |          |          |                   |     |        |
| --------------- | --- | ---------- | --- | ------------ | ---------- | ---------- | ----- | -------- | -------- | ----------------- | --- | ------ |
|                 |     |            |     |              |            | processing | step, | but as a | dynamic, | context-sensitive |     | opera- |
domainquestion-answer(QA)totask-specificdialoguesys-
|                |     |           |           |          |            | tionguidedbythemodel�songoingreasoningprocess. |     |     |     |     |     | This |
| -------------- | --- | --------- | --------- | -------- | ---------- | ---------------------------------------------- | --- | --- | --- | --- | --- | ---- |
| tems. However, |     | LLMs rely | on static | training | data, mak- |                                                |     |     |     |     |     |      |
reasoning-centricperspectiveiscrucialforapplicationsthat
| ing them | prone to | hallucinations |     | and limiting | their abil- |     |     |     |     |     |     |     |
| -------- | -------- | -------------- | --- | ------------ | ----------- | --- | --- | --- | --- | --- | --- | --- |
demandmulti-stepproblemsolving,adaptiveinformationac-
?Correspondingauthor. quisition,andtool-assistedsynthesis. Withinthisparadigm,as

Predefined Reasoning use throughout the reasoning process. Instead of executing
|     |     |     |     |     |     |     | a fixed plan,  | the       | model    | identifies | knowledge   |               | gaps, formu- |
| --- | --- | --- | --- | --- | --- | --- | -------------- | --------- | -------- | ---------- | ----------- | ------------- | ------------ |
|     |     |     |     |     |     |     | lates queries, | retrieves |          | external   | information | via           | tools such   |
|     |     |     |     |     |     |     | as search      | engines   | or APIs, | and        | integrates  | the retrieved | con-         |
Design Follow tents into an evolving solution. This dynamic interplay of
reasoningandtooluseenablesthesystemtotacklecomplex,
multi-turntasksthatrequireiterativerefinementandadaptive
Human LLM informationsynthesis. Therearetwoprimarymethodsforim-
|     |     |     |     |     |     |     | plementingagenticreasoning. |     |     | Thefirstisprompt-basedmeth- |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------------------------- | --- | --- | --------------------------- | --- | --- | --- |
ods,whichleveragesthein-contextreasoningandinstruction-
followingcapabilitiesofpretrainedLLMs[Yaoetal.,2023;
Agentic Reasoning
|     |     |     |     |     |     |     | Pressetal.,2023;Lietal.,2025a]. |     |     |     | Inthissetting,themodel |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------------------------------- | --- | --- | --- | ---------------------- | --- | --- |
Tool Calling
isguidedbycarefullycraftedpromptsorembeddedcontrol
tokensthatinstructitwhentoretrieve,whatactionstotake,
|     |     |     |     |     |     |     | andhowtointegrateexternalinformation. |            |           |        |     | Thesemethodsre-  |     |
| --- | --- | --- | --- | --- | --- | --- | ------------------------------------- | ---------- | --------- | ------ | --- | ---------------- | --- |
|     |     |     |     |     |     |     | quire no                              | additional | training, | making |     | them lightweight | and |
Reasoning External Tools adaptable across tasks. The second paradigm is training-
basedmethods,wheremodelsareexplicitlyoptimizedthrough
|     |     |     |     |     |     |     | reinforcement | learning, |        | to determine |            | when and | how to in-    |
| --- | --- | --- | --- | --- | --- | --- | ------------- | --------- | ------ | ------------ | ---------- | -------- | ------------- |
|     |     |     |     |     |     |     | voke external | tools     | [Jiang | et           | al., 2025; | Jin      | et al., 2025; |
Retrieved Information Zhengetal.,2025]. Thisparadigmenablesmorefine-grained
andstrategictoolusage,enablingmodelstolearnlong-term
Figure1:OverviewoftwomajortypesofreasoningAgenticSystems. planning and develop retrieval policies tailored to complex
|     |     |     |     |     |     |     | tasks. Owing | to    | its autonomy |             | and adaptability, |                | agentic rea- |
| --- | --- | --- | --- | --- | --- | --- | ------------ | ----- | ------------ | ----------- | ----------------- | -------------- | ------------ |
|     |     |     |     |     |     |     | soning has   | shown | strong       | performance |                   | in open-domain | QA,          |
showninFigure 1,twomajortypesofreasoningagenticsys- scientificreasoning,andmulti-stagedecision-makingscenar-
| temshaveemergedbasedonhowcontrolanddecision-making |     |     |     |     |     |     | ios. |     |     |     |     |     |     |
| -------------------------------------------------- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- |
arehandled: predefinedreasoning,whichfollowstructured, PerspectiveofCognitiveScience-System1andSystem
rule-basedplanswithfixedpipelinestoboostreasoningfor
|           |                 |     |             |            |       |     | 2: To further | contextualize |     | predefined |     | and agentic | reason- |
| --------- | --------------- | --- | ----------- | ---------- | ----- | --- | ------------- | ------------- | --- | ---------- | --- | ----------- | ------- |
| retrieval | and generation; |     | and agentic | reasoning, | where | the |               |               |     |            |     |             |         |
ingwithinthedual-processtheoryofcognition�commonly
modelactivelymonitorsitsreasoningprocessanddetermines referredtoasSystem1andSystem2thinking[Yangetal.,
whenandhowtoretrieveorinteractwithexternaltools. These 2024a;Lietal.,2025b]�wecandrawananalogybetween
two workflows form the basis of Reasoning Agentic RAG, theseRAGparadigmsandhumancognitivemodes.
whichunifiesstructuredandautonomousapproachesformore
|     |     |     |     |     |     |     | � PredefinedreasoningresemblesSystem1thinking: |     |     |     |     |     | fast, |
| --- | --- | --- | --- | --- | --- | --- | ---------------------------------------------- | --- | --- | --- | --- | --- | ----- |
intelligent,context-awareretrieval-augmentedreasoning.
structured,andefficient,relyingonpredefinedheuristics
PredefinedreasoningadoptsstructuredandmodularRAG
andmodularworkflowsthatmirrorhabitualorrule-based
pipelineswheretheretrievalandreasoningstepsareexplicitly
|                                         |     |     |     |                |     |     | cognition. |           | While | this enables | rapid     | execution   | and pre- |
| --------------------------------------- | --- | --- | --- | -------------- | --- | --- | ---------- | --------- | ----- | ------------ | --------- | ----------- | -------- |
| designed,followingfixedcontrolpipeline. |     |     |     | Theseworkflows |     |     |            |           |       |              |           |             |          |
|                                         |     |     |     |                |     |     | dictable   | behavior, |       | it often     | lacks the | flexibility | to adapt |
typicallydecomposetasksintodiscretecomponentssuchas beyonditsdesign.
queryreformulation,documentretrieval,re-ranking,andan-
� Incontrast,agenticreasoningalignsmorecloselywith
| swersynthesis, |     | executedinalinearororchestratedfashion. |     |     |     |     |     |     |     |     |     |     |     |
| -------------- | --- | --------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Ingeneral, predefinedreasoningspansseveralarchitectural System2thinking:slow,deliberative,andadaptive.Here,
variants: route-based methods selectively trigger retrieval the LLM actively engages in reasoning, planning, and
decision-making,dynamicallyleveragingexternaltools
| based on | context | or model | uncertainty, | such | as low | confi- |     |     |     |     |     |     |     |
| -------- | ------- | -------- | ------------ | ---- | ------ | ------ | --- | --- | --- | --- | --- | --- | --- |
andretrievedknowledgetoaddresscomplex,noveltasks.
dencescoresorambiguousintermediateoutputs[Wangetal.,
Thisreflectivemodeallowsthemodeltoidentifygaps,
2024a];loop-basedmethodsenablelimitediterationthrough
retrieval-feedback cycles, supporting multiple rounds of re- reassessstrategies,andadjustitsbehavior�traitscharac-
finement[Asaietal., 2023;Yangetal., 2024b]; tree-based teristicofconscious,analyticalhumanreasoning.
methodsorganizeinformationhierarchicallytosupportstruc-
Byframingtheseparadigmsthroughthelensofcognitive
|     |     | [Sarthi |     |     | 2025]; |     |     |     |     |     |     |     |     |
| --- | --- | ------- | --- | --- | ------ | --- | --- | --- | --- | --- | --- | --- | --- |
tured exploration et al., 2024; Hu et al., and systems, we highlight the trade-off between efficiency and
hybrid-modular frameworks compose specialized modules adaptability,andthegrowingcapacityofagenticRAGtoemu-
intoaflexiblebutstillrule-drivenworkflow[Jeongetal.,2024; latemoresophisticated,human-likeproblemsolving. Table1
| Gao et al., | 2024]. | These | workflows | prioritize | control | and |     |     |     |     |     |     |     |
| ----------- | ------ | ----- | --------- | ---------- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
alignspredefinedandagenticreasoningwiththedual-system
modularity,makingthemsuitablefortasksrequiringefficient
theoryfromcognitivescience,illustratingtheirrespectivecon-
computation and customization. However, their reasoning trolstructuresandbehavioralcharacteristics.
remainsconstrainedbypredesignedexecutionpaths,limiting Thepapersystematicallyreviewsandanalyzesthecurrent
flexibilityinevolvingandopen-endedtasks. research approaches and future development paths of Rea-
AgenticreasoningrepositionstheLLMasanactivedeci- soning Agentic RAG, summarizing them into two primary
sionmaker,thatautonomouslyorchestratesretrievalandtool technicalparadigms. Theremainderofthepaperisorganized

|     | SystemType | ReasoningWorkflow   |     | Description                             |     |     |     |
| --- | ---------- | ------------------- | --- | --------------------------------------- | --- | --- | --- |
|     | System1    | PredefinedReasoning |     | Structured,modular,rule-basedexecution. |     |     |     |
System2 AgenticReasoning Autonomous,adaptive,model-drivendecision-making.
Table1:Cognitivesystemalignmentofreasoningworkflows.
asfollows: Section2introducesrelatedwork;Section3and Despitetheireffectiveness,basicRAGworkflowsarelim-
Section 4 dive into the two types of reasoning workflows itedbystaticcontrollogicandlacktheabilitytoreflect,adapt,
withinAgenticRAG,predefinedreasoningandagenticreason- orassessthesufficiencyofretrievedinformation. Thesecon-
ing,respectively. Section5outlinesfutureresearchdirections, straints reduce their suitability for tasks requiring iterative
andSection6concludesthepaper. reasoning,tooluse,ormulti-modalintegration. Thus,Agentic
RAGhasproposedtoembedreasoninganddecision-making
|     |     |     |     | into the retrieval | process. | This work | focuses on reasoning |
| --- | --- | --- | --- | ------------------ | -------- | --------- | -------------------- |
AgenticRAGapproachesthatenablemoreautonomousand
context-awareinformationprocessing.
|     |     |     |     | 2.2 ReasoningAgenticRAG |     |     |     |
| --- | --- | --- | --- | ----------------------- | --- | --- | --- |
Theyear2025ismarkedastheyearofagenticAI,withappli-
cationsemergingsuchasagenticLLMsandsoon[Ruanet
|     |     |     |     | al.,2023;Kongetal.,2024;Zhangetal.,]. |        |                    | Recentadvances        |
| --- | --- | --- | --- | ------------------------------------- | ------ | ------------------ | --------------------- |
|     |     |     |     | in RAG have                           | seen a | shift from static, | rule-driven retrieval |
Figure2:DistributedWorksofReasoningAgenticRAG.
pipelinestowarddynamic,reasoning-drivenarchitectures,col-
lectivelyreferredtoasReasoningAgenticRAG.Thesesystems
|     |     |     |     | embed decision-making |     | into the retrieval | process, enabling |
| --- | --- | --- | --- | --------------------- | --- | ------------------ | ----------------- |
modelstoactivelydeterminewhen,what,andhowtoretrieve
2 RelatedWork
|     |     |     |     | basedontheirinternalreasoningtrajectory. |     |     | AsshowninFig- |
| --- | --- | --- | --- | ---------------------------------------- | --- | --- | ------------- |
2.1 BasicRAG
|     |     |     |     | ure 3, Reasoning | Agentic | RAG approaches | can be broadly |
| --- | --- | --- | --- | ---------------- | ------- | -------------- | -------------- |
Retrieval-Augmented Generation (RAG) was introduced to categorized into two paradigms: predefined reasoning and
| overcomethestaticknowledgelimitationsofLLMsbyinte- |     |     |     | agenticreasoning. |     |     |     |
| -------------------------------------------------- | --- | --- | --- | ----------------- | --- | --- | --- |
gratingexternalretrievalmechanismsduringinference[Chen Predefined reasoning depends on structured, rule-based
etal.,2024;Gaoetal.,2023]. NaiveRAGmethodsrepresent pipelineswheretheretrievalandreasoningstagesaremodu-
theearliestimplementations,typicallyusingsparseretrieval larizedandfixedinadvance. Theseworkflowsofteninclude
techniqueslikeBM25[Robertsonetal.,2009]tofetchdoc- componentsforqueryreformulation,documentretrieval,re-
umentsbasedonkeywordoverlap[Maetal.,2023]. While ranking,andresponsegeneration,coordinatedbystaticcontrol
|     |     |     |     | logic. RAGate[Wangetal.,2024a]exemplifiesroute-based |     |     |     |
| --- | --- | --- | --- | ---------------------------------------------------- | --- | --- | --- |
efficientforsimplefactoidqueries,theseapproachesoffered
limited semantic understanding, thus often retrieving noisy designs,whereretrievalisconditionallytriggeredbasedonthe
or redundant content and failing to reason across multiple contextormodelconfidence,enablingthesystemtoskipun-
sources. necessaryoperationsandfocusonknowledge-intensiveinputs.
TheemergenceofAdvancedRAGandModularRAGwas Self-RAG[Asaietal.,2023]introducesloop-basedreasoning
byenablingthemodeltoself-reflectanditerativelyrefineits
aimedataddressingkeylimitationsoftheNaiveRAG,par-
|     |     |     |     |     |     | [Sarthi | 2024] |
| --- | --- | --- | --- | --- | --- | ------- | ----- |
ticularlyintermsofretrievalprecision,informationintegra- responses, while RAPTOR et al., leverages a
tion, and system flexibility [Gao et al., 2023]. Advanced recursivetreestructuretohierarchicallysummarizeandorga-
RAGimprovesretrievalqualitythroughtechniquessuchas nizeretrievedcontent,supportingmulti-hopandabstractive
dense semantic matching, re-ranking, and multi-hop query- reasoning. Building on these foundations, more advanced
frameworkslikeAdaptive-RAG[Jeongetal.,2024]combine
| ing, while | also introducing | refined indexing | strategies | like |     |     |     |
| ---------- | ---------------- | ---------------- | ---------- | ---- | --- | --- | --- |
fine-grainedchunkingandmetadata-awareretrieval. Modular dynamicroutingandretrievaladaptation,enablingmodelsto
RAGrethinkstheNaiveRAGbybreakingdowntheend-to- select optimal reasoning paths. Modular-RAG [Gao et al.,
endprocessofindexing,retrieval,andgenerationintodiscrete, 2024] extends this idea by dividing the RAG pipeline into
configurablemodules. Thisdesignallowsforgreaterarchitec- interoperablemoduleslikeretrievers, rerankersandgenera-
turalflexibilityandenablessystemdeveloperstoincorporate tors,whichcanbeflexiblycomposedintohybridworkflows.
diversetechniquesintospecificstages,suchasenhancingre- Thesedesignsenablingmoreflexibleorchestrationwhilestill
trievalwithfine-tunedsearchmodules[Linetal.,2023b]. In operatingunderpredefinedexecutionpaths.
responsetospecifictaskdemands, variousrestructuredand Agentic reasoning empowers the LLM to act as an au-
iterativemoduledesignshavealsoemerged. Asaresult,mod- tonomousagent,dynamicallydecidinghowtointeractwith
ularRAGhasincreasinglybecomeadominantparadigmin external tools based on its current reasoning state. These
the field, supporting both serialized pipeline execution and workflows tightly couple reasoning with tool use, enabling
end-to-endlearningacrossmodularcomponents. themodeltoissueretrievalqueries,assessresults,anditera-

|     |     |     |     | Route-based |     | RAGate[Wangetal.,2024a],                     |     |     | Self-Route[Lietal.,2024b] |     |     |     |     |     |
| --- | --- | --- | --- | ----------- | --- | -------------------------------------------- | --- | --- | ------------------------- | --- | --- | --- | --- | --- |
|     |     |     |     | Loop-based  |     | Self-RAG[Asaietal.,2023],CRAG[Yanetal.,2024] |     |     |                           |     |     |     |     |     |
GARcitnegAgninosaeR
Predefinedreasoning
|     |     |     |     | Tree-based     |     | RAPTOR[Sarthietal.,2024],MCTS-RAG[Huetal.,2025]          |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | -------------- | --- | -------------------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | Hybrid-modular |     | Adaptive-RAG[Jeongetal.,2024],Modular-RAG[Gaoetal.,2024] |     |     |     |     |     |     |     |     |
ReAct[Yaoetal.,2023],Self-Ask[Pressetal.,2023],
Prompt-based
Functioncalling[Eletietal.,2023],Search-O1[Lietal.,2025a]
Agenticreasoning
DeepRetrieval[Jiangetal.,2025],Search-R1[Jinetal.,2025],R1-Searcher[Songetal.,2025],
Training-based
ReZero[DaoandLe,2025],DeepResearcher[Zhengetal.,2025]
Figure3:AtaxonomyofReasoningAgenticRAG.
Router-based
Loop-based
Self-
| Tree-based |     |     |     |     |     |     |     | CRAG |     |     |     |     |     |     |
| ---------- | --- | --- | --- | --- | --- | --- | --- | ---- | --- | --- | --- | --- | --- | --- |
Route
| Hybrid-modular  |     |     |     |     |     | Se lf - |     |        |     | RAGate |     |     | M   | C T S- |
| --------------- | --- | --- | --- | --- | --- | ------- | --- | ------ | --- | ------ | --- | --- | --- | ------ |
|                 |     |     |     |     |     |         |     | RAPTOR |     |        |     |     | R   | A G    |
R A G
Predefined
Reasoning
|     |     |     |     |     |     |     |     | Adaptive- |     | Modular- |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | --- | -------- | --- | --- | --- | --- |
|     |     |     |     |     |     |     |     | RAG       |     | RAG      |     |     |     |     |
Prompt-based
| Training-based |     |     |     | Self- |       |     |     |     |     |     |     |               |     |        |
| -------------- | --- | --- | --- | ----- | ----- | --- | --- | --- | --- | --- | --- | ------------- | --- | ------ |
|                |     |     |     | ASK   | ReAct |     |     |     |     |     |     | DeepRetrieval |     | ReZero |
Agentic
Reasoning
|     |     |     |     |     |     | Function  |     |     |     |     | Search-O1 |     | R1-      |     |
| --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- | --- | --------- | --- | -------- | --- |
|     |     |     |     |     |     | Calling   |     |     |     |     |           |     | Searcher |     |
Search-R1
|     |     |     | 2022 | 2023 |     |     | 2024 |     |     |     | 2025 |     |     |     |
| --- | --- | --- | ---- | ---- | --- | --- | ---- | --- | --- | --- | ---- | --- | --- | --- |
Figure4:IllustrationoftheevolutionofReasoningAgenticRAG.
tivelyadaptitsactions. Twomainimplementationstrategies two-stage,outcome-drivenRLframeworkthatenablesLLMs
haveemerged: prompt-basedandtraining-basedapproaches. tolearnwhenandwhattosearchwithinareasoningtrajectory.
Prompt-basedmethodsleveragetheinstruction-followingabil- ReZero[DaoandLe,2025]incentivizespersistence,reward-
DeepResearcher[Zhengetal.,
ities of pretrained LLMs to drive agentic behavior without ingeffectiveretrystrategies.
additional training. For example, ReAct [Yao et al., 2023] 2025]pushesfurtherbytrainingagentsinopenwebenviron-
interleaves reasoning steps with tool use to guide retrieval ments, enabling robust search and synthesis across diverse,
based on emerging knowledge gaps. Other methods like unstructuredsources.
Self-Ask[Pressetal.,2023]andSearch-o1[Lietal.,2025a]
supportdecompositionintosub-questionsortriggerretrieval 3 PredefinedReasoning
| mid-generation. |     | Additionally, |     | functioncallingmechanisms |     |     |     |     |     |     |     |     |     |     |
| --------------- | --- | ------------- | --- | ------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
AgentsandRAGareincreasinglyintegratedinadvancedAI
[Eletietal.,2023]builtintocommercialLLMssuchasGPT
|                                     |       |            |               |            |                      |      |         | systems.   |              | By augmenting |          | LLMs with   | external | knowledge       |
| ----------------------------------- | ----- | ---------- | ------------- | ---------- | -------------------- | ---- | ------- | ---------- | ------------ | ------------- | -------- | ----------- | -------- | --------------- |
| and Gemini                          | offer | structured |               | interfaces | for tool             | use, | further |            |              |               |          |             |          |                 |
|                                     |       |            |               |            |                      |      |         | retrieval, |              | RAG enables   | agents   | to ground   | their    | reasoning in    |
| enablingprompt-basedagenticcontrol. |       |            |               |            | Inparallel,training- |      |         |            |              |               |          |             |          |                 |
|                                     |       |            |               |            |                      |      |         | relevant   | information. |               | In turn, | agent-based |          | reasoning which |
| based approaches                    |       | aim        | to explicitly | teach      | LLMs                 | to   | reason  |            |              |               |          |             |          |                 |
includesplanning,tooluseandself-reflection,enhancesRAG
| and retrieve  | in  | a unified, | goal-driven |             | manner   | by leveraging |     |                                            |         |           |     |                  |     |                 |
| ------------- | --- | ---------- | ----------- | ----------- | -------- | ------------- | --- | ------------------------------------------ | ------- | --------- | --- | ---------------- | --- | --------------- |
|               |     |            |             |             |          |               |     | by                                         | guiding | the model | on  | what information |     | to retrieve and |
| reinforcement |     | learning   | (RL)        | to optimize | tool-use | behavior.     |     |                                            |         |           |     |                  |     |                 |
|               |     |            |             |             |          |               |     | howtoincorporateitintothereasoningprocess. |         |           |     |                  |     | Thissynergy     |
DeepRetrieval[Jiangetal.,2025]trainsmodelstoreformulate
supportsapredefinedreasoning,wheretheagentiteratively
| queries | by maximizing |     | retrieval | metrics. | Search-R1 |     | [Jin et |     |     |     |     |     |     |     |
| ------- | ------------- | --- | --------- | -------- | --------- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
al.,2025]andR1-Searcher[Songetal.,2025]bothadopta queriesexternalsources(e.g.,alocaldatabaseorwebsearch)
|     |     |     |     |     |     |     |     | andrefinesitsreasoningbasedontheretrievedevidence. |     |     |     |     |     | We  |
| --- | --- | --- | --- | --- | --- | --- | --- | -------------------------------------------------- | --- | --- | --- | --- | --- | --- |

categorize predefined RAG reasoning workflows into four Predefined Reasoning
broadtypesbasedontheirstructuralandreasoningcharacter-
Question
isticsasfollows.
| Route-based |     | Approaches: |     | RAG | incorporates | dynamic |     |     |
| ----------- | --- | ----------- | --- | --- | ------------ | ------- | --- | --- |
routingmechanismsthatdirectqueriesalongdifferentretrieval
Question
| or reasoning |     | paths based | on  | predefined | conditions�such |     |     |     |
| ------------ | --- | ----------- | --- | ---------- | --------------- | --- | --- | --- |
Decomposition
| as query | type, | model | uncertainty, |     | or confidence |     | estima- | LLM |
| -------- | ----- | ----- | ------------ | --- | ------------- | --- | ------- | --- |
tion�whilestilloperatingwithinafixedarchitecture.RAGate
[Wangetal.,2024a]usestheconversationcontextandmodel
| confidence | to  | route only | those | dialogue | turns | that truly | re- |     |
| ---------- | --- | ---------- | ----- | -------- | ----- | ---------- | --- | --- |
Sub-Questions
| quire external |     | knowledge | to a | RAG | process. | This | ensures |     |
| -------------- | --- | --------- | ---- | --- | -------- | ---- | ------- | --- |
thesystemcanbypassretrievalforstraightforwardprompts
whileinvokingitforknowledge-intensivequeries,exemplify-
| ingconditionalRAGindialogue. |     |     |     | Self-Route[Lietal.,2024b] |     |     |     |     |
| ---------------------------- | --- | --- | --- | ------------------------- | --- | --- | --- | --- |
Retrieval
introduceddynamicallyroutesqueriestoeitherRAGorLong-
Context(LC)modelsbasedonthemodel�sconfidence-based
routing. Thismethodsignificantlyreducescomputationcost
whilemaintainingperformancecomparabletoLCmodels. Reflection. Are there
knowledge gaps?
Loop-basedApproaches:RAGoperateswithinafeedback
loopthatsupportsmultipleroundsofrefinement. Thesystem Yes, generate new questions
canself-reflect,critiqueintermediateoutputs,anditeratively
No, Summarize
| update retrieval |     | inputs | to improve | generation |     | quality. | Self- |     |
| ---------------- | --- | ------ | ---------- | ---------- | --- | -------- | ----- | --- |
RAG [Asai et al., 2023] is a foundational example of this Answer
| controlledreasoningloop. |         |     | IntheSelf-RAGworkflow,asingle |     |        |            |     |     |
| ------------------------ | ------- | --- | ----------------------------- | --- | ------ | ---------- | --- | --- |
| LLM agent                | engages | in  | self-reflection               |     | during | generation | to  |     |
improveitsoutput. Insteadofrelyingonafixedretrievedcon- Figure5:AdemonstrationofPredefinedReasoning.
text,themodelcandecidemid-generationtofetchadditional
| informationortocritiqueitsowndraftanswer. |     |     |     |     |     | CRAG[Yan |     |     |
| ----------------------------------------- | --- | --- | --- | --- | --- | -------- | --- | --- |
etal.,2024]introducedloop-basedcorrectivefeedbackmech- namicallyreconfiguretheworkflowaccordingtothequeryor
anism into the retrieval process. In the CRAG workflow, a reasoningcontext. Adaptive-RAG[Jeongetal.,2024]extends
lightweightretrievalevaluatorassigningtheconfidencescores theSelf-RAGframeworkbyintroducingroutingmechanisms
aboutthequalityoftheretrievedchunks/documents�cate- thatenabledynamicpathselection. Inadditiontoallowingthe
modeltointerleaveretrievalandgenerationsteps,itequipsthe
| gorizedascorrect,incorrect,orambiguous. |     |     |     |     | Whenretrieval |     |     |     |
| --------------------------------------- | --- | --- | --- | --- | ------------- | --- | --- | --- |
qualityisdeemedsuboptimal,thesystemactivatescorrective agentwithadecision-makingrouterthatselectsappropriate
strategiessuchasqueryrewritingorexternalwebsearchto retrievalstrategiesorreasoningpathwaysbasedonthequery
gatherbetterevidence. Thesystemrefinestheretrievedcon- characteristics or the agent�s own uncertainty. Rather than
tentintoafocusedcontextanditerativelyimprovesretrieval simplydeterminingwhethertoretrievemoreinformation,the
agentcanchoosewhichretrievalmethodtoapply,whattype
untilasatisfactoryoutputisgenerated.
Tree-basedApproaches: RAGorganizestheretrievalpro- ofinformationtoprioritize,orwhichdownstreammodulesto
cess hierarchically, often using recursive structures such as engage.Modular-RAG[Gaoetal.,2024]isthemostadvanced
treestosupportmulti-hopreasoningordocumentsummariza- incarnation that transform RAG into a LEGO-like modular
[Sarthi 2024] framework, breaking the RAG process into an orchestrated
| tion. RAPTOR |     |     | et al., |     | introduces | a recursive |     |     |
| ------------ | --- | --- | ------- | --- | ---------- | ----------- | --- | --- |
pipelineofspecializedmodules. Ratherthanasingleagent
treestructurefromdocuments,allowingformoreefficientand
context-awareinformationretrieval. Thisapproachenhances handlingeverything, aModular-RAGarchitecturecompart-
RAGbycreatingasummarytreefromtextchunks,providing mentalizes tasks, e.g., one module for query reformulation,
deeperinsightsandovercominglimitationsofshort,contigu- one for document retrieval, another for ranking or filtering
[Hu et al., 2025] results,andanotherforanswersynthesis�allchainedtogether
| ous text | retrieval. | MCTS-RAG    |      |      |         | integrates |                        |                           |
| -------- | ---------- | ----------- | ---- | ---- | ------- | ---------- | ---------------------- | ------------------------- |
|          |            |             |      |      |         |            | inacomposableworkflow. | Thepipelineiscomposedbyan |
| a Monte  | Carlo      | Tree Search | loop | into | the RAG | process    | for                    |                           |
complexreasoningtasks. MCTS-RAGdynamicallyintegrates agent that coordinates modular components, each of which
retrievalandreasoningthroughaniterativedecision-making canbeoptimizedorswappedindependently.
process. UnlikestandardRAGmethods,whichtypicallyre- Thisprogressionofpredefinereasoningworkflowsreflectsa
trieve information independently from reasoning and thus broadershiftfromstaticretrievalpipelinestodynamic,agent-
integrateknowledgesuboptimally,orconventionalMCTSrea- drivenreasoningsystems. Modernpredefinedreasoningin-
soning,whichdependssolelyoninternalmodelknowledge creasinglyintegratesplanning,tooluse,anddecision-making
withoutexternalfacts,MCTS-RAGcombinesstructuredrea- componentsthatallowflexibleorchestrationofretrievaland
soningwithadaptiveretrieval. Hybrid-modularApproaches: reasoningstrategies. Ratherthanpredefiningrigidretrieval
RAGinitsmostflexibleformcombinesrouting,looping,re- steps, these systems empower agents to determine what in-
flection,andmodularorchestration. Tasksaredividedamong formation to seek, how to use it, and when to adapt their
specializedcomponents,coordinatedbyanagentthatcandy- approach�marking a move toward more autonomous and

intelligentknowledgeintegration. Asummaryoftherepre- ReActcanmitigatethehallucinationanderrorpropagationis-
sentativeresearchworksandopen-sourceindustrial/enterprise suessometimesobservedinpurelyinternalreasoningmethods
implementationsacrossthesepredefinedRAGworkflowtypes likeChain-of-Thought(CoT)[Weietal.,2023]. Theexplicit
isprovidedinTable2. reasoning traces (�Thoughts�) in ReAct enhance the inter-
pretabilityandtransparencyofthemodel�sdecision-making.
4 AgenticReasoning WithinRAG,ReActoffersanaturalagenticreasoningpipeline:
theLLM�s�Thought�processcanidentifyaknowledgegap,
Beyond the predefined reasoning mentioned above, a more
leadingtoasearch�Action,�withtheretrievedresultsform-
dynamicparadigmhasemerged: theAgenticReasoning. In
ingthe�Observation�thatinformssubsequentreasoning. A
thissetting,theLLMservesasanautonomousagentthatnot relatedmethod,Self-Ask[Pressetal.,2023],encouragesstep-
onlygeneratestext,butalsoactivelymanagesretrieval. With
by-step problem decomposition by prompting the LLM to
advancesinreasoningandinstruction-followingcapabilities,
generateandanswersimplerfollow-upquestions. Theseinter-
themodelcanidentifyknowledgegaps,determinewhenand
mediatestepsofteninvolvesearchactions,enablingthemodel
whattoretrieve,andinteractwithexternaltoolssuchassearch
togatherrelevantinformationbeforeattemptingtoanswerthe
enginesorAPIs. Thistightintegrationofreasoningandtool
mainquestion.
useenablesiterativedecision-making,enablingthesystemto
Anotherprominentprompt-basedapproachinvolveslever-
refineitsresponsesbasedonnewlyretrievedinformation. As
aging the function calling or tool use capabilities that have
aresult,agenticreasoningsupportsmoreflexibleandadaptive
beenexplicitlybuiltintoorfine-tunedintocertainLLMs,such
problem-solving,extendingRAGbeyondbasicQAtocom-
as versions of GPT [Eleti et al., 2023], Llama, and Gem-
plextaskssuchasscientificinquiry,multi-stepreasoning,and
ini. This feature allows the LLM to interact reliably with
strategicdecision-making. Agenticreasoningapproachescan
predefinedexternaltoolsorAPIsbasedonnaturallanguage
bebroadlycategorizedbyhowtheLLMlearnstousetools:
instructions. Function calling significantly expands the ca-
� Prompt-BasedApproaches: Thesemethodsleverage pabilitiesofLLMsbeyondtextgeneration,enablingthemto
theinstruction-following,in-contextlearningandreason- accessreal-time,dynamicinformation,interactwithexternal
ing capabilities of pretrained LLMs, guiding tool use systemsanddatabases,automatetasks,andreliablyconvert
throughcarefullycraftedpromptsorbuilt-infunctionali- naturallanguagerequestsintostructuredAPIcallsordatabase
tieswithoutadditionaltraining. queries. Incontrasttothemoreopen-ended�thought-action-
observation�cycleofReAct,functioncallingoftenbypasses
� Training-BasedApproaches: Thesemethodsinvolve
explicitintermediatereasoningsteps. TheLLMdirectlyiden-
explicitly training LLMs, typically via reinforcement
tifiestherelevanttoolandgeneratesthenecessaryparameters
learning,tolearnwhenandhowtointeractwithexternal
basedonitstrainingtorecognizeandformatspecificfunction
toolseffectively.
calls. This more direct approach relies on the model�s pre-
Asummaryofrepresentativeagenticreasoningapporaches existingknowledgeofavailabletoolsandtheirrequiredinputs.
andtheircharacteristicsisprovidedinTable2. Thefollowing Furthermore, the format and capabilities of the tools acces-
sectionsexaminerepresentativeframeworksandtechniques sible via function calling are typically predefined and have
withineachapproach. been integrated into the model�s training or prompt design.
ForAgenticRAG,functioncallingprovidesastraightforward
4.1 Prompt-BasedApproaches
andstructuredwayfortheLLMagenttoinvokeasearchAPI
Prompt-basedapproachesharnesstheremarkablecapabilities whenitsinternalanalysisdeterminesthatexternalinformation
alreadypresentinpre-trainedLLMstoenableagenticbehavior. isrequiredtoanswerapromptaccurately.
Instead of modifying the model�s weights through training, LargeReasoningModel-based: AgrowingtrendinAgen-
these methods rely on sophisticated prompting techniques, ticRAGworkflowinvolvesdirectlyutilizingLLMsthatpos-
few-shot examples or built-in tool interfaces, to guide the sessinherentlystrongreasoningcapabilities,oftenreferredto
LLMinitsinteractionwithexternaltoolslikesearchengines. as Large Reasoning Models (LRMs). These models, some-
Function-Calling-Based: A foundational prompt-based timesdevelopedthroughtechniqueslikelarge-scalereinforce-
methodforagenticbehavior,andonewaytoimplementfunc- mentlearning(e.g.,modelsanalogoustoOpenAI�so1[Ope-
tioncalling,isReAct(Reason+Act)[Yaoetal.,2023]. ReAct nAIetal.,2024],DeepSeek-R1[DeepSeek-AIetal.,2025]),
aims to create a synergy between the reasoning processes aredesignedtoexcelatcomplex,multi-stepreasoningtasks.
andaction-takingcapabilitieswithinanLLM.Itscoremecha- TheunderlyingpremiseisthatanLLMwithsuperiorintrin-
nisminvolvespromptingtheLLMtogenerateoutputsinan sicreasoningabilitieswillbebetterequippedtomanagethe
interleaved sequence of Thought, Action, and Observation. complexitiesofanAgenticRAGworkflow,includingdecom-
ReActtypicallyemploysfew-shotprompting,providingthe posingchallengingqueries,planninginformation-gathering
LLM with examples that demonstrate this Thought-Action- steps, assessing the relevance and utility of retrieved infor-
Observationtrajectoryforsolvingsimilartasks. Theseexam- mation,andsynthesizingknowledgeeffectively. Inessence,
plesguidethefrozenLLMonhowtostructureitsreasoning, leveragingLRMswithinRAGrepresentsaprompt-basedagen-
utilize available tools, and progress towards the goal. The tic strategy where the model�s powerful inherent reasoning
frameworkdemonstratedsignificantadvantages,particularly capabilitiesdrivetheprocess,implicitlydecidingwhenand
ingroundingtheLLM�sreasoning. Byallowingthemodelto how to retrieve information to support its complex thought
activelyseekandincorporateexternalinformationviaactions, processes.

PredefinedReasoning
| Approach                 |     |     | Strategy    | ControlType |     |     | ReasoningComplexity |     |     | Code |
| ------------------------ | --- | --- | ----------- | ----------- | --- | --- | ------------------- | --- | --- | ---- |
| RAGate[Wangetal.,2024a]  |     |     | Route-based | Adaptive    |     |     | Medium              |     |     | Link |
| self-RAG[Asaietal.,2023] |     |     | Loop-based  | Agentic     |     |     | Medium              |     |     | Link |
| CRAG[Yanetal.,2024]      |     |     | Loop-based  | Adaptive    |     |     | Medium              |     |     | Link |
| MCTS-RAG[Huetal.,2025]   |     |     | Tree-based  | Agentic     |     |     | High                |     |     | Link |
RAPTOR[Sarthietal.,2024]
|     |     |     | Tree-based | Fixed |     |     | Medium |     |     | Link |
| --- | --- | --- | ---------- | ----- | --- | --- | ------ | --- | --- | ---- |
Adaptive-RAG[Jeongetal.,2024] Hybrid-modular Adaptive Medium Link
| Modular-RAG[Gaoetal.,2024] |     |     | Hybrid-modular | Fixed            |     |     | Low    |     |     | N/A  |
| -------------------------- | --- | --- | -------------- | ---------------- | --- | --- | ------ | --- | --- | ---- |
| DeepSearcher               |     |     | Industry       | Adaptive         |     |     | Medium |     |     | Link |
| RAGFlow                    |     |     | Industry       | Adaptive         |     |     | Medium |     |     | Link |
| Haystack                   |     |     | Industry       | Adaptive         |     |     | Medium |     |     | Link |
| Langchain-Chatchat         |     |     | Industry       | Adaptive/Agentic |     |     | Medium |     |     | Link |
| LightRAG                   |     |     | Industry       | Adaptive         |     |     | Medium |     |     | Link |
| R2R                        |     |     | Industry       | Agentic          |     |     | High   |     |     | Link |
| FlashRAG                   |     |     | Industry       | Adaptive         |     |     | Medium |     |     | Link |
AgenticReasoning
| Approach             |     |     | Strategy     | Trainingenvironment |     |     | Rewarddesign |     |     | Code |
| -------------------- | --- | --- | ------------ | ------------------- | --- | --- | ------------ | --- | --- | ---- |
| ReAct[Yaoetal.,2023] |     |     | Prompt-based | N/A                 |     |     | N/A          |     |     | Link |
Self-Ask[Pressetal.,2023]
|                                  |     |     | Prompt-based | N/A |     |     | N/A |     |     | Link |
| -------------------------------- | --- | --- | ------------ | --- | --- | --- | --- | --- | --- | ---- |
| Funcitoncalling[Eletietal.,2023] |     |     | Prompt-based | N/A |     |     | N/A |     |     | N/A  |
| Search-O1[Lietal.,2025a]         |     |     | Prompt-based | N/A |     |     | N/A |     |     | Link |
Search-R1[Jinetal.,2025] Training-based Localretrievalsystem Answerreward Link
R1-Searcher[Songetal.,2025] Training-based Localretrievalsystem Retrievalreward,formatreward,answerreward Link
ReZero[DaoandLe,2025] Training-based Localretrievalsystem Retrievalreward,formatreward,answerreward,retryreward Link
DeepRetrieval[Jiangetal.,2025] Training-based Restrictedreal-worldsearchengine Retrievalreward,formatreward Link
DeepResearcher[Zhengetal.,2025]
Training-based Real-worldsearchengine Formatreward,answerreward Link
Table2:AsummaryofReasoningagenticrag.
However,effectivelymanagingtheretrievedcontextisan- patternsthanpromptingalone.
| othersignificantchallenge. |     |     | LLMswithextremelylongcon- |     |     |     |     |     |     |     |
| -------------------------- | --- | --- | ------------------------- | --- | --- | --- | --- | --- | --- | --- |
Interactingwithlocalretrievalsystems:Search-R1[Jinet
textwindowscansufferfroma�lost-in-the-middle�problem,
|                   |     |           |        |        |           |       | al.,2025]tacklesadifferentaspectofagenticsearch: |     |     | training |
| ----------------- | --- | --------- | ------ | ------ | --------- | ----- | ------------------------------------------------ | --- | --- | -------- |
| where information |     | presented | in the | middle | of a long | input |                                                  |     |     |          |
theLLMtoautonomouslydecidewhentosearchandwhatto
| receives | less attention. |     | Furthermore, | retrieved | documents, |     |                                             |     |     |           |
| -------- | --------------- | --- | ------------ | --------- | ---------- | --- | ------------------------------------------- | --- | --- | --------- |
|          |                 |     |              |           |            |     | searchforduringamulti-stepreasoningprocess. |     |     | Itextends |
whetherinlong-contextmodelsorstandardRAG,oftencon-
RL-basedreasoningframeworks(likeDeepSeek-R1)byin-
tainverbose,noisyorcontradictorycontentthatcandisrupt
tegratingsearchengineinteractiondirectlyintothelearning
| the coherence | of  | the LLM�s | reasoning | process. | Mitigating |     |                                                     |     |     |     |
| ------------- | --- | --------- | --------- | -------- | ---------- | --- | --------------------------------------------------- | --- | --- | --- |
|               |     |           |           |          |            |     | loop. IntheSearch-R1framework,thesearchengineismod- |     |     |     |
thischallengerequiresmorepreciseretrievalstrategiesand
|          |         |            |             |     |               |     | eledaspartoftheRLenvironment. |     | TheLLMagentlearnsa |     |
| -------- | ------- | ---------- | ----------- | --- | ------------- | --- | ----------------------------- | --- | ------------------ | --- |
| adaptive | context | management | mechanisms. |     | The Search-o1 |     |                               |     |                    |     |
policytogenerateasequenceoftokensthatincludesbothin-
| framework | [Li et | al., 2025a] | is specifically |     | designed | to en- |     |     |     |     |
| --------- | ------ | ----------- | --------------- | --- | -------- | ------ | --- | --- | --- | --- |
ternalreasoningsteps(oftenenclosedin<think>tags)and
hanceLRMsbytacklingknowledgeinsufficiencyduringlong,
|                              |     |     |                           |     |     |     | explicittriggersforsearchactions. |     | Thesetriggersarespecial |     |
| ---------------------------- | --- | --- | ------------------------- | --- | --- | --- | --------------------------------- | --- | ----------------------- | --- |
| step-by-stepreasoningchains. |     |     | Itintegratestwocorecompo- |     |     |     |                                   |     |                         |     |
tokens,<search>and</search>,whichencapsulatethe
nents: anAgenticRAGMechanismwheretheLRMdynami-
|     |     |     |     |     |     |     | generatedsearchquery. | Thisdesignallowsforflexible,multi- |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------------------- | ---------------------------------- | --- | --- |
callytriggerssearchqueriesbasedonself-assessedknowledge
|     |     |     |     |     |     |     | turn interactions | where the LLM | can interleave | reasoning, |
| --- | --- | --- | --- | --- | --- | --- | ----------------- | ------------- | -------------- | ---------- |
gaps,andaReason-in-DocumentsModulethatprocessesre-
searching,processingretrievedinformation(presentedwithin
trievedcontenttodistillrelevantinformationintoarefined
<information>tags),andfurtherreasoningorsearching
format,therebyminimizingnoiseandmaintainingtheLRM�s
|           |            |           |             |     |                 |     | asneeded. Theframeworkutilizesasimpleoutcome-based |     |     |     |
| --------- | ---------- | --------- | ----------- | --- | --------------- | --- | -------------------------------------------------- | --- | --- | --- |
| reasoning | integrity. | Search-o1 | exemplifies |     | a sophisticated |     |                                                    |     |     |     |
rewardfunction,typicallybasedonthecorrectnessofthefinal
prompt-basedagenticapproachfocusedonmaintainingrea-
answergeneratedbytheLLM(within<answer>tags)com-
soningintegrityinthefaceofexternalinformationretrieval.
paredtoagroundtruth,avoidingthecomplexityofdesigning
4.2 Training-BasedApproaches intermediateprocessrewards. Acrucialtechniqueemployed
|     |     |     |     |     |     |     | isretrievedtokenmasking. | DuringthecalculationoftheRL |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------------------------ | --------------------------- | --- | --- |
Whileprompt-basedmethodsleveragetheinherentcapabili- loss(usingalgorithmslikePPOorGRPO[Shaoetal.,2024]),
tiesofLLMs,theirperformanceincomplextool-usescenarios the tokens corresponding to the content retrieved from the
canbeinconsistent. Achievinghighlyreliableandoptimized search engine (i.e., within the <information> tags) are
behavior, especially in deciding when and how to interact ignoredormaskedout,whichstabilizesthetrainingprocess.
with tools like search engines, often benefits from explicit Search-R1hasshownsignificantperformanceimprovements
training. Training-based approaches, particularly those uti- overvariousRAGbaselinesonquestion-answeringdatasets.
lizingReinforcementLearning(RL),enabletheLLMagent ItscorecontributionistrainingtheLLMtolearnanoptimal
to learn sophisticated strategies through trial and error, di- policyforinteractingwiththesearchengineasanintegrated
rectly optimizing its actions towards specific goals such as partofitsreasoningflow,enablingdynamic,context-aware
TherelatedR1-Searcher[Songetal.,2025]
| maximizingretrievaleffectivenessoroveralltasksuccess. |     |     |     |     |     | RL  | searchdecisions. |     |     |     |
| ----------------------------------------------------- | --- | --- | --- | --- | --- | --- | ---------------- | --- | --- | --- |
enablesagentstodevelopmorerobustandstrategicinteraction frameworkalsoproposesasimilartwo-stage,outcome-based

Agentic Reasoning trieval [Jiang et al., 2025] focuses specifically on improv-
ingthequalityofthesearchqueriesgeneratedbytheLLM
Original Question: agent. Itframesthetaskofquerygenerationorrewritingas
Step1: � Step2: � Step3: ... anRLproblem,trainingtheLLMtotransformaninitialuser
Sub-Question query into a more effective query for downstream retrieval
systems. ThecoremechanisminvolvestheLLMgenerating
|     |     |     |     |     | an augmented | or  | rewritten | query | based | on the | input | query. |
| --- | --- | --- | --- | --- | ------------ | --- | --------- | ----- | ----- | ------ | ----- | ------ |
DeepRetrievalemploysRLalgorithmslikeProximalPolicy
LRM
Optimization(PPO)[Schulmanetal.,2017]totrainthisquery
|     |     |     |     |     | generationprocess. |     | Akeyinnovationliesinitsrewardsignal: |     |     |     |     |     |
| --- | --- | --- | --- | --- | ------------------ | --- | ------------------------------------ | --- | --- | --- | --- | --- |
insteadofrelyingonsuperviseddata(e.g.,pairsoforiginaland
| Step n | Search Query |     |     |     |     |     |     |     |     |     |     |     |
| ------ | ------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
�gold�rewrittenqueries),DeepRetrievalusestheperformance
|     |     |     |     | Retrieved  | of the generated |     | query | in the | actual | retrieval | system | as the |
| --- | --- | --- | --- | ---------- | ---------------- | --- | ----- | ------ | ------ | --------- | ------ | ------ |
Search for helpful info Documents reward.Metricssuchasrecall@k,NormalizedDiscountedCu-
mulativeGain(NDCG),orevidence-seekingretrievalaccuracy
(Hits@N)obtainedfromexecutingthegeneratedqueryagainst
| Step n+1 |     | iterable |     |     |     |     |     |     |     |     |     |     |
| -------- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
arestrictedrealsearchengine(likePubMed)ordocumentcol-
lectionareusedtoprovidefeedbacktotheLLM.Themodel
Reasoning for next step learns,throughtrialanderror,togeneratequeriesthatmaxi-
Distilled  mizetheseretrievalmetrics. Tostructurethegeneration,the
Reason-in-
Information modeloftenproducesreasoningstepswithin<think>tags
| Step n+2 |     |     |     | Documents |                                               |     |     |     |     |     |     |      |
| -------- | --- | --- | --- | --------- | --------------------------------------------- | --- | --- | --- | --- | --- | --- | ---- |
|          |     |     |     |           | beforeoutputtingthefinalqueryinan<answer>tag. |     |     |     |     |     |     | This |
...
|     |     |     |     |     | approachofferssignificantadvantages. |     |     |     |     | Bydirectlyoptimizing |     |     |
| --- | --- | --- | --- | --- | ------------------------------------ | --- | --- | --- | --- | -------------------- | --- | --- |
Final Step
fortheendgoal(retrievalperformance),itbypassestheneed
|     |     |     |     |     | for expensive | and | potentially |     | suboptimal | supervised |     | query |
| --- | --- | --- | --- | --- | ------------- | --- | ----------- | --- | ---------- | ---------- | --- | ----- |
Final Answer
|     |     |     |     |     | datasets. | Compared | to  | other | RL methods, | DeepRetrieval�s |     |     |
| --- | --- | --- | --- | --- | --------- | -------- | --- | ----- | ----------- | --------------- | --- | --- |
primaryfocusisonoptimizingthecontentandformulationof
| Figure6:AdemonstrationofAgenticReasoning. |     |     |     |     | thesearchqueryitself. |     |     |     |     |     |     |     |
| ----------------------------------------- | --- | --- | --- | --- | --------------------- | --- | --- | --- | --- | --- | --- | --- |
DeepResearcher[Zhengetal.,2025]pushestheboundaries
oftraining-basedAgenticRAGbymovingbeyondcontrolled
RLapproachforenhancingsearchcapabilities.
environmentsorstaticcorporatoperformend-to-endRLtrain-
ReZero(Retry-Zero)[DaoandLe,2025]introducesanother
|     |     |     |     |     | ing directly | within | real-world |     | web | environments. | It  | aims |
| --- | --- | --- | --- | --- | ------------ | ------ | ---------- | --- | --- | ------------- | --- | ---- |
dimensiontoRL-basedagenticsearchbyspecificallyfocusing
|     |     |     |     |     | to equip | LLM | agents with | the | capabilities | needed | for | com- |
| --- | --- | --- | --- | --- | -------- | --- | ----------- | --- | ------------ | ------ | --- | ---- |
on incentivizing persistence. It addresses the common sce- plex, deep research tasks that require navigating the noisy,
nariowhereaninitialsearchquerymightfailtoretrievethe unstructured,anddynamicnatureoftheopenweb. Thisad-
necessaryinformation,potentiallycausingtheLLMagentto dresses a key limitation of many existing agents, whether
| haltprematurelyorgenerateasuboptimalresponse. |     |     |     | ReZero |                   |     |     |         |                     |     |     |      |
| --------------------------------------------- | --- | --- | --- | ------ | ----------------- | --- | --- | ------- | ------------------- | --- | --- | ---- |
|                                               |     |     |     |        | prompt-engineered |     | or  | trained | in simulated/static |     | RAG | set- |
aimstoteachtheagentthevalueof�tryingonemoretime.�
tings,whichoftenstrugglewiththecomplexitiesofreal-world
The framework operates within a standard RL setup (using web interaction. The framework employs RL (specifically
GRPOismentioned)wheretheLLMinteractswithasearch GRPO with an F1 score-based reward for answer accuracy
environment. The novelty lies in its modified reward func- )totrainagentsthatinteractwithlivewebsearchAPIsand
tion,whichincludesaspecificcomponenttermedrewardretry.
|     |     |     |     |     | browseactualwebpages. |     |     | DeepResearcherutilizesaspecial- |     |     |     |     |
| --- | --- | --- | --- | --- | --------------------- | --- | --- | ------------------------------- | --- | --- | --- | --- |
Thiscomponentprovidesapositiverewardsignalwhenever
|                |            |       |           |                | ized multi-agent |     | architecture |          | to handle   | the complexities |     | of     |
| -------------- | ---------- | ----- | --------- | -------------- | ---------------- | --- | ------------ | -------- | ----------- | ---------------- | --- | ------ |
| the LLM issues | a <search> | query | after the | initial search |                  |     |              |          |             |                  |     |        |
|                |            |       |           |                | web interaction. |     | This         | includes | a reasoning | module,          |     | a tool |
query within the same reasoning trajectory. Crucially, this for invoking web search, and dedicated �browsing agents�
rewardforretryingisconditionalupontheagentsuccessfully responsible for extracting relevant information from the di-
| completing              | the task, | indicated by generating       |     | a final answer |                  |     |             |     |              |          |     |         |
| ----------------------- | --------- | ----------------------------- | --- | -------------- | ---------------- | --- | ----------- | --- | ------------ | -------- | --- | ------- |
|                         |           |                               |     |                | verse structures |     | of webpages |     | encountered. | Training |     | in this |
| enclosedin<answer>tags. |           | Thisconditionalitypreventsthe |     |                |                  |     |             |     |              |          |     |         |
realisticsettingwasfoundtofosterseveralemergentcognitive
| agent from | accumulating | rewards simply | by  | retrying indef- |     |     |     |     |     |     |     |     |
| ---------- | ------------ | -------------- | --- | --------------- | --- | --- | --- | --- | --- | --- | --- | --- |
behaviorsnottypicallyobservedinagentstrainedundermore
initelywithoutmakingprogress. Bydirectlyrewardingthe constrainedconditions. Theseincludetheabilitytoformulate
actofpersistence(whenproductive),ReZeroencouragesthe initialplansanddynamicallyadjustthemduringtheresearch
LLMtoexplorealternativequeriesorsearchstrategiesifthe process, cross-validate information retrieved from multiple
| firstattemptprovesinsufficient. |     | Thiscontrastswithmethods |     |     |              |        |     |                 |     |                |     |        |
| ------------------------------- | --- | ------------------------ | --- | --- | ------------ | ------ | --- | --------------- | --- | -------------- | --- | ------ |
|                                 |     |                          |     |     | web sources, | engage | in  | self-reflection |     | when retrieved |     | infor- |
thatmightonlyimplicitlyrewardpersistencethrougheventual
mationseemscontradictoryorinsufficientleadingtorefined
task success. ReZero positions itself as complementary to searchstrategies,andexhibithonestybydecliningtoprovide
frameworkslikeDeepRetrieval;whileDeepRetrievalfocuses ananswerwhendefinitiveinformationcannotbefound. Deep-
onoptimizingasinglerefinedquery,ReZeroemphasizesthe Researcher demonstrated substantial performance improve-
valueofmakingmultipleretrievalattemptswhenneeded.
mentsoverprompt-engineeringbaselinesandRAG-basedRL
Interacting with real-world search engines: DeepRe- agentstrainedonstaticcorpora,particularlyonopen-domain

researchtasks. Theresultsstronglysuggestthatend-to-end seentools(e.g.,sparse,dense,orwebretrieval),andchanging
traininginrealisticwebenvironmentsiscrucialfordevelop- environmentsremainsamajorchallenge. Whiletraininginre-
ingrobustandcapableresearchagents,movingclosertothe alisticconditions(asinDeepResearcher)improvesresilience,
capabilities hinted at by proprietary systems like OpenAI�s agentsstillstrugglewithtoolfailuresorshiftingknowledge
DeepResearch[OpenAI,2025]orGrok�sDeeperSearch. availability. Future work should explore adaptive training
Theprogressionforthetraining-basedmethods,fromop- methodologies and architectures that ensure robust perfor-
manceinunfamiliarordynamicsettings.
| timizing | the decision process | of  | when | and what | to query |     |     |     |     |     |     |
| -------- | -------------------- | --- | ---- | -------- | -------- | --- | --- | --- | --- | --- | --- |
(Search-R1), to fostering persistence (ReZero), optimizing Byaddressingkeyareassuchasimprovingagentcontrol
queryformulation(DeepRetrieval),andmanagingreal-world overtools, designingmoresophisticatedrewardsignals, in-
research workflows (DeepResearcher) reflects the growing creasing efficiency, and enhancing generalization, the field
sophisticationofRLinagenticsearch. Itreflectsagrowing canmovetowardbuildingmorecapable,reliable,andwidely
appreciation that effective information seeking by an agent applicableAgenticRAGsystems. Theseadvancementsare
involvesaconfluenceoffactors: queryquality,strategictim- essentialfortransitioningagenticAIfromresearchprototypes
ing,resiliencetofailure,andadeptnessinnavigatingrealistic to practical systems that can effectively support humans in
information environments and so on. Future advancements complexinformationtasks.
inRL-basedAgenticRAGwilllikelyneedtointegratethese
facets more holistically, perhaps through more complex re- 6 Conclusions
wardstructures,multi-objectiveoptimization,orarchitectures As language models are increasingly deployed in complex,
thatexplicitlymodelthesedifferentdimensionsofthesearch knowledge-intensive applications, the limitations of static
process, to achieve truly human-like research and problem- RAG pipelines have become apparent. Reasoning Agentic
solvingcapabilities.
RAGoffersapromisingpathforwardbyintegratingretrieval
|     |     |     |     |     |     | withmodel-drivenplanning,self-reflection,andtooluse. |     |     |     |     | This |
| --- | --- | --- | --- | --- | --- | ---------------------------------------------------- | --- | --- | --- | --- | ---- |
5 FutureResearchDirections papersurveyedthelandscapeofreasoningworkflowswithin
AgenticRAG,distinguishingbetweenpredefinedreasoning
Enhancingtoolinteractionthroughadvancedconfigura- withfixedorchestration,andagenticreasoningthatenables
tion. Currentagenticreasoningoftenutilizessearchtoolswith
|            |                   |           |         |     |            | dynamic, autonomous |     | decision-making. |     | We  | reviewed key |
| ---------- | ----------------- | --------- | ------- | --- | ---------- | ------------------- | --- | ---------------- | --- | --- | ------------ |
| relatively | basic interfaces, | primarily | focused | on  | generating |                     |     |                  |     |     |              |
methodsacrossbothparadigms,highlightingtheirstrengths,
| textqueries. | Futureworkshouldenableagentstoexploitmore |     |     |     |     |                                       |     |     |     |                    |     |
| ------------ | ----------------------------------------- | --- | --- | --- | --- | ------------------------------------- | --- | --- | --- | ------------------ | --- |
|              |                                           |     |     |     |     | limitations,anduse-caseapplicability. |     |     |     | Toadvancethefield, |     |
advancedconfigurationsofferedbyexternalAPIsandtools. weidentifyseveralcrucialdirectionsforfutureresearch,in-
Thiscouldinvolvetrainingagentstounderstandandutilize cluding fine-grained reward design, enhanced tool control,
optionslikeresultfiltering(e.g.,bydate,sourcetype),sorting
automateddatasynthesis,androbusttrainingindynamicen-
criteria,specifyingsearchdomains,orinteractingwithstruc-
|                                  |     |     |                      |     |     | vironments. | Theseinnovationswillbeessentialforrealizing |     |     |     |     |
| -------------------------------- | --- | --- | -------------------- | --- | --- | ----------- | ------------------------------------------- | --- | --- | --- | --- |
| tureddatabasesviacomplexqueries. |     |     | Grantingfinercontrol |     |     |             |                                             |     |     |     |     |
intelligent,context-awareRAGsystemscapableofaddressing
wouldsupportmoretargeted,efficient,andstrategicretrieval real-worldchallengeswithgreateradaptability,transparency,
| alignedwithtaskdemands. |     |     |     |     |     | andreliability. |     |     |     |     |     |
| ----------------------- | --- | --- | --- | --- | --- | --------------- | --- | --- | --- | --- | --- |
Developingfiner-Grainedandprocess-orientedreward
| functions.                                        | Simpleoutcome-basedrewardslikeexactmatch |              |          |            |        | References       |              |             |       |          |               |
| ------------------------------------------------- | ---------------------------------------- | ------------ | -------- | ---------- | ------ | ---------------- | ------------ | ----------- | ----- | -------- | ------------- |
| maynotofferadequateguidanceforcomplexRAGtasksthat |                                          |              |          |            |        | [Asaietal.,2023] |              |             |       |          |               |
|                                                   |                                          |              |          |            |        |                  |              | Akari Asai, | Zeqiu | Wu, et   | al. Self-rag: |
| require multi-step                                | reasoning                                | or           | detailed | responses. | Future |                  |              |             |       |          |               |
|                                                   |                                          |              |          |            |        | Learning         | to retrieve, | generate,   | and   | critique | through self- |
| research                                          | should develop                           | fine-grained | reward   | functions  | that   |                  |              |             |       |          |               |
reflection,2023.
| assess both | final answer | correctness | and | intermediate | steps |     |     |     |     |     |     |
| ----------- | ------------ | ----------- | --- | ------------ | ----- | --- | --- | --- | --- | --- | --- |
suchasdocumentrelevance,reasoningcoherence,information [Chenetal.,2024] JiaweiChen,HongyuLin,etal. Bench-
markinglargelanguagemodelsinretrieval-augmentedgen-
| cross-validation,andeffectiveproblemdecomposition. |                    |        |           |         | These |          |                                           |     |     |     |     |
| -------------------------------------------------- | ------------------ | ------ | --------- | ------- | ----- | -------- | ----------------------------------------- | --- | --- | --- | --- |
|                                                    |                    |        |           |         |       | eration. | InProceedingsoftheAAAIConferenceonArtifi- |     |     |     |     |
| signals are                                        | vital for training | agents | to handle | queries | that  |          |                                           |     |     |     |     |
cialIntelligence,volume38,pages17754�17762,2024.
demandmorethanshortfactualanswers.
ImprovingEfficiencyinRetrieval. Theapproachesmen- [DaoandLe,2025] Alan Dao and Thinh Le. Rezero: En-
tionedaboveprimarilyfocusontheaccuracyofthefinalan- hancingllmsearchabilitybytryingone-more-time,2025.
swer,butenhancingtheefficiencyoftheretrievalprocessitself [DeepSeek-AIetal.,2025] DeepSeek-AI, Daya Guo, et al.
isalsocritical. Agentstrainedtointeractwithpotentiallyvast Deepseek-r1: Incentivizingreasoningcapabilityinllmsvia
informationsources,mustlearntoperformretrievalsstrate- reinforcementlearning,2025.
gically. Futureresearchshouldfocusontechniquesthathelp
|     |     |     |     |     |     | [Eletietal.,2023] |     | AttyEleti,JeffHarris,etal. |     |     | Functioncall- |
| --- | --- | --- | --- | --- | --- | ----------------- | --- | -------------------------- | --- | --- | ------------- |
agentsavoidexcessiveorunnecessarysearchqueries,select
ingandotherapiupdates,June2023.
themostpromisingsources,andknowwhensufficientinfor-
|                        |     |                               |     |     |     | [Gaoetal.,2023]                            |     | YunfanGao,YunXiong,etal. |     |     | Retrieval- |
| ---------------------- | --- | ----------------------------- | --- | --- | --- | ------------------------------------------ | --- | ------------------------ | --- | --- | ---------- |
| mationhasbeengathered. |     | Developingstrategiestoprevent |     |     |     |                                            |     |                          |     |     |            |
|                        |     |                               |     |     |     | augmentedgenerationforlargelanguagemodels: |     |                          |     |     | Asurvey.   |
agentsfromgettingstuckinloopsofunproductivesearching
or performing redundant retrievals is vital for practical and arXivpreprintarXiv:2312.10997,2:1,2023.
scalableAgenticRAG. [Gaoetal.,2024] Yunfan Gao, Yun Xiong, et al. Modular
EnhancingGeneralizationandRobustnessinDynamic rag:Transformingragsystemsintolego-likereconfigurable
Environments. Robust generalization to new queries, un- frameworks,2024.

[Huetal.,2025] YunhaiHu,YilunZhao,etal. Mcts-rag: En- [OpenAIetal.,2024] OpenAI, :, et al. Openai o1 system
| hancingretrieval-augmentedgenerationwithmontecarlo |     |     |     |     |     |     |     | card,2024. |     |     |     |     |     |     |     |
| -------------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- |
treesearch,2025. [OpenAI,2025] OpenAI. Deepresearchsystemcard,Febru-
| [Huangetal.,2025] |     | LeiHuang,WeijiangYu,etal. |     |     |     | Asurvey |     |     |     |     |     |     |     |     |     |
| ----------------- | --- | ------------------------- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ary2025.
onhallucinationinlargelanguagemodels: Principles,tax- [Pressetal.,2023] OfirPress,MuruZhang,etal. Measuring
| onomy,challenges,andopenquestions. |     |     |     |     | ACMTransactions |     |     |     |     |     |     |     |     |     |     |
| ---------------------------------- | --- | --- | --- | --- | --------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
andnarrowingthecompositionalitygapinlanguagemodels,
onInformationSystems,43(2):1�55,2025.
2023.
| [Jeongetal.,2024] |                                         | Soyeong | Jeong, | Jinheon |     | Baek, | et al. |                    |     |                                    |     |     |     |     |     |
| ----------------- | --------------------------------------- | ------- | ------ | ------- | --- | ----- | ------ | ------------------ | --- | ---------------------------------- | --- | --- | --- | --- | --- |
|                   |                                         |         |        |         |     |       |        | [Ravuruetal.,2024] |     | ChidakshRavuru,SagarSrinivasSakhi- |     |     |     |     |     |
| Adaptive-rag:     | Learningtoadaptretrieval-augmentedlarge |         |        |         |     |       |        |                    |     |                                    |     |     |     |     |     |
nana,etal.Agenticretrieval-augmentedgenerationfortime
languagemodelsthroughquestioncomplexity,2024.
|                   |         |           |             |          |     |      |          | seriesanalysis.                                       |     | arXivpreprintarXiv:2408.14484,2024. |        |     |         |              |     |
| ----------------- | ------- | --------- | ----------- | -------- | --- | ---- | -------- | ----------------------------------------------------- | --- | ----------------------------------- | ------ | --- | ------- | ------------ | --- |
| [Jiangetal.,2025] |         | Pengcheng | Jiang,      | Jiacheng |     | Lin, | et al.   |                                                       |     |                                     |        |     |         |              |     |
|                   |         |           |             |          |     |      |          | [Rawteetal.,2023]                                     |     | Vipula                              | Rawte, |     | Swagata | Chakraborty, |     |
| Deepretrieval:    | Hacking |           | real search | engines  |     | and  | retriev- |                                                       |     |                                     |        |     |         |              |     |
|                   |         |           |             |          |     |      |          | etal. Thetroublingemergenceofhallucinationinlargelan- |     |                                     |        |     |         |              |     |
erswithlargelanguagemodelsviareinforcementlearning, guagemodels-anextensivedefinition,quantification,and
2025.
|     |     |     |     |     |     |     |     | prescriptiveremediations. |     |     | AssociationforComputational |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------------------- | --- | --- | --------------------------- | --- | --- | --- | --- |
[Jinetal.,2025]
|     | Bowen | Jin, | Hansi | Zeng, | et al. | Search-r1: |     | Linguistics,2023. |     |     |     |     |     |     |     |
| --- | ----- | ---- | ----- | ----- | ------ | ---------- | --- | ----------------- | --- | --- | --- | --- | --- | --- | --- |
Trainingllmstoreasonandleveragesearchengineswith
|     |     |     |     |     |     |     |     | [Robertsonetal.,2009] |     |     | StephenRobertson,HugoZaragoza, |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --------------------- | --- | --- | ------------------------------ | --- | --- | --- | --- |
reinforcementlearning,2025.
|     |     |     |     |     |     |     |     | etal. Theprobabilisticrelevanceframework: |     |     |     |     |     | Bm25and |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------------------------------------- | --- | --- | --- | --- | --- | ------- | --- |
[Kongetal.,2024] YilunKong,JingqingRuan,etal. Tptu- beyond.FoundationsandTrends�inInformationRetrieval,
v2:Boostingtaskplanningandtoolusageoflargelanguage 3(4):333�389,2009.
| model-based | agents | in  | real-world | industry |     | systems. | In  |                  |     |                               |     |     |     |     |       |
| ----------- | ------ | --- | ---------- | -------- | --- | -------- | --- | ---------------- | --- | ----------------------------- | --- | --- | --- | --- | ----- |
|             |        |     |            |          |     |          |     | [Ruanetal.,2023] |     | JingqingRuan,YihongChen,etal. |     |     |     |     | Tptu: |
Proceedingsofthe2024ConferenceonEmpiricalMethods
|            |          |             |     |          |     |        |       | Task planning  |     | and tool                         | usage | of  | large language |     | model- |
| ---------- | -------- | ----------- | --- | -------- | --- | ------ | ----- | -------------- | --- | -------------------------------- | ----- | --- | -------------- | --- | ------ |
| in Natural | Language | Processing: |     | Industry |     | Track, | pages |                |     |                                  |       |     |                |     |        |
|            |          |             |     |          |     |        |       | basedaiagents. |     | InNeurIPS2023FoundationModelsfor |       |     |                |     |        |
371�385,2024.
DecisionMakingWorkshop,2023.
[Lewisetal.,2020]
|     |     | Patrick | Lewis, | Ethan | Perez, |     | et al. | [Sarthietal.,2024] |     |     |     |     |     |     |     |
| --- | --- | ------- | ------ | ----- | ------ | --- | ------ | ------------------ | --- | --- | --- | --- | --- | --- | --- |
ParthSarthi,SalmanAbdullah,etal.Rap-
Retrieval-augmentedgenerationforknowledge-intensive
|           |                                           |     |     |     |     |     |     | tor: Recursive |     | abstractive |     | processing | for | tree-organized |     |
| --------- | ----------------------------------------- | --- | --- | --- | --- | --- | --- | -------------- | --- | ----------- | --- | ---------- | --- | -------------- | --- |
| nlptasks. | Advancesinneuralinformationprocessingsys- |     |     |     |     |     |     |                |     |             |     |            |     |                |     |
retrieval,2024.
tems,33:9459�9474,2020.
|                 |        |     |          |     |               |     |     | [Schulmanetal.,2017] |     |     | John Schulman, |     | Filip | Wolski, | et al. |
| --------------- | ------ | --- | -------- | --- | ------------- | --- | --- | -------------------- | --- | --- | -------------- | --- | ----- | ------- | ------ |
| [Lietal.,2024a] | Jiarui | Li, | Ye Yuan, | et  | al. Enhancing |     | llm |                      |     |     |                |     |       |         |        |
Proximalpolicyoptimizationalgorithms,2017.
| factualaccuracywithragtocounterhallucinations: |     |     |     |     |     |     | Acase |     |     |     |     |     |     |     |     |
| ---------------------------------------------- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
study on domain-specific queries in private knowledge- [Shaoetal.,2024] Zhihong Shao, Peiyi Wang, et al.
|     |     |     |     |     |     |     |     | Deepseekmath: |     | Pushing | the | limits | of mathematical |     | rea- |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------- | --- | ------- | --- | ------ | --------------- | --- | ---- |
bases. arXivpreprintarXiv:2403.10446,2024.
soninginopenlanguagemodels,2024.
| [Lietal.,2024b]                     | ZhuowanLi,ChengLi,etal. |     |     |     |                | Retrievalaug- |     |              |       |        |           |     |          |         |     |
| ----------------------------------- | ----------------------- | --- | --- | --- | -------------- | ------------- | --- | ------------ | ----- | ------ | --------- | --- | -------- | ------- | --- |
|                                     |                         |     |     |     |                |               |     | [Singh,2023] | Aditi | Singh. | Exploring |     | language | models: | A   |
| mentedgenerationorlong-contextllms? |                         |     |     |     | acomprehensive |               |     |              |       |        |           |     |          |         |     |
In2023International
| studyandhybridapproach,2024. |     |     |     |     |     |     |     | comprehensivesurveyandanalysis. |     |     |     |     |     |     |     |
| ---------------------------- | --- | --- | --- | --- | --- | --- | --- | ------------------------------- | --- | --- | --- | --- | --- | --- | --- |
ConferenceonResearchMethodologiesinKnowledgeMan-
| [Lietal.,2025a] | XiaoxiLi,GuantingDong,etal. |     |     |     |     | Search-o1: |     |     |     |     |     |     |     |     |     |
| --------------- | --------------------------- | --- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
agement,ArtificialIntelligenceandTelecommunicationEn-
Agenticsearch-enhancedlargereasoningmodels,2025.
gineering(RMKMATE),pages1�4.IEEE,2023.
| [Lietal.,2025b] | Zhong-ZhiLi,DuzhenZhang,etal. |     |     |     |     |     | From |                  |     |         |       |        |        |     |         |
| --------------- | ----------------------------- | --- | --- | --- | --- | --- | ---- | ---------------- | --- | ------- | ----- | ------ | ------ | --- | ------- |
|                 |                               |     |     |     |     |     |      | [Songetal.,2025] |     | Huatong | Song, | Jinhao | Jiang, | et  | al. R1- |
system1tosystem2:Asurveyofreasoninglargelanguage
|                                             |     |     |     |     |     |     |     | searcher: | Incentivizing |     | the | search | capability | in  | llms via |
| ------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --------- | ------------- | --- | --- | ------ | ---------- | --- | -------- |
| models. arXivpreprintarXiv:2502.17419,2025. |     |     |     |     |     |     |     |           |               |     |     |        |            |     |          |
reinforcementlearning,2025.
| [Linetal.,2023a] | Weizhe |     | Lin, Jinghong |     | Chen, | et al. | Fine- |                   |     |                          |     |     |     |     |          |
| ---------------- | ------ | --- | ------------- | --- | ----- | ------ | ----- | ----------------- | --- | ------------------------ | --- | --- | --- | --- | -------- |
|                  |        |     |               |     |       |        |       | [Wangetal.,2024a] |     | XiWang,ProchetaSen,etal. |     |     |     |     | Adaptive |
grainedlate-interactionmulti-modalretrievalforretrieval
retrieval-augmentedgenerationforconversationalsystems,
| augmentedvisualquestionanswering. |     |     |     |     | AdvancesinNeural |     |     |     |     |     |     |     |     |     |     |
| --------------------------------- | --- | --- | --- | --- | ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
2024.
InformationProcessingSystems,36:22820�22840,2023.
[Wangetal.,2024b]
[Linetal.,2023b] Xi Victoria Lin, Xilun Chen, et al. Ra- YuWang,NedimLipka,etal. Knowl-
edgegraphpromptingformulti-documentquestionanswer-
| dit: Retrieval-augmenteddualinstructiontuning. |     |     |     |     |     |     | InThe |                                                   |     |     |     |     |     |     |     |
| ---------------------------------------------- | --- | --- | --- | --- | --- | --- | ----- | ------------------------------------------------- | --- | --- | --- | --- | --- | --- | --- |
|                                                |     |     |     |     |     |     |       | ing. InProceedingsoftheAAAIConferenceonArtificial |     |     |     |     |     |     |     |
TwelfthInternationalConferenceonLearningRepresenta-
Intelligence,volume38,pages19206�19214,2024.
tions,2023.
|                |                                      |     |     |     |     |     |     | [Wangetal.,2025] |     | Han | Wang, | Archiki |     | Prasad, | et al. |
| -------------- | ------------------------------------ | --- | --- | --- | --- | --- | --- | ---------------- | --- | --- | ----- | ------- | --- | ------- | ------ |
| [Maetal.,2023] | XinbeiMa,YeyunGong,etal.Queryrewrit- |     |     |     |     |     |     |                  |     |     |       |         |     |         |        |
Retrieval-augmentedgenerationwithconflictingevidence.
| inginretrieval-augmentedlargelanguagemodels. |     |     |     |     |     |     | InPro- |     |     |     |     |     |     |     |     |
| -------------------------------------------- | --- | --- | --- | --- | --- | --- | ------ | --- | --- | --- | --- | --- | --- | --- | --- |
arXivpreprintarXiv:2504.13079,2025.
ceedingsofthe2023ConferenceonEmpiricalMethodsin
NaturalLanguageProcessing,pages5303�5315,2023. [Weietal.,2023] Jason Wei, Xuezhi Wang, et al. Chain-
[Maetal.,2024] Zi-Ao Ma, Tian Lan, et al. Multi-modal of-thoughtpromptingelicitsreasoninginlargelanguage
| retrieval | augmented | multi-modal |     | generation: |     | A   | bench- | models,2023. |     |     |     |     |     |     |     |
| --------- | --------- | ----------- | --- | ----------- | --- | --- | ------ | ------------ | --- | --- | --- | --- | --- | --- | --- |
[Yanetal.,2024]
mark,evaluatemetricsandstrongbaselines. arXivpreprint Shi-QiYan,Jia-ChenGu,etal. Corrective
| arXiv:2411.16365,2024. |     |     |     |     |     |     |     | retrievalaugmentedgeneration,2024. |     |     |     |     |     |     |     |
| ---------------------- | --- | --- | --- | --- | --- | --- | --- | ---------------------------------- | --- | --- | --- | --- | --- | --- | --- |

| [Yangetal.,2024a] |          | Cheng  | Yang,   | Chufan | Shi,   | et al. Llm2: |
| ----------------- | -------- | ------ | ------- | ------ | ------ | ------------ |
| Let large         | language | models | harness |        | system | 2 reasoning. |
arXivpreprintarXiv:2412.20372,2024.
[Yangetal.,2024b]
|               |     | Xiao           | Yang, | Kai Sun, | et  | al. Crag-  |
| ------------- | --- | -------------- | ----- | -------- | --- | ---------- |
| comprehensive |     | rag benchmark. |       | Advances | in  | Neural In- |
formationProcessingSystems,37:10470�10490,2024.
| [Yaoetal.,2023] |           | Shunyu | Yao, | Jeffrey   | Zhao,    | et al. React: |
| --------------- | --------- | ------ | ---- | --------- | -------- | ------------- |
| Synergizing     | reasoning |        | and  | acting in | language | models,       |
2023.
| [Yuetal.,2024]                                     | ShiYu,ChaoyueTang,etal.             |     |             |       | Visrag:           | Vision-    |
| -------------------------------------------------- | ----------------------------------- | --- | ----------- | ----- | ----------------- | ---------- |
| based retrieval-augmented                          |                                     |     | generation  |       | on multi-modality |            |
| documents.                                         | arXivpreprintarXiv:2410.10594,2024. |     |             |       |                   |            |
| [Yuetal.,2025]                                     | Qinhan                              |     | Yu, Zhiyou  | Xiao, | et                | al. Mramg- |
| bench: Abeyondtextbenchmarkformultimodalretrieval- |                                     |     |             |       |                   |            |
| augmented                                          | multimodal                          |     | generation. |       | arXiv             | preprint   |
arXiv:2502.04176,2025.
| [Zhangetal.,] | BinZhang,HangyuMao,etal. |     |     |     |     | Controlling |
| ------------- | ------------------------ | --- | --- | --- | --- | ----------- |
largelanguagemodel-basedagentsforlarge-scaledecision-
| making: | Anactor-criticapproach. |     |     | InICLR2024Workshop |     |     |
| ------- | ----------------------- | --- | --- | ------------------ | --- | --- |
onLargeLanguageModel(LLM)Agents.
| [Zhangetal.,2023] |                                     | YueZhang,YafuLi,etal.                 |     |         |           | Siren�ssong |
| ----------------- | ----------------------------------- | ------------------------------------- | --- | ------- | --------- | ----------- |
| intheaiocean:     |                                     | asurveyonhallucinationinlargelanguage |     |         |           |             |
| models.           | arXivpreprintarXiv:2309.01219,2023. |                                       |     |         |           |             |
| [Zhaoetal.,2023]  |                                     | Wayne                                 | Xin | Zhao,   | Kun Zhou, | et al.      |
| A survey          | of large                            | language                              |     | models. | arXiv     | preprint    |
arXiv:2303.18223,1(2),2023.
[Zhaoetal.,2024]
|     |     | Penghao | Zhao, | Hailin | Zhang, | et al. |
| --- | --- | ------- | ----- | ------ | ------ | ------ |
Retrieval-augmentedgenerationforai-generatedcontent:
| Asurvey.          | arXivpreprintarXiv:2402.19473,2024.       |                             |     |     |     |       |
| ----------------- | ----------------------------------------- | --------------------------- | --- | --- | --- | ----- |
| [Zhengetal.,2025] |                                           | YuxiangZheng,DayuanFu,etal. |     |     |     | Deep- |
| researcher:       | Scalingdeepresearchviareinforcementlearn- |                             |     |     |     |       |
inginreal-worldenvironments,2025.
| [Zhuetal.,2024] |        | YizhangZhu,ShiyinDu,etal. |                |     |       | Arelarge |
| --------------- | ------ | ------------------------- | -------------- | --- | ----- | -------- |
|                 |        |                           |                |     | arXiv | preprint |
| language        | models | good                      | statisticians? |     |       |          |
arXiv:2406.07815,2024.
