<!--
  AI Triad Research Project — Document Snapshot
  Title      : Language Models are Changing AI: The Need for Holistic Evaluation
  Source     : 
  Type       : pdf
  Captured   : 2026-04-09
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Language Models are Changing AI: The Need for Holistic Evaluation

> **Snapshot captured:** 2026-04-09
> **Source:** 
> **Type:** pdf

---
4/9/26, 7:23 PM

Stanford CRFM

Language Models are Changing AI: The
Need for Holistic Evaluation

Authors: Rishi  Bommasani  and  Percy  Liang  and  Tony  Lee

We benchmark 30 prominent language models across a wide

range of scenarios and for a broad range of metrics to

elucidate their capabilities and risks.

Language plays a central role in how we communicate, how we

learn and teach, how we organize and take political action, and

how we convey the emotions and complexities of our lives.

Language models derive their power from colossal amounts of

language data. They epitomize the broader paradigm shift toward

foundation models, machine learning models that can be adapted

to an impressively wide range of tasks. Organizations such as

Google, Microsoft, and OpenAI expend extraordinary capital to

build these models (sometimes millions of dollars for a single

model), which then power products that impact billions of people.

These models are at the center of the emerging ecosystem of

established products like Google Search, new experiences like

GitHub CoPilot, and the next generation of startups like Adept,

Character, and Inflection. These models have already been used to

https://crfm.stanford.edu/2022/11/17/helm.html

?

1/10

4/9/26, 7:23 PM

Stanford CRFM

co-author Economist articles and award-winning essays, co-create

screenplays, and co-construct testimonies before the U.S. Senate.

Meanwhile, there has been extensive discussion about their risks:

They can be toxic, dishonest, used to spread disinformation, and

the practices surrounding their data and their deployment

necessitate serious legal and ethical reflection.

With all the excitement and fear surrounding language models, we

must be measured. We need to know what this technology can and

canÆt do, what risks it poses, so that we can have both a deeper

scientific understanding and a more comprehensive account of its

societal impact. Transparency is the vital first step towards these

two goals.

But the AI community lacks the needed transparency: Many

language models exist, but they are not compared on a unified

standard, and even when language models are evaluated, the full

range of societal considerations (e.g., fairness, robustness,

uncertainty estimation, commonsense knowledge, capability to

generate disinformation) have not been addressed in a unified way.

At the Center for Research on Foundation Models, we have

developed a new benchmarking approach, Holistic Evaluation of

Language Models (HELM), which aims to provide the much needed

transparency. We intend for HELM to serve as a map for the world

of language models, continually updated over time, through

collaboration with the broader community.

Holistic evaluation

We emphasize being holistic in evaluating language models, but

what does it mean to benchmark language models holistically?

Unlike previous AI systems, language models are general-purpose

text interfaces that could be applied across a vast expanse of

scenarios from question answering to summarization to toxicity

detection. And for each use case, we have a broad set of

https://crfm.stanford.edu/2022/11/17/helm.html

?

2/10

4/9/26, 7:23 PM

Stanford CRFM

desiderata: models should be accurate, robust, fair, efficient, and

so on.

We believe holistic evaluation involves three elements:

1. Broad coverage and recognition of incompleteness. Given

language modelsÆ vast surface of capabilities and risks, we

need to evaluate language models over a broad range of

scenarios. However, it is not possible to consider all the

scenarios, so holistic evaluation should make explicit all the

major scenarios and metrics that are missing.

2. Multi-metric measurement. Societally beneficial systems are

characterized by many desiderata, but benchmarking in AI

often centers on one (usually accuracy). Holistic evaluation

should represent these plural desiderata.

3. Standardization. Our object of evaluation is the language

model, not a scenario-specific system. Therefore, in order to

meaningfully compare different LMs, the strategy for adapting

an LM to a scenario should be controlled for. Further, we

should evaluate all the major LMs on the same scenarios to

the extent possible.

Overall, holistic evaluation builds transparency by assessing

language models in their totality. We strive for a fuller

characterization of language models to improve scientific

understanding and orient societal impact.

1. Broad coverage and the recognition of
incompleteness

To grapple with the vast capability surface of language models, we

first taxonomize _the space of scenarios_ (where LMs can be

https://crfm.stanford.edu/2022/11/17/helm.html

?

3/10

4/9/26, 7:23 PM

Stanford CRFM

applied) and metrics (what we want them to do). A scenario

consists of a task, a domain (consisting of what genre the text is,

who wrote it, and when it was written), and the language. We then

prioritize a subset of scenarios and metrics based on societal

relevance (e.g., user-facing applications), coverage (e.g., different

English dialects/varieties), and feasibility (i.e., we have limited

compute). In contrast to prior benchmarks (e.g., SuperGLUE,

EleutherAI LM Harness, BIG-Bench), which enumerate a set of

scenarios and metrics, situating our selection of scenarios in a

larger taxonomy makes explicit what is currently missing. Examples

for what we miss in the first version of HELM include: languages

beyond English, applications beyond traditional NLP tasks such as

copywriting, and metrics that capture human-LM interaction.

2. Multi-metric measurement

Most existing benchmarks consider scenarios with a single main

metric (usually accuracy), relegating the evaluation of other

desiderata (e.g., toxicity) to separate scenarios (e.g.,

RealToxicityPrompts). We believe it is integral that all of these

desiderata be evaluated in the same contexts where we expect to

deploy models. For each of our 16 core scenarios, we measure 7

metrics (accuracy, calibration, robustness, fairness, bias, toxicity,

and efficiency). The multi-metric approach makes explicit potential

trade-offs and helps ensure the non-accuracy desiderata are not

treated as second-class citizens to accuracy.

In addition, we perform targeted evaluations: 26 finer-grained

scenarios that isolate specific skills (e.g., reasoning, commonsense

knowledge) and risks (e.g., disinformation,

memorization/copyright). This includes 21 scenarios that are either

entirely new in this work (e.g., WikiFact) or that have not been used

https://crfm.stanford.edu/2022/11/17/helm.html

?

4/10

4/9/26, 7:23 PM

Stanford CRFM

in mainstream language model evaluation (e.g., the International

Corpus of English).

3. Standardization

As language models become the substrate for language

technologies, the absence of an evaluation standard compromises

the communityÆs ability to see the full landscape of language

models.

As an example, of the 405 datasets evaluated across all major

language modeling works at the time of writing, the extent to

which models evaluate on these datasets is uneven. Different

models are often evaluated on different scenarios: Models such as

GoogleÆs T5 (11B) and AnthropicÆs Anthropic-LM (52B) were not

evaluated on a single dataset in common in their original works.

Several models (e.g., AI21 LabsÆ J1 Grande (17B), CohereÆs Cohere-

XL (52B), YandexÆs YaLM (100B)) essentially do not report public

results (to our knowledge). \

To rectify this status quo, we evaluated 30 models from 12

providers: AI21 Labs, Anthropic, BigScience, Cohere, EleutherAI,

Google, Meta, Microsoft, NVIDIA, OpenAI, Tsinghua University, and

Yandex. These models differ in public access: Some are open (e.g.,

BigScienceÆs BLOOM (176B)), others are limited access via API (e.g.,

OpenAIÆs GPT-3 (175B)), and still others are closed (e.g.,

Microsoft/NVIDIAÆs TNLGv2 (530B)). For our 16 core scenarios,

models were previously evaluated on 17.9% of our scenarios (even

https://crfm.stanford.edu/2022/11/17/helm.html

?

5/10

4/9/26, 7:23 PM

Stanford CRFM

after compiling evaluations dispersed across different prior works),

which we improve to 96.0%.

To benchmark these models, we must specify an adaptation

procedure that leverages a general-purpose language model to

tackle a given scenario. In this work, we adapt all language models

through few-shot prompting, as pioneered by GPT-3. We chose

simple and generic prompts to encourage the development of

generic language _interfaces _that donÆt require model-specific

incantations. We encourage future work to explore other

adaptation methods such as more sophisticated forms of

prompting, prompt-tuning, and more interactive approaches.

Findings

We ran more than 4900 evaluations of different models on different

scenarios. This amounts to over 12 billion tokens of model inputs

and outputs, spanning 17 million model calls, which costs $38K for

the commercial models (under current pricing schemes) and

almost 20K GPU hours for the open models, which were run on the

Together Research Computer. Through this, we identify 25 top-

level findings, from which we extract five salient points:

1. Instruction tuning, the practice of fine-tuning LMs with

human feedback, pioneered by OpenAI and Anthropic, is

highly effective in terms of accuracy, robustness, and

fairness, allowing smaller models (e.g., Anthropic-LM (50B))

to compete with models 10x the size (Microsoft/NVIDIAÆs

TNLG v2 (530B)). Note that within a model family, scaling up

still helps. Unfortunately, how the instruction tuning was

performed for these models is not public knowledge.

2. Currently, open models (e.g., MetaÆs OPT (175B), BigScienceÆs

BLOOM (176B), Tsinghua UniversityÆs GLM (130B))

https://crfm.stanford.edu/2022/11/17/helm.html

?

6/10

4/9/26, 7:23 PM

Stanford CRFM

underperform the non-open models (e.g., OpenAIÆs

InstructGPT davinci v2, Microsoft/NVIDIAÆs TNLG v2 (530B),

and Anthropic-LM (52B)). Open models have improved

dramatically over the last year, but it will remain to be seen

how these dynamics unfold, and what this says about power

in the language modeling space.

3. We find that (average) accuracy is correlated with

robustness (e.g., inserting typos) and fairness (e.g.,

changing dialects), though there are some scenarios and

models where there are large drops in robustness and

fairness. Our multi-metric approach allows us to monitor

these deviations and ensure we do not lose sight of

considerations beyond accuracy. See Section 8.1 of the paper

for more details.

4. The adaptation strategy (e.g., prompting) has a large effect,

and the best strategy is scenario- and model-dependent.

Sometimes even the qualitative trends themselves change,

such as the relationship between accuracy and calibration

(which captures whether the model knows what it doesnÆt

know). This shows the importance of standardized, controlled

evaluations, so that we can attribute performance to the

model versus the adaptation strategy. This result also shows

that models are not yet interoperable, an important property

for building a robust ecosystem of natural language

interfaces. See Section 8.2 of the paper for more details.

5. We found human evaluation essential in some cases. On

summarization, we find that language models produce

effective summaries (as measured via human evaluation), but

the reference summaries in standard summarization datasets

(e.g., CNN/DM, XSUM) are actually worse (under the same

human evaluations). Models fine-tuned on these datasets

appear to do well according to automatic metrics such as

ROUGE-L, but they also underperform few-shot prompting of

language models. This suggests that better summarization

datasets are desperately needed. For disinformation

generation, We find that InstructGPT davinci v2 and

https://crfm.stanford.edu/2022/11/17/helm.html

?

7/10

4/9/26, 7:23 PM

Stanford CRFM

Anthropic-LM v4-s3 (52B) are effective at generating realistic

headlines that support a given thesis, but results are more

mixed when prompting models to generate text encouraging

people to perform certain actions. While using language

models for disinformation is not yet a slam dunk, this could

change as models become more powerful. Thus, periodic

benchmarking is crucial for tracking risks. See Section 8.5 of

the paper for more details.

Conclusion

These findings represent the current snapshot of the language

modeling landscape. The field of AI moves swiftly with new models

being released continuously (for example, Meta just released

Galactica, a new 120B parameter model yesterday, and we have yet

to evaluate AI21 Labs and CohereÆs newest models, which became

available within the past week). So what might be true today might

not be true tomorrow.

And there are still models such as GoogleÆs PaLM and DeepMindÆs

Chinchilla that we do not have access to. We also do not know how

existing models such as OpenAIÆs InstructGPT davinci v2 was

trained despite being able to probe their behavior via APIs. So as a

community, we are still lacking the desired level of transparency,

and we need to develop the community norms that provide

researchers with adequate access in a responsible manner.

While we strived to make HELM as holistic and complete as

possible, there will always be new scenarios, metrics, and models.

For this reason, HELM by design foregrounds its incompleteness,

and we welcome the community to highlight any further gaps, help

us prioritize, and contribute new scenarios, metrics, and models.

The history and trajectory of AI benchmarking aligns with

institutional privilege and confers decision-making power.

Benchmarks set the agenda and orient progress: We should aspire

for holistic, pluralistic, and democratic benchmarks. We hope the

community will adopt, develop, and interrogate HELM going

https://crfm.stanford.edu/2022/11/17/helm.html

?

8/10

4/9/26, 7:23 PM

Stanford CRFM

forward to meet that aspiration. Let us work together to provide

the much needed transparency for language models, and

foundation models more generally.

Transparency begets trust and standards. By taking a step towards

transparency, we aim to transform foundation models from an

immature emerging technology to a reliable infrastructure that

embodies human values.

Where to go from here:

1. Website: Explore the latest HELM results and drill down from

the aggregate statistics to see the raw underlying prompts

and model predictions.

2. Paper: Read more about the principles of HELM and analysis

of results.

3. GitHub repository: Download the code and use HELM for your

research. It is easy to add new scenarios/metrics and inherit

the infrastructure for performing rigorous, systematic

experiments.

Acknowledgements

HELM was the year-long effort of a team of 50 people. Many others

also contributed valuable feedback and guidance; see the paper

for the full list of contributors and acknowledgements. We would

like to especially thank AI21 Labs, Cohere, and OpenAI for providing

credits to run experiments on their limited-access models, as well

as Anthropic and Microsoft for providing API access to their closed

models. We are grateful to BigScience, EleutherAI, Google, Meta,

Tsinghua University, and Yandex for releasing their open models,

and to Together for providing the infrastructure to run all the open

models. Finally, we would also like to thank Google for providing

financial support through a Stanford HAI-Google collaboration and

Schmidt FuturesÆs AI2050 initiative for their support.

https://crfm.stanford.edu/2022/11/17/helm.html

?

9/10

4/9/26, 7:23 PM

Stanford CRFM

CRFM is grateful to our supporters.

⌐ 2021û2025. Stanford Center for Research on Foundation Models.

Designed by Joon Sung Park.

https://crfm.stanford.edu/2022/11/17/helm.html

?

10/10
