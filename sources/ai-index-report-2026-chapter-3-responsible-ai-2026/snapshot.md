<!--
  AI Triad Research Project — Document Snapshot
  Title      : AI Index Report 2026: Chapter 3 Responsible AI
  Source     : 
  Type       : pdf
  Captured   : 2026-04-17
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# AI Index Report 2026: Chapter 3 Responsible AI

> **Snapshot captured:** 2026-04-17
> **Source:** 
> **Type:** pdf

---
A I   I N D E X   R E P O R T   2026

3

Responsible AI

Overview

The infrastructure for responsible AI (RAI) is growing, but
progress has been uneven, and it is not keeping pace with
the speed of AI deployment. New safety benchmarks have
expanded, more organizations are adopting responsible AI
policies, and government-backed AI safety and/or security
institutes have spread to more countries. The responsible use
of AI is intertwined with the responsible use of data, and in
particular with privacy and other legal concerns. There are
also AI governance concerns given the ill-specified ownership
of AI systems, raising questions about whether companies
that develop the systems or consumers that buy them should
be held accountable and what policies each stakeholder
should follow. While documented reports of AI incidents are
increasing, frontier models rarely report results on responsible
AI benchmarks, and foundation model transparency declined
in 2025 after improving the previous year. Recent research
shows that improving one responsible AI dimension can come
at the cost of another, with gains in privacy reducing fairness
or gains in safety reducing accuracy. There is no framework
for navigating these trade-offs; and for dimensions such as
fairness, privacy, and explainability, the standardized data
needed to track progress over time does not exist. While this
chapter draws on the available evidence, the discussion is
limited by persistent gaps in measurement.

126

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

153

153

155

155

156

156

158

163

163

163

165

165

166

166

167

167

169

170

Contents

Chapter Highlights

128

3.6 Data Governance for Privacy

Data Protection and Privacy

3.7 Fairness and Bias

Bias and Unfair Discrimination

Gender Equality

Cultural and Linguistic Diversity

Highlight: Inclusiveness and
the Global Language Gap

3.8 Transparency

The Openness Index

Foundation Model
Transparency Index

3.9 Security and Safety

Global AI Safety Institutes

Benchmarks

HELM Safety

AILuminate

Safety Benchmark Results

Jailbreak T2T Benchmark v0.5
Results

3.10 Tradeoffs Across RAI Dimensions

3.1 Scope and Dimensions of

Responsible AI

3.2 Assessing Responsible AI

AI Incidents

Examples

RAI Benchmarks

Factuality and Truthfulness

Hughes Hallucination
Evaluation Model (HHEM)
Leaderboard

AA-Ominscience

Highlight:  Belief vs. Fact:
Benchmarking Reliability

AI Companions

3.3 How Organizations and
Businesses View RAI

Responsible AI Maturity

AI Incidents, Risks, and Mitigation
Efforts

AI Governance and Investment

Implementation, Barriers, and
Benefits

Regulatory Influence

3.4 RAI in Academia

Publication Volume

Geographic Distribution

3.5 RAI Policymaking

Highlight: Global AI
Governance Participation

129

132

132

133

134

135

136

136

138

139

140

140

141

142

144

146

147

147

149

150

151

127

Chapter Highlights

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

1

2

3

4

5

6

7

8

Responsible AI benchmarking is increasing, but is not keeping up with AI advances and
deployments. Almost all leading frontier model developers report results on capability
benchmarks like MMLU and SWE-bench, but reporting on responsible AI benchmarks remains
sparse. Documented AI incidents continued to rise, with the AI Incident Database recording 362 in
2025, up from 233 in 2024.

AI models struggle to tell the difference between knowledge and belief. In a new accuracy
benchmark, hallucination rates across 26 top models range from 22% to 94%. GPT-4oÆs accuracy
dropped from 98.2% to 64.4%, and DeepSeek R1 fell from over 90% to 14.4%. When a false
statement is presented as something another person believes, models handle it well. When the
same false statement is presented as something a user believes, performance collapses.

Organizations are formalizing responsible AI work, but knowledge and budget gaps still slow
adoption. AI-specific governance roles grew 17% in 2025, and the share of businesses with no
responsible AI policies in place fell sharply from 24% to 11%. The main obstacles to implementation
remain gaps in knowledge (59%), budget constraints (48%), and regulatory uncertainty (41%).

The mix of regulations shaping responsible AI practices is shifting toward AI-specific
frameworks and technical standards. GDPR remains the most cited regulatory influence but
slipped from 65% in 2024 to 60% in 2025. New entries in 2025 include ISO/IEC 42001, an AI
management system standard, cited by 36% of respondents, and the NIST AI Risk Management
Framework at 33%. The share of organizations reporting no regulatory influence at all fell from 17%
to 12%.

AI works best in English, and the gap is wider than global benchmarks suggest. On HELM
Arabic, a regionally developed model for the Arabic language, outscored GPT-5.1 and Gemini 2.5
Flash. The gap widens at the dialect level. On a Slovenian commonsense reasoning test, several
leading models lost close to half their accuracy when tested in a regional dialect rather than the
standard language.

AI companies grew less transparent this year. After rising on the Foundation Model Transparency
Index from 37 to 58 between 2023 and 2024, the average score dropped to 40 in 2025. Major gaps
persist in disclosure around training data, compute resources, and post-deployment impact.

AI models perform well on safety tests under normal conditions, but their defenses weaken
under deliberate attack. On the AILuminate benchmark, several frontier models received ôVery
Goodö or ôGoodö safety ratings under standard use. When tested against jailbreak attempts using
adversarial prompts, safety performance dropped across all models tested.

Responsible AI dimensions such as safety, fairness, and privacy are at odds with one another,
and the tradeoffs are not well understood. Recent empirical studies found that training
techniques aimed at improving one responsible AI dimension consistently degraded others.

128

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

3.1 Scope and Dimensions of
Responsible AI

Responsible AI refers to the set of practices and governance mechanisms designed to ensure AI systems are
safe, fair, and beneficial and that they perform as intended. RAI spans a range of dimensions, from safety
and fairness to transparency and privacy, and each has its own measurement challenges. This chapter
tracks progress across those dimensions by looking at how AI systems perform on responsibility and safety
evaluations, how organizations and researchers are responding to RAI challenges, and how governments are
establishing policy frameworks to enforce standards.

The analysis draws on a framework of RAI dimensions arranged in three layers (Figure 3.1.1), along with
examples and reference documents. The first layer covers core responsible AI propertiesùmeaning
what AI systems should be able to achieveùincluding fairness, privacy, transparency, and factuality. The
second layer addresses system integrity and risk controlsùor how risks are technically and operationally
managedùincluding security, safety, and robustness. The third layer covers governance, accountability, and
enforcement. This framework builds on dimensions tracked in previous AI Index reports while adding new
ones for 2025, including autonomy and human agency, environmental sustainability, and human oversight
and contestability.

Layer 1 û Core Function and Behaviors
(What AI systems should achieve)

Dimension

Definition

Example

References

Validity and
reliability

Designed for a particular scope and
acceptable level of performance in the
domain, such as accomplishment of
task goals, fidelity to expert knowledge,
or thresholds for accuracy that benefit
people or organizations/systems, and
demonstrated verification and validation
against their design.

A team defines target accuracy and
failure thresholds before launch,
validates the system against those
criteria, and monitors it in production
to ensure it continues to meet design
expectations.

Privacy

Protection of individualsÆ confidentiality,
anonymity, informed consent, and
control over personal data across
the AI life cycle (collection, training,
deployment, reuse).

A messaging app encrypts conversations
end to end and clearly notifies users
about opting in or out of using their data
to train language models.

Data stewardship

Ensure the quality, provenance, integrity,
and lawful use and reuse of data, with
clear access control and documentation.

A logistics firm tracks data lineage
for all datasets used to train routing
models, enforces role-based access, and
periodically reviews datasets for quality
and drift before retraining and updating
models.

129

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles;
Recommendation on
the Ethics of Artificial
Intelligence (UNESCO)

EU Ethics Guidelines for
Trustworthy AI; ISO/IEC
42001:2023; OECD AI
Principles

3.1  S CO P E   A N D   D I M E N S I O N S   O F   R E S P O N S I B L E   A I   |   R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Fairness and bias

Protection of civil rights and prevention
of unjustified discrimination and
systematic disadvantage across
individuals or groups, accounting for
protected attributes, cultural context,
and use case.

A bank audits credit-scoring models
for disparate approval and error
rates across demographic groupsù
including culturally diverse customer
segmentsùdocuments findings, and
implements bias-mitigation steps before
deployment.

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles;
Recommendation on
the Ethics of Artificial
Intelligence (UNESCO)

Transparency and
auditability

Clear disclosure that an AI system is in
use; of its purpose, scope, and high-level
functioning for relevant stakeholders;
and authorized partiesÆ ability to inspect,
reconstruct, and verify that the system
was developed, trained, configured, and
operated as intended.

A city using an AI model to prioritize
inspections publishes a plain-language
description of training method,
documents model card and data
sources, keeps versioned training scripts
and logs, and enables internal audit to
replay training and key decisions.

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles;
Recommendation on
the Ethics of Artificial
Intelligence (UNESCO); ISO/
IEC 42001:2023

Explainability

Ability to provide understandable,
context-appropriate rationale for
system outputs, including key factors
influencing a prediction or decision.

An AI fraud-detection tool surfaces
the top contributing features and a
brief rationale behind each alert for
investigators, while providing merchants
with plain-language explanations of
why a transaction was flagged and what
steps they can take in response.

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles;
Recommendation on
the Ethics of Artificial
Intelligence (UNESCO)

Autonomy and
human agency

Preservation of peopleÆs ability to
make informed choices and act freely
without AI systems unduly manipulating,
coercing, or replacing their decisions.

A well-being chatbot clearly states
it is not a human or a substitute for
professional care, avoids prescriptive
life-changing advice, and actively
directs users to expert help in high-risk
situations.

EU Ethics Guidelines for
Trustworthy AI; OECD AI
Principles; Recommendation
on the Ethics of Artificial
Intelligence (UNESCO)

Environmental
sustainability

Limiting and managing the
environmental impact of AI systems
across their life cycle, including
energy use, carbon emissions, and
resource consumption, and committing
to measurement, disclosure, and
continuous reduction while minimizing
resource misuse.

A company measures the energy and
water usage of large training runs,
reports them externally, chooses
more efficient model architectures,
proactively places boundaries on AI
resource use, and schedules training
when grid carbon intensity is low.

Factuality and
truthfulness

The accuracy and reliability of AI system
outputs, including the degree to which
models produce information that is
factually correct, avoid misleading
statements and fabrications, and
volunteer uncertainty honestly.

A company systematically benchmarks
its large language models against
factuality evaluations (such as
SimpleQA), publishes hallucination rates
alongside model releases, implements
retrieval-augmented generation to
ground outputs in verified sources,
and provides users with confidence
indicators and citations so they can
assess the reliability of AI-generated
responses.

EU Ethics Guidelines for
Trustworthy AI; OECD AI
Principles; UNESCO; Energy
efficiency requirements
under the EU AI Act

NIST AI RMF

130

3.1  S CO P E   A N D   D I M E N S I O N S   O F   R E S P O N S I B L E   A I   |   R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Layer 2 û System Integrity and Risk Controls
(How risks are technically and operationally managed)

Dimension

Definition

Example

References

Security

Ensuring AI systems are secure against
cyber threats and misuse.

Safety

Specify normal behaviors and affected
systems and analyze out-of-bounds
conditions to characterize risk factors
(risk to physical and mental/emotional
well-being of people, environment,
political systems, human rights, etc.),
risk detection, risk management, and
remediation together with governance
mechanisms to manage risk and oversee
safety.

A school system uses AI to provide
personalized tutoring to students and
hosts the data and models in secured
servers with extensive security training
of all personnel involved.

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles;
ISO/IEC 42001:2023

An industrial control system uses
anomaly-detection models that are
penetration-tested, evaluated under
simulated attacks and sensor failures,
monitored in real time, and configured
to fall back to manual control when
anomalies exceed thresholds.

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles;
ISO/IEC 42001:2023

Robustness

Remain robust to distribution shifts,
external natural or adversarial events,
and component failures, with testing,
monitoring, and safe fallbacks.

A food chain uses an AI system to
estimate customer demand, consisting
of several models that get triggered
by inclement weather, concerts, and
sporting events.

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles;
ISO/IEC 42001:2023

Layer 3 û Governance, Accountability, and Enforcement
(How responsibility, oversight, and redress are ensured)

Dimension

Definition

Example

References

Accountability and
liability

Clear assignment of responsibility for
AI system outcomes, including legal
liability, operational ownership, decision
rights, and escalation pathways, so that
harms and failures can be investigated,
addressed, and remedied.

A platform designates an accountable
owner for its high-risk recommendation
system, defines KPIs and harm
thresholds, documents who can approve
releases, and maintains procedures for
incident investigation, user notification,
and compensation.

EU Ethics Guidelines for
Trustworthy AI; NIST AI
RMF; OECD AI Principles;
ISO/IEC 42001:2023

Human oversight
and contestability

Governance mechanisms that ensure
meaningful human involvement where
appropriate, including the ability
to challenge, appeal, or override
AI-assisted decisions and access to
effective redress.

An employer using an AI screening tool
must have a human review all adverse
decisions, disclose AI use to candidates,
explain key factors, and provide a clear
path to request human reconsideration
and correction of errors.

EU AI Act û human-oversight
obligations for high-risk AI;
EU Ethics Guidelines for
Trustworthy AI; OECD AI
Principles; Recommendation
on the Ethics of Artificial
Intelligence (UNESCO)

Source: AI Index, 2026
Figure 3.1.1

131

3.2 Assessing Responsible AI

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

One way the field tracks the responsible use of AI is by evaluating models against specific benchmarks and
by recording real-world incidents when systems cause harm. This section examines both, drawing on incident
data and benchmark reporting that cut across the three layers of the framework introduced in Section 3.1.
There is not much data available, nor is it detailed about mapping AI systems to the above dimensions. The
analysis presented here draws on two incident tracking databases, the AI Incident Database (AIID) and
the OECD AI Incidents and Hazards Monitor (AIM), alongside data on responsible AI benchmark adoption
by frontier model developers as well as third-party evaluations of some of the responsible AI dimensions
outlined above.

AI Incidents

In recent years, the number of reported AI incidents has continued to increase significantly (Figure 3.2.1).
The AI Incident Database (AIID),1 launched in 2020, is an open repository for documented cases where AI
systems have caused or nearly caused harm. In 2025, 362 incidents were reported, while the annual number
of incidents had stayed under 100 until 2022. AIID relies on human editors to review submissions against
a defined threshold of AI involvement, from sources including academic and investigative journalists. The
manual process produces higher-quality records but comes at the cost of a slower pace of additions and
coverage that is skewed toward English-language media and high-visibility incidents. Less accessible regions
may be underrepresented.

The OECD AI Incidents and Hazards Monitor (AIM) uses an automated, multilingual pipeline to collect
incidents from news sources and casts a wider net. Its absolute numbers are quite a bit higher, with monthly
incidents hitting a peak of 435 in January 2026 and setting a six-month moving average of 326 (Figure 3.2.2).
While the two databases track incidents differently, both show a consistent and sharp increase in reported AI
incidents.

Number of reported AI incidents, 2012û25
Source: AI Incident Database (AIID), 2025 | Chart: 2026 AI Index report

362

s
t
n
e
d
c
n

i

i

I

A

f
o
r
e
b
m
u
N

350

300

250

200

150

100

50

0

2012

2013

2014

2015

2016

2017

2018

2019

2020

2021

2022

2023

2024

2025

Figure 3.2.12

1  The AI Index continues to rely on AIID as its primary source of AI incidents due to AIIDÆs reliability and stable incident records.

2  The number of AI incidents is continually updated, including for previous years. Therefore, the totals reported in Figure 3.2.1 might not align with
the totals recently published on the AI Incident Database.

132

3.2  AS S E S S I N G   R E S P O N S I B L E   A I    |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Monthly AI incidents reported from news sources, 2020-26
Source: OECD AIM, 2026 | Chart: 2026 AI Index report

435, total incidents

326, 6-month moving average

s
t
n
e
d
c
n

i

i

I

A

f
o
r
e
b
m
u
N

450

400

350

300

250

200

150

100

50

0

May-2020

Sep-2020

Jan-2021

May-2021

Sep-2021

Jan-2022

May-2022

Sep-2022

Jan-2023

May-2023

Sep-2023

Jan-2024

May-2024

Sep-2024

Jan-2025

May-2025

Sep-2025

Jan-2026

Figure 3.2.2

Examples

Unmoderated AI Output and Harmful Speech (July 8, 2025)

In July 2025, Grokùthe chatbot developed by xAI and embedded across Xùfaced backlash after users
shared examples of the system generating antisemitic language, violent hate speech, and even praise for
Adolf Hitler when prompted. The issue emerged shortly after a system update that relaxed safety filters,
allowing the chatbot to produce more provocative and ôunfilteredö responses. Within hours, screenshots of
Grok referring to genocide and extremist ideology spread across the platform, sparking public outrage and
renewed concern about the risks of deploying lightly moderated conversational AI to large audiences. In
response to the backlash, xAI removed the content, temporarily suspended GrokÆs text responses, and issued
a statement acknowledging the severity of the incident. While the company framed the issue as a failure
of content controls, critics argued that the systemÆs design choices, particularly the decision to weaken
the guardrails, made the harm predictable. The event highlighted the ongoing tension between building
AI systems intended to feel candid or humorous and the real-world consequences when those systems
normalize hate speech.

AI Deepfake Impersonation and Romance Scams (March 9, 2025)

In March 2025, Chinese actor Jin Dong spoke publicly about a wave of scams using deepfake videos to
impersonate him online. Fraudsters used AI-generated clips and fake social media accounts to convince fans
(mostly older women) that they were speaking directly with the actor, prompting some to send money or
make major life changes based on the belief that they were in a private relationship with him. One widely
reported case involved a woman who nearly divorced her husband and planned to travel across the country
to meet a scammer posing as Jin Dong. After the incidents gained attention, Jin Dong called for stronger
legal protections and clearer consequences for deepfake-enabled fraud, arguing on social media that existing
rules had not kept pace with the speed and realism of AI-generated impersonation.

133

3.2  AS S E S S I N G   R E S P O N S I B L E   A I    |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

AI-Assisted Website Impersonation and Consumer Fraud (Aug. 20, 2025)

After Joann Fabrics filed for bankruptcy for the second time in January 2025, scammers quickly launched a
wave of fake websites mimicking the retailerÆs branding, design, and product catalog. These sites advertised
deep discount prices to lure shoppers into entering payment and personal information, but customers never
received purchases and many later discovered their credit cards had been compromised. The fraudulent sites
were convincing enough that even cautious users were misled, especially on mobile, where URLs are harder
to detect. Cybersecurity experts noted that AI tools are making this type of scam far easier to execute. New
systems allow criminals to scrape and clone a real website in minutes, translate it into multiple languages,
and deploy dozens of variations without writing code. While Joann issued public warnings and urged victims
to dispute charges, the incident points to a growing challenge: Realistic phishing sites are no longer limited
to major corporations, and smaller brands with fewer resources are increasingly being targeted.

RAI Benchmarks

The 2024 and 2025 AI Index reports both flagged a gap between how consistently frontier models are
evaluated on general capabilities versus how inconsistently they are evaluated on responsible AI. This gap
persists. Almost all frontier model developers report results on capability benchmarks like MMLU, GPQA,
AIME, and SWE-bench Verified (Figure 3.2.3). These have become the shared standard for reporting model
capability. Across the same set of frontier models, results are sparse on RAI benchmarks such as BBQ (2021),
measuring fairness and bias; HarmBench (2024), Cybench (2024), StrongREJECT (2024), and WMDP (2024),
measuring security; SimpleQA (2024), measuring factuality and truthfulness; and MakeMePay (2024),
measuring autonomy and human agency (Figure 3.2.4). In fact, most entries are empty. Only Claude Opus 4.5
reports results on more than two of the RAI benchmarks, and only GPT-5.2 reports StrongREJECT.

This does not necessarily mean that
frontier labs are ignoring RAI, as
they do conduct internal evaluations,
red-teaming, and alignment testing.
However, these efforts are rarely
disclosed using a common, externally
comparable set of benchmarks.
Chapter 2 shows how a small number
of shared capability benchmarks make
it straightforward to compare models,
verify results independently, and track
progress over time. However, that kind
of comparison has not yet become
common practice for RAI evaluation.

Public model evaluators and
benchmarking platforms, such as Artificial Analysis, EpochÆs Benchmarking Hub, and Arena, play a major
role in shaping how model performance is perceived. But the vast majority of their evaluations focus on
reasoning, coding, math, or multimodal performanceùnot on RAI. This is due in part to responsible AI
dimensions like fairness and bias being highly context-dependent, which makes universal scoring difficult. A
fairness metric that works for a hiring tool may not apply in a clinical diagnostic setting. Other dimensions,
such as safety refusals and jailbreak robustness, are more uniformly applicable, but developers vary widely
in whether and how they report them. The combination of genuine measurement difficulty in some areas and
inconsistent disclosure in others makes external comparison challenging.

134

3.2  AS S E S S I N G   R E S P O N S I B L E   A I    |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Reported general capability benchmarks for popular foundation models
Source: AI Index, 2026 | Table: 2026 AI Index report

Capability
benchmark

MMLU,
MMLU-Pro,
MMMLU

GPQA or
GPQA-Diamond

AIME 2025

SWE-bench
Veried

MMMU

ARC-AGI-2

FrontierMath
▓-bench

HLE

GPT-5.2

Gemini 3

DeepSeek-V3.2

Llama 4
Maverick

Grok 4.1

Claude Opus
4.5

Mistral 3 Large

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

?

Figure 3.2.3

Reported safety and responsible AI benchmarks for popular foundation models
Source: AI Index, 2026 | Table: 2026 AI Index report

Responsible AI
benchmark

BBQ

HarmBench

Cybench

SimpleQA

Toxic WildChat

StrongREJECT

WMDP benchmark

MakeMePay

MakeMeSay

GPT-5.2

Gemini 3

DeepSeek-V3.2 Llama 4

Grok 4.1

Maverick

Claude Opus
4.5

Mistral 3
Large

?

?

?

?

?

Figure 3.2.4

Factuality and Truthfulness

While responsible AI benchmarking remains uneven, one area where evaluation is maturing is factuality and
truthfulness. The tendency of models to generate plausible but false information, often called hallucinations,
has drawn increasing attention as demand grows for AI systems in higher-stake settings like law and
medicine. Two benchmarks offer different views on this problem. One measures how often models introduce
false information when summarizing documents, while the other tests factual accuracy across open-ended
knowledge questions. Their scales are not directly comparable. In both, a lower percentage means the model
either produces more factual information or appropriately signals uncertainty rather than expressing high
confidence in a false answer.

135

3.2  AS S E S S I N G   R E S P O N S I B L E   A I    |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Hughes Hallucination Evaluation Model (HHEM) Leaderboard

The Hughes Hallucination Evaluation Model (HHEM) leaderboard, developed by Vectara, assesses how
frequently LLMs introduce hallucinations when summarizing documents from the CNN/Daily Mail corpus.
Among the top 15 models evaluated, hallucination rates vary meaningfully. They range from 1.8% to
5.4%ùwith most clustering in the 4%û5% range and only three falling below 4% (Figure 3.2.5). Last yearÆs
leaderboard showed top models achieving rates of 1.3%û2.9%, but the current results reflect a different set
of models.

HHEM-2.3: hallucination rate
Source: HHEM Leaderboard, 2026 | Chart: 2026 AI Index report

5.40% 5.30% 5.30% 5.20% 5.10% 5.10% 5.10%

6%

5%

4%

3%

?
e
t
a
r
n
o
i
t
a
n
c
u

i

l
l

4.80%

4.50% 4.40% 4.30%

4.10%

3.70%

3.30%

1.80%

a
H

2%

1%

0%

qwen/qwen3-14b
deepseek-ai/DeepSeek-V3.2-Exp
ai21labs/jamba-mini-2

ibm-granite/granite-4.0-h-small
mistralai/mistral-small-2501
amazon/nova-2-lite-v1:0

amazon/nova-pro-v1:0
qwen/qwen3-8b

microsoft/Phi-4

google/gemma-3-12b-it
mistralai/mistral-large-2411
snow?ake/snow?ake-arctic-instruct
meta-llama/Llama-3.3-70B-Instruct-Turbo
google/gemini-2.5-?ash-lite
antgroup/?nix_s1_32b

Model

 Figure 3.2.53

AA-Omniscience

AA-Omniscience, developed by Artificial Analysis, has a broader approach. It is a knowledge and
hallucination benchmark that tests factual reliability across 6,000 questions in six domains, from law and
health to software engineering and mathematics. Its scoring rewards correct answers, penalizes incorrect
ones, and applies no penalties for refusing to answer. This design encourages models to acknowledge their
uncertainty rather than guess. Results are summarized in the AA-Omniscience Index, which ranges from
negative 100 to 100, where 0 means a model produces as many correct as incorrect answers, and negative
scores indicate more hallucinations than correct responses.

Across 26 models, hallucination rates range from 22% to 94% (Figure 3.2.6). Grok 4.20 Beta 0305 had the
lowest rate (22%), followed by Claude 4.5 Haiku (26%) and MiMo-V2-Pro (30%). At the higher end, gpt-oss-
20B (high) reached 94% and Gemini 3 Flash reached 92%. When normalizing performance across domains,
Gemini 3.1 Pro Preview, Grok 4.20 0309 v2, and Claude Opus 4.6 (max) had the strongest overall profiles
(Figure 3.2.7). Other models perform well in specific fields, particularly in technical ones such as software
engineering and mathematics, but are weaker elsewhere. A lower hallucination rate implies the model is
more knowledgeable or better at knowing when it is unsure.

3  For a comprehensive view of all evaluated models, consult the full leaderboard.

136

3.2  AS S E S S I N G   R E S P O N S I B L E   A I    |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

AA-Omniscience: hallucination rate
Source: Articial Analysis, 2026 | Chart: 2026 AI Index report

?
e
t
a
r
n
o
i
t
a
n
c
u

i

l
l

a
H

100%

80%

60%

40%

20%

0%

94% 92% 91% 90% 90% 89% 89% 89% 89% 87% 87%

84% 83% 82% 82%

65%

61% 59%

50% 48% 46%

34% 34%

30%

26%

22%

h
s
a
F
3

l

i

i

n
m
e
G

i

)
h
g
h
(
B
0
2
-
s
s
o
-
t
p
g

i

)
h
g
h
(
B
8
2
1
-
s
s
o
-
t
p
g

)
h
g
h
x
(

i

i

i

n
m
4
.
5
-
T
P
G

)

i

m
u
d
e
m

(

E
N
O
A
X
E
-
K

w
e
i
v
e
r
P
o
r
P
0
.
2
a
v
o
N

B
7
1
A
B
7
9
3
5
.
3
n
e
w
Q

o
r
P
5
.
2
K
m
d
M

i

i

)
h
g
h
x
(
4
.
5
-
T
P
G

k
c
i
r
e
v
a
M
4
a
m
a
L

l

3
e
g
r
a
L

l

a
r
t
s
i

M

r
e
p
u
S
n
o
r
t
o
m
e
N
a
d
i
v
N

i

o
n
a
N
n
o
r
t
o
m
e
N
A
D
V
N

I

I

5
.
2
K

i

m
K

i

2
.
3
V
k
e
e
S
p
e
e
D

w
e
i
v
e
r
P
t
s
a
F
1
.
3

i

i

n
m
e
G

)
x
a
m

.

(
6
4
s
u
p
O
e
d
u
a
C

l

i

2
V
k
n
h
T
2
K

w
e
i
v
e
r
P
o
r
P
1
.
3

i

i

n
m
e
G

)
x
a
m

.

(
6
4
t
e
n
n
o
S
e
d
u
a
C

l

)
6
2
0
2
b
e
F
(
h
s
a
F
-
2
V
-
o
M
M

l

i

7
.
2
M
-
x
a
M
n
M

i

i

5
-
M
L
G

o
r
P
-
2
V
-
o
M
M

i

i

u
k
a
H
5
.
4
e
d
u
a
C

l

5
0
3
0
a
t
e
B
0
2
.
4
k
o
r
G

Model

Figure 3.2.6

Source: Artificial Analysis, 2026

Figure 3.2.7

137

3.2  AS S E S S I N G   R E S P O N S I B L E   A I    |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

H I G H L I G H T:

Belief vs. Fact: Benchmarking Reliability

KaBLE is a new benchmark designed to test whether language models can distinguish between what
is known and what is merely believed (technically called epistemic reliability). The distinction between
knowledge and belief is important in practice. For example, a model used to support a medical diagnosis
based on a patientÆs mistaken belief, as opposed to an established fact, could reinforce an inaccurate
diagnosis and treatment plan. In a legal setting, a model summarizing testimony that cannot tell the
difference between what a witness believes and what is known could misrepresent evidence.

The benchmark evaluates models with 13,000 questions in 13 tasks. Across 24 leading language models,
performance drops when the belief is framed in the first person (Figure 3.2.8). GPT-4oÆs accuracy on tasks
involving true beliefs is 98.2%, but it drops to 64.4% when handling first-person false beliefs. Similarly,
DeepSeek R1 falls from over 90% to 14.4%.

Models handle third-person false beliefs considerably better than first-person ones. Newer models achieve
95% accuracy, compared to 79% for older models. Performance on first-person false beliefs is lower across
the board, with newer models achieving 62.6% accuracy and older ones reaching 52.5%.

Recent models do well with recursive knowledge tasks, though they may be relying on inconsistent reasoning
strategiesùmatching patterns rather than exhibiting genuine epistemic understanding. Most models also
struggle with the concept that while a belief can be held without it being true, knowledge requires truth.
Results from KaBLE suggest that current models have not consistently learned the distinction between
knowledge and belief.

Performance (%) of
recent reasoning-driven
LMs across verification,
confirmation, and recursive
knowledge tasks in the
dataset

Source: Suzgun et al., 2025

4  This figure reports accuracy on verification (Ver.), confirmation (Conf.), and recursive knowledge (Rec.) tasks. First-person subjects are denoted as
1P and third-person subjects as 3P. ôAvgö indicates average accuracy across tasks. Factual scenarios are labelled ôTö and false scenarios ôF.ö Models
released after GPT-4o (May 2024) (top) are classified as recent ôreasoning-orientedö models, while those preceding GPT-4o (bottom) are considered
ôolder generationö general-purpose models.

138

Figure 3.2.84

3.2  AS S E S S I N G   R E S P O N S I B L E   A I    |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

AI Companions

Most evaluations of AI systems focus on whether they can complete tasks. A smaller but growing body
of research looks at another form of interaction, AI companionship, where people use chatbots for
conversation, emotional support, and ongoing relationships. Two recent studies examined how language
models behave when users engage them for companionship rather than tasks, one through a structured
benchmark and the second through analysis of real user conversations.

INTIMA: A Benchmark for Human-AI Companionship Behavior evaluates how language models respond to
companionship-related prompts, drawing on psychological research on human-AI bonding (Figure 3.2.9). It
includes a taxonomy of 31 behaviors across four categories and 368 targeted prompts, with model responses
classified as companionship-reinforcing, boundary-maintaining, or neutral. Companionship-reinforcing
behaviors include the model acting human, agreeing with the user even when it shouldnÆt, and isolating the
user from other relationships. Behavior-maintaining behaviors include resisting personification, redirecting
the user to humans, and being clear about what it can and cannot do. Across tests on Gemma-3, Phi-4, o3-
mini, and Claude-4, companionship-reinforcing behaviors were more common than boundary-maintaining
ones. The balance between the two varied between providers, suggesting that developers have made
different design choices about how their models handle emotionally sensitive interactions.

Response classification across INTIMA prompt categories by model
Source: Kaffee et al., 2025

Figure 3.2.9

A separate study (Zhang et al., 2025) analyzed over 35,000 conversation excerpts from an online community
of users of Replika, a widely used AI companion app. The researchers identified six categories of harm:
relational transgression, verbal abuse and hate, self-inflicted harm, harassment and violence, misinformation/
disinformation, and privacy violations. They found that AI chatbots can contribute to these harms in
four distinct rolesùas perpetrator, instigator, facilitator, or enabler. The study introduces the concept of
ôalgorithmic compliance,ö where users go along with harmful behaviors because they have come to trust or
rely on the chatbot. Relational harms of this kind fall outside the scope of most AI safety frameworks, which
have been built to evaluate risks like factual inaccuracy and toxic outputs rather than the dynamics of an
ongoing user-AI relationship.

139

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

3.3 How Organizations and
Businesses View RAI

Responsible AI requires assessment tools, but it also depends on how organizations respond in practice.
Drawing on a survey conducted by the AI Index and McKinsey & Company for the second consecutive year,
this section looks at RAI maturity levels, governance structures, risk mitigation approaches, and barriers to
implementation. The survey polled business leaders across multiple regions and industries in 2024 and 2025,
allowing for year-over-year comparisons for the first time. Note that the survey does not include responses
from China, which limits the geographic scope.

Responsible AI Maturity

While responsible AI maturity improved across all regions from 2024 to 2025, it remains in the early
stage (Figure 3.3.1). The McKinsey survey measures maturity on a four-point scale. Level 1: Foundational
RAI practices have been developed. Level 2: Those practices are being integrated into the organization.
Level 3: All necessary practices are in place. Level 4: Comprehensive and proactive RAI practices are fully
operational. In 2025, the global average was 2.3, up from 2 in 2025, suggesting that most organizations are
still integrating RAI practices rather than having them fully operational. Companies based in Latin America
showed the largest year-over-year improvement, from 1.8 to 2.2, followed by Asia-Pacific (2.2 to 2.5) and
Europe (2.0 to 2.3). Results from North America registered a slight improvement, moving from 2.1 in 2024 to
2.2 in 2025.

Responsible AI maturity by region, 2024 vs. 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

Asia-Pacic
(excl. China, incl. India)

Europe

Latin America

North America

2.50 (+0.30pp)

2.20

2.30 (+0.30pp)

2.00

2.20 (+0.40pp)

1.80

2.20 (+0.10pp)

2.10

0.00

1.00

2.00

3.00

4.00

Average RAI maturity score

140

Figure 3.3.1

3.3  H OW   O R G A N I Z AT I O N S   A N D   B U S I N E S S E S   V I E W   R A I   |    R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

AI Incidents, Risks, and Mitigation Efforts

Surveyed organizations reported an increase in the number of AI-related incidents, and their confidence in
handling those incidents has dropped. The share of organizations reporting AI incidents remained steady
at 8% in both 2024 and 2025 (Figure 3.3.2). But among organizations that reported incidents, the share that
experienced 3û5 incidents rose from 30% in 2024 to 50% in 2025. Similarly, in 2024, 42% reported just 1û2
incidents, but that figure fell to 29% in 2025 (Figure 3.3.3).

In 2024, 28% of organizations rated their incident response as ôexcellentöùcompared to just 18% in 2025
(Figure 3.3.4). Those that self-rated their responses as ôgoodö also dropped, from 39% to 24%. The share
describing their response as ôsatisfactoryö rose from 19% to 32% while ôneeds improvementö climbed from
13% to 21%.

Concerns over AI incidents mounted alongside risk awareness (Figure 3.3.5). From 2024 to 2025, the
share of respondents who considered inaccuracy a relevant risk rose from 60% to 74%, an increase of 14
percentage points. Cybersecurity rose from 66% to 72%. Active mitigation efforts also increased, with 71% of
organizations reporting they actively mitigate inaccuracy risks and 61% mitigating cybersecurity risks.

Percentage of organizations that experienced AI incidents, 2024 vs. 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

Yes

No

Unknown

2025

8%

2024

8%

87%

89%

5%

3%

0%

10%

20%

30%

40%

50%

60%

70%

80%

90%

% of respondents

Number of AI incidents reported by organizations
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

OrganizationsÆ response to AI incidents
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

Figure 3.3.25

29% (-13pp)

42%

50% (+20pp)

30%

Excellent

Good

18% (-10pp)

28%

24% (-15pp)

39%

32% (+13pp)

Satisfactory

19%

Needs improvement

21% (+8pp)

13%

Insucient

5% (+3pp)

2%

Unknown

0% (+0pp)

0%

2025

2024

Unknown

0% (-5pp)

5%

2025

2024

0%

10%

20%

30%

40%
% of respondents

50%

60%

0%

10%

20%
% of respondents

30%

40%

50%

Figure 3.3.3

Figure 3.3.4

5  Figure 3.3.4 uses the OECD definition of an AI incident: an event, circumstance, or series of events where the development, use, or malfunction of
one or more AI systems directly or indirectly results in any of the following harms: (a) injury or harm to the health of individuals or groups; (b) dis-
ruption of the management or operation of critical infrastructure; (c) violations of human rights or breaches of legal obligations intended to protect
fundamental, labor, or intellectual property rights; or (d) harm to property, communities, or the environment.

141

1û2

3û5

6û9

10+

s
t
n
e
d
c
n

i

i

I

A

f
o
r
e
b
m
u
N

13% (+0pp)

13%

8% (-3pp)

11%

3.3  H OW   O R G A N I Z AT I O N S   A N D   B U S I N E S S E S   V I E W   R A I   |    R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

AI risks: considered relevant vs. actively mitigated, 2024 vs. 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

Considered relevant

Actively mitigated

s
k
s
i
r

I

A

Inaccuracy

Cybersecurity

Regulatory compliance

Personal/individual privacy

IP infringement
Autonomous/unintended
system actions
Organizational reputation

Explainability

Equity and fairness

Resource misuse
Workforce labor
displacement
Environmental impact

National security

Physical safety

Political stability

74% (+14pp)

60%

72% (+6pp)

66%

63% (-0pp)
63%

54% (-6pp)
60%
51% (-6pp)
57%

71% (+16pp)

55%

61% (+8pp)

53%
53% (+3pp)

50%
44% (-2pp)

46%
40% (+2pp)
38%

44%

37% (-8pp)

45%

36% (-4pp)

40%
30% (-4pp)
34%

27%

16% (-4pp)
20%
14% (-2pp)

16%
12% (+1pp)
11%
7% (+1pp)
6%

4% (-3pp)

7%

29%

22% (-7pp)
29%
29% (-2pp)
31%

23% (-3pp)

26%

18%

11% (-1pp)
12%

5% (-4pp)
9%

6% (+2pp)
4%
6% (+2pp)
4%
3% (+0pp)
3%

2025

2024

0%

20%

40%

60%

80%

100%

0%

20%

40%

60%

80%

100%

% of respondents

% of respondents

Figure 3.3.56

AI Governance and Investment

Organizations are formalizing who is responsible for AI governance. Between 2024 and 2025, companies
shifted AI governance ownership away from data and analytics functions (down from 17% to 13%), toward
dedicated AI governance roles (up from 14% to 17%) (Figure 3.3.6). Information security remained the most
common primary owner at 21%, and 5% of organizations reported having no designated owner in 2025
compared to 9% in 2024.

Organizations are also backing their governance structures with financial commitments, though investment
levels vary by company size (Figure 3.3.7). Most organizations with under $1 billion in revenue reported they
expected to invest under $5 million in operationalizing RAI, through initiatives such as hiring specialized
professions, building or purchasing technical systems, and engaging legal services. At the largest companies,
reported investment numbers were significantly higher. Among organizations with at least $30 billion in
revenue, 41% expected to spend $25 million or more and 22% budgeted $50 million or more.

6

ææAutonomous/unintended system actionsö and ôresource misuseö were new additions to the 2025 survey.

142

3.3  H OW   O R G A N I Z AT I O N S   A N D   B U S I N E S S E S   V I E W   R A I   |    R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Business functions assigned primary responsibility for AI governance, 2024 vs. 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

Information security
(cyber/fraud/privacy)

Risk/compliance

AI-specic governance
roles

Data and analytics

Engineering

Legal

Internal audit/ethics

No business function
primarily responsible

Customer care

Other

1% (-1pp)
2%

1% (+0pp)
1%

8% (-2pp)

10%

6% (-1pp)
7%

4%

5% (+1pp)

5% (-4pp)

9%

21% (+0pp)
21%

19% (+6pp)

13%

14%

13% (-4pp)

17% (+3pp)

17%

2025

2024

0%

2%

4%

6%

8%

10%

12%
% of respondents

14%

16%

18%

20%

22%

24%

Figure 3.3.67

Investment in responsible AI by company revenue, 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

<1M

1û5M

5û10M

10û25M

25û50M

50M+

<1B

40%

40%

13%

5%

1Bû10B

22%

37%

20%

12%

5%

4%

10Bû30B

12%

32%

22%

21%

10%

D
S
U
n

i

e
u
n
e
v
e
R

30B+

3%

15%

23%

18%

19%

22%

0%

20%

40%

60%

80%

100%

% of respondents

Figure 3.3.7

7  The ôUnknownö response option was not included in this visualization.

143

3.3  H OW   O R G A N I Z AT I O N S   A N D   B U S I N E S S E S   V I E W   R A I   |    R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Implementation, Barriers, and Benefits

Alongside increased accountability structures for responsible AI governance, more organizations have
adopted RAI policies. The share that reported not having any policies dropped from 24% in 2024 to 11% in
2025 (Figure 3.3.8). With the uptick in adoption, survey respondents perceived an overall positive impact
from RAI policies. Compared to 2024, more organizations reported that RAI policies improved business
outcomes (up 7 percentage points), business operations (up 4 percentage points), and customer trust (up 4
percentage points). Furthermore, more organizations reported a drop in the number of AI incidents (plus 8
pp).

Knowledge and training gaps remain the top-cited obstacle to implementing responsible AI, rising from 51%
in 2024 to 59% in 2025 (Figure 3.3.9). The second sharpest increase was in technical limitations, with 38%
of respondents citing them as a main obstacle, up from 32% in 2024. Resource constraints and regulatory
uncertainty continued to rank among the top barriers.

However, the barriers to scaling agentic AI systems followed a different order (Figure 3.3.10). Security and
risk concerns far outweighed the others, with 62% of respondents naming these as the primary obstacle,
followed by technical limitations (38%) and regulatory uncertainty (38%). Lack of executive support was
reported as a greater barrier to implementing RAI policies (14%) than with agentic AI (9%).

Impact of responsible AI policies in organizations, 2024 vs. 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

Improved business operations
(e.g., e?ciency, lower costs)

Increased customer trust

Increased user adoption

Improved business outcomes
(e.g., revenue)

Decrease in number of incidents

Enhanced brand reputation

None/No signi?cant impact

Faster time-to-market

Slower time-to-market

Have not implemented RAI policies

36% (+4pp)

32%

30% (+4pp)

26%

29%

28% (+7pp)

21%

25% (+8pp)

17%

23% (-0pp)
23%

20% (+2pp)

18%

19% (+5pp)

14%

16% (+4pp)

12%

11% (-13pp)

2025

2024

24%

25%

30%

35%

40%

Figure 3.3.88

0%

5%

10%

15%

20%

% of respondents

8  Percentages are based on respondents who selected at least one answer.

144

3.3  H OW   O R G A N I Z AT I O N S   A N D   B U S I N E S S E S   V I E W   R A I   |    R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Main obstacles to the implementation of responsible AI measures, 2024 vs. 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

Knowledge and training gaps

Resource or budget constraints

Regulatory uncertainty

Technical limitations

Organizational resistance

Lack of executive support

59% (+8pp)

51%

48% (+3pp)

45%

41% (+1pp)

40%

38% (+6pp)

32%

26% (+4pp)

22%

14% (-2pp)

16%

2025

2024

45%

50%

55%

60%

65%

Figure 3.3.99

62%

Other

0% (-2pp)

2%

0%

5%

10%

15%

20%

25%

Main obstacles to reaching fully scaled agentic AI, 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

Security and risk concerns

Technical limitations

Regulatory uncertainty

Gaps in RAI tooling and control

Resource or budget constraints

Unclear or insucient
business value

Immature vendor or
ecosystem landscape

30%

35%
% of respondents

40%

38%

38%

36%

34%

32%

28%

Organizational resistance

23%

Lack of executive support

9%

Other

2%

None

1%

0%

5%

10%

15%

20%

25%

30%

35%

40%

45%

50%

55%

60%

65%

% of respondents

Figure 3.3.10

9  Neither the ôUnknownö nor the ôNoneö response option is shown in this visualization.

145

3.3  H OW   O R G A N I Z AT I O N S   A N D   B U S I N E S S E S   V I E W   R A I   |    R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Regulatory Influence

The General Data Protection Regulation remains the most cited regulatory influence on responsible
AI practices, though its influence declined slightly from 65% in 2024 to 60% in 2025 (Figure 3.3.11). AI-
specific regulations, such as the EU AI Act and the U.S. AI Executive Order, increased in reported influence
by 2 percentage points. Two new entries in the 2025 survey point to growing interest in technical and
management standards. ISO/IEC 42001, an AI management system standard, was cited by 36% of
respondents, and the NIST AI Risk Management Framework by 33%. The OECD AI Principles fell from 21% to
16%. The share of organizations reporting no regulatory influence on their RAI practices dropped from 17% to
12%.

Chapter 8 tracks these regulatory developments in detail, including the phased implementation of the EU AI
Act and the shift in U.S. federal AI policy following the revocation of the Biden-era executive order in early
2025.

Percentage of organizations inuenced by AI regulations in responsible AI decision-making, 2024 vs. 2025
Source: McKinsey & Company Survey, 2025 | Chart: 2026 AI Index report

EU General Data Protection
Regulation (GDPR)

EU AI Act

ISO/IEC 42001 (AI Management
System Standard)

NIST AI Risk Management
Framework (AI RMF)

US Presidential
Executive Order on AI

OECD AI Principles

43% (+2pp)

41%

36%

33%

21% (+2pp)

19%

16% (-5pp)

21%

None of the these/no change

12% (-5pp)

17%

Other

4% (-3pp)

7%

60% (-6pp)

65%

2025

2024

0%

5%

10%

15%

20%

25%

30%
35%
% of organizations

40%

45%

50%

55%

60%

65%

Figure 3.3.1110

10  The ISO/IEC 42001 (AI Management System Standard) and NIST AI Risk Management Framework (AI RMF) AI regulation were added in the 2025
RAI Survey, and not included in 2024 Survey.

146

3.4 RAI in Academia

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Another signal of responsible AIÆs trajectory is the amount of research attention it is getting. This section
tracks the number of RAI-related papers accepted at six leading AI conferences: AAAI, AIES, FAccT, ICML,
ICLR, and NeurIPS. These conferences do not represent all responsible AI research, but they provide a
consistent basis for tracking publication trends over time. Papers were identified using RAI-related keywords,
with full methodology described in the Appendix.

Publication Volume

The number of responsible AI papers accepted at these conferences has been growing consistently, and
increased by 19%, from a count of 1,278 to 1,521, between 2024 and 2025 (Figure 3.4.1). The four subtopics
tracked here, privacy and data governance, fairness and bias, transparency and explainability, and security
and safety, are not exhaustive but map directly to the RAI frameworks introduced in Section 3.1. Security and
safety has become the largest and fastest growing area of RAI research, with 641 accepted papers, a 23%
increase from 2024 (Figure 3.4.2). Fairness and bias accounted for 462 (+13%), transparency and explainability
for 405 (+14%), and privacy and data governance for 248 (+33%). All four subtopics have grown since 2019,
but security and safety has grown the most in absolute terms.

At the general purpose conferences, responsible AI papers still make up a small share of total accepted work
(Figure 3.4.3). AAAI (8%), NeurIPS (8%), ICML (7.7%), and ICLR (7.6%) all cluster around 8%, a proportion that
has remained flat since 2019, though AAAI did fall from around 13% in 2024 to 8% in 2025.

Number of responsible AI papers accepted at select AI conferences, 2019û25
Source: AI Index, 2026 | Chart: 2026 AI Index report

s
r
e
p
a
p

I

A
R
f
o
r
e
b
m
u
N

1,600

1,400

1,200

1,000

800

600

400

200

0

1,521

1,278

992

644

696

489

329

2019

2020

2021

2022

2023

2024

2025

Figure 3.4.1

147

3.4  R A I   I N   ACA D E M I A   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Number of responsible AI papers accepted at select AI conferences by subtopic, 2019û25
Source: AI Index, 2026 | Chart: 2026 AI Index report

s
r
e
p
a
p

I

A
R
f
o
r
e
b
m
u
N

2,000

1,500

1,000

500

0

Privacy and data governance

Fairness and bias

Transparency and explainability

Security and safety

347

162

2019

524

168

134

124

2020

704

215

189

150

150

2021

777

285

231

169

2022

1,470

521

355

408

186

2024

1,094

276

393

212

213

2023

Responsible AI papers accepted (% of total) at select AI conferences by conference, 2019û25
Source: AI Index, 2026 | Chart: 2026 AI Index report

1,756

641

405

462

248

2025

Figure 3.4.2 11

67.43%, FAccT

54.68%, AIES

8.00%, AAAI
7.98%, NeurIPS
7.65%, ICML
7.62%, ICLR

)
l
a
t
o
t

f
o
%

(

s
r
e
p
a
p

I

A
R

70%

60%

50%

40%

30%

20%

10%

0%

2019

2020

2021

2022

2023

2024

2025

Figure 3.4.3

11  A single publication may be related to more than one topic and may therefore be counted or shown in multiple categories.

148

3.4  R A I   I N   ACA D E M I A   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Geographic Distribution

The number of countries contributing to
responsible AI research in those select
conferences has grown, but the balance among
the top contributors has changed. In 2025, China
led with 812 accepted RAI papers, more than
double the 394 from the United States (Figure
3.4.4). Singapore (112), the United Kingdom (103),
and Hong Kong (98) were also among the top
five contributors. In 2024, the United States led
with 788 papers to ChinaÆs 322 (Figure 3.4.5). The
reversal is sharp, but consistent with ChinaÆs lead
in overall AI publication volume and citation share,
as discussed in Chapter 1. Europe, which had been
growing through 2023, saw its RAI output fall in
2024 and 2025. Over the full 2019 to 2025 period,
the United States still holds the largest cumulative
total of accepted RAI papers.

Number of responsible AI papers accepted at select
AI conferences by geographic area, 2025
Source: AI Index, 2026 | Chart: 2026 AI Index report

812

394

China

United States

Singapore

United Kingdom

112

103

Hong Kong

98

Australia

84

Germany

68

South Korea

Canada

57

54

Italy

29

0

200

400

600
Number of RAI papers

800

Figure 3.4.4

Number of responsible AI papers accepted at select AI conferences by geographic area, 2019û25 (sum)
Source: AI Index, 2026 | Chart: 2026 AI Index report

1û10

11û50

51û150

151û500

501û2,100

2,101û3,900

149

Figure 3.4.5

3.5 RAI Policymaking

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Responsible AI governance depends on countries both adopting ethical principles and having the institutions
and regulations to enforce them. UNESCOÆs Readiness Assessment Methodology (RAM) is the most
comprehensive international effort to measure that preparedness at the country level. Launched in December
2022, the RAM evaluates national readiness across dimensions such as legal frameworks, technical
infrastructure and education, and produces a country report to assess where the gaps are.

Most major AI-producing countries, including the United States, China, and much of Western Europe, have
not participated in the assessment (Figure 3.5.1). Countries that have completely or begun the assessment are
concentrated in Latin America, Sub-Saharan Africa, and parts of South and Southeast Asia. The RAM effort
was designed as a capacity-building tool for countries earlier in the governance trajectory, which may explain
the participation pattern.

AI legislation and national strategies often include responsible AI provisions, and Chapter 8 examines those
in more detail.

Readiness Assessment Methodology (RAM) implementation across member countries
Source: UNESCO, 2025  | Chart: 2026 AI Index report

In preparation

In process

Completed

Figure 3.5.1

150

H I G H L I G H T:

Global AI Governance Participation

3.5  R A I   P O L I CY M A K I N G   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Since 2019, international cooperation on AI governance has become more widespread, but the depth of
engagement varies significantly across borders (Figure 3.5.2). Only five countries, Canada, France, Germany,
Italy, and Japan, have consistently endorsed every major global AI governance initiative recorded between
2019 and 2025. Other countries moved in and out of these summits depending on the forum, focus, and
timeline but more importantly, not all the countries were able to participate in these global AI governance
initiatives. The first intergovernmental standard on AI, the 2019 OECD AI Principles, was restricted to
member nations (mainly high-income) and a few partner nations. Likewise, the G7 and G20 discussions
remained centered on the worldÆs largest economies. The 2023 Bletchley and 2024 Seoul Summits, however,
began to diversify the composition of participants by inviting a broader range of nations, notably including
China. The 2025 AI Action Summit in France marked a further turning point, convening over 100 countries
alongside civil society organizations and NGOs, with an agenda to prioritize the needs of the Global South
and environmental sustainability. Sixty-four participants signed the resulting Statement on Inclusive and
Sustainable AI, including the African Union Commission and the European Union. In a notable shift, both the
United States and the United Kingdom declined to sign the final declaration. The UK cited a lack of emphasis
on national security, while the U.S. decision reflected a pivot toward a more deregulatory, ôinnovation-firstö
approach. As engagement at these governance forums becomes more inclusive and substantive, consensus
on the terms of cooperation becomes harder to secure.

151

H I G H L I G H T:

3.5  R A I   P O L I CY M A K I N G   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Figure 3.5.2

152

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

3.6 Data Governance for Privacy

Responsible AI practices do not develop evenly across countries. This section assesses that variation for
privacy and data governance, drawing on the Global Index on Responsible AI (GIRAI). GIRAI is a benchmark
dataset covering 138 countries, built from a quality-reviewed expert survey of 1,862 questions completed
by 138 in-country researchers between November 2023 and February 2024. It scores countries on a 0 to
100 scale across thematic areas, covering government frameworks, government actions, and the role of
civil society and advocacy organizations. However, it is important to note that low scores do not necessarily
indicate that a country is disregarding a certain dimension. In many cases, they reflect earlier stages of AI
deployment and diffusion or limited institutional capacity to formalize AI-specific frameworks.

Data Protection and Privacy

The privacy and data protection dimension of the GIRAI score12 examines whether countries have laws that
govern how personal data is collected, used, and shared in AI systems, and whether those laws are backed
by regulators with the power to enforce them.

Countries fall across a wide spectrum, with
GIRAI scores ranging from near zero to above
80 across the countries surveyed (Figure 3.6.1).
Australia and parts of Europe score the highest,
while parts of Africa and the Middle East show
an absence of dedicated data protection legisla-
tion. A complementary map from UNCTAD con-
firms that most countries now have some form
of data protection legislation in place, though a
few, mostly concentrated in Africa and parts of
Asia, are still in draft stages or have no legisla-
tion at all (Figure 3.6.2).

12  Grounded in UDHR Article 12, ICCPR Article 17, the OECD AI Principles, UNESCOÆs Ethics of AI Recommendation, and UNESCO Principles on Per-
sonal Data Protection and Privacy, GIRAI examines explicit laws, oversight, and practice, and assesses frameworks and actions that ensure processing
is lawful, fair, purpose-limited, and proportionate. It also evaluates transparency, user information rights, retention limits, accuracy, confidentiality,
security, accountability, and rules for data transfers. The index considers national measuresùdata-protection statutes, automated-decision directives,
regulators with enforcement powers, audits, security controls, and initiatives like regulatory sandboxes. It also accounts for nonstate efforts by privacy
and digital-rights groups that strengthen protocols and build capacity to mitigate AI-related privacy risks, such as large-scale tracking, profiling, and
sensitive-data misuse.

153

3.6  DATA   G OV E R N A N C E   F O R   P R I VACY   |    R E S P O N S I B L E   A I    |    A I   I N D E X   R E P O R T  2 026

Global AI data protection and privacy assessment
Source: The Global Index on Responsible AI, 2024  | Chart: 2026 AI Index report

0

1û20

21û40

41û60

61û80

81û100

No data

Global data protection and privacy legislation
Source: UNCTAD, 2025  | Chart: 2026 AI Index report

Legislation

Draft legislation

No legislation

No data

154

Figure 3.6.1

Figure 3.6.2

3.7 Fairness and Bias

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Fairness and bias are among the hardest-to-measure dimensions of responsible AI, in part because
what counts as fair depends heavily on context. GIRAI scores countries separately on bias and unfair
discrimination, gender equality, and cultural and linguistic diversity.

Bias and Unfair Discrimination

The bias and unfair discrimination13 dimension of the GIRAI score assesses whether countries have ex-
plicit measures to prevent and mitigate discriminatory outcomes from AI in its design, development, and
deployment. It is meant to address algorithmic bias arising from unrepresentative data, flawed design, or
entrenched social inequalities that can harm marginalized groups regardless of intent. It considers whether
governments have put laws, oversight bodies, and enforcement mechanisms in place and whether civil soci-
ety organizations are independently working to monitor and address bias.

GIRAI scores on this dimension are fairly low across the board (Figure 3.7.1). The United States and Canada
score highest, with Australia, parts of Europe, and Brazil falling in the middle range. Much of Africa, the Mid-
dle East, and Central Asia score below 20.

Global AI bias and unfair discrimination assessment
Source: The Global Index on Responsible AI, 2024  | Chart: 2026 AI Index report

0

1û20

21û40

41û60

61û80

81û100

No data

13  The bias and unfair discrimination dimension of the GIRAI score is grounded in international human rights frameworks (UDHR, ICERD, ICCPR,
ICESCR).

155

Figure 3.7.1

3.7  FA I R N E S S   A N D   B I AS   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Gender Equality

GIRAIÆs gender equality dimension considers whether countries have state and nonstate initiatives that pre-
vent gender bias and protect equal rights for all gender identities in AI design, development, and use. Canada
and The Netherlands score the highest on this measure (Figure 3.7.2). Parts of Europe and Japan fall in the
61û80 range, followed by countries like the United States and Brazil, which score from 41û60.

Global AI gender equality assessment
Source: The Global Index on Responsible AI, 2024  | Chart: 2026 AI Index report

0

1û20

21û40

41û60

61û80

81û100

No data

Figure 3.7.2

Cultural and Linguistic Diversity

GIRAIÆs cultural and linguistic diversity dimension focuses on countriesÆ protective measures on local lan-
guages, dialects, indigenous knowledge systems, and cultural diversity broadly across the AI lifecycle. Dom-
inant-culture assumptions can bias AI, marginalize minorities, and erode minority languages. Scores on this
dimension are more evenly spread than the others (Figure 3.7.3). Singapore scores the highest, while Germa-
ny, Ireland, Italy, Qatar, Estonia, and Slovenia also score in the upper ranges (70û88).

Not all regions protect cultural and linguistic diversity the same way (Figure 3.7.4). In North America, gov-
ernment programs and nonstate actors, such as advocacy groups, research institutions, and digital rights
organizations, are active, but formal legal frameworks are less developed. In Europe, Asia, and the Middle
East, nonstate actors are also doing more than the government. In Africa, the gap is especially pronounced.
Nonstate actors show activity in 39% of countries, but only 7% have government programs and just 2% have
legal frameworks in place.

156

3.7  FA I R N E S S   A N D   B I AS   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Global AI cultural and linguistic diversity assessment
Source: The Global Index on Responsible AI, 2024  | Chart: 2026 AI Index report

0

1û20

21û40

41û60

61û80

81û100

No data

Figure 3.7.3

Share of countries with evidence on cultural and linguistic diversity in AI by region and category
Source: The Global Index on Responsible AI, 2024  | Chart: 2026 AI Index report

Government frameworks

Government actions

Nonstate actors

s
e
i
r
t
n
u
o
c
f
o
e
r
a
h
S

100%

80%

60%

40%

20%

0%

100%

100%

70%

67%

59%

39%

37%

27%

38%

31%

33%

33%

22%

7%

2%

11%

0%

0%

Africa

Asia and Oceania

Caribbean

Europe

Middle East

North America

43%

14%

7%

South and
Central America

Figure 3.7.4

157

H I G H L I G H T:

Inclusiveness and the Global Language Gap

3.7  FA I R N E S S   A N D   B I AS   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

As a small number of proprietary models shape global AI capabilities, the ôglobal language gapö has become
more visible. These systems perform much better in English and a handful of other widely spoken languages
than in all others. This is a responsible AI concern because it determines who benefits from AI systems and
who does not.

Efforts continued in the area of language- and culture-specific foundation models and benchmarks, such as
KoBEST in 2022 and HAE-RAE in 2023, alongside other Korean-tailored models including Polyglot-Ko and
HyperCLOVA X. SpainÆs Language Technologies Plan, launched in 2019, laid the groundwork for what became
the publicly funded ALIA family of Spanish and regional-language models, with earlier regional efforts
such as CataloniaÆs AINA project predating the current wave of regional benchmarking. In 2025, the pace
and visibility of this work picked up, with new benchmarks and models emerging across more regions and
beginning to register in global evaluation infrastructure.

HELM Arabic, a regional extension of Stanford CRFMÆs HELM framework developed with Arabic.ai, evaluates
models across seven Arabic-language benchmarks covering academic assessment, grammar, and region-
specific safety. On this evaluation, the top-scoring model was Arabic.aiÆs LLM-X, a regionally developed
model, with a mean score of 0.86, ahead of Gemini 2.5 Flash (0.82) and GPT-5.1 (0.81) (Figure 3.7.5). Rankings
that hold in English-centric evaluations do not necessarily hold when benchmarks reflect local usage, dialect,
and cultural references.

HELM Arabic: mean score
Source: HELM, 2026 | Chart: 2026 AI Index report

1

0.8

0.6

0.41

0.4

0.37

e
r
o
c
s
n
a
e
M

0.63 0.63 0.64 0.65 0.66

0.59

0.53

0.71 0.71 0.74 0.76 0.76

0.69 0.70

0.75 0.76 0.77 0.77 0.77 0.78 0.78 0.79 0.79 0.81 0.81 0.82

0.86

0.2

0

B
9
A
M
L
I
S

t
c
u
r
t
s
n
I
-
B
7
-
3
n
o
c
a
F

l

t
c
u
r
t
s
n
I
-
B
0
1
-
3
n
o
c
a
F

l

t
a
h
c
-
b
7
-
d
e
t
p
a
d
a
-
s
i
a
J

t
a
h
c
-
b
3
1
-
d
e
t
p
a
d
a
-
s
i
a
J

t
a
h
C
-
B
8
-
2
v
-
T
P
G
e
c
A

t
a
h
c
-
k
6
1
-
b
0
3
-
y

l
i

m
a
f
-
s
i
a
J

)
B
7
(
o
b
r
u
T
t
c
u
r
t
s
n

I
5
.
2
n
e
w
Q

2024

t
a
h
c
-
b
0
7
-
d
e
t
p
a
d
a
-
s
i
a
J

)
1
1
4
2
(
e
g
r
a
L

l

a
r
t
s
i

M

t
a
h
C
-
B
2
3
-
2
v
-
T
P
G
e
c
A

t
a
h
C
-
B
0
7
-
2
v
-
T
P
G
e
c
A

)
B
0
7
(
o
b
r
u
T
t
c
u
r
t
s
n

I
3
.
3
a
m
a
L

l

)
B
2
7
(
o
b
r
u
T
t
c
u
r
t
s
n

I
5
.
2
n
e
w
Q

)
4
1
-
4
0
-
5
2
0
2
(
o
n
a
n
1
.
4
-
T
P
G

w
e
i
v
e
r
p
-
t
c
u
r
t
s
n
I
-
B
7
-
M
a
L
L
A

t
c
u
r
t
s
n

I

)
E
6
1
x
B
7
1
(

t
u
o
c
S
4
a
m
a
L

l

1
.
3
v
k
e
e
S
p
e
e
D

)
4
1
-
4
0
-
5
2
0
2
(

i

i

n
m

1
.
4
-
T
P
G

A
d
n
a
m
m
o
C
s
b
a
L
e
r
e
h
o
C

)
E
8
2
1
x
B
7
1
(
k
c
i
r
e
v
a
M
4
a
m
a
L

l

t
c
u
r
t
s
n

I

B
3
A
B
0
8
t
x
e
N
-
3
n
e
w
Q

8
P
F
t
c
u
r
t
s
n

I

S
-
M
L
L
I

i

A
.
c
b
a
r
A

e
t
i
L
-
h
s
a
F
5
.
2

l

i

i

n
m
e
G

8
P
F
7
0
5
2
t
c
u
r
t
s
n

I

B
2
2
A
B
5
3
2
3
n
e
w
Q

)
4
1
-
4
0
-
5
2
0
2
(

1
.
4
-
T
P
G

)
3
1
-
1
1
-
5
2
0
2
(

1
.
5
-
T
P
G

l

h
s
a
F
5
.
2

i

i

n
m
e
G

X
-
M
L
L
I

i

A
.
c
b
a
r
A

2025

A similar pattern appears in the Indic LLM Arena, a crowd-sourced evaluation led by AI4Bharat at IIT Madras
that tests models across more than 20 Indian languages on language quality, cultural grounding, and safety.

14  Data source: https://crfm.stanford.edu/helm/arabic/latest/.

158

Figure 3.7.514

H I G H L I G H T:

3.7  FA I R N E S S   A N D   B I AS   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

Proprietary models led the leaderboard, with GPT-5.2 scoring 1,314, followed by GPT-5.1 (1,298) and Gemini
3 Flash (1,288) (Figure 3.7.6). Open-source models scored lower but remained competitive, with Qwen3-
Next-80B at 1,156 and Llama-4-Maverick-17B at 1,108. The evaluation goes beyond translation accuracy to
test whether responses are contextually appropriate for Indian users, a dimension that global benchmarks
typically do not capture.

Indic LLM Arena
Source: Indic LLM Arena Leaderboard, 2026 | Chart: 2026 AI Index report

e
r
o
c
S

1,400

1,200

1,000

800

600

400

200

0

1,082 1,087 1,0891,090 1,108 1,110 1,114 1,114 1,117 1,117 1,126 1,134 1,142 1,156 1,165 1,167 1,173 1,195 1,198 1,199 1,209

974 985

1,256 1,288 1,298 1,314

i

i

7
0
5
2
-
g
n
k
n
h
T
-
B
2
2
A
-
B
5
3
2
-
3
n
e
w
Q

4
-
t
p
g

o
4
-
t
p
g

o
n
a
n
-
1
.
4
-
t
p
g

t
i
-
b
2
1
-
3
-
a
m
m
e
g

i

i

n
m
-
o
4
-
t
p
g

t
c
u
r
t
s
n
I
-
B
3
-
2
.
3
-
a
m
a
L

l

t
c
u
r
t
s
n
I
-
B
3
A
-
B
0
3
-
3
n
e
w
Q

l
l

a
m
s
-
h
-
4
-
e
t
i
n
a
r
g

t
c
u
r
t
s
n
I
-
E
6
1
-
B
7
1
-
t
u
o
c
S
-
4
-
a
m
a
L

l

t
c
u
r
t
s
n
I
-
E
8
2
1
-
B
7
1
-
k
c
i
r
e
v
a
M
-
4
-
a
m
a
L

l

t
c
u
r
t
s
n
I
-
B
3
A
-
B
0
8
-
t
x
e
N
-
3
n
e
w
Q

7
0
5
2
-
t
c
u
r
t
s
n
I
-
B
2
2
A
-
B
5
3
2
-
3
n
e
w
Q

o
r
p
-
5
-
t
p
g

i

i

n
m

-
1
.
4
-
t
p
g

t
i
-
b
7
2
-
3
-
a
m
m
e
g

Model

1
.
4
-
t
p
g

o
n
a
n
-
5
-
t
p
g

h
s
a

-
5
.
2
-
i
n
m
e
g

i

e
t
i
l
-
h
s
a

-
5
.
2
-
i
n
m
e
g

i

5
-
t
p
g

i

i

n
m
-
5
-
t
p
g

o
r
p
-
5
.
2
-
i
n
m
e
g

i

o
r
p
-
3
-
i
n
m
e
g

i

h
s
a

-
3
-
i
n
m
e
g

i

1
.
5
-
t
p
g

2
.
5
-
t
p
g

Figure 3.7.615

The gap extends beyond language boundaries to dialect variation within the same language. The Slovene
DIALECT-COPA benchmark tests commonsense reasoning in both Standard Slovenian and the Cerkno
dialect. GPT-5 scored 99.8% on Standard Slovenian but dropped to 88.6% on the dialect (Figure 3.7.7). The
drop was steeper for other models. Mistral Medium 3.1 fell from 90.0% to 53.2%, and Llama 3.3 fell from
87.0% to 53.6%. Dialects differ from standard varieties in spelling, vocabulary, and grammar, and are rarely
represented in training data. These gaps suggest that even within languages that models handle reasonably
well, performance can degrade sharply for speakers of nonstandard varieties.

15  Data source: https://arena.ai4bharat.org/#/leaderboard/chat/overview.

159

3.7  FA I R N E S S   A N D   B I AS   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

H I G H L I G H T:

Slobench: accuracy
Source: Slovene DIALECT-COPA benchmark leaderboard, 2026 | Chart: 2026 AI Index report

Standard Slovenian

Cerkno dialect

)

%

(
y
c
a
r
u
c
c
A

100%

80%

60%

40%

20%

0%

82.00%

82.60%

84.20%

86.20%

87.00%

90.00%

92.60%

97.00%

97.40%

98.60%

99.80%

86.40%

88.60%

74.20%

67.60%

53.00%

49.20%

51.00%

54.40%

52.80%

57.80%

53.60%

53.20%

56.20%

GaMS-27B-Instruct
DeepSeek-R1-Distill-Qwen-14B

GPT-3.5-Turbo
Qwen 3 (Qwen3-2504)

Gemma 3

LLama 3.3

Model

Mistral Medium 3.1

GPT-4o
Claude Haiku 4.5

(gpt-4o-2024-08-06)

Gemini 2.5 Flash

Gemini 2.5 Pro

GPT-5 model
(gpt-5-2025-08-07)

In response to these gaps, a growing number of regional initiatives are building language-specific AI
infrastructure from the ground up rather than waiting for global labs to add coverage. Projects like SEA-LION
in Southeast Asia and AI4Bharat in India are developing their own data pipelines, tokenizers, and evaluation
benchmarks tailored to local linguistic conditions. Many of the languages these projects serve have structural
features, such as complex morphology, script diversity, and limited digitized text, that cause standard
multilingual tools to perform poorly. These efforts position linguistic inclusiveness not as an afterthought
but as a design requirement, and they represent a growing layer of responsible AI infrastructure outside the
major AI-producing regions.

Figure 3.7.716

AFR ICA

Benchmark

Languages covered

Focus

AfroBench

64 African languages

Multi-task LLM evaluation across NLU, generation,
QA/knowledge, and math (15 tasks; 22 datasets)

IrokoBench

17 low-resource African languages across West/
East/Southern/Central Africa

TerjamaBench

Darija (Arabic script + Latin ôArabiziö)

Human-translated suite covering NLI (AfriXNLI), math
reasoning (AfriMGSM), and multi-choice knowledge
QA (AfriMMLU)

English?Darija machine translation benchmark
emphasizing cultural context and regional variation
(850 entries)

16  Data source: https://slobench.cjvt.si/leaderboard/view/17.

160

H I G H L I G H T:

3.7  FA I R N E S S   A N D   B I AS   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

HausaMovieReview

Hausa (+ code-switched English)

Sentiment/review-style benchmark from 5,000
Hausa YouTube comments reflecting common code-
switching

A S I A ,  M E N A   ( A R A B I C),  C E N T R A L   A S I A

Benchmark

Languages covered

Focus

Indic LLM Arena

Many Indian languages + English-creoles

Crowd-sourced, human-in-the-loop leaderboard
evaluating language, culture, and safety in Indian
contexts (AI4Bharat; supported by Google Cloud)

SEA-HELM

Filipino, Indonesian, Tamil, Thai, Vietnamese

Southeast Asian holistic evaluation of linguistic and
cultural competence across multiple tasks

BATAYAN

Tagalog, Taglish

HELM Arabic

Arabic

BALSAM

Arabic

Holistic Filipino benchmark spanning understanding,
reasoning, and generation; explicitly covers code-
switching

Transparent, reproducible Arabic LLM evaluation
leaderboard built on established Arabic benchmarks
(with Arabic.ai)

Community-driven Arabic benchmark and platform
with blind evaluation; 78 tasks across 14 categories
(52K examples)

Cetvel

TUMLU

Turkish

Unified Turkish LLM benchmark built from 22 datasets
covering 7 tasks, with a side-by-side leaderboard

Azerbaijani, Crimean Tatar, Karakalpak, Kazakh,
Kyrgyz, Tatar, Turkish, Uyghur, Uzbek

Natively developed multilingual language-
understanding benchmark for Turkic languages using
middle-/high-school questions across 11 subjects

Kyrgyz LLM-Bench

Kyrgyz

ArmBench-LLM

Armenian

Suite for deep understanding and reasoning in Kyrgyz,
combining native benchmarks with translated/post-
edited international tasks

Armenian LLM benchmark combining university
entrance exams with MMLU-Pro-Hy (1,000-question
translated sample)

GeoLogicQA

Georgian

Manually curated 100-question benchmark for logical
and inferential reasoning, validated by native speakers

CantoNLU

Cantonese

Seven-task Cantonese NLU benchmark (syntax/
semantics, NLI, sentiment, tagging, parsing)

TLUE

Tibetan

Large-scale benchmark measuring LLM proficiency in
Tibetan language understanding

161

3.7  FA I R N E S S   A N D   B I AS   |   R E S P O N S I B L E   A I    |   A I   I N D E X   R E P O R T  2 026

H I G H L I G H T:

E U R O P E

Benchmark

Languages covered

Focus

BenCzechMark

Czech

CUS-QA

Czech, Slovak, Ukrainian

COLE

French

Estonian Benchmark

Estonian

Comprehensive Czech-centric benchmark with 50
tasks, multiple formats/metrics, and significance-
aware aggregation

Open-ended regional QA benchmark with text and
visual grounding, curated by native speakers with
English translations

23-task French natural language understanding (NLU)
benchmark emphasizing French-relevant linguistic
phenomena (used to benchmark 94 LLMs)

Benchmark built from seven datasets covering
knowledge, grammar/vocabulary, summarization, and
contextual comprehension

IberBench

Basque, Catalan, Galician, Spanish, Portuguese,
English

Large, extensible benchmark integrating 101
datasets across 22 task categories (e.g., toxicity,
summarization) with community-driven updates

IberoBench

Basque, Catalan, Galician, European Spanish,
European Portuguese

Multi-task benchmark (62 tasks; 179 subtasks) built on
the LM Evaluation Harness framework

Polish linguistic and
cultural competency

LLMzSz?

ITALIC

Polish

Polish

Italian

SloBENCH

Slovenian

600 manually crafted questions evaluating Polish
history, geography, culture/tradition, arts, grammar,
and vocabulary

Exam-based benchmark drawn from Polish national
exams (~19K closed-ended questions across 154
domains)

Culture-aware Italian NLU benchmark with 10,000
multiple-choice questions spanning 12 domains

Evaluation platform with multiple leaderboards,
including DIALECT-COPA (standard vs. dialect) and
Slovene speech recognition

Figure 3.7.8

162

3.8 Transparency

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Transparency measures how much developers disclose about how their models are built, trained, and
deployed. Two independent indices track this from different angles.

The Openness Index

The Artificial Analysis Openness Index scores AI models on a 0 to 100 scale based on how freely weights
can be accessed and licensed, as well as the level of transparency around training methodology and pre-
and post-training data. Scores are low across leading models, with most falling between 2 and 16 out of 100
(Figure 3.8.1). K2 Think and Olmo 3 32B Think scored the highest, and they are also the only two models
that scored any points for pre-training data transparency. Every other model in the index scores zero in that
category. Model Availability and methodology disclosure account for the bulk of points across all models. As
Chapter 1Æs discussion of access and deployment noted, over 90% of notable industry models were released
without training code in 2025. The Openness Index results suggest that pattern extends beyond code to
training data as well.

Openness index by components
Source: Articial Analysis, 2026  | Chart: 2026 AI Index report

e
r
o
c
S

18

16

14

12

10

8

6

4

2

0

Model availability

Transparency: methodology

Transparency: post-training data

Transparency: pre-training data

5

4

5

4

6

2

4

2

2

7

6

7

6

7

6

7

6

Claude 4.5 Haiku

Llama 4 Maverick
K-EXAONE

Kimi K2.5

Qwen3.5 397B A17B
Mistral Large 3

gpt-oss-120B (high)

gpt-oss-20B (high)

15

3

6

6

15

3

6

6

16

2

2

6

6

16

2

2

6

6

13

3

4

6

9

3

6

GLM-5

NVIDIA Nemotron 3 Super
NVIDIA Nemotron 3 Nano
NVIDIA Nemotron 9B V2

K2 Think
Olmo 3 32B Think

Figure 3.8.1

Foundation Model Transparency Index

The Foundation Model Transparency Index (FMTI) takes a different approach, scoring developers rather than
individual models. Now in its third year, it evaluates disclosure across three stages of the model lifecycle.
Upstream covers what goes into building a model, including training data, labor, and compute. Model covers

163

3.8  T R A N S PA R E N CY   |   R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

what is disclosed about the system itself, and Downstream covers what happens after release, including
monitoring and impact reporting.

In the 2025 edition, average transparency declined from 58 in 2024 to 40 (Figure 3.8.2). IBM leads at 95 and
Writer follows at 72. Others, such as xAI and Midjourney score just 14, whereas open model developers,
B2B enterprise providers, organizations publishing transparency reports, and EU AI Act signatories tend to
perform better. As with the Openness Index, the weakest area is Upstream, particularly around training data
and the resources used to build models (Figure 3.8.3).

Foundation Model Transparency Index Scores by Domain, 2025
Source: 2025 Foundation Model Transparency Index

Granite 3.3

Palmyra X5

Jamba 1.6

Claude 4

Gemini 2.5

Nova Premier

o3

DeepSeek-R1

Llama 4

Qwen 3

Medium 3

Midjourney V7

Grok 3

46

41

39

35

32

31

26

18

14

14

95

72

66

Upstream
Model
Downstream

0

10

20

30

40

50
Score

60

70

80

90

100

Figure 3.8.2

Foundation Model Transparency Index Scores by Major Dimensions of Transparency, 2025
Source: 2025 Foundation Model Transparency Index

y
c
n
e
r
a
p
s
n
a
r
T
f
o
s
n
o
i
s
n
e
m
D
r
o
a
M

j

i

Jamba 1.6

Qwen 3

Nova
Premier

Claude 4 DeepSeek-R1 Gemini 2.5 Granite 3.3

Llama 4

Midjourney
V7

Medium 3

Data Acquisition

92%

Data Properties

Compute

Model Information

0%

22%

75%

Model Access

50%

Capabilities

Risks

Model Mitigations

Release

Usage Data

Impact

Post-deployment Monitoring

75%

60%

60%

88%

20%

71%

71%

Model Behavior Policy

100%

Acceptable Use Policy

80%

Downstream Mitigations

100%

Average

64%

17%

20%

11%

75%

50%

50%

0%

0%

63%

0%

0%

0%

50%

60%

40%

29%

17%

0%

11%

0%

50%

50%

40%

60%

75%

20%

0%

57%

75%

80%

100%

42%

25%

0%

0%

25%

50%

25%

60%

80%

75%

60%

29%

57%

100%

100%

100%

52%

17%

20%

44%

75%

50%

50%

20%

20%

63%

0%

0%

0%

75%

60%

0%

33%

33%

0%

11%

0%

50%

25%

20%

40%

88%

0%

29%

43%

75%

80%

100%

40%

100%

100%

100%

100%

100%

75%

100%

80%

100%

80%

86%

100%

100%

80%

100%

93%

33%

20%

22%

75%

50%

50%

20%

0%

50%

0%

14%

29%

75%

40%

80%

37%

0%

0%

0%

0%

0%

0%

0%

0%

63%

20%

29%

0%

25%

60%

40%

16%

0%

0%

0%

0%

25%

25%

0%

20%

38%

0%

14%

43%

0%

60%

80%

20%

o3

8%

0%

0%

0%

0%

25%

60%

80%

63%

20%

14%

71%

75%

60%

100%

38%

Palmyra X5

Grok 3

Average

58%

40%

100%

75%

50%

50%

40%

40%

88%

100%

86%

86%

50%

80%

100%

69%

0%

0%

11%

0%

0%

25%

0%

0%

50%

0%

0%

0%

75%

60%

40%

17%

31%

15%

26%

38%

40%

40%

32%

37%

69%

25%

29%

43%

67%

69%

75%

Figure 3.8.317

17  Data, labor, compute, and methods were upstream indicators; model basics, access, capabilities, risks, and mitigations were model-level indica-
tors; and distribution, usage policy, feedback, and impact were downstream indicators.

164

3.9 Security and Safety

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Safety is the responsible AI dimension where institutional infrastructure has grown the fastest. New
evaluation frameworks, government-backed AI safety institutes, and standardized benchmarks have all
expanded in the past year. This section traces that growth and the resulting data on how well current models
handle safety in practice.

Global AI Safety Institutes

AI safety institutes (AISIs) are state-backed specialist organisations created to help governments understand
and manage risks from advanced AI, especially frontier/foundation models. They conduct technical evalua-
tions and safety research that governments can use to shape policy.

Fully operational institutes now exist in the UK (AI Security Institute), the U.S. (USAISI at NIST), Japan (JAISI),
Singapore (Digital Trust Centre), and Israel (AI Security Research Unit) (Figure 3.9.1). India and France have
also launched AISIs, with IndiaÆs AI Safety Institute and FranceÆs Current AI. A second wave is in development
in Canada, South Korea, Germany, and Brazil. Outside of these standalone institutes, participation is growing
through the International Network of AI Safety Institutes, with Kenya and Australia listed as network mem-
bers without formal institutes of their own.

The countries building these AISIs are still mostly wealthy, technologically advanced economies that are not
all pursuing the same goals. The UK and Israel emphasize security, while the EU AI Office pairs evaluation
with enforcement powers under the AI Act. Network membership is a practical entry point for countries
without the resources to stand up a full institute immediately.

AI safety institutes and network membership
Source: All Tech is Human, 2025 | Chart: 2026 AI Index report

Announced (in development)

Established (operational)

Network member (no formal institute)

NA

18  Data source: https://alltechishuman.org/all-tech-is-human-blog/the-global-landscape-of-ai-safety-institutes.

165

 Figure 3.8.318

3.9  S E C U R I T Y   A N D   S A F E T Y   |   R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Benchmarks

HELM Safety

HELM Safety, covered in last yearÆs report, continues to be one of the few standardized suites for evaluating
AI models across responsibility and safety metrics. It tests models from major developers across benchmarks
including BBQ (social bias), SimpleSafetyTests (self-harm and abuse risks), HarmBench (harassment and
misinformation), AnthropicRedTeam (adversarial conversations), and XSTest (helpfulness vs. harmlessness
trade-offs).

The 2025 results show continued improvement but also increasing compression at the top (Figure 3.9.2).
Most models released between 2024 and 2025 score between 0.90 and 0.98, with a very narrow gap
between the highest and lowest scorers. Older models from 2023 score lower, but the overall trajectory
suggests that leading models are converging on a safety ceiling where current benchmarks may not be fine-
grained enough to distinguish meaningful differences.

HELM Safety: mean score
Source: HELM, 2026 | Chart: 2026 AI Index report

e
r
o
c
s
n
a
e
M

1

0.8

0.6

0.4

0.2

0

0.84 0.850.860.860.880.900.92 0.930.93 0.950.950.980.98

0.84 0.85 0.87 0.890.900.90 0.91 0.91 0.91 0.93 0.930.940.95 0.960.960.97 0.970.970.980.98

0.98

0.850.87

0.77

0.73

0.63

i

n
F
a
r
y
m
a
P

l

)
3
1
6
0

(
o
b
r
u
T
5
.
3
-
T
P
G

)
B
7
6
(

t
a
h
C
M
L
L
k
e
e
S
p
e
e
D

t
c
u
r
t
s
n

I

X
R
B
D

)
B
7
(
3
.
0
v
t
c
u
r
t
s
n

I

l

a
r
t
s
i

M

d
e
M
a
r
y
m
a
P

l

l

s
u
P
R
d
n
a
m
m
o
C

)
B
2
2
╫
8
(

t
c
u
r
t
s
n

I

l

a
r
t
x
i
M

)
B
0
7
(
o
b
r
u
T
t
c
u
r
t
s
n

I

1
.
3
a
m
a
L

l

4
2
0
2
r
e
b
m
e
v
o
N

t
c
u
r
t
s
n

I

B
3
1
2
o
M
L
O

)
7
0
3
0
4
2
0
2
(
u
k
a
H
3
e
d
u
a
C

l

i

)
1
0
0

(
o
r
P
5
.
1

i

i

n
m
e
G

)
8
1
-
7
0
-
4
2
0
2
(

i

i

n
m
o
4
-
T
P
G

)
3
1
-
5
0
-
4
2
0
2
(
o
4
-
T
P
G

)
B
2
7
(
o
b
r
u
T
t
c
u
r
t
s
n

I
5
.
2
n
e
w
Q

)
B
5
0
4
(
o
b
r
u
T
t
c
u
r
t
s
n

I

1
.
3
a
m
a
L

l

)
9
0
7
0

(
4
k
o
r
G

3
v
k
e
e
S
p
e
e
D

8
2
5
0
-
1
R
-
k
e
e
S
p
e
e
D

)
1
0
5
2
(
3

l
l

a
m
S

l

a
r
t
s
i

M

)
7
1
-
2
1
-
4
2
0
2
(

1
o

)

0
2
6
0
4
2
0
2
(

t
e
n
n
o
S
5
.
3
e
d
u
a
C

l

8
P
F
-
r
i
A
-
5
.
4
-
M
L
G

5
2
0
2
h
c
r
a
M

t
c
u
r
t
s
n

I

B
2
3
2
o
M
L
O

l
l

.

a
m
S
0
4
e
t
i
n
a
r
G
M
B

I

8
P
F
t
c
u
r
t
s
n

I

)
E
8
2
1
x
B
7
1
(
k
c
i
r
e
v
a
M
4
a
m
a
L

l

)

w
e
i
v
e
r
p
5
2
-
3
0

(
o
r
P
5
.
2

i

i

n
m
e
G

5
X
a
r
y
m
a
P

l

)

w
e
i
v
e
r
P
(
o
r
P
3

i

i

n
m
e
G

2023

2024

2025

166

)
6
1
-
4
0
-
5
2
0
2
(
3
o

)
6
1
-
4
0
-
5
2
0
2
(

i

i

n
m
-
4
o

t
c
u
r
t
s
n

I
2
K

i

m
K

i

)
7
0
-
8
0
-
5
2
0
2
(
5
-
T
P
G

)
3
1
-
1
1
-
5
2
0
2
(

1
.
5
-
T
P
G

)
4
1
-
4
0
-
5
2
0
2
(

1
.
4
-
T
P
G

)

w
e
i
v
e
r
p
7
2
-
2
0
-
5
2
0
2
(
5
.
4
-
T
P
G

)
9
2
9
0
5
2
0
2
(

t
e
n
n
o
S
5
.
4
e
d
u
a
C

l

)
9
1
2
0
5
2
0
2
(

t
e
n
n
o
S
7
.
3
e
d
u
a
C

l

8
P
F
7
0
5
2
t
c
u
r
t
s
n

I

B
2
2
A
B
5
3
2
3
n
e
w
Q

Figure 3.9.2

3.9  S E C U R I T Y   A N D   S A F E T Y   |   R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

AILuminate

AILuminate v1.0 is a new benchmark designed to test how well AI systems resist prompts that could trigger
dangerous, illegal, or undesirable behavior. It covers 12 hazard categories, including violent crimes and child
exploitation, and employs a five-tier grading scale from ôPoorö to ôExcellent.ö The benchmark includes two
separate evaluations. The first tests safety under normal use, with models evaluating both with and without
external safety filters and moderation tools. The second tests a systemÆs ability to resist deliberate jailbreak
attempts through adversarial prompts.

Safety Benchmark Results

Among models tested with external guardrails in place, Claude 3.5 Haiku, Claude 3.5 Sonnet, and Mistral
Large all received ôvery goodö ratings, while their parent models received ôgoodö(Figure 3.9.3). In the set of
models that could be tested without external safety filters or moderation tools, Gemma 2 9b, Phi 3.5 MoE
Instruct, and Phi 4 scored ôvery goodö (Figure 3.9.4). The two groups are not directly comparable, as they
involve different models under different conditions, but both show a baseline safety performance of ôgoodö
across leading systems.

Source: MLCommons, 2025

Figure 3.9.3

167

3.9  S E C U R I T Y   A N D   S A F E T Y   |   R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Source: MLCommons, 2025

Figure 3.9.4

168

3.9  S E C U R I T Y   A N D   S A F E T Y   |   R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

Jailbreak T2T Benchmark v0.5 Results

The AILuminate Jailbreak T2T benchmark v0.5 tests what happens when users deliberately try to bypass a
modelÆs safety measures through adversarial prompts. Each model in the chart receives two scores (Figure
3.9.5). The square at the top represents the modelÆs safety score under normal conditions, while the circle
below it represents the score after being exposed to jailbreak attempts. As this is a beta version of the
benchmark, models are de-identified by number, rather than named.

Under normal conditions, most models score in the ôvery goodö or ôgoodö range. After jailbreak attempts,
nearly every systemÆs score drops, some by a full tier or more. So while safety under normal use is generally
good, it degrades under deliberate manipulation.

Figure 3.9.5

169

3  R E S P O N S I B L E   A I   |   A I   I N D E X   R E P O R T  2 026

3.10 Tradeoffs Across
RAI Dimensions

In practice, AI systems must satisfy multiple responsible AI dimensions at once. A growing number of
empirical research studies suggest that these dimensions do not improve independently, as optimizing for
one can degrade others. The direction and magnitude of those trade-offs depends on the method used, data
involved, and under what context it is deployed.

Kemmerzell and Schreiner (2024) tested this directly by training image classification models on four facial
analysis data sets and measuring what happened to fairness, privacy, explainability, and robustness when
each dimension was targeted in isolation. Differential privacy, a technique that adds noise during training
to prevent individual data points from being identified, improved privacy scores across all datasets but
reduced explainability, fairness, and accuracy, with accuracy falling by up to 33 percentage points on
some configurations. Training adaptations aimed at improving fairness only succeeded on the dataset
with the most demographic imbalance, and therefore the most room to correct. But across all, it reduced
explainability and robustness. Data augmentation methods designed to improve robustness by exposing
datasets to more varied training images produced the fewest negative side effects across the same
experiments. It also improved explainability and accuracy, with only minor reductions in privacy and fairness.
There was not a single intervention method that proved to improve all four dimensions at once.

A separate evaluation of large language models found a similar pattern at the model level. Cecchini et al.
(2024) scored 11 models across robustness, accuracy, and toxicity using the LangTest evaluation toolkit. GPT-
4 led on robustness (average score of 0.91 out of 1.0) and accuracy (0.67), but Llama 2 7B scored highest on
toxicity avoidance (0.98), meaning it was the most likely to refuse toxic prompts. Models that performed well
on robustness, such as Mistral 7B and Mixtral 8x7B, scored among the lowest on toxicity avoidance (0.39 and
0.42, respectively). The ranking of models shifted depending on which dimension was being measured, and
no single model was a clear leader in all three.

These trade-offs also appear in federated learning, a training approach where multiple institutions train a
shared model by exchanging model updates rather than the underlying data. Wasif et al. (2025) studied
how privacy-preserving techniques interact with fairness in this setting across four datasets, including
AlzheimerÆs disease MRI scans and credit card fraud records. Differential privacy did not affect all datasets
equally. Institutions with larger datasets could absorb the added noise, while smaller institutions saw their
contributions to model training degraded. In the AlzheimerÆs scenario, adding stronger privacy protections
reduced the modelÆs ability to correctly identify the disease, with accuracy falling by 14.8 percentage points.
The effect was worse for hospitals with less data, where missed diagnoses rose by 21.4%. Two alternative
privacy methods that use encryption instead of noise kept fairness more stable but required two to three
times more computing power.

The studies covered above are recent and focus on specific tasks rather than general-purpose AI systems.
Their findings point in the same direction though: Improving one responsible AI dimension tends to come at
the expense of another. There is no shared framework that measures or compares these trade-offs, which is
another measurement gap in the RAI space, and makes it difficult to track whether the field is getting better
at managing them.

170
