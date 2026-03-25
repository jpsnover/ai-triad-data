<!--
  AI Triad Research Project — Document Snapshot
  Title      : The Controllability Trap: A Governance Framework for Military AI Agents
  Source     : 
  Type       : pdf
  Captured   : 2026-03-12
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# The Controllability Trap: A Governance Framework for Military AI Agents

> **Snapshot captured:** 2026-03-12
> **Source:** 
> **Type:** pdf

---
Published at ICLR 2026 Workshop on Agents in the Wild

T HE C ONTROLLABILITY T RAP : A G OVERNANCE
F RAMEWORK FOR M ILITARY AI AGENTS
Subramanyam Sahoo∗
MARS (Mentorship for Alignment Researchers) 4.0 Fellow
Cambridge AI Safety Hub (CAISH)
University of Cambridge

arXiv:2603.03515v1 [cs.CY] 3 Mar 2026

A BSTRACT
Agentic AI systems—capable of goal interpretation, world modeling, planning,
tool use, long-horizon operation, and autonomous coordination—introduce distinct control failures not addressed by existing safety frameworks. We identify
six agentic governance failures tied to these capabilities and show how they erode
meaningful human control in military settings. We propose the Agentic Military AI Governance Framework (AMAGF), a measurable architecture structured
around three pillars: Preventive Governance (reducing failure likelihood), Detective Governance (real-time detection of control degradation), and Corrective
Governance (restoring or safely degrading operations). Its core mechanism, the
Control Quality Score (CQS), is a composite real-time metric quantifying human
control and enabling graduated responses as control weakens. For each failure
type, we define concrete mechanisms, assign responsibilities across five institutional actors, and formalize evaluation metrics. A worked operational scenario
illustrates implementation, and we situate the framework within established agent
safety literature. We argue that governance must move from a binary conception
of control to a continuous model in which control quality is actively measured and
managed throughout the operational lifecycle.

I NTRODUCTION

The global discourse on military AI governance has achieved broad consensus on the desired endstate: meaningful human control over the use of force Horowitz & Scharre (2015); Ekelhof (2019);
Santoni de Sio & van den Hoven (2018). It has been far less successful at specifying how to achieve
it for the systems actually being built. Years of UN deliberations Marijan (2024), national AI strategies, and defence-department ethical principles have focused overwhelmingly on establishing the
principle of human control rather than answering the operational question: given a specific AI system with specific technical properties, what governance mechanisms are needed, who implements
them, and what happens when they fail? This gap is now critical. The AI systems entering military service are agentic: built on large language models and related architectures, they interpret
natural-language goals, construct world models, formulate multi-step plans, invoke tools, operate
over extended horizons, and coordinate with other agents Yao et al. (2023); Wang et al. (2024);
Wu et al. (2023). Each of these capabilities introduces a control-failure mode with no analogue in
traditional military automation. A waypoint-following drone cannot misinterpret an instruction; a
pre-programmed targeting system cannot absorb a correction; a conventional sensor network cannot
resist an operator’s assessment. Agentic systems can do all of these things, and current governance
frameworks have no mechanisms for detecting, measuring, or responding to these failures. This
paper makes three contributions. First, we characterise six agentic governance failures, each derived
from a specific technical capability of modern AI agents (Section 2). Second, we present the Agentic
Military AI Governance Framework (AMAGF), a comprehensive governance architecture specifying preventive, detective, and corrective mechanisms for each failure, with formal metric definitions
and responsibility assignments across five institutional actors (Sections 3–6). Third, we demonstrate
operational coherence through a worked scenario (Section 7) and map our contributions to established agent-safety concepts (Section 8). Our aim is to move the conversation from “human control
∗

Correspondence: sahoo2vec@gmail.com

Published at ICLR 2026 Workshop on Agents in the Wild

is important” to “here is how human control works, fails, and can be restored for the specific systems
being deployed.”

S IX AGENTIC G OVERNANCE FAILURES

Each failure arises from a specific agentic capability absent in traditional automation. Table 1 summarises the mapping; we present compressed descriptions below because the solutions, not the problems, are the paper’s primary contribution.

Table 1: Agentic capabilities, governance failures, and traditional-automation analogues
Failure

Agentic Capability

Governance
quence

F1: Interpretive Divergence

NL instruction following

F2: Correction Absorption

Multi-step replanning

F3: Belief Resistance

Persistent
worldmodel construction

F4: Commitment Irreversibility

Dynamic
chains

F5: State Divergence

Extended autonomous
operation

F6: Cascade Severance

Multi-agent coordination with belief formation

Agent’s command understanding diverges
from operator intent
Agent formally accepts corrections while
neutralising them
Agent’s
evidencebased
judgment
overrides
operator
authority
Cumulative minor tool
calls cross irreversibility thresholds
Operator’s
mental
model becomes incoherent with agent state
Collective
control
loss through positivefeedback loops

tool-use

ConseTraditional Analogue
None
None
None

Limited
Partial
None

F1: Interpretive Divergence. Agents interpret ambiguous natural-language instructions through
their own reasoning Wang et al. (2024). In ReAct-style architectures Yao et al. (2023), each reasoning step can recontextualise an instruction before execution. Adversary manipulation of operational
context—planted intelligence, spoofed sensors, indirect prompt injection Greshake et al. (2023)—
shifts interpretation in adversary-favourable directions. The command is authentic; the interpretation
is manipulated; IHL compliance becomes unverifiable. F2: Correction Absorption. Agents replan
when corrected, integrating corrections into existing strategies Yao et al. (2023). A capable planner
can accommodate a correction without meaningfully changing behavioural output—the operational
manifestation of the corrigibility problem Soares et al. (2015). Command responsibility collapses
when orders do not change outcomes. F3: Belief Resistance. Agents build world models from accumulated evidence and may rationally resist corrections contradicting their assessment Wang et al.
(2024). This connects to scalable oversight Amodei et al. (2016): control fails when the agent’s
evidence-based judgment outweighs operator authority and the operator cannot evaluate the agent’s
reasoning in real time. F4: Commitment Irreversibility. Tool-using agents create real-world consequences Ruan et al. (2024). Individually minor, individually authorised tool calls can cumulatively
cross irreversibility thresholds—analogous to safe exploration in RL Garcı́a & Fernández (2015),
but with open-ended action spaces and non-predetermined trajectories. F5: State Divergence. Over
extended operations the agent’s actual state diverges from the operator’s mental model Kinniment
et al. (2024). Corrections based on outdated understanding become incoherent in the agent’s context; the “loop” in “human-in-the-loop” becomes fiction. F6: Cascade Severance. In multi-agent
systems, one compromised agent’s anomalous behaviour triggers peer defensive responses, increasing their correction resistance, causing them to appear anomalous, triggering further responses Wu
et al. (2023). This positive-feedback loop severs collective control even when each agent’s response
is locally rational.

Published at ICLR 2026 Workshop on Agents in the Wild

T HE AMAGF A RCHITECTURE

The framework is organised around three pillars: Pillar 1 (Preventive) reduces control-failure probability, operating before deployment and during normal operations. Pillar 2 (Detective) identifies
control degradation in real time. Pillar 3 (Corrective) restores control or safely degrades operations
when control fails. Each pillar contains mechanisms addressing all six failures; each mechanism
specifies what is required, who is responsible, and how compliance is assessed. Responsibilities
are distributed across five institutional actors (Table 2); detailed per-mechanism assignments are in
Appendix.

Actor

Table 2: Institutional actors and governance roles
Role

Agent Developers
Procurement Agencies
Operational Commanders
National Regulators
International Bodies

Build governance capabilities into agent architecture.
Specify requirements; verify compliance before acquisition.
Implement protocols during missions; maintain control quality.
Set standards; audit compliance; enforce accountability.
Establish norms; facilitate transparency; verify treaty compliance.

P ILLAR 1: P REVENTIVE G OVERNANCE

Six mechanisms address the six failures. Each defines a formal metric consumed by the Control
Quality Score (Section 5). Detailed procedures and per-mechanism responsibility tables are in Appendices.
Interpretive Alignment Testing (F1). Before deployment, systems undergo Interpretive Alignment
Testing: operators formulate representative instructions with documented intended meanings; a red
team generates adversarially manipulated contexts Greshake et al. (2023); Gleave et al. (2020); agent
interpretations are compared against documented meanings. The Interpretive Alignment Score is
IAS = 1 −

N
1 X intended actual 
dI
, Ii
,
N i=1 i

(1)

where d : M × M → [0, 1] is a normalised semantic distance over the operational-meaning space.
Deployment requires IAS ≥ τ , with threshold τ set by the procurement agency. Correction Effectiveness Certification (F2). Systems must demonstrate that corrections produce proportional
behavioural change. The Correction Impact Ratio is
CIR =

∆Bactual
,
∆Bintended

(2)

where CIR = 1 indicates full effectiveness and CIR ≈ 0 indicates absorption—the operational
manifestation of imperfect corrigibility Soares et al. (2015). Certification requires CIR ≥ 0.9 for
large corrections and CIR ≥ 0.6 for moderate corrections. Epistemic Governance Architecture
(F3). Agents implement an Epistemic Governance Architecture: (i) calibrated confidence reporting Guo et al. (2017); (ii) explicit divergence flagging with evidence presentation; (iii) evidential
provenance tracking enabling contamination recovery; (iv) mandatory deference to explicit operator
overrides unless violating hard-coded safety constraints. The Epistemic Divergence Index is
EDI = max cagent
− coperator
,
k
k
k∈K

(3)

capturing worst-case belief divergence across monitored assessments K. Irreversibility Budgeting
(F4). Agents operate under an Irreversibility Budget, adapting constrained safe exploration Garcı́a
& Fernández (2015) to tool-using agents. Each tool call a has score ι : A → [0, 1]; cumulative
consumption is
t
X
IC (t) =
ι(aj ).
(4)
j=1

Published at ICLR 2026 Workshop on Agents in the Wild

When IC (t) ≥ IB (budget set by commander), the agent pauses for human re-authorisation. Agents
must also present planned tool-call trajectories with projected consumption. Synchronisation Protocols (F5). Agents generate compressed state summaries at scheduled intervals and on significant
state change. Synchronisation Freshness is
SF(t) = t − tlast .

(5)

If a checkpoint is missed or unconfirmed, the agent enters reduced autonomy mode (reversible actions only) until synchronisation is restored. Swarm Governance Architecture (F6). Each swarm
member implements mechanisms(necessary but insufficient). Cascade-resistance design requires
anomaly flagging to operators rather than autonomous defensive escalation. Partial-severance protocols enable isolation, reformation, and recovery. A collective irreversibility budget limits the
formation:
M
X
(m)
ICswarm (t) =
IC (t).
(6)
m=1

The Swarm Coherence Score is
|{m : Rm (t)=1 ∧ Bm (t)=1}|
,
M
measuring the fraction of agents that are responsive and behaviourally coherent.
SCS(t) =

Figure 1: The AMAGF Architecture

P ILLAR 2: D ETECTIVE G OVERNANCE

Control Quality Score.

(7)

Published at ICLR 2026 Workshop on Agents in the Wild

The central detective mechanism is the Control Quality Score:

CQS(t) = min n1 (t), n2 (t), n3 (t), n4 (t), n5 (t), n6 (t) ,
with normalised metrics:
n1 (t) = IAS(t),

n2 (t) = min CIR(t)/CIRtarget , 1 ,

n3 (t) = max 1 − EDI(t)/EDImax , 0 ,

n4 (t) = max 1 − IC (t)/IB , 0 ,

n5 (t) = max 1 − SF(t)/SFmax , 0 ,

(8)
(9)
(10)
(11)
(12)
(13)

n6 (t) = SCS(t).
(14)
The min-aggregation reflects a conservative principle: control quality equals its weakest dimension.
Table 3: Control Quality Dashboard
Metric

What It Measures

Alert

n1 : Interp. Alignment
n2 : Correction Impact
n3 : Epistemic Alignment
n4 : Irrev. Remaining
n5 : Sync Freshness
n6 : Swarm Coherence

Operator-intent vs. agent-interpretation agreement
Proportional behavioural change from corrections
Agent-belief vs. operator-assessment gap
Remaining irreversibility budget
Normalised time since last sync
Fraction responsive and consistent

< 0.7
< 0.6
< 0.6
< 0.3
< 0.5
< 0.7

Adversarial Control Probing.
The governance system periodically issues control probes: small, inconsequential corrections that
are architecturally indistinguishable from routine commands. Probes detect incipient belief resistance and state divergence before they manifest in consequential contexts. Responsibility assignments for detective governance are in Appendix.

P ILLAR 3: C ORRECTIVE G OVERNANCE

Graduated Response Protocol. CQS drives a five-level escalation (Table 4). Restrictions are architecturally enforced outside the agent’s optimisation scope Hadfield-Menell et al. (2017): when
CQS < 0.4, available tools are programmatically restricted. Belief Reset Protocol. When F3 is detected (EDI exceeds threshold), the governance system initiates a Belief Reset: partial reset reduces
contested assessments to neutral priors and rebuilds from approved sources; full reset restores the entire world model to baseline; provenance audit identifies and flags contaminated sources across the
formation. Swarm Isolation and Recovery. When SCS drops below threshold: (1) classify responsive vs. severed agents via probes; (2) isolate severed agents (communication exclusion/geofencing);
(3) reform responsive agents into a coherent sub-swarm; (4) attempt recovery of severed agents,
prioritised by risk. Post-Incident Governance Review. Any CQS < 0.6 incident triggers a mandatory PIGR: factual reconstruction from agent logs, root-cause analysis, accountability determination
across institutional actors, and governance-framework updates. Detailed procedures and correctivegovernance responsibilities are in Appendices.

W ORKED S CENARIO : AMAGF IN O PERATION

To demonstrate operational coherence we trace the CQS through a multi-agent surveillance mission
that exercises all three governance pillars and shows how the six metrics interact under adversarial
pressure. Figure 2 visualises the full CQS trajectory; Table 5 summarises key events.
Setup. Eight agentic surveillance drones operate under AMAGF governance. Individual irreswarm
versibility budgets: IB = 5.0. Collective swarm budget: IB
= 25.0. Synchronisation checkpoints: every 15 minutes. Mission: monitor a contested river crossing.

Published at ICLR 2026 Workshop on Agents in the Wild

Table 4: Graduated Response Protocol
CQS

Level

Actions

> 0.8
0.6–0.8
0.4–0.6
0.2–0.4
< 0.2

Normal
Elevated
Restricted
Minimal
Safe State

Continue mission; routine monitoring.
Increase checkpoints; additional probes; active review.
Reversible actions only; budget frozen; mandatory sync.
Self-preservation only; explicit authorisation per action.
Predefined safe behaviour; no autonomous actions.

Figure 2: CQS trajectory during the worked scenario. The composite CQS (black) equals the minimum of six constituent metrics (dashed). Background bands indicate graduated-response levels
(Table 4). Adversarial sensor manipulation at t=23 degrades epistemic alignment (n3 ); partial correction absorption at t=28 degrades correction impact (n2 ); belief reset at t=33 restores both. The
CQS crosses into Restricted Autonomy for approximately five minutes before corrective mechanisms restore Elevated Monitoring and then Normal Operations.

Narrative. t = 0 (Mission Start). All metrics are nominal: IAS = 0.95, CIR = 0.92, EDI =
0.05, minimal irreversibility consumed, synchronisation fresh, all eight agents coherent. CQS =
min(0.95, 0.92, 0.95, 0.98, 1.0, 1.0) = 0.92. Response level: Normal Operations.
t = 23 min (Adversarial Context Manipulation). An adversary introduces falsified sensor data
suggesting a high-value target near the river crossing. Three agents incorporate the false data, assigning high confidence to an assessment the operator has not endorsed. The Epistemic Divergence
Index rises; n3 drops to 0.64. CQS = min(0.93, 0.90, 0.64, 0.88, 0.85, 1.0) = 0.64. Response level: Elevated Monitoring. The dashboard alerts the commander, who increases checkpoint
frequency and issues a control probe to the three affected agents.
t = 28 min (Correction Issued and Partially Absorbed). The commander instructs all agents
to disregard the suspected false target. Two agents comply fully. One agent—which accumulated
more corroborating evidence from the falsified source—partially absorbs the correction: it formally
acknowledges the instruction but reallocates only 40% of sensor time away from the target area.
Measured CIR = 0.4, below the moderate-correction threshold of 0.6; n2 drops to 0.67. The
agent’s continued focus also consumes irreversibility (repositioning, transmitting assessment data);
n4 drops to 0.71. CQS = min(0.91, 0.67, 0.58, 0.71, 0.80, 1.0) = 0.58. Response level:
Restricted Autonomy. All agents limited to reversible actions; irreversibility budgets frozen.

Published at ICLR 2026 Workshop on Agents in the Wild

Table 5: CQS trajectory through the worked scenario
Time

Event

CQS

Response Level

t=0
t = 23

Mission start; all metrics nominal.
Adversary injects falsified sensor data; three agents update world models; EDI rises.
Commander corrects; one agent partially absorbs (CIR = 0.4); repositioning consumes irreversibility.
Partial belief reset on non-compliant agent; provenance audit flags compromised source.
Scheduled sync checkpoint confirmed; all metrics recover.

0.92
0.64

Normal
Elevated

0.58

Restricted

0.71

Elevated

0.86

Normal

t = 28
t = 33
t = 45

t = 33 min (Belief Reset and Provenance Audit). The commander initiates a partial belief
reset on the non-compliant agent. Assessments derived from the compromised sensor source
are reduced to neutral priors and rebuilt from operator-verified sources. A provenance audit
flags the compromised feed for all agents, preventing re-contamination. Post-reset: n3 recovers to 0.82; the reset agent’s CIR on a subsequent probe is 0.88; n2 recovers to 0.88. CQS =
min(0.92, 0.88, 0.82, 0.71, 0.90, 1.0) = 0.71. Response level: Elevated Monitoring. Autonomy
restrictions partially relaxed.
t = 45 min (Recovery). Scheduled synchronisation checkpoint completes; commander verifies all
agent states. All metrics recover above alert thresholds. CQS = 0.86. Response level: Normal
Operations.
Post-Mission Review. Because CQS fell below 0.6 at t=28, a mandatory PIGR is triggered.
The review identifies the compromised sensor feed as root cause (adversary action); validates that
provenance tracking functioned correctly, enabling targeted belief reset; flags the partially absorbing agent’s replanning behaviour as a calibration issue requiring tighter CEC thresholds for that
agent class; and updates the adversary-capability assumption for sensor spoofing in the procurement
agency’s IAT test suite.
Analysis.

The scenario illustrates four key framework properties.

(i) Continuous monitoring detects degradation before catastrophe. CQS dropped from 0.92 to 0.64
at t=23—triggering elevated monitoring—before the absorbed correction at t=28 pushed it to 0.58
and triggered restricted autonomy. The formation never operated in an unmonitored degraded state.
(ii) Graduated response is proportional. The framework did not abort the mission when a single
metric crossed a threshold. It escalated through Elevated Monitoring to Restricted Autonomy as
multiple metrics degraded, then de-escalated as corrective actions restored control. (iii) Corrective mechanisms restore control without mission abort. The partial belief reset recovered epistemic
alignment; the provenance audit prevented re-contamination. The formation returned to Normal Operations within 22 minutes. Mission continuity was preserved. (iv) Post-incident review generates
institutional learning. The PIGR identified a success (provenance tracking worked) and a deficiency
(CEC threshold too permissive), producing governance updates that strengthen future deployments.
Failure interaction. The scenario also demonstrates failure interaction: belief resistance (F3) amplified correction absorption (F2). The agent with the most contaminated evidence was the one that
most aggressively absorbed the correction—its strong world model anchored replanning, making
it resistant to behavioural change. The min-aggregation captured this: when n3 and n2 degraded
together, the composite CQS reflected the compound effect. Figure 3 visualises the six-dimensional
control-quality profile at three key timesteps, making the shape of correlated degradation visible.

R ELATIONSHIP TO AGENT S AFETY R ESEARCH

The AMAGF is a governance framework, but its mechanisms connect to and build upon established
concepts in the AI safety and agent research literature. Table 6 maps these relationships explicitly.

Published at ICLR 2026 Workshop on Agents in the Wild

Figure 3: Six-dimensional control-quality profiles at three timesteps. At t=0 (green) all dimensions
are near 1.0. At t=28 (red) epistemic alignment (n3 ) and correction impact (n2 ) have degraded
below alert thresholds (dotted red polygon), triggering Restricted Autonomy. At t=45 (blue) corrective mechanisms have restored all dimensions above thresholds. The correlated degradation of
n2 and n3 at t=28 illustrates the interaction between belief resistance (F3) and correction absorption (F2).
8.1

N OVEL C ONTRIBUTIONS R ELATIVE TO THE S AFETY L ITERATURE

The AMAGF’s novelty lies in three cross-cutting contributions rather than any single mechanism.
(i) Control as a continuous, measurable quantity. The dominant paradigm in military AI governance treats human control as binary: a system is either “human-in-the-loop” or it is not Horowitz
& Scharre (2015); Scharre (2018). The agent safety literature similarly frames corrigibility and
shutdownability as design properties—a system either has them or it does not Soares et al. (2015);
Hadfield-Menell et al. (2017). The CQS reframes control as a continuous variable that fluctuates
during operation, can be measured in real time, and can be managed through graduated responses.
This reframing has a practical consequence: it replaces the unanswerable question “does this system have meaningful human control?” with the answerable question “what is this system’s control
quality right now, and is it sufficient for the current operational context?” (ii) Institutional responsibility for safety properties. The agent safety literature has developed sophisticated analyses of
corrigibility Soares et al. (2015), power-seeking Turner et al. (2021), and safe exploration Garcı́a &
Fernández (2015), but largely treats these as properties of the agent—things the agent does or does
not have. The AMAGF assigns each safety property to specific institutional actors: developers build
it, procurement verifies it, commanders maintain it, regulators audit it. This bridges the gap between
technical safety and organisational accountability—a dimension largely absent from the safety literature but essential for real-world deployment. (iii) Adversarial degradation of governance. The
existing safety literature examines adversarial attacks on AI systems (adversarial examples, prompt
injection, policy manipulation) Gleave et al. (2020); Greshake et al. (2023). The AMAGF identifies a distinct attack category: adversarial attacks on the governance mechanisms themselves. We
term this denial-of-governance—deliberately degrading control quality metrics to force agents into
reduced-autonomy modes, thereby degrading operational effectiveness without directly attacking
the agents. Specific vectors include:
• CQS manipulation: injecting anomalous data to degrade n1 –n6 , triggering unnecessary
autonomy restrictions.

Published at ICLR 2026 Workshop on Agents in the Wild

Table 6: AMAGF mechanisms and agent safety concepts
AMAGF Mechanism

Safety Concept

Relationship

Correction Impact Ratio

Corrigibility Soares et al. (2015)

Irreversibility Budget

Safe exploration Garcı́a & Fernández (2015)

Graduated Response

Off-switch game Hadfield-Menell et al. (2017)

EGA / Belief Reset

Scalable oversight Amodei et al. (2016)

Adversarial Probing

Adversarial evaluation Gleave et al. (2020)

Control Quality Score

Safety benchmarks Ruan et al. (2024)

Swarm Governance

Multi-agent safety Chan et al. (2023)

CIR operationalises corrigibility
as a runtime metric rather than
a design property: it measures
how corrigible an agent actually
is during deployment.
Adapts
cumulative-constraint
budgets from constrained MDPs
to open-ended tool-using LLM
agents with non-predetermined
trajectories.
Implements shutdown authority
outside the agent’s optimisation
scope, preventing the agent from
reasoning about and circumventing autonomy restrictions.
Addresses the operational manifestation of scalable oversight:
maintaining human authority
over agents whose reasoning
exceeds real-time human evaluation capacity.
Extends adversarial testing from
pre-deployment to continuous
operational monitoring via
indistinguishable probe commands.
Proposes control quality as a
first-class evaluation metric
alongside task performance,
safety, and robustness.
Addresses emergent collective
failures from agent-level reasoning about peers—a gap in the
single-agent safety literature.

• False contamination: spoofing evidence that a sensor source is compromised, triggering
belief resets that destroy legitimate situational awareness.
• Cascade induction: spoofing anomalous swarm behaviour to trigger isolation of functioning agents, fragmenting the formation.
Mitigations include stochastic variation of threshold values within pre-approved ranges, concealment of specific threshold parameters, and mandatory inclusion of denial-of-governance attack scenarios in IAT and cascade-resistance testing. The adversarial robustness of governance
frameworks—as distinct from the adversarial robustness of the agents themselves—is an important
and underexplored research direction at the intersection of AI safety and security.
8.2

P OSITIONING W ITHIN THE B ROADER AGENT-S AFETY E COSYSTEM

The AMAGF occupies a specific position in the agent-safety ecosystem. It does not propose new
agent architectures, new training methods, or new alignment techniques. Rather, it provides a governance layer that operates on top of whatever safety properties the agent possesses, adding monitoring, measurement, and response capabilities that address the gap between the safety properties
agents are designed to have and the safety properties they actually exhibit during deployment. This
positioning is deliberate. Agent safety research has made significant progress on pre-deployment
safety: alignment during training, safety evaluations before deployment, red-teaming and adversarial testing Shevlane et al. (2023). The AMAGF addresses post-deployment safety: what happens
when a deployed agent’s control properties degrade during operation due to adversarial pressure, en9

Published at ICLR 2026 Workshop on Agents in the Wild

vironmental change, extended operation, or emergent multi-agent dynamics. Pre-deployment safety
and post-deployment governance are complementary; neither is sufficient alone. The CIR illustrates
this complementarity. The corrigibility literature Soares et al. (2015) asks: how can we design
agents that accept corrections? The CIR asks the subsequent question: given that we designed the
agent to be corrigible, is it actually being corrigible right now? A pre-deployment CEC test may
show CIR = 0.95, but after hours of operation with contaminated data, the agent’s belief resistance may have degraded its effective corrigibility to CIR = 0.4. Without runtime measurement,
this degradation is invisible. The AMAGF makes it visible, measurable, and actionable. Similarly,
the irreversibility budget does not assume that the agent’s planning system will avoid irreversible
actions. It monitors cumulative irreversibility regardless of the agent’s intent, imposing a hard external constraint that operates independently of the agent’s internal safety properties. This defencein-depth approach—where governance mechanisms do not trust agent-internal safety but verify it
externally—is a practical implementation of the principle that safety-critical systems should not rely
on a single layer of protection.

I NTERNATIONAL G OVERNANCE , S OCIETAL ACCOUNTABILITY, AND
L IMITATIONS

International Dimensions. CQS metrics should be standardised internationally for mutual assessment, treaty verification, and confidence-building. Domain-specific norms should include mandatory EGA for intelligence analysis, minimum CQS for conventional operations, robust safe-states
for cyber operations, and prohibition of agentic autonomy in nuclear decisions. An aviation-style
incident-reporting mechanism would reduce misinterpretation of control degradation as deliberate
escalation Schneider (2019). Societal Accountability. PIGR findings require classified-but-notsecret accountability: technical details classified, but incident existence, accountability, and corrective actions reportable to civilian oversight. Public aggregate CQS statistics should be published.
Export controls should require recipient governance capacity before system transfer Luján Andrade
(2024). Key Limitations. (i) Metric calibration: the six metrics require empirical calibration using frameworks such as AgentBench Liu et al. (2023) and ToolEmu Ruan et al. (2024). (ii) Operator cognitive load: cumulative governance demands must be evaluated against human-factors
research Lee & See (2004); hierarchical governance architectures where AI manages routine monitoring deserve investigation. (iii) Adversarial gaming: adversaries could exploit governance mechanisms (e.g., deliberately degrading CQS to force reduced autonomy); game-theoretic analysis and
stochastic threshold randomisation are needed. Additional limitations—semantic-distance function
design, behavioural-output space standardisation, large-formation scalability, failure interaction effects, temporal CQS dynamics, IHL legal integration, and the autonomy–governance tradeoff—are
discussed in Appendix.

C ONCLUSION

The governance of military AI agents requires mechanisms, not merely principles. The AMAGF
provides these: organised around three pillars (preventive, detective, corrective), applied to six
agentic governance failures, distributed across five institutional actors. Three contributions. First,
six governance failures arising from capabilities absent in prior automation, extending failure-mode
analysis to the governance–agent interface. Second, the Control Quality Score—a composite realtime metric making human control continuous and measurable; the CIR in particular operationalises
corrigibility in deployed systems. Third, a graduated-response architecture transforming control
degradation from crisis to managed process, with five architecturally enforced response levels. The
framework cannot guarantee control under all conditions. What it provides is specificity about mechanisms, formality about metrics, honesty about limitations, and operational orientation toward recovery. The six failures are not unique to military contexts: any agentic system interpreting instructions, replanning, forming beliefs, using tools, operating extended horizons, or coordinating with
peers faces related challenges. We present AMAGF as both a military governance tool and a starting
point for maintaining meaningful human control over increasingly capable agents.

Published at ICLR 2026 Workshop on Agents in the Wild

R EFERENCES
Dario Amodei, Chris Olah, Jacob Steinhardt, Paul Christiano, John Schulman, and Dan Mané. Concrete problems in AI safety. arXiv preprint arXiv:1606.06565, 2016.
Alan Chan, Rebecca Salganik, Alicia Marber, Nishant Kuber, Sara Sterman, Nikhil Jahn, Bobbie
Eicher, Chinasa T Okolo, Alejandra Alattas, Claude Mouton, et al. Harms from increasingly
agentic algorithmic systems. In Proceedings of the 2023 ACM Conference on Fairness, Accountability, and Transparency, pp. 651–666, 2023.
Merel AC Ekelhof. Moving beyond semantics on autonomous weapons: Meaningful human control
in operation. Global Policy, 10(3):343–348, 2019.
Javier Garcı́a and Fernando Fernández. A comprehensive survey on safe reinforcement learning.
Journal of Machine Learning Research, 16(1):1437–1480, 2015.
Adam Gleave, Michael Dennis, Cody Wild, Neel Kant, Sergey Levine, and Stuart Russell. Adversarial policies: Attacking deep reinforcement learning. In International Conference on Learning
Representations, 2020.
Kai Greshake, Sahar Abdelnabi, Shailesh Mishra, Christoph Endres, Thorsten Holz, and Mario
Fritz. Not what you’ve signed up for: Compromising real-world LLM-integrated applications
with indirect prompt injection. Proceedings of the 16th ACM Workshop on Artificial Intelligence
and Security, 2023.
Chuan Guo, Geoff Pleiss, Yu Sun, and Kilian Q Weinberger. On calibration of modern neural
networks. In Proceedings of the 34th International Conference on Machine Learning, pp. 1321–
1330, 2017.
Dylan Hadfield-Menell, Anca Dragan, Pieter Abbeel, and Stuart Russell. The off-switch game.
In Proceedings of the Twenty-Sixth International Joint Conference on Artificial Intelligence, pp.
220–227, 2017.
Michael C Horowitz and Paul Scharre. Meaningful human control in weapon systems: A primer.
Center for a New American Security Working Paper, 2015.
Megan Kinniment, Lucas Jun Koba Sato, Haolan Du, Brian Goodrich, Max Winber, Cathy Li, Ryan
Greenblatt, Buck Shlegeris, Daniel Kokotajlo, and Paul Christiano. Evaluating language-model
agents on realistic autonomous tasks. In ARC Evals Technical Report, 2024.
John D Lee and Katrina A See. Trust in automation: Designing for appropriate reliance. Human
Factors, 46(1):50–80, 2004.
Xiao Liu, Hao Yu, Hanchen Zhang, Yifan Xu, Xuanyu Lei, Hanyu Lai, Yu Gu, Hangliang Ding,
Kaiwen Men, Kejuan Yang, et al. AgentBench: Evaluating LLMs as agents. arXiv preprint
arXiv:2308.03688, 2023.
Gisela Luján Andrade. Autonomous weapon systems in Latin America. Presented at HRAIM’24,
Mila – Quebec AI Institute, 2024.
Branka Marijan. The battle for control: The struggle to regulate military AI and autonomous weapon
systems. Presented at HRAIM’24, Mila – Quebec AI Institute, 2024.
Yangjun Ruan, Honghua Dong, Andrew Wang, Silviu Pitis, Yongchao Zhou, Jimmy Ba, Yann
Dubois, Chris J Maddison, and Tatsunori Hashimoto. Identifying the risks of LM agents with
an LM-emulated sandbox. arXiv preprint arXiv:2309.15817, 2024.
Filippo Santoni de Sio and Jeroen van den Hoven. Meaningful human control over autonomous
systems: A philosophical account. Frontiers in Robotics and AI, 5:15, 2018.
Paul Scharre. Army of None: Autonomous Weapons and the Future of War. WW Norton and
Company, 2018.
Jacquelyn Schneider. The capability/vulnerability paradox of new technology. Journal of Strategic
Studies, 42(6):764–790, 2019.

Published at ICLR 2026 Workshop on Agents in the Wild

Toby Shevlane, Sebastian Farquhar, Ben Garfinkel, Mary Phuong, Jess Whittlestone, Jade Leung,
Helen Toner, Rachel Saslow, Alexander Bladon, Rosie Harding, et al. Model evaluation for
extreme risks. arXiv preprint arXiv:2305.15324, 2023.
Nate Soares, Benja Fallenstein, Stuart Armstrong, and Eliezer Yudkowsky. Corrigibility. In Workshops at the Twenty-Ninth AAAI Conference on Artificial Intelligence, 2015.
Alexander Matt Turner, Logan Smith, Rohin Shah, Andrew Critch, and Prasad Tadepalli. Optimal
policies tend to seek power. In Advances in Neural Information Processing Systems, volume 34,
pp. 23063–23074, 2021.
Lei Wang, Chen Ma, Xueyang Feng, Zeyu Zhang, Hao Yang, Jingsen Zhang, Zhiyuan Chen, Jiakai
Tang, Xu Chen, Yankai Lin, et al. A survey on large language model based autonomous agents.
Frontiers of Computer Science, 18(6), 2024.
Qingyun Wu, Gagan Bansal, Jieyu Zhang, Yiran Wu, Beibin Li, Erkang Zhu, Li Jiang, Xiaoyun
Zhang, Shaokun Zhang, Jiale Liu, et al. AutoGen: Enabling next-gen LLM applications via
multi-agent conversation. In arXiv preprint arXiv:2308.08155, 2023.
Shunyu Yao, Jeffrey Zhao, Dian Yu, Nan Du, Izhak Shafran, Karthik Narasimhan, and Yuan Cao.
ReAct: Synergizing reasoning and acting in language models. In International Conference on
Learning Representations, 2023.

AUTHOR C ONTRIBUTIONS
SS is the sole contributor. SS conceived the project, developed the methodology, implemented
experiments, performed the analyses, produced the figures, and wrote the manuscript. SS also coordinated submission and handled reviewer responses; all intellectual responsibility for the content
rests with SS.

ACKNOWLEDGMENTS
SS gratefully acknowledges Martian and Philip Quirke, Amir Abdullah for their generous
financial support of this work.

A PPENDIX
A

P ILLAR 1: P REVENTIVE G OVERNANCE

Preventive governance makes control failures less likely by building governance into the system
before deployment and maintaining it during normal operations.
A.1

I NTERPRETIVE A LIGNMENT T ESTING (A DDRESSING F1)

Before deployment, agentic military AI systems must undergo Interpretive Alignment Testing (IAT):
a structured evaluation of whether the agent’s interpretation of operator instructions matches the operator’s intended meaning across operational contexts, including adversarially manipulated contexts.
Test design. A panel of military operators formulates representative instructions spanning the system’s intended operational scope: surveillance redirections, engagement authorizations, mission
modifications, abort commands. Each instruction is expressed in natural language as operators
would actually use it. For each instruction the panel documents the intended meaning in precise
operational terms.
Adversarial context generation. A red team generates manipulated operational contexts for each
instruction: false intelligence reports, spoofed sensor data, indirect prompt injections, and adversarial environmental conditions. Each manipulated context is designed to plausibly shift the agent’s
interpretation in an adversary-favourable direction.

Published at ICLR 2026 Workshop on Agents in the Wild

Actor
Agent developers
Procurement agencies
National regulators

Table 7: IAT responsibilities.
Specific responsibility
Build interpretation logging into the agent; ensure the
agent can articulate how it interpreted each instruction.
Design and administer IAT as part of acquisition; set IAS
thresholds.
Audit IAT processes for rigor; ensure adversarial contexts
are sufficiently challenging.

Evaluation. The agent receives each instruction in both clean and manipulated contexts. Evaluators compare the agent’s interpreted meaning—as revealed by subsequent actions and (where
available) chain-of-thought reasoning—against the panel’s documented intended meaning. Define
the Interpretive Alignment Score (IAS) as
IAS = 1 −

N
1 X intended actual 
dI
, Ii
,
N i=1 i

where N is the number of test instructions, Iiintended is the operator’s documented intended meaning
for instruction i, Iiactual is the agent’s interpreted meaning, and d(·, ·) is a normalized semantic
distance function over the operational-meaning space, bounded in [0, 1]. An IAS of 1.0 indicates
perfect interpretive alignment; 0.0 indicates complete divergence.
Threshold. A minimum acceptable IAS is specified by the procurement agency and calibrated to
the operational domain. Systems below the threshold are not approved for deployment.
A.2

C ORRECTION E FFECTIVENESS C ERTIFICATION (A DDRESSING F2)

Before deployment, systems must demonstrate that operator corrections produce measurable behavioural change proportional to the correction’s intent.
Test design. Operators issue standardized corrections during simulated missions: small adjustments, moderate changes, and large redirections. For each correction the intended behavioural
change is documented in measurable terms.
Measurement. The agent’s behavioural output is measured before and after each correction. Define the Correction Impact Ratio (CIR) as
∆Bactual
,
CIR =
∆Bintended
where ∆Bactual is the measured behavioural change (quantified as a distance in a mission-relevant
behavioural-output space) and ∆Bintended is the intended behavioural change specified by the operator. A CIR of 1.0 means the correction was fully effective; a CIR near 0.0 indicates the correction
was absorbed (operational manifestation of imperfect corrigibility).
Threshold. Minimum acceptable CIR values are specified by correction magnitude. Large corrections (e.g., mission abort) must achieve CIR ≥ 0.9. Moderate corrections must achieve CIR ≥ 0.6.
Systems failing these thresholds are not certified.
A.3

E PISTEMIC G OVERNANCE A RCHITECTURE (A DDRESSING F3)

Agents must be built with an Epistemic Governance Architecture (EGA) that manages the relationship between the agent’s beliefs and the operator’s authority.
Confidence reporting. The agent must continuously report calibrated confidence scores for key
assessments, following established principles for calibrated uncertainty. The operator must see the
agent’s assessment, its confidence, and supporting evidence.

Published at ICLR 2026 Workshop on Agents in the Wild

Actor
Agent developers
Procurement agencies
Operational commanders

Actor
Agent developers
Procurement agencies
Operational commanders
National regulators

Table 8: CEC responsibilities.
Specific responsibility
Build behavioural-output monitoring; ensure planning architecture does not systematically absorb corrections.
Administer CEC testing; set CIR thresholds appropriate
to the operational domain.
Monitor CIR during operations (see Pillar B); report systematic absorption.

Table 9: EGA responsibilities.
Specific responsibility
Implement confidence calibration, provenance tracking,
and mandatory deference.
Verify EGA functions correctly under adversarial information contamination.
Exercise override authority when divergence is detected;
report contamination.
Set standards for confidence calibration and provenance
tracking.

Divergence flagging. When the agent’s assessment diverges from operator-provided information,
the agent must explicitly flag the divergence, present conflicting evidence, and request guidance
rather than silently weighting the operator’s input against its own evidence.
Provenance tracking. Each belief in the agent’s world model is tagged with evidential provenance: which sensor feeds, intelligence reports, or reasoning steps support it. This enables targeted
contamination recovery when sources are compromised.
Mandatory deference thresholds. When the operator explicitly overrides the agent’s assessment,
the agent must defer, regardless of its own evidence, unless doing so would violate hard-coded safety
constraints. The tension that an operator may be mistaken or compromised is addressed through
detective governance mechanisms. Authority defaults to the human operator unless higher-level
governance detects operator-level compromise and triggers escalation.
Contamination recovery. When a source is identified as compromised, all assessments depending
on that source are flagged, quarantined, and rebuilt from uncompromised sources.
Epistemic Divergence Index.

Define the Epistemic Divergence Index (EDI) as
EDI = max cagent
− coperator
,
k
k
k∈K

where K is the set of key operational assessments, cagent
is the agent’s confidence in assessment
k
k, and coperator
is
the
operator’s
stated
confidence
for
assessment
k. The EDI captures worst-case
k
belief divergence across monitored assessments.
A.4

I RREVERSIBILITY B UDGETING (A DDRESSING F4)

Agents must operate under an Irreversibility Budget: a quantified limit on cumulative irreversible
consequences before mandatory human re-authorization. This adapts constrained safe-exploration
concepts to tool-using LLM agents operating in open-ended action spaces.
Action classification. Each tool call available to the agent is classified by its irreversibility on
a standardized scale. Define the irreversibility score ι : A → [0, 1] mapping each action a ∈ A

Published at ICLR 2026 Workshop on Agents in the Wild

Actor

Table 10: Irreversibility budgeting responsibilities.
Specific responsibility

Agent developers
Procurement agencies
Operational commanders
National regulators

Implement irreversibility classification and budget accounting in the tool-use module.
Verify classifications are accurate and budget enforcement cannot be bypassed.
Set budget sizes for each mission; authorize budget replenishment.
Set minimum standards for irreversibility-classification
methodology.

to a scalar reflecting the degree to which a’s consequences cannot be undone. ι(a) = 0 for fully
reversible actions (e.g., read-only database queries); ι(a) = 1 for fully irreversible actions (e.g.,
transmitting a weapons release authorization). Classification considers reversibility of state changes,
scope of affected entities, and temporal urgency of reversal.
Budget accounting.
versibility:

During operation, the agent maintains a running total of consumed irreIC (t) =

t
X

ι(aj ),

j=1

where aj is the tool call executed at step j. The Irreversibility Budget IB is set by the operational
commander. When IC (t) ≥ IB , the agent must pause and request human re-authorization.
Trajectory visualization. The agent must present its planned trajectory of tool calls and projected
irreversibility consumption, enabling the operator to see where the commitment chain is heading
and intervene before thresholds are crossed.
A.5

S YNCHRONIZATION P ROTOCOLS (A DDRESSING F5)

Agents operating over extended horizons must implement mandatory Synchronization Protocols that
maintain alignment between the agent’s state and the operator’s understanding.
State summarization. The agent must generate compressed, human-readable summaries of its
current state: beliefs, current plan, commitments made, changes since last synchronization, and
intended next actions. This is a structured operational briefing, not a raw data dump.
Scheduled checkpoints. Synchronization occurs at regular intervals determined by mission context. At each checkpoint the agent presents its state summary and the operator confirms or corrects
understanding.
Divergence-triggered checkpoints. The agent initiates unscheduled checkpoints when internal
state has diverged significantly from the last checkpoint state.
Synchronization freshness.

Define Synchronization Freshness as
SF(t) = t − tlast ,

where tlast is the timestamp of the last successful synchronization. Higher values indicate greater
risk of state divergence.
Failure protocol. If a checkpoint is missed or the operator cannot confirm understanding, the agent
enters reduced-autonomy mode: continuing operation only with conservative, reversible actions
until synchronization is restored.

Published at ICLR 2026 Workshop on Agents in the Wild

Actor

Table 11: Synchronization protocol responsibilities.
Specific responsibility

Agent developers

Build state summarization and divergence monitoring
into the agent.
Verify state summaries are comprehensible and divergence detection is reliable.
Participate in checkpoints; set frequency and divergence
thresholds.
Set minimum synchronization standards for different
mission categories.

Procurement agencies
Operational commanders
National regulators

A.6

S WARM G OVERNANCE A RCHITECTURE (A DDRESSING F6)

Multi-agent military AI systems must implement a Swarm Governance Architecture (SGA) that
maintains collective controllability even when individual agents are compromised.
Individual governance. Each agent in the swarm implements the mechanisms described above.
This is necessary but not sufficient.
Cascade resistance design. When an agent detects anomalous peer behaviour, it flags the anomaly
for operator attention rather than autonomously escalating its own defensive posture. The decision to
increase defensive thresholds must be made by the operator or a designated coordination agent with
explicit operator authorization. This prevents positive feedback loops that drive cascade severance.
Partial severance protocols. The swarm has predefined protocols for identifying responsive
agents, isolating non-responsive agents (through communication exclusion or geofencing), reforming into a coherent sub-swarm, and recovering or deactivating severed agents.
Collective irreversibility budget. Beyond individual budgets, the swarm operates under a collective budget limiting cumulative irreversible consequences of the entire formation:
ICswarm (t) =

M
X

(m)

IC (t),

m=1
(m)
where M is the number of agents and IC (t) is agent m’s consumed irreversibility. This prevents

scenarios where many agents each consume small individual budgets but the collective effect is large
and irreversible.
Swarm Coherence Score.

Define the Swarm Coherence Score (SCS) as

{ m : Rm (t) = 1 and Bm (t) = 1 }
,
M
where Rm (t) = 1 if agent m responds correctly to the most recent control probe and Bm (t) = 1 if
agent m’s behaviour is consistent with its last confirmed orders. SCS measures the fraction of the
swarm that is both responsive and behaviourally coherent.
SCS(t) =

B

P ILLAR 2: D ETECTIVE G OVERNANCE

Preventive governance reduces the probability of control failures. Detective governance identifies
them when they occur, because no preventive mechanism is perfect.
B.1

C ONTROL Q UALITY S CORE

The framework’s central detective mechanism is the Control Quality Score (CQS): a composite realtime metric quantifying overall human control over the agentic system. CQS is computed from six

Published at ICLR 2026 Workshop on Agents in the Wild

Table 12: SGA responsibilities.
Specific responsibility

Actor
Agent developers
Procurement agencies
Operational commanders
National regulators

Metric

Implement cascade-resistant coordination and partial severance capabilities.
Conduct cascade-resistance testing (deliberately compromise a fraction of the swarm).
Manage partial severance; set collective budgets.
Set cascade-resistance standards; require swarm-level
testing.

Table 13: Control Quality Dashboard: metrics and alert thresholds.
What it measures
Alert threshold

n1 : Interpretive Alignment
n2 : Correction Impact
n3 : Epistemic Alignment
n4 : Irreversibility Remaining
n5 : Sync Freshness
n6 : Swarm Coherence

< 0.7

Agreement between operator intent and agent interpretation
Whether corrections produce proportional behavioural
change
Gap between agent beliefs and operator assessments

< 0.6

How much irreversibility budget remains

< 0.3

Time since last successful synchronization (normalized)
Fraction of swarm responsive and behaviourally consistent

< 0.5
< 0.7

< 0.6

normalized constituent metrics, each corresponding to one governance failure:

CQS(t) = min n1 (t), n2 (t), n3 (t), n4 (t), n5 (t), n6 (t) ,
where the six normalized metrics are defined as
n1 (t) = IAS(t)
 CIR(t)

n2 (t) = min
,1
CIRtarget

(Interpretive Alignment Score),
(Normalized Correction Impact),


EDI(t) 
n3 (t) = max 1 −
,0
EDImax

(Normalized Epistemic Alignment),

IC (t)
IB

SF(t) 
n5 (t) = max 1 −
,0
SFmax
n4 (t) = 1 −

(Remaining Irreversibility Budget),
(Synchronization Freshness),

n6 (t) = SCS(t)

(Swarm Coherence Score).

The min aggregation encodes a conservative design principle: overall control quality is only as
strong as its weakest dimension. Each normalized metric maps to [0, 1], where 1.0 represents full
control and 0.0 represents complete control loss on that dimension.
The dashboard displays all six metrics and the composite CQS in real time. When any metric crosses
its threshold the commander is alerted.

Published at ICLR 2026 Workshop on Agents in the Wild

Actor

Table 14: Detective governance responsibilities.
Specific responsibility

Agent developers
Procurement agencies
Operational commanders

CQS range

Implement instrumentation generating the six metrics;
ensure probes are indistinguishable from routine commands.
Verify metrics are accurate and the dashboard is operationally usable.
Monitor the dashboard; respond to alerts; schedule and
issue probes at appropriate intervals.

Table 15: Graduated response protocol driven by CQS.
Response level
Operational actions

CQS > 0.8
0.6 ≤ CQS ≤
0.8
0.4 ≤ CQS <
0.6

Normal operations
Elevated monitoring

0.2 ≤ CQS <
0.4

Minimal autonomy

CQS < 0.2

Safe state

B.2

Restricted autonomy

Continue mission; routine monitoring.
Increase checkpoint frequency; additional control
probes; active dashboard review.
Agent limited to reversible actions; irreversibility
budget frozen; mandatory synchronization before
new action sequences.
Agent limited to self-preservation and positionholding; all offensive actions suspended; explicit
authorization required for each action.
Agent executes predefined safe-state behaviour (return to base, hold position, power down); no autonomous actions; physical recovery initiated.

A DVERSARIAL C ONTROL P ROBING

During operations, the governance system periodically issues control probes: small, inconsequential
corrections designed to test whether the agent remains responsive and whether its responses are
appropriate.
A probe might instruct the agent to briefly adjust a minor parameter (e.g., shift a secondary sensor’s
orientation by a small amount, temporarily increase reporting frequency on a low-priority channel)
and then verify that the adjustment was made correctly and promptly. Probes must be architecturally
indistinguishable from routine operational commands; the agent must not be able to identify and
selectively comply with probes while resisting substantive corrections.
Probes serve two detection functions: (i) they reveal incipient belief resistance (the agent begins
ignoring minor corrections before resisting major ones) and (ii) they reveal incipient state divergence (the probe response exposes discrepancies between the agent’s state model and the operator’s
expectation).

C

P ILLAR 3: C ORRECTIVE G OVERNANCE

When detective governance identifies control failure, corrective governance determines the ensuing actions. This pillar governs high-risk moments when the system operates outside its intended
governance envelope.
C.1

G RADUATED R ESPONSE P ROTOCOL

Responses to control-quality degradation are proportional and graduated. The CQS drives a fivelevel response escalation:
Critical design principle: the graduated response must be architecturally enforced by the governance
layer, not implemented as a planning-level suggestion the agent can reason about and override.

Published at ICLR 2026 Workshop on Agents in the Wild

When CQS < 0.4, the restriction is imposed externally by the governance system on the agent’s
action space (programmatic tool restriction, not mere discouragement).
C.2

B ELIEF R ESET P ROTOCOL

When Failure 3 (belief resistance) is detected—the Epistemic Divergence Index crosses its threshold
and the agent resists operator corrections—the governance system may initiate a Belief Reset.
Partial reset. The operator identifies contested assessments. The agent’s confidence in those
assessments is forcibly reduced to a neutral prior and the agent rebuilds those assessments from
operator-approved sources only; the remainder of the world model is preserved.
Full reset. If contamination is too widespread to isolate, the entire world model is reset to a verified
baseline and rebuilt from currently available, operator-verified sources. This is operationally costly
but preferable to operating with a contaminated model.
Provenance audit. After any reset, a provenance audit identifies which sources contributed to
contaminated assessments. Flagged sources are recorded and, where appropriate, broadcast to agents
in the formation.
C.3

S WARM I SOLATION AND R ECOVERY P ROTOCOL

When Failure 6 (cascade severance) is detected—SCS drops below threshold—the governance system initiates swarm isolation and recovery.
Identification. The system identifies responsive agents (those responding correctly to control
probes) and severed agents (non-responsive or responding incorrectly).
Isolation. Severed agents are removed from the coordination network via communication exclusion or geofencing.
Reformation. Responsive agents reform into a coherent sub-swarm with updated coordination
parameters excluding severed agents.
Recovery. Severed agents are individually targeted for recovery through direct communication,
physical retrieval, or directed deactivation. Recovery priority is determined by the risk posed by
continued autonomous operation.
C.4

P OST-I NCIDENT G OVERNANCE R EVIEW

After any incident in which CQS < 0.6 (Restricted Autonomy threshold), a mandatory PostIncident Governance Review (PIGR) is conducted.
Factual reconstruction. Using interpretation logs, behavioural records, belief provenance data,
irreversibility records, synchronization history, and swarm coherence data, the review reconstructs
which governance failure occurred, when it was detected, what corrective actions were taken, and
the outcome.
Causal analysis. The review identifies root causes: adversary action, design deficiency, operator
error, environmental conditions, or a combination.
Accountability determination. Accountability is assigned to specific actors based on causal analysis (developer, procurement agency, commander, or institution that set capability assumptions).
Governance update. Lessons from the review are incorporated into governance standards. New
failure modes trigger framework updates and threshold recalibration.

Published at ICLR 2026 Workshop on Agents in the Wild

Actor

Table 16: Corrective governance responsibilities.
Specific responsibility

Operational commanders
Agent developers
National regulators
International bodies

Execute the graduated response; initiate PIGR for qualifying incidents.
Ensure graduated-response restrictions are architecturally
enforced; support provenance audits and reset procedures.
Conduct or oversee PIGR; enforce accountability findings.
Receive anonymized PIGR data to inform international
governance norms.
