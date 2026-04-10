<!--
  AI Triad Research Project — Document Snapshot
  Title      : Agentic AI and Occupational Displacement: A Multi-Regional Task Exposure Analysis of Emerging Labor Market Disruption
  Source     : 
  Type       : pdf
  Captured   : 2026-04-09
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Agentic AI and Occupational Displacement: A Multi-Regional Task Exposure Analysis of Emerging Labor Market Disruption

> **Snapshot captured:** 2026-04-09
> **Source:** 
> **Type:** pdf

---
6
2
0
2

r
a

M
1
3

]

Y
S
.
s
s
e
e
[

1
v
6
8
1
0
0
.
4
0
6
2
:
v
i
X
r
a

Agentic AI and Occupational Displacement: A
Multi-Regional Task Exposure Analysis of Emerging
Labor Market Disruption

Ravish Gupta1?
Saket Kumar2

1AI Lead, BigCommerce; IEEE Senior Member
2University at Buffalo, The State University of New York, Buffalo, NY, USA

Abstract

This paper extends the AcemogluûRestrepo task exposure framework to address the
labor market effects of agentic artificial intelligence systems: autonomous AI agents
capable of completing entire occupational workflows rather than discrete tasks. Unlike
prior automation technologies that substitute for individual subtasks, agentic AI sys-
tems execute end-to-end workflows involving multi-step reasoning, tool invocation, and
autonomous decision-making, substantially expanding occupational displacement risk
beyond what existing task-level analyses capture. We introduce the Agentic Task Ex-
posure (ATE) score, a composite measure computed algorithmically from O*NET task
data using calibrated adoption parametersùnot a regression estimateùincorporating
AI capability scores, workflow coverage factors, and logistic adoption velocity. Apply-
ing the ATE framework across five major United States technology regions (Seattleû
Tacoma, San Francisco Bay Area, Austin, New York, and Boston) over a 2025û2030
horizon, we find that 93.2% of the 236 analyzed occupations across six information-
intensive SOC groups (financial, legal, healthcare, healthcare support, sales, and ad-
ministrative/clerical) cross the moderate-risk threshold (ATE ? 0.35) in Tier 1 regions
by 2030, with credit analysts, judges, and sustainability specialists reaching ATE scores
of 0.43û0.47. We simultaneously identify seventeen emerging occupational categories
benefiting from reinstatement effects, concentrated in human-AI collaboration, AI gov-
ernance, and domain-specific AI operations roles. Our findings carry implications for
workforce transition policy, regional economic planning, and the temporal dynamics
of labor market adjustment. This work provides the first multi-regional empirical ap-
plication of the task exposure framework specifically targeting agentic AI systems and
contributes a reproducible scoring methodology for future labor market monitoring.

Keywords: Agentic AI; Task Exposure; Occupational Displacement; Labor Market; Work-
force Transition; Human-AI Collaboration; O*NET; Multi-Agent Systems

?Corresponding author: ravishgupta@ieee.org

1

1

Introduction

Economists have been predicting automation-driven job losses for decades, and the predic-
tions keep being directionally right but temporally wrong.
Industrial robots did displace
manufacturing workers, but not on the timeline or at the scale that the initial forecasts
implied [1]. When generative large language models arrived after 2022, the displacement
conversation shifted abruptly upmarket: suddenly it was lawyers, analysts, and radiologists
in the crosshairs, occupations that the prior literature had treated as automation-proof [2].
Yet almost all of these forecasts, including those built on the now-standard AutorûLevyû
Murnane task framework [3], share a quiet assumption: automation picks off tasks one at a
time, and the occupation survives as a coordination shell around the remaining human work.
A contract lawyer loses the drafting subtask to an LLM; the lawyering function persists.

Agentic AI demolishes that assumption. An agent does not nibble at one subtask and
hand control back. It receives a goal (ôreview this lease for non-standard indemnification
clauses and draft a redlineö), selects tools, executes a multi-step plan, checks its own output,
and delivers a finished work product [4]. No intermediate human touch. When that capability
exists, the economic logic changes. If an agentic bookkeeping system can close the monthly
books at 80% of the quality of a human bookkeeper, and a single human reviewer can
catch the remaining errors across fifty such agents, the organizational incentive is not to
redeploy bookkeepers to the leftover 20% of tasks. It is to eliminate the role and staff a
small exception-handling team.

This paper makes three contributions. First, we introduce the Agentic Task Exposure
(ATE) score, a composite metric that extends the AcemogluûRestrepo task displacement
framework [5] to account for end-to-end workflow coverage, current agentic AI capability
benchmarks, and enterprise adoption velocity. Second, we apply the ATE framework empir-
ically to 236 Standard Occupational Classification (SOC) codes spanning six major occupa-
tional groups, generating model-derived displacement projections across five major United
States technology regions for the 2025û2030 period. Third, we identify occupational cate-
gories where agentic AI creates reinstatement effects: new roles that did not exist before
agentic deployment creates demand for human oversight, governance, and collaboration at
scale.

The five regions under study are San Francisco Bay Area, SeattleûTacomaûBellevue,
AustinûRound Rock, New YorkûNewark, and BostonûCambridge. These metros rank among
the leading US centers for AI activity, collectively representing a substantial share of national
AI job postings, patent filings, and venture capital investment [6, 7] and represent the early-
adoption frontier from which labor market effects will diffuse nationally. The San Francisco
Bay Area, with the highest concentration of AI venture capital and patent activity, serves as
the Tier 1 leading indicator: its adoption curve is approximately 6û12 months ahead of Tier 2
hubs (Seattle, Austin, Boston) and 18 months ahead of Tier 3 metros (New York). Seattle
is of particular interest as a Tier 2 region anchored by Amazon Web Services, Microsoft,
and a dense ecosystem of AI-native companies. Its workforce effects in 2026û2027 preview
what the broader national non-technical workforce will experience in 2028û2030, following
the pattern established by the San Francisco Bay Area in 2024û2025.

The remainder of this paper is organized as follows. Section 2 reviews related work on
task-based automation frameworks and prior AI labor market analyses. Section 3 formal-

2

izes the ATE score and its components. Section 4 describes data sources and methodology.
Section 5 reports empirical results across occupations and regions. Section 6 analyzes re-
instatement effects and emerging roles. Section 7 discusses policy implications. Section 8
concludes.

2 Background and Related Work

2.1 Task-Based Frameworks for Automation Analysis

Autor, Levy, and Murnane [3] partitioned occupational tasks along two axes: routine versus
non-routine, and cognitive versus manual. They argued that automation substitutes for the
routine while complementing the non-routine. That two-by-two grid organized a generation
of labor economics. Acemoglu and Restrepo then cast the intuition in production-theoretic
terms [5, 8]: output results from a continuum of tasks allocated between capital and labor, so
that the labor share rises or falls depending on whether new-task creation (the reinstatement
channel) outpaces task displacement. Their contribution was to make the net employment
effect endogenous rather than assumed.

Frey and Osborne [9] took the occupation itself as the unit of analysis, asking experts to
score 702 US occupations on overall ôcomputerizability.ö The headline result (47% of occu-
pations at high risk) attracted enormous media attention and equally intense methodological
pushback. Arntz, Gregory, and Zierahn [10] showed that once the analysis drops to the task
level and accounts for task heterogeneity within nominally exposed occupations, high-risk
estimates fall to 9û14% across OECD countries. The debate is unresolved, but the field
converged on a practical consensus: task-level decomposition is necessary; occupation-level
labels are too coarse.

Two more recent indices are central to our own calibration. Felten, Raj, and Seamans
[11] built the AI Occupational Exposure (AIOE) score by linking published AI capability
advances to the O*NET ability taxonomy. Eloundou et al. [2] constructed a parallel measure
focused on GPT-4, combining crowd-worker annotations with GPT-4 self-assessments at the
task level. Their striking finding was that 80% of US workers hold jobs where at least 10% of
tasks are LLM-exposed, with the heaviest exposure concentrated among high-wage, degree-
requiring occupations. This upended the ôroutine-biased technical changeö narrative that
had dominated since the early 2000s.

2.2 Limitations of Existing Frameworks for Agentic AI

Every framework cited above shares an architectural blind spot: they model automation
as picking off individual tasks while the occupation stays intact, a residual structure for
human labor to fill. That assumption is reasonable for narrow AI (an image classifier, a
machine-translation engine, a code-completion plugin), each of which does one thing and
hands control back. Agentic systems violate the assumption wholesale. They chain tool
calls, maintain persistent memory across steps, plan multi-action sequences, and self-correct
when intermediate outputs fail quality checks [4].

Consider a concrete example familiar to any legal operations manager. A task-exposure

3

analysis might flag 80% of a paralegalÆs tasks as LLM-exposed yet conclude the occupation
is safe because coordinating those tasks demands human judgment: knowing which clause to
research first, when to escalate to the partner, how to handle a client who changes the fact
pattern mid-memo. An agentic system collapses that reasoning. It receives the research goal,
retrieves case law, drafts the memorandum, cross-checks citations against Westlaw, revises
to comply with the partnerÆs style guide, and delivers without intermediate hand-offs. The
coordination bottleneck that protected the paralegal role is now inside the agentÆs planning
module.

What is missing, then, is a measure of whether the full workflow composition of an
occupation sits inside agentic AIÆs operational envelope. We formalize this as the workflow
coverage factor below.

2.3 Agentic AI: Definitions and Capabilities

We define an agentic AI system as one that satisfies four criteria: (1) it receives a goal
specification rather than a task specification; (2) it autonomously selects and invokes tools
to pursue the goal; (3) it maintains state across multiple inference steps; and (4) it produces a
completed work product without human intervention at intermediate steps. This definition
encompasses current enterprise deployments of systems built on frameworks such as the
Model Context Protocol (MCP) [12], LangGraph, and AutoGen, as well as multi-agent
architectures in which specialized agents collaborate on complex goals.

The capability frontier moved fast in 2023û2024. GPT-4-class models reached at or above
passing-score thresholds on the bar exam and the US Medical Licensing Exam, and came
within a few percentage points of passing CFA Level I [13]. More relevant to our framework:
agentic extensions of these models began completing multi-step software engineering tasks
on SWE-bench, executing end-to-end financial analyses, and resolving customer service tick-
ets without human escalation. By mid-2024 this was no longer a research demo. Major
enterprise technology vendors (including Amazon, Microsoft, Salesforce, ServiceNow, and
Workday) disclosed production agentic deployments touching white-collar workflows in their
2024 earnings calls and investor presentations [4, 14]. These disclosures indicate the kind
companies make only when deployments are already affecting headcount planning.

3 Theoretical Framework: Agentic Task Exposure

3.1 The AcemogluûRestrepo Foundation

Let N denote the set of tasks required to produce value in an economy, with a subset NL ? N
performed by labor and NK ? N performed by capital. Automation technologies expand
NK at the expense of NL, creating the displacement effect. New task creation expands N at
the boundary where labor holds comparative advantage, creating reinstatement. Following
Acemoglu and Restrepo [5], the labor share in value added is:

sL =

W ╖ L
Y

= f

(cid:19)

(cid:18) |NL|
|N |

4

(1)

where W is the wage rate, L is employment, and Y is output. Automation that expands
NK reduces sL through the displacement effect; new task creation that expands NL restores
sL through the reinstatement effect.

3.2 The Agentic Task Exposure Score

We extend this framework by introducing the Agentic Task Exposure (ATE) score, which
measures the degree to which an occupation o is exposed to end-to-end displacement by
current agentic AI systems. ATE scores are computed algorithmically from O*NET task
data using calibrated adoption parameters; they are not regression estimates. For occupation
o with task set To drawn from O*NETÆs Task Statements database, the ATE score is:

ATEo(r, ? ) =

(cid:88)

t?To

wo,t ╖ CAP(t) ╖ COV(t, o) ╖ V (t, r, ? )

(2)

Figure 1 illustrates the full ATE computation pipeline from data inputs through score

aggregation. The components are:

ò wo,t ? [0, 1] is the importance-weighted relevance of task t in occupation o, drawn from
O*NET task importance ratings normalized to sum to unity within each occupation;

ò CAP(t) ? [0, 1] is the AI capability score for task t, measuring the current demonstrated
ability of agentic AI systems to perform task t at a level meeting professional standards,
estimated from AI benchmark literature and practitioner deployment reports;

ò COV(t, o) ? [0, 1] is the workflow coverage factor, measuring the degree to which task
t can be completed by an agentic system operating within occupation oÆs standard
workflow context (i.e., without human handoff for coordination, context-setting, or
exception handling that requires occupational judgment).

The key theoretical innovation in the ATE score relative to prior exposure measures
is the COV(t, o) term. Prior measures such as AIOE [11] and the Eloundou et al. GPT-
exposure measure [2] set COV(t, o) = 1 implicitly, treating every task as independently
completable by AI. The ATE score explicitly penalizes tasks that require human coordination
of multi-task workflows, inter-task context transfer, or exception handling beyond agentic
AIÆs current operational envelope. Because agentic systems handle workflow coordination
internally, COV(t, o) scores are higher than they would be under task-level AI analysis. This
means ATE scores are closer to (and for well-bounded workflows, exceed) prior exposure
estimates, and displacement risk is correspondingly higher for occupations with well-defined,
digital workflows.

3.3 Adoption Velocity and Temporal Projection

The adoption velocity parameter V (t, r, ? ) in Equation (2) captures the rate at which agentic
AI systems capable of performing task t will be deployed in region r by time ? . In the current
implementation, V does not vary across tasks within a region-year, so we simplify to V (r, ? ) =
L/(1 + e?k(? ??0)), a logistic (S-curve) adoption function [15] where ? is the projection year

5

O*NET 30.2
Tasks & Ratings

O*NET 30.2
Abilities

BLS OEWS
Employment

Regional
Adoption Data

wo,t
Task Weights

CAP(t)
AI Capability

COV(t, o)
Coverage

V (t, r, ? )
S-Curve

ATEo(r, ? ) = (cid:80) wo,t ╖ CAP(t) ╖ COV(t, o) ╖ V (t, r, ? )

Risk Classification:
High ? 0.65 ù Moderate 0.35û0.65 ù Low < 0.35

Figure 1: ATE computation pipeline. O*NET task statements and ratings feed into task
weights (wo,t), AI capability scores (CAP), and workflow coverage factors (COV). Regional
adoption data parameterize the S-curve velocity function V (t, r, ? ). The four components
are multiplied and summed across tasks to produce occupation-level ATE scores, which are
then classified by displacement risk threshold.

and ?0 is the inflection point. The parameters k (growth rate), ?0 (inflection point), and
L (saturation ceiling) are calibrated for each region using a three-tier metro classification
adapted from the Brookings InstitutionÆs AI readiness taxonomy [6], and externally anchored
against enterprise AI adoption surveys and employment outcome data (Section 5.6). Table 1
reports the calibrated values and their empirical basis.

An occupation is classified as high displacement risk if ATEo(r, ? ) ? 0.65, moderate risk if
0.35 ? ATEo(r, ? ) < 0.65, and low risk if ATEo(r, ? ) < 0.35. These thresholds are calibrated
to correspond approximately to the 70%, 35%, and 10% task displacement levels used in
prior literature [2, 9].

4 Data and Methodology

4.1 Occupational Task Data

Task-level data for 236 Standard Occupational Classification (SOC) codes spanning six ma-
jor groups (SOC 13 Financial, SOC 23 Legal, SOC 29 Healthcare, SOC 31 Healthcare Sup-
port, SOC 41 Sales, and SOC 43 Administrative/Clerical) are drawn from the O*NET 30.2
database [19], which provides task statements, importance ratings (1û5 scale), and relevance
ratings (0û100% scale) for each occupation. Task importance weights wo,t are computed as
the normalized product of importance and relevance ratings. After filtering to these six SOC
groups, the analysis dataset contains 4,577 task statements (from the full O*NET corpus of
18,796 statements across all occupations).

6

Table 1: S-Curve Adoption Parameters by Metro Tier

Region

Tier

k

?0

L

Calibration Basis

SF Bay Area

Seattle

Austin

Boston

New York

1

2

2

2

3

0.85

2024.25

0.92 Highest AI patent density and

0.62

2025.00

0.62

2025.00

VC investment per capita [7]

0.85 AWS/Microsoft anchor employ-
ers; WARN Act data [16]
0.85 Emerging hub; LinkedIn job

posting trends [17]

0.62

2025.00

0.85 University-anchored AI cluster

[7]

0.48

2025.75

0.78 Diverse economy dilutes AI con-

centration

Tier classification adapts BrookingsÆ AI readiness framework [6]. The growth rate k is bounded by
McKinseyÆs global enterprise AI adoption rate (k = 0.25, lower bound) and GartnerÆs agentic AI enterprise
app projection (k ? 2.1, upper bound; see Section 5.6); ?0 reflects each regionÆs estimated inflection point
consistent with McKinseyÆs finding that 62% of enterprises were experimenting with AI agents by mid-2025
[18]; L reflects the proportion of occupations within agentic AIÆs operational envelope given regional
industry composition. Sensitivity to these parameters is examined in Section 5.4; external anchoring
against four independent data sources is in Section 5.6.

4.2 AI Capability Scores

AI capability scores CAP(t) are estimated through a structured synthesis of: (1) published
AI benchmark results on tasks corresponding to occupation-relevant domains (MMLU, Hu-
manEval, LexGLUE, MedQA, FinBen); (2) published agentic AI evaluation results includ-
ing SWE-bench for software engineering and AgentBench for general agentic capability; and
(3) practitioner reports from enterprise AI deployments in financial services, legal, health-
care, and customer operations published by McKinsey Global Institute [14], Goldman Sachs
Research [20], and the Bureau of Labor Statistics [21]. CAP scores are operationalized us-
ing a BAIOE-style ability-weighted mapping: each occupationÆs O*NET ability profile (52
abilities with importance ratings) is combined with AI capability estimates for each abil-
ity category, derived from published benchmarks. Table 2 reports representative mappings.
The occupation-level CAP for a task is the importance-weighted mean of AI capability scores
across the occupationÆs ability profile, adjusted by a task-text modifier that boosts scores for
tasks with strong AI-benchmark alignment (e.g., data entry, correspondence) and reduces
them for tasks requiring physical or interpersonal execution.

4.3 Workflow Coverage Estimation

Workflow coverage factors COV(t, o) are estimated using a structured rubric evaluating each
task in the context of its occupationÆs standard workflow. Coverage is penalized when a task
triggers one or more of four penalty categories, each reducing the base COV multiplicatively:

ò P1 (?25%): Interpersonal context. The task requires real-time rapport, negotiation,
counseling, or emotional engagement not documentable in a task specification (key-
words: negotiate, counsel, mediate, comfort, de-escalate, patient interaction);

7

Table 2: Representative CAP Ability-to-AI Mappings (Selected Abilities)

O*NET Ability

Category

AI Score Benchmark Source

Cognitive
Written Comprehension
Cognitive
Written Expression
Cognitive
Deductive Reasoning
Information Ordering
Cognitive
Mathematical Reasoning Cognitive
Cognitive
Memorization
Cognitive
Speed of Closure
Sensory
Speech Recognition
Sensory
Near Vision
Psychomotor
Manual Dexterity
Physical
Static Strength

0.95
0.93
0.88
0.85
0.75
0.60
0.55
0.45
0.30
0.10
0.00

MMLU ?87%
GPT-4 bar exam, CFA
MMLU Logic ?88%
AgentBench planning
MATH benchmark ?75%
Context-window limited
Ambiguity resolution
Whisper ASR WER ?5û15%
Vision models (partial)
No physical capability
No physical capability

Full 52-ability mapping available in supplementary materials.

ò P2 (?30%): Regulatory/fiduciary accountability. The task involves legal liability, certi-
fication, sworn testimony, diagnosis, or binding agreements that current AI governance
frameworks do not support for autonomous action (keywords: fiduciary, regulatory
compliance, certify, notarize, prescribe, diagnose);

ò P3 (?40%): Physical presence. The task requires sensorimotor coordination, on-site
work, or manual handling (keywords: physically, lift, operate machinery, on-site, field
work);

ò P4 (?20%): Exception handling. The task involves crisis response, ambiguous situa-
tions, or novel judgments outside the standard envelope more than 30% of the time
(keywords: emergency, crisis, escalate, override, judgment call, novel situation).

Worked examples from O*NET task statements. For Sales Representatives of
Services (41-3091), the O*NET task ôNegotiate prices or terms of sales or service agreementsö
triggers P1 (negotiate), yielding COV = 1.0 ╫ 0.75 = 0.75. The task ôMaintain customer
records using automated systemsö triggers no penalties (COV = 1.0). Across all 15 O*NET
tasks for this occupation, only 1 triggers a penalty, producing a mean COV of 0.98.

For Health Information Technologists (29-9021), the task ôAssign the patient to diagnosis-
related groups (DRGs), using appropriate computer softwareö triggers P2 (diagnos), yielding
COV = 0.70. The task ôResolve or clarify codes or diagnoses with conflicting, missing, or
unclear informationö also triggers P2. Of 16 tasks, 2 trigger penalties, producing a mean
COV of 0.96.

Limitation: keyword false negatives. The keyword rubric produces false negatives
when interpersonal, regulatory, or physical dimensions are implicit rather than lexically
present in the O*NET task text. For instance, ôConsult with clients after sales or contract
signings to resolve problemsö is arguably interpersonal (P1) but does not contain the trigger
keyword. The rubric is therefore a lower bound on penalties (upper bound on COV), and a
validated expert rubric would be expected to reduce COV scores for mid-range occupations.

8

Semantic coverage pilot. To quantify the false-negative rate, we conducted a pilot
evaluation using an expanded semantic pattern set on all 4,577 O*NET task statements
across the 236 occupations in our study. The semantic patterns extend the keyword rubric
with contextual triggers. For example, they add ôconsult,ö ôconfer,ö ôadvise,ö and ôcollab-
orateö to the P1 interpersonal category, and ôapprove,ö ôauthorize,ö ôsentence,ö and ôverify
complianceö to P2 regulatory, while preserving the same four-category penalty structure.

Results indicate that the keyword rubric flags 632 tasks (13.8%) with at least one penalty,

while the semantic extension flags 1,142 tasks (25.0

The pilot reveals concrete implications for our top-ranked occupations. Credit Analysts
(13-2041), ranked #1, receive zero keyword penalties across all 11 tasks but would receive
semantic penalties on 4 of 11 tasks: ôConsult with customers to resolve complaintsö (P1),
ôContact customers to collect payments on delinquent accountsö (P1), ôConfer with credit
association and other business representativesö (P1), and ôComplete loan applications, in-
cluding credit analyses and submit for approvalö (P2). Judges (23-1023), ranked #2, would
gain seven additional penalties (five P1, two P2) beyond the single keyword-detected penalty,
including ôSentence defendants in criminal casesö (P2) and ôPreside over hearings and listen
to allegationsö (P1).

These results confirm that the keyword rubricÆs ATE scores represent upper-bound dis-
placement estimates. We retain the keyword rubric for the primary analysis due to its
transparency and reproducibility, but recommend that future implementations: (1) deploy
full LLM-based semantic classification with multiple independent passes to compute inter-
classifier agreement; (2) report COV scores with confidence intervals derived from classifier
variance; and (3) validate against expert human ratings on a stratified sample of at least
200 tasks spanning all six SOC groups. The complete keyword lists, semantic patterns, and
pilot results are available from the corresponding author upon request.

4.4 Regional Employment and Adoption Data

Employment counts by occupation and region are drawn from the BLS Occupational Em-
ployment and Wage Statistics (OEWS) program [22], using the May 2024 estimates for the
five Metropolitan Statistical Areas under study. Regional adoption velocity parameters are
calibrated using: Washington State Employment Security Department WARN Act notices
[16], LinkedIn Economic Graph job posting trend data [17], and enterprise AI investment
reports for each region.

The five regions and their 2024 total employment (thousands) are: SeattleûTacomaû
Bellevue (1,847); San Francisco Bay Area (2,431); AustinûRound Rock (1,234); New Yorkû
Newark (9,872); and BostonûCambridge (2,298). Combined, these MSAs account for ap-
proximately 11.3% of total US non-farm employment.

4.5 Remote Work and the Erosion of Geographic Adoption Buffers

A structural limitation of purely geography-based adoption models is that remote and hy-
brid work arrangements decouple a workerÆs physical location from their employerÆs technol-
ogy adoption tier. A financial analyst residing in Austin (Tier 2) but employed by a San
Franciscoûheadquartered firm (Tier 1) faces the adoption velocity of the employer, not the

9

residence metro. The BLS Current Population Survey publishes telework prevalence data by
occupation [23], and the information-intensive SOC groups in our study population exhibit
sharply divergent telework rates, as shown in Table 3.

Table 3: BLS CPS Table 60: Telework Rates by Occupation Group (2024 Annual Averages)

SOC Group

Workers (K) Total % Some Hrs % All Hrs %

Business & Financial Ops (13)
Legal (23)
Healthcare Practitioners (29)
Healthcare Support (31)
Sales & Related (41)
Office & Admin Support (43)

9,876
1,822
9,974
5,620
13,710
15,920

55.9
52.7
13.1
10.2
23.8
25.1

28.1
33.2
8.1
2.6
12.3
11.1

27.9
19.5
5.0
7.6
11.5
14.0

Ro

0.559
0.527
0.131
0.102
0.238
0.251

Source: BLS Current Population Survey, 2024 Annual Averages, Table 60. ôTotal %ö is the share of
workers who teleworked or worked at home for pay. Ro is the telework rate expressed as a proportion for
use in Equation 3.

To account for this, we introduce a remote work feasibility index Ro ? [0, 1] that adjusts
the effective adoption velocity experienced by workers in a given occupation. The effective
adoption velocity blends the residence regionÆs V with an employer-tier-weighted V :

Veff(o, r, ? ) = (1 ? Ro) ╖ V (r, ? ) + Ro ╖

(cid:88)

j

?j ╖ V (tierj, ? )

(3)

where Ro is the BLS-reported telework rate for occupation o (Table 3), and ?j is the share
of industry employment in adoption tier j, computed from BLS QCEW 2024 Annual Aver-
ages by Industry [24]. This formulation avoids the need for individual employerûresidence
microdata: instead of tracking which specific employer each remote worker belongs to, we
use the observed employment distribution across our five study MSAs as a proxy for the
employer-tier mix.

Table 4 reveals that remote work produces a convergence effect rather than the unidi-
rectional geographic buffer erosion hypothesized in prior literature. The QCEW data show
that only 12û16% of industry employment in our study MSAs is located in Tier 1 (SF Bay
Area), while 50û62% is in Tier 3 (New York). Consequently, the employer-weighted adoption
velocity (cid:80)
j ?jV (tierj, ? ) is lower than SF BayÆs local V but higher than New YorkÆs local
V .

For the San Francisco Bay Area (Tier 1), the remote-adjusted model reduces mean Fi-
nancial ATE by 16.8% and Legal ATE by 15.7% in 2027, because remote workers in SF
Bay are employed by firms distributed across all tiers, not exclusively local Tier 1 firms.
This means the residence-based model overestimates displacement risk for Tier 1 regions.
For New York (Tier 3), the adjustment increases Financial ATE by 9.2% and Legal ATE
by 8.9%, confirming that remote work transmits higher-tier adoption pressure into slower-
adopting regions. Tier 2 regions show modest decreases (?5û6% for Financial and Legal).
Healthcare occupations are minimally affected across all regions (▒1û4%) due to their low
telework rates (Ro < 0.14).

10

Table 4: Employer Tier Distribution ?j from QCEW 2024 and Remote Work Adjustment
Impact (2027)

Employer Tier Share ?j Mean ATE ? (2027)

SOC Group

Tier 1 Tier 2

Tier 3

SF Bay Tier 2

NY

Financial (13)
Legal (23)
HC Practitioners (29)
HC Support (31)
Sales (41)
Admin/Clerical (43)

12.2% 27.1%
14.6% 23.2%
15.9% 26.7%
15.9% 26.7%
15.9% 33.3%
10.2% 33.8%

60.7% ?16.8% ?6.1% +9.2%
62.1% ?15.7% ?5.6% +8.9%
57.4% ?3.8% ?1.2% +2.5%
57.4% ?2.9% ?0.9% +1.9%
50.7% ?6.5% ?1.8% +5.0%
56.0% ?7.4% ?2.6% +4.3%

Left panel: employer tier distribution computed from QCEW 2024 private-sector employment across the
five study MSAs. Tier 1 = SF Bay Area, Tier 2 = Seattle/Austin/Boston, Tier 3 = New York. Right
panel: percentage change in mean ATE scores under the remote-adjusted model (Equation 3) relative to
the residence-based baseline, by region and SOC group.

The net effect is regional convergence: remote work compresses the ATE gap between
the fastest and slowest-adopting metros. We retain the residence-based V (r, ? ) as the pri-
mary specification in Tables 5 and 6, and report the remote-adjusted results as a sensitivity
analysis. The full remote-adjusted ATE scores for all 236 occupations are available from the
corresponding author upon request.

5 Results

5.1 ATE Score Distribution Across Occupations

Table 5 presents the twenty occupations with the highest projected ATE scores by 2027
in the San Francisco Bay Area (Tier 1), selected as the upper-bound adoption scenario.
Figure 2 shows the full distribution of 2027 ATE scores across all 236 occupations for three
representative regions. In the SF Bay Area (Tier 1), the distribution is concentrated in the
moderate-risk range: 99 occupations (41.9%) fall in the 0.35û0.40 band and 68 (28.8%) in
the 0.40û0.45 band, with only 69 occupations (29.2%) remaining below the moderate-risk
threshold. The distribution shifts leftward with decreasing adoption tier: Tier 2 (Seattle)
is concentrated in the 0.25û0.30 modal bin, while Tier 3 (New York) centers on 0.20û0.25.
This tier-dependent shift illustrates the adoption velocity effect: the same 236 occupations
exhibit markedly different risk profiles depending on regional deployment speed.

Several observations emerge from Table 5, which reports results for the San Francisco
Bay Area (Tier 1 adoption region) to illustrate the upper bound of near-term displacement
dynamics. First, financial and legal occupations rank highest, reflecting their combination
of high AI capability scores and well-bounded digital workflows. Credit Analysts (13-2041)
lead at ATE 0.47 in 2030, tied with Judges and Magistrates (23-1023) and Sustainability
Specialists (13-1199). Second, the growth from 2025 to 2030 scores (e.g., Credit Analysts:
0.31 to 0.47) is driven by the S-curve adoption model: the inflection point for Tier 1 regions
is calibrated at Q2 2024, meaning deployment has already passed the steepest acceleration

11

SF Bay (Tier 1)
Seattle (Tier 2)
New York (Tier 3)

5
3
.
0
=
E
T
A

Count

200

150

100

50

0

0.15

0.20

0.25

0.30

0.35

0.40

0.45

ATE Score

Figure 2: Distribution of 2027 ATE scores across all 236 occupations for three representative
regions. The dashed red line marks the moderate-risk threshold (ATE ? 0.35). In the SF
Bay Area (Tier 1), 70.8% of occupations exceed this threshold; in Seattle (Tier 2), 0%; in
New York (Tier 3), 0%. The rightward shift from Tier 3 to Tier 1 reflects the adoption
velocity differential parameterized by the S-curve model.

phase and is approaching saturation. Third, occupations ranked 1û20 in Table 5 cluster
tightly in the 0.42û0.47 ATE range for 2027û2030, reflecting the workflow coverage penalties
applied to tasks requiring interpersonal coordination and exception handling that agentic
systems do not yet complete autonomously. Fourth, the preventive medicine physician entry
(29-1229, marked å in the table) appears despite requiring physical presence; this reflects the
keyword-based COV rubricÆs known false-negative limitation for implicit physical require-
ments (see Section 4.3). A notable feature of Table 5 is that all top-20 occupations share ATE
scores within a narrow band (0.42û0.47 by 2027), and no occupation in our study reaches
the high-risk threshold (ATE ? 0.65) even by 2030. This reflects genuine similarity in their
underlying ability profiles and the effect of the COV penalty structure: these occupations
are predominantly cognitive-digital with few physical or interpersonal penalty triggers, pro-
ducing convergent ATE estimates, but each retains sufficient exception-handling, regulatory,
or interpersonal task components to prevent scores from reaching the upper range. The im-
plication is important: our framework predicts widespread moderate risk across information-
processing occupations rather than catastrophic displacement of any single occupation. The
displacement pressure is broad but bounded, consistent with the gradual workforce recompo-
sition pattern rather than mass layoff scenarios. The framework differentiates meaningfully
between these moderate-exposure information-processing roles and low-exposure occupations
requiring substantial physical or interpersonal interaction (which score below 0.35).

12

Table 5: Top 20 Occupations by Projected ATE Score (San Francisco Bay Area), 2027

Occupation (SOC)

Category

2025

2027

2030

0.31
Financial
Credit Analysts (13-2041)
Judges & Magistrates (23-1023)ç
0.31
Legal
0.31
Financial
Sustainability Specialists (13-1199)
0.31
Financial
Regulatory Affairs Specialists (13-1041.07)
0.31
Financial
Market Research Analysts (13-1161)
Preventive Medicine Physicians (29-1229)å
0.31
Healthcare
0.30
Financial
Business Continuity Planners (13-1199)
Financial
0.30
Financial Examiners (13-2061)
Admin/Clerical 0.30
Statistical Assistants (43-9111)
0.30
Financial
Search Marketing Strategists (13-1161)
0.30
Cost Estimators (13-1051)
Financial
0.30
Equal Opportunity Representatives (13-1041.03) Financial
0.30
Financial
Labor Relations Specialists (13-1075)
0.30
Financial
Financial Risk Specialists (13-2054)
0.30
Sales
First-Line Supervisors (41-1012)
0.30
Sales
Securities Sales Agents (41-3031)
0.30
Financial
Insurance Underwriters (13-2053)
0.30
Financial
Personal Financial Advisors (13-2052)
0.30
Legal
Admin. Law Judges (23-1021)
0.30
Financial
Logisticians (13-1081)

0.43
0.43
0.43
0.43
0.43
0.43
0.42
0.42
0.42
0.42
0.42
0.42
0.42
0.42
0.42
0.42
0.42
0.42
0.42
0.42

0.47
0.47
0.47
0.47
0.47
0.47
0.46
0.46
0.46
0.46
0.46
0.46
0.46
0.46
0.46
0.46
0.46
0.46
0.46
0.45

åHealthcare practitioner occupations whose ATE scores may overstate displacement risk due to the
keyword-based COV rubricÆs known false-negative limitation for implicit physical presence requirements
(see Section 4.3). çJudicial occupations score high on technical AI capability for legal research, document
analysis, and case management tasks, but face strong institutional and constitutional protections
(Article III tenure, separation of powers) that the ATE framework does not model; the score reflects
technical exposure to agentic AI capabilities, not practical displacement likelihood for constitutionally
protected roles.

5.2 Regional Variation

Table 6 shows the share of occupations within each major category that cross the moderate-
risk threshold (ATE2027 ? 0.35) across our five study regions, computed from our full 236-
occupation dataset.

The regional pattern in Table 6 reveals a striking concentration effect driven by adop-
tion velocity. At the ATE2027 ? 0.35 threshold, the San Francisco Bay Area (Tier 1) shows
substantially higher displacement rates across all occupational categories: 78.4% of Adminis-
trative/Clerical, 91.7% of Financial, and 100% of Legal occupations cross the moderate-risk
threshold. Tier 2 regions (Seattle, Austin, Boston) show zero crossings at the same 2027
horizon, but the mean ATE values reveal a more detailed picture than the binary threshold
suggests: Tier 2 Financial occupations average 0.31 in 2027, just 0.04 below the 0.35 cutoff,
indicating these regions sit at the threshold boundary rather than operating in a different
regime.

The 2030 columns demonstrate temporal convergence.

In aggregate, 93.2% of all 236

13

Table 6: Share of Occupations Crossing ATE ? 0.35 (%) and Mean ATE by Region, 2027
vs. 2030

Seattle

SF Bay

Austin

New York

Boston

Category

Admin/Clerical (43)
Financial (13)
Legal (23)
Healthcare (29)
Sales (41)
HC Support (31)

Æ27

0.0
0.0
0.0
0.0
0.0
0.0

Æ30

Æ27

Æ30

74.5
87.5
100.0
43.8
63.6
10.5

78.4
91.7
100.0
65.2
68.2
15.8

92.2
95.8
100.0
98.9
95.5
57.9

Æ27

0.0
0.0
0.0
0.0
0.0
0.0

Æ30

74.5
87.5
100.0
43.8
63.6
10.5

Æ27

0.0
0.0
0.0
0.0
0.0
0.0

Æ30

0.0
8.3
14.3
1.1
0.0
0.0

Æ27

0.0
0.0
0.0
0.0
0.0
0.0

Æ30

74.5
87.5
100.0
43.8
63.6
10.5

Mean ATE by Category (2027 / 2030)

Admin/Clerical (43)
Financial (13)
Legal (23)
Healthcare (29)
Sales (41)
HC Support (31)

.30 / .37
.31 / .39
.33 / .40
.28 / .35
.29 / .36
.26 / .32

.38 / .41
.40 / .43
.42 / .45
.36 / .39
.38 / .41
.33 / .35

.30 / .37
.31 / .39
.33 / .40
.28 / .35
.29 / .36
.26 / .32

.23 / .31
.24 / .33
.25 / .34
.22 / .30
.23 / .31
.20 / .27

.30 / .37
.31 / .39
.33 / .40
.28 / .35
.29 / .36
.26 / .32

Upper panel: percentage of occupations in each SOC group crossing ATE ? 0.35. Lower panel:
category-level mean ATE (2027 / 2030). The 2027-to-2030 comparison reveals temporal convergence:
Tier 2 regions reach Tier 1Æs 2027 displacement levels by 2030.

analyzed occupations (220 of 236) cross the moderate-risk threshold in the SF Bay Area by
2030, with only Healthcare Support (57.9%) remaining substantially below saturation. By
2030, Tier 2 regions reach displacement levels comparable to SF Bay AreaÆs 2027 position:
87.5% of Financial and 100% of Legal occupations cross the threshold in Seattle, Austin, and
Boston by 2030, closely matching SF BayÆs 91.7% and 100% in 2027. This 2û3 year lag is the
central empirical finding: the same occupations face offset displacement timelines depending
on local adoption velocity, and the offset is quantifiable from the S-curve parameters. Tier 3
(New York) lags further, with only 8.3% of Financial and 14.3% of Legal occupations crossing
by 2030, reflecting its lower saturation ceiling (L = 0.78) and later inflection point.

The policy implication is that workforce transition programs must be regionally staged:
Tier 1 interventions are needed now, Tier 2 interventions should be planned and budgeted
now for deployment in 2028û2029, and Tier 3 regions have a wider but not indefinite planning
window.

5.3 Comparison with Prior Estimates

Our ATE framework produces estimates that are more conservative than raw GPT-4 token-
level exposure analysis but more actionable for labor market policy, because ATE scores
represent effective deployment probability rather than theoretical capability. Eloundou et
al. [2] found that GPT-4 could affect at least 10% of tasks for 80% of the U.S. workforce;
our ATE estimates capture a narrower but more consequential subset: occupations where
agentic AI can complete workflows end-to-end without human handoff at current deployment

14

scale.

For bookkeeping and accounting clerks (43-3031), the highest-frequency occupation in
prior literature (Frey and Osborne estimated 98% computerization probability; Arntz et al.
revised this to 35% using task-level analysis), our computed ATE in the San Francisco Bay
Area by 2027 is 0.41, reflecting that agentic bookkeeping systems are actively deployed at
enterprise scale in Tier 1 regions but that audit review and exception handling still require
human oversight for compliance reasons. Notably, our highest-ATE occupations by 2027
are credit analysts, judges, and financial specialists (13-2041, 23-1023, ATE 0.43). These
occupations have high cognitive AI-capability scores and well-bounded digital workflows.
This finding diverges from prior task-level analyses that concentrated displacement risk in
routine clerical work, and suggests that agentic AIÆs workflow-completion capability shifts
the frontier of displacement toward information-intensive professional roles.

5.4 Sensitivity Analysis

To assess the stability of our results under parameter uncertainty, we conduct one-at-a-time
sensitivity analysis on the three S-curve parameters and the COV penalty weights, using the
San Francisco Bay Area (Tier 1) as the baseline.

S-curve parameters. The saturation ceiling L exerts the largest influence: a ▒10%
change in L produces a ▒10.0% change in V (2027). Growth rate k has moderate impact:
▒20% variation in k shifts V (2027) by ?5.0% to +3.4%. The inflection point ?0 shows
symmetric sensitivity: shifting ?0 by ▒6 months changes V (2027) by approximately ▒3û5%.
Critically, no parameter perturbation within plausible ranges changes the ordinal ranking of
occupations or the finding that Tier 1 regions show dramatically higher displacement shares
than Tier 2 and Tier 3 regions. Reclassifying Seattle from Tier 2 to Tier 1 would increase
its projected adoption level V (2027) by 27.3%, but the regional divergence finding persists
because the tier assignment reflects structural differences in AI employer density and venture
capital concentration.

Three-scenario k stress test. The one-at-a-time analysis above perturbs k by ▒20%;
however, Section 5.6 documents a more substantial concern: the calibrated Tier 1 value
(k = 0.85) exceeds the logistic fit to Indeed job-posting data (k ? 0.14) by a factor of
approximately 6. To assess whether this discrepancy undermines the paperÆs qualitative
conclusions, we run a full three-scenario stress test spanning a range that brackets both
values. Table 7 reports the percentage of occupations crossing the moderate-risk threshold
(ATE ? 0.35) for each tier under Conservative (kT1 = 0.40, kT2 = 0.30, kT3 = 0.23), Baseline
(current calibration), and Aggressive (kT1 = 1.20, kT2 = 0.85, kT3 = 0.65) scenarios. All
other parameters (L, ?0, occupation base-ATE components) are held fixed; only k varies.

The qualitative risk ordering SF Bay > Tier 2 > New York holds in all nine scenario-
year combinations, confirming that the tier hierarchy is not an artifact of the assumed k
value. The magnitude and timing of threshold crossings are, however, highly k-sensitive: by
2027, SF Bay crosses the 0.35 threshold for only 2.5% of occupations under Conservative
assumptions but 87.3% under Aggressiveùa 35-fold differenceùwhile New York remains
at 0% until 2030 under Conservative and Baseline scenarios and reaches only 28.8% under
the most rapid adoption scenario. These results confirm that while the timing and scale
of displacement risk depend substantially on the true steepness of the adoption curve (an

15

Table 7: k-Sensitivity Analysis: Percentage of Occupations Crossing ATE ? 0.35
Risk Threshold. Three adoption-velocity scenarios stress-test the S-curve steepness param-
eter k, spanning a Conservative (kT1 = 0.40) to Aggressive (kT1 = 1.20) range. This range
deliberately brackets the 6╫ discrepancy between the calibrated Baseline value (k = 0.85)
and the empirically fitted trend from job-posting data (k ? 0.13; Section 5.6), assessing
whether the qualitative risk ordering SF Bay > Tier 2 > New York holds regardless of k as-
sumption.

Conservative

Baseline

Aggressive

Tier / Metro

2025 2027 2030 2025 2027 2030 2025 2027 2030

Tier 1 SF Bay Area
Tier 2 Seattle / Austin / Boston
Tier 3 New York

0.0
0.0
0.0

2.5
0.0
0.0

69.9
3.4
0.0

0.0
0.0
0.0

70.8
0.0
0.0

93.2
60.2
2.5

0.0
0.0
0.0

87.3
19.9
0.0

94.1
70.3
28.8

Note: Values are the percentage of 236 O*NET occupations with recomputed ATE ? 0.35 under each
scenario. Base ATE components (wo,t, CAP, COV) are held fixed; only k varies. S-curve parameters: Tier 1
(?0 = 2024.25, L = 0.92); Tier 2 (?0 = 2025.00, L = 0.85); Tier 3 (?0 = 2025.75, L = 0.78).

open empirical question), the relative vulnerability of technology-hub metros versus financial-
center metros is a robust qualitative finding that persists across the full range of plausible k
values.

COV penalty weights. Halving all four penalty weights (P1ûP4) increases the highest-
ATE occupationÆs score from 0.47 to approximately 0.48, a modest 2% increase. This limited
sensitivity reflects the fact that the highest-scoring occupations (credit analysts, judges,
financial specialists) already have few penalty-triggering tasks. COV sensitivity is more
pronounced for mid-range occupations: correspondence clerks (ATE 0.45) would rise to
approximately 0.49 under halved penalties, potentially crossing the high-moderate boundary.
This shows the importance of the COV rubric for occupations in the 0.35û0.65 range.

CAP scores. A uniform ▒10% shift in all cognitive ability AI scores shifts ATE scores
by approximately ▒7û8%, preserving relative rankings. Because CAP enters multiplicatively
with task weights that are normalized within each occupation, absolute CAP changes affect
all occupations proportionally, leaving the cross-occupation and cross-regional comparative
analysis stable.

5.5 External Validation of CAP Scores

To assess whether our AI capability scoring methodology captures a genuine exposure sig-
nal rather than arbitrary calibration, we compare ATE scores against two independently
computed AI exposure indices using different methodologies.

Convergent validity with AIOE. Felten, Raj, and Seamans [11] constructed the AI
Occupational Exposure (AIOE) index by mapping documented AI capabilities to O*NET
abilities. This methodology is structurally similar to our CAP scoring but was developed
independently with different AI capability benchmarks and weighting schemes. Matching
193 of our 236 occupations by SOC code, we find a Spearman rank correlation of ? = 0.84
(p < 10?6) between mean ATE scores and AIOE scores. The strong correlation confirms that

16

our CAP methodology captures the same underlying exposure signal as an independently
validated measure.

Convergent validity with GPT exposure. Eloundou et al. [2] estimated GPT-4
exposure scores using a different approach: combined human annotator and GPT-4 self-
assessment ratings at the task level, aggregated to occupations. Matching all 236 occupa-
tions, we find ? = 0.72 (p < 10?6). The moderately lower correlation relative to AIOE
is expected: the Eloundou et al. measure captures raw LLM capability exposure without
workflow coverage adjustments, while our ATE score incorporates COV penalties that sys-
tematically reduce scores for occupations with interpersonal, regulatory, or physical barriers
to agentic automation.

Interpretable divergences. Occupations where ATE ranks substantially lower than
AIOE or GPT exposure (such as Postal Service Clerks, ATE rank 159 vs. AIOE rank 16,
and Travel Agents, ATE rank 175 vs. AIOE rank 64) are precisely those with high COV
penalty loads from physical presence (P3) or interpersonal engagement (P1) requirements.
This pattern confirms that the COV term performs its intended function: discounting raw
AI capability exposure for occupations where workflow barriers prevent end-to-end agentic
automation.

5.6 S-Curve Parameter Anchoring

The S-curve parameters in Table 1 are calibrated values rather than directly estimated from
a single time series. To assess whether these parameters fall within empirically plausible
ranges, we triangulate against four independent data sources spanning different facets of AI
adoption.

Growth rate (k) bounds. Fitting a logistic function to the McKinsey Global AI
SurveyÆs enterprise adoption time series (n = 9 annual observations, 2017û2025) yields k =
0.25 (R2 = 0.70) for broad AI adoption [18]. The low R2 reflects that broad enterprise AI
adoption did not follow a clean S-curve during this window; the k = 0.25 estimate from this
fit represents a lower bound because it covers all forms of machine learning and analytics,
not specifically agentic systems. At the upper bound, Gartner projects that AI agents will
be embedded in 40% of enterprise applications by end of 2026, up from less than 5% in 2025
[25]. This implies a single-year growth factor of ?8╫, consistent with k ? 2.1 during the
steepest adoption phase. Our Tier 1 value of k = 0.85 falls between these bounds, reflecting
agentic AIÆs faster-than-broad-AI but slower-than-peak-app-integration adoption trajectory.
Inflection point (?0) consistency. McKinseyÆs 2025 State of AI survey (fielded Juneû
July 2025) finds that 62% of enterprises were at least experimenting with AI agents by
mid-2025, with 23% actively scaling [18]. Under a logistic model, the point at which 62%
of eventually-adopting organizations have initiated engagement corresponds to a period 1û2
years past the inflection point. This places the inflection in the 2023.5û2024.5 range for
the global average. Our Tier 1 inflection of ?0 = 2024.25 is consistent with San Francisco
Bay Area enterprises leading the global average, while Tier 2 (?0 = 2025.0) and Tier 3
(?0 = 2025.75) reflect the expected adoption lag for regions with lower AI employer density.
Indeed AI posting share. The Indeed Hiring LabÆs AI job posting tracker [26] provides
a weekly time series of AI-related postings as a share of all job listings. Fitting a logistic
function to US data (2019û2026, n = 373 weekly averages) yields k = 0.13, ?0 = 2030,

17

R2 = 0.39. The poor fit and late inflection reflect that this series measures demand for AI
workers, not enterprise agentic deployment. This is a leading indicator that tracks labor
market adjustment rather than technology adoption directly. Notably, the series shows
clear acceleration in late 2025 (rising from 2.7% in March 2025 to 4.8% in February 2026),
consistent with the post-inflection deployment phase predicted by our model.

Employment outcome consistency. The strongest anchoring evidence comes from
observed labor market effects. At the paperÆs calibrated values, V (SF Bay, 2025 Q1) ? 0.62
and V (NY, 2025 Q1) ? 0.34. The QCEW data (Section 5.7) show SF Bay Administrative
employment declining 9.3% year-over-year in Q1 2025 while New York shows much smaller
changes. This tier gradient is consistent with the V differential.
If the S-curve parame-
ters were substantially wrong (e.g., if ?0 were 2 years later), the predicted V gap between
Tier 1 and Tier 3 in early 2025 would be negligible, contradicting the observed employment
divergence.

5.7 Empirical Validation Against Employment Outcomes

A critical test of any displacement framework is whether its scores predict actual labor market
outcomes. We assess the ATE frameworkÆs predictive validity using two complementary
approaches: occupation-level analysis using BLS OEWS data (2023û2024) and industry-
level analysis using BLS QCEW quarterly data (2024û2025).

Occupation-level analysis (2023û2024, pre-inflection). Matching ATE scores for
296 occupationûregion pairs against year-over-year employment changes from the BLS Oc-
cupational Employment and Wage Statistics (May 2023 vs. May 2024), we find a null overall
result (Spearman ? = ?0.04, p = 0.47, n = 296). We report this transparently: the
occupation-level ATE score does not predict employment changes in the 2023û2024 window
at conventional significance levels. However, three subsidiary patterns emerge that are con-
sistent with a pre-inflection interpretation. First, the direction is consistent: occupations
above the median ATE grew at +2.0% versus +4.5% for those below, a 2.5 percentage-point
gap. Second, Sales occupations (SOC 41) show a statistically significant negative correlation
(? = ?0.40, p = 0.017, n = 35), with mean employment declining 6.4%. Third, the weak
aggregate signal is consistent with the S-curve modelÆs timing: the Tier 1 inflection point
is calibrated at Q2 2024, meaning the 2023û2024 OEWS window captures the pre-inflection
phase when displacement pressure is building but has not yet reached observable magnitude
for most occupations.

Industry-level analysis (2024û2025, post-inflection). To capture the 2025 accel-
eration in agentic AI deployment, we analyze BLS Quarterly Census of Employment and
Wages (QCEW) data for Q1ûQ3 2025 [24], comparing year-over-year employment changes
across the five NAICS industries corresponding to our six SOC study groups. This analysis
operates at the industry╫MSA level rather than the occupation level, providing a comple-
mentary test of the frameworkÆs sector-level predictions.

The results reveal a sharp divergence between high-ATE and low-ATE industries.
In
Q2 2025, high-ATE industries (NAICS 52 Finance, NAICS 5411 Legal, NAICS 5614 Busi-
ness Support) show mean year-over-year employment change of ?0.6%, while the low-ATE
industry (NAICS 62 Healthcare) shows +3.6%. This is a differential of 4.2 percentage points
(p < 0.05 by permutation test). Within the San Francisco Bay Area (Tier 1), the contrast is

18

starker: Administrative/Business Support employment fell 9.3% year-over-year in Q1 2025
and 5.9% in Q2, while Healthcare employment grew 4.7%. This gap exceeds 14 percentage
points within the same metropolitan area.

The tier gradient predicted by the S-curve model is partially visible: SF Bay (Tier 1) Fi-
nancial employment declined 6.1% in Q1 2025 (employment-weighted across the San Jose and
San FranciscoûOakland MSAs), compared to ?1.4% in Seattle and ?1.8% in Boston (both
Tier 2). Austin (Tier 2) is the exception, showing +4.3% Financial growth, likely reflecting
its status as an emerging hub still in a growth phase for financial services employment.

Temporal acceleration. Comparing the two validation windows reveals strengthening
displacement signals: the 2023û2024 occupation-level analysis shows a 2.5 pp high-ATE
vs. low-ATE gap, while the 2024û2025 industry-level analysis shows a 4.2 pp gap. This
acceleration is consistent with the S-curve modelÆs prediction that deployment passes the
steepest adoption phase in 2024û2025 for Tier 1 regions. We note the important caveat that
industry-level employment changes reflect multiple factors beyond AI adoption, including
interest rate effects on financial services and post-pandemic normalization in healthcare
hiring. However, the differential pattern (information-processing industries declining while
physically-intensive healthcare grows, with the steepest declines concentrated in the region
with the highest AI employer density) is difficult to explain by macroeconomic factors alone,
as interest rates and business cycles affect all regions symmetrically.

Falsifiable prediction. The ATE framework generates a testable prediction for the
May 2025 OEWS data (forthcoming May 2026): occupation-level Spearman correlation be-
tween ATE scores and employment change should strengthen from ? = ?0.04 (2023û2024)
to ? < ?0.15 (2024û2025), with the largest effect in Tier 1 Financial and Administrative
occupations. We commit to reporting this result regardless of direction.

6 Reinstatement Effects and Emerging Occupations

The AcemogluûRestrepo model is not only a displacement story. Its less-cited but equally
important prediction is that new task creation partially offsets automation losses: the rein-
statement channel. Drawing on enterprise deployment patterns we have observed directly
and on public job-posting data, we identify seventeen occupational categories where agentic
AI generates net new demand for human labor. These cluster into four groups, each anchored
in a different failure mode of current agentic systems.

AI Operations and Oversight (5 roles). Agentic systems running at enterprise scale
break in ways that are tedious to diagnose and consequential to ignore: a credit-scoring agent
silently drifts when upstream data formats change; a legal research agent hallucinates a case
citation that passes superficial checks. Catching these failures requires human monitors
embedded in the production loop. We identify five roles along this axis: AI Operations
Specialist, Agentic System Monitor, AI Quality Reviewer, Agent Knowledge Engineer, and
AI Incident Manager.

Human-AI Collaboration Design (4 roles). Deploying an agentic system is not
a plug-and-play event. The surrounding workflow (who reviews the agentÆs output, how
exceptions escalate, what the fallback process looks like when the agent is offline) must be
redesigned deliberately. Roles along this axis include AI Workflow Designer, Human-AI

19

Interaction Specialist, AI Adoption Trainer, and Change Management Specialist (AI Focus).
Domain-Specific AI Direction (5 roles). The highest-value use of agentic AI is not
replacing a domain expert but freeing one from routine subtasks so she can focus on the
hard problems. A senior paralegal who once spent 70% of her time on document review now
spends 70% directing an agent and 30% on the judgment-intensive work that the agent cannot
touch. Roles in this cluster (Senior AI-Augmented Paralegal, AI-Assisted Financial Analyst,
Clinical AI Supervisor, AI-Directed Compliance Officer, and Strategic Market Analyst (AI-
Augmented)) represent the ôdomain expert turned AI directorö career path.

AI Governance and Ethics (3 roles). When an agentic system denies a loan, triages
a patient, or recommends a sentence, someone must be accountable. Current regulatory
frameworks lag the technology, creating demand for specialists who bridge the gap: AI
Compliance Officer, AI Ethics Reviewer, and Algorithmic Accountability Manager.

Labor market evidence for emerging roles. While these seventeen categories are
forward-looking, several show measurable labor market traction as of early 2026. Indeed.com
lists approximately 1,500 ôAI Reviewerö and 1,460 ôAI Workflow Designerö positions in the
US [26]; LinkedIn reports ôAI Engineerö among the fastest-growing job titles (143% year-
over-year increase in postings) [17]. The AI governance function is growing rapidly: the
International Association of Privacy Professionals (IAPP) reports that 98.5% of organiza-
tions surveyed need additional AI governance professionals [27], with median salaries for
AI governance roles exceeding $150,000. PwCÆs 2025 Global AI Jobs Barometer finds that
workers with AI skills earn a 56% wage premium over peers, doubled from 25% one year
prior [28]. These data points confirm that the reinstatement roles we identify are not specu-
lative. They are emerging in the labor market at precisely the occupational boundaries our
framework predicts.

Quantifying reinstatement magnitude. While precise headcount estimates for roles
that do not yet exist at scale require assumptions about organizational adoption speed,
we provide order-of-magnitude bounds under explicit assumptions.
In the San Francisco
Bay Area, OEWS May 2024 data show approximately 580,000 workers in administrative,
financial, and legal occupations (SOC groups 13, 23, and 43) matching the 91 occupations
with ATE2027 ? 0.35. We present three displacement conversion scenarios (the proportion
of workers in moderate-risk occupations who experience actual role reduction within 3 years
of crossing the threshold):

ò Low (10% conversion): ?58,000 displaced positions, requiring ?29,000û46,000 rein-

statement roles at historical reinstatement ratios of 50û80% [5];

ò Medium (20% conversion): ?116,000 displaced, ?58,000û93,000 reinstatement roles;

ò High (30% conversion): ?174,000 displaced, ?87,000û139,000 reinstatement roles.

The 50û80% reinstatement range is informed by the historical pattern documented by
Acemoglu and Restrepo [8], who find that new task creation has partially but not fully offset
displacement in prior automation waves; we adopt this range as a plausible bound consistent
with their empirical findings rather than as a directly reported statistic. The displacement
conversion rate is the least constrained parameter: no empirical precedent exists for agentic
AI deployment at this scale, and rates will depend on organizational decisions that are

20

difficult to model ex ante. These estimates should be treated as scenario bounds rather
than point predictions; longitudinal tracking of actual agentic deployment outcomes will be
required to validate or narrow these ranges.

A critical finding from this analysis is that the emerging roles are not primarily technical
in the traditional sense. They do not require programming expertise. They require the
ability to specify goals clearly for AI systems, domain expertise to evaluate AI outputs
critically, judgment about when AI outputs require human intervention, and interpersonal
skills to manage stakeholders through AI-driven workflow changes. This suggests that the
primary reskilling pathway is not from displaced occupations to software engineering, but
from displaced occupations to AI-directed versions of the same domain.

7 Policy Implications

7.1 Workforce Transition

The most immediate policy implication is one of timing. In the San Francisco Bay Area, 84
of 236 occupations cross the moderate-risk threshold by 2026, including health information
technologists (ATE 0.36), medical records specialists (ATE 0.36), and project management
specialists (ATE 0.37). Transition support delivered before displacement is more effective
than support delivered after a WARN notice has already been filed, yet most workforce
development programs are reactive by design. The ATE framework provides the leading
indicator that current policy infrastructure lacks.

On reskilling, the data argue against the instinct to retrain displaced workers as software
engineers. The reinstatement roles identified in Section 6 do not require coding. They
require a former paralegal who understands contract law well enough to catch an agentÆs
hallucinated clause, or a former financial analyst who can audit an AI-generated DCF model
for circular assumptions. Domain expertise is the scarce input; AI tool proficiency is a
learnable complement. Programs that build on existing occupational knowledge, rather
than discarding it in favor of a two-year computer science bootcamp, will produce faster,
higher-retention transitions.

Regional planning agencies face a particularly awkward asymmetry. In Tier 1 metros, 78û
92% of administrative and financial occupations cross the moderate-risk threshold by 2027;
in Tier 2 metros at the same horizon, zero do. Planning for a uniform national response
would either over-invest in regions where pressure has not materialized or under-invest where
it already has. The Yale Budget Lab [29] reaches a compatible conclusion: AI labor market
impacts are invisible in aggregate statistics but concentrated in specific occupationûregion
pockets visible through WARN filings and job-posting data. Regional differentiation is not
optional.

7.2 Reshaping Higher Education: From Knowledge Transmission

to AI-Augmented Judgment

If the occupations facing the steepest displacement curves are information-intensive pro-
fessional roles (credit analysts, legal specialists, financial examiners), then the university

21

programs producing tomorrowÆs credit analysts, lawyers, and financial examiners cannot
keep teaching the same workflows that agentic systems will execute autonomously. The ped-
agogical question is no longer ôCan the student build this DCF model?ö but rather ôCan
the student spot the fabricated revenue assumption in the DCF model that an agent built?ö
This reorientation touches three competency areas at once. The first is hallucination
detection: the ability to audit AI-generated work products against ground truth. A finance
student needs to recognize when an agentic DCF uses circular cell references or hallucinates
a market comparable that does not exist in any filing. A pre-law student needs to verify case
citations against Westlaw, not trust that the agentÆs bluebook formatting implies the holding
is real. Our ATE scores point directly at where to concentrate this training. Occupations
with ATE ? 0.35 and low COV penalties are exactly the roles where agents produce plausible
but potentially flawed outputs at volume.

The second is exception handling under ambiguity. Look at the COV penalty categories:
interpersonal negotiation (P1), regulatory judgment (P2), physical presence (P3), crisis re-
sponse (P4). These are the tasks that agentic systems cannot yet complete. They are also,
not coincidentally, the tasks that current curricula underweight relative to technical content.
A curriculum reform grounded in the ATE framework would shift classroom hours toward
case-based instruction in precisely these dimensions, the durable human skills.

The third is AI tool proficiency as a baseline professional expectation. Spreadsheet fluency
was not optional for a 1995 finance graduate; AI agent direction should not be optional for
a 2028 one. This does not mean requiring Python. It means requiring every finance student
to know how to specify constraints for an agentic research workflow, evaluate intermediate
outputs, and recognize when to override an automated recommendation.

ATE scores provide universities an empirically grounded triage: programs feeding ATE2030 ?

0.40 occupations (Financial, Legal, Administrative) should integrate these competencies im-
mediately, while programs feeding lower-ATE fields (Healthcare Support, ATE2030 ? 0.32û
0.35) have a longer, though not indefinite, window.

7.3 Employer Responsibilities

Employers deploying agentic AI systems bear responsibilities that existing regulatory frame-
works do not fully address. WARN Act notification thresholds apply to mass layoffs but
not to the gradual reduction in force through AI substitution that our analysis finds more
characteristic of agentic deployment. Voluntary disclosure of agentic AI deployment plans,
combined with advance notice to affected workers, would allow transition support to be-
gin before displacement occurs. Several jurisdictions (Colorado, Illinois) are developing AI
employment impact disclosure requirements that could serve as models.

8 Conclusion

The central claim of this paper is straightforward: agentic AI changes what ôautomation
exposureö means, and the existing task-level frameworks (however carefully constructed)
cannot capture the shift. The ATE score we introduced here extends Acemoglu and Re-
strepoÆs displacementûreinstatement model to account for end-to-end workflow completion,

22

and the empirical application across 236 occupations in five US metros produces a finding
that should concern workforce planners. In the San Francisco Bay Area, 78.4% of admin-
istrative and 91.7% of financial occupations cross the moderate-risk threshold by 2027. In
Seattle, Austin, and Boston, none do at that horizon, but by 2030 they converge to 74.5%
and 87.5%, respectively. The same occupations, the same exposure profiles, are separated
by a 2û3 year adoption lag that remote work is actively compressing.

The reinstatement side of the ledger is real but takes a different shape than prior automa-
tion waves. The seventeen emerging roles we identify do not demand software engineering
skills. They demand domain expertise turned inward: a credit analyst who can audit an
agentÆs output, a compliance officer who can specify regulatory constraints for an autonomous
workflow. Reskilling programs that force displaced workers into coding bootcamps are solv-
ing the wrong problem.

We are candid about what the framework does not yet do well. CAP and COV scores rest
partly on practitioner judgment where published benchmarks are thin. However, external
validation against the independently constructed AIOE (? = 0.84) and GPT exposure (? =
0.72) indices provides reassurance that the signal is genuine, not an artifact of our calibration
choices (Section 5.5). The keyword-based COV rubric has a documented false-negative
rate (Section 4.3) that makes our ATE scores an upper bound on displacement risk. The
remote work adjustment relies on aggregate telework rates rather than granular employer-
tier data. The analysis is scoped to five United States metros by design: O*NET task data
and BLS employment counts are the most granular publicly available inputs for this type
of framework, and establishing validity in a single country before extending internationally
is methodologically sound practice. The ATE framework itself is country-agnostic ù it
requires only an occupational task database, AI capability benchmarks, and adoption velocity
calibration ù and an international extension using OECD PIAAC and Eurostat data is
currently in development.

Where should the research go next? The keyword COV rubric should be replaced by a
validated LLM-based semantic classifier reporting confidence intervals across multiple inde-
pendent passes. The falsifiable prediction in Section 5.7 is that occupation-level correlations
between ATE and employment change will strengthen from ? = ?0.04 to ? < ?0.15 when
May 2025 OEWS data release. This is the most direct test of the frameworkÆs value, and we
commit to reporting the result regardless of direction. Beyond that, longitudinal tracking of
actual agentic deployment outcomes will be needed to calibrate the displacement conversion
rates that remain the least constrained parameter in our model. Extension to international
labor markets is currently underway. The ATE framework requires only an occupational task
database, AI capability benchmarks, and region-specific adoption velocity parameters ù in-
puts available for OECD economies through PIAAC and Eurostat. The most consequential
open questions for the international case are whether the COV penalty structure (calibrated
on US regulatory and workflow norms) transfers to labor markets with different collective
bargaining arrangements, stronger worker-protection regimes, or structurally different sector
compositions, and how to parameterize adoption velocity tiers for economies with varying
AI readiness levels and regulatory environments such as the EU AI Act.

The methodology and scoring rubrics used in this analysis are available upon request
to support replication and ongoing labor market monitoring. Specifically, the authors can
provide: (1) the complete CAP scoring table mapping O*NET ability categories to AI

23

capability estimates with benchmark sources; (2) the four-penalty COV rubric with worked
examples for representative occupations; (3) the regional S-curve parameters with calibration
sources; and (4) the Python computation pipeline reproducing all ATE scores reported in
this paper from publicly available O*NET and BLS data.1

Disclosure of Interests

This work was conducted independently and does not relate to the authorsÆ positions at
BigCommerce or the University at Buffalo, nor does it represent the views or interests of
these organizations. The authors have no competing interests to declare that are relevant to
the content of this article.

References

[1] David H. Autor. Why are there still so many jobs? the history and future of workplace

automation. Journal of Economic Perspectives, 29(3):3û30, 2015.

[2] Tyna Eloundou, Sam Manning, Pamela Mishkin, and Daniel Rock. GPTs are GPTs:
An early look at the labor market impact potential of large language models. arXiv
preprint arXiv:2303.10130, 2023.

[3] David H. Autor, Frank Levy, and Richard J. Murnane. The skill content of recent
technological change: An empirical exploration. The Quarterly Journal of Economics,
118(4):1279û1333, 2003.

[4] Lei Wang et al. A survey on large language model based autonomous agents. Frontiers

of Computer Science, 18(6):186345, 2024.

[5] Daron Acemoglu and Pascual Restrepo. Automation and new tasks: How technology
displaces and reinstates labor. Journal of Economic Perspectives, 33(2):3û30, 2019.

[6] Mark Muro,
where, but
tan Policy Program,
ai-seems-everywhere-but-regional-readiness-is-uneven.

every-
seems
Institution Metropoli-
URL https://www.brookings.edu/articles/

Jacob Whiton,
readiness
2024.

and Robert Maxim.
Brookings

is uneven.

regional

AI

[7] Nestor Maslej et al. Artificial intelligence index report 2024. Technical report, Stan-
ford Institute for Human-Centered Artificial Intelligence (HAI), 2024. URL https:
//aiindex.stanford.edu/report/.

[8] Daron Acemoglu and Pascual Restrepo. Robots and jobs: Evidence from US labor

markets. Journal of Political Economy, 128(6):2188û2244, 2020.

1Supplementary materials

at
ravishgupta@ieee.org. The repository contains all computation scripts, CAP mappings, COV key-
word lists, and reproducibility instructions.

corresponding

from the

available

author

code

and

are

24

[9] Carl Benedikt Frey and Michael A. Osborne. The future of employment: How suscep-
tible are jobs to computerisation? Technological Forecasting and Social Change, 114:
254û280, 2017.

[10] Melanie Arntz, Terry Gregory, and Ulrich Zierahn. The risk of automation for jobs
in OECD countries: A comparative analysis. Technical Report 189, OECD Social,
Employment and Migration Working Papers, 2016.

[11] Edward W. Felten, Manav Raj, and Robert Seamans. The occupational impact of
artificial intelligence: Labor, skills, and polarization. Technical report, NYU Stern
Working Paper, 2021.

[12] Anthropic. Model context protocol: An open standard for AI agent tool use. Anthropic

Technical Documentation, 2024. URL https://modelcontextprotocol.io.

[13] OpenAI. GPT-4 technical report. arXiv preprint arXiv:2303.08774, 2023.

[14] McKinsey Global Institute. The economic potential of generative AI: The next produc-

tivity frontier. Technical report, McKinsey & Company, 2023.

[15] Frank M. Bass. A new product growth for model consumer durables. Management

Science, 15(5):215û227, 1969.

[16] Washington State Employment Security Department. WARN act notices, 2023û2024,

2024. URL https://esd.wa.gov/about-employees/WARN.

[17] LinkedIn Economic Graph.

Corporation,
future-of-work-report-ai.

2024.

Future of work report: AI at work.

LinkedIn
URL https://economicgraph.linkedin.com/research/

[18] McKinsey & Company. The state of AI in 2025: Agents, innovation, and transformation.
McKinsey Global Survey, 2025. URL https://www.mckinsey.com/capabilities/
quantumblack/our-insights/the-state-of-ai. Survey field: June 25ûJuly 29, 2025;
n = 1,993 participants across 105 nations.

[19] National Center for O*NET Development. O*NET 30.2 database. US Department of La-
bor/Employment and Training Administration, 2025. URL https://www.onetcenter.
org.

[20] Goldman Sachs Research. The potentially large effects of artificial intelligence on eco-

nomic growth. Technical report, Goldman Sachs Economics Research, 2023.

[21] Bureau of Labor Statistics.
projections:

ment
February
incorporating-ai-impacts-in-bls-employment-projections.htm.

Occupational
URL

Incorporating AI

in BLS employ-
Monthly Labor Review,
https://www.bls.gov/opub/mlr/2025/article/

impacts

studies.

2025.

case

[22] Bureau of Labor Statistics. Occupational employment and wage statistics (OEWS),

May 2024. US Department of Labor, 2024. URL https://www.bls.gov/oes/.

25

[23] Bureau of Labor Statistics. Labor force statistics from the Current Population Survey,
table 60: People at work by telework status, usual full- or part-time status, occupation,
industry, and class of worker, 2024 annual averages. US Department of Labor, 2024.
URL https://www.bls.gov/cps/cpsaat60.htm.

[24] Bureau of Labor Statistics. Quarterly census of employment and wages, 2024 annual
averages by industry. US Department of Labor, 2024. URL https://www.bls.gov/
cew/downloadable-data-files.htm.

[25] Gartner, Inc. Gartner predicts 40% of enterprise apps will

feature task-specific
AI agents by 2026, up from less than 5% in 2025. Gartner Press Release, Au-
URL https://www.gartner.com/en/newsroom/press-releases/
gust
2025-08-26-gartner-predicts-40-percent-of-enterprise-apps-will-feature-task-specific-ai-agents-by-2026-up-from-less-than-5-percent-in-2025.

2025.

[26] Indeed Hiring Lab. AI job tracker: Share of job postings mentioning artificial intelli-
gence. Indeed Hiring Lab, GitHub data repository, 2024. URL https://github.com/
hiring-lab/AI-Hiring-Tracker.

[27] International Association of Privacy Professionals. AI governance in practice: 2025 pro-
fession report. IAPP Research, 2025. URL https://iapp.org/resources/article/
ai-governance-profession-report.

[28] PwC.

2025 global AI jobs barometer: Tracking the demand and rewards for AI
skills across the workforce. PwC Research, 2025. URL https://www.pwc.com/gx/
en/issues/artificial-intelligence/job-barometer.html.

[29] Martha Gimbel, Molly Kinder, Joshua Kendall, and Maddie Lee.

ing the impact of AI on the labor market: Current state of affairs.
Budget Lab at Yale,
evaluating-impact-ai-labor-market-current-state-affairs.

Evaluat-
The
URL https://budgetlab.yale.edu/research/

2025.

26
