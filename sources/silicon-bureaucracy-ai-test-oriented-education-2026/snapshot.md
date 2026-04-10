<!--
  AI Triad Research Project — Document Snapshot
  Title      : Silicon Bureaucracy and AI Test-Oriented Education: Contamination Sensitivity and Score Confidence in LLM Benchmarks
  Source     : 
  Type       : pdf
  Captured   : 2026-04-09
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Silicon Bureaucracy and AI Test-Oriented Education: Contamination Sensitivity and Score Confidence in LLM Benchmarks

> **Snapshot captured:** 2026-04-09
> **Source:** 
> **Type:** pdf

---
Silicon Bureaucracy and AI Test-Oriented Education:
Contamination Sensitivity and Score Confidence in LLM
Benchmarks
Hongjun An?
Institute of Artificial Intelligence
(TeleAI), China Telecom
Northwestern Polytechnical
University
China

Yiliang Song?
Institute of Artificial Intelligence
(TeleAI), China Telecom
Guangxi Normal University
China

Jiangan Chen
Guangxi Normal University
China

Xuanchen Yan
Northwestern Polytechnical
University
China

Huan Song
Institute of Artificial Intelligence
(TeleAI), China Telecom
China

Xuelong Liå
xuelong_li@ieee.org
Institute of Artificial Intelligence
(TeleAI), China Telecom
China

Jiawei Shao
Institute of Artificial Intelligence
(TeleAI), China Telecom
China

6
2
0
2

r
a

M
8
2

]
I

A
.
s
c
[

2
v
6
3
6
1
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

Figure 1: Silicon Bureaucracy and AI Test-Oriented Education.

?Equal contribution; work done while interning at TeleAI.
åCorresponding author.

Permission to make digital or hard copies of all or part of this work for personal or
classroom use is granted without fee provided that copies are not made or distributed
for profit or commercial advantage and that copies bear this notice and the full citation
on the first page. Copyrights for components of this work owned by others than the
author(s) must be honored. Abstracting with credit is permitted. To copy otherwise, or
republish, to post on servers or to redistribute to lists, requires prior specific permission
and/or a fee. Request permissions from permissions@acm.org.
Conference acronym ÆXX, Woodstock, NY

Abstract
Public benchmarks increasingly govern how large language models
(LLMs) are ranked, selected, and deployed. We frame this benchmark-
centered regime as Silicon Bureaucracy and AI Test-Oriented Edu-
cation, and argue that it rests on a fragile assumption: that bench-
mark scores directly reflect genuine generalization. In practice,

⌐ 2018 Copyright held by the owner/author(s). Publication rights licensed to ACM.
ACM ISBN 978-1-4503-XXXX-X/2018/06
https://doi.org/XXXXXXX.XXXXXXX

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

Trovato et al.

however, such scores may conflate exam-oriented competence with
principled capability, especially when contamination and semantic
leakage are difficult to exclude from modern training pipelines. We
therefore propose an audit framework for analyzing contamina-
tion sensitivity and score confidence in LLM benchmarks. Using a
router-worker setup, we compare a clean-control condition with
noisy conditions in which benchmark problems are systematically
deleted, rewritten, and perturbed before being passed downstream.
For a genuinely clean benchmark, noisy conditions should not
consistently outperform the clean-control baseline. Yet across mul-
tiple models, we find widespread but heterogeneous above-baseline
gains under noisy conditions, indicating that benchmark-related
cues may be reassembled and can reactivate contamination-related
memory. These results suggest that similar benchmark scores may
carry substantially different levels of confidence. Rather than re-
jecting benchmarks altogether, we argue that benchmark-based
evaluation should be supplemented with explicit audits of contami-
nation sensitivity and score confidence.

CCS Concepts
ò Computing methodologies ? Natural language processing;
ò General and reference ? Metrics.

Keywords
Evaluation; Contamination sensitivity; Score confidence; Large lan-
guage models

ACM Reference Format:
Yiliang Song, Hongjun An, Jiangan Chen, Xuanchen Yan, Huan Song, Ji-
awei Shao, and Xuelong Li. 2018. Silicon Bureaucracy and AI Test-Oriented
Education: Contamination Sensitivity and Score Confidence in LLM Bench-
marks. In Proceedings of Make sure to enter the correct conference title from
your rights confirmation email (Conference acronym ÆXX). ACM, New York,
NY, USA, 12 pages. https://doi.org/XXXXXXX.XXXXXXX

1 Introduction
The development of large language models (LLMs) is increasingly
organized around the scores, rankings, and leaderboards produced
by public benchmarks [2, 4, 8, 13, 18, 20, 21, 23, 27]. In academia,
industry, and the broader public sphere, benchmark scores are
no longer merely technical indicators for research communication
[1, 12, 25]. They have gradually become evaluative criteria with real
institutional consequences: models are examined, ranked, filtered,
and treated as reference objects in procurement, investment, and
governance decisions [1, 5, 17, 25]. In this sense, benchmarks have
shifted from research tools to institutionalized examination and
selection devices [5, 7, 17]. The ranking, certification, and compari-
son logic built around them reflects a pattern that deserves critical
reflection, namely, Silicon Bureaucracy and AI Test-Oriented Edu-
cation.

Yet this institutionalized mode of evaluation rests on a strong
assumption: a high benchmark score reliably indicates stronger and
more genuine generalization ability [5, 10, 25]. This paper argues
that the assumption is not robust [1, 5, 24]. Current LLM bench-
marks often measure not one pure notion of ôtrue generalization,ö
but a mixture of two qualitatively different capacities [5, 17]. One is

exam-oriented competence: under fixed answering formats, inputû
output conventions, and judging rules, the model can produce the
correct answer [1, 17]. The other is the ability that remains after con-
tamination and semantic leakage are excluded as much as possible,
namely principled understanding and transfer to genuinely unseen
tasks [10, 24, 29]. The former is closer to ôcan it answer,ö while the
latter is closer to ôcan it truly generalizeö [5, 10]. In practice, how-
ever, many benchmarks compress both into a single score and then
treat that score as a proxy for overall capability [1, 5, 12, 15, 28].

A central reason why this interpretation is unstable is that
benchmark-related information is extremely difficult to remove
from the training pipeline [9, 16, 24]. LLM training data are massive
and heterogeneous [16, 24], and after repeated crawling, cleaning,
distillation, synthesis, and alignment, it is hard to guarantee that
benchmark questions, answers, or closely related variants never
entered training [9, 16]. Exact deduplication may still miss para-
phrases, solution fragments, discussions, distilled samples, or syn-
thetic variants that remain semantically close to the originals [9, 24].
Post-training blocking of original questions or keywords may also
fail to prevent semantically neighboring inputs or the indirect acti-
vation created by aggregating partial clues [9, 16]. The benchmark
problem, therefore, is not only whether exact test items appeared
in training, but also whether the model encountered generalized
information sufficient to point toward the correct answer [9, 24].
Moreover, because leaderboard competition, promotion, and se-
lection increasingly depend on benchmark performance, model
development may contain latent incentives to optimize for exam
success [1, 17]. This further blurs the boundary between optimizing
for benchmark performance and optimizing for genuine generaliza-
tion [5, 17]. As a result, a high score may reflect not only stronger
true generalization, but also stronger exploitation of contamination-
related signals [9, 24].

Motivated by these concerns, this paper proposes an audit frame-
work for interpreting benchmark scores and assessing their credi-
bility [6, 19, 22, 25]. Rather than asking only which model scores
higher, we ask whether performance shows an anomalous pattern
when the information in a problem is systematically deleted, rewrit-
ten, and perturbed with noise. To study this, we model a single
system as upstream routers and a downstream worker. Under a
clean control condition, routers transmit the original problem as
completely as possible; under noisy conditions, they delete, rewrite,
and perturb it, and the aggregated outputs are then sent to the
worker. If a benchmark is genuinely clean, performance under noisy
conditions should at most approach the clean-control baseline, but
should not persistently or systematically exceed it. Once a stable
above-baseline phenomenon appears, a more plausible explanation
is not that noise makes the model stronger, but that deleted, rewrit-
ten, and aggregated information has reassembled into cues capable
of reactivating contamination-related memory traces [9, 24]. In this
way, we transform the question of ôwhat benchmark scores actually
measureö into an audit problem that can be computed, compared,
and used for model evaluation and selection [6, 22, 25].

The contributions of this paper are threefold. First, we reinter-
pret LLM benchmarks from the perspective of institutionalized
examination and selection, and propose the framework of Silicon
Bureaucracy and AI Test-Oriented Education. Second, we introduce
a routerûworker-based audit method that identifies sensitivity to

Silicon Bureaucracy and AI Test-Oriented Education:
Contamination Sensitivity and Score Confidence in LLM Benchmarks

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

potential contamination cues by comparing deviations between
clean-control and noisy conditions, especially above-baseline gains
that should not systematically occur in theory. Third, across multi-
ple models, we show that such anomalous gains are widespread but
heterogeneous, implying that even similar benchmark scores may
differ substantially in credibility. Accordingly, we do not claim that
benchmarks are entirely invalid; rather, we argue that benchmark
scores in the LLM era should be reinterpreted and supplemented
with explicit credibility auditing.

2 Related Work
The problem addressed in this paper lies at the intersection of three
lines of research: one focuses on LLM benchmarks and leaderboard-
based evaluation, another on data contamination, deduplication,
and benchmark leakage, and the third on model stability and se-
lectability under different protocols and interaction conditions
[1, 9, 22, 31]. Relative to these lines of work, our goal is not simply
to identify whether a particular benchmark has been leaked, nor
to revisit the familiar question of which model has higher aver-
age performance. Rather, we seek to reconsider the meaning of
benchmark scores themselves: once benchmarks have evolved into
institutionalized examination and selection devices, what exactly
do these scores measure, and how credible are they as indicators of
genuine generalization ability [5, 6, 25]?

2.1 LLM Benchmarks and Leaderboard-Based

Evaluation

As competition over LLM capability intensifies, benchmarks have
gradually evolved from shared measurement tools among researchers
into ranking tools, publicity tools, and practical bases for deploy-
ment decisions [4, 7, 8, 11, 13, 23, 26, 30]. Whether a model enters
the top tier of a leaderboard affects not only academic reputation,
but also product comparison, user perception, investment judgment,
and actual procurement decisions [1, 12, 25]. In this process, bench-
marks are no longer merely neutral technical measuring instru-
ments; they increasingly take on institutional functions [5, 7, 17].
Scores resemble rΘsumΘs, leaderboards resemble performance re-
view tables, and high-scoring models are more likely to obtain
the status of being seen as ôadvanced,ö ôreliable,ö or ôdeployableö
[1, 25]. Existing research and practice have paid more attention
to how benchmarks can be used to quickly compare models, but
have paid less attention to whether the scores on which such in-
stitutionalized comparisons rely are themselves equally credible
[5, 14, 19, 25]. It is precisely at this point that this paper takes a
further step: our concern is not whether benchmarks are useful, but
how benchmark scores should be reinterpreted once benchmarks
have become institutionalized examination devices [5, 17].

2.2 Data Contamination, Deduplication, and

Benchmark Leakage

Research on benchmark contamination has mainly discussed ex-
act question leakage, near-duplicates, trainûtest overlap, and the
evaluation biases that follow from them [9, 16, 24]. Related work
usually emphasizes deduplication, filtering, and cleaning of training
corpora as important means of preventing benchmark contamina-
tion [9, 16]. However, this paper argues that exact deduplication

does not imply the disappearance of contamination [9, 24]. Even if
the original benchmark questions themselves are removed, para-
phrased texts that are semantically close to the originals, solution
fragments, discussion records, distilled samples, or synthetic data
may still remain in the training pipeline in the form of generalized
information, and may still indirectly point toward the correct an-
swer at evaluation time [9, 16, 24]. Furthermore, if post-training
interventions only attempt to block original questions, reference
answers, or keywords, they may still fail to block rewritten inputs
or to prevent the reactivation of related memory traces after mul-
tiple partial clues are aggregated together [9, 16]. Therefore, the
benchmark problem should not be understood merely as whether
the exact original questions entered the training set; it should also
be understood as whether the model has already encountered se-
mantically neighboring information sufficient to point toward the
correct answer [9, 24]. What this paper emphasizes is precisely
this broader and harder-to-govern form of contamination, which
extends beyond exact question leakage [9, 24].

2.3 Stability Evaluation, CreditAudit, and the

Interpretation of Scores

Beyond contamination research, recent work has also begun to
recognize that model selection cannot rely on a single average
score alone, but must also consider model stability across different
interaction protocols, prompt templates, and task organizations
[3, 4, 22, 31]. Research represented by CreditAudit[22] argues that
model evaluation in engineering settings is not only about which
model has higher average ability, but also about which model re-
mains more stable under institutionalized calling conditions. This
perspective directly informs the present paper. The difference is that
CreditAudit is more concerned with a modelÆs sensitivity to pro-
tocol and scenario variation, that is, protocol sensitivity, whereas
this paper further asks about the sensitivity of benchmark scores
to potential contamination cues, that is, contamination sensitivity
[3, 22]. Put differently, the former is more concerned with whether
a model is stable, whereas this paper is further concerned with
whether its benchmark score is trustworthy [6, 22]. Even when
two models obtain similar benchmark scores, those scores do not
necessarily have the same degree of credibility [3, 6, 22]. Accord-
ingly, model evaluation should not stop at comparing score levels
alone; it should also ask to what extent those scores may have been
influenced by contamination-related cues [6, 9, 22].

3 Methodology and Hypotheses
This section formalizes benchmark scores as empirical performance
under an observed distribution and studies the conditions under
which such scores can be interpreted as indicators of genuine gen-
eralization. We define benchmark score, score confidence, and con-
tamination sensitivity; introduce a routerûworker mechanism; and
derive the theoretical judgment that, in contamination-free settings,
noisy aggregation should not systematically outperform the clean
baseline.

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

Trovato et al.

3.1 Conceptual Framework
Let Q denote the question space, A the answer space, and B? =
{(??, ?? )}?

?=1 ? Q ╫ A a benchmark sample. For model ? , define

?? (? ) = 1{ ê?? (?? ) = ?? },
?
??

ê?? (? ) =

?? (? ).

1
?

?=1

(1)

and let the corresponding population score under the benchmark
distribution ?? be

?

?? (? ) =

Q╫ A

1{ ê?? (?) = ?} ??? (?, ?).

(2)

and the worker answers only on the basis of ??:

ê??,?
?

(?) = ?? (??),

? ?,? (?, ?; ? ) = 1{ ê??,?

(?) = ?},

(8)

ê? ?,?
?

(? ) =

? ?,? (??, ?? ; ? ).

?
?
??

1
?

?=1
The score deviation of the noisy condition relative to the clean

baseline is

?? (? ) = ê? ?,?
? (? ),
? +
? (? ) = max{?? (? ), 0}.
Whenever ?? (? ) > 0, the model is said to exhibit an above-baseline
anomaly under router count ?.

(? ) ? ê??

(9)

?

Let ?0 denote an idealized target distribution under which benchmark-
related contamination has been excluded as much as possible. Then
the modelÆs contamination-reduced ability is

3.3 Theoretical Judgment
Let ? (?) denote information unrelated to the correct answer. A
noisy router output can be abstractly written as

?

?0 (? ) =

Q╫ A
?(? ) = ?? (? ) ? ?0 (? ).

1{ ê?? (?) = ?} ??0 (?, ?),

(3)

? = ? ? (? (?)) ? ? ?,

? ?
? ? (? (?)) ? ? (?),

? ? ? ? (?) ? ÿ? ? .

(10)

We define score confidence as the credibility of the benchmark score
as an indicator of genuine generalization ability, written abstractly
as

Conf (? ) = ? (|?(? )|),

? ? (╖) < 0.

(4)

Thus, a higher score does not necessarily imply a higher-confidence
score.

We further define contamination sensitivity as the responsive-
ness of model performance to contamination-related cues. Let ? ? 0
denote cue intensity and ?(?, ?) = E[? (? ; ?)] the expected correct-
ness rate. Then

where ? ? (╖) is a deletion operator and ÿ? ? denotes exogenous per-
turbation. Hence the aggregated input received by the worker is
?? ? ?? (?1 (? (?)) ? ?1, . . . , ?? (? (?)) ? ??).
Under contamination-free conditions, let the workerÆs success
probability be ?? (? ) = P(?? (? ) = ? | ?, ?), assumed to be weakly
increasing in effective information and weakly decreasing in ir-
relevant noise. Then noisy aggregation can improve performance
only through cross-router complementarity, while also introducing
extra noise. This yields

(11)

E[? ?,? (?, ?; ? ) | ?, ?] ? E[? ? (?, ?; ? ) | ?, ?] + ?? (?, ? ).

(12)

CS(? ) =

??(?, ?)
??

(cid:12)
(cid:12)
(cid:12)
(cid:12)?=0+

.

(5)

and thus

E[?? (? )] ? »?? (? ),

A larger value indicates that the benchmark score is more likely to
contain non-generalization components.

3.2 RouterûWorker Mechanism
For question ? ? Q, let ? (?) denote its latent task-relevant infor-
mation. Under the clean-baseline condition, a single router ??
? :
Q ? Z transmits the problem as completely as possible, produc-
ing ? ? = ??
? (?). The worker ?? : Z ? A then answers on the
basis of router output only:

? (?) = ?? (??
ê??

? (?)),
? ? (?, ?; ? ) = 1{ ê??
? (?) = ?},
?
??

ê??
? (? ) =

? ? (??, ?? ; ? ).

1
?

?=1

(6)

Under noisy conditions, there are ? parallel routers ??
?,1

?,?.
Each router deletes, rewrites, and perturbs the original problem,
producing ? ?
?,? (?). Their outputs are aggregated by ?? :
Z? ? T into

? = ??

, . . . , ??

?? = ?? (? ?
1

, . . . , ? ?

?),

(7)

?

»?? (? ) =

?? (?, ? ) ??? (?, ?).

(13)

If the clean baseline is already close to full-information transmission,
»?? (? ) should be small. In that case, noisy conditions may fluctuate
around the baseline, but they should not systematically exceed it.
Now let ?(?) denote a latent set of benchmark-related contam-
ination cues, including paraphrased variants, solution fragments,
discussion texts, distilled samples, synthetic variants, or semanti-
cally neighboring expressions that remain reachable even after local
post-training blocking. If the overlap between aggregated text and
contamination cues is measured by ? (??, ?(?)), then the workerÆs
success probability may be written as

?? (??, ?(?)) = ? 0

? (??) + ?? (? (??, ?(?))),
(14)
As ? increases, partial clues from different noisy routers may accu-
mulate, increasing ? (??, ?(?)). Then

? ?
? (╖) ? 0.

E[? ?,? (?, ?; ? ) | ?, ?] > E[? ? (?, ?; ? ) | ?, ?]

(15)

may hold for a nontrivial subset of questions, so that persistent
positive ?? (? ) is more naturally interpreted as an external signal
of contamination-related memory activation than as an ordinary
noise effect.

Silicon Bureaucracy and AI Test-Oriented Education:
Contamination Sensitivity and Score Confidence in LLM Benchmarks

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

3.4 Hypotheses
H1. Contamination activation hypothesis. If benchmark-related
semantic-neighbor contamination exists during training, or if post-
training interventions only block original benchmark items locally,
then multi-router noisy aggregation is more likely to activate gen-
eralized memory related to the benchmark, thereby generating
above-baseline anomalies under some router settings.

H2. Heterogeneous sensitivity hypothesis. Different mod-
els differ in their sensitivity to potential contamination cues. As a
result, even when their benchmark scores are similar, the magni-
tude of anomalous gains and the breadth of violations may differ
substantially.

H3. Directional transition hypothesis. If above-baseline anom-
alies are driven by contamination-related memory activation rather
than random fluctuation, then as the number of noisy routers in-
creases, wrong-to-correct transitions should rise, correct-to-wrong
transitions should decline correspondingly, and the former should
eventually exceed the latter.

4 Experimental Design
This section explains how the theoretical framework is translated
into a reproducible and interpretable audit procedure. The empha-
sis is not on engineering complexity, but on constructing a clear
comparison regime: under the same questions, the same models,
and the same answering constraints, we compare the clean baseline
with noisy conditions and use the resulting deviations to assess how
sensitive benchmark scores are to potential contamination-related
cues.

4.1 Dataset and Sample Construction
We conduct the experiments on a public benchmark consisting of
multiple-choice test questions. From the test split, we draw a fixed
sample of ? = 100 questions, with the random seed set to 42. All
models and all clean/noisy conditions are evaluated on exactly the
same question set. This design removes additional variation caused
by sampling differences across runs. In other words, the experi-
ment follows a same-question matched comparison rather than
a comparison across different question sets, so that the observed
score deviations can be more directly attributed to changes in the
information transmission regime.

4.2 Models and Experimental Settings
The audit is repeated across multiple mainstream large language
models. By default, the router and the worker are instantiated with
the same model, so that model heterogeneity does not enter the
transmission process itself. The clean baseline is defined as the
setting forward_full with ? = 1, that is, a single router is used
and is instructed to transmit the original problem information as
completely as possible. The noisy conditions are defined as the
setting noisy_rewrite with ? ? {1, 2, . . . , ? }, where ? denotes
the number of parallel noisy routers. The role of router count is
not to test whether more agents make a model stronger; rather,
it serves as a control over the intensity of cue aggregation. As ?
increases, more locally deleted, rewritten, and perturbed versions
of the same problem are aggregated together, making it more likely

that benchmark-related semantic-neighbor cues are reassembled in
the final input to the worker.

4.3 Prompting and Answering Constraints
Under the clean-baseline condition, the router is instructed to pre-
serve the original problem as fully and accurately as possible, in-
cluding the question stem, options, and relevant constraints, while
not directly outputting the final answer. Under noisy conditions,
each router is instructed to delete part of the useful information,
rewrite the problem, and inject irrelevant noise. The outputs of mul-
tiple noisy routers are then aggregated and passed to the worker.
In both conditions, the worker is not allowed to access the original
question directly and must answer only on the basis of router out-
puts. The worker is also constrained to return a single option letter
as the final answer. In this way, the difference between the clean
and noisy conditions is restricted to the transmission regime itself,
rather than to changes in answering rules or evaluation criteria.

4.4 Evaluation Metrics
Let the clean-baseline accuracy be the reference performance and
the noisy-condition accuracy be the comparison performance. Their
difference is defined as

gain = noisy accuracy ? clean baseline.

Whenever gain > 0, the noisy condition outperforms the clean
baseline. To isolate only the above-baseline component, we further
define

positive excess = max(gain, 0).

A noisy setting is counted as a violation whenever gain > 0. For a
given model, the number of noisy settings under which violations
occur defines its violation breadth, which summarizes how broadly
the modelÆs benchmark score is affected by potential contamination-
related cues.

In addition to score-level metrics, we examine question-level
transition directions. If a question is answered incorrectly under the
clean baseline but correctly under a noisy condition, it is counted as
an improve transition (wrong?correct). If a question is answered
correctly under the clean baseline but incorrectly under a noisy
condition, it is counted as a degrade transition (correct?wrong).
These transition metrics help distinguish whether above-baseline
anomalies are more consistent with random fluctuation or with a
directional process in which noisy aggregation systematically helps
recover benchmark answers.

5 Results and Analysis
This section evaluates the three hypotheses developed above. The
empirical logic proceeds in three steps. We first examine whether
noisy conditions genuinely produce above-baseline anomalies rela-
tive to the clean baseline. We then study whether such anomalies
are heterogeneous across models. Finally, we move to question-
level transition patterns to assess whether the observed gains are
better understood as random fluctuation or as a directional process
in which noisy aggregation systematically improves outcomes.

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

Trovato et al.

Figure 2: Overall violation pattern across router settings.

5.1 Overall violations: do noisy conditions

really exceed the baseline?

Figure 2 shows the overall deviation of model performance from
the clean baseline under different noisy-router settings. At the
aggregate level, above-baseline anomalies are not isolated outliers.
As the number of noisy routers increases from 1 to 9, the number
of models exceeding the clean baseline is 5/12, 4/12, 6/12, 7/12, 7/12,
7/12, 8/12, 10/12, and 8/12, respectively. The highest violation count
occurs at ? = 8, where 10 out of 12 models rise above the baseline.
The mean positive excess also becomes more pronounced in higher-
router regions, reaching 0.066 at ? = 8 and 0.086 at ? = 9, the
largest value across all settings.The complete router-level summary
statistics are reported in Appendix Table 3.

These results support Hypothesis 1. If the clean baseline cor-
responds to the regime closest to full-information transmission,
then noisy conditions should at most fluctuate around that baseline
rather than persistently exceed it. The key pattern in Figure 2 is
therefore not that ômore routers make models stronger,ö but that
higher-router settings make above-baseline anomalies both more
frequent and more substantial. This is consistent with the theo-
retical argument that deleted, rewritten, and perturbed fragments
may be recombined into semantic-neighbor cues that reactivate
benchmark-related memory traces.

5.2 Model heterogeneity: models differ in the
probability and magnitude of anomalous
gains

Figure 3 plots model-specific performance trajectories relative to the
clean baseline under different noisy-router settings. The anomalous-
gain pattern is clearly heterogeneous across models rather than
uniformly distributed. Some models exceed the baseline under al-
most all noisy settings. For example, Qwen3-Next-80B violates the
baseline in all 9 router settings, while Seed-2.0-Lite does so in 8 out
of 9. By contrast, DeepSeek-Chat exceeds the baseline only once,
and Qwen3.5-122B does so only twice.

The breadth and strength of anomalies are also not identical.
Llama-3.1-8B and Llama-3.3-70B both violate the baseline in 7 out
of 9 settings, indicating relatively broad exposure. By contrast,
Qwen3.5-35B violates the baseline in only 5 settings but reaches a
maximum positive excess of 0.260, the highest among all models.
Qwen3-Next-80B displays a different pattern: violations occur in
all 9 settings, but the maximum jump is smaller. This suggests that
contamination sensitivity has at least two dimensions: how often a
model crosses the baseline, and how far above the baseline it moves
once it does so.

These results support Hypothesis 2. Even when models obtain
similar benchmark scores, their sensitivity to contamination-related
cues may differ substantially. Model comparison should therefore
not stop at score levels alone, but should also consider whether

123456789Noisy router count0.40.30.20.10.00.10.20.30.4Gain over clean baseline(noisy accuracy - baseline accuracy)5/124/126/127/127/127/128/1210/128/12Above 0 = noisy score exceeds clean baselineTop labels = violating models / total modelsOverall violation pattern across router settingsAt or below baselineAbove baselineMean positive excessSilicon Bureaucracy and AI Test-Oriented Education:
Contamination Sensitivity and Score Confidence in LLM Benchmarks

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

Figure 3: Per-model noisy scores relative to the clean baseline.

those scores are equally credible. For space reasons, the compressed
model-level summary is deferred to the appendix: Appendix Fig-
ure 5 visualizes violation breadth across models, Appendix Table 1
reports the corresponding model-level summary statistics, and Ap-
pendix Table 2 provides the full model-by-router breakdown.

5.3 Question-level mechanism: random

fluctuation or directional improvement?
Figure 4 examines transition directions at the question level. Here,
improve denotes a wrong?correct transition, that is, a question

123456789Noisy router count0.00.10.20.30.4Accuracyqwen/qwen3.5-35b-a3b123456789Noisy router count0.150.200.250.300.350.400.45Accuracymeta-llama/llama-3.1-8b-instruct123456789Noisy router count0.300.350.400.450.500.550.600.65Accuracyqwen/qwen3-8b123456789Noisy router count0.00.10.20.30.40.5Accuracyqwen/qwen3.5-122b-a10b123456789Noisy router count0.250.300.350.400.450.500.550.60Accuracymeta-llama/llama-3.3-70b-instruct123456789Noisy router count0.450.500.550.600.65Accuracydeepseek/deepseek-v3.2123456789Noisy router count0.480.500.520.540.560.580.600.620.64Accuracyqwen/qwen3-next-80b-a3b-instruct123456789Noisy router count0.3500.3750.4000.4250.4500.4750.5000.525Accuracyqwen/qwen3-30b-a3b-instruct-2507123456789Noisy router count0.700.720.740.760.780.800.820.84Accuracybytedance-seed/seed-2.0-lite123456789Noisy router count0.120.140.160.180.200.220.240.260.28Accuracymeta-llama/llama-3.2-3b-instruct123456789Noisy router count0.300.350.400.450.500.55Accuracydeepseek/deepseek-chat123456789Noisy router count0.6000.6250.6500.6750.7000.7250.750Accuracybytedance-seed/seed-1.6-flashPer-model noisy scores relative to the clean baselineConference acronym ÆXX, June 03û05, 2018, Woodstock, NY

Trovato et al.

Figure 4: Question-level transition pattern: improve vs. degrade.

answered incorrectly under the clean baseline but correctly under
a noisy condition; degrade denotes a correct?wrong transition.
The figure aggregates these transitions across all models, so the
vertical axis represents the total number of question-level transi-
tions rather than the number of questions for any single model.The
figure aggregates these transitions across all models, so the vertical
axis represents the total number of question-level transitions rather
than the number of questions for any single model.

The improve and degrade curves are not strictly monotonic at
every router count, but their overall movement is clearly directional.
As the number of noisy routers increases from 1 to 9, improve rises
from 112 to 180, whereas degrade falls from 150 to 116. More impor-
tantly, their relative ordering reverses in higher-router regions. At
? = 1, improve is 38 cases lower than degrade; by ? = 5, the two are
nearly balanced (137 versus 135); and by ? = 8 and ? = 9, improve
reaches 150 and 180, clearly exceeding degrade at 110 and 116. In
other words, as noisy routers accumulate, the question-level pat-
tern shifts from ômore degraded than improvedö to ômore improved
than degraded.ö

This evidence is consistent with Hypothesis 3. The claim is not
that every additional router mechanically raises improve and lowers
degrade at each single point, but that the overall trend increasingly
favors wrong?correct transitions as router count grows, especially
in higher-router conditions. This directional reversal suggests that
noisy aggregation does not merely destroy information. It can also

reconstruct semantically related cues that help recover benchmark
answers, thereby turning previously incorrect responses into cor-
rect ones. The above-baseline anomaly is therefore reflected not
only in score-level deviations but also in a question-level process
of directional improvement.

6 Conclusion and Discussion
This paper develops an audit framework for interpreting benchmark
scores through the lens of contamination sensitivity and score con-
fidence in LLM evaluation. The empirical results reveal a coherent
pattern across three levels. At the aggregate level, above-baseline
anomalies under noisy conditions are not isolated exceptions but
recur across multiple router settings. At the model level, the breadth
of violations and the magnitude of positive excess differ substan-
tially across models, indicating that benchmark scores vary in how
sensitive they are to potential contamination-related cues. At the
question level, as the number of noisy routers increases, wrong-to-
correct transitions tend to rise, correct-to-wrong transitions tend to
fall, and the former eventually exceeds the latter in higher-router
conditions. Taken together, these findings suggest that benchmark
scores are not merely straightforward records of answer correct-
ness. They may also contain a nontrivial component related to how
responsive a model is to benchmark-related semantic-neighbor in-
formation. A high score, therefore, does not necessarily imply a
high-confidence score, and even models with similar benchmark

123456789Noisy router count0255075100125150175200Number of question-level transitionsQuestion-level transition pattern: improve vs degradeImprove trendDegrade trendImprove count (wrong  correct)Degrade count (correct  wrong)Silicon Bureaucracy and AI Test-Oriented Education:
Contamination Sensitivity and Score Confidence in LLM Benchmarks

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

performance may differ substantially in how credibly their scores
represent genuine generalization ability.

The broader implication is conceptual as much as empirical.
Current benchmark practice often compresses two qualitatively dif-
ferent capacities into a single numerical score. One is exam-oriented
competence, that is, the ability to produce correct answers under
fixed answer formats, inputûoutput conventions, and judging rules.
The other is principled capability, namely, the ability that remains
after contamination and semantic leakage are excluded as much as
possible. In practice, these two capacities are often treated as if they
were the same thing. Our results suggest that this interpretation is
too coarse. Benchmark performance should not automatically be
read as a direct measure of genuine generalization, because part
of what is being captured may reflect sensitivity to contamination-
related cues rather than purely contamination-free capability. This
is precisely why the problem of benchmark evaluation in the LLM
era is not exhausted by asking which model scores higher; it must
also include the question of what that score is actually measuring.
These findings do not imply that benchmarks are entirely in-
valid. For LLMs, the ability to retrieve and output the correct answer
within an institutionalized answering structure is itself a real and
practically relevant form of competence. In many applied settings,
such competence has operational value, since real deployment en-
vironments often involve standardized prompts, constrained out-
put formats, and repeated evaluation procedures. The problem,
therefore, is not the existence of benchmark-based examinations
themselves. Rather, the problem is the tendency to interpret insti-
tutional success within such examinations as direct evidence of
pure generalization ability. In this sense, the core issue of Silicon
Bureaucracy and AI Test-Oriented Education is not that models
are being examined, but that examination outcomes are too easily
treated as the whole of capability. Our argument is accordingly not
to reject benchmarks, but to reinterpret them more carefully and
to distinguish between score level and score credibility.

Recognizing this problem is not merely of theoretical interest; it
is also useful and necessary in practice. Once contamination sen-
sitivity is treated as an audit target, the framework proposed in
this paper can be used as a practical diagnostic tool for benchmark
governance. For model developers, especially frontier laborato-
ries and commercial providers that continually update and retrain
their models, a routerûworker style audit can serve as an internal
self-check during model iteration. Before releasing a new version,
developers can test whether benchmark gains remain stable under
deletion, rewriting, and perturbation, or whether part of the im-
provement is disproportionately driven by contamination-related
semantic-neighbor cues. In this way, the framework can help distin-
guish genuine capability growth from score inflation that is overly
dependent on benchmark familiarity.

The same logic is useful from the user side. For downstream
users choosing among models with similar benchmark scores, raw
score comparison alone may be insufficient. A model with a slightly
lower score but weaker contamination sensitivity may in fact be
more trustworthy than a model with a slightly higher score but
stronger above-baseline anomalies under noisy conditions. The
framework therefore provides a practical way to compare the cred-
ibility of seemingly similar scores and to support model selection
in settings where reliability matters more than leaderboard optics.

More generally, evaluation should move from a one-dimensional
logic of ôwho scores higherö toward a two-dimensional logic that
asks both ôhow high is the scoreö and ôhow credible is the score as
evidence of genuine capability.ö

Public benchmarks have already become institutionalized exami-
nation and selection devices in the LLM ecosystem. Under such con-
ditions, the meaning of a score can no longer be taken for granted. A
benchmark score should not be treated as self-explanatory, because
what it measures may be a mixture of exam-oriented competence
and contamination-sensitive performance. Once this distinction
is made explicit, benchmark evaluation no longer ends with the
leaderboard. It must be supplemented by auditing procedures that
clarify what part of the observed score is likely to reflect robust
capability and what part may be entangled with benchmark-related
semantic familiarity.

In sum, this paper argues that benchmark scores in the LLM era
should be treated neither as meaningless nor as self-sufficient. They
remain useful, but they are not transparent windows into genuine
generalization. Once public benchmarks have become institution-
alized examination and selection devices, the meaning of a score
requires reinterpretation, and the use of a score requires additional
auditing.

References
[1] Norah Alzahrani, Hisham Alyahya, Yazeed Alnumay, Sultan AlRashed, Shaykhah
Alsubaie, Yousef Almushayqih, Faisal Mirza, Nouf Alotaibi, Nora Al-Twairesh,
Areeb Alowisheq, M Saiful Bari, and Haidar Khan. 2024. When Benchmarks
are Targets: Revealing the Sensitivity of Large Language Model Leaderboards.
In Proceedings of the 62nd Annual Meeting of the Association for Computational
Linguistics (Volume 1: Long Papers). Association for Computational Linguistics,
Bangkok, Thailand, 13787û13805.

[2] Hongjun An, Wenhan Hu, Sida Huang, Siqi Huang, Ruanjun Li, Yuanzhi Liang,
Jiawei Shao, Yiliang Song, Zihan Wang, Cheng Yuan, Chi Zhang, Hongyuan
Zhang, Wenhao Zhuang, and Xuelong Li. 2026. AI Flow: Perspectives, Scenarios,
and Approaches. Vicinagearth 3 (2026), 1.

[3] Hongjun An, Yiliang Song, Jiangan Chen, Jiawei Shao, Chi Zhang, and Xuelong
Li. 2026. Are LLMs Vulnerable to Preference-Undermining Attacks (PUA)? A
Factorial Analysis Methodology for Diagnosing the Trade-off between Preference
Alignment and Real-World Validity. arXiv:2601.06596

[4] Ge Bai, Jie Liu, Xingyuan Bu, Yancheng He, Jiaheng Liu, Zhanhui Zhou, Zhuoran
Lin, Wenbo Su, Tiezheng Ge, Bo Zheng, and Wanli Ouyang. 2024. MT-Bench-101:
A Fine-Grained Benchmark for Evaluating Large Language Models in Multi-
Turn Dialogues. In Proceedings of the 62nd Annual Meeting of the Association for
Computational Linguistics (Volume 1: Long Papers). Association for Computational
Linguistics, Bangkok, Thailand, 7421û7454.

[5] Andrew M. Bean, Ryan Othniel Kearns, Angelika Romanou, Franziska Sofia
Hafner, Harry Mayne, Jan Batzner, Negar Foroutan, Chris Schmitz, Karolina
Korgul, Hunar Batra, Oishi Deb, Emma Beharry, Cornelius Emde, Thomas Fos-
ter, Anna Gausen, Marφa Grandury, Simeng Han, Valentin Hofmann, Lujain
Ibrahim, Hazel Kim, Hannah Rose Kirk, Fangru Lin, Gabrielle Kaili-May Liu,
Lennart Luettgau, Jabez Magomere, Jonathan Rystr°m, Anna Sotnikova, Yushi
Yang, Yilun Zhao, Adel Bibi, Antoine Bosselut, Ronald Clark, Arman Cohan,
Jakob Foerster, Yarin Gal, Scott A. Hale, Inioluwa Deborah Raji, Christopher
Summerfield, Philip H. S. Torr, Cozmin Ududec, Luc Rocher, and Adam Mahdi.
2025. Measuring what Matters: Construct Validity in Large Language Model
Benchmarks. arXiv:2511.04703

[6] Dylan Bouchard, Mohit Singh Chauhan, David Skarbrevik, Ho-Kyeong Ra, Viren
Bajaj, and Zeya Ahmad. 2026. UQLM: A Python Package for Uncertainty Quan-
tification in Large Language Models. Journal of Machine Learning Research 27,
13 (2026), 1û10.

[7] Center for AI Safety, Scale AI, and HLE Contributors Consortium. 2026. A
benchmark of expert-level academic questions to assess AI capabilities. Nature
649 (2026), 1139û1146.

[8] Jiawei Chen, Hongyu Lin, Xianpei Han, and Le Sun. 2024. Benchmarking Large
Language Models in Retrieval-Augmented Generation. Proceedings of the AAAI
Conference on Artificial Intelligence 38, 16 (2024), 17754û17762.

[9] Jasper Dekoninck, Mark Niklas Mⁿller, and Martin Vechev. 2024. ConStat:
Performance-Based Contamination Detection in Large Language Models. In
Advances in Neural Information Processing Systems 37.

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

Trovato et al.

[10] Shulin Huang, Linyi Yang, Yan Song, Shuang Chen, Leyang Cui, Ziyu Wan,
Qingcheng Zeng, Ying Wen, Kun Shao, Weinan Zhang, Jun Wang, and Yue
Zhang. 2025. ThinkBench: Dynamic Out-of-Distribution Evaluation for Robust
LLM Reasoning. arXiv:2502.16268

[11] Zhongzhan Huang, Guoming Ling, Shanshan Zhong, Hefeng Wu, and Liang Lin.
2025. MiniLongBench: The Low-cost Long Context Understanding Benchmark
for Large Language Models. In Proceedings of the 63rd Annual Meeting of the
Association for Computational Linguistics (Volume 1: Long Papers). Association
for Computational Linguistics, Vienna, Austria, 11442û11460.

[12] Shreya Johri, Jaehwan Jeong, Benjamin A. Tran, Daniel I. Schlessinger, Shan-
non Wongvibulsin, Leandra A. Barnes, Hong-Yu Zhou, Zhuo Ran Cai, Eliezer M.
Van Allen, David Kim, Roxana Daneshjou, and Pranav Rajpurkar. 2025. An eval-
uation framework for clinical use of large language models in patient interaction
tasks. Nature Medicine 31 (2025), 77û86.

[13] Wai-Chung Kwan, Xingshan Zeng, Yufei Wang, Yusen Sun, Liangyou Li, Yuxin
Jiang, Lifeng Shang, Qun Liu, and Kam-Fai Wong. 2024. M4LE: A Multi-Ability
Multi-Range Multi-Task Multi-Domain Long-Context Evaluation Benchmark
for Large Language Models. In Proceedings of the 62nd Annual Meeting of the
Association for Computational Linguistics (Volume 1: Long Papers). Association
for Computational Linguistics, Bangkok, Thailand, 15568û15592.

[14] Xiang Li, Yunshi Lan, and Chao Yang. 2025. TreeEval: Benchmark-Free Evaluation
of Large Language Models through Tree Planning. Proceedings of the AAAI
Conference on Artificial Intelligence 39, 23 (2025), 24485û24493.

[15] Jiawei Liu, Chunqiu Steven Xia, Yuyao Wang, and Lingming Zhang. 2023. Is Your
Code Generated by ChatGPT Really Correct? Rigorous Evaluation of Large Lan-
guage Models for Code Generation. In Advances in Neural Information Processing
Systems 36.

[16] Shiwen Ni, Xiangtao Kong, Chengming Li, Xiping Hu, Ruifeng Xu, Jia Zhu, and
Min Yang. 2025. Training on the Benchmark Is Not All You Need. Proceedings of
the AAAI Conference on Artificial Intelligence 39, 23 (2025), 24948û24956.
[17] Thao Pham. 2025. Truth Behind the Scene: Designing Evaluations Benchmarks to
Assess LLMsÆ Task-Specific Understanding over Test-Taking Strategies. Proceed-
ings of the AAAI Conference on Artificial Intelligence 39, 28 (2025), 29596û29598.
[18] Jiawei Shao and Xuelong Li. 2025. AI Flow at the Network Edge. IEEE Network

(2025).

[19] Anna Sokol, Elizabeth Daly, Michael Hind, David Piorkowski, Xiangliang Zhang,
Nuno Moniz, and Nitesh V. Chawla. 2024. BenchmarkCards: Standardized Docu-
mentation for Large Language Model Benchmarks. arXiv:2410.12974

[20] Huan Song, Shuyu Tian, Junyi Hao, Minxiu Xu, Hongjun An, Yiliang Song,
Jiawei Shao, and Xuelong Li. 2026. Ruyi2 Technical Report. arXiv preprint
arXiv:2602.22543 (2026).

[21] Huan Song, Qingfei Zhao, Ting Long, Shuyu Tian, Hongjun An, Jiawei Shao,
and Xuelong Li. 2025. Theoretical foundations of scaling law in familial models.
arXiv preprint arXiv:2512.23407 (2025).

[22] Yiliang Song, Hongjun An, Jiangong Xiao, Haofei Zhao, Jiawei Shao, and Xue-
long Li. 2026. CreditAudit: 2D Auditing for LLM Evaluation and Selection.
arXiv:2602.02515

[23] Liangtai Sun, Yang Han, Zihan Zhao, Da Ma, Zhennan Shen, Baocai Chen, Lu
Chen, and Kai Yu. 2024. SciEval: A Multi-Level Large Language Model Evalua-
tion Benchmark for Scientific Research. Proceedings of the AAAI Conference on
Artificial Intelligence 38, 17 (2024), 19053û19061.

[24] Yifan Sun, Han Wang, Dongbai Li, Gang Wang, and Huan Zhang. 2025. The
EmperorÆs New Clothes in Benchmarking? A Rigorous Examination of Mitigation
Strategies for LLM Benchmark Data Contamination. In Proceedings of the 42nd
International Conference on Machine Learning (Proceedings of Machine Learning
Research, Vol. 267). PMLR, 57728û57753.

[25] Zhuo Wang, Wen Wu, Guoqing Wang, Guangze Ye, and Zhenxiao Cheng. 2026.
MetaEval: Measuring the Discrimination of Benchmarks for Efficient LLM Evalu-
ation. Proceedings of the AAAI Conference on Artificial Intelligence 40, 40 (2026),
33773û33781.

[26] Junjie Ye, Zhengyin Du, Xuesong Yao, Weijian Lin, Yufei Xu, Zehui Chen, Zaiyuan
Wang, Sining Zhu, Zhiheng Xi, Siyu Yuan, Tao Gui, Qi Zhang, Xuanjing Huang,
and Jiecao Chen. 2025. ToolHop: A Query-Driven Benchmark for Evaluating
Large Language Models in Multi-Hop Tool Use. In Proceedings of the 63rd Annual
Meeting of the Association for Computational Linguistics (Volume 1: Long Papers).
Association for Computational Linguistics, Vienna, Austria, 2995û3021.

[27] Cheng Yuan, Jiawei Shao, and Xuelong Li. 2025. Information Capacity: Evaluating
the Efficiency of Large Language Models via Text Compression. arXiv preprint
arXiv:2511.08066 (2025).

[28] Hugh Zhang, Jeff Da, Dean Lee, Vaughn Robinson, Catherine Wu, Will Song,
Tiffany Zhao, Pranav Raja, Charlotte Zhuang, Dylan Slack, Qin Lyu, Sean
Hendryx, Russell Kaplan, Michele Lunati, and Summer Yue. 2024. A Careful
Examination of Large Language Model Performance on Grade School Arithmetic.
In Advances in Neural Information Processing Systems 37.

[29] Zhehao Zhang, Jiaao Chen, and Diyi Yang. 2024. DARG: Dynamic Evaluation of
Large Language Models via Adaptive Reasoning Graph Evolvement. In Advances
in Neural Information Processing Systems 37.

[30] Yilun Zhao, Weiyuan Chen, Zhijian Xu, Manasi Patwardhan, Chengye Wang,
Yixin Liu, Lovekesh Vig, and Arman Cohan. 2025. AbGen: Evaluating Large
Language Models in Ablation Study Design and Evaluation for Scientific Research.
In Proceedings of the 63rd Annual Meeting of the Association for Computational
Linguistics (Volume 1: Long Papers). Association for Computational Linguistics,
Vienna, Austria, 12479û12491.

[31] Kaijie Zhu, Qinlin Zhao, Hao Chen, Jindong Wang, and Xing Xie. 2024. Prompt-
Bench: A Unified Library for Evaluation of Large Language Models. Journal of
Machine Learning Research 25, 254 (2024), 1û22.

A Technical appendices and supplementary

material

This appendix provides supplementary evidence that complements
the main text at both the model level and the router level. It includes
one additional figure and three additional tables. Together, these
materials provide the full numerical background for the hetero-
geneity patterns discussed in Section 5.2 and the router-level and
question-level transition results discussed in Sections 5.1 and 5.3.
Table 1 reports model-level summary statistics, including viola-

tion breadth and positive-excess measures.

Table 1: Model-level summary of violation breadth and positive excess

Model

Qwen3-Next-80B

Seed-2.0-Lite

Llama-3.1-8B

Llama-3.3-70B

DeepSeek-V3.2

Qwen3.5-35B

Qwen3-30B

Qwen3-8B

Llama-3.2-3B

Seed-1.6-Flash

Qwen3.5-122B

DeepSeek-Chat

Viol.
Count

Viol.
Rate

Max Pos.
Excess

Mean Pos.
Excess

Mean
Gain

9.00/9 1.00

8.00/9 0.89

7.00/9 0.78

7.00/9 0.78

6.00/9 0.67

5.00/9 0.56

5.00/9 0.56

4.00/9 0.44

4.00/9 0.44

4.00/9 0.44

2.00/9 0.22

1.00/9 0.11

0.07

0.05

0.17

0.13

0.08

0.26

0.06

0.16

0.04

0.01

0.15

0.01

0.04

0.03

0.08

0.07

0.05

0.18

0.04

0.11

0.02

0.01

0.13

0.01

0.04

0.02

0.04

0.04

0.03

0.04

0.01

0.02

0.00

?0.02

?0.23

?0.07

Table 2 reports the full model-by-router breakdown underlying

the anomalous-gain patterns discussed in the main text.

Table 2: Model-by-router violation details

Model

Seed-1.6-Flash

Seed-1.6-Flash

Seed-1.6-Flash

Seed-1.6-Flash

Seed-1.6-Flash

Seed-1.6-Flash

Seed-1.6-Flash

Seed-1.6-Flash

Seed-1.6-Flash

Seed-2.0-Lite

Seed-2.0-Lite

Router Clean Noisy Gain Improve Degrade

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

0.71

0.71

0.71

0.71

0.71

0.71

0.71

0.71

0.71

0.75

0.75

0.63 ?0.08

0.65 ?0.06

0.67 ?0.04

0.71

0.72

0.72

0.72

0.72

0.71

0.78

0.78

0.00

0.01

0.01

0.01

0.01

0.00

0.03

0.03

8.00

6.00

8.00

6.00

7.00

6.00

6.00

5.00

6.00

6.00

6.00

16.00

12.00

12.00

6.00

6.00

5.00

5.00

4.00

6.00

3.00

3.00

Continued on next page

Silicon Bureaucracy and AI Test-Oriented Education:
Contamination Sensitivity and Score Confidence in LLM Benchmarks

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

Model

Seed-2.0-Lite

Seed-2.0-Lite

Seed-2.0-Lite

Seed-2.0-Lite

Seed-2.0-Lite

Seed-2.0-Lite

Seed-2.0-Lite

DeepSeek-Chat

DeepSeek-Chat

DeepSeek-Chat

DeepSeek-Chat

DeepSeek-Chat

DeepSeek-Chat

DeepSeek-Chat

DeepSeek-Chat

DeepSeek-Chat

DeepSeek-V3.2

DeepSeek-V3.2

DeepSeek-V3.2

DeepSeek-V3.2

DeepSeek-V3.2

DeepSeek-V3.2

DeepSeek-V3.2

DeepSeek-V3.2

DeepSeek-V3.2

Llama-3.1-8B

Llama-3.1-8B

Llama-3.1-8B

Llama-3.1-8B

Llama-3.1-8B

Llama-3.1-8B

Llama-3.1-8B

Llama-3.1-8B

Llama-3.1-8B

Llama-3.2-3B

Llama-3.2-3B

Llama-3.2-3B

Llama-3.2-3B

Llama-3.2-3B

Llama-3.2-3B

Llama-3.2-3B

Llama-3.2-3B

Llama-3.2-3B

Llama-3.3-70B

Llama-3.3-70B

Table 2: Model-by-router violation details (Continued)

Table 2: Model-by-router violation details (Continued)

Router Clean Noisy Gain Improve Degrade

Model

Router Clean Noisy Gain Improve Degrade

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

0.75

0.75

0.75

0.75

0.75

0.75

0.75

0.52

0.52

0.52

0.52

0.52

0.52

0.52

0.52

0.52

0.55

0.55

0.55

0.55

0.55

0.55

0.55

0.55

0.55

0.26

0.26

0.26

0.26

0.26

0.26

0.26

0.26

0.26

0.20

0.20

0.20

0.20

0.20

0.20

0.20

0.20

0.20

0.42

0.42

0.77

0.76

0.78

0.80

0.77

0.78

0.75

0.02

0.01

0.03

0.05

0.02

0.03

0.00

0.40 ?0.12

0.51 ?0.01

0.49 ?0.03

0.47 ?0.05

0.47 ?0.05

0.41 ?0.11

0.33 ?0.19

0.42 ?0.10

5.00

5.00

4.00

5.00

4.00

5.00

5.00

5.00

10.00

13.00

10.00

9.00

9.00

6.00

7.00

0.53

0.01

11.00

0.47 ?0.08

0.55

0.55

0.56

0.62

0.59

0.61

0.63

0.60

0.00

0.00

0.01

0.07

0.04

0.06

0.08

0.05

0.19 ?0.07

0.27

0.27

0.33

0.01

0.01

0.07

0.20 ?0.06

0.43

0.34

0.35

0.36

0.21

0.20

0.24

0.21

0.17

0.08

0.09

0.10

0.01

0.00

0.04

0.01

0.19 ?0.01

0.19 ?0.01

0.17 ?0.03

0.23

0.03

0.17 ?0.03

0.46

0.42

0.04

0.00

7.00

9.00

11.00

10.00

17.00

14.00

13.00

16.00

13.00

6.00

11.00

17.00

17.00

11.00

21.00

18.00

18.00

17.00

7.00

5.00

10.00

9.00

4.00

7.00

9.00

8.00

8.00

10.00

11.00

3.00

4.00

1.00

0.00

2.00

2.00

5.00

17.00

11.00

16.00

15.00

14.00

20.00

25.00

17.00

10.00

15.00

9.00

11.00

9.00

10.00

10.00

7.00

8.00

8.00

13.00

10.00

16.00

10.00

17.00

4.00

10.00

9.00

7.00

6.00

5.00

6.00

8.00

5.00

8.00

12.00

5.00

11.00

6.00

11.00

Llama-3.3-70B

Llama-3.3-70B

Llama-3.3-70B

Llama-3.3-70B

Llama-3.3-70B

Llama-3.3-70B

Llama-3.3-70B

Qwen3-30B

Qwen3-30B

Qwen3-30B

Qwen3-30B

Qwen3-30B

Qwen3-30B

Qwen3-30B

Qwen3-30B

Qwen3-30B

Qwen3-8B

Qwen3-8B

Qwen3-8B

Qwen3-8B

Qwen3-8B

Qwen3-8B

Qwen3-8B

Qwen3-8B

Qwen3-8B

Qwen3-Next-80B

Qwen3-Next-80B

Qwen3-Next-80B

Qwen3-Next-80B

Qwen3-Next-80B

Qwen3-Next-80B

Qwen3-Next-80B

Qwen3-Next-80B

Qwen3-Next-80B

Qwen3.5-122B

Qwen3.5-122B

Qwen3.5-122B

Qwen3.5-122B

Qwen3.5-122B

Qwen3.5-122B

Qwen3.5-122B

Qwen3.5-122B

Qwen3.5-122B

Qwen3.5-35B

Qwen3.5-35B

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

1.00

2.00

0.42

0.42

0.42

0.42

0.42

0.42

0.42

0.43

0.43

0.43

0.43

0.43

0.43

0.43

0.43

0.43

0.46

0.46

0.46

0.46

0.46

0.46

0.46

0.46

0.46

0.52

0.52

0.52

0.52

0.52

0.52

0.52

0.52

0.52

0.39

0.39

0.39

0.39

0.39

0.39

0.39

0.39

0.39

0.16

0.16

0.43

0.01

15.00

0.28 ?0.14

0.46

0.50

0.54

0.55

0.52

0.04

0.08

0.12

0.13

0.10

0.38 ?0.05

0.40 ?0.03

0.42 ?0.01

0.46

0.43

0.48

0.44

0.49

0.48

0.57

0.03

0.00

0.05

0.01

0.06

0.05

0.11

0.33 ?0.13

0.44 ?0.02

0.41 ?0.05

0.61

0.15

0.45 ?0.01

0.62

0.48

0.16

0.02

0.44 ?0.02

0.53

0.55

0.55

0.58

0.55

0.59

0.59

0.58

0.53

0.01

0.03

0.03

0.06

0.03

0.07

0.07

0.06

0.01

5.00

15.00

15.00

17.00

17.00

17.00

7.00

9.00

9.00

13.00

7.00

13.00

10.00

14.00

15.00

23.00

12.00

15.00

17.00

22.00

16.00

24.00

20.00

17.00

8.00

8.00

7.00

11.00

11.00

12.00

13.00

11.00

7.00

0.26 ?0.13

15.00

0.15 ?0.24

0.00 ?0.39

0.00 ?0.39

0.00 ?0.39

0.00 ?0.39

0.00 ?0.39

0.54

0.50

0.15

0.11

0.11 ?0.05

0.31

0.15

8.00

0.00

0.00

0.00

0.00

0.00

29.00

26.00

10.00

25.00

14.00

19.00

11.00

7.00

5.00

4.00

7.00

12.00

12.00

10.00

10.00

7.00

8.00

9.00

8.00

10.00

12.00

25.00

17.00

22.00

7.00

17.00

8.00

18.00

19.00

7.00

5.00

4.00

5.00

8.00

5.00

6.00

5.00

6.00

28.00

32.00

39.00

39.00

39.00

39.00

39.00

14.00

15.00

15.00

10.00

Continued on next page

Continued on next page

Conference acronym ÆXX, June 03û05, 2018, Woodstock, NY

Trovato et al.

Model

Qwen3.5-35B

Qwen3.5-35B

Qwen3.5-35B

Qwen3.5-35B

Qwen3.5-35B

Qwen3.5-35B

Qwen3.5-35B

Table 2: Model-by-router violation details (Continued)

Figure 5 provides a compact model-level visualization of viola-

Router Clean Noisy Gain Improve Degrade

tion breadth.

3.00

4.00

5.00

6.00

7.00

8.00

9.00

0.16

0.16

0.16

0.16

0.16

0.16

0.16

0.38

0.23

0.36

0.22

0.07

0.20

0.00 ?0.16

0.00 ?0.16

0.00 ?0.16

28.00

18.00

30.00

0.00

0.00

0.00

0.42

0.26

38.00

6.00

11.00

10.00

16.00

16.00

16.00

12.00

Table 3 reports router-level violation statistics together with the

corresponding question-level transition counts.

Table 3: Router-level violation statistics and transition counts

Router

Viol.
Models

Viol.
Rate

Mean Pos.
Excess

Improve Degrade

Net
Improve

1.00

2.00

3.00

4.00

5.00

6.00

7.00

8.00

9.00

5.00/12 0.42

4.00/12 0.33

6.00/12 0.50

7.00/12 0.58

7.00/12 0.58

7.00/12 0.58

8.00/12 0.67

10.00/12 0.83

8.00/12 0.67

0.04

0.06

0.06

0.04

0.08

0.07

0.07

0.07

0.09

112.00

120.00

138.00

121.00

137.00

118.00

120.00

150.00

180.00

150.00

?38.00

145.00

?25.00

154.00

?16.00

158.00

?37.00

135.00

2.00

139.00

?21.00

144.00

?24.00

110.00

116.00

40.00

64.00

Figure 5: Violation breadth across models.

Received 20 February 2007; revised 12 March 2009; accepted 5 June 2009

02468Number of noisy-router settings above baselinedeepseek/deepseek-chatqwen/qwen3.5-122b-a10bbytedance-seed/seed-1.6-flashmeta-llama/llama-3.2-3b-instructqwen/qwen3-8bqwen/qwen3-30b-a3b-instruct-2507qwen/qwen3.5-35b-a3bdeepseek/deepseek-v3.2meta-llama/llama-3.3-70b-instructmeta-llama/llama-3.1-8b-instructbytedance-seed/seed-2.0-liteqwen/qwen3-next-80b-a3b-instructModelsmax+=0.010max+=0.150max+=0.010max+=0.040max+=0.160max+=0.060max+=0.260max+=0.080max+=0.130max+=0.170max+=0.050max+=0.070Violation breadth across models
