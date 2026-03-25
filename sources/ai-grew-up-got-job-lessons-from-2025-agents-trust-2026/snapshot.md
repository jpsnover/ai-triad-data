<!--
  AI Triad Research Project — Document Snapshot
  Title      : AI grew up and got a job: Lessons from 2025 on agents and trust
  Source     : 
  Type       : pdf
  Captured   : 2026-03-23
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# AI grew up and got a job: Lessons from 2025 on agents and trust

> **Snapshot captured:** 2026-03-23
> **Source:** 
> **Type:** pdf

---
Cloud

Blog

Contact sales

AI & Machine Learning

AI grew up and got a job:
Lessons from 2025 on agents
and trust
December 18, 2025

Will Grannis
VP and CTO, Google Cloud

Google Cloud experts review how 2025
transformed AI from simple chatbots into

autonomous agents that require new standards
Contact sales
Cloud
Blog
for trust and evaluation.
In our Ask OCTO column, experts from Google
Cloud's Office of the CTO answer your questions
about the business and IT challenges facing you and
your organization now. Think of this series as
Google Cloud's version of an advice column —
except the relationships we're looking to improve
are the ones in your tech stack.
This month, we're looking back at 2025 with Will
Grannis and his team at the Office of the CTO. As
the year comes to a close, we asked the team to
reflect on the most significant AI insights, lessons,
and developments of the year.

Understanding agents
AI grew up and got a job
Antonio Gulli
2025 was the year we stopped chatting with AI and
started treating it like an actual employee. The
difference between an LLM and an agent is huge.
An LLM is a brain in a jar that knows facts. An agent
is that same brain with hands and a plan. It uses

logic to break down goals, tools to interact with the

Cloud
Blog so it doesn't repeat mistakes.
world, and memory
Take a party planning agent. Where a traditional
chatbot would give you a guacamole recipe, an

agent checks your calendar to pick a date, emails
friends to see who's free, orders avocados through
a grocery store API, and creates a Spotify playlist
based on what your friends like. It does the work
instead of talking about it.
To keep agents from going off the rails, developers
can use Agentic Design Patterns: Guardrails block
risky actions, critics review outputs for errors before
you see them, and routers direct different parts of
complex tasks to specialized models.

Moving beyond atomic tools
Yingchao Huang
As we move from deterministic software to
probabilistic agentic workflows, we face a critical
reliability gap. Traditional databases rely on ACID
properties to prevent corruption. Current agent
frameworks often model multi-step actions as
continuous flows without a transaction coordinator
(TC), creating non-atomic failure modes. When an
agent crashes mid-operation — paying a vendor
before updating a record — it risks irreversible side
effects and data corruption.

Contact sales

The solution: Treat atomicity as an infrastructure

Cloud
Blog
requirement,
not a prompting challenge. We must
implement patterns like “agent undo stacks” and
TCs that encapsulate complex logic into atomic,
reversible units. Using mechanisms like idempotent
tools and checkpointing, failures trigger safe
rollbacks rather than leaving inconsistent states.
This shifts the reliability burden from the
probabilistic LLM to deterministic system design,
where it belongs.

Agents that learn on the job
Michael Zimmermann
In 2025, agents arrived center stage with everyone
expecting meaningful ROI. But agents designed by
engineers often lack the tribal knowledge gained
through experience in finance, legal, HR, and sales.
On-the-job agent learning is being heavily
researched: how agents evolve after launch, learn,
and adapt. Agents' quality and trust can grow
meaningfully during deployment and don’t need to
to score 100% on all metrics day one. Agents can
shadow experts, learn and evolve.
Agents can perform to a certain level initially,
equipped with building blocks that let them rapidly
evolve and sometimes surpass humans. The critical
piece is creating the learning loop where agents
take signals from the environment and humans in

Contact sales

production, integrate into their knowledge and grow

Cloud
Blog
their performance.

The trust integration
challenge
Troy Trimble
This year AI reached a point where it can handle
greater volume and complexity while agents can
increasingly automate routine work. This means we
can focus on higher-value intellectual tasks.
Integrating agents into existing workflows is both
crucial and challenging because humans lack
complete trust in AI. This trust deficit requires
robust processes allowing gradual integration of AI
functionalities as we build confidence. Second,
agent identity and its integration with existing
human and service account-based identity systems
is still developing. These concepts need refinement
before widespread adoption.
After successful integrations build trust, we'll
transition to AI-first systems where human
involvement remains a core design principle, given
equal priority alongside AI user journeys.

Contact sales

Cloud

Blog

The ROI of AI
Leading companies are moving beyond
debating AI's possibilities and are now using AI
agents to drive measurable business value and
achieve significant ROI by automating complex
workflows. Discover how in our new report.

Read it now.

Deploying at scale
The shift to edge inference
Pablo Rodriguez Rodriguez
The conversation around AI fundamentally shifted
from capability to trust in 2025. For our largest
global customers, trust is defined by sovereignty
(control over data, infrastructure, and models) and
compliance (adherence to regulations like the EU AI
Act).

Contact sales

AI moved from centralized cloud training to secure,

Cloud
distributed Blog
serving at edge locations. Inference

workloads surpassed training workloads this year.
As agents and AI content generation exploded, the
challenge became secure, cost-effective service at
scale for sovereign customers where most activity
happens at the edge.
One breakthrough was enabling Gemini to run
securely on-premise in Google Distributed Cloud
environments. This required extending confidential
computing to the edge, ensuring that sensitive data
and model weights are encrypted while being
actively used. Secure enclaves using hardware-level
memory encryption made this possible.

Simulation before
production
Hann Wang
In 2025, AI moved from experimental pilots to broad
adoption. As the industry has evolved, deploying
agents has become less a software problem and
more a governance challenge.
In complex workflows with multiple agents, it's
difficult to isolate which agent drove success or
caused failure. Static benchmarks like Q&A tests are
obsolete for business use cases. Real business is
dynamic, adversarial, and negotiated.

Contact sales

We pioneered dynamic simulation through Game

Cloud
Blog AI agents against each other in
Arena, wargaming
complex scenarios. This allows us to stress-test
strategic thinking and adaptability in a safe sandbox,
ensuring agents are battle-tested before they
interact with live customers.
We also applied game theory to evaluation
pipelines, establishing a mathematical framework
for credit attribution. This gives enterprises KPI-level
visibility to audit AI performance, reward the right
behaviors, and correct risks.

Building responsibly
Every GenAI project is an
eval project
Ben McCormack
After working on GenAI projects globally, one
pattern became clear: every GenAI project rapidly
becomes an evaluation project.
Evaluation differs from classical software
engineering where we define exact outputs for given
inputs. GenAI is nuanced: an LLM might give
different answers each time, and customers often
deploy chatbots as gateways to their companies,

Contact sales

requiring not just accuracy but brand voice

Cloud
Blog
consistency.

This means teams need to become experts in
evaluation for all GenAI projects. Successful teams
invest in building reusable evaluation scaffolding
that lets them measure quality consistently as
models and requirements evolve.

Evaluation as real-time selfcorrection
Carina Claassen
Evaluation evolved from a passive metric to an
active architectural component in 2025. Integrating
evaluation directly into agentic pipelines as a
closed-loop system is a powerful strategy for
improving quality.
An autorater (an LLM acting as judge) assesses
each agent output in real-time. When it detects an
error, it provides actionable feedback the agent
uses to retry or correct itself, steering toward better
outcomes without human intervention.
This self-correction mechanism solves the
compounding error problem. When an agent makes
a mistake in step two, traditional evaluation only
catches it after step ten fails. Real-time autoraters
catch and fix errors at the source, before they
cascade.

Contact sales

Even for tasks without objectively right answers,

Cloud
Blog likely errors and iteratively fix
autoraters predict

them for higher overall quality. This closed-loop
approach levels up evaluation from a static quality
measurement to a powerful tool for dynamic quality
improvement.

Business leaders must learn
the KPIs for AI
Chuck Sugnet
The metrics determining AI success deserve the
same attention as revenue or EBITDA, but most
executives don't understand them yet.
Trying to manage AI projects without AI KPIs ends as
poorly as running a business without accounting.
Consider fraud detection: an algorithm predicting
every transaction as "not fraudulent" would be 99%
accurate if only 1% of transactions are fraudulent,
but would catch zero fraud. This introduces
precision (correctness of fraud predictions) and
recall (percentage of actual fraud caught).
Business leaders need to adopt these measurement
frameworks now. Three investments matter most:
Build measurement literacy across teams
Treat evaluation datasets as strategic assets
Embed continuous measurement into operations
so teams can iterate quickly

Contact sales

AI KPIs are moving from research labs to

Cloud
Blog
boardrooms.
The time to learn this language is now.

Bias toward action
Jen Bennett
When technology moves this fast, it's tempting to
wait for perfection. Don't. Dig in and use the
opportunity to learn.
Some projects were too early and didn't work as well
as we hoped. Those lessons became fuel for the
next wave of innovation. We learned to share
findings generously, early, and often. We retest
when new models come out and stay comfortable
throwing away code and pivoting quickly.
We spend significant time thinking about evaluation:
How will we know when something performs well?
What metrics matter most? Like test-driven
development, the best place to start is with how you
plan to evaluate "good."

Practical craft
Art directing your GenAI

Contact sales

Lee Boonstra

Cloud

Blog

The most crucial lesson from 2025: the quality of AI
output is a direct reflection of the quality of
instruction. We've moved past treating AI like a
magic black box. The most effective leaders are
directing it.
To master generative AI, we must understand how it
processes instructions. For text generation, LLMs
are prediction engines. They take your prompt and
predict the most probable next word. Vague
instructions force the model into a wide search
space, leading to generic responses.
For image generation, your prompt converts into a
mathematical embedding that guides the process.
Vague words like "good" give the model no clear
visual direction.
In both cases, precision is your most powerful lever.
Act as the Art Director by defining scope, style, and
structure before the model starts generating. This
eliminates ambiguity that leads to generic results.
Specificity is cheaper and more effective than
regenerating outputs until something works.

The four ingredients for
success
Diane Chaleff

Contact sales

After executing dozens of applied AI experiments,

Cloud
Blogat the start lead to more
four ingredients
transformative outcomes:

A use case that matters to the business. Make
sure the topic you're applying AI to actually
matters.
Data. Without realistic data, you can't know if an
experiment will actually work. Gathering and
refining the right data is often one of the longest
steps.
Metrics. How do you know if each experiment
run is getting better or worse? You need clear,
climbable, explainable metrics. Many AI use
cases live in gray areas without yes/no
outcomes. Spend time deciding how you'll
measure.
Appropriate error risk. Even the best-designed
AI isn't flawless. What steps can your solution
take to limit risk? Can you put boundaries on
acceptable output? Are end users
knowledgeable enough to notice errors? This
question requires self-judgment but matters
before starting.

AI accelerating science
Jeff Sternberg
For me, 2025 was the year of AI advancing science. I
came to this through weather forecasting, helping
to launch WeatherNext in Google Cloud. As the year

Contact sales

progressed, we learned more about AI's potential to

Cloud
Blog every scientific discipline.
accelerate nearly

Modern science relies on large datasets and scaled
data analysis. General purpose models like Gemini
handle both structured and unstructured scientific
sources, making them perfect for agentic AI systems
like AI Co-Scientist.
In Co-Scientist, agents search and understand
scientific literature and datasets. Other agents
generate novel research ideas based on this
research combined with the scientist's prompt. Still
other agents review generated ideas and score
them for novelty, feasibility, and impact. Similar to
LMArena, Co-Scientist runs a tournament with AI
agent judges, simulating peer review. This produces
ELO scores that let the most promising research
ideas bubble to the top.
This process accomplishes research that would
otherwise take scientists days or weeks. One
colleague told me, referring to AI agents for science:
"this really works." If you know any scientists, that's
high praise.

Vibe coding and
understanding
Mark Schadler

Contact sales

Vibe coding (using AI to interact with code using

Cloud
Blog moved beyond bugfixes or local
natural language)
functions and gained the capability to understand
and interact with entire codebases. This unlocked
new powers of AI-assisted development, including
"vibe understanding" as an effective way to learn
and explore even large codebases.
While fundamental development principles still
apply (it's easier to write new code than read and
maintain old code), AI-assisted development is
decreasing the distance between these two
activities.
This represents a shift in how developers work.
Instead of spending hours tracing through unfamiliar
code, developers can now ask questions and get
coherent explanations of system design, data flows,
and integration points. The ability to have a
conversation with your codebase fundamentally
changes the development experience.

Conclusion
Three things defined 2025: agents got jobs,
evaluation became architecture, and trust became
the bottleneck.
The technical progress was real. Task-optimized
tools replaced fragile API chains. Learning loops let
agents improve after launch. Sovereign cloud
infrastructure extended to the edge with
confidential computing making it viable. Cultural

Contact sales

shifts are also taking hold. Business leaders need to

Cloud
Blogthe way they know revenue metrics.
learn AI metrics

Contact sales

Teams need to develop comfort deploying imperfect
systems that improve over time.
Successful AI deployment requires building the
infrastructure to deploy systems that learn, the
evaluation frameworks to measure improvement,
and the trust mechanisms to integrate AI into
workflows gradually. In 2025, we saw the start of
these shifts at enterprise scale.

Posted in AI & Machine Learning

Related articles

AI & Machine Learning

AI & Machine Learning

The "infinite capacity" myth: How
AI is breaking the old cloud rules

Your agents are leaving the
building

By Jamie de Guerre • 3-minute read

By Will Grannis • 6-minute read

Cloud

Blog

Contact sales

AI & Machine Learning

AI & Machine Learning

The KPIs that actually matter for
production AI agents

Beyond the pilot: Five hard-won
lessons from Google Cloud’s AI
transformation

By Benazir Fateh • 9-minute read

By Amy Liu • 10-minute read

Follow us

Google Cloud
Help

‪English‬

Google Cloud Products

Privacy

Terms
