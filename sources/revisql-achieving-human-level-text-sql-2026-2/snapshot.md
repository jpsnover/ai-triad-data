<!--
  AI Triad Research Project — Document Snapshot
  Title      : ReViSQL: Achieving Human-Level Text-to-SQL
  Source     : 
  Type       : pdf
  Captured   : 2026-04-11
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# ReViSQL: Achieving Human-Level Text-to-SQL

> **Snapshot captured:** 2026-04-11
> **Source:** 
> **Type:** pdf

---
ReViSQL: Achieving Human-Level Text-to-SQL

Yuxuan Zhu
UIUC
yxx404@illinois.edu

Yoojin Choi
UIUC
yoojinc3@illinois.edu

Tengjun Jin
UIUC
tengjun2@illinois.edu

Daniel Kang
UIUC
ddkang@illinois.edu

6
2
0
2

r
a

M
0
3

]

B
D
.
s
c
[

2
v
4
0
0
0
2
.
3
0
6
2
:
v
i
X
r
a

ABSTRACT

Translating natural language to SQL (Text-to-SQL) is a critical chal-
lenge in both database research and data analytics applications.
Recent efforts have focused on enhancing SQL reasoning by devel-
oping large language models (LLMs) and AI agents that decompose
Text-to-SQL tasks into manually designed, step-by-step pipelines.
However, despite these extensive architectural engineering efforts,
a significant gap remains: even state-of-the-art (SOTA) AI agents
have not yet achieved the human-level accuracy on the BIRD bench-
mark. In this paper, we show that closing this gap does not require
further architectural complexity, but rather clean training data to
improve SQL reasoning of the underlying models.

We introduce ReViSQL, a streamlined framework that achieves
human-level accuracy on BIRD for the first time. Instead of com-
plex AI agents, ReViSQL leverages reinforcement learning with
verifiable rewards (RLVR) on BIRD-Verified, a dataset we curated
comprising 2.5k verified Text-to-SQL instances based on the BIRD
Train set. To construct BIRD-Verified, we design a data correction
and verification workflow involving SQL experts. We identified
and corrected data errors in 61.1% of a subset of BIRD Train. By
training on BIRD-Verified, we show that improving data quality
alone boosts the single-generation accuracy by 8.2û13.9% under the
same RLVR algorithm. To further enhance performance, ReViSQL
performs inference-time scaling via execution-based reconciliation
and majority voting. Empirically, we demonstrate the superior-
ity of our framework with two model scales: ReViSQL-235B-A22B
and ReViSQL-30B-A3B. On an expert-verified BIRD Mini-Dev set,
ReViSQL-235B-A22B achieves 93.2% execution accuracy, exceeding
the proxy human-level accuracy (92.96%) and outperforming the
prior open-source SOTA method by 9.8%. Our lightweight ReViSQL-
30B-A3B matches the prior SOTA at a 7.5╫ lower per-query cost.

Reference Format:

Yuxuan Zhu, Tengjun Jin, Yoojin Choi, and Daniel Kang. ReViSQL: Achiev-
ing Human-Level Text-to-SQL. arXiv:2603.20004 (2026).

Artifact Availability:

The source code, data, and/or other artifacts have been made available at
https://github.com/uiuc-kang-lab/ReViSQL.

1 INTRODUCTION

Translating natural language questions into SQL queries (Text-to-
SQL) enables non-technical users to query relational databases,
serving as the critical foundation for numerous industrial data an-
alytics applications [1, 3, 22, 38]. While the increasingly strong

Figure 1: ReViSQL achieves human-level accuracy on an
expert-verified BIRD Mini-Dev set constructed by prior work
[4, 18]. Compared to the SOTA open-source agent on the
BIRD leaderboard [25], ReViSQL-235B-A22B achieves up to
9.8% higher accuracy. ReViSQL-30B-A3B matches the perfor-
mance of the SOTA agent with 7.5╫ lower costs. ReViSQL
dominates existing methods at all cost levels.

coding and reasoning capabilities [16, 45] of large language mod-
els (LLMs) have driven rapid advances in Text-to-SQL [9, 12, 14,
20, 21, 23, 24, 28, 30, 32, 35, 36, 41, 42, 44, 46, 57, 61, 63], a critical
gap persists between automated systems and human experts. The
state-of-the-art (SOTA) methods still underperform human data
engineers by a significant 11% margin on the widely used BIRD
benchmark [25, 47]. Closing this gap represents a critical milestone
in Text-to-SQL development, elevating LLMs from capable assis-
tants to reliable, autonomous systems [8].

To bridge this gap, the research community has focused on build-
ing increasingly complex AI agents [28, 32, 41, 57]. Since generic
LLMs currently lack the reasoning capabilities required to navigate
complex databases, these systems attempt to compensate by de-
composing the Text-to-SQL task into multi-stage pipeline designs
(e.g., divide-and-conquer query decomposition [32] and iterative
execution-guided refinement [57]). These heavy pipelines often
suffer from cascading failure modes, where minor semantic mis-
understandings or schema-linking mistakes in early steps corrupt
subsequent SQL generation [6, 57].

More importantly, we argue that this focus on architectural en-
gineering addresses the wrong bottleneck. The fundamental limita-
tion of current Text-to-SQL systems is not a lack of architectural
complexity, but the limited SQL reasoning capabilities of the under-
lying models. To improve LLM reasoning capabilities, prior work

has proposed to use reinforcement learning with verifiable rewards
(RLVR) [29, 40]. However, existing Text-to-SQL datasets contain
pervasive (> 50%) annotation errors [18]. When models attempt to
learn from noisy data, these pervasive errors generate spurious re-
ward signals, severely destabilizing the learning process [13, 39, 56].
In this paper, we introduce ReViSQL, a streamlined framework
that achieves human-level performance (>93%) on BIRD without
complex pipelines. Instead of relying on complex AI agents, Re-
ViSQL directly improves the reasoning capabilities of the under-
lying model. It consists of three foundational pillars: rigorously
verified training data, RLVR to improve reasoning, and inference-
time scaling to boost performance.

To unlock the true potential of RLVR, we constructed a verified
dataset, BIRD-Verified, by correcting 2.5k Text-to-SQL instances
drawn from the BIRD Train set. Through a multi-turn verification
pipeline involving 2û4 independent manual correction rounds by
SQL experts, we identified and corrected annotation errors across
52.1% of SQL queries, 26.2% of natural language questions, and 18.2%
of external knowledge. By training on this verified data, RLVR incen-
tivizes LLMs to autonomously discover effective reasoning paths
and achieve up to 13.9% higher greedy-decoding accuracy than
training on the original BIRD Train set with the same algorithm.

Finally, while RLVR fundamentally improves the intrinsic reason-
ing capabilities of the LLM, real-world natural language questions
contain unavoidable ambiguity and distribution shifts. To reconcile
the modelÆs internalized knowledge with external inference-time
data, ReViSQL applies a robust scaling mechanism based on recon-
ciliation and majority voting. For each query, the model generates
multiple candidate SQL queries in parallel. We then leverage the
base model (pre-RLVR) to filter these candidates against explicit
question constraints and use majority voting to select the most
accurate and consistent SQL query candidate.
ReViSQL achieves human-level performance. We demonstrate
the superiority of our framework by instantiating it at two model
scales: ReViSQL-235B-A22B and ReViSQL-30B-A3B. We evaluate
both models on two expert-verified benchmarks based on BIRD
Mini-Dev: Arcwise-Plat-Full and Arcwise-Plat-SQL [18]. On Arcwise-
Plat-Full, where errors in questions, external knowledge, and SQL
queries are fixed, ReViSQL-235B-A22B achieves an execution ac-
curacy of 93.78%. On Arcwise-Plat-SQL, where only SQL queries
are fixed and factual errors in questions and external knowledge
are intentionally kept, ReViSQL-235B-A22B achieves an execution
accuracy of 93.17%. On both benchmarks, ReViSQL-235B-A22B
consistently exceeds the proxy human-level performance (92.96%)
measured by BIRD [25].
ReViSQL establishes a new Pareto frontier. As shown in Figure
1, ReViSQL delivers superior accuracy across all inference budgets.
Compared to the SOTA open-source AI agent on the BIRD Leader-
board, ReViSQL-235B-A22B achieves 5.6û9.8% higher execution
accuracy (Section 6.2). Compared to prior open-source Text-to-
SQL models (e.g., OmniSQL-32B [23]) and proprietary reasoning
LLMs (e.g., GPT-5.2 [45]), ReViSQL achieves 11.3û15.6% higher ac-
curacy (Section 6.3). In addition, our lightweight ReViSQL-30B-A3B
matches the peak accuracy of the prior SOTA open-source agent
while operating at a 7.5╫ lower per-query cost.

ReViSQL generalizes to Spider 2. We demonstrate the gener-
alizability of ReViSQL by evaluating it on Spider 2 benchmarks.
On Spider 2-SQLite, ReViSQL-235B-A22B achieves an execution
accuracy of 46.7% and outperforms the evaluated strongest BIRD
agent by 11.9%. Furthermore, on Spider 2-Snow, ReViSQL achieves
an execution accuracy of 55.6%, outperforming all open-source
methods with open-weight models on the leaderboard.

We summarize our contributions as follows:

(1) Simple recipe for human parity. We propose ReViSQL, a
novel method to achieve human-level performance on BIRD,
consisting of RLVR on verified data and inference-time scaling.
(2) Verified RLVR dataset. We construct a verified dataset with
2,462 high-quality Text-to-SQL instances, which significantly
boosts the effectiveness of RLVR by 8.2û13.9% compared to the
original BIRD Train set.

(3) SOTA and generalizable Text-to-SQL performance. We
release two instantiations of our framework: ReViSQL-235B-
A22B and ReViSQL-30B-A3B, establishing a new Pareto frontier
of Text-to-SQL. On BIRD, ReViSQL-235B-A22B outperforms
the prior SOTA by 9.8%, while ReViSQL-30B-A3B matches the
prior SOTA at a 7.5╫ lower per-query cost. This generalization
extends to Spider 2, where ReViSQL-235B-A22B outperforms
all BIRD agents on Spider 2-SQLite and outperforms all prior
open-source, open-weight methods on Spider 2-Snow.

2 RELATED WORK

In this section, we review the landscape of existing Text-to-SQL
methods (Section 2.1) and examine the critical limitations of current
Text-to-SQL datasets (Section 2.2).

2.1 Text-to-SQL Methods

We categorize prior work into three distinct paradigms: AI agents,
training with massive synthetic data, and RLVR.
Multi-stage Text-to-SQL agents. Advancements in Text-to-SQL,
particularly on challenging benchmarks like BIRD [25] and Spider
2 [19], have been heavily driven by the development of complex,
multi-stage AI agents [12, 21, 24, 28, 32, 36, 41, 42, 44, 46, 57, 61]. As
shown in Table 1, the majority of top-ranking methods developed
hand-engineered auxiliary modules in addition to SQL generation
during inference.

Prompt augmentation and schema linking are heavily used by
existing frameworks to improve the capabilities of LLMs to nav-
igate massive databases. Systems such as AskData [44], SHARE
[36], OpenSearch-SQL [61], and Distillery [30] design these mod-
ules to semantically match natural language questions to database
elements, rewrite questions, perform reasoning on data, and inject
dynamic few-shot examples into the prompt. This process effec-
tively narrows the search space for the LLM, which in turn improves
the generation accuracy.

Furthermore, since general-purpose LLMs often fail to produce
executable or logically sound SQL queries on the first attempt, many
agents use iterative refinement loops. For example, JoyDataAgent-
SQL [5], Agentar-Scale-SQL [57], and CHASE-SQL [32] execute

2

Table 1: Comparison of architectural complexity among top-30 BIRD Leaderboard methods that have disclosed technical details.
While heavily engineered, multi-stage pipelines dominate top-ranking Text-to-SQL methods, ReViSQL outperforms the prior
SOTA open-source methods without requiring additional modules, and reaches human-level performance with an additional
candidate selection process.

Orchestration

?

Method

Open-source

JoyDataAgent-SQL [5]
Agentar-Scale-SQL [57]
SHARE [36]
OpenSearch-SQL v2 [61]
Distillery [30]
CHASE-SQL [32]
Reasoning-SQL [35]
AskData [44]
GenaSQL [12]
XiYan-SQL [28]
CSC-SQL [41]
Contextual-SQL [2]
OmniSQL [23]
ReViSQL (ours)

╫
╫
?
?
╫
╫
╫
╫
?
╫
?
?
?
?

Multi-Stage Architectural Complexity (Less is better)

Prompt

augmentation

Schema linking

Candidate
generation

Refinement

Merging &
selection

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

?

?
?

?
?
?
?

?(optional)

initial queries against the target database or an evaluator, subse-
quently feeding the execution errors back to the LLM to iteratively
debug and correct the query.

To further boost inference-time performance, many approaches
incorporate post-generation merging and selection mechanisms.
Methods such as GenaSQL [12], XiYan-SQL [28], and CSC-SQL
[41] generate multiple diverse SQL candidates and use secondary
reward models to score, filter, or vote on the final output. Finally, to
manage these disparate components, JoyDataAgent-SQL [5] applies
LLMs to handle complex multi-agent planning and routing.

While each of these modules provides distinct utility in patching
specific deficits of LLMs, their composition introduces computa-
tional overhead (as shown in Figure 1) and cascading error prop-
agation [6, 57]. Ultimately, these pipelines remain fundamentally
bottlenecked by the underlying modelÆs limited SQL reasoning capa-
bilities. This systemic fragility makes heavily engineered pipelines
suboptimal for reliable, cost-sensitive enterprise deployment [43].
In contrast, ReViSQL directly improves the intrinsic SQL reasoning
capabilities of the LLM. By enabling the model to autonomously per-
form schema exploration, logic testing, and self-correction tailored
to each specific Text-to-SQL problem, ReViSQL achieves superior
efficiency and accuracy without external pipeline complexity.
Training on synthetic data. In parallel to building AI agents,
prior work has also explored the data-centric paradigm, develop-
ing large-scale synthetic Text-to-SQL data for training [23, 34, 59].
SynSQL-2.5M [23] developed a pipeline to generate 2.5 million syn-
thetic Text-to-SQL instances, aiming to cover every conceivable
SQL pattern. SQL-GEN [34] addresses the specific challenge of di-
alect adaptation, covering common dialects including PostgreSQL,
BigQuery, and SQLite. SQaLe [59] takes a different angle, focusing
on schema realism. It generates queries based on 135,875 real-world
schemas, exposing models to ômessyö production databases (e.g.,
thousands of tables, obscure column names).

While synthetic data improves robustness, it fails to address
the inherent gap between human data and synthetic logic. These
datasets typically generate natural language questions with clear,

unambiguous logic, which does not reflect real-world ambiguity.
Our research suggests that rigorous curation is more important
than massive creation.
RLVR for Text-to-SQL. Existing research has explored reinforce-
ment learning with verifiable rewards in Text-to-SQL tasks [29, 31,
35, 51, 62]. For example, Databricks [10] shows that applying RLVR
to Qwen-2.5-32B allows it to outperform proprietary models like
GPT-4o, achieving 75.7% on BIRD. SQL-R1 [62] applies the synthetic
SynSQL-2.5M on RLVR training, achieving an execution accuracy
of 66.6% on BIRD, which is 9.1% lower than DatabrickÆs model. This
further indicates the importance of human data for RLVR.

2.2 Noise in Text-to-SQL Datasets

Pervasive annotation errors hinder the rigorous evaluation and
training of Text-to-SQL models. In BIRD [25] and Spider 2 [19], two
widely used datasets, recent audits have uncovered errors in up to
52% of questions, SQL queries, and external knowledge across both
evaluation and training sets [4, 18, 27, 33, 60], causing concerns in
both the development and evaluation of Text-to-SQL methods.
Errors in evaluation sets. The annotation errors in the BIRD
Dev set have been heavily investigated. Jin et al. [18] identified
annotation errors in 52.8% of instances. Similarly, Wretblad et al.
[60] analyzed the financial domain subset, finding that ambiguous
questions and incorrect gold SQL queries introduced noise into
15û49% of data points per database. While Liu et al. [27] proposed
labeling these errors to test error-detection capabilities, they did not
correct them. To address this, Arcwise [4] and subsequently Jin et al.
[18] released verified variants of the BIRD Mini-Dev set: Arcwise-
Plat-Full and Arcwise-Plat-SQL. As shown in Table 2, Arcwise-
Plat-Full fixes factual errors in questions, external knowledge, and
SQL queries, while Arcwise-Plat-SQL only corrects SQL queries,
deliberately leaving questions and external knowledge unchanged
for additional ambiguity and difficulty.
Errors in training sets. While evaluation sets are being cleaned,
the BIRD Train set remains largely unverified. Pourreza and Rafiei

3

Table 2: Correction statistics of two expert-verified datasets
based on BIRD mini-Dev.

Correction

Arcwise-Plat-Full Arcwise-Plat-SQL

SQL query
Question
External knowledge

132 (26.5%)
88 (17.7%)
97 (19.4%)

80 (16.1%)
0
0

[33] partially categorized errors in the training set into three types:
sorting failures (ties in ORDER BY), schema matching ambiguity, and
incorrect content assumptions. They detected errors in 18.2% of a
subset of problems, which likely underestimates the true noise level.
To date, there are no large-scale, publicly available corrections for
the BIRD Train set. This lack of clean training data represents a
fundamental barrier to training models via reinforcement learning.

3 OVERVIEW

ReViSQL represents a fundamental paradigm shift in Text-to-SQL
translation: moving from agentic orchestration toward internalized
SQL reasoning. Prior work attempts to compensate for the defi-
cient SQL reasoning of existing LLMs using multi-stage pipelines
(e.g., dynamic few-shot prompting [61], schema linking [11, 12, 17,
28, 44, 46, 57, 58, 61], self-correction [11, 28, 32, 46, 57, 61], and
multi-agent orchestration [5, 55]). In contrast, ReViSQL is an end-
to-end framework that enables large language models (LLMs) to
autonomously develop these capabilities. As illustrated in Figure 2,
our framework achieves human parity through three procedures:
expert data curation, RLVR training, and inference-time scaling.

High-quality, verified training data serves as the foundation of
ReViSQL. We found that pervasive annotation errors in training sets
systematically bias LLMs. For instance, the frequent omission of the
DISTINCT keyword in COUNT aggregations within the BIRD Train
set actively biases models against using it, which accounts for 23% of
failure cases during testing. To fix these pervasive annotation errors,
we designed and implemented a rigorous data correction pipeline
involving independent SQL experts for correction, verification, and
conflict resolution. As a result, we constructed BIRD-Verified, a
dataset of 2,462 verified instances ready for finetuning.1

Leveraging this verified dataset, we use RLVR to enhance the
intrinsic SQL reasoning capabilities of LLMs. Rather than relying
on rigid, human-engineered system designs, RLVR incentivizes the
model to autonomously discover and adapt to optimal reasoning
paths by rewarding reasoning chains that yield the correct execu-
tion results. We finetuned two Text-to-SQL models: a human-level
ReViSQL-235B-A22B and a cost-efficient ReViSQL-30B-A3B.2

Finally, while RLVR improves the modelÆs intrinsic reasoning,
real-world deployment inevitably introduces natural language am-
biguity and distribution shifts. To maintain human-level accuracy
under these conditions, we use a robust inference-time scaling
mechanism. We sample multiple candidate queries and leverage
a pre-RLVR base model to reconcile the interpretations learned
during training with the explicit constraints in the test data. This

rigorous filtering process effectively eliminates candidates that de-
viate from the true intent of the user, ensuring high test accuracy.
Next, we discuss the design and implementation details of BIRD-

Verified and ReViSQL in Sections 4 and 5, respectively.

4 BIRD-VERIFIED: A VERIFIED DATASET FOR

TEXT-TO-SQL RLVR

In this section, we introduce BIRD-Verified, our verified dataset
designed to improve RLVR training for Text-to-SQL. We first de-
scribe our rigorous construction methodology (Section 4.1) and
then present descriptive statistics demonstrating the quality and
complexity of BIRD-Verified (Section 4.2).

4.1 Data Curation

The primary objective of our data curation is to reduce annotation
errors that could generate spurious reward signals during RLVR
training. Specifically, we target four distinct categories of errors
[18] that compromise the quality of the learning signal:

(1) Internal inconsistency: Conflicts exist between the information
specified in the database schema, the natural language question,
and the external knowledge. Such inconsistencies mislead the
model to arbitrarily prioritize one source over another, result-
ing in SQL queries that are partially correct but semantically
divergent from the ground truth.

(2) Ambiguity: The question and external knowledge are under-
specified, allowing multiple valid interpretations. This ambigu-
ity creates a one-to-many mapping where a model may generate
a valid SQL query according to one of the reasonable interpre-
tations, yet receive a negative reward because it does not match
the specific interpretation arbitrarily chosen by the annotator.
(3) Incorrect gold SQL: The annotated gold SQL is factually wrong.
This introduces a dual failure mode. The model might make
the same mistake as the annotator and receive a false positive
reward, or it may generate a truly correct SQL and receive a
false negative reward.

(4) Domain knowledge violation: The problem formulation or the
solution violates common sense or domain-specific logic of
the underlying data. In this case, a model that generates a
domain-consistent SQL receives a false negative reward, while
a model fitting the flawed logic receives a false positive reward,
encouraging memorization of incorrect knowledge.

To address these issues, we designed a data curation pipeline
that prioritizes high-precision correction, minimizing subjective
changes and the introduction of new errors.
Initialization. We first sampled 2,500 data instances from the orig-
inal BIRD Train data. Then, we applied an AI agent reviewer [18]
to flag potential annotation errors for each sampled data instance
as hints to SQL experts during manual correction and verification.3
The LLM reviewer marks the error type and summarizes its ratio-
nale for each identified error, providing important context (e.g.,
basic SQL understanding, common sense, and domain knowledge)
and serving as a starting point for human experts to accelerate the
subsequent correction and verification stage.

1https://github.com/uiuc-kang-lab/ReViSQL/tree/main/data
2https://github.com/uiuc-kang-lab/ReViSQL/tree/main/models

3We used OpenAIÆs o3 model and allowed the agent to issue at most 30 intermediate
SQL queries before giving the final judgement.

4

Figure 2: The end-to-end ReViSQL framework. ReViSQL achieves human parity Text-to-SQL through three core steps: (a)
Training data curation: A rigorous, expert-driven correction and verification pipeline that convert noisy training data into the
BIRD-Verified dataset. (b) RLVR training: An open-source LLM generates multiple reasoning rollouts and receives rewards based
on execution correctness against the verified gold SQL query, effectively internalizing reasoning capabilities. (c) Inference-time
scaling: At inference, the finetuned LLM generates multiple candidate queries which are grouped by execution result, reconciled
against the userÆs explicit intent using a pre-RLVR base model, and finalized via majority voting.

Correcting questions and external knowledge. For each in-
stance, a SQL expert investigates mismatches among the question,
external knowledge, and database schema. Based on the context
provided by the LLM reviewer, the expert verifies whether the ques-
tion and external knowledge conflict with each other, violate the
domain knowledge, or allow multiple interpretations. We show an
example of conflicting question and external knowledge.

Question: How many directors have directed at least 10 movies between 1960 to
1985? Indicate ...
Original External Knowledge: directed at
count(direct_name)>10; ...
Corrected External Knowledge: directed at least 10 movies refers to
count(direct_name)>=10; ...

least 10 movies refers to

Next, they check whether the question can be interpreted in
different ways or whether the desired output format is specified.
Finally, we require the gold answer to be non-empty. Otherwise,
the SQL expert adjusts the constraints in the question and exter-
nal knowledge, facilitating meaningful execution-based evaluation.
In cases where a question is not answerable given the provided
data and schema, we discard the instance. For example, we discard
the question ôHow many suppliers are there in the United States
of America?ö since there is no information about the location or
nationality of suppliers in the given database.
Correcting SQL queries. SQL experts correct both explicit and
implicit errors in annotated gold SQL queries. For explicit errors, a
SQL expert checks whether the gold SQL covers all the constraints
and logic specified in the question, external knowledge, and data
schema comprehensively. Furthermore, SQL experts identify and
correct three major categories of implicit errors:

(1) Failing to address missing data. Missing data is common in
practice and is often marked by NULL values or another indicator

5

column. While performing aggregation such as computing an
average, the gold SQL query must use additional predicates to
remove missing data. In the following example, missing values
in the weight and height must be removed before aggregation.

Question: What are the basketball playersÆ BMI ranges?
Original SQL:

SELECT

MIN ( weight * 1.0 / ( height * height ) * 703) ,
MAX ( weight * 1.0 / ( height * height ) * 703) ,

FROM players

Corrected SQL:

SELECT ...
FROM players
WHERE weight IS NOT NULL AND weight > 0

AND height IS NOT NULL AND height > 0;

(2) Failing to consider ties. For questions involving ranking, the SQL
queries must handle ties in the data. In the following example,
LIMIT 1 is not sufficient to find the cheapest car since there
might be multiple cars with the same cheapest price.

Question: Which car is the cheapest? Provide its ...
Original SQL:

SELECT ... FROM data AS T1
INNER JOIN production AS T2 ON T1 . ID = T2 . ID
INNER JOIN price AS T3 ON T3 . ID = T2 . ID
ORDER BY T3 . price ASC LIMIT 1
Corrected SQL:

WITH cheapest AS (

SELECT MIN ( price ) AS min_p FROM price

) SELECT ... FROM data AS T1
INNER JOIN production AS T2 ON T1 . ID = T2 . ID

Table 3: Structural complexity comparison between the original BIRD Train and BIRD-Verified. Values for the datasets denote
the average count of each structural component per query. We find that gold SQL queries exhibit a significant increase in
complexity across various structural metrics, demonstrating that the original dataset systematically oversimplified queries.

Per-query stats

# tables

# joins

# functions

# aggregations

# set operations

# subqueries

# CTEs

# window func.

BIRD Train
BIRD-Verified
Difference

2.08
2.36
+12.0%

1.02
1.06
+2.8%

1.67
2.10
+10.4%

0.62
0.80
+21.9%

0.0024
0.024
+89.9%

0.088
0.26
+66.8%

0.0
0.11
+100.0%

0.0012
0.0012
+2.0%

(a) LLM reviewer demonstrates high precision
but critically low recall.

(b) Iterative expert correction and verification
required up to four rounds.

(c) Pervasive annotation errors. Over 52% of
original gold SQL queries are incorrect.

Figure 3: Quantitative analysis of the BIRD-Verified expert curation process. Relying solely on automated LLMs for data
correction is insufficient due to poor recall (Fig. 3a). Consequently, ReViSQL uses an expert verification pipeline that requires
up to four iterative rounds to fully resolve errors (Fig. 3b). We identified and corrected errors across 52.1% of SQL queries, 26.2%
of natural language questions, and 18.2% of external knowledge contexts (Fig. 3c).

INNER JOIN price AS T3 ON T3 . ID = T2 . ID
INNER JOIN cheapest AS T4 ON T3 . price = T4 . min_p

(3) Failing to deduplicate results. Duplicated data can not only nat-
urally exist in real-world databases but also be generated by
intermediate SQL operations such as joins. While performing
aggregation (e.g., counting entities), the gold SQL must remove
duplicates. In the following example, using DISTINCT in COUNT
is required since a student may register for multiple 3-credit
courses and appear in multiple registration records.

Question: Of courses with 3 credit, how many students have GPA of 3.2?
Original SQL:

SELECT COUNT ( T1 . student_id ) FROM student AS T1
INNER JOIN registration AS T2 ON T1 . student_id =

T2 . student_id

INNER JOIN course AS T3 ON T2 . course_id =

T3 . course_id

WHERE T3 . credit = 3 AND T1 . gpa = 3.2
Corrected SQL:

SELECT COUNT ( DISTINCT T1 . student_id )
FROM student AS T1 INNER JOIN ...

Annotating grading methods. We find the standard set-based
grading method used in BIRD is insufficient to evaluate the correct-
ness of a candidate SQL query in complex scenarios. In addition to
set-based grading, SQL experts annotate instances with the follow-
ing alternative grading methods:

(1) Subset-based: We check whether the result set of a candidate
SQL query is a subset of that of the gold SQL query and satisfies

6

the size requirement. Subset-based grading is used on Top-k
questions, such as ôPlease list the titles of any two papers that
Jundu has written.ö

(2) List-based: We check whether the result table of a candidate SQL
query has the same values as the result table of the gold SQL
query at the same table cell position. List-based grading is used
on questions requiring listing records in a specific order, such
as ôList the product ID of the top five products, by descending
order, the number of quantities ordered.ö

Verification. After a SQL expert finishes correcting data and an-
notating grading methods, another SQL expert then independently
verifies the corrected data instance. First, without directly reading
the correction result, they correct the data instance on their own
and run an LLM reviewer on the corrected data instance in parallel.
Then, they compare the proposed correction, their own correc-
tion, and the LLM reviewer response to determine whether the
proposed correction is valid. When they identify a conflict between
the proposed correction and their own correction, or when the LLM
reviewer points out genuine errors in the proposed correction, they
mark the corrected data instance as failed, leave a verification note,
and return the data instance back to the correction stage.
Conflict Resolution. When a proposed correction fails to pass
verification, a SQL expert normally agrees on the verification failure
reason and performs another round of correction. In cases where a
SQL expert disagrees with the verification result, we proceed to the
stage of conflict resolution. In this stage, we form a group of three
SQL experts and vote on whether the original proposed correction

is correct or the verification result is reasonable. This group of SQL
experts will finalize a correction result for this data instance.

4.2 Statistics

We then describe the summary statistics for our data curation pro-
cess and our dataset BIRD-Verified.
Construction process. In Figure 3, we highlight the effectiveness
of LLM hinting, the necessity of the involvement of SQL experts,
and the importance of multi-round correction and verification. As
shown in Figure 3a, the LLM reviewer agent achieves a high preci-
sion of 90.6% in terms of detecting annotation errors, indicating that
the errors identified by the LLM reviewer are highly reliable. How-
ever, the LLM reviewer leads to a low recall of only 24.5%, missing
a significant number of errors, which emphasizes the importance
of expert involvement in data correction.

As shown in Figure 3b, we find that 16.2% of the first-round
proposed corrections fail to pass the subsequent verification, indi-
cating the necessity of multi-round correction and verification. In
this process, we encountered five cases (0.2%) where conflicts oc-
curred between correction and verification, which were all resolved
during the final verdict. Eventually, all the proposed corrections
passed verification after up to four rounds.
Dataset characteristics. In Figure 3c and Table 3, we summa-
rize the statistics of our correction and a comparison between the
original BIRD Train and our BIRD-Verified. As shown in Figure
3c, our process corrected gold SQL queries in 52.1% of instances,
natural language questions in 26.2%, and external knowledge in
18.2%. Additionally, we discarded 1.5% of instances whose questions
are unanswerable given the database schema. In total, 61.1% of the
evaluated instances contained at least one type of annotation error.
As shown in Table 3, corrected gold SQL queries exhibit greater
structural complexity, reflecting a more rigorous adherence to do-
main constraints. We measured the average number of tables, joins,
functions, aggregations, set operations, subqueries, common table
expressions (CTEs), and window functions per query. We find our
corrected SQL queries have higher average counts in all categories.

5 THE REVISQL FRAMEWORK

In this section, we introduce ReViSQL, a Text-to-SQL system that
achieves human-level accuracy on BIRD. We describe our train-
ing method (Section 5.1) and introduce our inference-time scaling
framework (Section 5.2).

5.1 Training with Verified Data

We fine-tune our model using our BIRD-Verified dataset and the
SOTA RLVR algorithm.
Prompt. Our input prompt comprises three components: a system
prompt, a one-shot prompt, and the database schema. For all Text-
to-SQL problems, we use a universal system prompt and one-shot
prompt. The one-shot prompt is a simple demonstration of using
the provided SQL tool to execute queries. By default, we include the
full database schema in data definition language. For each column,
we add the column description provided by BIRD or three value
examples when column descriptions are not available.

Rollout. At each training step, the model performs multiple roll-
outs to generate multiple SQL queries. Within a rollout, the model
can issue intermediate SQL queries using the provided SQL tool
to explore data, test queries, and refine answers. We configure a
maximum number of turns that the model can issue during a rollout.
To aid the modelÆs planning, we explicitly append a turn counter
to the environmentÆs response after each intermediate execution.
Reward. We determine the reward ?(?, ?) of a rollout ? based on
the comparison between the generated SQL and the gold SQL ?.
When the generated SQL query achieves an equivalent answer
to the gold SQL query under the specific grading method of the
question, we assign a reward of 1. When the generated SQL query
fails to compile or leads to a different answer than the gold SQL
query, we assign a reward of 0. When the model fails to produce a
final SQL query, we assign a reward of -1.
Optimization objective. We use CISPO [7], a SOTA objective
function of RLVR algorithms that stabilizes training and improves
efficiency. Specifically, in each iteration, for a question-answer pair
(?, ?), we sample rollouts {?1, . . . , ?? } from the model ????? and
estimate the advantage of output ?? as follows:
(cid:16)(cid:8)?(? ?, ?)(cid:9)?
?=1
(cid:17)

?(??, ?) ? mean

ê?? =

(cid:17)

std

(cid:16)(cid:8)?(? ?, ?)(cid:9)?
?=1

In GRPO [40], the first algorithmic instantiation of RLVR, we opti-
mize the model by maximizing the following clipped objective:

?
??

(cid:34)

E

1
?

1
|?? |

|?? |
??

(cid:16)

(cid:16)
??,? ê??, clip(??,? , 1 ▒ ?) ê??

(cid:17)(cid:17)

min

(cid:35)

? =1
where ??,? = ?? (??,? |?, ??,<? )/????? (??,? |?, ??,<? ).

?=1

Building upon GRPO, CISPO introduces a constraint on impor-

tance sampling weights to prevent token-level instability:

(cid:34)

E

1
?=1 |?? |

(cid:205)?

?
??

|?? |
??

?=1

? =1

(cid:16)sg( ê??,? ) ê?? log ?? (??,? |?, ??, < ?)

(cid:17)

(cid:35)

where sg denotes the stop-gradient operation and ê??,? = clip(??,?, 1?
????, 2 + ?????).
Hyperparameters. We use a consistent set of hyperparameters as
follows. We split BIRD-Verified with an 85:15 ratio for training and
validation. For training, we use a group size of 16, a LoRA rank of
32, a batch size of 64, and a learning rate of 5╫10?5. During rollouts,
we allow up to five turns of interaction with the database since our
pilot experiment shows that the average number of turns fluctuates
between 3 and 4. For each turn, we follow prior work to allow at
most 3,076 output tokens [26]. We determine the training duration
based on the convergence of the validation accuracy and select the
checkpoint with the highest validation accuracy for evaluation.

5.2 Inference-time Scaling with Reconciliation

While RLVR training on BIRD-Verified significantly enhances in-
trinsic SQL reasoning, the model may still struggle with distribution
shifts in natural language ambiguity. To bridge the final gap to hu-
man parity, we introduce an inference-time scaling framework with
a reconciliation mechanism.

7

Motivation. RLVR effectively internalizes the reasoning patterns
present in the training data. However, this can lead to memorizing
specific interpretation styles, causing the model to fail when the
test data follows a different semantic convention. In the following
example of BIRD-Verified, the gold SQL uses LIKE for the constraint
about zip data type.

Question: In California, how many delivery receptacles are there in the commu-
nity post office that has the highest number of delivery receptacles?
External Knowledge: in California refers to state = æCAÆ; æCommunity Post
OfficeÆ is the Type
Gold SQL:
SELECT MAX ( total_delivery_receptacles )
FROM zip_data
WHERE state = 'CA '

AND type LIKE '% Community ? Post ? Office % '

However, in the test data, LIKE is not preferred. In the following
example, the gold SQL uses strict equal for the colors constraint,
although colors LIKE æ%B%Æ is also semantically plausible since
the colors column contains multiple colors.

Question: Among the Artifact cards, which are black color and comes with
foreign languague translation?
External Knowledge: Artifact card refers to originalType = æArtifactÆ; black
color refers to colors = æBÆ; foreign language refers to language in foreign_data
Gold SQL:
SELECT DISTINCT T1 . name FROM cards AS T1
INNER JOIN foreign_data AS T2
ON T1 . uuid = T2 . uuid
WHERE T1 . originalType = ' Artifact ' AND T1 . colors = 'B '

Consequently, since the model is trained on data that prefers
using LIKE, 93.8% of generations for the test question use LIKE,
while only 6.2% of generations use strict equality correctly.
Generation reconciliation. To address such issues, we introduce
the generation reconciliation method for inference-time scaling.
This method leverages inference-time compute to generate a diverse
set of candidates and uses a pre-RLVR base model, which retains
broader unbiased linguistic knowledge than the finetuned model,
to filter candidates based on constraint satisfaction.

Formally, given ? candidate SQL queries {?1, . . . , ?? }, we cluster
them into ? disjoint groups based on execution results {?1, . . . , ??1 },
. . ., {????? , ?? }. For each group, we use a pre-RLVR model with a
universal, general prompt to verify whether the set of queries com-
prehensively covers all the constraints specified in the question and
external knowledge. When there are multiple satisfying groups, we
apply majority voting to select the group with the most candidates,
representing the most confident answer by the finetuned model.
We illustrate this procedure in Algorithm 1.

6 EVALUATION

In this section, we show the evaluation results of ReViSQL. We
first introduce our experimental setup (º6.1). Then, we show that
ReViSQL achieves human-level performance on BIRD, outperform-
ing previous SOTA open-source agents (º6.2) and models (º6.3).
Next, we demonstrate the generalizability of ReViSQL by showing
the superiority of ReViSQL on Spider 2-SQLite and Spider 2-Snow

Algorithm 1: Inference-time scaling via generation recon-
ciliation and majority voting.

Input

: Question and external knowledge ?, pre-RLVR
model ?, finetuned model ?1, number of
candidates ?, database ?, grading function grade()

Output : Selected SQL query candidate

1 {?1, . . . , ?? } ? Generate(?1, ?, ?)
2 ? ? [[?1]]
3 for ? ? 2 to ? do
? ???? ? False
4
for ? ? 1 to |? | do

5

if grade(??, ? [ ?] [1], ?) then
? [ ?] ? Append(? [ ?], ?? )
? ???? ? True
break

if not ? ???? then

? ? Append(?, [?? ])

12 ?1 ? []
13 for ? ? 1 to |? | do
14

if Decide(?, ?, ? [ ?]) then
?1 ? Append(?1, ? [ ?])

6

7

8

9

10

11

15

16 if |?1| = 0 then
?1 ? ?
17
18 return MajorityVoting(?1)

(º6.4). Finally, we present an ablation study to demonstrate the
importance of each component of ReViSQL (º6.5).

6.1 Experimental Setup

We first introduce the benchmarks, baselines, metrics, and imple-
mentation details for our experiments.
Benchmarks. We use four benchmarks to evaluate our methods:
(1) Arcwise-Plat-SQL: As the original BIRD benchmark contains
substantial annotation errors [18, 33, 48, 60], Arcwise intro-
duced a corrected version of the BIRD Mini-Dev set [4]. In
addition, prior work fixed additional errors of gold SQL queries
in the Arcwise-corrected version leveraging SQL experts and
LLMs [18] and introduced Arcwise-Plat-SQL.

(2) Arcwise-Plat-Full: Prior work corrected all factual errors, includ-
ing those in questions, external knowledge, and SQL queries,
from the BIRD Mini-Dev set [18].

(3) Spider 2-SQLite: As a successor of the widely used Spider 1
benchmark, Spider 2 consists of 547 challenging questions [19].
Following prior work, we use 135 questions of Spider 2 that are
based on SQLite. Queries in Spider 2 are more complex than
those in BIRD, containing 5.2╫ more tokens on average [19].
(4) Spider 2-Snow: As a variant of Spider 2, Spider 2-Snow requires
all 547 SQL queries to be written in the Snowflake dialect [19].

Baselines. We consider the strongest open-source baselines in our
evaluation. Specifically, we use the top-5 open-source agents on the
BIRD leaderboard, the top-4 open-weight Text-to-SQL models, and

8

Table 4: Execution accuracy and per-query cost of ReViSQL compared to baselines across two budget tiers. ReViSQL demon-
strates superiority in both performance and cost-efficiency, extending its robust performance to the challenging Spider 2-SQLite
benchmark. In the high-budget tier, ReViSQL-235B-A22B establishes a new SOTA, outperforming the heavily engineered
OpenSearch-SQL agent by 9.8% on Arcwise-Plat-SQL and 5.6% on Arcwise-Plat-Full. In the low-budget tier, ReViSQL-30B-A3B
matches the accuracy of the high-budget OpenSearch-SQL on Arcwise-Plat-SQL with 7.5╫ lower real-time per-query costs.

Method

Arcwise-Plat-SQL (%) Arcwise-Plat-Full (%)

Spider 2-SQLite (%)

Real-time
cost (USD)

Batch cost
(USD)ç

SHARE (GPT-5.2)
CSC-SQL (XiYan-32B)
ReViSQL-30B-A3B (low)?

70.88
71.89
83.43

75.70
75.70
86.21

Low-budget (< $0.01 per query)

21.48
10.37
30.67

5.6 ╫ 10?3
2.9 ╫ 10?3
7.4 ╫ 10?3

2.8 ╫ 10?3
1.9 ╫ 10?3
ù

High-budget (? $0.01 per query)

Contextual-SQL (XiYan-32B)
GenaSQL (GPT-5.2)
OpenSearch-SQL (GPT-5.2)
ReViSQL-235B-A22Bå (low)
ReViSQL-235B-A22B (high)

1.9 ╫ 10?1
3.2 ╫ 10?2
2.8 ╫ 10?2
1.2 ╫ 10?2
3.1 ╫ 10?1
? ôLowö refers to inference-time scaling with 5 (greedy decoding + sampling) SQL candidates per question, and ôhighö refers to inference-time scaling with 129 candidates.
å 235B-A22B refers to a mixture-of-expert model architecture with 235 billion total parameters and 22 billion active parameters during inference. Similarly, 30B-A3B refers to 40

3.8 ╫ 10?1
6.3 ╫ 10?2
5.6 ╫ 10?2
3.9 ╫ 10?2
9.9 ╫ 10?1

11.11
34.81
34.07º
38.68
46.67

75.10
82.13
83.33
88.36
93.17

79.12
84.94
88.15
90.27
93.78

billion total parameters and 3 billion active parameters during inference.

ç For models whose provider offers a discounted pricing when running jobs in batches, we list the per-query cost in the batch mode.
º OpenSearch-SQL relies on training data for dynamic few-shot prompting, which Spider 2 does not provide. We tested with substituting the BIRD and Spider 1 training sets, as

well as disabling the module entirely. We report the performance with dynamic few-shot disabled, as it achieved the highest performance.

two large-scale frontier reasoning models. We configured agents
using either the optimal settings reported on the leaderboard or the
default parameters specified in their technical reports.

(1) Contextual-SQL relies on a dual-model architecture. It uses
Qwen2.5-Coder-32B-Instruct for candidate generation, and a
fine-tuned 32B reward model (trained on the entire 9.5k-example
BIRD Train set) to perform the final candidate selection [2].
(2) CSC-SQL uses a fine-tuned model, XiYanSQL-QwenCoder-
32B-2412, to generate candidate SQL queries and uses Qwen2.5-
Coder-7B-Instruct to select a final query for each problem [41].
(3) GenaSQL required a multi-API orchestration pipeline spanning
GPT-4o, Gemini 1.5, and Cohere to handle schema linking,
retrieval, and generation tasks. To standardize evaluation, we
used the same complex workflow and applied OpenAIÆs text-
embedding-3-small for retrieval and GPT-5.2 for all subsequent
orchestration and generation steps [12].

(4) OpenSearch-SQL uses a multi-stage retrieval and refinement
loop, combining bge-large-en-v1.5 for few-shot example re-
trieval and GPT-5.2 for schema extraction, query generation,
and query refinement [61].

(5) SHARE takes a baseline SQL query as input and refines it
across an ensemble of three distinct, distilled LLMs dedicated
to reasoning, schema linking, and iterative query fixing. In our
evaluation setup, this complex external refinement pipeline is
applied to baseline queries generated by GPT-5.2 [36].

(6) OmniSQL-32B is a fine-tuned model based on Qwen2.5-Coder-
32B-Instruct using a combination of synthetic data (2.5 million
examples), the Spider Train set, and the BIRD Train set [23].
(7) XiYanSQL-QwenCoder-32B is a finetuned model based on

Qwen2.5-Coder-32B over a closed-source dataset [28].

9

(8) Infly-RL-SQL-32B is a finetuned model without publicly dis-
closed information about its finetuning process and usage [51].4
We used the same inference setup as OmniSQL-32B.

(9) Arctic-R1-7B is a RLVR-finetuned model based on Qwen2.5-
Coder-7B-Instruct over 28k examples from BIRD Train set, Spi-
der Train set, Spider Dev set, and synthetic data [62].

(10) GPT-5.2 and Kimi-K2 are two frontier reasoning LLMs. We
execute them with our inference-time scaling framework.

Metrics. We use two key metrics to evaluate Text-to-SQL methods.
First, following prior work [19, 25], we measure the accuracy of
generated SQL queries using their execution accuracy with set-
based grading. Second, we measure the inference cost for each
SQL query. For methods based on the proprietary GPT-5.2 model,
we calculate the costs based on the OpenAI pricing. For methods
involving open-source models, we estimate their token costs using
the cheapest pricing of their corresponding base models provided
by Together [53], Groq [50], Sail [37] or Fireworks [49]. We used
pricing data from February 27, 2026.
Implementation details. For the RLVR training stage of ReViSQL,
we follow the training specifications discussed in Section 5.1 and
use Tinker [54] as the training infrastructure. For inference-time
scaling, we use greedy decoding (temperature=0) and temperatures
of 0.25, 0.5, 0.75, and 1.0. For non-zero temperatures, we sample an
equal number of candidates. Depending on cost budgets, we sample
5û129 candidates per question. During training and inference, each
intermediate query issued by the model is subject to a 30-second
timeout. We conducted our experiments on a machine with an Intel
8568Y+ CPU, 512 GB memory, and an NVIDIA H100 GPU.

4We contacted the authors to request instructions for using the model. However, we
have not received a response yet.

(a) Accuracy scaling by candidate
count (Arcwise-Plat-SQL).

(b) Accuracy scaling by candidate
count (Arcwise-Plat-Full).

(c) Tradeoff of cost and accuracy
(Arcwise-Plat-SQL).

(d) Tradeoff of cost and accuracy
(Arcwise-Plat-Full).

Figure 4: Accuracy of ReViSQL and baseline models under inference-time scaling constraints. Across both BIRD datasets,
ReViSQL models consistently achieve significantly higher execution accuracy than all baselines when scaling the number
of candidates from 4 to 32 (Fig. 4a and 4b). Furthermore, in terms of cost-efficiency, ReViSQL establishes a strict new Pareto
frontier, delivering higher accuracy at substantially lower costs compared to expensive models like GPT-5.2 (Fig. 4c and 4d).

6.2 ReViSQL Achieves Human-parity and
Outperforms Open-Source Agents

6.3 ReViSQL Outperforms Single-model

Baselines

We first show the end-to-end performance of ReViSQL in compari-
son to prior open-source agents for BIRD. In Table 4, we show the
detailed results of ReViSQL and baselines, including the accuracy
on two BIRD benchmarks and the costs per question.
ReViSQL achieves human parity on BIRD. As shown in Ta-
ble 4, ReViSQL demonstrates superiority over all baselines. Under
the high-budget inference-time scaling setting (129 candidates),
ReViSQL-235B-A22B establishes a new SOTA, achieving an ex-
ecution accuracy of 93.17% on Arcwise-Plat-SQL and 93.78% on
Arcwise-Plat-Full. This performance exceeds the proxy human-
level accuracy threshold (92.96%) reported by BIRD [47]. Compared
to the previous best-performing complex agent, OpenSearch-SQL
(powered by GPT-5.2), ReViSQL-235B-A22B delivers an absolute
accuracy improvement of 9.8% on Arcwise-Plat-SQL and 5.6% on
Arcwise-Plat-Full. Furthermore, ReViSQL-235B-A22B achieves this
breakthrough without relying on complex, multi-stage pipelines
involving dynamic few-shot prompting, external schema linking,
or iterative SQL refiners.
High performance at lower costs. Beyond peak accuracy, Re-
ViSQL demonstrates high efficiency across both real-time and batch
workloads. In low-budget conditions, our lightweight ReViSQL-
30B-A3B with 5 SQL query candidates per question achieves 83.43%
on Arcwise-Plat-SQL and 86.21% on Arcwise-Plat-Full, success-
fully matching the accuracy of the heavily engineered, high-budget
OpenSearch-SQL agent on Arcwise-Plat-SQL (83.33%) while reduc-
ing the real-time per-query inference cost by a factor of 7.5╫. In ad-
dition, ReViSQL-235B-A22B with 5 SQL candidates achieves 88.36%
on Arcwise-Plat-SQL and 90.27% on Arcwise-Plat-Full, outperform-
ing OpenSearch-SQL while reducing the per-query inference cost
by a factor of 1.4╫ in the real-time mode and 2.3╫ in the batch mode.
This further indicates that internalizing reasoning through verified
RLVR is more efficient than hand-designed multi-stage pipelines.

To show that our performance gains come from the entire ReViSQL
framework, rather than merely the inference-time scaling mecha-
nism, we compared our models against a set of SOTA open-source
and proprietary models, executed with majority voting.
Consistent superiority across candidate scaling. In Figures 4a
and 4b, we show the execution accuracy as we scale up the number
of candidates generated per question (from 4 to 32). Across both
Arcwise-Plat-SQL and Arcwise-Plat-Full, ReViSQL models consis-
tently and significantly outperform all baselines at every sample
size. Specifically, ReViSQL-235B-A22B maintains a dominant accu-
racy margin over the largest baseline models by 9.3û15.6%, showing
that massive parameter counts and generic reasoning capabilities
cannot close the Text-to-SQL performance gap. Similarly, our highly
efficient ReViSQL-30B-A3B outperforms all other finetuned models
in the 32B parameter class by 12.3û18.7%.
The reasoning bottleneck of generic and specialized LLMs.
In Figures 4a and 4b, we show that baseline models, such as GPT-
5.2 and Infly-RL-SQL-32B, exhibit severe diminishing returns. The
accuracy curve remains nearly flat despite an order-of-magnitude
increase in the number of candidates. In contrast, ReViSQL not only
starts at a higher accuracy but continues to scale smoothly. This
indicates reasoning bottlenecks in prior models and underscores
our core hypothesis: inference-time scaling is only effective when
the underlying model possesses high SQL reasoning capabilities.
Dominance across the cost-accuracy Pareto frontier. By fun-
damentally improving the modelÆs reasoning capabilities during
training, ReViSQL models provide a strictly superior cost-accuracy
paradigm. In Figures 4c and 4d, we show the execution accuracy
against per-query cost in a logarithmic scale. As shown, ReViSQL
establishes a new Pareto frontier. Specifically, under the lowest-
budget configuration, ReViSQL-30B-A3B achieves up to 9.5% higher

10

Table 5: Among open-source methods with open-weight mod-
els on the Spider 2-Snow Leaderboard, ReViSQL achieves the
highest accuracy with lower number of parameters.

Method

# param. Accuracy (%)?

Spider-Agent (QwQ-32B)
Spider-Agent (DeepSeek-R1)
Spider-Agent (Qwen3-Coder)
ReFoRCE (DeepSeek-V3)
AutoLink (DeepSeek-R1)
ReViSQL-235B-A22B (high)

32B
671B-A37B
480B-A35B
671B-A37B
671B-A37B
235B-A22B

8.96
10.55
31.08
38.03
54.84
55.58

? We use the scores of baselines reported on the leaderboard by Feb. 19, 2026.

accuracy than the maximum-budget configurations of heavily engi-
neered frontier models like GPT-5.2, as well as comparably sized spe-
cialized models finetuned on large-scale synthetic data (OmniSQL-
32B) or proprietary data (XiYanSQL-32B).

6.4 ReViSQL Generalizes to Spider 2

To show the generalizability of ReViSQL across benchmarks, we
evaluate ReViSQL on Spider 2-SQLite and Spider 2-Snow, which
contain challenging queries and the Snowflake dialect.
ReViSQL outperforms BIRD agents on Spider 2-SQLite. As
shown in Table 4, ReViSQL delivers dominant performance on
Spider 2-SQLite across both budget tiers. In the high-budget tier,
ReViSQL-235B-A22B (high) achieves an execution accuracy of
46.67%, outperforming the strongest baseline (GenaSQL at 34.81%)
by 11.86%. In the low-budget tier, our lightweight ReViSQL-30B-
A3B (low) achieves 30.67%, outperforming the heavily engineered
SHARE (21.48%). In contrast, methods relying heavily on dataset-
specific prompt engineering or complex pipelines experience severe
performance degradation. For instance, Contextual-SQL collapses
to an 11.11% accuracy, while OpenSearch-SQL drops to 34.07%.
ReViSQL achieves SOTA among open-source, open-weight
methods on Spider 2-Snow. We compare ReViSQL against the
top-5 open-source methods with open-weight models on the Spider
2-Snow Leaderboard. To handle schemas that exceed the modelÆs
context window, we use the same schema filtering method as Re-
FoRCE [11] with Kimi-K2 [52], a long-context LLM, to prune irrele-
vant information. As shown in Table 5, ReViSQL-235B-A22B with
129 SQL query candidates per question establishes a new SOTA for
open-source methods with open-weight models, achieving 55.58%
execution accuracy. Furthermore, the top-performing baselines
on the leaderboard rely heavily on massive model architectures
with 671B total parameters. In contrast, ReViSQL-A22B achieves
SOTA performance using only 235B parameters. With 2.9╫ fewer
parameters, we show that RLVR with verified data creates a more
generalizable model for SQL reasoning than scaling parameters.

6.5 Decomposing the Drivers of the

Human-level Performance of ReViSQL

We perform an ablation study to decompose the benefit of each
component in ReViSQL, including training data, validation data,

(a) Reward signal dynamics dur-
ing training.

(b) Execution accuracy on
Arcwise-Plat-Full.

Figure 5: BIRD-Verified prevents spurious reward optimiza-
tion during RLVR training. While RLVR successfully drives
up the training rewards for both BIRD-Verified and the origi-
nal BIRD Train set (Fig. 5a), this optimization only translates
to test accuracy improvement on verified data (Fig. 5b).

Figure 6: Across benchmarks, training on BIRD-Verified
achieves 8.2û13.9% higher accuracy than training on the orig-
inal BIRD Train set.

inference-time scaling, and data quantity. Throughout this study,
we use Qwen3-235B-A22B as the base model for training.
Impact of verified training data. To isolate the impact of training
data quality, we analyze the training dynamics of the model fine-
tuned on BIRD-Verified versus the original, noisy BIRD Train set (9k
instances). As shown in Figure 5, we find that the RLVR algorithm
functions as intended on both datasets, successfully driving an
upward trend in internal training rewards. However, evaluating
these intermediate checkpoints on the Arcwise-Plat-Full benchmark
leads to a critical divergence (Figure 5b). While the model trained on
BIRD-Verified shows steady growth in the execution accuracy, the
model trained on the original data suffers from severe performance
degradation as training progresses. This phenomenon empirically
exposes the severe impact of spurious rewards in Text-to-SQL tasks.
In Figure 6, we show the execution accuracy of the models trained
on BIRD-Verified and the original BIRD Train set, under the greedy
decoding setting and the same verified validation dataset. BIRD-
Verified improves the execution accuracy by 8.2, 9.0, and 13.9% on
Arcwise-Plat-Full, Arcwise-Plat-SQL, and Spider 2-Snow.
Impact of verified validation data. In rigorous ML evaluations,
one should select the optimal training checkpoint based on its per-
formance on a held-out validation set [15]. Our experiments show
a critical failure mode in Text-to-SQL training: suboptimal model

11

Table 6: Verified validation data is critical to selecting the
best model checkpoint for downstream inference.

# Training
steps to best val

Arcwise-
Plat-Full (%)

Arcwise-
Plat-SQL (%)

Original Val
Verified Val

30
290

77.3
85.9

72.1
80.2

Table 7: Evaluation of the reconciliation filtering mechanism.
We show that our reconciliation mechanism is effective at
identifying flawed SQL candidates (high recall) while rarely
removing correct queries (low false rejection rate), providing
net accuracy gains across all evaluated benchmarks.

False rejection Recall ? Accuracy

Arcwise-Plat-Full
Arcwise-Plat-SQL
Spider 2-SQLite
Spider 2-Snow

2.2%
2.7%
3.9%
1.3%

52.9%
53.5%
39.2%
33.6%

1.4%
2.9%
0.7%
3.5%

checkpoint selection. In Table 6, we present the benefit of using
clean validation data. When we select the best training checkpoint
using the original, noisy BIRD data, the noisy validation accuracy
misguides the selection process. Using a verified validation set, we
achieve an 8.6% gain in greedy-decoding accuracy on Arcwise-Plat-
Full, which matches the benefit of training on BIRD-Verified versus
the original BIRD Train set. This indicates that an expert-verified
validation set is equally important as a verified training set.
Impact of candidate scaling. In Figure 7, we show the accuracy
improvement of our inference-time scaling mechanism over greedy
decoding. Generating multiple candidates consistently improves
performance across all benchmarks, yielding accuracy gains of
4.4û8.1% with five candidates. In addition, these benefits show cor-
relation with the difficulty of question understanding. On Arcwise-
Plat-Full, scaling to 129 candidates improves the accuracy by 7.8%.
However, on Arcwise-Plat-SQL, which contains errors in questions,
inference-time scaling delivers 13.6% absolute accuracy increase.
This confirms that scaling inference compute is vital for deploy-
ments that involve vague questions.
Impact of reconciliation. To evaluate the effectiveness of our
inference-time reconciliation, we analyze its performance as a selec-
tive filter prior to the final majority voting. In Table 7, we show the
performance across three dimensions: False rejection (the number
of rejected correct SQL queries over the total number of correct
SQL queries), Recall (the number of rejected incorrect SQL queries
over the total number of incorrect SQL queries), and ? Accuracy
(the absolute accuracy gain over majority voting). Our primary
objective at reconciliation is to minimize the false rejections since
removing a correct query directly degrades maximum potential
accuracy. We are highly tolerant of false non-rejections because the
subsequent majority voting layer provides an aggregate defense
against any surviving spurious candidates.

12

Figure 7: Accuracy consis-
tently increases with more
candidates by 4.4-13.6%.

Figure 8: Accuracy consis-
tently increases with more
training data.

As shown in Table 7, the reconciliation layer maintains a low
False rejection rate of 1.3û3.9% across all evaluated benchmarks.
Furthermore, the filtering remains effective, demonstrating a recall
of 33.6û52.9% in identifying and eliminating incorrect queries. By
safely narrowing the candidate pool without excessively removing
correct SQL queries, this conservative reconciliation yields a net
accuracy gain of 0.7û3.5% over pure majority voting.
Impact of training data scaling. We investigate whether the
benefits of verified data exhibit diminishing returns. In Figure 8,
we show the greedy-decoding accuracy of ReViSQL-235B-A22B
with an increasing volume of training examples (log scale). On
both Arcwise-Plat-SQL and Arcwise-Plat-Full, the accuracy climbs
consistently as more verified data is used for training. It suggests
that by expanding the quantity of verified data, we can potentially
continue to push the boundaries of automated Text-to-SQL further.

7 CONCLUSION

We present ReViSQL, a streamlined framework that achieves human-
level Text-to-SQL by curating expert-verified training data and
inference-time scaling. We construct BIRD-Verified, a verified dataset
of 2.5k Text-to-SQL instances, correcting data errors in 61.1% of
the original BIRD Train set. Together with inference-time scaling,
we introduce two instantiations of ReViSQL: ReViSQL-235B-A22B
and ReViSQL-30B-A3B. Empirically, ReViSQL-235B-A22B achieves
up to 93.78% execution accuracy on an expert-verified subset of
BIRD dev set, outperforming the prior state-of-the-art by 9.8%. Our
lightweight ReViSQL-30B-A3B matches the prior SOTA at a 7.5╫
lower inference cost. Furthermore, ReViSQL generalizes to com-
plex, out-of-distribution datasets, yielding up to a 23.5% absolute
accuracy increase on Spider 2-Snow. Finally, ReViSQL demonstrates
that accurate Text-to-SQL systems do not rely on complex, hand-
designed pipelines but require pairing expert-verified training data
with scalable inference-time compute.

REFERENCES
[1] Katrin Affolter, Kurt Stockinger, and Abraham Bernstein. 2019. A comparative
survey of recent natural language interfaces for databases. The VLDB Journal 28,
5 (2019), 793û819.

[2] Sheshansh Agrawal and Thien Nguyen. 2025. Open-Sourcing the Best Local
Text-to-SQL System. https://contextual.ai/blog/open-sourcing-the-best-local-
text-to-sql-system/
Ion Androutsopoulos, Graeme D Ritchie, and Peter Thanisch. 1995. Natural
language interfaces to databasesûan introduction. Natural language engineering
1, 1 (1995), 29û81.

[3]

[4] Arcwise. 2025. BIRD minidev - corrections.

https://docs.google.com/
spreadsheets/d/1IGm9Otruey60ujUnl8AOkepY3qgWHdFJHnX7hQGUeCw Ac-
cessed: 2025-09-15.

[5] Agent Team at JDCHO. 2025.

JoyAgent-JDGenie.

https://github.com/jd-

opensource/joyagent-jdgenie

[6] Mert Cemri, Melissa Z Pan, Shuyi Yang, Lakshya A Agrawal, Bhavya Chopra,
Rishabh Tiwari, Kurt Keutzer, Aditya Parameswaran, Dan Klein, Kannan Ram-
chandran, et al. 2025. Why do multi-agent llm systems fail? arXiv preprint
arXiv:2503.13657 (2025).

[7] Aili Chen, Aonian Li, Bangwei Gong, Binyang Jiang, Bo Fei, Bo Yang, Boji Shan,
Changqing Yu, Chao Wang, Cheng Zhu, et al. 2025. Minimax-m1: Scaling test-
time compute efficiently with lightning attention. arXiv preprint arXiv:2506.13585
(2025).

[8] Kaiwen Chen, Yueting Chen, Nick Koudas, and Xiaohui Yu. 2025. Reliable Text-
to-SQL with Adaptive Abstention. Proceedings of the ACM on Management of
Data 3, 1 (2025), 1û30.

[9] Team Cohere, Arash Ahmadian, Marwan Ahmed, Jay Alammar, Milad Alizadeh,
Yazeed Alnumay, Sophia Althammer, Arkady Arkhangorodsky, Viraat Aryabumi,
Dennis Aumiller, et al. 2025. Command a: An enterprise-ready large language
model. arXiv preprint arXiv:2504.00698 (2025).

[10] Databricks. 2025. The Power of RLVR: Training a Leading SQL Reasoning Model
on Databricks. https://www.databricks.com/blog/power-rlvr-training-leading-
sql-reasoning-model-databricks Accessed: 2025-10-10.

[11] Minghang Deng, Ashwin Ramachandran, Canwen Xu, Lanxiang Hu, Zhewei
Yao, Anupam Datta, and Hao Zhang. 2025. ReFoRCE: a text-to-SQL agent with
self-refinement, consensus enforcement, and column exploration. arXiv preprint
arXiv:2502.00675 (2025).

[12] Yusuf Denizay D÷nder, Derek Hommel, Andrea W Wen-Yi, David Mimno, and
Unso Eun Seo Jo. 2025. Cheaper, Better, Faster, Stronger: Robust Text-to-SQL with-
out Chain-of-Thought or Fine-Tuning. arXiv preprint arXiv:2505.14174 (2025).

[13] Tom Everitt, Victoria Krakovna, Laurent Orseau, and Shane Legg. 2017. Rein-
forcement learning with a corrupted reward channel. In Proceedings of the 26th
International Joint Conference on Artificial Intelligence. 4705û4713.

[14] Dawei Gao, Haibin Wang, Yaliang Li, Xiuyu Sun, Yichen Qian, Bolin Ding, and
Jingren Zhou. 2024. Text-to-SQL Empowered by Large Language Models: A
Benchmark Evaluation. Proceedings of the VLDB Endowment 17, 5 (2024), 1132û
1145.

[15] Andrew Gelman and Eric Loken. 2013. The garden of forking paths: Why multiple
comparisons can be a problem, even when there is no ôfishing expeditionö or
ôp-hackingö and the research hypothesis was posited ahead of time. Department
of Statistics, Columbia University 348, 1-17 (2013), 3.

[16] Daya Guo, Dejian Yang, Haowei Zhang, Junxiao Song, Ruoyu Zhang, Runxin
Xu, Qihao Zhu, Shirong Ma, Peiyi Wang, Xiao Bi, et al. 2025. Deepseek-r1:
Incentivizing reasoning capability in llms via reinforcement learning. arXiv
preprint arXiv:2501.12948 (2025).

[17] Zhifeng Hao, Qibin Song, Ruichu Cai, and Boyan Xu. 2025. Text-to-SQL as
Dual-State Reasoning: Integrating Adaptive Context and Progressive Generation.
arXiv preprint arXiv:2511.21402 (2025).

[18] Tengjun Jin, Yoojin Choi, Yuxuan Zhu, and Daniel Kang. 2026. Pervasive Anno-

tation Errors Break Text-to-SQL Benchmarks and Leaderboards. VLDB (2026).
[19] Fangyu Lei, Jixuan Chen, Yuxiao Ye, Ruisheng Cao, Dongchan Shin, Hongjin Su,
Zhaoqing Suo, Hongcheng Gao, Wenjing Hu, Pengcheng Yin, et al. 2024. Spider
2.0: Evaluating language models on real-world enterprise text-to-sql workflows.
arXiv preprint arXiv:2411.07763 (2024).

[20] Boyan Li, Yuyu Luo, Chengliang Chai, Guoliang Li, and Nan Tang. 2024. The
Dawn of Natural Language to SQL: Are We Fully Ready? Proceedings of the VLDB
Endowment 17, 11 (2024), 3318û3331.

[21] Boyan Li, Jiayi Zhang, Ju Fan, Yanwei Xu, Chong Chen, Nan Tang, and Yuyu
Luo. [n.d.]. Alpha-SQL: Zero-Shot Text-to-SQL using Monte Carlo Tree Search.
In Forty-second International Conference on Machine Learning.

[22] Fei Li and Hosagrahar V Jagadish. 2014. Constructing an interactive natural
language interface for relational databases. Proceedings of the VLDB Endowment
8, 1 (2014), 73û84.

[23] Haoyang Li, Shang Wu, Xiaokang Zhang, Xinmei Huang, Jing Zhang, Fuxin
Jiang, Shuai Wang, Tieying Zhang, Jianjun Chen, Rui Shi, et al. 2025. Omnisql:
Synthesizing high-quality text-to-sql data at scale. arXiv preprint arXiv:2503.02240
(2025).

[25]

[24] Haoyang Li, Jing Zhang, Hanbing Liu, Ju Fan, Xiaokang Zhang, Jun Zhu, Renjie
Wei, Hongyan Pan, Cuiping Li, and Hong Chen. 2024. Codes: Towards build-
ing open-source language models for text-to-sql. Proceedings of the ACM on
Management of Data 2, 3 (2024), 1û28.
Jinyang Li, Binyuan Hui, Ge Qu, Jiaxi Yang, Binhua Li, Bowen Li, Bailin Wang,
Bowen Qin, Ruiying Geng, Nan Huo, et al. 2023. Can llm already serve as a
database interface? a big bench for large-scale database grounded text-to-sqls.
Advances in Neural Information Processing Systems 36 (2023), 42330û42357.
[26] Shu Liu, Sumanth Hegde, Shiyi Cao, Alan Zhu, Dacheng Li, Tyler Griggs, Eric
Tang, Akshay Malik, Kourosh Hakhamaneshi, Richard Liaw, Philipp Moritz,
Matei Zaharia, Joseph E. Gonzalez, and Ion Stoica. 2025. SkyRL-SQL: Matching

13

GPT-4o and o4-mini on Text2SQL with Multi-Turn RL. Notion Blog.

[27] Xinyu Liu, Shuyu Shen, Boyan Li, Nan Tang, and Yuyu Luo. 2025. Nl2sql-bugs:
A benchmark for detecting semantic errors in nl2sql translation. In Proceedings
of the 31st ACM SIGKDD Conference on Knowledge Discovery and Data Mining V.
2. 5662û5673.

[28] Yifu Liu, Yin Zhu, Yingqi Gao, Zhiling Luo, Xiaoxia Li, Xiaorong Shi, Yuntao
Hong, Jinyang Gao, Yu Li, Bolin Ding, et al. 2025. Xiyan-sql: A novel multi-
generator framework for text-to-sql. arXiv preprint arXiv:2507.04701 (2025).
[29] Peixian Ma, Xialie Zhuang, Chengjin Xu, Xuhui Jiang, Ran Chen, and Jian Guo.
2025. Sql-r1: Training natural language to sql reasoning model by reinforcement
learning. arXiv preprint arXiv:2504.08600 (2025).

[30] Karime Maamari, Fadhil Abubaker, Daniel Jaroslawicz, and Amine Mhedhbi.
[n.d.]. The Death of Schema Linking? Text-to-SQL in the Age of Well-Reasoned
Language Models. In NeurIPS 2024 Third Table Representation Learning Workshop.
[31] Simone Papicchio, Simone Rossi, Luca Cagliero, and Paolo Papotti. 2025.
Think2sql: Reinforce llm reasoning capabilities for text2sql. arXiv preprint
arXiv:2504.15077 (2025).

[32] Mohammadreza Pourreza, Hailong Li, Ruoxi Sun, Yeounoh Chung, Shayan Talaei,
Gaurav Tarlok Kakkar, Yu Gan, Amin Saberi, Fatma Ozcan, and Sercan O Arik.
[n.d.]. CHASE-SQL: Multi-Path Reasoning and Preference Optimized Candidate
Selection in Text-to-SQL. In The Thirteenth International Conference on Learning
Representations.

[33] Mohammadreza Pourreza and Davood Rafiei. 2023. Evaluating Cross-Domain
Text-to-SQL Models and Benchmarks. In Proceedings of the 2023 Conference on
Empirical Methods in Natural Language Processing. 1601û1611.

[34] Mohammadreza Pourreza, Ruoxi Sun, Hailong Li, Lesly Miculicich, Tomas Pfister,
and Sercan O Arik. 2024. Sql-gen: Bridging the dialect gap for text-to-sql via
synthetic data and model merging. arXiv preprint arXiv:2408.12733 (2024).
[35] Mohammadreza Pourreza, Shayan Talaei, Ruoxi Sun, Xingchen Wan, Hailong
Li, Azalia Mirhoseini, Amin Saberi, Sercan Arik, et al. 2025. Reasoning-sql:
Reinforcement learning with sql tailored partial rewards for reasoning-enhanced
text-to-sql. arXiv preprint arXiv:2503.23157 (2025).

[36] Ge Qu, Jinyang Li, Bowen Qin, Xiaolong Li, Nan Huo, Chenhao Ma, and Reynold
Cheng. 2025. SHARE: An SLM-based Hierarchical Action CorREction Assistant
for Text-to-SQL. arXiv preprint arXiv:2506.00391 (2025).

[37] Sail Research. 2025. Sail Models and Pricing Page. https://docs.sailresearch.

[38]

com/supported-models Accessed: 2026-02-28.
Jaydeep Sen, Fatma Ozcan, Abdul Quamar, Greg Stager, Ashish Mittal, Manasa
Jammi, Chuan Lei, Diptikalyan Saha, and Karthik Sankaranarayanan. 2019. Nat-
ural language querying of complex business intelligence queries. In Proceedings
of the 2019 international conference on management of data. 1997û2000.

[39] Rulin Shao, Shuyue Stella Li, Rui Xin, Scott Geng, Yiping Wang, Sewoong Oh,
Simon Shaolei Du, Nathan Lambert, Sewon Min, Ranjay Krishna, et al. 2025. Spu-
rious rewards: Rethinking training signals in rlvr. arXiv preprint arXiv:2506.10947
(2025).

[40] Zhihong Shao, Peiyi Wang, Qihao Zhu, Runxin Xu, Junxiao Song, Xiao Bi, Haowei
Zhang, Mingchuan Zhang, YK Li, Yang Wu, et al. 2024. Deepseekmath: Pushing
the limits of mathematical reasoning in open language models. arXiv preprint
arXiv:2402.03300 (2024).

[41] Lei Sheng and Shuai-Shuai Xu. 2025. CSC-SQL: Corrective Self-Consistency in
Text-to-SQL via Reinforcement Learning. arXiv preprint arXiv:2505.13271 (2025).
[42] Lei Sheng and Shuai-Shuai Xu. 2025. SLM-SQL: An Exploration of Small Lan-

guage Models for Text-to-SQL. arXiv preprint arXiv:2507.22478 (2025).

[43] Liang Shi, Zhengju Tang, Nan Zhang, Xiaotong Zhang, and Zhi Yang. 2025.
A survey on employing large language models for text-to-sql tasks. Comput.
Surveys 58, 2 (2025), 1û37.

[44] Vladislav Shkapenyuk, Divesh Srivastava, Theodore Johnson, and Parisa Ghane.
arXiv preprint

2025. Automatic Metadata Extraction for Text-to-SQL.
arXiv:2505.19988 (2025).

[45] Aaditya Singh, Adam Fry, Adam Perelman, Adam Tart, Adi Ganesh, Ahmed
El-Kishky, Aidan McLaughlin, Aiden Low, AJ Ostrow, Akhila Ananthram, et al.
2025. Openai gpt-5 system card. arXiv preprint arXiv:2601.03267 (2025).
[46] Shayan Talaei, Mohammadreza Pourreza, Yu-Chen Chang, Azalia Mirhoseini,
and Amin Saberi. 2024. Chess: Contextual harnessing for efficient sql synthesis.
arXiv preprint arXiv:2405.16755 (2024).

[47] BIRD Team. 2024. BIRD-bench. https://bird-bench.github.io/ Accessed: 2025-02-

10.

[48] BIRD Team. 2025. Panel of BIRD Annotation Issues.

https://github.com/

AlibabaResearch/DAMO-ConvAI/issues/39 Accessed: 2025-10-15.

[49] Fireworks Team. 2025. Fireworks Pricing Page. https://fireworks.ai/pricing

Accessed: 2026-02-10.

[50] Groq Team. 2025. Groq Pricing Page.

https://groq.com/pricing Accessed:

[51]

2025-10-10.
Infly Team. 2025. infly/inf-rl-qwen-coder-32b-2746. https://huggingface.co/
infly/inf-rl-qwen-coder-32b-2746

[52] Kimi Team, Yifan Bai, Yiping Bao, Guanduo Chen, Jiahao Chen, Ningxin Chen,
Ruijue Chen, Yanru Chen, Yuankun Chen, Yutian Chen, et al. 2025. Kimi k2:
Open agentic intelligence. arXiv preprint arXiv:2507.20534 (2025).

[53] Together AI Team. 2025. Together AI Pricing Page. https://together.ai/pricing

arXiv preprint arXiv:2511.17190 (2025).

Accessed: 2025-10-10.

[54] Tinker. 2025. Tinker: a training API for researchers and developers.

https:

//tinker-docs.thinkingmachines.ai/ Accessed: 2025-10-10.

[55] Bing Wang, Changyu Ren, Jian Yang, Xinnian Liang, Jiaqi Bai, Linzheng Chai,
Zhao Yan, Qian-Wen Zhang, Di Yin, Xing Sun, et al. 2025. Mac-sql: A multi-agent
collaborative framework for text-to-sql. In Proceedings of the 31st International
Conference on Computational Linguistics. 540û557.
Jingkang Wang, Yang Liu, and Bo Li. 2020. Reinforcement learning with perturbed
rewards. In Proceedings of the AAAI conference on artificial intelligence, Vol. 34.
6202û6209.

[56]

[57] Pengfei Wang, Baolin Sun, Xuemei Dong, Yaxun Dai, Hongwei Yuan, Mengdie
Chu, Yingqi Gao, Xiang Qi, Peng Zhang, and Ying Yan. 2025. Agentar-Scale-SQL:
Advancing Text-to-SQL through Orchestrated Test-Time Scaling. arXiv preprint
arXiv:2509.24403 (2025).

[58] Ziyang Wang, Yuanlei Zheng, Zhenbiao Cao, Xiaojin Zhang, Zhongyu Wei, Pei
Fu, Zhenbo Luo, Wei Chen, and Xiang Bai. 2025. AutoLink: Autonomous Schema
Exploration and Expansion for Scalable Schema Linking in Text-to-SQL at Scale.

[59] Cornelius Wolff, Daniel Gomm, and Madelon Hulsebos. [n.d.]. SQaLe: A large
text-to-SQL corpus grounded in real schemas. In EurIPS 2025 Workshop: AI for
Tabular Data.

[60] Niklas Wretblad, Fredrik Riseby, Rahul Biswas, Amin Ahmadi, and Oskar Holm-
str÷m. 2024. Understanding the Effects of Noise in Text-to-SQL: An Examination
of the BIRD-Bench Benchmark. In Proceedings of the 62nd Annual Meeting of the
Association for Computational Linguistics (Volume 2: Short Papers). 356û369.
[61] Xiangjin Xie, Guangwei Xu, Lingyan Zhao, and Ruijie Guo. 2025. Opensearch-
sql: Enhancing text-to-sql with dynamic few-shot and consistency alignment.
Proceedings of the ACM on Management of Data 3, 3 (2025), 1û24.

[62] Zhewei Yao, Guoheng Sun, Lukasz Borchmann, Zheyu Shen, Minghang Deng,
Bohan Zhai, Hao Zhang, Ang Li, and Yuxiong He. 2025. Arctic-Text2SQL-R1: Sim-
ple Rewards, Strong Reasoning in Text-to-SQL. arXiv preprint arXiv:2505.20315
(2025).

[63] Bohan Zhai, Canwen Xu, Yuxiong He, and Zhewei Yao. 2025. ExCoT: Op-
timizing reasoning for text-to-SQL with execution feedback. arXiv preprint
arXiv:2503.19988 (2025).

14
