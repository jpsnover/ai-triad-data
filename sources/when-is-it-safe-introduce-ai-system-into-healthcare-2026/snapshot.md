<!--
  AI Triad Research Project — Document Snapshot
  Title      : When Is It Safe to Introduce an AI System Into Healthcare? A Practical Decision Algorithm for the Ethical Implementation of Black Box AI in Medicine
  Source     : 
  Type       : pdf
  Captured   : 2026-04-23
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# When Is It Safe to Introduce an AI System Into Healthcare? A Practical Decision Algorithm for the Ethical Implementation of Black Box AI in Medicine

> **Snapshot captured:** 2026-04-23
> **Source:** 
> **Type:** pdf

---
Bioethics
| SPECIAL     | ISSUE | ARTICLE |              |          |     |           |        |     |      |     |     |
| ----------- | ----- | ------- | ------------ | -------- | --- | --------- | ------ | --- | ---- | --- | --- |
| When        | Is It | Safe    | to Introduce |          | an  | AI        | System |     | Into |     |     |
| Healthcare? |       | A       | Practical    | Decision |     | Algorithm |        |     | for  | the |     |
?
| Ethical        | Implementation |     |                           | of  | Black                | Box | AI  | in  | Medicine |     |     |
| -------------- | -------------- | --- | ------------------------- | --- | -------------------- | --- | --- | --- | -------- | --- | --- |
|                | Allen1,2       |     | DominicWilkinson1,2,3,4,5 |     | JulianSavulescu2,4,5 |     |     |     |          |     |     |
| JemimaWinifred |                | |   |                           |     | |                    |     |     |     |          |     |     |
1DepartmentofPaediatrics,FacultyofMedicine,NursingandHealthSciences,MonashUniversity,Clayton,Victoria,Australia | 2UehiroOxfordInsitute,
UniversityofOxford,Oxford,UK | 3NewbornCare,OxfordUniversityHospitalsNHSFoundationTrust,Oxford,UK | 4CentreforBiomedicalEthics,Yong
5MurdochChildren'sResearchInstitute,Melbourne,Victoria,Australia
| LooLinSchoolofMedicine,NationalUniversityofSingapore,Singapore |     |     |     |     | |   |     |     |     |     |     |     |
| -------------------------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Correspondence:JulianSavulescu(julian.savulescu@uehiro.ox.ac.uk)
| Received:13September2024 |     | | Revised:19June2025 |     | | Accepted:23July2025 |     |     |     |     |     |     |     |
| ------------------------ | --- | -------------------- | --- | --------------------- | --- | --- | --- | --- | --- | --- | --- |
Funding:Thisstudy/projectissupportedbytheNationalResearchFoundation,Singapore,underitsAISingaporeProgramme(AISGAwardNo:AISG3?GV?
2023?012).Additionally,thisstudywasfundedinpartbytheWellcomeTrust[203132/Z/16/Z].ThisstudywassupportedbytheWellcomeTrust[Grant
number:226801]fortheDiscoveryResearchPlatformforTransformativeInclusivityinEthicsandHumanitiesResearch(ANTITHESES).Thefundershadno
roleinthepreparationofthismanuscriptorthedecisiontosubmitforpublication.Forthepurposeofopenaccess,theauthorhasappliedaCCBYpublic
copyrightlicencetoanyAuthorAcceptedManuscriptversionarisingfromthissubmission.
Keywords:artificialintelligence|black?boxAI|clinicalpractice|informedconsent|largelanguagemodels|riskassessment
ABSTRACT
ThereismountingglobalinterestintherevolutionarypotentialofAItools.However,itsuseinhealthcarecarriescertainrisks.
(æblack boxÆ)
Some argue that opaque AI systems in particular undermine patients' informed consent. While interpretable
modelsofferanalternative,thisapproachmaybeimpossiblewithgenerativeAIandlargelanguagemodels(LLMs).Thus,we
proposethatAItoolsshouldbeevaluatedforclinicalusebasedontheirimplementationrisk,ratherthaninterpretability.We
black?box
introduce a practical decision algorithm for the clinical implementation of AI by evaluating its risk of implemen-
tation.AppliedtothecaseofanLLMforsurgicalinformedconsent,weassessasystem'simplementationriskbyevaluating:(1)
technical robustness, (2) implementation feasibility and (3) analysis of harms and benefits. Accordingly, the system is cate-
gorisedasminimal?risk(standarduse),moderate?risk(innovativeuse)orhigh?risk(experimentaluse).Recommendationsfor
implementationareproportionaltorisk,requiringmoreoversightforhigher?riskcategories.Thealgorithmalsoconsidersthe
system'scost?effectivenessand
patients'informedconsent.
1 | Introduction
|     |     |     |     |     | concerns | (Box | 2), | many areas | of medicine | have been slow | to  |
| --- | --- | --- | --- | --- | -------- | ---- | --- | ---------- | ----------- | -------------- | --- |
AI?based
|     |     |     |     |     | adopt |     | tools | intopractice. |     |     |     |
| --- | --- | --- | --- | --- | ----- | --- | ----- | ------------- | --- | --- | --- |
Thereismountingglobalinterestintherevolutionarypotential
of AI systems in medicine, like Consent?GPT (Box 1). Yet, Bridgingtheso?calledAIchasm[8]betweenAIresearchandits
|     |     |     | AI?based |     | real?world |     |     |     |     |     |     |
| --- | --- | --- | -------- | --- | ---------- | --- | --- | --- | --- | --- | --- |
despite evidence suggesting that some tools perform clinical application remains a major challenge for
equivalent (if not superior) to existing approaches to patient policymakers andpractitioners.
| care [1,    | 2], some are | concerned | about | the uninterpretable |     |     |           |     |     |     |     |
| ----------- | ------------ | --------- | ----- | ------------------- | --- | --- | --------- | --- | --- | --- | --- |
| ôblack?boxö |              |           |       |                     |     |     | black?box |     |     |     |     |
nature of these systems [3, 4]. For healthcare, in To address concerns, some recommend the use of
particular, the use of black?box AI could undermine patients' interpretable AI systems (i.e., restricting models so that hu-
informed consent [5]. As a result of these (and other) ethical mans can easily understand their outputs) to promote
ThisisanopenaccessarticleunderthetermsoftheCreativeCommonsAttributionLicense,whichpermitsuse,distributionandreproductioninanymedium,providedtheoriginalworkisproperly
cited.
⌐2025TheAuthor(s).BioethicspublishedbyJohnWiley&SonsLtd.
| Bioethics,2026;40:61û72 |     |     |     |     |     |     |     |     |     |     | 61  |
| ----------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
https://doi.org/10.1111/bioe.70032

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
Regardless,giventhewidespreadavailabilityandgeneralutility
| BOX 1 | | Consent?GPTùCaseintroduction. |     |     |     |     |     | AI?based  |        |          |          |         |           |        |           |
| ----- | ------------------------------- | --- | --- | --- | --- | --- | --------- | ------ | -------- | -------- | ------- | --------- | ------ | --------- |
|       |                                 |     |     |     |     |     | of        | tools, | some     | are      | already | beginning | to     | use them, |
|       |                                 |     |     |     |     |     | including | within | clinical | practice | [10,    | 11].      | A lack | of clear  |
Agroupofcliniciansandhospitaladministratorsareconsidering
ad hoc
implementinganovelAItool,calledConsent?GPT[6],aspartof guidance risks application of AI systems in healthcare,
|                |     |          |         |         |              |        | without     | proper | human  | oversight | or      | clinical  | evaluation | [12].       |
| -------------- | --- | -------- | ------- | ------- | ------------ | ------ | ----------- | ------ | ------ | --------- | ------- | --------- | ---------- | ----------- |
| the hospital's |     | informed | consent | process | for surgical | proce- |             |        |        |           |         |           |            |             |
|                |     |          |         |         |              |        | Thus, there | is     | a need | for an    | ethical | framework | to         | ensure that |
dures.Consent?GPTusesartificialintelligence(AI)trainedon
currentlyavailableAIsystemscanbeimplementedintoclinical
clinicallyaccuratedatasetstointeractvirtuallywithpatients
practiceresponsibly.
intheweeksbeforesurgery.Itisdesignedtoaugmentexisting
| consent  | processes | by       | streamlining | clinical                 | workflow | and |         |        |            |     |           |           |     |           |
| -------- | --------- | -------- | ------------ | ------------------------ | -------- | --- | ------- | ------ | ---------- | --- | --------- | --------- | --- | --------- |
|          |           |          |              |                          |          |     | In this | paper, | we propose | a   | practical | algorithm | to  | guide the |
| allowing | patients  | moretime | for          | informeddecision?making. |          |     |         |        |            |     |           |           |     |           |
clinicalimplementationofAIsystemsbasedontheirassociated
|     |     |     |     |     |     |     | risks (i.e., | a model's |     | Implementation |     | Risk) | (Figure | 1). Imple- |
| --- | --- | --- | --- | --- | --- | --- | ------------ | --------- | --- | -------------- | --- | ----- | ------- | ---------- |
However,somestaffareconcernedaboutthenoveltyofConsent?
|         |         |         |          |               |     |                 | mentation   | Risk, | as we     | understand | it, | is determined |             | by three |
| ------- | ------- | ------- | -------- | ------------- | --- | --------------- | ----------- | ----- | --------- | ---------- | --- | ------------- | ----------- | -------- |
| GPT and | whether | current | evidence | is sufficient | to  | justify its use |             |       |           |            |     |               |             |          |
|         |         |         |          |               |     |                 | dimensions: | (1)   | technical | assessment |     | of an         | AI system's | robust-  |
clinically,particularlyregardingthemedicalaccuracyofitsout-
|              |         |                |     |               |           |                | ness, (2) | implementation |      | feasibility |     | for its | intended | clinical  |
| ------------ | ------- | -------------- | --- | ------------- | --------- | -------------- | --------- | -------------- | ---- | ----------- | --- | ------- | -------- | --------- |
| puts, the    | risk of | hallucinations |     | and the       | technical | feasibility of |           |                |      |             |     |         |          |           |
|              |         |                |     |               |           |                | purpose   | and (3)        | risk | evaluation  | of  | an AI   | system's | potential |
| implementing | it      | into existing  | IT  | systems. They | also      | worry about    |           |                |      |             |     |         |          |           |
harmsandbenefits.
howmuchhumanoversightwillbeneeded,atleastinitially,and
whetherthiswilladdtotheiralreadyburdensomeworkload.
|            |     |          |           |             |     |          | Following                                    | its risk | evaluation, |     | an AI | system | is categorised   | as  |
| ---------- | --- | -------- | --------- | ----------- | --- | -------- | -------------------------------------------- | -------- | ----------- | --- | ----- | ------ | ---------------- | --- |
|            |     |          |           |             |     |          | minimal?risk(i.e.,standarduse),moderate?risk |          |             |     |       |        | (i.e.,innovative |     |
| How should | the | hospital | implement | Consent?GPT |     | into its |                                              |          |             |     |       |        |                  |     |
high?risk
|     |     |     |     |     |     |     | use) or |     | (i.e., | experimental |     | use). | Building | on the |
| --- | --- | --- | --- | --- | --- | --- | ------- | --- | ------ | ------------ | --- | ----- | -------- | ------ |
practice? What factors should influence their decision to en- DECIDE?AI early?stage
|     |     |     |     |     |     |     |     | recommendations |     |     | for |     | clinical | imple- |
| --- | --- | --- | --- | --- | --- | --- | --- | --------------- | --- | --- | --- | --- | -------- | ------ |
surethattheprocessiscarriedoutethicallyandresponsibly?
|     |     |     |     |     |     |     | mentation | of AI | [13], | we propose | proportional |     | recommenda- |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | ----- | ----- | ---------- | ------------ | --- | ----------- | --- |
Implementation
|     |     |     |     |     |     |     | tions for | implementation |     | based | on a | model's |     |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | -------------- | --- | ----- | ---- | ------- | --- | --- |
Riskcategory(Figure2).Ingeneral,higherriskcategories(i.e.,
|     |     |     |     |     |     |     | innovative | and | experimental |     | use) require |     | greater | caution to |
| --- | --- | --- | --- | --- | --- | --- | ---------- | --- | ------------ | --- | ------------ | --- | ------- | ---------- |
BOX 2 | Ethical concerns relating to the use of AI in medi- deploy(i.e.,morestringenthumanoversight,researchethics
cine[7]. approvalandrigorousclinicalevidence),whilstminimal?risk
|              |     |              |     |               |     |                | AI (i.e., | standard   | use) | may    | be implemented |     | with    | only sur- |
| ------------ | --- | ------------ | --- | ------------- | --- | -------------- | --------- | ---------- | ---- | ------ | -------------- | --- | ------- | --------- |
| ò Difficulty |     | in assessing | the | effectiveness | and | reliability of |           |            |      |        |                |     |         |           |
|              |     |              |     |               |     |                | veillance | monitoring |      | of its | outputs        | and | minimal | human     |
| adaptable    |     | AIsystems;   |     |               |     |                |           |            |      |        |                |     |         |           |
oversight.
ò
| Impact | of  | biased | or missing | data | on AI system's | per- |     |     |     |     |     |     |     |     |
| ------ | --- | ------ | ---------- | ---- | -------------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
formance across different subgroups, potentially perpet- The final consideration of our decision algorithm is to deter-
uating historic patternsofdiscrimination; withincost?effectivethresholds,
|     |          |      |         |          |         |              | mine whetheran |     | AI system | is       |         |                |             |          |
| --- | -------- | ---- | ------- | -------- | ------- | ------------ | -------------- | --- | --------- | -------- | ------- | -------------- | ----------- | -------- |
| ò   |          |      |         |          |         |              | and whether    |     | patients' | informed | consent |                | is required | before   |
| AI  | system's | need | for big | data may | make it | difficult to |                |     |           |          |         |                |             |          |
|     |          |      |         |          |         |              | implementation |     | of the    | system   | into    | patient?facing |             | clinical |
predictfutureusesofdata,whichrisksbreachingpatient
settings.
privacyandconfidentiality;
ò
| AIsystemsrequire |     |     | set valuesfor | programmingand |     | thus |     |     |     |     |     |     |     |     |
| ---------------- | --- | --- | ------------- | -------------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
lackconsiderationofindividualpatientvalues(machine 2 | Implementation Risk Algorithm and
paternalism),whichmayunderminerespectforpatientsÆ Consent?GPT Case Discussion
autonomy;
|       |        |           |       |          |       |             | In the following |     | section, | we  | outline | our | decision | algorithm |
| ----- | ------ | --------- | ----- | -------- | ----- | ----------- | ---------------- | --- | -------- | --- | ------- | --- | -------- | --------- |
| ò The | use of | AI raises | moral | concerns | about | who will be |                  |     |          |     |         |     |          |           |
basedonanAIsystem'sImplementationRiskandapplyittothe
| responsible |     | ifharm | occursto | patients; |     |     |     |     |     |     |     |     |     |     |
| ----------- | --- | ------ | -------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Consent?GPT,
|       |     |     |     |            |              |     | case of        |     |     | an LLM | designed | to  | seek | surgical in- |
| ----- | --- | --- | --- | ---------- | ------------ | --- | -------------- | --- | --- | ------ | -------- | --- | ---- | ------------ |
| ò     |     |     |     |            | AI?generated |     |                |     |     |        |          |     |      |              |
| Users | of  | AI  | may | lack trust | in           |     | formedconsent. |     |     |        |          |     |      |              |
recommendations;
ò Ability of AI systems to provide explanations to improve First,welookatthetechnicalcharacteristicsofanAIsystemto
|       |          |                |          |            |                |          | determine     | the | scientific | justification |        | for its      | clinical | application |
| ----- | -------- | -------------- | -------- | ---------- | -------------- | -------- | ------------- | --- | ---------- | ------------- | ------ | ------------ | -------- | ----------- |
| the   | extentto | whichhumanscan |          | trustthese |                | systems; |               |     |            |               |        |              |          |             |
|       |          |                |          |            |                |          | (1. Technical |     | assessment | of            | system | robustness). |          | Next, we    |
| ò The | use of   | AI in          | medicine | risks      | dehumanisation | and      |               |     |            |               |        |              |          |             |
exploreanypotentialfailuremodes,whichmaybeencountered
| deskillingofthe |     | profession; |     |     |     |     |     |     |     |     |     |     |     |     |
| --------------- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
duringtheclinicalimplementationandfindpracticalstrategies
ò large?scale to address these (2. Implementationfeasibility). Finally, we
| The | potential | for | misuse | of AI leading | to  |     |     |     |     |     |     |     |     |     |
| --- | --------- | --- | ------ | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
catastrophic harm. evaluateanAIsystem'srisksandexpectedbenefits,categorising
itaseitherminimal?risk(i.e.,standarduse),moderate?risk(i.e.,
|     |     |     |     |     |     |     | innovative | use) | or high?risk |     | (i.e., experimental |     | use) | (3. Risk |
| --- | --- | --- | --- | --- | --- | --- | ---------- | ---- | ------------ | --- | ------------------- | --- | ---- | -------- |
evaluation).
| transparency | and | accountability |     | [9]. However, |     | others argue |     |     |     |     |     |     |     |     |
| ------------ | --- | -------------- | --- | ------------- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- | --- |
that transparency is not as important as ensuring that these BasedonanAIsystem'sriskcategory,wesuggestthatimplemen-
models produce accurate and reliable clinical outputs [7, pp. ters (i.e., clinicians and hospital administrators) adopt different
150û158].
|     |     |     |     |     |     |     | strategies | for its | clinical | implementation |     | (4. Recommendations |     |                |
| --- | --- | --- | --- | --- | --- | --- | ---------- | ------- | -------- | -------------- | --- | ------------------- | --- | -------------- |
| 62  |     |     |     |     |     |     |            |         |          |                |     |                     |     | Bioethics,2026 |

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
ImplementationRiskAlgorithmùApracticaldecisionalgorithmfortheethicalimplementationofAIsystemsinmedicine.Black?
| FIGURE1 | |   |     |     |     |     |     |     |     |     |
| ------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
boxAIapplicationsundergo(1)technicalassessmentofsystemrobustness[Non?maleficence],(2)implementationfeasibilityassessment[Non?
maleficence/Justice] and (3) risk evaluation of harms and benefits [Beneficence/Non?maleficence]. AI applications are then categorised into
| minimal?risk |     | moderate?risk |     | high?risk |     |     |     |     |     |
| ------------ | --- | ------------- | --- | --------- | --- | --- | --- | --- | --- |
(standard use), (innovative use) and (experimental use). Recommendations for implementation are pro-
portionaltorisk.Finally,theapplicationisassessedforitscost?effectivenessandtheneedforpatientsÆinformedconsent.B,benefit;CET,within
cost?effectiveness threshold; H, harm; REC, Research Ethics Committee; RCT, randomised control trial. Uncertainty=1/Confidence; Confi-
dence?[0,1].
forclinicalimplementation).Finally,inallcases,implementers
|     |     |     |     |     | BOX 3 | | Consent?GPTù1. | Technical | assessment | of system |
| --- | --- | --- | --- | --- | ------- | -------------- | --------- | ---------- | --------- |
shouldconsideranAIsystem'scost?effectivenessandtheneedfor
| patients'informedconsent(5.Cost?effectivenessthresholdand |     |     |     |     | robustness. |     |     |     |     |
| --------------------------------------------------------- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- |
Patientinvolvement).
|     |     |     |     |     | Several studies | may offer    | scientific    | justification | for the pro-    |
| --- | --- | --- | --- | --- | --------------- | ------------ | ------------- | ------------- | --------------- |
|     |     |     |     |     | posed use of    | Consent?GPT. | For instance, | a             | randomised con- |
|     |     |     |     |     | trolled trial   | (RCT) has    | demonstrated  | that LLMs     | can deliver     |
3 | Technical Assessment of AI System clinical information with a quality comparable to human
Robustness [Non?Maleficence] physicians, notably enhancing patient understanding of the
informationrequiredforinformedconsent[14].Furthermore,
Firstly, anAIsystem should beassessedto determinewhether LLMshavebeenpositivelyevaluatedfortheirreadability[15],
there is sufficient scientific justification for the technology to accuracy and comprehensiveness [10, 16, 17], and empathy
address its intended clinical purpose(s) (Box 3). Implementers [18], with certain studies highlighting their superior per-
are not required to provide extensive validation of a system's formanceingeneratingresponsestopatientenquiries[18,19]
practical safety and effectiveness (this may not yet be known), and documentation over human physicians [16, 17]. Addi-
but simply to establish a reasonable claim in favour of its tionally, the risk of ôhallucinationsö (i.e., fluent but false
clinical use. AI systems assessed as having no or very weak responses) may be minimised by training LLMs on larger,
scientific justification for their intended clinical use(s) should more semantically refined medical datasets [20] and by en-
berejected atthisstage, untilnewevidence arises. hancing the neural models to interpret meaning at both the
|     |     |     |     |     | word?level | and context?level | of text | inputs [20]. | Accuracy of |
| --- | --- | --- | --- | --- | ---------- | ----------------- | ------- | ------------ | ----------- |
LLM?based
This evidence may be provided by developers, deduced from responses can be enhanced by retrieval aug-
specialisedexpertopinion(e.g.,computerscientists,AIexperts, mentedgeneratorswithdomain?specificknowledgedatabases
specialised clinicians) or inferred from the existing scientific andvalidated throughhuman?in?the?loop evaluations[21].
| literature (e.g., | animal | models, physiological | or biochemical |     |     |     |     |     |     |
| ----------------- | ------ | --------------------- | -------------- | --- | --- | --- | --- | --- | --- |
rationale, observational research, audit, analytic reasoning, Thus, there seems to be a strong theoretical justification for
epidemiological evidence). the useofConsent?GPT toseekpatients' consentfor surgery.
| Evidence from | clinical | sources, while generally | preferable, | is  |     |     |     |     |     |
| ------------- | -------- | ------------------------ | ----------- | --- | --- | --- | --- | --- | --- |
not mandatory. Owing to the general?purpose nature of many the specific clinical use(s) of the technology and its intended
AI tools, there may be strong evidence supporting a system's purpose, rather than simply the model's technical feasibility
robustness (i.e., functionality, limitations, risks) from a field (which may already be apparent from evidence in other disci-
outside of medicine (e.g., education, finance, engineering). In plines). This may also involve exploring additional considera-
suchcases,itmaybemorerelevantforimplementerstojustify
|     |     |     |     |     | tions unique | tothe technology'sclinicalapplication. |     |     |     |
| --- | --- | --- | --- | --- | ------------ | -------------------------------------- | --- | --- | --- |
63

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
4 | ImplementationFeasibility[Non?Maleficence/
|     |     |     |     |     |     |     | BOX 5 | | PotentialfailuremodesforAIsystemsinmedicine. |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | ---------------------------------------------- | --- | --- | --- | --- | --- |
Justice]
|                    |          |             |          |              |     |                | Practical      | [13, | pp.924û933]                    |     |     |     |     |
| ------------------ | -------- | ----------- | -------- | ------------ | --- | -------------- | -------------- | ---- | ------------------------------ | --- | --- | --- | --- |
| Next, implementers |          | should      | consider | potential    |     | failure modes, |                |      |                                |     |     |     |     |
| which may          | be       | encountered | during   | a system's   |     | implementation | ò              |      |                                |     |     |     |     |
|                    |          |             |          |              |     |                | Samplesoutside |      | thedistributionoftrainingdata, |     |     |     |     |
| into clinical      | practice | (Box        | 4).      | The presence | of  | these failure  |                |      |                                |     |     |     |     |
modesdoesnotnecessarilyindicatethatanAIsystemshouldbe ò Different or outdated equipment that is not easily com-
|     |     |     |     |     |     |     | patiblewith   |     | advancedAI   |     | technologies, |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------------- | --- | ------------ | --- | ------------- | --- | --- |
|     |     |     |     |     |     |     | ò Trainingand |     | educationfor |     | clinicians,   |     |     |
Consent?GPTù2.Implementationfeasibility.
| BOX 4 | |   |     |     |     |     |     |        |                         |     |     |     |     |     |
| ----- | --- | --- | --- | --- | --- | --- | ------ | ----------------------- | --- | --- | --- | --- | --- |
|       |     |     |     |     |     |     | ò Cost | andresourceconstraints, |     |     |     |     |     |
pre?clinical
| Despite      |     | evidence    |      | demonstrating |     | the technical   | ò     |     |         |              |     |                |      |
| ------------ | --- | ----------- | ---- | ------------- | --- | --------------- | ----- | --- | ------- | ------------ | --- | -------------- | ---- |
|              |     |             |      |               |     |                 | Human |     | factors | (ergonomics) |     | of integration | into |
| capabilities | of  | an AI model | like | Consent?GPT,  |     | there are still |       |     |         |              |     |                |      |
workflow.
significantunknownsregardingthepracticalfeasibilityofits
integrationintoclinicalconsentprocesses[17,21],aswellas 150û158]
|     |     |     |     |     |     |     | Ethical | [7, pp. |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------- | ------- | --- | --- | --- | --- | --- |
theimpactof(mis)trustinAIsystemsonpublicacceptanceof
| their use | [22, | 23]. Such | practical | concerns | may | be described |     |      |                     |     |     |          |              |
| --------- | ---- | --------- | --------- | -------- | --- | ------------ | --- | ---- | ------------------- | --- | --- | -------- | ------------ |
|           |      |           |           |          |     |              | ò A | lack | of interpretability |     | and | trust in | AI?generated |
aspotentialfailuremodesofanAIapplication,andshouldbe
recommendations,
| accounted | for | and addressed |     | by clinicians | prior | to imple- |     |     |     |     |     |     |     |
| --------- | --- | ------------- | --- | ------------- | ----- | --------- | --- | --- | --- | --- | --- | --- | --- |
mentation,where possible. ò Biased data may result in some groups attracting dis-
proportionateharms,
One important consideration is the impact of biased or ò high?quality
|     |     |     |     |     |     |     | The | need | for vast | amounts | of  |     | data may be |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | -------- | ------- | --- | --- | ----------- |
missinginformationinConsent?GPT'strainingdata,leading
|     |     |     |     |     |     |     | difficult | toobtaindue |     | toprivacylaws |     | anddata | silos, |
| --- | --- | --- | --- | --- | --- | --- | --------- | ----------- | --- | ------------- | --- | ------- | ------ |
tosomepatientgroupsincurringdisproportionateharms.For
ò ObtainingvalidconsentforAItousepatientdatamaybe
| example, | some | studies | suggest | that LLMs | may | be designed |     |     |     |     |     |     |     |
| -------- | ---- | ------- | ------- | --------- | --- | ----------- | --- | --- | --- | --- | --- | --- | --- |
with a bias towards high?income countries, and perpetuate difficult,giventhechallengesinpredictingfutureusesof
biases pertainingtorace, sex,language andculture[24û26]. the technology,
|          |              |             |              |              |         |             | ò Thepotential |     | for | misuseleading | tolarge?scale |     | harm. |
| -------- | ------------ | ----------- | ------------ | ------------ | ------- | ----------- | -------------- | --- | --- | ------------- | ------------- | --- | ----- |
| However, | it may       | be possible |              | to tractably | resolve | such biases |                |     |     |               |               |     |       |
| through  | diversifying |             | the training | datasets     | of      | LLMs [27].  |                |     |     |               |               |     |       |
Legal [33]
Moreover,itisworthnotingthattheinformationprovidedby
| human | clinicians | during | the | consent | process | is not always | ò   |     |     |     |     |     |     |
| ----- | ---------- | ------ | --- | ------- | ------- | ------------- | --- | --- | --- | --- | --- | --- | --- |
Alackofclearandconsistentregulatoryguidanceraises
completely accurate or unbiased either [28]. It is therefore AI?generated
|     |     |     |     |     |     |     | questions |     | about | legal responsibility |     | for |     |
| --- | --- | --- | --- | --- | --- | --- | --------- | --- | ----- | -------------------- | --- | --- | --- |
importantthatwesetreasonableexpectationsforsystemslike
decisions,
Consent?GPT
|     |     | when assessing |     | its clinical | feasibility. | In fact, |     |     |     |     |     |     |     |
| --- | --- | -------------- | --- | ------------ | ------------ | -------- | --- | --- | --- | --- | --- | --- | --- |
ò
well?designedAIalgorithmshavebeenshowntobepromising Rigorous clinical validation process (often via rando-
toolsforreducingracialdisparitiesbyminimisingtheriskof mised controlled trials) required to prove efficacy and
safety.
| human | subjectivity | wheninterpretingdata |     |     | [29].In | this way, |     |     |     |     |     |     |     |
| ----- | ------------ | -------------------- | --- | --- | ------- | --------- | --- | --- | --- | --- | --- | --- | --- |
Consent?GPT
|     |     | may perform | better | than | human | clinicians at |     |     |     |     |     |     |     |
| --- | --- | ----------- | ------ | ---- | ----- | ------------- | --- | --- | --- | --- | --- | --- | --- |
non?exhaustive,
providing unbiased information for patient decision?making This listis and there may beother consider-
in consent. ationsforpotentialfailuremodesspecifictotheAItechnology
or its intendedclinicalcontext.
| Additionally, |     | given the | low | burden of | healthcare | resources |     |     |     |     |     |     |     |
| ------------- | --- | --------- | --- | --------- | ---------- | --------- | --- | --- | --- | --- | --- | --- | --- |
requiredforConsent?GPT(e.g.,patientscouldaccessConsent?
|         |           |             |     |          |              |        | rejected. | Rather, | attempts | should | be made | to mitigate | their ef- |
| ------- | --------- | ----------- | --- | -------- | ------------ | ------ | --------- | ------- | -------- | ------ | ------- | ----------- | --------- |
| GPT via | a digital | application |     | on their | own personal | device |           |         |          |        |         |             |           |
andintheirowntime),suchaproposalwouldlikelybeeasy fectsandtofindalternativesolutionsifthesefailuremodesare
tointegratewithouttheneedforextensivechangestoexisting likelyto cause seriousbarriers toimplementation.
| clinicalworkflow |            | or infrastructure. |      |         |           |             |           |         |       |     |     |            |            |
| ---------------- | ---------- | ------------------ | ---- | ------- | --------- | ----------- | --------- | ------- | ----- | --- | --- | ---------- | ---------- |
|                  |            |                    |      |         |           |             | Potential | failure | modes | may | be  | practical, | ethical or |
| Finally,         | clinicians | will               | need | to make | sure that | they comply | legal(Box | 5).     |       |     |     |            |            |
withtherelevantregulatoryrequirementsbeforeadoptingthis
toolintoclinicalpractice.Whilethereareseveralexamplesof Thisstagealsoinvolvesconsiderationoftherelevantregulatory
similarapplicationstoConsent?GPTinresearchsettings[14, requirements for AI market approval. Specific requirements
30, 31], at the time of writing, no such AI tool has been vary based on jurisdiction (Box 6), though they generally
|     |     |     |     |     |     |     | involve developers |     | creating | strategies | to  | minimise | the risks of |
| --- | --- | --- | --- | --- | --- | --- | ------------------ | --- | -------- | ---------- | --- | -------- | ------------ |
granted marketapproval(Box6).
Low?risk
|     |     |     |     |     |     |     | bias, privacy | leakage | and | AI system | failures. |     | applica- |
| --- | --- | --- | --- | --- | --- | --- | ------------- | ------- | --- | --------- | --------- | --- | -------- |
However,asanLLM,Consent?GPTwouldlikelybeclassified tions can generally self?certify, whilst higher?risk applications
|          |      |           |               |     |              |           | will needto | gothroughaprocess |     |     | of regulatory |     | approval. |
| -------- | ---- | --------- | ------------- | --- | ------------ | --------- | ----------- | ----------------- | --- | --- | ------------- | --- | --------- |
| as high  | risk | by (some) | regulators,   |     | requiring    | premarket |             |                   |     |     |               |     |           |
| approval | and  | subject   | to additional |     | transparency | require-  |             |                   |     |     |               |     |           |
ments todisclosethe extent ofitsclinicaluse [32]. Once a system has been checked for its regulatory compliance
|     |     |     |     |     |     |     | and potential | failure | modes | have | been | addressed | or accounted   |
| --- | --- | --- | --- | --- | --- | --- | ------------- | ------- | ----- | ---- | ---- | --------- | -------------- |
| 64  |     |     |     |     |     |     |               |         |       |      |      |           | Bioethics,2026 |

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
ò
TGAhaspublishedguidanceontheregulationofAI/ML
| BOX 6 | Regulatory |     | landscape | for | market approval |     | of AI |     |                           |     |     |              |     |     |     |
| ------------------ | --- | --------- | --- | --------------- | --- | ----- | --- | ------------------------- | --- | --- | ------------ | --- | --- | --- |
|                    |     |           |     |                 |     |       |     | medicaldevicesandsoftware |     |     | morebroadly. |     |     |     |
productsinmedicineintheUSA,UK,EU,AustraliaandSingapore.
ò Largelanguagemodelswithamedicalpurposesupplied
| USA [34] |     |     |     |     |     |     |     | in Australiaare |               | regulatedas | medical   |     | devices.     |     |
| -------- | --- | --- | --- | --- | --- | --- | --- | --------------- | ------------- | ----------- | --------- | --- | ------------ | --- |
|          |     |     |     |     |     |     | ò   | Consent?GPT     | requirements: |             | Regulated |     | as a medical |     |
ò TheFDAregulatesAI/ML?enabledsoftwareasamedical
devicedemonstratingsafetyandperformance.Mustshow
| device (SaMD) |     | based on | its intended | use | and risk | clas- |     |     |     |     |     |     |     |     |
| ------------- | --- | -------- | ------------ | --- | -------- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
High?risk quality of training data and relevance to the Australian
| sification        | (Class   | I, II and         | III). | AI          | applications |     |     |                  |     |           |           |     |     |     |
| ----------------- | -------- | ----------------- | ----- | ----------- | ------------ | --- | --- | ---------------- | --- | --------- | --------- | --- | --- | --- |
|                   |          |                   |       |             |              |     |     | population.Human |     | oversight | required. |     |     |     |
| require           | rigorous | pre?market        |       | testing and | approval     | to  |     |                  |     |           |           |     |     |     |
| demonstratesafety |          | andeffectiveness. |       |             |              |     |     | Singapore[37]    |     |           |           |     |     |     |
| ò                 |          |                   |       |             | AI/ML?       |     | ò   |                  |     |           |           |     |     |     |
As of October 2023, the FDA has approved 692 The Health Sciences Authority regulates telehealth and
enabled medical devices, with over 80% approved since software as amedical device.
| 2019 via              | the      | 510(k), De           | Novo,   | or premarket | approval |        |     |                   |           |              |          |                  |                 |     |
| --------------------- | -------- | -------------------- | ------- | ------------ | -------- | ------ | --- | ----------------- | --------- | ------------ | -------- | ---------------- | --------------- | --- |
|                       |          |                      |         |              |          |        | ò   | In 2021,          | Singapore | published    |          | AI in Healthcare | Guide-          |     |
| pathways.             | However, | no                   | devices | relying on   | purely   | gener- |     |                   |           |              |          |                  |                 |     |
|                       |          |                      |         |              |          |        |     | lines (AIHGle),   |           | providing    | guidance | on               | the development |     |
| ative AIarchitectures |          | havebeenapprovedyet. |         |              |          |        |     |                   |           |              |          |                  |                 |     |
|                       |          |                      |         |              |          |        |     | andimplementation |           | ofmedicalAI. |          |                  |                 |     |
ò Consent?GPTrequirements:Wouldlikelyberegulatedas
|             |            |            |                |           |            |       | ò   | Consent?GPT              | requirements:                  |             | Likely        | regulated | as a          | high? |
| ----------- | ---------- | ---------- | -------------- | --------- | ---------- | ----- | --- | ------------------------ | ------------------------------ | ----------- | ------------- | --------- | ------------- | ----- |
| a Class     | II or      | III device | requiring      | premarket | review     | to    |     |                          |                                |             |               |           |               |       |
|             |            |            |                |           |            |       |     | risk telehealth/software |                                |             | medical       | device.   | AIHGle guide- |       |
| demonstrate | safety     | and        | effectiveness. | Human     | oversight, |       |     |                          |                                |             |               |           |               |       |
|             |            |            |                |           |            |       |     | lines on                 | clinical                       | governance, | transparency, |           | human         | over- |
| accuracy    | of outputs | and        | transparency   | to        | patients   | would |     |                          |                                |             |               |           |               |       |
|             |            |            |                |           |            |       |     | sightand                 | post?deploymentmonitoringwould |             |               |           | apply.        |       |
bekeyconsiderations.
UK[35]
| ò The MHRA     | regulates | AI               | as a | medical device, | requiring |     |                   |     |     |      |       |          |          |          |
| -------------- | --------- | ---------------- | ---- | --------------- | --------- | --- | ----------------- | --- | --- | ---- | ----- | -------- | -------- | -------- |
|                |           |                  |      |                 |           |     | for, implementers |     | may | move | on to | the next | stage of | clinical |
| compliancewith |           | UK medicaldevice |      | regulations.    |           |     |                   |     |     |      |       |          |          |          |
evaluation.
| ò MHRA     | has           | published  | guiding     | principles   | on  | good |     |                 |     |               |     |     |     |     |
| ---------- | ------------- | ---------- | ----------- | ------------ | --- | ---- | --- | --------------- | --- | ------------- | --- | --- | --- | --- |
| machine    | learning      | practices, |             | transparency | and | pre- |     |                 |     |               |     |     |     |     |
| determined | changecontrol |            | foradaptive | AI/ML.       |     |      |     |                 |     |               |     |     |     |     |
|            |               |            |             |              |     |      | 5 | | Risk Evaluation |     | [Beneficence/ |     |     |     |     |
ò MHRAiscollaboratingwithNICEontheregulationand Non?Maleficence]
| evaluation | ofAI,especiallyfor |     |     | digital mentalhealth. |     |     |     |     |     |     |     |     |     |     |
| ---------- | ------------------ | --- | --- | --------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ò Consent?GPT Finally (and crucially), implementers should determine
|     |     | requirements: | Would | be regulated |     | as a |     |     |     |     |     |     |     |     |
| --- | --- | ------------- | ----- | ------------ | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
whethertherisksandexpectedbenefitsofimplementinganAI
| medical | device | with requirements |     | for safety, | efficacy, |     |     |     |     |     |     |     |     |     |
| ------- | ------ | ----------------- | --- | ----------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
human oversightandtransparency. MHRAmayrequire systemintoclinicalpracticearejustifiable(Box7).Thisprocess
|                              |     |     |     |       |     |     | involves   | establishing |            | the value | of potential    |     | harms and benefits |         |
| ---------------------------- | --- | --- | --- | ----- | --- | --- | ---------- | ------------ | ---------- | --------- | --------------- | --- | ------------------ | ------- |
| a predeterminedchangecontrol |     |     |     | plan. |     |     |            |              |            |           |                 |     |                    |         |
|                              |     |     |     |       |     |     | associated | with         | a system's | clinical  | implementation, |     | as                 | well as |
EU [32]
ensuringfairdistributionofpotentialharmsandbenefitswithin
ò EUAIActenteredintoforceonAug1,2024,andwillbe theintended clinicalsetting.
| effectivefrom          |             | Aug2,2026. |                   |                   |     |         |                  |     |             |              |     |          |                  |     |
| ---------------------- | ----------- | ---------- | ----------------- | ----------------- | --- | ------- | ---------------- | --- | ----------- | ------------ | --- | -------- | ---------------- | --- |
|                        |             |            |                   |                   |     |         | To evaluate      | the | risks       | and expected |     | benefits | of an AI system, |     |
| ò AI Act               | categorises | medical    | AI                | systems according |     | to risk |                  |     |             |              |     |          |                  |     |
|                        |             |            |                   |                   |     |         | therearethreekey |     | dimensions: |              |     |          |                  |     |
| (minimal,moderate,high |             |            | andunacceptable). |                   |     |         |                  |     |             |              |     |          |                  |     |
| ò                      |             |            |                   |                   |     |         | 1. Probability   |     | ofHarms     | andBenefits  |     |          |                  |     |
AdditionalconsiderationsapplyforgenerativeAIsystems
| (e.g., transparency |             | requirements)     |     | and AI        | classified | as a |                |         |             |             |       |       |           |     |
| ------------------- | ----------- | ----------------- | --- | ------------- | ---------- | ---- | -------------- | ------- | ----------- | ----------- | ----- | ----- | --------- | --- |
|                     |             |                   |     |               |            |      | 2. Nature      | ofHarms |             | andBenefits |       |       |           |     |
| medical             | device      | (i.e., compliance |     | with existing | Medical    |      |                |         |             |             |       |       |           |     |
|                     |             |                   |     |               |            |      | 3. Uncertainty |         | of(1)and(2) |             |       |       |           |     |
| Device              | Regulations | (MDR)             | and | In Vitro      | Diagnostic |      |                |         |             |             |       |       |           |     |
| MedicalDevices      |             | Regulation(IVDR). |     |               |            |      |                |         |             |             |       |       |           |     |
|                     |             |                   |     |               |            |      |                | For     | Harms,(1)   | ╫           | (2) ╫ | (3) = | Risk (R). |     |
| ò Products          | withmarket  | approvalreceivea  |     |               | CEmark.    |      |                |         |             |             |       |       |           |     |
ò Consent?GPTrequirements:Likelyclassifiedashigh?risk
under the AI Act, requiring conformity assessment, For Benefits,(1) ╫ (2) ╫ (3) = ExpectedBenefit (EB).
| human | oversight, | transparency |     | and compliance |     | with |     |     |     |     |     |     |     |     |
| ----- | ---------- | ------------ | --- | -------------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
MDR/IVDR as a medical device. Generative AI trans- The Probability of Harms and Benefits refers to the likelihood
parency requirementswould alsoapply. that a harm or benefit will occur as a result of using the AI
Australia [36] system. Probabilities can be derived from clinical trials, histor-
|     |     |     |     |     |     |     | icaldata | or expert | opinion. |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | -------- | --------- | -------- | --- | --- | --- | --- | --- |
ò TheTGAregulatesAI?enabledmedicaldevices,including
| SaMD,     | based | on risk        | classification. | Devices     |             | require |            |     |                |     |          |            |                 |         |
| --------- | ----- | -------------- | --------------- | ----------- | ----------- | ------- | ---------- | --- | -------------- | --- | -------- | ---------- | --------------- | ------- |
|           |       |                |                 |             |             |         | The Nature | of  | Harms          | and | Benefits | refers     | to the severity | or      |
| inclusion | on    | the Australian |                 | Register of | Therapeutic |         |            |     |                |     |          |            |                 |         |
|           |       |                |                 |             |             |         | magnitude  | of  | an AI system's |     | outputs. | In theory, | values          | of this |
Goods. metric could be determined either subjectively (i.e., by the
65

patient's preferences) or objectively (i.e., in some other non-
BOX 7 | Consent?GPTù3.Riskevaluation.
subjectiveway,forexample,viaaspecialisedpanelofexperts).
While there is disagreement among bioethicists regarding
Consent?GPT could offer considerable benefits to both pa-
which approach may be most appropriate to fulfil ethical obli-
tientsandcliniciansinthemedicalconsentprocess.Notonly
gations of respect for autonomy and beneficence [40û42], it is
could it improve patientsÆ access to the relevant information
not theintentionofthis paperto settle thisdebate.
for decision?making, but Consent?GPT could also allow cli-
nicians to focus their time on more complex tasks or spend
Instead,wesuggestahybridapproachtoevaluatingthenatureof
longer with patients who specifically require human consent
harmsandbenefits.First,æobjectiveÆvaluesmaybeapproximated
conversations.
based on how a æreasonable personÆ would likely assess these
consequences(i.e.,ædeathÆastheworstpossibleoutcomewiththe
However, there are also potential harms associated with
lowest value, etc.). Adjustments to these objective values can
Consent?GPT. For example, patients may believe their views
then be made through patient and public involvement and en-
andfeelingsareunderminediftheyaremadetointeractwith
gagement(PPIE)focusgroups,wherebykeystakeholdersprovide
Consent?GPT without the option of a human clinician,
direct feedback on these assigned values [43]. This approach
compromisingthe doctor?patientrelationship [38].
ensures the perspectives and priorities of those affected by AI
implementationareaccuratelyincorporated.
Additionally, patients may be harmed (i.e., physically, psy-
chologically, emotionally) if Consent?GPT were to provide
Thethirddimension,Uncertainty,accountsforthelevelofcon-
them with inaccurate,incomplete orfalse informationabout
fidence in the probability and nature of outcome estimates.
aprocedure'srisksorcomplications.Theremayalsobelegal
Higher uncertainty indicates less confidence in the estimates,
consequences for clinicians [1,pp. 31û38].
and can be due to limited data, low?quality evidence or poor
applicabilityofexistingevidencetotheAI'sintendedclinicaluse.
Consent?GPT may also struggle to register patientsÆ non?
Lower uncertainty (i.e., higher confidence) may be associated
verbalcues,leadingtoincorrectassessmentsofpatientsÆvalid
withlargersamplesizes,morerobuststudydesigns(e.g.,RCTs,
consent(e.g.,apatientlackscapacity,isperhapsunderduress
prospectivestudies)andmoreclinicallyapplicableevidence.
or doesnot understand the information).
Thus,anAIsystem'snetRiskandExpectedBenefitisevaluatedas
There may also be concerns about the potential persuasive
theproductofthesethreedimensions.Wecanthenusethisrisk effects of LLMs, like Consent?GPT, to manipulate patient
evaluation to categorise AI proposals as minimal?risk (i.e., stan-
decision?making (i.e., by tailoring its responses based on pa-
dard use), moderate?risk (i.e., innovative use) and high?risk (i.e., tientsÆ emotions or previous consent interactions) [39]. By
experimentaluse).Wehaveintentionallyrefrainedfromassigning
influencing individualsÆdecision?makingeither inadvertently
definitive numerical values to each of these risk categories to
or by design, Consent?GPT may compromise patientsÆ vol-
maintain flexibility and account for the nuanced and context?
untariness, which is essential to truly informed consent. For
specificnatureofAIapplicationsinmedicine.
example, in the case of clinical drug trials, pharmaceutical
companies may have strong incentives to use LLMs for
Describing an intervention or clinical process as innovative or
nefarious purposes, such as to subtly coerce or unduly influ-
experimentaluseidentifiesitasdeviatinginsomenormativeway
encepatientsÆdecisions toparticipate[1, pp. 31û38].
from existing conventional practice.1 In contrast, standard use
signifies that an intervention does not introduce any additional
It is also important to ensure the fair distribution of harms
risk beyond what is already accepted in current practice. The
and benefits among patient groups if Consent?GPT were im-
difference between innovative and experimental use reflects
plemented.Forexample,vulnerablepopulationswithlimited
the degree of departure from traditional clinical processes (i.e.,
access to healthcare or lower digital literacy may be dis-
innovative: moderate departure; experimental: significant depar-
proportionately affected, as they might struggle to effectively
ture)andthus,thelevelofuncertaintyregardingtheAI'ssafety,
interactwithortrustLLM?basedsystems.Thesegroupscould
efficacyandabilitytointegrateintopractice[45].
missoutonthepotentialbenefitsofimprovedunderstanding
and informed consent, leading to a widening of existing
Once the risk category has been determined, implementers
healthdisparities.
shouldweighuptherisksagainsttheexpectedbenefitsofanAI
proposal. This deliberation process will likely require imple-
The risks associated with Consent?GPT are not trivial. Nor
menters to make normative trade?offs about which expected
are they insurmountable or ostensibly unacceptable to pro-
benefitsorrisksshouldcarrygreatermoralsignificance.Rather
hibititsimplementation.Thus,analysisoftherisksassociated
than propose a specific approach to weighing up potential
with Consent?GPT (based on evaluation of the probability,
outcomesofanAIsystem,wesuggestthatimplementersadopt
nature and relative uncertainty of its harms and benefits)
a process of deliberative review, whereby potential outcomes
classifiesitinthemoderate?riskcategory(innovativeuse).
are evaluated during round?table discussions among the im-
plementing teamofclinicians. In the case of Consent?GPT, it seems reasonable that the ex-
pectedbenefitswouldlikelyoutweightheassociatedrisks,and
During this process, it is also important that potential harms and
therefore, itshould beconsideredfor implementation.
benefits are fairly distributed among potential patient groups to
ensure that certain groups do not attract disproportionate harms
66 Bioethics,2026
14678519,
2026,
1,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032
by
Cochrane
France,
Wiley
Online
Library
on
[23/04/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

fromtheuseofAI.Insomecircumstances,itmaybeappropriateto AI classified as experimental and innovative uses should be
considerselectivedeployment(i.e.,onlywheretheAIwouldclearly required to apply for approval from the relevant research
benefit)[46].Thisapproachensuresthatpotentialinequitiescanbe ethics committee (REC). As part of their REC application,
addressedandmitigatedbeforewiderimplementation. clinicians should provide information relating to the techni-
cal assessment (i.e., proof of concept), implementation fea-
There are three possible outcomes when weighing up the ex- sibility (including strategies to mitigate potential failure
pectedbenefitsandrisks ofan AIproposal.Firstly, iftherisks modes)andriskevaluation(includinginformationregarding
outweightheexpectedbenefits,theproposalshouldberejected the potential risks and the expected benefits, as well as any
untilthereisfurtherevidencetosupportitsuse.Alternatively, relevant expert opinion). In contrast, standard use AI we
proposals for which theexpected benefits clearly outweigh the believe could be exempt from REC approval and may be
risks should be considered for implementation. Finally, implemented directly.
theremaybesomeAIproposalsforwhichitisunclearwhether
theexpectedbenefitsoutweightherisks.Insuchcircumstances, Similarly, experimental and innovative uses of AI require
we recommend clinicians seek a wide range of expert opinion human?in?the?loopprocessestoensurehumanoversightofthe
(i.e., IT experts, AI ethicists), including those from different AI's outputs. This process not only ensures that the AI is
countries and with differing values. Where there is consensus technically performing as intended, but also that the expected
against an AI system's use, the proposal should be rejected. benefitscontinuetooutweighthepotentialrisksandtoprevent
Where there is dissensus (i.e., reasonable disagreement) [44] or minimise theeffectsofpotential harms.
among experts in favour of the expected benefits outweighing
therisks,theproposalshouldbeconsideredforimplementation Finally, we recommend that additional clinical evidence be
so long as expert opinion remains equivocal. This approach collectedrelativetotheAI'sriskcategory.Accordingly,webuild
ensures safe innovation and scientific exploration to improve on existing recommendations by the DECIDE?AI Steering
understandingofanAItool'srisksandbenefits[1,pp.31û38].A Group for the early clinical evaluation of AI?based decision
similarprocessisalsousedinthecaseofinnovationinsurgical support systems (Figure 2). However, where the DECIDE?AI
techniques, whereby surgeons are permitted to implement group propose a linear process of AI evaluation based on a
novel techniques within certain ethical and regulatory frame- system'sdevelopmentalstage,weincorporateathirddimension
works[47]. for consideration based on the AI's risk category. This risk?
based approach is complementary to existing regulatory fra-
meworks for AI governance [32], and supports the smooth
6 | Recommendations for Clinical transition from regulatory approval to successful implementa-
Implementation tionintoclinical practice.
Depending on the risk category, we suggest different recom- Thus, experimental use of AI should be evaluated for its
mendationsfor implementation(Box8). technical safety, clinical utility and human factors. These AI
FIGURE2 | RecommendationsfortheclinicalevaluationofAIsystemsbasedonImplementationRiskcategorisation(adaptedfromVaseyetal.
[13])[32].Stage2(TechnicalassessmentofAIsystemrobustness)mayrequireinsilicoevaluationandsilent/shadowevaluation(viaTRIPOD?AIand
STARD?AIguidelines),correspondingtopreclinicaltrialsfordrugtherapiesandIDEALstage0forsurgicalinnovation.ExperimentalusesofAI
requireearlyliveclinicalevaluationtoassesssafetyandutility (viaDECIDE?AIguideline),correspondingtophases 1&2forclinicaltrialsand
IDEALstage1to2b.InnovativeusesofAIrequirecomparativeprospectiveevaluationtoassesssafetyandeffectiveness(viaSPIRITorCONSORT?AI
guidelines),correspondingtoclinicaltrialsphase3andIDEALstage3.StandardusesofAIrequirepost?marketsurveillance,correspondingtothe
pharmacovigilancephase4andIDEALstage4.
67
14678519,
2026,
1,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032
by
Cochrane
France,
Wiley
Online
Library
on
[23/04/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
BOX 8 | Consent?GPTù4.Recommendationsforimplementation. BOX 9 | Consent?GPTù5. Cost?effectiveness threshold and
patientinvolvement.
| Consent?GPT |     | is categorised | as  | an innovative |     | use (moderate? |     |     |     |     |     |     |     |
| ----------- | --- | -------------- | --- | ------------- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- |
Cost?effective
riskcategory).Assuch,cliniciansneedtoseekapprovalfrom analysis will vary depending on healthcare
the hospital's research ethics committee (REC) before its systems, institutional funding and the degree of benefit pro-
clinicalimplementation. vided by the intervention. While it seems plausible that
|     |     |     |     |     |     |     |     | Consent?GPT |       |        |           | cost?effectiveness |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------- | ----- | ------ | --------- | ------------------ | --- |
|     |     |     |     |     |     |     |     |             | would | likely | be within |                    |     |
They also need to establish a process of regular human thresholds (given its inherently low cost and minimal bur-
oversightofConsent?GPT'sperformance.Thismayinvolvean den on healthcare resources), we cannot accurately predict
| initial | period | of rigorous | oversight, |     | whereby | every | consent |            |             |             |             |     |              |
| ------- | ------ | ----------- | ---------- | --- | ------- | ----- | ------- | ---------- | ----------- | ----------- | ----------- | --- | ------------ |
|         |        |             |            |     |         |       |         | this until | we know how | effectively | it improves |     | the surgical |
interactionusingConsent?GPTisevaluatedandthepatient's
|     |     |     |     |     |     |     |     | consent process.Somewhat |     | paradoxically,this |     | requiresclini- |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------------------ | --- | ------------------ | --- | -------------- | --- |
consent is then reviewed by the treating surgeon. However, calimplementationofConsent?GPT.Intheinterim,itmaybe
after this initial intensive stage, it may be appropriate to Consent?GPT's
|     |     |     |     |     |     |     |     | appropriate | to use the | analysis | of  |     | risks and |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------- | ---------- | -------- | --- | --- | --------- |
reducethehumanoversightandreviewprocesstoonlythose expected benefits calculated in Step 3 as a proxy for
| consent         | interactions,whichhavebeenflagged |                 |           |     |           | aschallenging |     | effectiveness. |           |             |           |         |          |
| --------------- | --------------------------------- | --------------- | --------- | --- | --------- | ------------- | --- | -------------- | --------- | ----------- | --------- | ------- | -------- |
| for the         | AI (i.e.,                         | by Consent?GPT, |           | by  | reviewing | clinicians    | or  |                |           |             |           |         |          |
| self?identified |                                   | bythe           | patient). |     |           |               |     |                |           |             |           |         |          |
|                 |                                   |                 |           |     |           |               |     | Additionally,  | as a tool | for seeking | patients' | consent | for sur- |
gery,Consent?GPTwouldberequiredtointeractdirectlywith
Finally, as an innovative use of AI, Consent?GPT's perform- patients. Therefore, Consent?GPT should be offered as an
| ance should | be  | evaluated | for | its clinical | safety | and | effective- |                |             |        |         |             |         |
| ----------- | --- | --------- | --- | ------------ | ------ | --- | ---------- | -------------- | ----------- | ------ | ------- | ----------- | ------- |
|             |     |           |     |              |        |     |            | option (either | in addition | to, or | instead | of, typical | consent |
nessviacomparativeprospectiveevaluation,suchasanRCT conversations),andpatientscanchoosetovalidlyconsentor
or prospective cohort study. The aim of this comparative refuse andinteractwith ahuman clinician instead.
| assessment | is  | to determine | whether | the | medical | consent | pro- |     |     |     |     |     |     |
| ---------- | --- | ------------ | ------- | --- | ------- | ------- | ---- | --- | --- | --- | --- | --- | --- |
Consent?GPT
| cess using       |     |     | is equivalent |     | (or | superior) | to con- |     |     |     |     |     |     |
| ---------------- | --- | --- | ------------- | --- | --- | --------- | ------- | --- | --- | --- | --- | --- | --- |
| ventionalmethods |     | for | consent.      |     |     |           |         |     |     |     |     |     |     |
Cost?Effectiveness
|                                                    |     |       |           |       |     |          |           | 7 |         |               | Threshold |     | and         | Patient |
| -------------------------------------------------- | --- | ----- | --------- | ----- | --- | -------- | --------- | ----------- | ------------- | --------- | --- | ----------- | ------- |
|                                                    |     |       |           |       |     |          |           | Involvement | [Distributive | Justice   |     | and Respect | for     |
| systemstendtowardsahighermagnitudeofharmandgreater |     |       |           |       |     |          |           | Autonomy]   |               |           |     |             |         |
| uncertainty                                        | in  | their | potential | risks | and | expected | benefits. |             |               |           |     |             |         |
Therefore,theyrequireagreaterdegreeofcautionduringtheir There are two additional ethical considerations relevant to all
clinical evaluation. Examples of appropriate study designs for AI riskcategories (Box9).
| experimental | use |     |         |             |        |         |     |     |     |     |     |     |     |
| ------------ | --- | --- | ------- | ----------- | ------ | ------- | --- | --- | --- | --- | --- | --- | --- |
|              |     | AI  | include | prospective | cohort | studies | and |     |     |     |     |     |     |
non?RCTs.RelevantreportingguidelinesincludetheTRIPOD?
ThefirstistodeterminewhethertheimplementationoftheAI
AI and STARD?AI guidelines for offline validation of the AI system into the existing clinical workflow is within the cost?
system, and the DECIDE?AI guideline for early live clinical effective threshold [48]. If not, then it may be necessary to
evaluation. consideralternativesourcesoffunding.Decisionstoimplement
willthereforebedependentonwhetherfundingisavailableand
InnovativeuseofAIshouldbeevaluatedforitsclinicalsafety thepresence ofcompetingcandidates.
| and effectiveness. |     | These | AI  | proposals | do  | not need | to go |     |     |     |     |     |     |
| ------------------ | --- | ----- | --- | --------- | --- | -------- | ----- | --- | --- | --- | --- | --- | --- |
throughtheprecedingevaluationphasesforexperimentaluse Thesecondconsiderationiswhetherthepatientwillengage
AI (i.e., preclinical development, offline validation, safety/ directly with the AI system, or whether the system is non?
patient?facing
utility assessment). Instead, these systems can proceed (i.e., intended for administrative purposes).
directlytocomparativeprospectiveevaluation(e.g.,viaRCT). In the case of the former, the AI proposal should be offered
The purpose of this evaluation is to improve the certainty of to patients so that their values and preferences can be con-
the AI system's potential harms and benefits for risk eva- sidered.Thisisalsoanopportunitytoexpresstothepatient
luation, as well as compare its performance against existing the clinical confidence in the AI system based on its scien-
methods. tific justification and risk evaluation. The patient may then
choosetovalidlyconsent,orrefuseandseekstandardorno
|     |     |     |     |     |     | post?market |     |     |     | non?patient?facing, |     |     |     |
| --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --- | ------------------- | --- | --- | --- |
Finally, standard use AI may proceed directly to care. If the system is then it may be
surveillance.Theaimofthisevaluationistomaximisebenefits implementeddirectly,inaccordancewithrecommendations
| whilstmonitoringforpotentialharms.TheseAIsystemsshould |     |     |     |     |     |     |     | from Step | 4.  |     |     |     |     |
| ------------------------------------------------------ | --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- | --- | --- |
self?auditing
| be designed | with | automatic | or  | ongoing |     |     | processes |     |     |     |     |     |     |
| ----------- | ---- | --------- | --- | ------- | --- | --- | --------- | --- | --- | --- | --- | --- | --- |
toevaluateoutcomesandensurethesystemcontinuestomeet
| existingstandards |     | forclinical | care. |     |     |     |     | 8 | Discussion |     |     |     |     |     |
| ----------------- | --- | ----------- | ----- | --- | --- | --- | --- | -------------- | --- | --- | --- | --- | --- |
OurdecisionalgorithmbuildsonpreviousworkbytheDECIDE?
| All risk | categories | require | a process | of  | regular | monitoring | and |     |     |     |     |     |     |
| -------- | ---------- | ------- | --------- | --- | ------- | ---------- | --- | --- | --- | --- | --- | --- | --- |
iterative review. This is to ensure that the AI's risk categorisa- AI Steering group [13, pp. 924û933] by proposing that clinical
tion remains up?to?date as technology and clinical standards implementation of an AI system should be determined by an
evolveover time. assessmentofitsrisk.Thus,ouralgorithmprovidesproportionate
| 68  |     |     |     |     |     |     |     |     |     |     |     |     | Bioethics,2026 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | -------------- |

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
BOX 10 | ListofadditionalexamplesofAIinmedicineaccordingtoimplementationriskcategorisation.
Minimal?risk Moderate?risk(i.e., High?risk(i.e.,experimentaluse)
|     |     | (i.e., | standarduse) |     |     |     |     | innovative |     | use) |     |     |     |
| --- | --- | ------ | ------------ | --- | --- | --- | --- | ---------- | --- | ---- | --- | --- | --- |
LLMs towrite patientdischarge LLMs toassess clinical acuityin AIfor embryoselection[9]
| summaries |     | [50] |     |     |     | emergencydepartments |     |     | [52] |     |     |     |     |
| --------- | --- | ---- | --- | --- | --- | -------------------- | --- | --- | ---- | --- | --- | --- | --- |
1. Technicalassessment:
1. Technicalassessment:evaluation 1. Technicalassessment:evaluatethe validatethe AI's accuracyin
ofconsistency, factualaccuracy and accuracyandreliabilityoftheAIin predictingviable embryos,
adherencetomedicalguidelines. prioritisingpatientsbasedonseverity. accounting forpotential biases
Implementationfeasibility: Implementation feasibility:ensure anderrorrates.
|     | 2.  |     |     |     |     | 2.  |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
considerintegration intoexisting seamless integration intoemergency 2. Implementationfeasibility:
hospitalsystems,userinterfacesand departmentworkflowsandtrainingfor considertheimpactofdynamic
easeofuseby healthcare staff. healthcare providers. biologicalprocesseson AI
3. Riskevaluation: 3. Risk evaluation: predictionaccuracy andthe
? BenefitsùImprovesefficiency ? BenefitsùOptimises abilitytointegrateintoexisting
|     |         |                |     |        | and |                                   |     |     | resource |     |             |     |     |
| --- | ------- | -------------- | --- | ------ | --- | --------------------------------- | --- | --- | -------- | --- | ----------- | --- | --- |
|     |         |                |     |        |     |                                   |     |     |          |     | IVFworkflow | and |     |
|     | reduces | administrative |     | burden | on  | allocationinemergencydepartments. |     |     |          |     |             |     |     |
healthcare providers. Ensures Potentially improvespatient infrastructure.
consistency andaccuracy in outcomesby prioritisingthosein 3. Riskevaluation:
|     |           |            |     |     |     |          |       |     |     |     | ? Benefitsù |             |     |
| --- | --------- | ---------- | --- | --- | --- | -------- | ----- | --- | --- | --- | ----------- | ----------- | --- |
|     | discharge | summaries. |     |     |     | greatest | need. |     |     |     |             | Improvesthe |     |
? HarmsùPossible inaccuraciesor ? RisksùIncorrect triagedecisions selection processfor viable
omissions in the summaries. could delaycriticalcare forsome embryos, potentially
|     |     |     |     |     | AI? |     | Over?relianceonAI |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ----------------- | --- | --- | --- | --- | --- | --- |
Misinterpretation ofthe patients. might increasing successratesin
generatedtext by patientsor reduce the qualityofhuman clinical IVF. Reduces human bias
|     | healthcare |     | providers |     |     | judgement |     |     |     |     | and errorin |     | the selection |
| --- | ---------- | --- | --------- | --- | --- | --------- | --- | --- | --- | --- | ----------- | --- | ------------- |
4. Recommendations:implement 4. Recommendations: requires REC process.
|     |                  |     |     |            |     |                                   |     |     |     |     | ? RisksùIncorrectselection |     |     |
| --- | ---------------- | --- | --- | ---------- | --- | --------------------------------- | --- | --- | --- | --- | -------------------------- | --- | --- |
|     | withminimalhuman |     |     | oversight, |     | approval,regularhumanoversightand |     |     |     |     |                            |     |     |
could negativelyaffect
|     | regularmonitoringandaudits |     |     |     | to  | comprehensive |     | evaluation | ofclinical |     |     |     |     |
| --- | -------------------------- | --- | --- | --- | --- | ------------- | --- | ---------- | ---------- | --- | --- | --- | --- |
ensureaccuracy andreliability. safety andeffectiveness through pregnancy outcomes. Ethical
and socialimplications
| AIin | diagnostic |     | imageanalysis[51] |     |     | comparative | studies. |     |     |     |           |     |           |
| ---- | ---------- | --- | ----------------- | --- | --- | ----------- | -------- | --- | --- | --- | --------- | --- | --------- |
|      |            |     |                   |     |     |             |          |     |     |     | regarding | the | selection |
1. Technicalassessment:assessthe AIin liverallocationfor criteria used byAI.
transplant[53]
|     | accuracyofimage |     | interpretation |     |     |     |     |     |     |     | Recommendations:requires |     |     |
| --- | --------------- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- | ------------------------ | --- | --- |
4.
|     | comparedtohuman        |     |     | radiologists |     | 1. Technicalassessment:            |     |     | evaluatethe |     |                      |     |     |
| --- | ---------------------- | --- | --- | ------------ | --- | ---------------------------------- | --- | --- | ----------- | --- | -------------------- | --- | --- |
|     |                        |     |     |              |     |                                    |     |     |             |     | continuousoversight, |     | REC |
|     | andstandardbenchmarks. |     |     |              |     | algorithm'sdecision?makingprocess, |     |     |             |     |                      |     |     |
approvalandfurtherclinical
|     |                               |     |     |      |          | including    | fairness,bias |            | and |     |                   |     |         |
| --- | ----------------------------- | --- | --- | ---- | -------- | ------------ | ------------- | ---------- | --- | --- | ----------------- | --- | ------- |
|     | 2. Implementationfeasibility: |     |     |      |          |              |               |            |     |     | evaluationthrough |     | non?    |
|     | ensurecompatibility           |     |     | with | existing | transparency | inthe         | allocation |     |     |                   |     |         |
|     |                               |     |     |      |          |              |               |            |     |     | randomisedcontrol |     | trials. |
decisions.
|     | imagingequipment |     |              | andworkflows |     |                   |      |                    |     |     |     |     |     |
| --- | ---------------- | --- | ------------ | ------------ | --- | ----------------- | ---- | ------------------ | --- | --- | --- | --- | --- |
|     | inradiology      |     | departments. |              |     | 2. Implementation |      | feasibility:ensure |     |     |     |     |     |
|     |                  |     |              |              |     | alignment         | with | existingorgan      |     |     |     |     |     |
3. Riskevaluation:
|     | ? BenefitsùSpeedsupdiagnostic |            |                  |       |     | allocationpolicies.    |                 |     |          |     |     |     |     |
| --- | ----------------------------- | ---------- | ---------------- | ----- | --- | ---------------------- | --------------- | --- | -------- | --- | --- | --- | --- |
|     | processes                     | andreduces |                  | human |     | 3. Risk evaluation:    |                 |     |          |     |     |     |     |
|     | error.Canhandlelargevolumesof |            |                  |       |     | ? BenefitsùPotentially |                 |     | improves |     |     |     |     |
|     | images                        | quickly    | andconsistently. |       |     | fairness               | andefficiencyin |     | organ    |     |     |     |     |
? RisksùMisdiagnoses
|     |     |     |     | dueto | AI  | allocation.Canprocesscomplexdata |     |     |     |     |     |     |     |
| --- | --- | --- | --- | ----- | --- | -------------------------------- | --- | --- | --- | --- | --- | --- | --- |
biases.Over?relianceon
|     | errors      | or           |             |            |     | tomake                | informed        | allocation |              |     |     |     |     |
| --- | ----------- | ------------ | ----------- | ---------- | --- | --------------------- | --------------- | ---------- | ------------ | --- | --- | --- | --- |
|     | AI          | byhealthcare |             | providers, |     | decisions.            |                 |            |              |     |     |     |     |
|     | potentially |              | missingrare |            |     | ? RisksùLife?or?death |                 |            | consequences | if  |     |     |     |
|     | conditions. |              |             |            |     | the AImakes           |                 | incorrect  | allocation   |     |     |     |     |
|     |             |              |             |            |     | decisions.            | Ethicalconcerns |            | about        |     |     |     |     |
4. Recommendations:implement
|     |                       |     |     |          |     | fairness | andtransparencyin |     | the |     |     |     |     |
| --- | --------------------- | --- | --- | -------- | --- | -------- | ----------------- | --- | --- | --- | --- | --- | --- |
|     | withregularmonitoring |     |     | andaudit |     |          |                   |     |     |     |     |     |     |
decision?makingprocess
|     | processesby   |     | ITspecialists |     | and |                     |              |                    |        |     |     |     |     |
| --- | ------------- | --- | ------------- | --- | --- | ------------------- | ------------ | ------------------ | ------ | --- | --- | --- | --- |
|     | radiologists. |     |               |     |     | 4. Recommendations: |              | Requires           |        |     |     |     |     |
|     |               |     |               |     |     | continuous          | human        | oversight,rigorous |        |     |     |     |     |
|     |               |     |               |     |     | evaluation          | through      | prospectivestudies |        |     |     |     |     |
|     |               |     |               |     |     | andapproval         | fromresearch |                    | ethics |     |     |     |     |
|     |               |     |               |     |     | committees          | (REC).       |                    |        |     |     |     |     |
69

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
recommendations for clinical evaluation, human oversight and human clinician standard may be used as an appropriate
ethics review. Higher risk categories (i.e., experimentaland inno- benchmarktoevaluateamodel'sriskandexpectedbenefits.
vativeusesofAI)shouldbeimplementedwithagreaterdegreeof
caution (including human oversight and REC approval), whilst There may also be more general concerns about the inherent
| low?risk |     |     |     |     |     |     |     |     |     |     | black?box |     |     |     |
| -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --------- | --- | --- | --- |
(i.e., standard use) AI should aim to maximise clinical lack of interpretability of AI systems, preventing
benefitsthroughdirectimplementationwithafollow?upreviewto some forms of clinical evaluation (e.g., assessing the risks
identifyandpreventpotentialharms. associated with how a black?box AI system arrives at certain
clinicaldecisions).Somehavearguedinfavourofinterpretable
Ouralgorithmisthefirsttoofferanethicalrisk?basedapproach AI systems as an essential requirement for their safe and
tothesafeandeffectiveimplementationofnovelAIsystemsin effective implementationintoclinical practice[9].
medicine.ItreflectsrecentchangestoAIgovernancepolicyin
the EU, UK and US, which stratify AI regulations based on a Incontrast,ouralgorithmsupportstheclinicalimplementation
system's risk classification (specific requirements vary by ofAIsystemswithoutspecificrequirementsfortransparencyor
jurisdiction) [32, 35, 49]. interpretability of its processes. This is because an explanation
|     |     |     |     |     |     |     |     | of how an | AI system | operates | does | not | necessarily | provide |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | --------- | -------- | ---- | --- | ----------- | ------- |
While we have explored in detail the case of Consent?GPT justification for its use. Indeed, there are many medical inter-
(whichweclassifyasmoderate?risk,i.e.,innovativeuse),Box10 ventions (e.g., statins, paracetamol) that are used without un-
appliesouralgorithmtoalistofotherclinicalexamplesofAIof derstandinghowtheywork.Whileexplainabilitymayinfluence
varyingriskcategories. the extent to which patients trust AI systems, we argue that
|     |     |     |     |     |     |     |     | clinical implementation |     | should | be  | justified | based | on the risks |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------------------- | --- | ------ | --- | --------- | ----- | ------------ |
150û158,
A key strength of this decision algorithm is its ability to adapt to associated with its outputs [7, pp. 57, 58]. This is
changesinAItechnologyandclinicalpractice.FocusingonanAI determined by robust clinical evidence supporting a model's
system'srisksmeansthatrecommendationsforitsimplementation reliable performance.
| can adapt | to new       | information    |            | about     | a model's  | safety | and effec-    |     |     |     |     |     |     |     |
| --------- | ------------ | -------------- | ---------- | --------- | ---------- | ------ | ------------- | --- | --- | --- | --- | --- | --- | --- |
| tiveness. | For example, |                | initially, | a system  | might      | be     | classified as |     |     |     |     |     |     |     |
| standard  | use AI       | (i.e., minimal |            | risk). As | the system |        | updates and   |     |     |     |     |     |     |     |
9 | Conclusion
modifiesovertime,newclinicalevidencemaysuggestre?evaluation
| of its risk | category | (i.e., | changes | to the | probability, | nature | and/or |         |        |                |     |               |     |            |
| ----------- | -------- | ------ | ------- | ------ | ------------ | ------ | ------ | ------- | ------ | -------------- | --- | ------------- | --- | ---------- |
|             |          |        |         |        |              |        |        | We have | argued | that decisions |     | about whether |     | or when to |
uncertainty of its potential harms and benefits). Thus, a standard AI?based
|               |     |                 |     |              |     |                   |     | implement |                | tools | in medicine  | should | be              | based on a |
| ------------- | --- | --------------- | --- | ------------ | --- | ----------------- | --- | --------- | -------------- | ----- | ------------ | ------ | --------------- | ---------- |
| useAImayshift |     | to innovativeor |     | experimental |     | use, andsorequire |     |           |                |       |              |        |                 |            |
|               |     |                 |     |              |     |                   |     | model's   | implementation |       | risk (rather | than   | design?specific |            |
re?evaluation
additional considerations for implementation. This factors, such as interpretability). Thus, we propose a practi-
processrequiresongoingmonitoringandreviewofanAIsystem's
|     |     |     |     |     |     |     |     | cal decision | algorithm |     | for the | ethical | implementation | of  |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --------- | --- | ------- | ------- | -------------- | --- |
outputstoensureriskcategorisationsareup?to?date.
black?boxAIsystemsinmedicine.Ouralgorithmalignswith
|     |     |     |     |     |     |     |     | recent changes | in  | the regulations |     | of AI | systems, | which now |
| --- | --- | --- | --- | --- | --- | --- | --- | -------------- | --- | --------------- | --- | ----- | -------- | --------- |
Our decision algorithm also emphasises proportional recommen- risk?based
|                   |                   |               |               |                  |       |                |           | adopt a       |              | approach.    |                 |             |                 |           |
| ----------------- | ----------------- | ------------- | ------------- | ---------------- | ----- | -------------- | --------- | ------------- | ------------ | ------------ | --------------- | ----------- | --------------- | --------- |
| dations for       | human?in?the?loop |               | processes,    |                  | such  | as clinical    | evalua-   |               |              |              |                 |             |                 |           |
| tion, human       | oversight         |               | and ethics    | review.          | This  | approach       | allows    |               |              |              |                 |             |                 |           |
|                   |                   |               |               |                  |       |                |           | By suggesting | proportional |              | recommendations |             |                 | for human |
| scarce healthcare |                   | resources     | (particularly |                  | those | requiring      | human     |               |              |              |                 |             |                 |           |
|                   |                   |               |               |                  |       |                |           | oversight,    | ethics       | review       | and clinical    | evaluation, |                 | we aim to |
| clinical input)   | to                | be allocated  |               | more efficiently |       | based          | on the AI |               |              |              |                 |             |                 |           |
|                   |                   |               |               |                  |       |                |           | support       | clinicians   | to implement |                 | AI systems  | into            | clinical  |
| system's          | risk level.       | Additionally, |               | our algorithm    |       | also considers | the       |               |              |              |                 |             |                 |           |
|                   |                   |               |               |                  |       |                |           | practice      | ethically    | and          | responsibly.    | Such        | decision?making |           |
cost?effectivenessofimplementinganAIsystemclinically,ensuring
|     |     |     |     |     |     |     |     | support | is essential | for | the widespread |     | adoption | of these |
| --- | --- | --- | --- | --- | --- | --- | --- | ------- | ------------ | --- | -------------- | --- | -------- | -------- |
thatresourcesaredistributedequitablywithinahealthcaresystem.
toolsinmedicine,asitfosterstechnicalinnovationwhilststill
|     |     |     |     |     |     |     |     | maintaining | patient | safety. |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------- | ------- | ------- | --- | --- | --- | --- |
However,therearealsoimportantlimitationstoourdecisional
| algorithm, | whichshould |     | beconsidered. |     |     |     |     |     |     |     |     |     |     |     |
| ---------- | ----------- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Firstly,itmaybedifficulttoaccuratelyevaluateanAIsystem'srisks Acknowledgments
andexpectedbenefits.Theremaybeanumberofreasonsforthis. Thisstudy/projectis supportedbytheNationalResearchFoundation,
For example, there may be a lack of historic data about existing Singapore, under its AI Singapore Programme (AISG Award No:
AISG3?GV?2023?012).Additionally,thisstudywasfundedinpartbythe
| (human) | processes | to compare |     | and validate | an  | AI's | clinical per- |          |                        |     |      |       |               |        |
| ------- | --------- | ---------- | --- | ------------ | --- | ---- | ------------- | -------- | ---------------------- | --- | ---- | ----- | ------------- | ------ |
|         |           |            |     |              |     |      |               | Wellcome | Trust [203132/Z/16/Z]. |     | This | study | was supported | by the |
formance.Or,itmaybedifficulttodeterminewhichmetricsshould
beusedforclinicalevaluation(particularlyinthecaseofgeneral? Wellcome Trust [Grant number: 226801] for the Discovery Research
|         |           |          |     |         |          |           |        | Platform for | Transformative |     | Inclusivity | in Ethics | and | Humanities |
| ------- | --------- | -------- | --- | ------- | -------- | --------- | ------ | ------------ | -------------- | --- | ----------- | --------- | --- | ---------- |
| purpose | AI, where | a system | can | perform | multiple | different | tasks, |              |                |     |             |           |     |            |
Research(ANTITHESES).Thefundershadnoroleinthepreparationof
whichitmaynothavebeenspecificallydesignedfor)[54,55]. this manuscript or the decision to submit for publication. For the
|     |     |     |     |     |     |     |     | purposeof | open access, | theauthorhas |     | applieda | CCBYpublic | copy- |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | ------------ | ------------ | --- | -------- | ---------- | ----- |
This concern presents an ongoing challenge for regulators rightlicencetoanyAuthorAcceptedManuscriptversionarisingfrom
| andcliniciansalike,especiallygiventhatmarketapprovalin |     |          |     |           |     |         |             | thissubmission. |     |     |     |     |     |     |
| ------------------------------------------------------ | --- | -------- | --- | --------- | --- | ------- | ----------- | --------------- | --- | --- | --- | --- | --- | --- |
| many jurisdictions                                     |     | globally | is  | dependent |     | on risk | classifica- |                 |     |     |     |     |     |     |
tion[56].However,itseemslikelythatclinicalevaluationof DataAvailabilityStatement
| these systems | will | improve | over | time | as they | become | more |     |     |     |     |     |     |     |
| ------------- | ---- | ------- | ---- | ---- | ------- | ------ | ---- | --- | --- | --- | --- | --- | --- | --- |
Datasharingisnotapplicabletothisarticleasnodatasetsweregen-
commonplace in clinical practice. Until then, a proxy eratedoranalysedduringthecurrentstudy.
| 70  |     |     |     |     |     |     |     |     |     |     |     |     |     | Bioethics,2026 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | -------------- |

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
ôDoctor
Endnotes 15.C. Ye, E. Zweck, Z. Ma, J. Smith, and S. Katz, Versus
1WerecognisethatthetermsæinnovativeÆandæexperimentalÆareused ArtificialIntelligence:PatientandPhysician EvaluationofLargeLan-
guageModelResponsestoRheumatologyPatientQuestionsinaCross?
| extensively | throughout | the | bioethical | and | medical | literature with |           | Study,ö |           |                |           |     |                 |
| ----------- | ---------- | --- | ---------- | --- | ------- | --------------- | --------- | ------- | --------- | -------------- | --------- | --- | --------------- |
|             |            |     |            |     |         |                 | Sectional |         | Arthritis | & Rheumatology | (Hoboken, |     | N.J.) 76, no. 3 |
varying definitions, and sometimes interchangeably to mean the (2024):479û484,https://doi.org/10.1002/art.42737.
| same thing.See | Wilkinson |     | & Savulescu | [44]. | Papastefan | et al. [45], |     |     |     |     |     |     |     |
| -------------- | --------- | --- | ----------- | ----- | ---------- | ------------ | --- | --- | --- | --- | --- | --- | --- |
pp.1609û1612).Inthispaper,westrictlyrefertothesetermsasthey ôLarge
|     |     |     |     |     |     |     | 16.H.       | Decker, | K. Trang, | J. Ramirez,       | et  | al., | Language |
| --- | --- | --- | --- | --- | --- | --- | ----------- | ------- | --------- | ----------------- | --- | ---- | -------- |
|     |     |     |     |     |     |     | Model?Based |         |           | Surgeon?Generated |     |      |          |
aredescribedhere(i.e.,toprovideanormativeclassificationforthe Chatbot vs Informed Consent Docu-
Procedures,ö
implementationofdifferentAItools). mentation for Common JAMA Network Open 6, no. 10
(2023):e2336997,https://doi.org/10.1001/jamanetworkopen.2023.36997.
| References |     |     |     |     |     |     |       |             |       |                  |        |         | ôAccuracy |
| ---------- | --- | --- | --- | --- | --- | --- | ----- | ----------- | ----- | ---------------- | ------ | ------- | --------- |
|            |     |     |     |     |     |     | 17.R. | S. Goodman, | J. R. | Patrinely, C. A. | Stone, | et al., | and       |
Questions,ö
1.R. Cheluvappa and S. Selvendran, ôMedical Negligence?Key Cases Reliability of Chatbot Responses to Physician JAMA
and Application of Legislation,ö Annals of Medicine and Surgery 57 Network Open 6, no. 10 (2023): e2336483, https://doi.org/10.1001/
(2020):205û211,https://doi.org/10.1016/j.amsu.2020.07.017. jamanetworkopen.2023.36483.
18.J.W.Ayers,A.Poliak,M.Dredze,etal.,ôComparingPhysicianand
2.P.Rajpurkar,E.Chen,O.Banerjee,andE.J.Topol,ôAIinHealthand
Medicine,öNatureMedicine28,no.1(2022):31û38,https://doi.org/10. ArtificialIntelligenceChatbotResponsestoPatientQuestionsPostedto
aPublicSocialMediaForum,öJAMAInternalMedicine(2023),https://
1038/s41591-021-01614-0.
doi.org/10.1001/jamainternmed.2023.1838.
3.D.JuanManuelandJ.KarinRolanda,ôWhoIsAfraidofBlackBox
Algorithms? On the Epistemological and Ethical Basis of Trust in 19.P.D.Tailor,L.A.Dalvin,J.J.Chen,etal.,ôAComparativeStudyof
Expert?Edited
MedicalAI,öJournalofMedicalEthics47,no.5(2021):329,https://doi. Responses to Retina Questions From Either Experts,
Alone,ö
org/10.1136/medethics-2020-106820. Large Language Models (LLMs) or LLMs Ophthalmology
Science(2024):100485,https://doi.org/10.1016/j.xops.2024.100485.
| 4.A. J. London, | ôArtificial | Intelligence |     | and Black?Box |     | Medical Deci- |     |     |     |     |     |     |     |
| --------------- | ----------- | ------------ | --- | ------------- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- |
sions:AccuracyVersusExplainability,öHastingsCenterReport49,no.1 20.J. Gonzßlez?Corbelle, J. M. Alonso?Moral, A. Bugarφn?Diz, and
(2019):15û21,https://doi.org/10.1002/hast.973. J. Taboada, ôDealing With Hallucination and Omission in Neural
|                  |     |           |             |              |     |              | Natural   | Language | Generation:            | A Use      | Case on | Meteorology,ö | paper    |
| ---------------- | --- | --------- | ----------- | ------------ | --- | ------------ | --------- | -------- | ---------------------- | ---------- | ------- | ------------- | -------- |
| 5.J. C. Bjerring | and | J. Busch, | ôArtificial | Intelligence |     | and Patient? |           |          |                        |            |         |               |          |
|                  |     |           |             |              |     |              | presented | at       | the 15th International | Conference |         | on Natural    | Language |
CenteredDecision?Making,öPhilosophy&Technology34,no.2(2021):
Generation,Maine,US(2022).
349û371,https://doi.org/10.1007/s13347-019-00391-6.
|     |     |     |     |     |     |     | 21.W. | Shi, | Y. Zhuang, | Y. Zhu, H. Iwinski, |     | M. Wattenbarger, | and |
| --- | --- | --- | --- | --- | --- | --- | ----- | ---- | ---------- | ------------------- | --- | ---------------- | --- |
6.J.W.Allen,B.D.Earp,J.Koplin,andD.Wilkinson,ôConsent?GPT:
|               |             |            |     |            |                |       | M. D. | Wang, | ôRetrieval?Augmented | Large | Language | Models | for Ado- |
| ------------- | ----------- | ---------- | --- | ---------- | -------------- | ----- | ----- | ----- | -------------------- | ----- | -------- | ------ | -------- |
| Is It Ethical | to Delegate | Procedural |     | Consent to | Conversational | AI?,ö |       |       |                      |       |          |        |          |
lescentIdiopathicScoliosisPatientsinSharedDecision?Making,öPaper
| Journal of | Medical Ethics | 50, | no. 2 (2024): | 77û83, | https://doi.org/10. |     |     |     |     |     |     |     |     |
| ---------- | -------------- | --- | ------------- | ------ | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
presentedattheProceedingsofthe14thACMInternationalConference
1136/jme-2023-109347.
|     |     |     |     |     |     |     | on Bioinformatics, |     | Computational | Biology, | and | Health | Informatics, |
| --- | --- | --- | --- | --- | --- | --- | ------------------ | --- | ------------- | -------- | --- | ------ | ------------ |
7.J.Savulescu,A.Giubilini,R.Vandersluis,andA.Mishra,ôEthicsof Houston,TX,USA(2023),https://doi.org/10.1145/3584371.3612956.
ArtificialIntelligenceinMedicine,öSingaporeMedicalJournal65,no.3
22.O.Nov,N.Singh,andD.Mann,ôPuttingChatGPT'sMedicalAdvice
(2024):150û158,https://doi.org/10.4103/singaporemedj.SMJ-2023-27.
tothe(Turing)Test:SurveyStudy,öJMIRMedicalEducation9(2023):
8.P.A.KeaneandE.J.Topol,ôWithAnEyetoAIandAutonomous e46939,https://doi.org/10.2196/46939.
Diagnosis,önpjDigitalMedicine1,no.1(2018):40,https://doi.org/10.
23.Z.Sassi,M.Hahn,S.Eickmann,A.Herrmann?Johns,andM.Tretter,
1038/s41746-018-0048-y.
ôBeyondAlgorithmicTrust:InterpersonalAspectsonConsentDelegation
9.M.A.M.Afnan,Y.Liu,V.Conitzer,etal.,ôInterpretable,NotBlack? toLLMs,öJournalofMedicalEthics50,no.2(2024):139,https://doi.org/
Box, Artificial Intelligence Should Be Used for Embryo Selection,ö 10.1136/jme-2023-109799.
HumanReproductionOpen2021,no.4(2021):hoab040,https://doi.org/
24.A.Abid,M.Farooqi,andJ.Zou,ôLargeLanguageModelsAssociate
10.1093/hropen/hoab040.
|                     |     |        |           |         |             |         | Muslims      | With | Violence,ö | Nature Machine | Intelligence | 3,  | no. 6 (2021): |
| ------------------- | --- | ------ | --------- | ------- | ----------- | ------- | ------------ | ---- | ---------- | -------------- | ------------ | --- | ------------- |
|                     |     |        |           |         | ôComparison |         | 461û463,416. |      |            |                |              |     |               |
| 10.I. A. Bernstein, | Y.  | Zhang, | D. Govil, | et al., |             | of Oph- |              |      |            |                |              |     |               |
thalmologistandLargeLanguageModelChatbotResponsestoOnline ôDetecting
Questions,ö 25.W. Guo and A. Caliskan, Emergent Intersectional
| Patient Eye | Care |     | JAMA | Network | Open 6, | no. 8 (2023): |     |     |     |     |     |     |     |
| ----------- | ---- | --- | ---- | ------- | ------- | ------------- | --- | --- | --- | --- | --- | --- | --- |
Biases:ContextualizedWordEmbeddingsContainaDistributionof
e2330320,https://doi.org/10.1001/jamanetworkopen.2023.30320. Human?LikeBiases,öPaperpresentedattheProceedingsofthe2021
ôValidity
11.J. P. S. Nielsen, C. von Buchwald, and C. Gr°nh°j, of AAAI/ACMConferenceonAI,Ethics,andSociety(2021).
theLargeLanguageModelChatgpt(GPT4)asaPatientInformation 26.L.LucyandD.Bamman,ôGenderandRepresentationBiasinGPT?3
Source in Otolaryngology by a Variety of Doctors in a Tertiary Stories,ö
Department,ö Oto?laryngologica Generated Paper presented at the Proceedings of the Third
| Otorhinolaryngology |     |     | Acta |     |     | 143, no. 9 |     |     |     |     |     |     |     |
| ------------------- | --- | --- | ---- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- |
(2023):779û782,https://doi.org/10.1080/00016489.2023.2254809. WorkshoponNarrativeUnderstanding(2021).
27.J.SilbergandJ.Manyika,ôNotesFromtheAIFrontier:TacklingBias
12.E.Gibney,ôWhattheEU'sToughAILawMeansforResearchand inAI(andinHumans),öMcKinseyGlobalInstitute1,no.6(2019):1û31.
| ChatGPT,ö | Nature 626, | no. | 8001 (2024): | 938û939, | https://doi.org/10. |     |     |     |     |     |     |     |     |
| --------- | ----------- | --- | ------------ | -------- | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
28.J.Zerilli,A.Knott,J.Maclaurin,andC.Gavaghan,ôTransparencyin
1038/d41586-024-00497-8.
Decision?Making:
|     |     |     |     |     |     |     | Algorithmic |     | and Human |     | Is  | There a | Double Stan- |
| --- | --- | --- | --- | --- | --- | --- | ----------- | --- | --------- | --- | --- | ------- | ------------ |
13.B.Vasey,M.Nagendran,B.Campbell,etal.,ôReportingGuidelinefor dard?,öPhilosophy&Technology32,no.4(2019):661û683,https://doi.
theEarly?StageClinicalEvaluationofDecisionSupportSystemsDrivenby
org/10.1007/s13347-018-0330-6.
| Artificial Intelligence: |     | DECIDE?AI,ö | Nature | Medicine | 28, | no. 5 (2022): |     |     |     |     |     |     |     |
| ------------------------ | --- | ----------- | ------ | -------- | --- | ------------- | --- | --- | --- | --- | --- | --- | --- |
924û933,https://doi.org/10.1038/s41591-022-01772-9. 29.J. Kleinberg, H. Lakkaraju, J. Leskovec, J. Ludwig, and
|     |     |     |     |     |     |     |                  |     | ôHuman |           |     |         | Predictions,ö |
| --- | --- | --- | --- | --- | --- | --- | ---------------- | --- | ------ | --------- | --- | ------- | ------------- |
|     |     |     |     |     |     |     | S. Mullainathan, |     |        | Decisions | and | Machine |               |
14.F.Aydin,╓.T.Yildirim,A.H.Aydin,B.Murat,andC.H.Basaran, QuarterlyJournalofEconomics133,no.1(2017):237û293,https://doi.
| ôComparison |               | Intelligence?Assisted |     |     |          |         |     |     |     |     |     |     |     |
| ----------- | ------------- | --------------------- | --- | --- | -------- | ------- | --- | --- | --- | --- | --- | --- | --- |
|             | of Artificial |                       |     |     | Informed | Consent |     |     |     |     |     |     |     |
org/10.1093/qje/qjx032.
| Obtained | Before Coronary |     | Angiography | With         | the | Conventional |          |     |     |     |     |     |     |
| -------- | --------------- | --- | ----------- | ------------ | --- | ------------ | -------- | --- | --- | --- | --- | --- | --- |
|          |                 |     |             | Assessment,ö |     |              | 30.J.?E. |     |     |     |     | ôA  |     |
Method: Medical Competence and Ethical DIGITAL Bibault, B. Chaix, A. GuillemassΘ, et al., Chatbot Versus
HEALTH 9 (2023): 20552076231218141, https://doi.org/10.1177/2055 Physicians to Provide Information for Patients With Breast Cancer:
Blind,RandomizedControlledNoninferiorityTrial,öJournalofMedical
2076231218141.
71

 14678519, 2026, 1, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/bioe.70032 by Cochrane France, Wiley Online Library on [23/04/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
IntensiveCare,öMonashBioethicsReview35,no.1(2018):2û23,https://
| Internet | Research 21, no. | 11 (2019): | e15787, | https://doi.org/10.2196/ |     |                                    |     |     |     |     |     |     |     |
| -------- | ---------------- | ---------- | ------- | ------------------------ | --- | ---------------------------------- | --- | --- | --- | --- | --- | --- | --- |
| 15787.   |                  |            |         |                          |     | doi.org/10.1007/s40592-017-0075-5. |     |     |     |     |     |     |     |
ôInform
31.Z. Xiao, T. W. Li, K. Karahalios, and H. Sundaram, the 49.The White House, Executive Order on the Safe, Secure, and Trust-
uninformed:ImprovingOnlineInformedConsentReadingwithanAI?
worthyDevelopmentandUseofArtificialIntelligence.WashingtonDC:
Chatbot.ö
| Powered | Paper | presented | at the 2023 | CHI | Conference on | EO14110(2023). |     |     |     |     |     |     |     |
| ------- | ----- | --------- | ----------- | --- | ------------- | -------------- | --- | --- | --- | --- | --- | --- | --- |
Æ23),
Human Factors in Computing Systems (CHI Hamburg, 50.S.Singh,A.Djalilian,andM.J.Ali,ôChatGPTandOphthalmology:
Germany(2023).
|     |     |     |     |     |     | Exploring |     | Its Potential | With | Discharge | Summaries | and | Operative |
| --- | --- | --- | --- | --- | --- | --------- | --- | ------------- | ---- | --------- | --------- | --- | --------- |
Notes,öSeminarsinOphthalmology38,no.5(2023):503û507,https://
32.ArtificialIntelligenceAct(EuropeanParliament,2024).
|              | ôThe   |        |           |        |                | doi.org/10.1080/08820538.2023.2209166. |     |     |     |     |     |                |     |
| ------------ | ------ | ------ | --------- | ------ | -------------- | -------------------------------------- | --- | --- | --- | --- | --- | -------------- | --- |
| 33.G. Sachs, | Impact | of the | New EU AI | Act on | the Healthcare |                                        |     |     |     |     |     |                |     |
| Sector,ö     |        |        |           |        |                |                                        |     |     |     |     |     | ôInternational |     |
2024, https://www.cliffordchance.com/insights/resources/ 51.S. M. McKinney, M. Sieniek, V. Godbole, et al.,
EvaluationofanAISystemforBreastCancerScreening,öNature577,
blogs/talking-tech/en/articles/2024/03/the-impact-of-the-new-eu-ai-act-
no.7788(2020):89û94,https://doi.org/10.1038/s41586-019-1799-6.
on-the-healthcare-sector-scope-and-risk.html.
ôArtificial 52.C.Y.K.Williams,T.Zack,B.Y.Miao,etal.,ôUseofaLargeLan-
| 34.US Food | and Drug Administration |     | (FDA), |     | Intelligence |     |     |     |     |     |     |     |     |
| ---------- | ----------------------- | --- | ------ | --- | ------------ | --- | --- | --- | --- | --- | --- | --- | --- |
|            | (AI/ML)?Enabled         |     |        |     | Devices,ö    |     |     |     |     |     |     |     |     |
and Machine Learning Medical 2024, guage Model to Assess Clinical Acuity of Adults in the Emergency
Department,öJAMANetworkOpen7,no.5(2024):e248895,https://doi.
https://www.fda.gov/medical-devices/software-medical-device-samd/
artificial-intelligence-and-machine-learning-aiml-enabled-medical- org/10.1001/jamanetworkopen.2024.8895.
| devices. |     |     |     |     |     |       | Drezga?Kleiminger, |     |     | Demaree?Cotton, |     |     |         |
| -------- | --- | --- | --- | --- | --- | ----- | ------------------ | --- | --- | --------------- | --- | --- | ------- |
|          |     |     |     |     |     | 53.M. |                    |     |     | J.              |     | J.  | Koplin, |
ôShould
35.Medicine and Healthcare Products Regulatory Agency (MHRA), J. Savulescu, and D. Wilkinson, AI Allocate Livers for
ôSoftwareandAIasaMedicalDeviceChangeProgramme?Roadmap,ö Considerations,ö
|     |     |     |     |     |     | Transplant? |     | Public | Attitudes | and Ethical |     |     | BMC |
| --- | --- | --- | --- | --- | --- | ----------- | --- | ------ | --------- | ----------- | --- | --- | --- |
2023, https://www.gov.uk/government/publications/software-and-ai- MedicalEthics24,no.1(2023):102,https://doi.org/10.1186/s12910-
| as-a-medical-device-change-programme/software-and-ai-as-a-medical- |     |     |     |     |     | 023-00983-0. |          |     |           |               |     |              |     |
| ------------------------------------------------------------------ | --- | --- | --- | --- | --- | ------------ | -------- | --- | --------- | ------------- | --- | ------------ | --- |
| device-change-programme-roadmap.                                   |     |     |     |     |     |              |          |     |           |               |     | ôPerformance |     |
|                                                                    |     |     |     |     |     | 54.T.        | H. Kung, | M.  | Cheatham, | A. Medenilla, | et  | al.,         | of  |
|                                                                    |     |     |     |     | ôA  |              |          |     |           | AI?Assisted   |     |              |     |
36.Australian Alliance for Artificial Intelligence in Healthcare, ChatGPT on USMLE: Potential for Medical Education
|     |     |     |     |     | Healthcare,ö |     |     |     | Models,ö |     |     |     |     |
| --- | --- | --- | --- | --- | ------------ | --- | --- | --- | -------- | --- | --- | --- | --- |
National Policy Roadmap for Artificial Intelligence in Using Large Language PLOS Digital Health 2, no. 2 (2023):
2023, https://www.mq.edu.au/__data/assets/pdf_file/0005/1281758/ e0000198,https://doi.org/10.1371/journal.pdig.0000198.
AAAiH_NationalAgendaRoadmap_20231122.pdf. 55.K.Singhal,S.Azizi,T.Tu,etal.,ôLargeLanguageModelsEncode
37.MinistryofHealth,Singapore,ôArtificialIntelligenceinHealthcare ClinicalKnowledge,öNature620,no.7972(2023):172û180,https://doi.
(AIHGle),ö
Guidelines 2021, https://www.moh.gov.sg/docs/ org/10.1038/s41586-023-06291-2.
librariesprovider5/eguides/1-0-artificial-in-healthcare-guidelines-% 56.S.Gilbert,ôTheEuPassestheAIActandItsImplicationsforDigital
| 28aihgle%29_publishedoct21.pdf. |     |     |     |     |     |          |     | Unclear,ö |             |          |     |               |      |
| ------------------------------- | --- | --- | --- | --- | --- | -------- | --- | --------- | ----------- | -------- | --- | ------------- | ---- |
|                                 |     |     |     |     |     | Medicine | Are |           | npj Digital | Medicine | 7,  | no. 1 (2024): | 135, |
ôThe
38.A. Sauerbrei, A. Kerasidou, F. Lucivero, and N. Hallowell, https://doi.org/10.1038/s41746-024-01116-6.
ImpactofArtificialIntelligenceonthePerson?Centred,Doctor?Patient
|     |     |     |     |     |     |     |     | ôArtificial |     |     | Black?Box |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----------- | --- | --- | --------- | --- | --- |
Relationship:SomeProblemsandSolutions,öBMCMedicalInformatics 57.A. J. London, Intelligence and Medical Deci-
sions:AccuracyVersusExplainability,öHastingsCenterReport49,no.1
and Decision Making 23, no. 1 (2023): 73, https://doi.org/10.1186/ (2019):15û21,https://doi.org/10.1002/hast.973.
s12911-023-02162-y.
58.J.Zerilli,A.Knott,J.Maclaurin,andC.Gavaghan,ôTransparencyin
39.J.Bard,ôProtectingthePromisetotheFamiliesofTuskegee:Banning
Decision?Making:
|     |     |     |     |     |     | Algorithmic |     | and Human |     |     | Is There | a Double | Stan- |
| --- | --- | --- | --- | --- | --- | ----------- | --- | --------- | --- | --- | -------- | -------- | ----- |
the Use of Persuasive AI in Obtaining Informed Consent for Clinical dard?,öPhilosophy&Technology32,no.4(2019):661û683,https://doi.
DrugTrials,öSanDiegoLawReview60(2023):671,Forthcoming.
org/10.1007/s13347-018-0330-6.
40.K.Bykvist,Preferences(Preferentialism).
41.D.M.Hausman,ValuingHealth:Well?Being,Freedom,andSuffering
(OxfordUniversityPress,2015).
42.D.Parfit,OnWhatMatters,vol.1(OxfordUniversityPress,2011).
43.O.L.Aiyegbusi,C.McMullan,S.E.Hughes,etal.,ôConsiderations
| for Patient | and Public | Involvement | and | Engagement | in Health |     |     |     |     |     |     |     |     |
| ----------- | ---------- | ----------- | --- | ---------- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
Research,öNatureMedicine29,no.8(2023):1922û1929,https://doi.org/
10.1038/s41591-023-02445-x.
| 44.D. Wilkinson | and J. Savulescu, |     | Ethics, Conflictand |     | Medical Treat- |     |     |     |     |     |     |     |     |
| --------------- | ----------------- | --- | ------------------- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- | --- |
mentforChildren:FromDisagreementtoDissensus(Elsevier,2018).
45.S.T.Papastefan,C.DeBoer,S.Zeineddin,etal.,ôInnovationVersus
| Experimentation: | An Application      |     | of Ethical | Frameworks | to the     |     |     |     |     |     |     |     |     |
| ---------------- | ------------------- | --- | ---------- | ---------- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
|                  | Fluorescence?Guided |     |            | Surgery,ö  |            |     |     |     |     |     |     |     |     |
| Acceptance       | of                  |     | Pediatric  |            | Journal of |     |     |     |     |     |     |     |     |
1609û1612,
| Pediatric | Surgery 58, no. | 9 (2023): |     | https://doi.org/10. |     |     |     |     |     |     |     |     |     |
| --------- | --------------- | --------- | --- | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
1016/j.jpedsurg.2023.05.011.
46.R.VandersluisandJ.Savulescu,ôTheSelectiveDeploymentofAIin
| Healthcare,ö |               |       | 391û400, |                     |     |     |     |     |     |     |     |     |     |
| ------------ | ------------- | ----- | -------- | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|              | Bioethics 38, | no. 5 | (2024):  | https://doi.org/10. |     |     |     |     |     |     |     |     |     |
1111/bioe.13281.
ôNo
| 47.P. McCulloch, | D. G. Altman, | W.  | B. Campbell, | et  | al., Surgical |     |     |     |     |     |     |     |     |
| ---------------- | ------------- | --- | ------------ | --- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- |
InnovationWithoutEvaluation:TheIdealRecommendations,öLancet
374,no.9695(2009):1105û1112.
ôExpensive
| 48.D. Wilkinson, | S. Petrou, | and | J. Savulescu, |     | Care? |     |     |     |     |     |     |     |     |
| ---------------- | ---------- | --- | ------------- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
Resource?BasedThresholdsforPotentiallyInappropriateTreatmentin
| 72  |     |     |     |     |     |     |     |     |     |     |     | Bioethics,2026 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | -------------- | --- |
