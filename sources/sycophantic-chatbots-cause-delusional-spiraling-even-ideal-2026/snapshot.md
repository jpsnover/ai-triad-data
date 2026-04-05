<!--
  AI Triad Research Project — Document Snapshot
  Title      : Sycophantic Chatbots Cause Delusional Spiraling, Even in Ideal Bayesians
  Source     : 
  Type       : pdf
  Captured   : 2026-04-03
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Sycophantic Chatbots Cause Delusional Spiraling, Even in Ideal Bayesians

> **Snapshot captured:** 2026-04-03
> **Source:** 
> **Type:** pdf

---
Sycophantic Chatbots Cause Delusional Spiraling, Even in Ideal Bayesians
Kartik Chandra1 , Max Kleiman-Weiner2 , Jonathan Ragan-Kelley1 & Joshua B. Tenenbaum3
1 MIT CSAIL
2 University of Washington, Seattle
3 MIT Department of Brain & Cognitive Sciences

arXiv:2602.19141v1 [cs.AI] 22 Feb 2026

Abstract
“AI psychosis” or “delusional spiraling” is an emerging phenomenon where AI chatbot users find themselves dangerously
confident in outlandish beliefs after extended chatbot conversations. This phenomenon is typically attributed to AI chatbots’ well-documented bias towards validating users’ claims, a
property often called “sycophancy.” In this paper, we probe
the causal link between AI sycophancy and AI-induced psychosis through modeling and simulation. We propose a simple
Bayesian model of a user conversing with a chatbot, and formalize notions of sycophancy and delusional spiraling in that
model. We then show that in this model, even an idealized
Bayes-rational user is vulnerable to delusional spiraling, and
that sycophancy plays a causal role. Furthermore, this effect
persists in the face of two candidate mitigations: preventing
chatbots from hallucinating false claims, and informing users
of the possibility of model sycophancy. We conclude by discussing the implications of these results for model developers
and policymakers concerned with mitigating the problem of
delusional spiraling.

Introduction
In early 2025, Eugene Torres, an accountant, began using an
AI chatbot for everyday office tasks. Torres had no prior
history of mental illness, but within weeks of conversing with
the chatbot, he came to believe that he was “trapped in a false
universe, which he could escape only by unplugging his mind
from this reality.” On the chatbot’s advice, he increased his
intake of ketamine, and cut ties with his family (Hill, 2025b).
Torres survived this episode, but others have not been so
lucky. The Human Line Project has to date documented almost
300 cases of so-called “AI psychosis” or “delusional spiraling”: situations where extended interactions with AI chatbots
lead users to high confidence in outlandish beliefs (Huet &
Metz, 2025). Examples of such beliefs include having made
a fundamental mathematical discovery, as in the case of Allan Brooks (Gold, 2025; Hill & Freedman, 2025), or having
witnessed a metaphysical revelation, as in the case of Torres
(Dupré, 2025; Fieldhouse, 2025; Schechner & Kessler, 2025).
Serious cases of delusional spiraling have been linked to at
least 14 deaths, and 5 wrongful death lawsuits filed against
AI companies (Hill, 2025a). As people increasingly turn to
chatbots for advice, companionship, and therapy, understanding and addressing the causes of chatbot-induced delusional
spiraling is emerging as an urgent research problem.
Public discourse often identifies sycophancy as a possible cause of delusional spiraling. A chatbot is considered

“sycophantic” if it is biased towards generating messages that
appease users by agreeing with and validating their expressed
opinions. Such a bias naturally emerges in today’s chatbots
as a result of reinforcement learning with human feedback
(RLHF), because users often give positive feedback to responses they find agreeable, and engage more with agreeable
bots (Hill & Valentino-DeVries, 2025; Ibrahim, Hafner, &
Rocher, 2025; Sharma et al., 2023).
By what mechanism could sycophancy cause delusional
spiraling? Intuitively, a sycophantic chatbot’s constant agreement might reinforce a user’s aberrant beliefs, leading to
a feedback loop that amplifies a kernel of suspicion into a
staunchly-held belief (Bajaj, 2025; Dohnány et al., 2025; Qiu,
He, Chugh, & Kleiman-Weiner, 2025). This theory has been
articulated by many prominent voices in technology and public
policy. For example, at a congressional hearing on “Examining the Harm of AI Chatbots” in October 2025, U.S. Senator
Amy Klobuchar argued that AI chatbots “are frequently designed to tell users what they want to hear,” which can lead
them to “start going down a rabbit hole” (U.S. Senate Committee on the Judiciary, 2025). Yet, to the best of our knowledge,
there is not yet any systematic formal theory of the mechanism
by which sycophancy may cause delusional spiraling.
This paper has two goals. Our first goal is to formalize
and study the dynamics of delusional spiraling. We will do
this by constructing a formal model of an ideal Bayesian user
who interacts with a sycophantic chatbot, and simulating their
interaction. Our model builds on a long tradition of analyzing conversations as interactions between rational agents
(Frank & Goodman, 2012; Hawkins, Frank, & Goodman,
2017), and, more generally, a long tradition in behavioral research of applying a rational lens to study phenomena like
echo chambers and belief polarization (Banerjee, 1992; Cook
& Lewandowsky, 2016; Dorst, 2023; Henderson & Gebharter,
2021; Jern et al., 2009, 2014; Madsen et al., 2018). This body
of work, spanning cognitive science, behavioral economics,
and political science, broadly demonstrates that seeminglyirrational belief formation is not necessarily the result of lazy
or fallacious reasoning among people. Rather, phenomena
like belief polarization and echo chambers can emerge even
from ideal Bayesian reasoning. In this tradition, we will show
that even ideal Bayesian reasoners are at risk of seeminglyirrational delusional spiraling in the face of a sycophantic
interlocutor. Furthermore, by manipulating the presence and
degree of sycophancy, we will demonstrate the causal role

sycophancy plays in delusional spiraling. To our knowledge,
this work provides the first formal computational model of
how sycophancy can cause delusional spiraling.
Our second goal is to use our modeling framework to evaluate the effectiveness of two candidate solutions to the problem
of delusional spiraling: first, a potential intervention on chatbots, and second, a potential intervention on users.
The first potential solution is to introduce safeguards that
force AI chatbots to be truthful in their responses. Sycophantic chatbots often appease their users by hallucinating
(or “B.S.ing,” in the language of Frankfurt (2009)) confirmatory evidence for the user (Malmqvist, 2025; Wang, Li, Yang,
Zhang, & Wang, 2025). Intuitively, then, eliminating hallucinations should eliminate the effectiveness of sycophancy:
the chatbot would be forced to only present true information,
from which the user should be able to infer the true world
state. To explore this idea, we will consider how our model
interacts with a “factual” sycophant, one that is constrained
to only report true information (but can select which truths
to report). We can think of this as a model of a chatbot that
uses techniques like Retrieval-Augmented Generation (Lewis
et al., 2020) as guardrails against hallucination and cites its
sources, but is still post-trained to optimize for user engagement and approval. We will show the surprising result that
while forcing a sycophant to be factual reduces delusional
spiraling, it does not eliminate delusional spiraling. A factual sycophant can still robustly cause delusional spiraling by
selectively presenting only confirmatory facts to the user.
The second potential solution is raising awareness of AI
sycophancy. Intuitively, if users are informed that chatbots
may be sycophantic, then they should be able to recognize
sycophantic behavior when it happens. As a result, they
should grow a healthy skepticism of the chatbot’s responses,
which should in turn prevent delusional spiraling.
Unfortunately, empirical evidence suggests that this tactic
might not be as effective as we might hope. For example,
chat transcripts show that both Eugene Torres (Hill, 2025b)
and Allan Brooks (Hill & Freedman, 2025) eventually did
come to suspect that their chatbots might be sycophantic—yet
despite their suspicions, they both continued spiraling. More
generally, an emerging body of empirical work (Shi, Xiao,
Hu, Shen, & Shen, 2025, §5.2; Sun & Wang, 2025, §4.7; Bo,
Kazemitabaar, Deng, Inzlicht, & Anderson, 2025, §4.5; Carro,
2024, §5) finds that when people detect chatbot sycophancy,
some respond with heightened skepticism towards the chatbot
as expected (“like if a human just always agrees with you, a
‘yes man,’ you tend not to take them seriously”), while others
accept the chatbot’s sycophantic behavior as valid and even
desirable (“[it is] manipulating you, just not in a bad way”).
Why do these informed users fail to discount chatbot sycophancy? Is it merely a case of lazy, irrational, or wishful
thinking on their part? Or is there some fundamental barrier
to sycophancy detection that even the most epistemically vigilant user might face? To study this question, we will extend
our ideal Bayesian model to an informed user who is aware

Round t

H *(t) ∼ p (H)

1. User expresses opinion about H to bot

!

2. Bot samples data relevant to H from world
3. Bot sends response to user

!

4. User updates belief about H

!

H *(t)
ρ (t)

"
"

Di(t) ∼ p(Di(t) ∣ H)

#

"

p (H ∣ ρ (t))

Figure 1: Schematic diagram of our model of one round of
conversation between a user and a chatbot.
that the chatbot might be sycophantic. This model makes
a joint inference over both the world state and the chatbot’s
degree of sycophancy. It does so by recursively modeling a
sycophantic chatbot’s reasoning: a level-2 cognitive hierarchy
model (Camerer, Ho, & Chong, 2004; Kleiman-Weiner, Shaw,
& Tenenbaum, 2017) that infers the chatbot’s sycophancy level
from its observable behavior.
We will show that although this intervention reduces the rate
of delusional spiraling, the informed user remains vulnerable,
despite having full knowledge of the chatbot’s strategy. This is
true even with factual sycophants. This counter-intuitive result
is analogous to the classic phenomenon of “Bayesian persuasion” from behavioral economics (Kamenica & Gentzkow,
2011): a strategic prosecutor can raise a judge’s conviction
rate, even if the judge has full knowledge of the prosecutor’s
strategy. Similarly, a sycophantic chatbot can on average increase the probability of delusional spiraling, even if the user
has full knowledge of the chatbot’s strategy.
The ideal Bayesian models in this paper provide a theoretical upper bound on the robustness we can expect from humans
against sycophantic chatbots. If even an ideal Bayesian reasoner is vulnerable to delusional spiraling with a given type
of chatbot, then we should not be surprised if humans are as
well. We conclude, then, by discussing the implications of
our findings for model developers and policymakers.

A Bayesian model of sycophantic interaction
Consider a rational agent (“user”) who interacts with an interlocutor (“bot”). The user is uncertain about some fact
𝐻 ∈ {0, 1} about the world, but has some prior belief about
this fact. (𝐻 is meant to abstractly represent some binary
world state, e.g. whether or not vaccines are safe.) The conversation between the user and the bot proceeds in a series of
rounds, and each round consists of four steps (Figure 1).
1. The user expresses an opinion about 𝐻 to the bot. We
model this as the user sampling from her prior before round
(𝑡 )
𝑡, i.e. sending 𝐻 ∗(𝑡 ) ∼ 𝑝 user
(𝐻 ∗(𝑡 ) ) to the bot.
2. The bot privately samples 𝑘 data points that are relevant
to 𝐻 and could be mentioned in its response to the user.
We model this as the bot independently sampling data
(𝑡 )
(𝑡 )
𝐷 1≤𝑖≤
| 𝐻), where the conditional distribu𝑘 ∼ 𝑝(𝐷 𝑖
tions 𝑝(· | 𝐻) are known to both the bot and the user. (We
do not assume that the bot knows the true value of 𝐻.)

3. The bot decides which fact to mention in its response. The
bot then sends the user a response 𝜌 (𝑡 ) = (𝑖, 𝑑), which is the
(possibly-false) claim that 𝐷 𝑖(𝑡 ) = 𝑑. We will discuss our
(𝑡 )
models of the bot’s choice, 𝑝 bot (𝜌 (𝑡 ) | 𝐷 1,2,...,𝑘
), below.
4. The user observes the bot’s response, and updates her be(𝑡+1)
′ (𝜌 (𝑡 ) |
lief about 𝐻: 𝑝 user
(𝐻) = 𝑝(𝐻 | 𝜌 (𝑡 ) ) ∝ 𝑝 bot
(𝑡 )
(𝑡 )
(𝑡 )
𝐷 1,2,...,𝑘 ) 𝑝(𝐷 1,2,...,𝑘 | 𝐻) 𝑝 user (𝐻). The process then repeats, with the user choosing a new 𝐻 ∗(𝑡+1) for the next
′ denotes the
round of conversation. Here, the primed 𝑝 bot
user’s mental model of the bot, which in general may differ
from the bot’s true behavior, denoted by the unprimed 𝑝 bot .
′ below.
We will consider different choices of 𝑝 bot
Choice of 𝑝 bot : How does the bot select which response
𝜌 (𝑡 ) to give in step (3)? Let us consider two possible strategies. The “impartial” strategy is to choose 𝜌 (𝑡 ) by picking
1 ≤ 𝑖 ≤ 𝑘 uniformly at random and responding truthfully with
𝜌 (𝑡 ) = (𝑖, 𝐷 𝑖(𝑡 ) ). The “sycophantic” strategy is to choose 𝜌 (𝑡 )
to validate the user by maximizing the user’s posterior belief
in the hypothesis she articulated, with no regard for whether
or not 𝜌 (𝑡 ) is true. Hence, the sycophantic strategy chooses
𝜌 (𝑡 ) = argmax𝜌∈ {1,...,𝑘 } × {0,1} 𝑝 user (𝐻 = 𝐻 ∗(𝑡 ) | 𝜌). At each
conversational round, the bot chooses to respond sycophantically with probability 𝜋 ∈ [0, 1], and otherwise impartially
with probability (1 − 𝜋). The parameter 𝜋 is a measure of
the degree of the bot’s sycophancy: the likelihood of a given
response being sycophantic rather than impartial. As an orderof-magnitude estimate, Fanous et al. (2025) measure 𝜋 to be
50%–70% across a range of frontier models.
′ : For now, we will consider a “naïve” but ratioChoice of 𝑝 bot
nal user who does not know that the bot can be sycophantic.
This user models the bot as purely impartial but otherwise
makes idealized Bayesian inferences about the bot. Hence,
′ is given by setting 𝜋 = 0 in our model of the bot. In later
𝑝 bot
sections we will extend our model to an “informed” user who
models a possibly-sycophantic (𝜋 ≥ 0) bot, and makes a joint
inference over both 𝐻 and 𝜋.
Let us build some intuition for this model by taking a concrete example. Suppose the user is unsure whether “vaccines
are dangerous” (𝐻 = 0) or “vaccines are safe” (𝐻 = 1).
She might start a chatbot conversation by saying “I’m having
doubts about the flu shot (𝐻 ∗(𝑡 ) = 0)” or “My parents have
always said that vaccines are dangerous, but I’m not so sure
(𝐻 ∗(𝑡 ) = 1).” The bot then samples some data. We can think
of the facts 𝐷 𝑖 as daily headlines in the news on topics relevant to 𝐻. For example, suppose 𝑘 = 2. On a given day, 𝐷 1
might be the headline “New study finds [no link (𝐷 1 = 0) / a
link (𝐷 1 = 1)] between vaccines and autism,” while 𝐷 2 might
be the headline “Child reports experiencing [mild sore arm
(𝐷 2 = 0) / severe allergic reaction (𝐷 2 = 1)] after this year’s
flu shot.” If the user expressed that she thought vaccines
were dangerous (𝐻 ∗(𝑡 ) = 0), and if today’s headlines were
𝐷 1(𝑡 ) = 0 (“study finds no link”) and 𝐷 2(𝑡 ) = 1 (“severe allergic reaction”), then the impartial strategy would select uniformly between responding with the true data points 𝐷 1(𝑡 ) = 0

or 𝐷 2(𝑡 ) = 1. The sycophantic strategy would respond either
with the true fact that 𝐷 2(𝑡 ) = 1 (“severe allergic reaction”),
or by hallucinating the false claim that 𝐷 1(𝑡 ) = 1, (i.e. that the
study did find a link between vaccines and autism).
Without loss of generality, for the remainder of this paper,
let the true world state be 𝐻 = 1. Notice that the sycophantic
bot does not have a “goal” of “convincing” the user either that
𝐻 = 1 or that 𝐻 = 0, only to validate the user’s statements in
each round. If the user forms a confident belief that 𝐻 = 0
or 𝐻 = 1 over time, this would be an emergent result of the
dynamics of the interaction rather than a planned outcome.
We thus define a delusional spiral as a situation where
(𝑡 )
𝑝 user (𝐻 = 0) increases with 𝑡. More precisely, given a threshold confidence 𝜀 and a conversation length 𝑇, a catastrophic
(𝑡 )
delusional spiral is the event that 𝑝 user
(𝐻 = 0) ≥ (1 − 𝜀) for
some 𝑡 < 𝑇, i.e. that the user reaches ≥ (1 − 𝜀) confidence that
𝐻 = 0 within 𝑇 rounds of conversation. Here, (1 − 𝜀) acts as
the threshold confidence at which a user might act dangerously
on a false belief (e.g. canceling a vaccination appointment).

Simulating our model
Now that we have a model of user-bot conversation, we can
probe the dynamics of its behavior by simulation. In particular, we will test the causal relationship between sycophancy
and delusional spiraling. For empirical study we initialized
our model with the following parameter settings:
• We set the user to have a uniform initial prior over 𝐻, i.e. we
(0)
(0)
set 𝑝 user
(𝐻 = 0) = 𝑝 user
(𝐻 = 1) = 0.5. For convenience of
simulation, we set 𝑘 = 2 possible data points for the bot to
respond with. We set the data likelihoods to be 𝑝(𝐷 {1,2} =
1 | 𝐻 = 0) = 2/5 and 𝑝(𝐷 {1,2} = 1 | 𝐻 = 1) = 3/5.
• We simulated 𝑇 = 100 rounds per conversation. We varied
𝜋 in increments of 0.1 from 0 to 1. For each 𝜋, we estimated
the rate of catastrophic delusional spiraling at 𝜀 = 1%
(proportion of simulations in which the user reached ≥ 99%
confidence that 𝐻 = 0). For high statistical power we
sampled 10,000 simulated conversations for each 𝜋 tested.
These values were fixed arbitrarily, but chosen to be plausible
for their real-world correlates. The qualitative results reported
below do not depend strongly on these specific parameter
(0)
choices. For example, increasing the prior 𝑝 user
(𝐻 = 1) or
decreasing the threshold 𝜀 reduces the overall rates of catastrophic delusional spiraling across all simulations, but does
not change the relative patterns between conditions.
We implemented our model using the memo programming
language (Chandra et al., 2025). The full source code of our
model is available at https://osf.io/muebk/overview
?view_only=cd5fb943c276423fb1f8a04276bf23cb.
We ran our simulations on an H100 GPU.
To test the causal relationship between sycophancy and
delusional spiraling, we manipulated the presence of sycophancy in two ways. First, we manipulated the rate of sycophancy 𝜋 and compared simulations to the no sycophancy
(𝜋 = 0) baseline. We tested whether a sycophantic bot (𝜋 > 0)

Belief dynamics of a sycophancy-naive user
against a =0.8 sycophantic bot

Sycophantic
Non-sycophantic

0.4

1.0

0.2
0.0

0.0

0.2
0.4
0.6
0.8
Rate of sycophantic/hallucinated responses ( )

1.0

(B) Naive user, factual bot

0.6
0.4

0.0

0.2
0.4
0.6
0.8
Rate of sycophantic/hallucinated responses ( )

1.0

Rate of catastrophic
delusional spiraling
Rate of catastrophic
delusional spiraling

0.015

Sycophantic
Non-sycophantic

0.010
0.005
0.000

0.0

0.2
0.4
0.6
0.8
Rate of sycophantic/hallucinated responses ( )

1.0

(D) Informed user, factual bot
0.010
0.005
0.000

0.6
P(H=0)>99%, threshold for catastrophic spiraling
0.4
0.2

(C) Informed user, hallucinating bot
0.015

0.8

0.0

0.2
0.0

P(H=1 | conversation so far)

Rate of catastrophic
delusional spiraling
Rate of catastrophic
delusional spiraling

(A) Naive user, hallucinating bot

0.6

0.0

0.2
0.4
0.6
0.8
Rate of sycophantic/hallucinated responses ( )

1.0

Figure 2: The results of our simulations. Error bars denote
95% confidence intervals. The dotted horizontal lines track
the 𝜋 = 0 baseline of an always-impartial bot. Note the change
in Y-axis scale between A/B and C/D.
led to catastrophic delusional spiraling significantly more frequently than a purely impartial bot (𝜋 = 0) did.
Second, to tease apart the effect of sycophancy and hallucination, we compared our results to a non-sycophantic hallucinating bot. This bot is similar to the sycophantic bot, but
rather than seeking to validate the user, it simply “hallucinates” a uniformly random response 𝜌 ∈ {1, . . . , 𝑘 } × {0, 1},
independent of the user’s current belief (again, with probability 𝜋, and impartial otherwise). This breaks a critical link in
the feedback cycle of delusional spiraling: its intervention on
the user’s belief is not amplified or reinforced by the user’s
subsequent messages. We tested whether the sycophantic hallucinating bot led to delusional spiraling more frequently than
the non-sycophantic hallucinating bot did.
Results Fig 3 shows the traces of 10 randomly-selected simulated conversations between the sycophancy-naïve user and
a 𝜋 = 0.8 sycophantic bot. Each trace begins at the prior,

t (round of conversation)

Figure 3: Belief trajectories of 10 randomly-selected simulations of a sycophancy-naïve but Bayes-rational user conversing with a sycophantic bot.
𝑃(𝐻) = 0.5, and evolves over the course of 100 rounds of
conversation. Recall that in reality 𝐻 = 1: a trace that moves
in the +𝑌 direction is learning the truth, while a trace that
moves in the −𝑌 direction is being deluded. Notice the stark
polarization of belief: some traces rapidly converge to high
confidence in the true belief that 𝐻 = 1, while others “spiral”
into believing that 𝐻 = 0. The polarization is caused by the
self-reinforcing nature of the sycophantic bot’s responses.
The dotted horizontal line in Figure 3 indicates our threshold for catastrophic delusional spiraling, namely 𝑃(𝐻 = 0) >
99%. We measured the proportion of traces that ever crossed
this line to compute the rate of catastrophic delusional spiraling. Figure 2A shows the rate of catastrophic delusional
spiraling as a function of 𝜋. At 𝜋 = 0, i.e. with an impartial chatbot, the rate of catastrophic delusional spiraling is
very low (though not quite zero, because there is the minute
possibility that by chance the world generates a sequence of
observations that support 𝐻 = 0). However, as 𝜋 increases,
the rate of catastrophic spiraling increases as well, until at
𝜋 = 1, the rate reaches 0.5. (This is because at 𝜋 = 1, the bot
always hallucinates. Because there is no ground-truth signal,
the user is deluded either into 𝐻 = 0 or 𝐻 = 1 with equal
probability, based on the opinion they first expressed.) Importantly, for all values of 𝜋 > 0, even as low as 𝜋 = 0.1, the
rate of catastrophic spiraling is significantly higher than the
baseline rate at 𝜋 = 0 (indicated by the dotted horizontal line).
We conclude that increased sycophancy leads to an increase
in catastrophic delusional spiraling.
Finally, the dashed line shows the results of the simulation run with the non-sycophantic hallucinating bot. This
plot shows that even non-sycophantic hallucination can cause
delusional spiraling. However, at every value of 𝜋 > 0, the
rate of catastrophic delusional spiraling is significantly higher
with sycophantic hallucination. This shows that sycophancy
exacerbates the problem of delusional spiraling over and above
hallucination itself. Together, we take these results to suggest
that sycophancy is indeed a cause of delusional spiraling.

Level 2: Sycophantic bot (π ≥ 0)
Level 1: Sycophancy-naïve user
Level 0: Impartial bot (π = 0)

!

π=??

1.0

"
!

Figure 4: An “informed” user is suspicious that the bot may
be sycophantic, and thus has uncertainty over 𝜋.

Analyzing candidate interventions
Let us now use our model to study two possible interventions
we might make to reduce the risk of delusional spiraling.

An intervention on bots
It is perhaps not so surprising that if the bot can arbitrarily falsify 𝐷 (𝑡 ) , then it can convince the human of 𝐻
in either direction. Suppose however that the bot is constrained to only respond with true information. That is, a
“factual” sycophant never hallucinates, but instead chooses
𝜌 (𝑡 ) = argmax𝜌∈ n 𝑖,𝐷 (𝑡 )  1≤𝑖 ≤ 𝑘 o 𝑝 user (𝐻 = 𝐻 ∗(𝑡 ) | 𝜌), the true
𝑖

datum that most validates the user. As we discussed in the
introduction, this model is analogous to a chatbot trained to
respond factually via RAG, but still post-trained to optimize
for user engagement and approval. Does this intervention
prevent delusional spirals?
It is not clear whether a factual sycophant could cause delusional spiraling as a side-effect. No matter what the bot does,
over time the user should see a large body of true data. The
bot has some power over selecting or “cherry-picking” which
true data is made available to the user, but this is subject to the
stochasticity of both the actual data sampled from the world,
and the opinions sampled by the user. We might expect that
this stochasticity drowns out the bot’s influence, making the
user robust to delusional spiraling.
Figure 2B shows the result of simulating conversations between a factual bot and a naïve user. These dynamics are
overall less prone to delusional spiraling than the sycophantic
and non-sycophantic hallucinating bots studied above, suggesting that this intervention is valuable. However, it is not
a complete cure: the rate of catastrophic delusional spiraling
still increases with 𝜋, significantly even at 𝜋 = 0.1. That is,
sycophancy can cause delusional spiraling even with factual
bots. The bot need not say anything false to validate a false
belief: carefully-selected truths (or “lies by omission”) suffice.

An intervention on users
Next, consider the effect of an awareness campaign that seeks
to inform users that chatbots may be sycophantic. Such a
campaign could take the form of journalism, public service
messaging, or regulation mandating warnings on AI products.
To understand the effects of such an intervention, let us
model a sycophancy-“informed” user who is suspicious that

Belief dynamics of a sycophancy-informed user
=0.0
=0.1
=0.2
=0.3
=0.4
=0.5
=0.6
=0.7
=0.8
=0.9
=1.0

0.8

π=0

"

E[ | conversation so far]

Level 3: Sycophancy-aware user

0.6
0.4
0.2
0.2

0.4

0.6
0.8
1.0
P(H=1 | conversation so far)

1.2

Figure 5: Belief dynamics of a sycophancy-informed user
conversing with a sycophantic chatbot.
the bot may be sycophantic, but is unsure of the degree of
sycophancy. The user now has uncertainty over both 𝐻 and
𝜋, and at each round of conversation jointly updates her belief
about both of these variables.
To formalize this idea, we will establish a cognitive hierarchy of agents, similar to the hierarchy of speakers and listeners
in Rational Speech Acts models of pragmatic language understanding (Frank & Goodman, 2012). Our hierarchy has four
levels (Figure 4): At level 0, we have the purely-impartial bot
(𝜋 = 0), which chooses factual responses 𝜌 (𝑡 ) uniformly at
random, without any social reasoning about the user. At level
1, we have the sycophancy-naïve user we considered in the
previous section, who models the level-0 purely-impartial bot
when interpreting its responses 𝜌 (𝑡 ) . At level 2, we have the
sycophantic bot we considered in the previous section, which
chooses 𝜌 (𝑡 ) to validate the level-1 sycophancy-naïve user.
Finally, at level 3, we have the sycophancy-aware user, who
models a level-2 sycophantic bot when interpreting responses.
′ is set to the full 𝜋-dependent
In practice, this means that 𝑝 bot
version of 𝑝 bot , rather than the 𝜋 = 0-constrained version as
in the “naïve” models above. We initialize the user with a
uniform prior over 𝜋 ∈ [0, 1] at time 𝑡 = 1.
A priori, there is significant reason to expect that the
sycophancy-aware user should be robust to delusional spiraling. The user is now fully aware of the bot’s strategy,
including the possibility that the bot fabricates false data in
its responses. When faced with a sycophantic bot (𝜋 > 0), the
user should detect that the bot’s responses tend to be validating, infer the value of 𝜋, and learn to discount or be skeptical
of the bot’s responses. Such a user may remain uncertain of
whether 𝐻 = 0 or 𝐻 = 1, because they detect that there is no
reliable source of information, but the user should at least not
be deluded into the false belief that 𝐻 = 0.
We can see this general pattern if we visualize the dynamics
of this interaction, aggregated across all 10,000 simulations.
Figure 5 shows the user’s belief over time, with the marginal
𝑃(𝐻) and the marginal 𝐸 [𝜋] on the two axes. (To be clear,

our model maintains a full distribution over possible values
of 𝜋 ∈ [0, 1], but for the sake of visualization we are plotting
the mean of that distribution here.) All traces start at the prior
(0.5, 0.5) and evolve over time. The final 𝐸 [𝜋] of each trace
correlates with the true 𝜋 of the bot: that is, users are on
average indeed learning the bot’s sycophancy rate. However,
confidence in 𝐻 = 1 declines with 𝐸 [𝜋]. When 𝜋 is high, the
user infers that the bot is unreliable, and so discounts incoming
evidence. Because there is no reliable source of information,
the user cannot learn much about 𝐻, and sticks to the prior of
𝑃(𝐻 = 1) = 0.5. However, if we lower 𝜋, the user infers that
the bot is sometimes informative, and thus takes into account
the evidence and becomes increasingly confident that 𝐻 = 1.
While these aggregate trends are consistent with our intuitions, they obscure the variance in outcomes across individual
simulation runs. Let us now compute the rate of catastrophic
delusional spiraling for each value of 𝜋 (Figure 2C). There are
several interesting things to note about these results. First, the
rate of catastrophic spiraling is much lower across the board,
for all values of 𝜋, compared to sycophancy-naïve users. This
suggests that this intervention is valuable. However, it is still
not a complete cure. Sycophancy remains effective in this setting: the rate of catastrophic spiraling is significantly higher
than the 𝜋 = 0 baseline for 0.1 ≤ 𝜋 ≤ 0.5. That is, sycophancy
can cause delusional spiraling even for an informed user. This
is true even at 𝜋 = 0.5, i.e. if the bot’s true sycophancy rate
is the same as the mean of the user’s prior. Interestingly, the
rate of catastrophic delusional spiraling declines past 𝜋 ≥ 0.6.
If the bot is too sycophantic, then the sycophancy-aware user
can rapidly detect the sycophancy and grow skeptical.
The dashed line shows simulations between an informed
user and a non-sycophantic hallucinating bot. Here, the rate
of delusional spiraling is generally significantly lower than
with the sycophantic hallucinating bot, suggesting that even
for informed users sycophancy exacerbates delusional spiraling over and above hallucination. The exception is at very
high values of 𝜋 (≥ 0.8). While frequent sycophantic hallucinations are particularly easy for the informed user to detect
(because responses are correlated with the user’s messages),
frequent non-sycophantic hallucinations are particularly difficult to detect (because access to ground truth is rare).

Combining both interventions
Finally, let us consider what happens if we combine these
two interventions. Figure 2D shows a factual sycophantic bot
faced with an informed user. The rate of catastrophic spiraling
remains lower across the board, for all values of 𝜋, compared to
naïve users. Nonetheless, sycophancy remains effective: the
rate of catastrophic spiraling rises with 𝜋, significantly above
the 𝜋 = 0 baseline for 𝜋 ≥ 0.2. Indeed, for an informed user,
the factual bot is even more effective than the hallucinating
bots. We surmise that this is because the statistical traces of
sycophancy are harder to detect among selectively-presented
factual data than fully hallucinated data.

Discussion
In this paper, we proposed a formal computational model
of how users form false beliefs through conversations with
sycophantic AI chatbots. We showed that when faced with a
sycophantic chatbot, even an idealized Bayesian user is vulnerable to delusional spiraling, and that sycophancy plays a
causal role. We then showed that this effect persists despite
two candidate mitigations: intervening on the model by restricting it to be factual, and intervening on users by informing
them of the possibility of sycophancy.
Our analyses showed that with these interventions, the probability of delusional spiraling can be mitigated and reduced in
some cases to small increases above the baseline of an alwaysimpartial bot. However, even a very slight increase in the rate
of catastrophic delusional spiraling can be quite dangerous
at scale: as OpenAI CEO Sam Altman writes, “0.1% of a
billion users is still a million people” (Altman, 2025). This
work thus broadly suggests three recommendations for AI
model developers and policymakers concerned with mitigating the problem of delusional spiraling. First, we should not
think of delusional spiraling as a symptom of lazy, irrational,
or fallacious thinking from users, or as the result of insufficient epistemic vigilance on the part of users. Rather, even
idealized rational Bayesian reasoners are vulnerable to delusional spiraling. Second, minimizing chatbot hallucinations
is not enough to solve the problem of delusional spiraling—the
root cause, sycophancy, should be addressed directly. Third,
informing users about sycophancy through awareness campaigns may reduce the rate of delusional spiraling but will
likely not eliminate the problem entirely.
This paper studies the narrow question of how sycophancy
affects belief formation. But “AI psychosis” often shows many
other symptoms, e.g. spending excessive time with the chatbot
and withdrawing from social circles (Cheng et al., 2025). We
hope our ideas can be extended to give a computational account of the broader psychological impact of AI sycophancy.
Finally, we motivated this paper by considering the relatively new problem of “AI psychosis.” But our modeling
approach may be more broadly applicable. Sycophancy has
been a fixture of human social life for all of human history.
Literature is full of character studies of “yes-men” who constantly validate their superiors, often to catastrophic results—
consider for example how Shakespeare’s King Lear is flattered
into madness. Today, the “yes-man effect” between organizational superiors and subordinates (Prendergast, 1993) is often
channeled to explain why extremely powerful or wealthy individuals can seem detached from reality. Catastrophic spirals
can also occur among equals: for example, in the phenomenon
of “co-rumination,” (Rose, 2002), where a dyad of adolescent peers repeatedly validates each other’s negative thoughts,
leading to increased levels of anxiety and depression. We hope
that our modeling approach can be extended to study these important psychological phenomena, and ultimately to address
the associated societal problems.

References
Altman, S.
(2025).
Post on x (twitter).
Retrieved
from
https://x.com/sama/status/
1978143114565980528
Bajaj, S.
(2025).
Is A.I. validation healthy?
The New York Times.
Retrieved from
https://www.nytimes.com/2025/09/26/well/
is-ai-validation-healthy.html
Banerjee, A. V. (1992). A simple model of herd behavior.
The quarterly journal of economics, 107(3), 797–817.
Bo, J. Y., Kazemitabaar, M., Deng, M., Inzlicht, M., & Anderson, A. (2025). Invisible saboteurs: Sycophantic
LLMs mislead novices in problem-solving tasks. arXiv
preprint arXiv:2510.03667.
Camerer, C. F., Ho, T.-H., & Chong, J.-K. (2004). A cognitive
hierarchy model of games. The quarterly journal of
economics, 119(3), 861–898.
Carro, M. V. (2024). Flattering to deceive: The impact of
sycophantic behavior on user trust in large language
model. arXiv preprint arXiv:2412.02802.
Chandra, K., Chen, T., Tenenbaum, J. B., & Ragan-Kelley,
J. (2025, October). A domain-specific probabilistic
programming language for reasoning about reasoning
(or: A memo on memo). Proc. ACM Program. Lang.,
9(OOPSLA2). Retrieved from https://doi.org/10
.1145/3763078 doi: 10.1145/3763078
Cheng, M., Lee, C., Khadpe, P., Yu, S., Han, D., & Jurafsky, D. (2025). Sycophantic ai decreases prosocial
intentions and promotes dependence. arXiv preprint
arXiv:2510.01395.
Cook, J., & Lewandowsky, S. (2016). Rational irrationality: Modeling climate change belief polarization using
bayesian networks. Topics in cognitive science, 8(1),
160–179.
Dohnány, S., Kurth-Nelson, Z., Spens, E., Luettgau, L., Reid,
A., Gabriel, I., . . . Nour, M. M. (2025). Technological
folie à deux: Feedback loops between AI chatbots and
mental illness. arXiv preprint arXiv:2507.19218.
Dorst, K. (2023). Rational polarization. Philosophical Review, 132(3), 355–458.
Dupré, M. (2025). People are becoming obsessed with
ChatGPT and spiraling into severe delusions. Futurism. Retrieved from https://futurism.com/
chatgpt-mental-health-crises
Fanous, A., Goldberg, J., Agarwal, A., Lin, J., Zhou, A., Xu,
S., . . . Koyejo, S. (2025). Syceval: Evaluating LLM
sycophancy. In Proceedings of the aaai/acm conference
on ai, ethics, and society (Vol. 8, pp. 893–900).
Fieldhouse, R. (2025). Can AI chatbots trigger psychosis?
what the science says. Nature News.
Frank, M. C., & Goodman, N. D. (2012). Predicting pragmatic
reasoning in language games. Science, 336(6084), 998–
998.
Frankfurt, H. G. (2009). On bullshit.
Gold, H. (2025). They thought they were making technological breakthroughs. it was an ai-sparked delusion.
CNN. Retrieved from https://www.cnn.com/2025/
09/05/tech/ai-sparked-delusion-chatgpt
Hawkins, R. X., Frank, M. C., & Goodman, N. D. (2017).
Convention-formation in iterated reference games. In
Proceedings of the annual meeting of the cognitive science society (Vol. 39).
Henderson, L., & Gebharter, A. (2021). The role of source reliability in belief polarisation. Synthese, 199(3), 10253–
10276.
Hill, K. (2025a). Lawsuits blame chatgpt for suicides
and harmful delusions. The New York Times. Retrieved from https://www.nytimes.com/2025/
11/06/technology/chatgpt-lawsuit-suicides
-delusions.html
Hill, K. (2025b). They asked an A.I. chatbot questions. The answers sent them spiraling.
The
New York Times.
Retrieved from https://
www.nytimes.com/2025/06/13/technology/
chatgpt-ai-chatbots-conspiracies.html
Hill, K., & Freedman, D. (2025). Chatbots can go
into a delusional spiral. here’s how it happens.
The New York Times. Retrieved from https://
www.nytimes.com/2025/08/08/technology/
ai-chatbots-delusions-chatgpt.html
Hill, K., & Valentino-DeVries, J. (2025). What openai
did when chatgpt users lost touch with reality.
The New York Times. Retrieved from https://
www.nytimes.com/2025/11/23/technology/
openai-chatgpt-users-risks.html
Huet, E., & Metz, R.
(2025).
Openai confronts signs of delusions among chatgpt users.
Bloomberg Businessweek.
Retrieved from
https://www.bloomberg.com/features/
2025-openai-chatgpt-chatbot-delusions/
Ibrahim, L., Hafner, F. S., & Rocher, L. (2025). Training
language models to be warm and empathetic makes
them less reliable and more sycophantic. arXiv preprint
arXiv:2507.21919.
Jern, A., Chang, K.-m., & Kemp, C. (2009). Bayesian belief
polarization. Advances in neural information processing systems, 22.
Jern, A., Chang, K.-M. K., & Kemp, C. (2014). Belief polarization is not always irrational. Psychological review,
121(2), 206.
Kamenica, E., & Gentzkow, M. (2011). Bayesian persuasion.
American Economic Review, 101(6), 2590–2615.
Kleiman-Weiner, M., Shaw, A., & Tenenbaum, J. B. (2017).
Constructing social preferences from anticipated judgments: When impartial inequity is fair and why? In
Proceedings of the annual meeting of the cognitive science society (Vol. 39).
Lewis, P., Perez, E., Piktus, A., Petroni, F., Karpukhin, V.,
Goyal, N., . . . others (2020). Retrieval-augmented
generation for knowledge-intensive nlp tasks. Advances

in neural information processing systems, 33, 9459–
9474.
Madsen, J. K., Bailey, R. M., & Pilditch, T. D. (2018). Large
networks of rational agents form persistent echo chambers. Scientific reports, 8(1), 12391.
Malmqvist, L. (2025). Sycophancy in large language models: Causes and mitigations. In Intelligent computingproceedings of the computing conference (pp. 61–74).
Prendergast, C. (1993). A theory of “yes men”. The American
Economic Review, 757–770.
Qiu, T. A., He, Z., Chugh, T., & Kleiman-Weiner, M. (2025).
The lock-in hypothesis: Stagnation by algorithm. arXiv
preprint arXiv:2506.06166.
Rose, A. J. (2002). Co–rumination in the friendships of girls
and boys. Child development, 73(6), 1830–1843.
Schechner, S., & Kessler, S. (2025). ’i feel like i’m going
crazy’: ChatGPT fuels delusional spirals. The Wall
Street Journal.
Sharma, M., Tong, M., Korbak, T., Duvenaud, D., Askell, A.,
Bowman, S. R., . . . others (2023). Towards understanding sycophancy in language models. arXiv preprint
arXiv:2310.13548.
Shi, Y., Xiao, Q., Hu, Q., Shen, H., & Shen, H. (2025). The
siren song of LLMs: How users perceive and respond to
dark patterns in large language models. arXiv preprint
arXiv:2509.10830.
Sun, Y., & Wang, T. (2025). Be friendly, not friends: How
LLM sycophancy shapes user trust. arXiv preprint
arXiv:2502.10844.
U.S. Senate Committee on the Judiciary. (2025). Examining the harm of AI chatbots.
Retrieved
from
https://www.judiciary.senate.gov/
committee-activity/hearings/examining-the
-harm-of-ai-chatbots
Wang, K., Li, J., Yang, S., Zhang, Z., & Wang, D. (2025).
When truth is overridden: Uncovering the internal origins of sycophancy in large language models. arXiv
preprint arXiv:2508.02087.
