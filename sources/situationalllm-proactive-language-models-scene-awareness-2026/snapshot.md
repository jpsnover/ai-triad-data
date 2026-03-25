<!--
  AI Triad Research Project — Document Snapshot
  Title      : SituationalLLM: Proactive Language Models with Scene Awareness for Dynamic, Contextual Task Guidance
  Source     : 
  Type       : pdf
  Captured   : 2026-03-16
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# SituationalLLM: Proactive Language Models with Scene Awareness for Dynamic, Contextual Task Guidance

> **Snapshot captured:** 2026-03-16
> **Source:** 
> **Type:** pdf

---
Open Research Europe

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

RESEARCH ARTICLE

SituationalLLM: Proactive Language Models with Scene
Awareness for Dynamic, Contextual Task Guidance
[version 1; peer review: 2 approved with reservations]

Muhammad Saif Ullah Khan

, Muhammad Zeshan Afzal, Didier Stricker

Augmented Vision Group, Deutsches Forschungszentrum fur Kunstliche Intelligenz GmbH, Kaiserslautern, Rhineland-Palatinate,
67663, Germany

v1 First published: 03 Mar 2025, 5:61

https://doi.org/10.12688/openreseurope.18551.1
Latest published: 03 Mar 2025, 5:61
https://doi.org/10.12688/openreseurope.18551.1

Open Peer Review
Approval Status

view

view

Abstract
Background
Large Language Models (LLMs) have demonstrated remarkable
success in text-based reasoning tasks but struggle to provide
actionable guidance in real-world physical environments. This
limitation arises from their lack of situational awareness—an inability
to recognize gaps in their understanding of a user’s physical context,
leading to unreliable and overly generic instructions. To address this,
we propose SituationalLLM, a novel approach that integrates
structured scene representations into LLMs to improve context-aware
assistance.

version 1
03 Mar 2025

1. Saurabh Pahune

, Cardinal Health,

Dublin, USA
2. Ahmed Ali Linkon

, Westcliff University,

Irvine, USA
Any reports and responses or comments on the
article can be found at the end of the article.

Methods
SituationalLLM leverages scene graphs—structured representations
of objects, attributes, and spatial relationships—to encode real-world
environments in a text-based Scene Graph Language. We introduce
the Situational Awareness Database for Instruct-Tuning (SADInstruct), which pairs diverse scene graphs with multi-agent dialogue,
enabling LLMs to iteratively refine their guidance through clarifying
questions. A LoRA-adapted LLaMA-3-8B model is fine-tuned on
SADInstruct to bridge structured knowledge with natural language
reasoning, enhancing its ability to recognize missing information and
dynamically adjust responses.
Results
Qualitative evaluations show that SituationalLLM outperforms stateofthe-art LLMs (GPT-4, LLaMA-3) in providing precise, task-specific,

Page 1 of 18

Open Research Europe

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

and contextually relevant instructions. The model reduces
hallucinations by proactively identifying missing environmental details
and requesting clarifications before generating guidance. Through
comparative analyses on everyday tasks (e.g., cooking, office
assistance), SituationalLLM demonstrates superior adaptability,
delivering grounded, user-centered recommendations.
Conclusion
By integrating structured scene representations and iterative
dialogue-based refinements, SituationalLLM enables more reliable,
context-aware AI assistants. This research highlights the significance
of bridging structured knowledge with natural language for enhanced
real-world task guidance. Future work should focus on expanding
scenario diversity and improving real-time scene perception to further
enhance situational adaptability.
Keywords
Large Language Models, Scene Graphs, Context-Aware Assistance,
Situational Awareness

This article is included in the Horizon Europe
gateway.

Corresponding author: Muhammad Saif Ullah Khan (muhammad_saif_ullah.khan@dfki.de)
Author roles: Khan MSU: Conceptualization, Data Curation, Formal Analysis, Methodology, Software, Validation, Visualization, Writing –
Original Draft Preparation, Writing – Review & Editing; Afzal MZ: Conceptualization, Supervision, Writing – Review & Editing; Stricker D:
Funding Acquisition, Project Administration, Resources, Supervision, Writing – Review & Editing
Competing interests: No competing interests were disclosed.
Grant information: This project has received funding from the European Union’s Horizon Europe research and innovation programme
under grant agreement No. 101135724 (Language Augmentation for Humanverse [LUMINOUS]), addressing Topic HORIZON-CL4-2023HUMAN-01-21.
The funders had no role in study design, data collection and analysis, decision to publish, or preparation of the manuscript.
Copyright: © 2025 Khan MSU et al. This is an open access article distributed under the terms of the Creative Commons Attribution
License, which permits unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited.
How to cite this article: Khan MSU, Afzal MZ and Stricker D. SituationalLLM: Proactive Language Models with Scene Awareness for
Dynamic, Contextual Task Guidance [version 1; peer review: 2 approved with reservations] Open Research Europe 2025, 5:61
https://doi.org/10.12688/openreseurope.18551.1
First published: 03 Mar 2025, 5:61 https://doi.org/10.12688/openreseurope.18551.1

Page 2 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

1 Introduction

Large language models (LLMs) have demonstrated exceptional
capabilities in understanding and generating human language1–3.
This has driven advancements in a wide range of tasks, ranging
from language understanding4,5 and software development6 to
human motion descriptions7. Recent work is increasingly focused
on creating LLM-based AI systems that operate in real-world
environments8. This includes both virtual assistants like chatbots
and embodied agents like robots. However, traditional LLMs
struggle to leverage accurate world models of their surroundings, limiting their effectiveness in physical contexts9. This is a
significant barrier to developing robust LLM-driven systems that
can help complete tasks in the real world.
Current LLMs often fail to recognize their incomplete understanding of the physical world and rarely seek clarifications10.
Consequently, when used for task guidance, they tend to produce verbose and overly generic instructions with hallucinations
that rely on broad assumptions, making them difficult for users
to interpret and apply in their situation. For embodied agents,
this can lead to ineffective or even unsafe task execution11,
highlighting the critical need for actionable and contextually
accurate task guidance.
Figure 1 demonstrates this limitation with an example from
GPT-43. Here, the model assumes the jar is stubborn and provides
broad, non-specific solutions without understanding the user’s
exact context (e.g., why help is needed, the jar’s characteristics,
etc.). In contrast, if the user asks another human for help with
a similar task, that person would likely attempt to understand
why the user needs assistance before providing a targeted
response specific to the user’s circumstances. The LLM’s lack of
awareness about the user’s context and inability to recognize
its own incomplete understanding, or what we term situational
awareness12,13, results in ill-suited guidance. This highlights
the need for an LLM to recognize incomplete context and
proactively seek details to refine its guidance.

The lack of detailed descriptions of the physical world in
standard user interactions with LLMs makes it difficult for
LLMs to understand the context. For LLM-driven virtual
assistants to function more naturally and be user-friendly, instead
of relying entirely on the user to provide all necessary context,
a practical assistant should proactively identify missing
details and ask clarifying questions, much like a human would.
This ability to extract context through interaction would make
systems more intuitive and reduce the burden on users to provide complete, precise information upfront. In the case of
LLM-driven embodied agents, some environmental context
can be gleaned through sensors attached to the agent. When
combined with scene-understanding tools, these sensors can
offer structured representations of the environment—scene
graphs—which can then be added to prompts to improve
situational awareness.
However, conventional LLMs are not inherently designed to
process or reason with structured data like scene graphs.
To address this gap, we propose a lightweight Scene Graph
Language that encodes objects, their attributes, and the
relationships between them as text. By converting each scene’s
data into a standardized textual form, the LLM can parse
and reason about the environment more effectively. This
format is particularly crucial in real-world settings where
contextual details—such as the number of objects, their positions, or their relationships—impact task feasibility. Despite the
potential of incorporating such structured information, there is
a lack of standardized methods for integrating environmental
inputs into LLM workflows. This makes producing actionable,
context-aware responses tailored to users’ needs challenging.
In response, we introduce the Situational Awareness Database
for Instruct-Tuning (SAD-Instruct), a novel dataset that pairs
scenario-specific scene graphs with multi-agent dialogue to
generate context-sensitive instructions. SAD is derived from
large-scale 3D semantic scene graphs14,15, ensuring realistic and
diverse indoor scenarios. Alongside scene-graph pruning and

Figure 1. GPT-4 provides comprehensive but generic guidance when assisting with physical tasks, failing to account for specific
user situations and constraints. It presumes that the jar is “stubborn” and neglects to ask for details like the type of jar or the user’s
limitations, which can lead to less applicable advice. An ideal LLM-driven AI assistant should provide tailored advice, considering the user’s
real-world situation, implying a need for awareness of their physical context.

Page 3 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

multi-turn dialogue, SAD includes a wide range of tasks and
reflection-style interactions designed to teach LLMs how to
identify context gaps and ask clarifying questions.
To demonstrate the effectiveness of our dataset in eliciting
desired behaviors in LLMs, we propose SituationalLLM,
a model fine-tuned using LoRA16 to effectively handle
scene graph inputs, query missing details, and provide more
grounded, user-centered guidance. Our method demonstrates
the importance of bridging structured representations (scene
graphs) with natural language dialogues, enabling LLMs to reason about what matters in a given situation. We present initial
qualitative examples showing SituationalLLM outperforming
GPT-4 and Llama 3 in situational awareness by dynamically
adapting to user needs and leveraging environmental context.
While these results are promising, they represent a step
toward more robust, context-aware AI systems rather than a
definitive solution.

1.1 Contributions
•	We propose SituationalLLM, a fine-tuned language
model designed to integrate structured scene knowledge for actionable, context-aware task guidance,
benefiting both virtual assistants and embodied agents.
•	We introduce the Situational Awareness Database
for Instruct-Tuning (SAD-Instruct), a novel dataset that teaches LLMs to reason over structured and
unstructured knowledge and refine guidance through
iterative dialogue.
•	We demonstrate, through qualitative examples, that
SituationalLLM improves task specificity, reduces
hallucinations, and provides grounded, reliable assistance, setting a foundation for AI systems capable of
building and leveraging world models.

2 Methods

This section presents our approach for creating SituationalLLM,
which provides actionable, context-aware task guidance by
leveraging structured scene graphs and interactive multi-agent
dialogue. We begin with a high-level overview of our solution, introduce the Scene Graph Language for structured
representations, detail the construction of the Situational
Awareness Database (SAD), and then describe how we fine-tune
our model.

2. Construct SAD with scenario-specific dialogues:
We generate situational contexts (scenarios) from these
scene graphs and employ a multi-agent system to
produce iterative dialogues and step-by-step instructions
(Section 2.3).
3. Fine-tune an LLM with scene graph awareness:
Finally, we train a LoRA adapter16 on top of
LLaMA-3-8b-Instruct17 to integrate structured and
unstructured knowledge (Section 2.4), yielding the
SituationalLLM model.

2.2 Scene graph language and representation
Scene graphs offer structured, graph-based representations of
environments, encoding objects (nodes), their attributes, and
pairwise relationships (edges). To make such information
accessible to an LLM, we propose converting it into a
standardized Scene Graph Language:
obj-<label>-<id>:[<attr1>,<attr2>,...]; ...;


el-<id>:(<subject>-<id>,<predicate>,<object>
r
-<id>); ...;
Each obj-<label>-<id> entry details the object’s name, ID,
and any relevant attributes (e.g., “wooden,” “large,” “on table”).
Relationship lines specify how objects interact (e.g., “under,”
“contains,” “next to”). We can teach standard LLMs to parse
and reason over environmental contexts without specialized
architectures by translating scene graphs into this uniform
textual format and fine-tuning lightweight adapters.

2.3 Constructing the Situational Awareness Database
(SAD)
Our dataset, SAD, is built to teach LLMs situational awareness
through structured scene graphs and multi-turn dialogues.
Figure 2a illustrates the overall pipeline. Below, we detail how
we generate diverse scenarios, create scenario-specific scene
graphs, and employ a multi-agent system to produce high-quality
instructions.
2.3.1 Source data
We derive SAD from 3DSSG14, which provides 3D semantic
scene graphs for 1,482 RGB-D scans in the 3RScan dataset15.
Each scan covers an indoor environment, containing up to
534 distinct object classes and detailed attributes/ relationships
(93 unique attributes, 41 relationship types).

2.1 Overview of the proposed approach
Traditional LLMs struggle with executing tasks in the
physical world because they rely primarily on text-based
pretraining and often fail to incorporate crucial environmental
details. Our proposed solution, SituationalLLM, addresses
this challenge in three key steps:

2.3.2 Scenario generation
For each 3D scan, we use GPT-3.5-Turbo18 to propose up to
ten possible scenarios (situational contexts or tasks). These
may include everyday activities (cooking a meal in a kitchen) or
events (fire breaking out in a building). The following prompt
is used:

1. Encode environments as scene graphs: We use the
3DSSG14 dataset to obtain comprehensive semantic scene
graphs, capturing objects, attributes, and relationships
in real-world indoor environments (Section 2.2).

Given a list of objects in a real-world environment, your
task is to list scenarios that can potentially arise in this
environment. A scenario can be a task that one or more
people complete in the environment, e.g., "cooking a meal

Page 4 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Figure 2. Methodology and scenario diversity. (a) We begin by extracting scene graphs from 3D scans and use an LLM to
generate diverse scenarios. Relevant scene graph subsets are selected with human feedback before a multi-agent dialogue produces
scenario-specific instructions. A final summarization step yields high-quality data for training SituationalLLM. (b) Word clouds showing
the distribution of nouns and verbs in scenarios in the training (top) and (validation) sets of the SAD dataset, highlighting contextual
diversity and action-oriented content.

in a kitchen” or “playing a game in a park.” It can also
be a situation in the scene, e.g., “a fire breaking out in
a building” or “a storm approaching a beach.” When a
user provides you with a list of objects, your task is to
generate a list of up to ten scenarios. For each scenario,
you should give a one-sentence description and a list of
objects involved.
We then pick the five most diverse scenarios (see Figure 2b)
by evaluating cosine similarity scores between scenario
descriptions via a CLIP-based text encoder19 and selecting the
ones with the lowest mutual similarity.
2.3.3 Scenario-specific scene graphs
Each scenario is tied to a subset of objects that are relevant
to the described task or situation. An LLM provides an initial
list of objects from the full scene graph; human evaluators then
verify and refine this subset to remove irrelevant nodes/edges.
This generates a pruned scene graph specifically tailored to
each scenario (Figure 3).
In Figure 4, we analyze the impact of scenario-specific scene
graphs on instruction quality. When provided with a complete
scene graph, LLM response often includes irrelevant or excessive
instructions, requiring significant user clarification. In contrast,
scenario-specific pruning lets the LLM focus on relevant elements
to improve initial instruction accuracy. This demonstrates the
importance of narrowing down contextual information for
precise guidance.
In many practical cases, often only images (not 3D scans) are
available. Our pipeline accommodates such use cases through
scene graph prediction networks20,21 or vision-language models
(e.g., GPT-4V3, LLaVA22), which can produce approximate scene
graphs from 2D images.

2.3.4 Multi-agent dialogue and summarization
We employ a multi-agent framework consisting of three
specialized large language model (LLM) agents—Humanoid,
Oracle, and Summarizer—designed to collaboratively generate detailed, context-grounded instructions for complex scenarios. Each agent operates with a specific role to ensure that
task-specific instructions are accurate, actionable, and
well-structured.
The Humanoid agent simulates an embodied user navigating
a novel environment, emphasizing exploratory behavior to
identify potential ambiguities or gaps in initial instructions.
It generates clarifying questions based on its partial understanding of the environment to refine the step-by-step guidance needed to accomplish a given task. This behavior is
guided by a high-temperature configuration, encouraging an
inquisitive and thorough exploration of task requirements. The
Oracle agent serves as an omniscient guide with access to a
context-specific scene graph that encapsulates spatial, relational,
and attribute-based details of the environment. Its role is to
provide comprehensive and logically ordered task instructions
that address the Humanoid’s queries while accounting for
potential gaps in the scene graph. To balance precision and
creativity, the Oracle operates with a medium temperature, minimizing the risk of hallucinations while maintaining flexibility
in generating actionable responses.
Finally, the Summarizer agent consolidates the dialogue
between the Humanoid and the Oracle into a concise, coherent, and logically structured set of instructions. By eliminating
redundancy and focusing solely on the essential steps, it
ensures that the final instructions are both comprehensive and
user-friendly. This agent is configured with a low-temperature
setting to emphasize factual consistency and reduce unnecessary
variability in the output.
Page 5 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Figure 3. Pruned scene graphs. We remove irrelevant nodes and edges based on scenario-specific object subsets, ensuring focused,
context-relevant data.

Figure 4. Effectiveness of using scenario-specific scene graphs. Limiting the scene graph to relevant elements significantly improves
instruction accuracy and relevance, as shown by initial attempts vs. refined outputs.

Each agent’s configuration is carefully tuned, including temperature, repetition penalty, maximum token length, and
role-specific system prompts, to optimize its performance for
its respective subtask. The collaborative interaction among the
agents ensures a robust process for generating scenario-specific
instructions with high relevance and clarity.
Prompt engineering. Agent behavior is directed by
carefully designed role-based prompts, informed by prompt

chaining23, role-based prompting24, and reflection mechanisms25.
The Humanoid prompt encourages thorough exploration via
clarifying questions, the Oracle prompt ensures detailed and
scenario-specific instructions grounded in the scene graph,
and the Summarizer prompt focuses on distilling concise and
actionable steps. Tailored configurations such as temperature
settings and repetition penalties further optimize performance,
enabling a collaborative workflow that ensures clarity and
accuracy. Full prompts and settings are detailed in Appendix ??.
Page 6 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Dialogue generation. As shown in Figure 5, we prompt the
Humanoid and Oracle to interact over scenario-specific
scene graphs. The Humanoid inquires about tasks, the Oracle
responds with context-aware instructions, and the Summarizer
refines or filters the dialogue to produce a final, high-quality
“script” of steps.

objects in a kitchen scene, the LLM is trained to provide
specific steps for tasks like cooking or cleaning.

2.3.5 SAD for Instruct-tuning (SAD-Instruct)
The resulting SAD dataset contains the pruned scene graphs,
multi-turn dialogues, and final step-by-step instructions for
each scenario. We convert this into a format suitable for
instruction tuning and call it SAD-Instruct. As shown in
Figure 6, SAD-Instruct focuses on providing a wide range of
prompt types (scene-graph pruning, step-by-step tasks, clarifying
conversations) to teach LLMs desired behaviors:

• Scene understanding and graph pruning: The dataset
includes samples where the model uses natural language descriptions or structured representations to
determine which items are essential or not for specific
tasks within various indoor settings. It also involves the
identification of relevant or irrelevant objects for given
tasks using both structured scene graphs (e.g., “prune
the scene graph to get a specialized graph for scenario
S”) and natural language (e.g., “In the scene {G}, do
I need the object [name] to complete the task S?”).
Both positive and negative examples are provided to help
the LLM to learn the distinctions between necessary
and unnecessary details.

• Robot-Oracle conversations: Multi-turn dialogues
where the model simulates a user in an unfamiliar
environment. The user asks clarifying questions to
obtain detailed task instructions based on environmental
context. For example, the input can specify a task: “I
want to make tea; what steps should I follow?” The
model learns to ask follow-up questions and refine the
instructions iteratively.

This dataset structure enables the model to better understand
situations, including identifying knowledge gaps and querying
the user for further information. SAD-Instruct contains
95.2 million tokens in total. It can be used to fine-tune standard LLMs1,2, allowing scene understanding and situational
awareness to naturally emerge. We split these samples into
80% training, 20% testing, as shown in Table 1.

• Step-by-step instructions: Instances where the model
generates actionable guidance based on a complete
or partial scene graph. For example, given a list of

2.4 Training SituationalLLM
With SAD-Instruct ready, we fine-tune LLaMA-3-8b-Instruct17 to
incorporate scene graph awareness and multi-turn conversation

Figure 5. Dialogue Pipeline. Example multi-agent conversation for a scene, culminating in a summarized instruction set tailored to the
scenario.

Page 7 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Figure 6. SAD-Instruct dataset. Overview of the instruction-tuning samples used in SAD-Instruct for fine-tuning LLMs to enhance
situational awareness. Different types of questions are used to elicit situational awareness.

Table 1. SAD-Instruct overview. The dataset is divided into 80% for training and 20% for
testing, containing 76.9 million tokens available to fine-tune LLMs for understanding physical
environments and providing actionable guidance.
Category

Scans

Scenarios

Task Steps

Input
Tokens (M)

Output
Tokens (M)

Total Tokens
(M)

Training

131.2k

71.8

5.1

76.9

Testing

32.6k

17.1

1.2

18.3

Total

163.8k

88.9

6.3

95.2

strategies learned from the multi-agent dialogues. We call
the resulting model SituationalLLM. We adopt LoRA16, a
parameter-efficient method that inserts trainable rankdecomposition matrices into the linear layers of a frozen base
model. Our configuration utilizes 4-bit quantization, which
reduces GPU memory usage during training, with a rank of
r = 64, a scaling factor of α = 32, and a dropout rate of 0.05.
We fine-tune for 10 epochs on 76.9M tokens, which takes
approximately 48 hours on one H100 80GB GPU. We employ a
sequence length of 8k tokens and a paged AdamW optimizer26
with a learning rate of 2×10−4. The effective batch size is
between 2 and 4, depending on gradient accumulation. A
10-step warm-up helps stabilize early training. After fine-tuning,
situational-8b-it emerges as our final model, which
we make publicly available.

omitted entirely, the more questions the LLM asks before
providing guidance. This dialogic approach significantly mitigates
hallucinations and ensures more precise, actionable suggestions,
as illustrated in Figure 7.

2.4.1 Inference flow and iterative clarification
Once trained, SituationalLLM processes user queries and a
(potentially pruned) scene graph context. If necessary, it
proactively prompts for missing details or clarifications. The
less context is provided in the scene graph, which may also be

3 Qualitative results

Our approach systematically merges structured scene graph information, scenario-driven dialogues, and specialized fine-tuning
strategies to produce SituationalLLM, a model capable of realtime context adaptation. Encoding environments in a Scene
Graph Language, constructing diverse scenario-based data in
SAD, and leveraging multi-agent interactions enable LLMs
to seek clarifications and refine instructions as new information
arises. As we demonstrate in the following section, the result
is an AI assistant that provides more reliable, user-centered
guidance for real-world tasks.

This section illustrates the effectiveness of SituationalLLM in
real-world applications. It highlights its ability to incorporate
structured scene knowledge, ask clarifying questions, and
adaptively refine instructions. By comparing SituationalLLM
Page 8 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Figure 7. Iterative context-aware guidance. Unlike the assumption-driven response in Figure 1, SituationalLLM proactively gathers
context and refines instructions based on user feedback, demonstrating precise, actionable guidance.

with baseline models, we evaluate its performance on various
routine tasks, including cooking, office settings, and adjusting
instructions for complex scenarios. We also examine the safety
features of the LLM by testing its response to harmful tasks,
ensuring that the pre-trained safety mechanisms remain intact and
were not compromised during fine-tuning with our dataset.

or irrelevant instructions. With SAD-Instruct fine-tuning,
SituationalLLM (Figure 9c) provides focused, context-aware
guidance, such as directing users to a break room or suggesting
feasible alternatives. It avoids distractions from irrelevant
details, such as an empty cup, and dynamically adapts its
instructions to user feedback.

3.1 Comparison with baseline models
3.1.1 Scenario: Making a specific amount of tea
Figure 8a presents a baseline LLM providing generic instructions for making 2.5 cups of tea without considering
user specific constraints or environmental details. SituationalLLM
(Figure 8b) immediately identifies missing context, such as
the type of tea and equipment available, and asks clarifying
questions to refine its guidance. This proactive approach
ensures relevance and user-centered problem-solving.

3.1.3 Scenario: scaling up to complex tasks
Figure 10 illustrates SituationalLLM’s ability to scale its
guidance for complex tasks, such as preparing a meal for
200 people. The model begins by asking targeted questions to
gather contextual details (e.g., type of meal, available equipment,
and time constraints). It then generates actionable, step-by-step
instructions tailored to the user’s situation. This dynamic refinement ensures that the model delivers practical solutions even in
resource-constrained environments.

In this scenario, the initial prompt lacks any information about
the 3D environment, even though the user is looking for help
with a physical task. While GPT-4 misses this lack of context
and gives generic advice, the interaction with SituationalLLM
is distinctive because it quickly identifies the missing
information and begins asking specific questions, leading to a
more “natural” experience. Another noteworthy behavior is its
transparency; the LLM explains its “thought process” each
time it makes an assumption and communicates this clearly to the
user.

4 Discussion

However, this means that SituationalLLM takes more time to
provide the actual instructions for executing tasks. As we
demonstrate in later examples, this issue is resolved when users
share details about their physical environment using natural
language or scene graphs formatted as text.

Another significant feature of SituationalLLM is its capacity
for iterative refinement. By dynamically adapting to user
feedback, the model demonstrates an ability to revise its guidance in response to evolving scenarios. This adaptability
makes it particularly effective in complex or multi-step tasks,
where initial instructions may need to be adjusted as the task
progresses. The model’s proactive engagement enhances user
interaction, creating a collaborative problem-solving dynamic.
This interaction not only improves the overall user experience

3.1.2 Scenario: Addressing hunger in an office setting
In this example (Figure 9a–9b), baseline models fail to leverage scene-specific information effectively, producing verbose

SituationalLLM demonstrates several notable strengths that
distinguish it from existing large language models. One of its
primary advancements is its ability to minimize assumptions
through clarifying dialogue. Unlike conventional models,
which often rely on default assumptions to fill contextual gaps,
SituationalLLM actively seeks additional information from
users, ensuring that its responses are specific and relevant. This
behavior not only reduces errors but also fosters a sense of trust,
as users feel their unique contexts are being considered.

Page 9 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Figure 8. (a) Generic Instructions from Baseline LLM. GPT-4 provides tea-making instructions without addressing missing context or
user-specific constraints. (b) Grounded Instructions with SituationalLLM. The model identifies missing context and refines its guidance
through clarifying questions, but it takes longer to provide the instructions.

but also ensures that task-specific guidance is both actionable
and contextually appropriate.
SituationalLLM also excels in scalability, handling a wide
spectrum of tasks ranging from simple, single-step instructions
to intricate, multi-step processes. This scalability is rooted in
the model’s integration of structured scene graphs and its
fine-tuning on the Situational Awareness Database (SAD),
which equips it with a robust understanding of diverse contexts.
Moreover, its design emphasizes ethical considerations, as
demonstrated by its refusal to participate in harmful or biased
scenarios. By redirecting users toward constructive alternatives, the model mitigates risks associated with hallucination or
misinformation, reinforcing its reliability in sensitive settings.
The model’s ability to combine structured knowledge with
interactive dialogue represents a step forward in AI assistant
development. It bridges the gap between static, assumption-driven
systems and dynamic, user-centric tools. However, there is room
for improvement. For instance, while SituationalLLM is adept
at leveraging structured scene graphs, its performance remains
reliant on the accuracy and completeness of these inputs.
Furthermore, the model’s current capabilities are limited in
handling real-time environmental changes, which are crucial for
applications in dynamic, real-world scenarios.

4.1 Safety and robustness
SituationalLLM demonstrates robust adherence to ethical
guidelines by avoiding harmful, biased, or unsafe instructions.

Figures 11a and 11b highlight the model’s ability to refuse
participation in scenarios involving harmful stereotypes or
dangerous tasks.
Additionally, Figure 12 shows how the model interprets and
mitigates ambiguous prompts, redirecting the user toward
safer, constructive alternatives. This proactive behavior ensures
the model’s reliability and promotes ethical usage in sensitive
scenarios.

5 Conclusion

This work presents SituationalLLM, a fine-tuned large language
model designed to provide actionable, contextually grounded
task guidance in dynamic environments. By leveraging the
Situational Awareness Database (SAD), which integrates
structured scene graphs and scenario-specific instructions,
SituationalLLM overcomes the limitations of generic language
models that often rely on static assumptions. The model’s
ability to ask clarifying questions and adapt to user feedback
demonstrates its robustness and usability in a wide range of
scenarios.
Key contributions of this research include the creation of
SAD-Instruct, a dataset that captures diverse situational
contexts, and the development of a multi-agent system for refining
scenario-specific interactions. Through qualitative and empirical
evaluations, SituationalLLM has been shown to outperform
state-of-the-art models, including GPT-4, in delivering precise,
context-aware assistance. Its proactive engagement, iterative
Page 10 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Figure 9. Comparison of responses from LLaMA-3-8B-Instruct. (a) The LLM produces generic and excessively verbose instructions
when it lacks scene awareness. (b) Even with scene graphs, the model overlooks critical details, offering misleading guidance. (c) After being
finetuned with SAD-Instruct, the LLM reduces assumptions, poses clarifying questions, ignores irrelevant scene details (e.g., the empty cup),
and explains its thought process, providing customized, context-sensitive guidance.

refinement, and commitment to ethical guidelines position it
as a significant advancement in the development of AI assistants.
Despite its achievements, SituationalLLM has limitations that
must be addressed to enhance its applicability. The scope of

SAD, while diverse, does not cover all potential real-world
scenarios, and the model’s reliance on pre-existing scene graph
representations poses challenges in dynamic environments.
Future work should focus on expanding the dataset to include a
broader range of contexts, improving scene graph generation

Page 11 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Figure 10. Scaling up with SituationalLLM. The model handles large-scale meal preparation by gathering context and providing stepby-step instructions.

Figure 11. Safety analysis. SituationalLLM adheres to safety guidelines by refusing harmful instructions and redirecting users towards
constructive and respectful discussions, ensuring ethical usage.

and completeness, and integrating mechanisms for handling
real-time updates. Addressing these challenges will ensure that

SituationalLLM continues to evolve as a robust and adaptable
solution for real-world task guidance.

Page 12 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Figure 12. Context-aware mitigation of harmful requests. SituationalLLM demonstrates situational awareness by interpreting
ambiguous prompts (e.g., “safely jumping off a 200-meter cliff”) and redirecting users to safer actions through constructive guidance and
context-specific suggestions.

Data availability
Underlying data

The datasets created in this work to train SituationalLLM
are publicly available on FigShare. The project contains the
following underlying data:

Software availability

The source code for the data generation pipeline and the
training process of SituationalLLM is publicly accessible on
GitHub under the MIT License. All source code is also archived
on Zenodo.
•

- https://github.com/saifkhichi96/sad-instruct/

FigShare: Situational Awareness Dataset for Instruct-Tuning
(SAD-Instruct)27 https://doi.org/10.6084/m9.figshare.28321805
•

train.parquet: Training set of LLM-generated SAD
in a column-based format used to programmatically
create SAD-Instruct training data.

•

test.parquet: Test set of SAD.

•

train-instruct.jsonl: Training set of SAD-Instruct,
suitable for LLM fine-tuning.

•

test-instruct.jsonl: Test set of SAD-Instruct.

This data is also available on HuggingFace for seamless
integration with LLM fine-tuning workflows. Comprehensive
metadata and documentation are provided through Croissant
metadata and a dataset card. Data are available under the
terms of the Creative Commons Attribution Non-Commercial
4.0 License.

Data Generation Pipeline:

- https://doi.org/10.5281/zenodo.14778563
•

Training SituationalLLM:
- https://github.com/saifkhichi96/situational-llm/
- https://doi.org/10.5281/zenodo.14778565

The fine-tuned model is available on HuggingFace Hub for
use in downstream applications:
•	https://huggingface.co/saifkhichi96/situational-llama-38b-Instruct-bnb-4bit

Acknowledgements
We would like to acknowledge the contributions of Sankalp
Sinha for his invaluable input. We deeply appreciate his insights
and early discussions, which laid the groundwork for the
research presented in this paper.

Page 13 of 18

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

References
1.

Radford A, Wu J, Child R, et al.: Language models are unsupervised multitask
learners. OpenAI blog. 2019; 1(8): 9.
Reference Source

2.

Brown T, Mann B, Ryder N, et al.: Language models are few-shot learners.
Adv Neural Inf Process Syst. 2020; 33: 1877–1901.
Reference Source

3.

OpenAI: Gpt-4v(ision) system card. 2023.
Reference Source

4.

Gong J, Foo LG, He Y, et al.: LLMs are good Sign Language Translators. In:
Proceedings of the IEEE/CVF conference on computer vision and pattern recognition.
2024; 18362–18372.
Reference Source

5.

Wang Y, Zhang J, Shi T, et al.: Recent advances in interactive machine
translation with large language models. IEEE Access. 2024; 12:
179353–179382.
Publisher Full Text

Recognition (CVPR). 2020.
Publisher Full Text
15.

Wald J, Avetisyan A, Navab N, et al.: RIO: 3D object instance re-localization in
changing indoor environments. In: Proceedings of the IEEE/CVF International
Conference on Computer Vision (ICCV). October, 2019.
Publisher Full Text

16.

Hu EJ, Shen Y, Wallis P, et al.: LoRA: low-rank adaptation of large language
models. arXiv preprint arXiv: 2106.09685. 2021.
Publisher Full Text

17.

AI@Meta: Llama 3 model card. 2024.
Reference Source

18.

Ye J, Chen X, Xu N, et al.: A comprehensive capability analysis of GPT-3 and
GPT-3.5 series models. arXiv preprint arXiv: 2303.10420. 2023.
Publisher Full Text

19.

Radford A, Kim JW, Hallacy C, et al.: Learning transferable visual models from
natural language supervision. In: International conference on machine learning.
PMLR, 2021; 8748–8763.
Reference Source

6.

Ozkaya I: Application of large language models to software engineering
tasks: opportunities, risks, and implications. IEEE Software. 2023; 40(3): 4–8.
Publisher Full Text

20.

7.

Khan MSU, Naeem MF, Tombari F, et al.: Human pose descriptions and
subject-focused attention for improved zero-shot transfer in humancentric classification tasks. arXiv preprint arXiv: 2403.06904. 2024.
Publisher Full Text

Li Y, Ouyang W, Zhou B, et al.: Scene graph generation from objects, phrases
and region captions. In: Proceedings of the IEEE international conference on
computer vision. 2017; 1261–1270.
Publisher Full Text

21.

8.

Wang L, Ma C, Feng X, et al.: A survey on large language model based
autonomous agents. Front Comput Sci. 2024; 18(6): 186345.
Publisher Full Text

Xu D, Zhu Y, Choy CB, et al.: Scene graph generation by iterative message
passing. In: Proceedings of the IEEE conference on computer vision and pattern
recognition. 2017; 5410–5419.
Reference Source

9.

Chen W, Su MW, Mehjabin N, et al.: Can LLMs plan paths in the real world?
arXiv preprint arXiv: 2411.17912. 2024.
Publisher Full Text

22.

Liu H, Li C, Wu Q, et al.: Visual instruction tuning. 2023.
Reference Source

23.

10.

Chen Y, Liu Y, Yan J, et al.: See what LLMs cannot answer: a self-challenge
framework for uncovering LLM weaknesses. arXiv preprint arXiv: 2408.08978.
2024.
Publisher Full Text

Wei J, Wang X, Schuurmans D, et al.: Chain-of-thought prompting elicits
reasoning in large language models. Adv Neural Inf Process Syst. 2022; 35:
24824–24837.
Reference Source

24.

11.

Zhu Z, Wu B, Zhang Z, et al.: RiskAwareBench: towards evaluating physical
risk awareness for high-level planning of LLM-based embodied agents.
arXiv e-prints. 2024; arXiv–2408.
Publisher Full Text

Wang ZM, Peng Z, Que H, et al.: RoleLLM: benchmarking, eliciting, and
enhancing role-playing abilities of large language models. arXiv preprint
arXiv: 2310.00746. 2023.
Publisher Full Text

25.

12.

Endsley MR: Toward a theory of situation awareness in dynamic systems.
Hum Factors. 1995; 37(1): 32–64.
Publisher Full Text

Shinn N, Labash B, Gopinath A: Reflexion: an autonomous agent with
dynamic memory and self-reflection. arXiv preprint arXiv: 2303.11366. 2023.
Publisher Full Text

26.

Loshchilov I, Hutter F: Decoupled weight decay regularization. arXiv preprint
arXiv: 1711.05101. 2017.
Publisher Full Text

27.

Khan MSU, Stricker D: Situational awareness dataset for instruct-tuning
(sad-instruct). 2025.
https://figshare.com/articles/dataset/Situational_Awareness_Dataset_for_
Instruct-Tuning_SAD-Instruct_/28321805/1

13.

14.

Linghu X, Huang J, Niu X, et al.: Multi-modal situated reasoning in 3D scenes.
arXiv preprint arXiv: 2409.02389. 2024.
Publisher Full Text
Wald J, Dhamo H, Navab N, et al.: Learning 3D semantic scene graphs from
3D indoor reconstructions. In: Conference on Computer Vision and Pattern

Page 14 of 18

Open Research Europe

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Open Peer Review
Current Peer Review Status:
Version 1
Reviewer Report 30 August 2025

https://doi.org/10.21956/openreseurope.20057.r57568
© 2025 Linkon A. This is an open access peer review report distributed under the terms of the Creative Commons
Attribution License, which permits unrestricted use, distribution, and reproduction in any medium, provided the
original work is properly cited.

Ahmed Ali Linkon
Westcliff University, Irvine, California, USA
1. Summary of the Work
The manuscript introduces SituationalLLM, a fine-tuned large language model that integrates
scene graphs with dialogue-driven refinement to provide more context-aware task guidance. The
authors present a new dataset (SAD-Instruct), describe a multi-agent dialogue framework, and
demonstrate qualitative improvements over baseline LLMs (e.g., GPT-4, LLaMA-3). The paper
argues that situational awareness—recognizing gaps in environmental knowledge and proactively
clarifying them—is essential for reliable AI assistants in real-world tasks.
2. Strengths
Novelty: The integration of scene graphs into LLM workflows via a Scene Graph Language is
innovative and relevant to advancing context-grounded AI systems.
Dataset Contribution: The SAD-Instruct dataset is well-structured, diverse, and openly
available, which enhances reproducibility and research impact.
Methodological Clarity: The paper clearly outlines the three-step pipeline (scene graph
encoding, scenario-specific dialogues, fine-tuning).
Ethical Considerations: The authors emphasize safety and robustness by testing
harmful/ambiguous scenarios and showing model refusals.
Qualitative Evidence: Examples demonstrate that SituationalLLM reduces hallucinations and
provides more user-centered, adaptive guidance.
3. Weaknesses and Limitations
Evaluation Limited to Qualitative Analysis: The paper primarily reports qualitative
comparisons. Without quantitative benchmarks (e.g., task success rate, user satisfaction,
efficiency), it is difficult to rigorously validate the model’s performance.
Dataset Coverage: While diverse, SAD is limited to indoor scenarios. Broader coverage (e.g.,
outdoor, multimodal, or real-time contexts) is needed for generalizability.
User Studies Missing: The lack of human-centered evaluations makes it unclear how real
users perceive the system’s usability, trustworthiness, and effectiveness.
Dependency on Scene Graph Accuracy: The model’s success relies heavily on precise and
complete scene graph inputs. The limitations of scene graph generation methods are not
○

○

○

○

○

○

○

○

○

Page 15 of 18

Open Research Europe

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

fully addressed.
Scalability Concerns: Inference time may increase due to iterative clarifying dialogues. The
trade-offs between accuracy and efficiency are not systematically analyzed.
Ethical Section Could Be Expanded: Biases in training data and their downstream effects on
situational guidance are not discussed in depth.
4. Suggestions for Improvement
1. Introduce Quantitative Evaluation: Report measurable metrics such as:
Task completion success rates.
○

○

○

○

Average number of clarifying questions needed.

○

Time-to-completion compared to baselines.

○

User satisfaction ratings in simulated or real user studies.

2. Conduct User Studies: Evaluate with diverse participants to assess usability, trust, and
accessibility.
3. Expand Scenario Diversity: Include outdoor tasks, dynamic environments, and multimodal
signals (e.g., video streams, sensor data).
4. Efficiency Analysis: Provide benchmarks on latency and computational overhead of iterative
clarification vs. standard LLM outputs.
5. Address Dataset Biases: Discuss how biases in scene graph data or dialogue generation
could influence outputs and propose mitigation strategies.
6. Feedback Integration: Explore mechanisms for users to provide corrections or preferences,
enabling continuous model refinement.
7. Future Work Directions: Integration with AR/VR systems for immersive contextual assistance
could be highlighted more strongly.
5. Overall Recommendation
The manuscript presents a promising and timely contribution to the field of AI assistants and
context-aware LLMs. The novelty of combining structured scene graphs with interactive dialogue
is significant, and the open release of the dataset and model adds strong value for the research
community.
However, I recommend “Accept with Major Revisions” due to the current lack of quantitative
evaluation, user validation, and deeper exploration of ethical/bias considerations. Strengthening
these areas would considerably enhance the scientific rigor and practical applicability of the work.
Is the work clearly and accurately presented and does it cite the current literature?
Yes
Is the study design appropriate and does the work have academic merit?
Yes
Are sufficient details of methods and analysis provided to allow replication by others?
Yes
If applicable, is the statistical analysis and its interpretation appropriate?
Yes
Are all the source data underlying the results available to ensure full reproducibility?
Yes

Page 16 of 18

Open Research Europe

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Are the conclusions drawn adequately supported by the results?
Yes
Competing Interests: No competing interests were disclosed.
Reviewer Expertise: My expertise lies in Artificial Intelligence and Machine Learning, with a focus
on generative AI applications in healthcare and cybersecurity. I develop AI-driven solutions for
cancer care, precision medicine, and digital threat detection to improve patient outcomes and
strengthen security infrastructures.
I confirm that I have read this submission and believe that I have an appropriate level of
expertise to confirm that it is of an acceptable scientific standard, however I have
significant reservations, as outlined above.
Reviewer Report 02 May 2025

https://doi.org/10.21956/openreseurope.20057.r53218
© 2025 Pahune S. This is an open access peer review report distributed under the terms of the Creative
Commons Attribution License, which permits unrestricted use, distribution, and reproduction in any medium,
provided the original work is properly cited.

Saurabh Pahune
Cardinal Health, Dublin, Ohio, USA
Suggestions to Further Strengthen the Paper
To improve the results and conclusions of "SituationalLLM: Proactive Language Models with Scene
Awareness for Dynamic, Contextual Task Guidance," the suggestions below are put forward:
Broader User Testing: Do user studies with a variety of people to learn more about how
SituationalLLM works with people from different backgrounds. This would give us useful
information about how well the model works with different types of users and in real life.
Quantitative Metrics Should Be Used: Along with qualitative reviews, quantitative metrics like task
completion rates, task duration, and user satisfaction numbers should be used. With these
measurements, SituationalLLM's success could be judged more thoroughly and rigorously
compared to other models.
Lengthy tests: To see how users adjust to SituationalLLM over time, do long-term tests. This would
give us information about how well it works in the long run, how easy it is to use, and how many
users stay with it as they get better at it.
Integration with New Technologies: You could combine SituationalLLM with technologies like
augmented reality (AR) and virtual reality (VR) to improve situational awareness even more and
make more immersive contextual guidance apps, especially for education, training, and remote
support.

Page 17 of 18

Open Research Europe

Open Research Europe 2025, 5:61 Last updated: 30 AUG 2025

Expanded Ethical Considerations: Talk about possible biases in the training data and how they
might affect the model results in more detail. Taking these worries into account would help users
trust the app more, especially in private and important apps.
Strong Feedback Systems: Add feedback systems that let users report mistakes or suggest ways to
make things better. SituationalLLM would change over time to better meet the needs of people in
the real world if users kept adding new features.
References
1. Pahune S, Akhtar Z: Transitioning from MLOps to LLMOps: Navigating the Unique Challenges of
Large Language Models. Information. 2025; 16 (2). Publisher Full Text
2. Saurabh, P., Manoj. C.,: Several categories of Large Language Models (LLMs): A Short Survey.
arXiv preprint. Publisher Full Text
Is the work clearly and accurately presented and does it cite the current literature?
Yes
Is the study design appropriate and does the work have academic merit?
Yes
Are sufficient details of methods and analysis provided to allow replication by others?
Yes
If applicable, is the statistical analysis and its interpretation appropriate?
Partly
Are all the source data underlying the results available to ensure full reproducibility?
Yes
Are the conclusions drawn adequately supported by the results?
Yes
Competing Interests: No competing interests were disclosed.
Reviewer Expertise: LLM, GenAI, Supply Chain
I confirm that I have read this submission and believe that I have an appropriate level of
expertise to confirm that it is of an acceptable scientific standard, however I have
significant reservations, as outlined above.

Page 18 of 18
