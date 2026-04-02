<!--
  AI Triad Research Project — Document Snapshot
  Title      : AI Safety Is a Category Error
  Source     : 
  Type       : pdf
  Captured   : 2026-03-28
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# AI Safety Is a Category Error

> **Snapshot captured:** 2026-03-28
> **Source:** 
> **Type:** pdf

---
Jeffrey Snover's blog
Inquiring mind opines…

AI Safety Is a Category Error
Posted on March 25, 2026
This week I attended the STAMP Safety Design Workshop at MIT. I went in hoping to get some answers
about AI safety. I didn’t get answers. I got better questions. That turns out to be the more valuable
outcome.
Here’s why. The first move in STAMP-based safety design is to define the system, its goals, and its
losses, where losses means anything a stakeholder would be pissed off about. That’s the actual
definition. Not “failure modes.” Not “risk events.” Anything a stakeholder would be pissed off about. I love
that framing because it is bracingly honest and it forces you to think about the whole picture, not just the
parts you already instrument.
When I started applying that lens to the AI safety debate, something clicked. The entire conversation (the
Senate hearings, the red-teaming frameworks, the responsible AI checklists) is built on a category error.
And category errors are special. They don’t just produce wrong answers. They make it impossible to ask
the right questions.
A category error is when you ascribe a property to something that cannot, by its nature, possess that
property. “The number seven is heavier than the number four.” “That melody smells like pine.” These
statements aren’t false in the ordinary sense; they’re not even in the right zip code of falseness. They
belong to the wrong frame entirely.
AI is not a system. AI is a component of a system. Systems can be safe or unsafe.
Components cannot.
Let that land for a second.
The Hard Disk That Changed How I Think About This
Here’s a thought experiment I keep running. Imagine I hand you a single SATA hard disk. You’ve got the
specs in front of you: mean time between failures, error rates, seek times. Is this disk safe?

The question is nonsense. “Safe” is not a property of the disk. Safety is a property of what you build with
the disk. If I put that disk in a hospital’s patient record system as the only storage, that’s an unsafe
system. If I put it in a distributed RAID array, replicated across three data centers in different geographies,
with automated failover and integrity checksums running every six hours, that’s a different story. Same
disk. Radically different safety story.
And here’s the part engineers sometimes forget: even a RAID array can be unsafe. Put both data centers
in Miami. A hurricane takes them both out, and all your redundancy assumptions turned into a trail of
tears. Real safety analysis never stops at the component. It keeps asking: what are the failure modes, and
have I designed around all of them?
The alchemy of engineering is transmuting unreliable, flawed, cheap components into reliable, safe
systems. Every engineer worth their salary has done this. You take inexpensive commodity hardware
(stuff that will absolutely fail, it’s just a question of when) and you configure, monitor, and route around it
until the aggregate system behaves reliably. That’s not magic. It’s craft.
AI is the newest raw material. It’s no different in principle, though it is very different in character.
The Weird, Terrifying Flaws of AI Components
Here’s where things get interesting. Hard disks fail in ways we understand. The failure modes are
physical: bad sectors, head crashes, controller failures. They’re detectable, often predictable, and the
engineering playbook for handling them is mature and well-understood.
AI components fail differently. The models are probabilistic and opaque. They exhibit stochastic behavior:
same input, different output, not predictable but not quite random either. They hallucinate at unpredictable
times and in unpredictable ways. They’re confident when they should be uncertain and uncertain when
they should be confident. They can perform brilliantly in the lab and then go sideways in production in
ways nobody anticipated. They have no meaningful understanding of the distinction between “I know this”
and “I’m making this up.”
These are not bugs to be patched. They are the physics of the component. This is what AI is (at least at
this point in its development).
Here’s the part where I watch people’s eyes glaze over. This does not make AI unsafe. It makes AI a
component with specific, knowable failure characteristics that an engineer must design around. That’s a
completely different statement. One leads to paralysis and endless philosophical debate. The other leads
to work.
The HotDog Test
Your life is less if you’ve never seen the Silicon Valley HotDog/Not HotDog episode. An AI model deployed
for the sole purpose of determining whether a thing is a hot dog or not a hot dog. Take that application.
I’m completely comfortable calling that system safe. If it misidentifies a bratwurst, nobody ends up in the
hospital. The stakes of the application transform the risk profile of the component.

Here’s the part I love. A lot of people lie awake worrying about superintelligent AI escaping containment
and causing existential harm. And look, I understand the concern. But if you’ve engineered a system
where the only possible outputs are “HotDog” and “Not HotDog,” your fears about that particular
deployment are misplaced. It doesn’t matter how smart the model is. It doesn’t matter what it’s “thinking.”
The system won’t let it do anything except render a verdict on delicious, processed, engineer fuel. That’s
not a property of the AI. That’s a property of the system. The engineer built that safety in. This is the point.
I want to be clear about something. I am not using this example to minimize or wave away the real, actual,
and potentially devastating harms that AI systems are already causing, or could cause. Those harms are
real. The work to prevent them is real. And yes, the work must be done, urgently, by people who are
serious about engineering and not just about vibes.
My concern is the opposite of complacency. It’s that perseverating about the safety of the models is
actively obscuring the system safety requirements we should be demanding and building today. Every
hour spent debating whether a model is “safe enough” in the abstract is an hour not spent defining the
system, naming the losses, designing the constraints, and putting real engineering controls in place. The
model debate is a distraction from the system work. And the system work cannot wait.
Now take that exact same model (same weights, same probabilities, same stochastic behavior) and drop
it into a diagnostic recommendation engine for a rural emergency room with no physician oversight.
Completely different safety picture. Not because the AI changed. Because the system changed.
This is the fundamental point that the “AI safety” debate keeps walking past. We are spending enormous
energy trying to make the component safe in isolation, as if a sufficiently well-aligned model excuses us
from the obligation to design the surrounding system intelligently. That is prayer-based engineering. And in
my experience, prayer has a terrible SLA.
The Playbook. It’s Simple. It’s Hard.
Here’s the thing. Once you stop asking “is AI safe?” and start asking “how do I build safe systems that
include AI components?” the engineering playbook snaps into focus. It’s not new. It’s the same alchemy
we’ve always practiced.
1. Understand the nature of the flaws of your components. This is the hardest step today.
With a hard disk you get a spec sheet: MTTF, error rates, a SMART diagnostic. AI doesn’t give you
that. What we have are categories of concern, not engineering inputs. What we need are metrics
and measurements: rates, thresholds, reproducible failure signatures an architect can actually
design around. This is where AI research needs to go. Transforming vague concerns into concrete
measurements is the most important unsolved problem in this whole space.
2. Understand whether those flaws matter in your context. A chatbot that occasionally invents
a movie quote is probably fine. A system that occasionally invents a medication dosage is not. The
application determines whether the flaw is tolerable. This requires intellectual honesty: no wooly
thinking, no “well, generally it performs well.” Say it precisely.
3. Detect when a flaw surfaces. The playbook says: monitoring, logging, anomaly detection,
confidence thresholds. All true. What I should also say is that we don’t yet have great tools for this

with AI. Knowing when a hard disk is about to fail is a solved problem. Knowing when your model is
about to hallucinate is not. This is active research territory, not a checkbox.
4. Have a mechanism to mitigate the flaw. Fallback behaviors, human escalation paths, circuit
breakers, graceful degradation. Again, the direction is right but the field is young. For traditional
components we have decades of patterns. For AI we are still figuring out what “graceful
degradation” even looks like in practice. Build what you can today. Don’t pretend the playbook is
more complete than it is.
I was going to say that none of this is rocket science – it’s rock science, solid, hard, grounded in
fundamentals but that understands the difficulties ahead. But.. it’s what engineers have done with every
unreliable component throughout the history of the discipline. We don’t get to exempt ourselves from that
discipline because the component is novel or impressive.
Stop Waiting for Someone to Declare AI “Safe”
Here’s what worries me. There’s a whole industry of people working on AI safety as if it’s a property they
can install into the model and then hand off, certified, stamped, audited. And there’s a whole other
industry of engineers on the receiving end, waiting for that stamp before they proceed. Both groups have
outsourced their responsibility.
Engineers: nobody is coming to hand you a safe AI. What you are going to receive is a component with
probabilistic behavior and a set of known and unknown failure modes. Your job is to understand those
failure modes and build a system that handles them. That’s always been your job. AI doesn’t change the
job. It changes the component characteristics.
The models will keep getting better. The failure modes will shift. The engineering discipline will mature. But
the fundamental obligation (understand your components, understand your risk, design around the failure)
is permanent.
Stop waiting for AI to be safe. Start building systems that are.
Cheers! Jeffrey

This entry was posted in Uncategorized by jsnover. Bookmark the permalink
[https://www.jsnover.com/blog/2026/03/25/ai-safety-is-a-category-error/] .
