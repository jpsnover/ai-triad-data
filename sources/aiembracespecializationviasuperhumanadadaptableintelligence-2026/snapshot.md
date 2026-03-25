<!--
  AI Triad Research Project — Document Snapshot
  Title      : AIEmbraceSpecializationViaSuperHumanAdadaptableIntelligence
  Source     : 
  Type       : pdf
  Captured   : 2026-03-07
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# AIEmbraceSpecializationViaSuperHumanAdadaptableIntelligence

> **Snapshot captured:** 2026-03-07
> **Source:** 
> **Type:** pdf

---

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

Judah Goldfeder * 1 Philippe Wyder * 2 Yann LeCun 3 Ravid Shwartz-Ziv 3

arXiv:2602.23643v1 [cs.AI] 27 Feb 2026

Abstract

widely public debates, much of the disagreement stems
less from evidence than from terminology: AGI is invoked
constantly, but rarely defined precisely, and the resulting
ambiguity has made the debate far more confusing and far
more polarized—than it needs to be.

Everyone from AI executives and researchers to
doomsayers, politicians, and activists is talking
about Artificial General Intelligence (AGI). Yet,
they often don’t seem to agree on its exact definition. One common definition of AGI is an AI
that can do everything a human can do, but are
humans truly general? In this paper, we address
what’s wrong with our conception of AGI, and
why, even in its most coherent formulation, it is
a flawed concept to describe the future of AI. We
explore whether the most widely accepted definitions are plausible, useful, and truly general. We
argue that AI must embrace specialization, rather
than strive for generality, and in its specialization
strive for superhuman performance, and introduce
Superhuman Adaptable Intelligence (SAI). SAI
is defined as intelligence that can learn to exceed
humans at anything important that we can do, and
that can fill in the skill gaps where humans are incapable. We then lay out how SAI can help hone
a discussion around AI that was blurred by an
overloaded definition of AGI, and extrapolate the
implications of using it as a guide for the future.

Much of the discourse uses human intelligence as a
paradigm of generality, but we argue that this notion is fundamentally misguided. As humans, we struggle to perceive
our own blind spots; this leads to the illusion of generality.
In truth, we are only good at the specific subset of tasks that
are important to our existence, but are completely incapable
of performing tasks outside this narrow range. Awareness of
human limitation gives rise to a critical realization: humans
may be specialized creatures, but are nonetheless capable
of accomplishing or quickly learning a wide range of incredible things. We argue that the current focus on AGI and
generality as the North Star of the field, should be replaced
with an emphasis on adaptability, including the time it takes
to learn a new task, and the range of tasks capable of being learned. We refer to this as Superhuman Adaptable
Intelligence (SAI). A natural corollary of an emphasis on
adaptability is the need for a model with strong assumptions
about the world. This suggests self-supervised learning
(SSL) as a promising way to acquire generic knowledge,
and world models as a useful mechanism for planning and
zero-shot task transfer. We believe that recentering the discourse around SAI will lead towards better communication,
clearer goals, and more rapid progress.

1. Introduction
The AI community has become increasingly fractured over
where the field is headed. On one side are “doomers,” who
argue we are headed towards a gruesome societal endgame—
mass unemployment, loss of human agency, and a future in
which humanity becomes subordinate to artificial overlords.
On the other side are those who expect advanced artificial intelligence to bring something close to utopia, ending hunger,
suffering, and scarcity. A third camp frames AI as a “normal technology,” forecasting major impacts but rejecting
extreme narratives (Narayanan & Kapoor, 2025).

[Pos. #1] Human intelligence is not general in any
meaningful way
[Pos. #2] Generality is not a requirement for an intelligence to be extremely useful
[Pos. #3] There is no consensus on the meaning of the
term AGI in industry or academia

Central to all of these views is the concept of Artificial
General Intelligence or AGI. Yet, as is often the case in

[Pos. #4] Existing definitions are insufficient
[Pos. #5] We should instead focus on Superhuman
Adaptable Intelligence, which points toward SSL and
world models

Columbia University, New York, NY, USA 2 Distyl, New York,
NY, USA 3 New York University, New York, NY, USA. Correspondence to: Judah Goldfeder <jag2396@columbia.edu>.
Preprint. March 2, 2026.

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

2. Human Intelligence is Specialized

in general are bad at chess; Magnus is much better than
most humans. The conclusion, that Magnus is good at chess,
is a perfect illustration of our own human centric biases.
Magnus Carlsen is not objectively good at chess, he is good
at chess with respect to human performance levels. By
any objective metric, playing chess at a much higher level
is not difficult from a computational perspective, but it is
something that humans are incapable of. Relatedly, many
animals can perform tasks that humans cannot do at a high
level, such as echolocation.

While the idea of human intelligence as the paradigm of
generality is ubiquitous in the literature, two related but
distinct notions of generality are often conflated:
1. The average, educated human is capable of a wide
range of tasks that are very “general“ in nature, and
enable a wide range of objectives to be accomplished.
This includes things like complex planning and locomotion, fine motor skills, abstract thinking, self simulation, spatial reasoning, and visual understanding.

So what are humans then, if not a paradigm of general
intelligence? The evidence points to specialized adaptation.
We have an incredible ability to adapt and specialize, within
the range of tasks that we evolved to address (Russell &
Norvig, 2010). This is the main contention of [Pos. #1].

2. Human intelligence as a whole is “general“ because it
can be specialized to “any“ given task, whether it be
medicine, advanced mathematics, plumbing, or playing
chess.

Alternative Views
Both of these claims make the same error: circularly defining generality in human terms, and then asserting humanity as its paradigm.

Several objections have been raised to our assertion that humans are not general. Elon Musk and Demis Hassabis have
claimed that our argument conflates General Intelligence
with Universal Intelligence. They further argue that the human brain is indeed general in the Turing Machine sense,
capable of learning anything computable given enough time,
memory, and data. They therefore claim that ”brains are
the most exquisite and complex phenomena we know of
in the universe (so far), and they are in fact extremely general” (Hassabis, 2025; Musk, 2025).

Evolution has honed humanity over time to be highly specialized in the domain of skills necessary for survival in
the physical world. The things most innate to us are not
always the most simple, but the most critical for our survival. This observation has given rise to Moravec’s Paradox,
where the tasks we find easiest, like locomotion, are difficult
for computers, but tasks that we find difficult, which are
not essential to our survival, like playing chess, turn out to
be much easier for computers. This clearly illustrates the
illusion of our generality. While the average abilities of an
educated human are truly remarkable, one only need ask
them to play chess like a grandmaster, or compose a musical symphony like Beethoven, to truly realize the hubris of
calling such an intelligence general.

In response, it is indeed important to clarify terms. Universal Intelligence refers to the ability to act intelligently over
all computable environments (Legg & Hutter, 2007). General Intelligence, as Demis is using it, seemingly refers to
adaptation to any computable task given time and resources.
Far from conflating the terms, we are arguing that humans
are not capable of either of these things.

The above argument serves to dispel the first definition of
generality. The second notion of generality is more subtle
in its error. By identifying specialization/adaptation as the
core component of generality, it is closer to the definition
of SAI that we are arguing in favor of. However, our point
of contention is that we object to calling human adaptation
general. While we are excellent at adapting to the tasks
that were of high evolutionary importance, we are simply
incapable of adapting to many tasks outside of this range
at a high level. Take chess as an example. Magnus Carlsen
is widely regarded as the greatest chess player of all time,
and as such represents the pinnacle of human adaptation
when it comes to playing chess. But this begs the question:
Is Magnus actually any good at chess? When compared
with the best computers, the answer is clearly no. Even
more damning is that with modern day computers, creating
a program that plays chess at a much higher level than
Magnus is not particularly difficult. Our perception of his
ability is colored by the limitations of humanity. Humans

While the issue of whether approximate Turingcompleteness under idealized conditions matters for
defining intelligence is a legitimate question, it is missing
the point. Even if we grant the fact that human brains are
approximately Turing-complete (far from an obvious fact),
under real constraints such as finite memory, finite time,
and finite attention, we handle only a tiny sliver of possible
problems. The space of possible functions is unimaginably
vast, and we can represent an infinitesimal fraction. We
feel general because we can’t perceive our blind spots, not
because we lack them.

3. Implications for AI North Star Terminology
3.1. A Survey of Definitions
Measuring machine intelligence is non-trivial. Languagebased tests, such as the Turing Test, where a machine has

LEARN (Adaptability)

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

Legg & Hutter (2007)
Universal Intelligence

Legend

SAI

Chollet(2019)
(2019)
Chollet

Adaptable Intelligence inside
and outside human domain

Skill-Acquisition
Skill-Acquisition Efficiency
Efficiency

Adaptive Generalists
(Focus: Learning)

Cognitive Mirrors

(Focus: Human Tasks)

Economic Engines

Xu (2024)

(Focus: Utility/Jobs)

Open Environments

Hendrycks (2025)

DO (Performance)

Cognitive Capabilities

Morris et al. (2023)
Levels of AGI

Wozniak (2010)

Anything

Anything Important

Nilsson (2005)

Employment Test

OpenAI (2018)

Embodiment “Coffee” Test

Economically Valuable

Anything Humans
Can Do

Anything Important
Humans Can Do

Figure 1. A two-dimensional semantic map organizing prominent definitions for AGI and other North Star measures of artificial
intelligence, along two axes. The vertical axis represents the source of intelligence, ranging from performance-based capabilities (DO,
bottom) to learning and adaptability (LEARN, top). The horizontal axis represents the scope of tasks, from universal/open-ended domains
(left) to human-centric and economically-focused domains (right). Definitions cluster into three categories: Adaptive Generalists (teal)
emphasize learning efficiency and generalization in open environments; Cognitive Mirrors (violet) focus on replicating human-level
cognitive capabilities across broad task domains; Economic Engines (orange) prioritize practical utility and economic value in humanrelevant tasks. Superhuman Adaptable Intelligence (SAI) falls into the realm of adaptable AI that can do anything that is important both
inside and outside the human realm.

to pretend to be a human well enough to fool a human to
believe the machine is human (Turing, 1950) and the Winograd schema challenge that tests common-sense reasoning
and natural language understanding (Levesque et al., 2012)
are helpful to measure aspects of intelligence, but not a
true measure of whether AGI is achieved. Steve Wozniak’s
Coffee Test—whether a machine could make a cup of coffee if sent to a random kitchen—draws attention to the fact
that, despite claims to the contrary(Chen et al., 2026), language alone is not sufficient to be considered intelligent
and that human intelligence adapts well to unseen environments (Wozniak, 2010). AGI definitions commonly fall
into categories along two axes, the first one defining what
capabilities we are referring to, and the second defining the
required scope of those capabilities:

We visualized popular definitions of AGI in accordance with
this two-dimensional framework in Fig. 1.

1. Axis 1 (capability): (A) AI that can learn to do tasks
vs (B) AI that can do tasks out of the box

Regardless, one thing is clear: AGI as a term is overloaded
with varying definitions from high-impact sources. This
confusion has even led to claims that AGI has already arrived(Agüera y Arcas & Norvig, 2023; Chen et al., 2026).
The varying definitions plotted in Fig. 1 and the imprecise
nature of the public discussions being had by high-profile

There is a reasonable argument to be made for a third axis
that spans the space from observable capability to subjective
understanding (Searle, 1980), thereby including the dimension of the internalist view. According to this view, an AI
could meet any performance benchmark for AGI, yet if it
lacks subjective experience (qualia), it remains merely a
simulation of intelligence rather than the genuine article.
While the exploration of this dimension is profound, we
consider it outside the scope of this work. Our focus is
on operational definitions—metrics that can be observed
and measured—whereas the internalist objection currently
resides in the realm of metaphysics and philosophy of mind,
offering no falsifiable test for engineering progress.

2. Axis 2 (scope): (I) Anything, (II) Anything important,
(III) Anything humans can do, (IV) Anything humans
can do that is important

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

individuals around AGI, as shown in the previous section,
clearly demonstrate [Pos. #3].

limited sense” (Chollet, 2019), but we contend that this is
simply an inherent contradiction of terminology. For this
reason, Shane Legg and Marcus Hutter speak of ”Universal
Intelligence” rather than AGI because human intelligence is
”far too limited” (Legg & Hutter, 2007), since a definition
of AGI that is human-centric excludes the infinite space of
non-human intelligence (Wang, 2019). Despite the above
objections, AGI defined specifically as the ability to match
human cognitive breadth is quite popular: Hendrycks et al.
and Morris et al. argue that human generality is the only
general example for the concept of intelligence (Hendrycks
et al., 2025; Morris et al., 2024). While the above emphasized the ability to do anything humans can do, others argue
that AGI must be able to learn to do or do anything important that humans can do. Their arguments acknowledge
that the domain of human intelligence is finite and that it is
desirable for AI to be able to perform or learn to perform
a subset of important tasks: tasks that generate economic
value. In the words of Nilsson, ”Systems with true humanlevel intelligence should be able to perform the tasks for
which humans get paid” (Nilsson, 2005).1 , an idea further
echoed in the OpenAI Charter (OpenAI).

3.2. Why Existing Definitions are Insufficient
[Pos. #1] has the following implications for these definitions:
1. Humanity is still quite useful, so AI does not need to be
general to still be groundbreaking and powerful ([Pos.
#2]).
2. Any definition focused exclusively on humanity as a
goal cannot claim to be general.
3. Focusing exclusively on humans is also not ideal, since
there are many tasks we cannot do that are still high
utility and important.
In addition, for a definition to be useful, it must meet the
following criteria:
1. It must be feasible. If a goal is not possible to be realized from a theoretical perspective, it provides questionable value.

We suspect that the cause for such a widespread conflation
of human intelligence with generality stems from the urge
for self-flattery, and the difficulty of truly conceiving of
our own limitations. Regardless, all the definitions in this
category fail our criteria by not being internally consistent.

2. It must be internally consistent. If a definition claims to
be general, it must actually be general in a meaningful
way.

One might raise the objection that our contention here is
merely one of semantics, and that these definitions can still
be valuable North Stars for the field, even if they misuse the
term ”general”. In response, we argue that when defining
the end goal of an entire field, semantics are extremely
important. A misapprehension of generality is dangerous
for several reasons. It obscures how such an intelligence can
actually be realized, which violates our feasibility criteria.
Further, it can lead to unnecessarily narrow conceptions of
what the end goal should be. For example, the belief that
humans are general has led to several definitions of AGI as
mimicking humans, which is certainly far too limited a goal
for what AI is and can become.

3. It must be assessable. The goal as presented should
lead to clear subgoals and strategies, and there must be
a clear metric with which to measure progress.
Having established these criteria, we can now demonstrate
[Pos. #4], namely that existing definitions come up short.
First, definitions of AGI that claim true generality fall prey to
the ”No Free Lunch” theorem—no single, general-purpose
machine learning algorithm or optimization strategy works
best for every problem (Wolpert & Macready, 1997). Or to
frame it differently: given finite energy, an approach that
directs available energy towards learning a finite set of tasks
will reasonably outperform an approach that distributed the
finite energy over an infinite amount of tasks. At the limit,
the amount of energy dedicated to each of the infinite tasks
approaches zero. Thus, any definition that defines the scope
as literally anything computable fails our criteria by not
being feasible.

Third, definitions of AGI that cannot be assessed or evaluated are not practical or useful. Legg and Hutter acknowledge this issue in their paper: ”various practical challenges
will need to be addressed before universal intelligence can
be used to construct an effective intelligence test” (Legg &
Hutter, 2007). The ability to measure progress is critical
for many reasons. An enormous body of evidence suggests
that the precise ability to measure progress is one of the

Second, any definition of AGI that focuses on a subset
of tasks, or that emphasizes specialization and adaptation
as key metrics, can not truly be said to be general. Similarly, AGI measured by the ”general” nature of humans
is not truly general. Chollet acknowledges this problem
and states that human intelligence ”is only “general” in a

Nilsson doesn’t use the term AGI, he speaks of ”strong AI”
or ”human-level artificial intelligence” (the term was popularized
later by Shane Legg and Ben Goertzel), but still pushes the idea of
humans being ”more-or-less” general purpose

AI Must Embrace Specialization via Superhuman Adaptable Intelligence
AGI Definition

Failure mode

Explanation

“Match or exceed the cognitive versatility and proficiency
of a well-educated adult.” (Hendrycks et al., 2025)
“Highly autonomous systems that outperform humans at
most economically valuable work.” (Morris et al., 2024)
“A system that should be able to do pretty much any
cognitive task that humans can do.” — Demis Hassabis
(DeepMind CEO) (Mitchell, 2024)

Not Consistent

“We need precise, quantitative definitions and measures of
intelligence – in particular human-like general
intelligence.... ...The intelligence of a system is a measure
of its skill-acquisition efficiency over a scope of tasks,
with respect to priors, experience, and generalization
difficulty” (Chollet, 2019)
“We define AGI as a system that demonstrates broad
generality (performing a wide range of tasks) and high
performance (matching or exceeding human levels).”
(Morris et al., 2024)
“Intelligence measures an agent’s ability to achieve goals
in a wide range of environments.” (Legg & Hutter, 2007)

Not Consistent

Human cognition is not general in any meaningful
way. This definition is also unnecessarily narrow
The focus here is explicitly on a subset of tasks that
are of economic worth. Clearly not General
This definition is not actually general both in its focus
on humans, and also in its focus on ”cognitive tasks”,
which seems to be to the exclusion of physical tasks
like locomotion
Chollet himself admits as much, calling human
cognition ’only “general” in a limited sense’, a
contradiction of terms

”Highly autonomous systems that outperform humans at
most economically valuable work” (OpenAI).

Not Consistent
Not Consistent

Not Feasible

Not Feasible

Not
Assessable

While they acknowledge generality requires
exceeding human levels, with a focus on direct
performance over adaptation, such a system is not
realizable with finite resources.
Legg and Hutter define the domain of environments
as all that are computable. They further emphasize
ability over adaptability. Strong ability on such a vast
set of tasks is not realizable with finite resources
The focus on performance means that any evaluation
would have to benchmark against an ever growing set
of tasks

Table 1. The failure of most AGI definitions. Note: some definitions fail for multiple reasons, but we only highlight one.

strongest catalysts of progress itself (Wyder et al., 2025).
Relatedly, clear metrics usually give an idea of what sorts
of subgoals and strategies are useful. Even more fundamentally, a definition that is not measurable is not really much
of a definition at all, and is often indicative of a lack of
precision, or a hand-wavy nature.

ideal combination for thriving in any one of them (Forister
et al., 2012). Organisms face persistent trade-offs: improving performance on one niche often reduces performance
elsewhere, and selection therefore tends to favor designs
that are sharply tuned to the local payoff landscape rather
than uniformly competent across all possible conditions (Futuyma & Moreno, 1988). In markets and organizations, the
same logic appears under a different name: entities that fail
to meet the performance threshold disappear, so competition acts as a selection mechanism that amplifies effective
strategies and eliminates ineffective ones (Hannan & Freeman, 1977; Loasby, 1983). AI systems are not exempt from
this pressure: models that are too costly, too unreliable, or
insufficiently accurate in the domains that matter will be neglected in favor of systems that are better matched to those
domains.

This criterion highlights a key difference between the two
categories of definitions on our first axis (capability). Any
definition that focuses on learning or adapting implicitly
has a clear metric with which to evaluate intelligence: speed
of adaptation to new tasks. Conversely, definitions focused
on doing and performing often lack any obvious way to
measure this, other than benchmarking the AI’s ability to do
everything, an ever-expanding and ill-defined set of benchmarks. Table 1 elaborates on our issues with many popular
AGI definitions ([Pos. #4]).

In machine learning, the core mathematical point is that
performance gains require assumptions about the problem
class i.e. the target distribution. Again, “No Free Lunch”.
An algorithm wins by being a good fit for the target problem.
As AI improves, specialized systems can improve too: if
it is possible to attain a higher performance on a task, a
system that concentrates that capability on a narrower task
can typically realize larger gains than a system that must
spend capacity and compute covering additional unrelated
tasks.

4. Why Specialization Wins
To motivate [Pos. #5], it behooves us to explore the importance of specialization. Specialization is not an accident of
biology; it is a predictable consequence of limited resources,
competing objectives, and environments that reward performance on a small subset of evolutionarily relevant challenges. Forister et al. state that a generalist organism carries
genetic traits suited to various environments, but never the

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

Practically, this means that generality is intractable. Although multi-task learning can benefit performance when
tasks share an underlying structure, it can lead to ”negative
transfer” when tasks compete for representational capacity or impose conflicting gradients, and thereby harm task
performance (Ruder, 2017). Models that route queries to
specialized subsets of model parameters depending on the
task are a technological acknowledgment of this limitation—
these systems attain breadth and scale through repeated,
modular specialization rather than uniform shared parameters for all inputs(Fedus et al., 2022). Although seemingly ”general”, these models achieve their best performance
through internal specialization.

fore produce maladaptive outputs in contemporary environments (Li et al., 2018). This creates an opportunity:
specialized AI systems can be designed to excel exactly
where humans are weak but where correctness now matters
(e.g., high-dimensional statistical inference, optimization
under constraints, complex mechanistic modeling) (Tversky
& Kahneman, 1974; Domingos, 2012).
Finally, none of this implies that generality is “bad”. It implies a narrower, more operational claim: we must embrace
specialization rather than fight it. Even in domains that feel
like demonstrations of “general intelligence,” the history of
AI milestones frequently reflects intense domain targeting
rather than broad competence, while newer “general” methods still succeed by exploiting strong structure in the task
family (Silver et al., 2018). For high-stakes applications
(e.g., scientific discovery, medicine), the correct aspiration
is not to preserve the romance of a single generalist mind,
but to build the strongest available specialists—and, where
needed, compose them into systems whose coordination is
engineered rather than assumed.

Universal generality is a theoretical concept, but in practical
terms it is a myth. A large fraction of what we intuitively
mean by “do anything” reduces to planning and decisionmaking under uncertainty. Classical planning problems
quickly become intractable in worst case (e.g., propositional
STRIPS variants) (Bylander, 1994), and probabilistic planning inherits similarly severe complexity barriers (Littman
et al., 1998). This does not mean planning is impossible in
practice; it means that broad generality across arbitrary environments has no reason to be computationally cheap. A specialized agent that restricts the space of environments, goals,
and action models it must handle can leverage structure
and avoid worst-case blowups. This is similar for humans,
as our biases, genetic makeup, and environment naturally
drive us towards “human things,” a mere sliver of universal
generality.

We should also note that this claim does not dispute the
bitter lesson (Sutton, 2019). The bitter lesson is the observation that approaches that scale with computational power
tend to outperform ones based on domain knowledge, a
claim that we agree with. The diminishing usefulness of
domain knowledge is distinct from the usefulness of domain specialization. As scaling progresses, we will need to
know less about proteins to build a system that does protein
folding; however, such a system still benefits from focusing
specifically on proteins.

Empirically, specialized AI systems repeatedly demonstrate
the advantage of concentrating model design, data curation,
and evaluation around a single domain objective. Protein
structure prediction is an archetypal example: AlphaFold
achieved dramatic gains by targeting a specific scientific
task with task-specific training and architectural choices,
and it set a new bar for accuracy and usefulness in that
domain (Jumper et al., 2021). It is therefore plausible—
indeed, expected under both the No Free Lunch framing
and negative-transfer dynamics—that an AI system asked
to “fold proteins and fold laundry” will not match a proteinfolding specialist on protein-folding performance unless it
internally recovers specialization (e.g., via routing, modularity, or dedicated submodels) (Wolpert & Macready, 1997;
Ruder, 2017; Fedus et al., 2022; Jumper et al., 2021).
Specialization also clarifies why AI can be uniquely valuable: it can target precisely the domains where human cognition is systematically miscalibrated. Humans exhibit stable
biases and heuristics that are often sensible under ancestral constraints but error-prone in modern settings (Tversky
& Kahneman, 1974). More broadly, the evolutionary mismatch hypothesis argues that many psychological mechanisms were tuned for past selection regimes and can thereFigure 2. Illustration of the task space overlap between the human
domain and the AI domain within the universal task space.

Awareness of the ”narrowness” of humans and the benefit
of specialization allows us to exploit the complementary
nature of AI as it is filling in the gaps in the human domain

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

where it matches or eclipses human performance, while also
being able to perform tasks outside the human domain (see
figure 2).

5. Towards Superhuman Adaptable
Intelligence
Given the utility of specialization, we propose Superhuman
Adaptable Intelligence (SAI) as the idée fixe of AI research
([Pos. #5]). Unlike the earlier AI North Star terminologies
that we challenged, our definition of SAI sidesteps issues of
feasibility by focusing on adaptation to tasks with human
utility, as opposed to the performance of simply doing the
task. We embrace the necessity of specialization, and avoid
the pitfall of claiming generality. Further, we broaden the
task domain beyond the human task domain, while not requiring that the AI is master of the human task domain as
a whole. Finally, adaptation speed—the speed with which
an agent can acquire new skills and learn new tasks, can be
measured, and thus our approach is practical.
Figure 3. Illustration of autoregressive model divergence

Definition
Metric

Superhuman Adaptable Intelligence (SAI) is capable of adapting to exceed humans at any task humans
can do, while also being able to adapt to tasks outside
the human domain that have utility.

SAI is measured by the speed with which it takes an
agent to acquire new skills and learn new tasks.
Our vision towards SAI as a North Star is potentially realizable via self-supervised learning (SSL). We believe that
learning in the embedding space as opposed to in the token
space may drive performance gains. We also believe that
world models may help us advance towards SAI. Simultaneously, we reject the concept of a single model or architecture
as the ”one paradigm to rule them all,” as it would suggest
that the evolution of artificial intelligence will come to a
halt once that architecture has been discovered.

Our definition is most similar to Chollet’s (Chollet, 2019),
except that we object to calling such a definition general,
and also reject his view that we ”should benchmark progress
specifically against human intelligence”. While human performance can be a useful reference point during early development, we argue that anchoring benchmarks to human
baselines is ultimately orthogonal to the route to superhuman capability. AI models and systems that optimize
well-defined objectives and improve through self-play, evolutionary search, or large-scale exploration in simulation
can surpass human performance without imitation (Zhao
et al., 2025). We believe that over-indexing on “humanlevel” metrics risks misspecifying the target and limiting
evaluation to anthropocentric tasks and constraints.

It is also important to note that our definition emphasized
tasks outside the human domain that have utility. The purpose of this clause was to exclude a potential infinitely set
of useless tasks from our definition, but we have not as of
yet precisely defined utility, or how we determine task importance. Many definitions have been proposed, such as
economic value or societal agreement. The exact definition
one prefers is largely orthogonal to our arguments here, and
we leave debating which one is most appropriate to other
work.

More broadly, any evaluation scheme that treats intelligence
as a checklist of fixed competencies—whether anchored to
human baselines or to an ever-growing catalog of tasks—
misses the point of SAI. Instead, the focus should be on
minimizing adaptation time. The space of possible skills
is effectively unbounded, so individually testing skills becomes a Sisyphean endeavor.

5.1. Why Self Supervised Learning
By shifting the focus from performance to adaptation, SAI
points to SSL as a potential pathway. Specializing to a wide

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

range of tasks requires the ability to learn generic knowledge. In many real-world settings, supervised learning is not
feasible in practice because it presupposes access to large,
reliably labeled datasets (LeCun et al., 2015)—an assumption that often fails outside carefully curated benchmarks.
In contrast, SSL can be applied to any data that contain exploitable internal structure (Balestriero et al., 2023). Further,
perhaps even more powerful, SSL has actually been shown
to be on par with and even exceed SL even when supervision
is abundant (He et al., 2020; Grill et al., 2020; Chen et al.,
2020; He et al., 2022). SSL fueled the rise of GPTs, and has
reached SOTA performance in most domains.

et al., 2021); their errors diverge exponentially with prediction length (LeCun, 2024), as shown in figure 3. In practice,
compounding prediction error makes long-horizon interaction brittle. SAI counters homogenization and drives diversity in AI development. It provides a more coherent and
reasonable target that fosters a diversity of specialization
profiles. Embracing specialization counteracts incentives
that lead to fast convergence towards the mean.

6. Discussion
The AGI discourse is often framed as a single destination,
benchmarked against an ill-defined notion of “human-level”
generality. We argue that this framing is both scientifically
unhelpful and operationally misleading. Human intelligence
is not a universal competence engine; it’s a collection of
specialized capabilities shaped by constraints and selective
pressures. There is no reason to expect the most capable
artificial systems to mirror the human task distribution, nor
to treat human performance as the natural reference point
for progress.

5.2. The substrate for fast adaptation
Adaptation and specialization can be produced by many
architectures and paradigms, yet which architecture is most
performant remains an open research question. Designing
maximally adaptable algorithms remains a central pursuit
of meta learning (Finn et al., 2017). The brain is not a
monolith, but a system of systems. This suggests that no
single system will be able to adapt in the way that humans
do. Thus, we believe that adaptation requires hierarchy and
diversity of models and modalities.

We propose Superhuman Adaptable Intelligence (SAI) as
a more concrete and productive North Star: the ability to
rapidly adapt to important tasks inside and outside the human domain. The central quantity is not a checklist of
skills, but the speed and efficiency with which new skills
are acquired under realistic resource constraints. This reframes evaluation away from human-centric benchmarks
and toward measurable adaptation dynamics.

Specifically, we believe that adaptation is benefitted by a
world model and by moving from token level prediction to
latent prediction architectures such as Dreamer 4, Genie 2,
or Joint Embedding Prediction Architecture (JEPA) (Van Assel et al., 2025; Assran et al., 2023; Hafner et al., 2025;
Bruce et al., 2024). Pixels are not state. The physical world
is too rich and too stochastic for pixel-level prediction to be
a meaningful objective; what matters is learning and forecasting a compact representation that captures the system’s
dynamics. It has long been posited that humans and animals
make heavy use of world models in their cognition (Craik,
1967). A world model allows for simulation, and therefore
planning (Schrittwieser et al., 2020). As such, it is the hallmark of zero shot and few shot adaptation (LeCun, 2022).
Although, we find this argument towards a particular group
of architectures persuasive, SAI doesn’t dictate a specific
architecture.

Key Insight
The AI that folds our proteins should not be the AI
that folds our laundry!
Finally, SAI’s specialization focus fosters an environment
that promotes diverse engineering approaches. Progress
won’t come from a single architecture optimized for nexttoken prediction. We believe instead that systems that learn
general latent structure from unlabeled data, build world
models that support planning, and compose specialized modules are better suited to fast adaptation. Put another way: it
is highly unlikely that an AI tasked to fold both proteins and
laundry will exceed a protein-folding specialist at protein
folding or a laundry-folding specialist at laundry folding.
Given limited resources, capability should be allocated to
the tasks that carry utility rather than to an anthropocentric notion of universal competence. One promising path
forward is therefore to emphasize self-supervised learning
approaches, predictive world models, and modularity—and
to judge advances by how quickly and reliably they produce
new competence, rather than by how closely they imitate
human behavior.

5.3. On the importance of diversity
Homogeneity kills research. Autoregressive LLMs and
LMMs have become the dominant architecture in the stateof-the-art ”general” AI space (Huang et al., 2024; Su, 2025).
This concentration is understandable—shared tooling and
benchmarks create momentum—but it also narrows the
search space. Progress is most rapid when a greater diversity of solutions are explored.
In addition to slowing progress, these homogeneous solutions are often only local optima. GPTs and similar autoregressive models are no exception, they have many flaws (Lin

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

References

Domingos, P. A few useful things to know about machine learning. Commun. ACM, 55(10):78–87, OctoAgüera y Arcas, B. and Norvig, P. Artificial general
ber 2012. ISSN 0001-0782. doi: 10.1145/2347736.
intelligence is already here. Noema Magazine, Octo2347755.
URL https://doi.org/10.1145/
ber 2023. URL https://www.noemamag.com/
2347736.2347755.
artificial-general-intelligence-is-already-here/.
Accessed: YYYY-MM-DD.
Fedus, W., Zoph, B., and Shazeer, N. Switch transformers:
scaling to trillion parameter models with simple and effiAssran, M., Duval, Q., Misra, I., Bojanowski, P., Vincent,
cient sparsity. J. Mach. Learn. Res., 23(1), January 2022.
P., Rabbat, M., LeCun, Y., and Ballas, N. Self-supervised
ISSN 1532-4435.
learning from images with a joint-embedding predictive
architecture. In 2023 IEEE/CVF Conference on ComFinn, C., Abbeel, P., and Levine, S. Model-agnostic metaputer Vision and Pattern Recognition (CVPR), pp. 15619–
learning for fast adaptation of deep networks. In Interna15629, 2023. doi: 10.1109/CVPR52729.2023.01499.
tional conference on machine learning, pp. 1126–1135.
PMLR, 2017.
Balestriero, R., Ibrahim, M., Sobal, V., Morcos, A., Shekhar,
S., Goldstein, T., Bordes, F., Bardes, A., Mialon, G.,
Tian, Y., Schwarzschild, A., Wilson, A. G., Geiping, J.,
Garrido, Q., Fernandez, P., Bar, A., Pirsiavash, H., LeCun,
Y., and Goldblum, M. A cookbook of self-supervised
learning, 2023. URL https://arxiv.org/abs/
2304.12210.

Forister, M. L., Dyer, L. A., Singer, M. S., Stireman III, J. O., and Lill, J. T.
Revisiting the
evolution of ecological specialization, with emphasis on insect–plant interactions. Ecology, 93(5):981–
991, 2012. doi: https://doi.org/10.1890/11-0650.1.
URL https://esajournals.onlinelibrary.
wiley.com/doi/abs/10.1890/11-0650.1.

Bruce, J., Dennis, M., Edwards, A., Parker-Holder, J.,
Shi, Y., Hughes, E., Lai, M., Mavalankar, A., Steigerwald, R., Apps, C., Aytar, Y., Bechtle, S., Behbahani,
F., Chan, S., Heess, N., Gonzalez, L., Osindero, S.,
Ozair, S., Reed, S., Zhang, J., Zolna, K., Clune, J.,
de Freitas, N., Singh, S., and Rocktäschel, T. Genie: Generative interactive environments, 2024. URL
https://arxiv.org/abs/2402.15391.

Futuyma, D. J. and Moreno, G. The evolution of
ecological specialization. Annual Review of Ecology, Evolution, and Systematics, 19(Volume 19,
1988):207–233, 1988.
ISSN 1545-2069.
doi:
https://doi.org/10.1146/annurev.es.19.110188.001231.
URL
https://www.annualreviews.org/
content/journals/10.1146/annurev.es.
19.110188.001231.

Bylander, T. The computational complexity of propositional strips planning.
Artificial Intelligence,
69(1):165–204, 1994.
ISSN 0004-3702.
doi:
https://doi.org/10.1016/0004-3702(94)90081-7.
URL
https://www.sciencedirect.com/
science/article/pii/0004370294900817.

Grill, J.-B., Strub, F., Altché, F., Tallec, C., Richemond, P.,
Buchatskaya, E., Doersch, C., Avila Pires, B., Guo, Z.,
Gheshlaghi Azar, M., et al. Bootstrap your own latent-a
new approach to self-supervised learning. Advances in
neural information processing systems, 33:21271–21284,
2020.

Chen, E. K., Belkin, M., Bergen, L., and Danks, D. Does
ai already have human-level intelligence? the evidence
is clear. Nature, 650:36–40, 2026. doi: 10.1038/
d41586-026-00285-6. URL https://www.nature.
com/articles/d41586-026-00285-6.
Accessed: YYYY-MM-DD.

Hafner, D., Yan, W., and Lillicrap, T. Training agents
inside of scalable world models, 2025. URL https:
//arxiv.org/abs/2509.24527.
Hannan, M. T. and Freeman, J. The population ecology
of organizations. American Journal of Sociology, 82(5):
929–964, 1977. doi: 10.1086/226424. URL https:
//doi.org/10.1086/226424.

Chen, T., Kornblith, S., Norouzi, M., and Hinton, G. A
simple framework for contrastive learning of visual representations. In International conference on machine
learning, pp. 1597–1607. PmLR, 2020.

Hassabis, D.
Yann is just plain incorrect here,
he’s confusing general intelligence with universal intelligence.
X (formerly Twitter) post, December
2025. URL https://x.com/demishassabis/
status/2003097405026193809.
Posted by
@demishassabis.

Chollet, F. On the measure of intelligence, 2019. URL
https://arxiv.org/abs/1911.01547.
Craik, K. J. W. The nature of explanation, volume 445. CUP
Archive, 1967.

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

He, K., Fan, H., Wu, Y., Xie, S., and Girshick, R. Momentum contrast for unsupervised visual representation
learning. In Proceedings of the IEEE/CVF conference on
computer vision and pattern recognition, pp. 9729–9738,
2020.

Legg, S. and Hutter, M. Universal intelligence: A definition
of machine intelligence. Minds and machines, 17(4):
391–444, 2007.
Levesque, H. J., Davis, E., and Morgenstern, L. The winograd schema challenge. In Proceedings of the Thirteenth
International Conference on Principles of Knowledge
Representation and Reasoning, KR’12, pp. 552–561.
AAAI Press, 2012. ISBN 9781577355601.

He, K., Chen, X., Xie, S., Li, Y., Dollár, P., and Girshick,
R. Masked autoencoders are scalable vision learners. In
Proceedings of the IEEE/CVF conference on computer
vision and pattern recognition, pp. 16000–16009, 2022.
Hendrycks, D., Song, D., Szegedy, C., Lee, H., Gal, Y.,
Brynjolfsson, E., Li, S., Zou, A., Levine, L., Han, B.,
Fu, J., Liu, Z., Shin, J., Lee, K., Mazeika, M., Phan, L.,
Ingebretsen, G., Khoja, A., Xie, C., Salaudeen, O., Hein,
M., Zhao, K., Pan, A., Duvenaud, D., Li, B., Omohundro,
S., Alfour, G., Tegmark, M., McGrew, K., Marcus, G.,
Tallinn, J., Schmidt, E., and Bengio, Y. A definition of
agi, 2025. URL https://arxiv.org/abs/2510.
18212.
Huang, D., Yan, C., Li, Q., and Peng, X. From large
language models to large multimodal models: A literature review. Applied Sciences, 14(12), 2024. ISSN
2076-3417. doi: 10.3390/app14125068. URL https:
//www.mdpi.com/2076-3417/14/12/5068.
Jumper, J., Evans, R., Pritzel, A., Green, T., Figurnov,
M., Ronneberger, O., Tunyasuvunakool, K., Bates, R.,
Žı́dek, A., Potapenko, A., Bridgland, A., Meyer, C., Kohl,
S. A. A., Ballard, A. J., Cowie, A., Romera-Paredes,
B., Nikolov, S., Jain, R., Adler, J., Back, T., Petersen,
S., Reiman, D., Clancy, E., Zielinski, M., Steinegger,
M., Pacholska, M., Berghammer, T., Bodenstein, S.,
Silver, D., Vinyals, O., Senior, A. W., Kavukcuoglu,
K., Kohli, P., and Hassabis, D. Highly accurate protein structure prediction with alphafold. Nature, 596
(7873):583–589, Aug 2021. ISSN 1476-4687. doi:
10.1038/s41586-021-03819-2. URL https://doi.
org/10.1038/s41586-021-03819-2.
LeCun, Y. A path towards autonomous machine intelligence
version 0.9. 2, 2022-06-27. Open Review, 62(1):1–62,
2022.

Li, N. P., van Vugt, M., and Colarelli, S. M. The evolutionary mismatch hypothesis: Implications for psychological science. Current Directions in Psychological Science, 27(1):38–44, 2018. doi: 10.1177/
0963721417731378. URL https://doi.org/10.
1177/0963721417731378.
Lin, C.-C., Jaech, A., Li, X., Gormley, M. R., and Eisner,
J. Limitations of autoregressive models and their alternatives. In Proceedings of the 2021 conference of the
North American chapter of the association for computational linguistics: Human language technologies, pp.
5147–5173, 2021.
Littman, M. L., Goldsmith, J., and Mundhenk, M.
The Computational Complexity of Probabilistic Planning. Journal of Artificial Intelligence Research, 9:1–
36, August 1998. ISSN 1076-9757. doi: 10.1613/
jair.505. URL https://jair.org/index.php/
jair/article/view/10208.
Loasby, B. J. An evolutionary theory of economic change.
The Economic Journal, 93(371):652–654, 09 1983. ISSN
0013-0133. doi: 10.2307/2232409. URL https://
doi.org/10.2307/2232409.
Mitchell, M. Debates on the nature of artificial general intelligence.
Science, 383(6689):eado7069,
2024.
doi: 10.1126/science.ado7069.
URL
https://www.science.org/doi/abs/10.
1126/science.ado7069.
Morris, M. R., Sohl-Dickstein, J., Fiedel, N., Warkentin, T.,
Dafoe, A., Faust, A., Farabet, C., and Legg, S. Position:
levels of agi for operationalizing progress on the path to
agi. In Proceedings of the 41st International Conference
on Machine Learning, ICML’24. JMLR.org, 2024.

LeCun, Y. Objective-driven ai: Towards ai systems that
can learn, remember, reason, and plan, 2024. URL
https://cmsa.fas.harvard.edu/media/
lecun-20240328-harvard_reduced.pdf.
Harvard CMSA Ding Shum Lecture; slide includes
P (correct) = (1 − e)n and “diverges exponentially”.

Musk, E. Demis is right. X (formerly Twitter) post, December 2025. URL https://x.com/elonmusk/
status/2003165966243598738.
Posted by
@elonmusk.

LeCun, Y., Bengio, Y., and Hinton, G. Deep learning. Nature, 521(7553):436–444, May 2015. ISSN 1476-4687.
doi: 10.1038/nature14539. URL https://doi.org/
10.1038/nature14539.

Narayanan, A. and Kapoor, S. Ai as normal technology.
Knight First Amendment Institute, 2025.

AI Must Embrace Specialization via Superhuman Adaptable Intelligence

Nilsson, N. J. Human-level artificial intelligence? be
serious!
AI Magazine, 26(4):68–75, 2005. doi:
https://doi.org/10.1609/aimag.v26i4.1850.
URL
https://onlinelibrary.wiley.com/doi/
abs/10.1609/aimag.v26i4.1850.

Van Assel, H., Ibrahim, M., Biancalani, T., Regev, A., and
Balestriero, R. Joint embedding vs reconstruction: Provable benefits of latent space prediction for self supervised
learning. arXiv preprint arXiv:2505.12477, 2025.

OpenAI. OpenAI Charter. URL https://openai.
com/charter/.

Wang, P. On defining artificial intelligence. Journal of
Artificial General Intelligence, 10:1–37, 08 2019. doi:
10.2478/jagi-2019-0002.

Ruder, S. An overview of multi-task learning in deep neural
networks, 2017. URL https://arxiv.org/abs/
1706.05098.

Wolpert, D. and Macready, W. No free lunch theorems for
optimization. IEEE Transactions on Evolutionary Computation, 1(1):67–82, 1997. doi: 10.1109/4235.585893.

Russell, S. J. and Norvig, P. Artificial Intelligence: A Modern Approach, volume 3. Prentice Hall, Upper Saddle
River, NJ, 2010. ISBN 978-0136042594.

Wozniak, S. Could a computer make a cup of coffee?
Fast Company Live, March 2010. URL https://www.
fastcompany.com. Interview proposing a physical
benchmark for AGI.

Schrittwieser, J., Antonoglou, I., Hubert, T., Simonyan,
K., Sifre, L., Schmitt, S., Guez, A., Lockhart, E.,
Hassabis, D., Graepel, T., Lillicrap, T., and Silver,
D. Mastering atari, go, chess and shogi by planning with a learned model. Nature, 588(7839):604–
609, Dec 2020. ISSN 1476-4687. doi: 10.1038/
s41586-020-03051-4. URL https://doi.org/10.
1038/s41586-020-03051-4.
Searle, J. R. Minds, brains, and programs. Behavioral
and Brain Sciences, 3(3):417–424, 1980. doi: 10.1017/
S0140525X00005756.
Silver, D., Hubert, T., Schrittwieser, J., Antonoglou, I.,
Lai, M., Guez, A., Lanctot, M., Sifre, L., Kumaran,
D., Graepel, T., Lillicrap, T., Simonyan, K., and Hassabis, D. A general reinforcement learning algorithm
that masters chess, shogi, and go through self-play. Science, 362(6419):1140–1144, 2018. doi: 10.1126/science.
aar6404. URL https://www.science.org/doi/
abs/10.1126/science.aar6404.
Su, W. Do large language models (really) need statistical foundations?, 2025. URL https://arxiv.org/
abs/2505.19145.
Sutton, R. The bitter lesson. Incomplete Ideas (blog), 13(1):
38, 2019.
Turing, A. M. I.—computing machinery and intelligence.
Mind, LIX(236):433–460, 10 1950. ISSN 0026-4423.
doi: 10.1093/mind/LIX.236.433. URL https://doi.
org/10.1093/mind/LIX.236.433.
Tversky, A. and Kahneman, D. Judgment under uncertainty: Heuristics and biases. Science, 185(4157):
1124–1131, 1974. doi: 10.1126/science.185.4157.
1124. URL https://www.science.org/doi/
abs/10.1126/science.185.4157.1124.

Wyder, P. M., Goldfeder, J., Yermakov, A., Zhao, Y., Riva,
S., Williams, J. P., Zoro, D., Rude, A. S., Tomasetto, M.,
Germany, J., et al. Common task framework for a critical evaluation of scientific machine learning algorithms.
arXiv preprint arXiv:2510.23166, 2025.
Zhao, A., Wu, Y., Yue, Y., Wu, T., Xu, Q., Yue, Y., Lin, M.,
Wang, S., Wu, Q., Zheng, Z., and Huang, G. Absolute
zero: Reinforced self-play reasoning with zero data, 2025.
URL https://arxiv.org/abs/2505.03335.
