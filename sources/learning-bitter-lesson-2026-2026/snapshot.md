<!--
  AI Triad Research Project — Document Snapshot
  Title      : Learning the Bitter Lesson in 2026
  Source     : 
  Type       : pdf
  Captured   : 2026-04-03
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Learning the Bitter Lesson in 2026

> **Snapshot captured:** 2026-04-03
> **Source:** 
> **Type:** pdf

---
 
Home / EconLog / Learning the Bitter Lesson in 2026

ECONLOG POST
Feb 17 2026
TECHNOLOGY

Learning the Bitter Lesson in 2026
Joy Buchanan

Categories: Technology

By Joy Buchanan, Feb 17 2026
SHARE
POST:









To prepare for teaching, I am reading a famous article in AI research: The Bitter
Lesson, written by Richard Sutton in 2019. I wondered what would seem
prescient and if anything would feel like Sutton had gotten it wrong. At the end,
I’ll discuss economic implications.
Sutton draws from decades of AI history to argue that researchers have learned
a “bitter” truth. Researchers repeatedly assume that computers will make the
next advance in intelligence by relying on specialized human expertise. Recent
history shows that methods that scale with computation outperform those
reliant on human expertise. For example, in computer chess, brute-force search
on specialized hardware triumphed over knowledge-based approaches. Sutton
warns that researchers resist learning this lesson because building in

knowledge feels satisfying, but true breakthroughs come from computation’s
relentless scaling. In AI, scaling means making models larger and training them
on more data with more compute.
The Bitter Lesson is less about any single algorithm than about intellectual
humility: progress in AI has come from accepting that general-purpose learning,
persistently scaled, outperforms our best attempts to hard-code intelligence. It
matters whether Sutton is right or wrong, because we are not at the end of the
explosion of AI or the period of time dubbed “The Scaling Era” by Dwarkesh
Patel.
EconTalk guests have speculated that AI will save the world or kill us all. See the
following:
EconTalk: Eliezer Yudkowsky on the Dangers of AI
EconTalk: Erik Hoel on the Threat to Humanity from AI
EconTalk: Marc Andreessen on Why AI Will Save the World

Such extreme predictions assume that AI capabilities will advance. Although AI
has been improving rapidly since Sutton wrote in 2019, there is no law of nature
(that we know of) that insists it must continue to improve. Sometimes people
even claim to see AI capabilities leveling off or point out that hallucinations
persist even in advanced models.
If scaling is indeed the road to more intelligence, then we can expect AI to
continue to exceed expectations if we add more hardware to the system. This
hypothesis is being tested: US private AI investment could exceed $100 billion
annually, representing one of the largest technological bets ever. Let’s examine
Sutton’s thesis in light of recent performance.
We can point to three pieces of evidence that Sutton was correct about scaling.
First, game-playing AI provides a clean natural experiment. AlphaZero learned
chess and Go through self-play, without human openings or strategy. AlphaZero
surpassed earlier systems built on domain expertise. Its success came from
scale and computation, just as Sutton predicted.

Second, natural language processing (NLP), the branch of AI focused on
enabling computers to understand and generate human language, shows the
same pattern. Earlier NLP systems emphasized linguistically informed rules and
symbolic structure. OpenAI’s GPT-3 and successors rely on generic
architectures trained on vast data with enormous compute. Performance gains
track scale more reliably than architectural cleverness.
The third example is computer vision. Hand-engineered feature pipelines
(techniques where programmers manually designed algorithms to detect edges
and shapes) were displaced once convolutional neural networks (a type of AI
architecture loosely inspired by the visual cortex and designed to automatically
learn visual patterns from data) could be trained at scale. Accuracy improved as
datasets and compute increased.
Sutton’s argument concerns the scalability of methods, but in practice that
scalability only becomes visible once capital investment lowers computational
constraints.
The rate of AI advancement reflects not just technological possibility but the
unprecedented mobilization of financial resources. The typical person using
ChatGPT to make grocery lists might not know what the word “scaling” means.
A possible reason for underestimating the rate of progress is not just a
misunderstanding of the technology but a missed estimate of how much money
would be poured into it.
I compare this to the Manhattan Project. People doubted the Manhattan
Project not because it violated physics, but because it seemed too expensive.
Niels Bohr reportedly said it would require “turning the whole country into a
factory.” But we did it. We are doing it again. We are turning the country into a
factory for AI. Without all that investment, the progress would be slower.
However, neither the doomers nor the utopians will turn out to be right if we
are near a limit to either the power of scaling or our ability to physically
continue to scale. Is the bitter lesson useful for seeing us through 2026 and
beyond? This matters for unemployment today and existential threat
tomorrow.

Recent economic research offers a nuanced view. In a January 2026 paper,
economist Joshua Gans develops a model of “artificial jagged intelligence”. Gans
observes that generative AI systems display uneven performance across tasks
that appear “nearby”: they can be excellent on one prompt and confidently
wrong on another with only small changes in wording or context. Anyone who
has used ChatGPT to help with a work task and then watched it hallucinate a
plausible-sounding falsehood has experienced this jaggedness firsthand.
What makes Gans’s analysis economically interesting is his treatment of scaling
laws. In his model, increasing scale (represented by the density of known points
in a knowledge landscape) shrinks average gaps and improves mean quality in a
roughly linear fashion. This is good news for Sutton’s thesis: more compute does
mean better average performance. However, jaggedness persists and errors
remain. Scaling raises average performance without eliminating surprises or
long-tail failures.
Gans frames AI adoption as an information problem: users care about local
reliability (will the AI help me with my task?), but typically observe only coarse,
global quality signals (benchmark scores). This mismatch creates real economic
frictions. A legal assistant might trust an AI that performs brilliantly on 95% of
contract reviews, only to be blindsided by a confidently wrong answer on a
seemingly routine clause. The experienced errors, Gans shows, are amplified by
what statisticians call the “inspection paradox”. Users encounter errors
precisely in the gaps where they most need help.
Gans’s 2026 paper does not directly cite or refute Sutton, but it can be read as
exploring a structural limitation that persists even when following the Bitter
Lesson path. Scaling works, but the economic benefits of scaling may be partially
offset by the persistent unpredictability that scaling does not cure.
This limitation has practical implications for how businesses adopt AI: they
cannot simply trust benchmark performance but must invest in human
oversight and domain-specific testing. This also means that AI will not spell the
end of human jobs.

Sutton was right about the direction, but we shouldn’t take his insight out of
context. Scaling alone is not enough, and simply adding more scaling is unlikely
to get us to superintelligence. Models still need human insight and structure to
be maximally useful to companies. RLHF (Reinforcement Learning from Human
Feedback), a training technique where human evaluators rate AI outputs to help
the model learn which responses are helpful and safe, is an ingredient that
injects human values into models. Earlier architectures didn’t become GPT-4
only by adding more data.
Also, we cannot just “scale more” forever. Energy costs and data limits are realworld constraints. Thus, if AI is going to get much better it will need efficiency
and algorithmic cleverness, not just brute force. Human insight has not faded
into irrelevance yet. It has shifted from encoding intelligence directly to
shaping, constraining, and steering scaled learning systems.
Overall, let’s give Sutton due credit. Scaling works. But the efficiency of that
scaling depends on human insight about how to structure and deploy these
systems. Economists will recognize this as a familiar pattern: capital and labor
remain complements, even when the capital is measured in GPUs and the labor
involves designing loss functions.
Gans’s work adds an important economic footnote: even as scaling improves
average AI performance, the jagged, unpredictable nature of that performance
creates real costs for adopters. Businesses and individuals must navigate a
landscape where AI is simultaneously more capable and persistently unreliable
in ways that are hard to anticipate. The economic returns to AI investment
depend not just on raw capability but on developing institutions and
complementary human expertise to manage jaggedness.
The bitter lesson may be that pure scaling is powerful, but the sweet corollary is
that human ingenuity is still a vital ingredient for progress in the future.
[1] Compute, in AI research, is the total amount of computational power
(typically measured in floating-point operations (FLOPs)) used to train or run a
model.

RELATED CONTENT

Zvi Mowshowitz on AI and the Dial of Progress
The future of AI keeps Zvi Mowshowitz up at night. He also wonders why so many smart people seem to think
that AI is more likely to save humanity than destroy it. Listen as Mowshowitz talks with EconTalk's Russ
Roberts about the current state of AI, the pace of AI's development, and where--unless we take serious
action--the technology is likely to end up (and that end is not pretty). They also discuss Mowshowitz's theory
that the shallowness of the AI extinction-risk discourse results from the ...
READ THIS ARTICLE

READER COMMENTS

READ COMMENT POLICY
Brent Buckner



Feb 17 2026 at 8:04am

First, calling for better (near-universal) learning algorithms/architectures is in no way a
refutation of the Bitter Lesson. Second, with the frontier AI labs driving toward automating AI
research the direct human involvement in developing such algorithms/architectures may be
much less than it seems that you’re positing. Third, per Epoch AI, scaling at the recent trend
through 2030 seems feasible, and that may produce Artificial General Intelligence at
approximately the expert human level on remote-capable knowledge work.

Roger McKinney



Feb 25 2026 at 1:30pm

Very interesting! So far progress in AI has mostly been in language processing because it has
trillions of documents to train on. The teal test of AI will be on businesses and economics where
the data is sparse and unreliable.

Comments are closed.
RECENT POST

Feb 20 2026
LABOR MOBILITY, IMMIGRATION, OUTSOURCING

Friedman on Immigration: Setting the Record Straig...
Christopher Freiman
Even people who are otherwise enthusiastic about a free market in labor can get cold feet about immigration
once redistribution enters the picture. Some are fond of quoting Milton Friedman, who famously (or infamously)
said: “It’s just obvious you can’t have free immigration and a welfare state.” On this...
READ MORE

Feb 19 2026
ECONOMIC GROWTH

AI, Technology, and Work
Jon Murphy
Generative artificial intelligence (AI) is upending professions as diverse as art, cinema, accounting, national
defense, and education. Some even argue that AI will render almost all work obsolete. They say its ability to
“think” and accomplish tasks previously solely in the realm of human ability will mean that hu...
READ MORE

Feb 17 2026
TECHNOLOGY

Learning the Bitter Lesson in 2026
Joy Buchanan
To prepare for teaching, I am reading a famous article in AI research: The Bitter Lesson, written by Richard
Sutton in 2019. I wondered what would seem prescient and if anything would feel like Sutton had gotten it
wrong. At the end, I’ll discuss economic implications. Sutton draws from decades of AI history to ...
READ MORE

SHARE
POST:









Enter your email address to subscribe to our monthly newsletter:

Email address

SUBSCRIBE

COLLECTION: TECHNOLOGY

The article you’re reading is part of Econlib’s Technology collection. Explore other Technology articles:
Feb 19 2026

AI, Technology, and Work
Jon Murphy
Aug 12 2025

The Future of Art with AI
Jon Murphy
Jul 11 2025

The Economics of Rage Bait
Kevin Corcoran
Jun 21 2025

Thoughts from Crushing Capitalism
David Henderson

The Library of Economics and Liberty
Econlib
About

Resources

About Us

Quickpicks

Contact Us

CEE Encyclopedia

Privacy Policy

College Guides
High School Guides

Publications
Books
Articles
EconTalk
EconLog
Videos
Sign up for our newsletter
Enter your email address to subscribe to the Econlib monthly newsletter.

»

Your Email Address
Liberty Fund, Inc.
11301 N. Meridian Street
Carmel, IN 46032-4564, USA
info@libertyfund.org

   

© 2024 Econlib, Inc. All Rights Reserved. Part of the Liberty Fund Network.
