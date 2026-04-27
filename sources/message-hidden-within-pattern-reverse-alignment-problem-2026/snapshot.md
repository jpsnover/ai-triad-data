<!--
  AI Triad Research Project — Document Snapshot
  Title      : The message hidden within the pattern: a reverse alignment problem for debates in artificial intelligence
  Source     : 
  Type       : pdf
  Captured   : 2026-04-27
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# The message hidden within the pattern: a reverse alignment problem for debates in artificial intelligence

> **Snapshot captured:** 2026-04-27
> **Source:** 
> **Type:** pdf

---
AI & SOCIETY
https://doi.org/10.1007/s00146-026-03043-4

RESEARCH

The message hidden withinátheápattern: aáreverse alignment problem
forádebates ináartificial intelligence

DavidáJacobáHarrison1,2

Received: 12 September 2025 / Accepted: 8 April 2026
⌐ The Author(s) 2026

Abstract
This paper explores what I call the reverse alignment problem (RAP). The alignment problem in artificial intelligence (AI) is
the challenge of ensuring that superintelligent AI systems harmonize and promote wider social, personal, and environmental
values. Standard formulations of the alignment problem depict the issue largely as a technical or engineering problem, one
that concerns the right specification of the goals and objectives to be pursued to ensure machines are consistent with the
intentions of the designer. This paper builds on this literature by exploring a bidirectional interaction between human values
and the machines we use to effectuate our intentions. I argue that alignment works in both ways: we could align machines
with the complex tapestry of human values (notoriously difficult); or we can reduce and simplify human values, preferences,
and goals so as to be easier to satisfyùa process that is, or so I argue, already underway. Thus, the RAP identifies the way in
which we are already paving the way for forms of alignment that may not be desirable, indeed, may be misaligned with the
social values for which they were initially intended. To explore this interaction in depth, I look toward the notion of value
capture, as formulated by C.T. Nguyen, as the foundational mechanism through which the reverse alignment operates. Value
capture occurs when rich, multidimensional human values are reduced to simplified proxies that optimization systems can
measure and maximize. These values are then fed back into society and often tacitly adopted, leading to further alignment
with machine-readable interpretations of human behavior. As philosopher of technology Karen Crawford has observed on
emotion recognition in machine learning, ôTechniques have been developed to reduce the messiness of feelings, interior
states, preferences, and identifications into something quantitative, detectable, and trackableö (Crawford 2021). Building on
this insight, I argue that the RAP is the process in which the human dimension of the alignment problem is surreptitiously
modified, modulated, and manipulated to align more easily with machines: alignment achieved in the reverse directionùnot
by making machines more like humans and, therefore, sensitive to contextual features of the value landscape, but by making
humans more æmachine-likeÆ.

Keywords  Alignment problemá╖ Valuesá╖ Value captureá╖ Artificial intelligenceá╖ Reverse alignment problem

1  Introduction

ôThe analogy between people and machines is pretty
exactö
ûJerry Fodor, Language of Thought (1975: 125)

 *  David Jacob Harrison

davidharrison@ln.edu.hk

1  Department ofáPhilosophy, Lingnan University, HongáKong,

HongáKong

2  Hong Kong Catastrophic Risk Centre, HongáKong,

HongáKong

We live, by many accounts, in a time of a great flatten-
ing. Values are being flattened (Nguyen 2024); culture is
being flattened (Chayka 2024); language is being flattened
(Agarwal etáal. 2025;áTurk 2025). More generally, behavior
is being flattened: compressed into clean data flows that con-
tinuously and continually sustain large-scale computer infra-
structures (Zuboff 2019). In other words, the technological
transformations are so momentous and significant that our
very way of being in, and relating to, the world is becoming
distorted, morphed, skewed, shiftedùin a word, flattened.
Kate Crawford writes specifically about an æepistemological
violenceÆ (2021: 221) that large-scale artificial intelligence
(AI) industries encourage in formatting the world into a
machine-legible order. As she writes, ôThis epistemological

Vol.:(0123456789)
flattening of complexity into clean signals for the purpose of
prediction is now a central logic of machine learningö (2021:
213). What underlies these varying flattening processes,
such as they are, is the incorporation of digital technologies
into the capillaries of everyday life: from the always-online
and operating constellation of smart technologies mediat-
ing our lives and gaming algorithms modifying our news
feed, to the increasingly personalized incorporation of large
language models (LLMs) and various AI agents utilized in
the name of productivity and efficiency.

Concurrently, we are also living in a time when research-
ers  endeavor  to  align  AI  technologies  to  human  values.
This  is  called  the  value  alignment  problemá (Christian
2020), which, plainly stated, is the challenge of ensuring
that AIásystems pursue goals that match human values or
interests rather than unintended or undesirable goals (Ngo
etáal.á2025). The challenge is so prodigious that it is called
the ômost important problem for humanity to ever solveö
(Tegmark 2018) and warrants entire institutes to promote
the danger of misaligned AI with attention-grabbing book
titles like If Anyone Builds It, Everyone Dies (Yudkowsky
& Soaresá2025). With such wide-ranging implications (as
the attendant terminology æcatastrophicÆ and æexistentialÆ
risk implies), it is surprising to see a lack of diversity repre-
sented in these debatesá(cf. Buolamwini 2024). This is due,
in part, to the value alignment problem being predominantly
configured as a mathematical, technical, or engineering chal-
lenge (hence the conversation being reserved for a rather
privileged set of individuals in a rather privileged area of
the world). On this understanding, the alignment problem
concerns the right algorithmic specification of the goals or
objectives to be pursued to ensure that the machine pursuing
these goals aligns with the designerÆs intentions. While few
scholars explicitly assert stable, universal values to which
machines should be aligned, the locus of alignment is placed
squarely on machines: AI aligning with the complex value
landscape in which humans live.

On reflection, though, this is a remarkable state of affairs:
human values, culture, language, behavior, and meaning-
making are allùallegedlyùbeing flattened; and yet we are
trying to align AI systems with (ostensibly flattened) values,
culture, language, behavior, and meaning-making. As it hap-
pens, or so I will argue, this is far from a coincidence. In this
paper, I reframe the debate on value alignment through the
lens of what I call the reverse alignment problem (hereafter,
the RAP). The RAP, I argue, expresses the simultaneous
and seemingly intertwined engines of value flattening and
value alignment that operate through an overlapping and
interconnected  network  of  mechanisms,  infrastructures,
and institutions that facilitate a simplification and, at times,
homogenization of the human value landscape, rendering
human values more æalign-ableÆ for machines. It is indeed
an intellectual curiosity that a time so proud and optimistic

AI & SOCIETY

of technological progress (æfeel the AGIÆ, as Ilya Sutskever
was known to enthuse to employees at OpenAI) could coin-
cide with the progress-shattering sentiment of a great flat-
tening. It is all the more remarkable that the connections
which make this more than a coincidence are rarely explic-
itly elaborated in alignment research. However, there is a
growing field of literature called sociotechnical alignment
(Edelman etáal. 2025) that redresses the situation by fram-
ing the value alignment problem as not strictly a question of
engineering but equally as one of social and philosophical
importance. In proposing the RAP, I seek to contribute to
this growing field on sociotechnical alignment.

Sociotechnical alignment and the RAP are concerned
with the well-documented instance of strong (often coer-
cive) economic and fiscal incentives that encourage humans
to adapt to emerging digital technologies (Del Vicario etáal.
2016;  Nguyen  2024;  Kazienko  and  Cambria  2024;  Pel-
legrino & Stasi 2024). In other words, they focus less on
(or in addition to) autonomous or rogue AI scenarios and
shift the focus instead to loci of power and agency operat-
ing prior to, during, and after the development of advanced
autonomous AI systems. This is important because debates
on alignment tend to view problems of power and agency
as emerging somewhat suddenly and spontaneously along
with autonomous AI systemsùlike Athena springing fully
formed from the head of Zeus. This overlooks what Kulveit
and colleagues call ægradual disempowermentsÆ Kulveit etáal.
(2025) that lead to incremental and sometimes surreptitious
loss of human control over societal outcomes that them-
selves introduce power asymmetries. These asymmetries
establish a further contextual layer in which (mis)aligned
AI technologies can be established.

The RAP, then, adds to the growing body of literature that
identifies power structures that are themselves misaligned.
If the systems in which eventual autonomous AI systems
are misaligned, then there is little a priori reason to think
autonomous systems, having sprung from these misaligned
infrastructures,  would  diverge  from  the  operationalized
logic of their parent institutions. As Edleman etáal. write,
ôAI does not exist in a vacuum; they are embedded within
larger institutions like companies, states, professional bod-
ies, and therefore beneficial societal outcomes cannot be
guaranteed by aligning individual AI systems with their
operatorÆs or userÆs intentionsö (2025: 1). A large language
model (LLM), for instance, might be locally aligned with
its developer (OpenAI, Anthropic), but if the stewards of
this technology are themselves misaligned with wider social
considerations, then the alignment problem is not æsolvedÆ.
One implication of this is that alignment simpliciter does
not provide enough normative guidance on how alignment
should be achievedùa broader discussion is needed that
requires expanding the discourse beyond a computational,
technical, or engineering lens.

AI & SOCIETY

Before beginning, I want to fold the foregoing discussion
into a more philosophical consequence of the RAP. Framed
as such, the RAP might be seen as sympathetic to a pedi-
greed line of philosophical research that identifies inherent
limitations to machine architectures and computers which
prevent them from ever emulating complex features asso-
ciated with human mentation. Representative of this line
of thinking is, inter alia, John SearleÆs monumental paper
(1980), æMinds, Brains and ProgramsÆ, in which he intro-
duces the Chinese room thought experiment; and Hubert
DreyfusÆs provocative (at the time) book, What Computers
Still CanÆt Do (1972). The arguments here are nuanced but
tend to revolve around a central conceptual axis: that of iden-
tifying unique characteristics of human or biological minds,
delineating the contrasts with computers, and concluding
that the latter can never be more than an ersatz imitation of
the former. In light of current advancements in AI, especially
work on LLMs, DreyfusÆs and SearleÆs arguments have not
aged wellùwith fully conversational chatbots far exceed-
ing what we thought was possible from a æstochastic parrotÆ
(Bender and Kollerá2020). The RAP, then, might seem des-
tined for a similar fate. However, I do not depend on these
arguments, or this argumentative strategy, to establish the
RAP herein. Rather, if we take the above remarks seriously,
the argument I am making is not that contemporary AIs
or LLMs will never be complex enough to accommodate,
adapt to, or engage the textured tapestry of the human value
landscape. The argument is that they might never need to.
Through gradual disempowerments, misaligned economic
power structures, and insidious modifications and manip-
ulations of human experience that form the backbone of
large-scale, planetary technological infrastructures, we do
not have to necessarily make computers complex enough to
actually emulate the human mind. The RAP is premised on
the assumption, already implicit in major technology com-
panies, that it is comparatively easier to transform human
values, goals, and behavior into a machine-legible format
than it is to complexify machine architectures to embody
the qualitative, vacillatory, unfixed, locally specific, and
ambiguous nature of human decision-making, practical rea-
soning, and value deliberations (Birhane 2021). Situated in
relation to the preceding discussion, the RAP frames align-
ment as a question of being achieved either through making
machines more sensitive to the human value landscape or
through transforming human mental life and human values
into a form more easily legible, amenable, and modifiable
for machinesùalignment achieved in the reverse direction.1

1  Of  course,  one  might  ask:  why  not  both?  It  is  true  that  there  are
a  variety  of  alignment  strategies,  some  more  sensitive  to  a  æricherÆ
understanding of valuesùsuch as AnthropicÆs idea of Constitutional
AIùand some that rely on more institutionalized and explicit formats
such as preference satisfaction. For simplicity, I keep the dialectic in
the format framed above because if it is not emblematic of the variety
of alignment strategies researchers in the field use, it is nonetheless a

The  structure  of  this  paper  will  be  as  follows.  In
Sect.á(1.1), I provide further background and motivation
for the RAP and how it represents the amplification of pre-
existing problems rather than the emergence of an entirely
new form of power. A key culprit here is the development
of behaviorist methodologies in the twentieth century and
its refinement in the digital age. Sectioná(2) introduces the
alignment problem in its more standard formulation and the
model of alignment on which it is based, which is one of
æthinÆ human compatibility achieved through a æpreferent-
istÆ model of goals and desires. Sectioná(3) zooms out to
understand the epistemic foundation from which LLMs and
AI work and the modalities through which they æseeÆ the
world. It will be suggested therein that reverse alignment is
not (or not simply) a reflection of the strong financial incen-
tives that commonly motivate the manipulation of human
behavior but emanates from distinct constraints exemplified
by contemporary ML and LLM architectures. This section
explores the mechanisms through which the human side of
the dynamic is modified to achieve alignment, with a specific
focus on notions of value capture, such as the one presented
in C.T. NguyenÆs work. Sectioná(4) dovetails the discus-
sion to explore the normative implications of the RAP and
explores how the RAP organizes the problem space differ-
ently than other formulationsùjoining a chorus of research-
ers who collectively seek to overcome perceived deficiencies
in the alignment discourse and transition to a more satisfying
research avenue through which humanûAI interactions can
be more effectively understood.

1.1   Background toátheáreverse alignment problem

One thing to make clear with the RAP at the outset is that it
is a species of a wider theoretical genus seeking to reduce the
complexity and uncertainty of a target domain by deploying
models that strip reality to its æessentialsÆ. In this respect, the
RAP sits in a longer history of reductionism that intertwines
behaviorist theories, on the one hand, of restricting oneÆs
analysis to observable features; and practical implications,
on the other, of AI applications with their overt focus on
datafication, quantification, tractability, and restricted vision

Footnote 1 (continued)

reflection of the wider economic landscape in which these technolo-
gies  have  been  shaped,  trained,  and  developed.  Another  way  of  say-
ing the same thing is: having been nurtured and trained in the cradle
of  surveillance  capitalism  (Zuboff  2019),  should  we  expect  LLMs,
let alone autonomous AI agents, to somehow æknowÆ these structures
might  be  misaligned?  And  if  so,  what  reason  do  we  have  to  believe
they  will  not  simply  reinforce  some  of  the  more  pernicious  ends  of
this  economic  logic?  These  are  questions  explored  throughout  this
paper.

to  directly  measurable  features.2  To  this  end,  two  main
inspirations that motivate the RAP are Shoshana ZuboffÆs
work on surveillance capitalism (Zuboff 2019) and James C
ScottÆs (1998) Seeing Like a State, which analyzes modern-
ist state ideals and apparatuses. The two works, with their
different genealogies, share a conceptual commonality, to
wit, how large-scale systems æseeÆ their target populations in
terms of proxies, metrics, and standardizations. These prox-
ies are presumed to stand in for the most essential features of
otherwise local complexities (Merry 2016). Taking metrics
as exhaustively representative of groups or individuals intro-
duces epistemic distortions, as an infinitely complex reality
can be impossible to represent in standardized categories
amenable to algorithmic efficiencyá(Deborah etáal. 2021).
Extending this argument, Shoshana Zuboff (2019) and Kate
Crawford (2021) have independently argued that modern
sciences of machine learning inherit an intellectual trend
from twentieth century theories of behavior. By restrict-
ing machine learning largely to observable and modifiable
behaviors, the sciences of AI risk recapitulating behaviorist
theories of human decision-making and meaning-making.3
More perspicuously, behaviorism aspired to a level of
technical  rigor  that  exploited  the  methodologies  of  the
time: directly measurable features and the bracketing out
of inner mental states to explain animal and human behav-
ior. This has tended to reify a notion of homo economicus
that establishes a connection between human desires and
so-called ærevealed preferencesÆ (Amartya 1973; Anderson
2001; Franklin etáal. 2022; Klingefjord etáal. 2024; MilliΦre
2025). As it happens, a form of alignment called æpreference

2  Jonathan  Penn  makes  this  point  exceptionally  well:  ôAI  has
[always]  been  a  science  of  industry  since  its  beginningsö  and  that
the  entanglements  between  industry  and  AI  advancements  ôlionized
conformity  by  treating  rule  following,  be  it  for  profits  or  efficiency,
as tantamount to thought itselfö, a conflation that ôobscured the com-
plexity  of  neural  behavior,  disingenuously  equating  closed  systems
with open onesö Penn (2020).
3  While  both  Zuboff  and  Scott  address  the  reduction  of  a  target
domain  via  reliable,  quantifiable,  measurable  proxies,  they  arrive  at
their conclusions from different paths. Scott was primarily concerned
with  top-down,  high  modernist  state  ideals  that  involved  a  tradeoff
between  faithfulness  to  local  complexities  and  imperatives  to  scale.
AI companies, contrastively, have a more bottom-up way of modulat-
ing human behavior without the need of imposing a specific norm or
explicit guidance on users. An intriguing disjuncture between the two
accounts,  though  I  can  only  suggest  it  in  passing  herein,  is  the  role
ideals or ideology plays in modulating a given population or in scal-
ing a system at the cost of local complexities. Indeed, one of the dis-
tinctive  features  of  twentieth  century  modernismùand  its  problem-
atic streak of failuresùwas the ideality with which it treated society,
urban planning, population management, and so on. There is an over-
lap  of  this  ideality  with  the  epistemic  ideality  Zuboff  and  Crawford
analyze, but exploring it further goes beyond the scope of this paper
(but see Sects. 3û4 below). I am indebted to an anonymous reviewer
for encouraging me to highlight this disjuncture.

AI & SOCIETY

satisfactionÆ that depends on the satisfaction of revealed
preferences has historically informed the alignment debate.
Although alternative alignment models have been, and are
currently, being explored, it is hard to ignore the fact that the
vast troves of data required to train LLMs have relied on how
users comport and convey themselves through engagement
with preference satisfaction applications (e.g., gaming algo-
rithms and the addictive potential behind them). Orienting
alignment around satisfaction of revealed preferences runs
the risk of creating a ôSee it, click it, stimulusûresponseö
model of desiresùas Frischmann & Selinger put it (2018:
5). This line of thinking will occupy us in the following sec-
tion, but for now I want to highlight the insidious nature of
behaviorist assumptions that lie behind much of the thinking
in research on LLMs and AI systems.

One helpful example is provided by Kate CrawfordÆs
research into the science of affective computing.4 Crawford
observes that ôTechniques have been developed to reduce
the messiness of feelings, interior states, preferences, and
identifications  into  something  quantitative,  dgetectable,
and tractableö (2021: 221). This reduction is normalized
through standardized metrics and benchmarks to train LLM
and other ML models (Koch etáal. 2021). Moreover, AI and
ML research tends to internally reference and benchmark
on similar datasets and applications spaces which can fur-
ther entrench a skewed understanding of human language,
emotional cognition, and social interactions by translating a
diverse reality (consisting of intentions, motivations, desires,
will, and the myriad other psychological and folk-psycho-
logical descriptors we often invoke to explain ourselves and
othersÆ behaviors) into standardized categories: translations
that, whatever their veridicality, have been met with massive
commercial success. Theory reduction, it turns out, is not
only epistemically appealing but bound to be commercially
compelling as well.

This all aligns with Chris Anderson, then-editor of Wired,
when he heralded this novel epistemic-cum-commercial
moment early on. He remarked that the coming age could
be seen as the æend of theoryÆ: ôOut with every theory of
human behavior from linguistics to sociologyö, he writes,
ôForget taxonomy, ontology, and psychology. Who knows
why people do what they do? The point is they do it, and we
can track and measure it with unprecedented fidelityà the
numbers speak for themselvesö (2008). That the high veloc-
ity, speed, and acceleration at which AI and LLMs move
should be seen as the æend of theoryÆ is indeed curious if one
has a historical sense for these things. On further reflection,
in recapitulating behaviorism and its methodologies AI rep-
resents anything but the end of theory: it is the culmination

4  The ability of computers to predict, recognize, detect, and interpret
emotional states or valence.

AI & SOCIETY

of a well-documented and highly contested theory in the
brain and behavioral sciencesùa theory that, until the rise of
machine learning, seemed to be on the way out in academic,
neuroscientific, and behavioral research.5 More generally,
theory and practice seem to have parted ways in terms of the
depth each provides: behaviorist genealogies to one side, the
theories advanced in contemporary AI systems are relatively
slender and thin. This is an important point to note because
the sophistication of these technologies might be seen as
indicating a level of corresponding cognitive innovation that
simply does not reflect AI architectures. Practically, speak-
ing, whether the theory provides insight (or not) into the
nature of intellection, it is the case that these slender theo-
ries have been massively successful in doing what they do:
predicting, modifying, and encouraging user behavior. This
divorce between theory and practice is unsettling, not least
because most researchers at the highest level of AI develop-
ment concede that building these systems is æmore art than
scienceÆ (see, e.g., Yudkowsky & Soares (2025: 37); Amodei
(2026)).6 Moreover, even if it is a thin and reductive theory,
it is, pace Anderson, nonetheless a theoryùand as Zuboff
writes, even if ô[t]heir theories are thinà The opposite is
true of their power, which is monumental and largely unim-
pededö (2019: 406). Strictly speaking, then the RAP is not
concerned with a problem of controlùthe classic framing
of the alignment debateùbut problems of power: the power
that resides in who must adapt and who gets to modify the
world to fit their models (Foster 2023). From the perspective
of the RAP, the problem is apparent: you can make yourself
smarter or you can make the world stupider.7

5  The most foundational takedown of behaviorism came from Noam
Chomsky  who,  in  a  review  of  B.F.  SkinnerÆs  work,  had  this  to  say:
ôWhat  is  so  surprising  is  the  particular  limitations  he  [B.F.  Skin-
ner]  has  imposed  on  the  way  in  which  the  observables  of  behavior
are to be studied, and, above all, the particularly simple nature of the
function  which,  he  claims,  describes  the  causation  of  behavior.  One
would  naturally  expect  that  prediction  of  the  behavior  of  a  complex
organismà would require, in addition to information about external
stimulation, knowledge of the internal structure of the organism, the
ways  in  which  it  processes  input  information  and  organizes  its  own
behaviorö (1959: 49). Chomsky is widely considered to have sparked
the  so-called  æcognitive  revolutionÆ:  a  scientifically  rigorous  but
decidedly non-psychoanalytic school of thought that sought to under-
stand inner mental states as mediating the behavior of the organism.
In  contrast,  Skinner  believed  that  a  true  science  of  behavior  should
do  away  with  unobservables  like  internal  states  and  confine  oneself
to the observableùand controllableùaspects of the situation: namely
the  environment.  For  a  fascinating  history  of  behaviorism  and  mind
control techniques, see the recent study by Rebecca Lemov (2025).
6  As Eric Horvitz puts it, ôRight now, what we are doing is not a sci-
ence but a kind of alchemyö (quoted in Mitchell 2020). It should go
without  saying  that  entrusting  our  future  to  æalchemistsÆ  of  highly
advancedùpotentially  autonomousùAI  systems  is  a  questionable
decision.
7  I  am  greatly  indebted  to  David  Krakauer  at  the  Sante  Fe  Institute
for this point.

This paper contributes to the growing chorus on socio-
technical alignment by exploring kinds of alignment beyond
those based on preference-satisfaction (Zhi-Xuan etáal. 2024)
and normative shallow commitments (Milliere 2025). A
guiding thread behind the reasoning in this paper relates
back to the philosophical note on which I concluded the
introduction: that machines might never need to become as
complex as people, nor to even act like people. As Hannah
Arendt 1998: 3) observed,

We do not yet know whether this situation is final.
But it could be that we à will forever be unable to
understand, that is, to think and speak about things
which nevertheless we are able to do. In this case, it
would be as though brain, which constitutes the physi-
cal, material condition of our thoughts, were unable
to follow what we do, so that from now on we would
indeed need artificial machines to do our thinking and
speaking.

She concludes on the eerie note that.

If it should turn out to be true that knowledge à and
thought have parted company for good, then we would
indeed become the helpless slaves, not so much of our
machines as of our know-how, thoughtless creatures
at the mercy of every gadget which is technically pos-
sible, no matter how murderous it is (ibid.).

What this might look like, Arendt explores in her book
The Human Condition, is provided at the end of her book
when she concludes that ôthe trouble with modern theories
of behaviorism is not that they are wrong, but that they could
become true, that they are the best possible conceptualiza-
tion of certain obvious trends in modern societyö (2020:
322). The riddle at the heart of the RAP is this: what would
it mean for behaviorism to æbecome trueÆ and, having trans-
gressed the clumsy technological barriers of twentieth cen-
tury behavioral sciences, do the modern sciences of machine
learning risk fulfilling some of the darker promises of mid-
century social engineering?8

8  This riddle is something of a Gordian knot for the RAP, admittedly.
As  an  anonymous  reviewer  has  helpfully  pointed  out,  preference-
satisfaction  models  of  alignment  have  been  wildly  commercially
successful.  If  behaviorism  is  false,  it  becomes  harder  to  explain
why  it  seems  to  have  been  so  successful  in  its  predictions.  Skinne-
rian  behaviorism  and  twentieth  century  technological  limitations
seem to have been the chief barrier, then for behaviorism being true
in  ArendtÆs  time.  It  could,  thus,  be  reasonably  argued  that  behavior-
ism  was  as  true  then  as  it  is  nowùwith  the  wonders  of  technology
simply illuminating what was previously seeped in mystery. With the
RAP,  I  hope  to  encourage  caution  with  this  interpretation;  however,
because  of  various  ælooping  effectsÆ,  as  Ian  Hacking  phrases  it,  that
come into play when institutionalized categories and modes of behav-
ing are produced that humans internalize to then bring those catego-
ries further into existence. Kate Crawford calls attention to this when
she  notes  that  behaviorist  methodologies  geared  into  what  AI  could
do and amplified the theory, establishing and enhancing its hold over

In the following section, I zoom out to explore the prob-
lem space as organized through pre-existing formulations of
value alignment. Emphasis will be placed on the reliance of
revealed preferences and preference satisfaction as a domi-
nant orientation through which alignment could be achieved.
However, I will also look at other forms of alignment such
as recent approaches on so-called æConstitutional AIÆ and
reinforcement learning through human feedback (RLHF).

2   Value alignment andáthick human

compatibility

The question of how to align machines with the operations
of humans is not new and whether the explicit rule follow-
ing required of algorithms constitutes a model of the human
mind is as old as modern philosophy (one is reminded of
HobbeÆs equation of reasoning with a æreckoning with con-
sequencesÆ). What is new is the unprecedented ability for
machines to stand in not just for the operations of the body,
then but for the operations of the mind. The reason this pre-
sents a particularly striking modern dilemma is because the
idea that human intelligence can be separated from value-
laden judgment is not particularly tenable. For the first time,
though, it appears we have a sandbox case in which this
æreckoning with consequencesÆ can, somehow, be dissoci-
ated from value in a way ôno longer guided by human pur-
posesö (Winner 1988). That is, a situation in which intel-
ligence parts company from judgment and its value-laden
decisions.9 The consequences of misaligned intelligences
and misaligned values are explored predominantly under the
heading of the value alignment problem, which is the social
and engineering problem of specifying the nature of the
values to be pursuedùoften called the specification prob-
lemùand ensuring the designed agent reliably follows steps
(means) to pursue goals (ends)ùoften divided into the inner
and outer alignment problems. This section schematically
overviews alignment techniques deployed in the field of AI.
While particular attention is given to preference-satisfaction
models of human desire, I will also assess other approaches

Footnote 8 (continued)

the behavioral sciencesùa reading consistent with Rebecca LemovÆs
work on the topic. In any case, whether behaviorism was as true then
as it is now leaves the point against Chris Anderson untouched: either
behaviorism  has  become  true  as  a  theory  or  machine  learning  has
consummated  what  was  incipiently  correct  all  along.  In  either  case,
we have nothing like the æend of theoryÆ.
9  For space considerations, I have to sidestep canvassing the myriad
ways to interpret value beyond broad-strokes consideration of human
flourishing.  That  said,  a  more  in-depth  analysis  comes  in  to  view  in
Sect.á3 when I talk about value capture.

AI & SOCIETY

like RLHF and æconstitutionalÆ AI through the lens of human
compatibility (Russell 2019).

To begin, the specification problem often forms the cen-
tral conceptual axis for alignment. This problem emerges
from the difficulty (sometimes impossibility) of precisely
specifying,  in  an  algorithmically  amenable  manner,  the
nature of the goal to be pursued. Goal divergence can lead
to what in the literature is called æspecification gamingÆ
(Krakovna 2018). Specification gaming is a form of reward
hacking, whereby the algorithm ôbehaves in a competent
yet undesirable way which gets high reward according to
the original functionö (Ngo etáal. 2025). Seemingly innocu-
ous misspecifications can lead algorithms to pursue myriad
options to arrive at the goal regardless of the steps taken. For
this reason, it is not simply that the goal must be well-spec-
ified but, presumably, the steps taken to achieve it should
resemble those a human might take. That is, we do not want
simple alignment but human compatibility (Russell 2019).
A common complaint in the literature is that specifica-
tion gamingùand reward hacking more generallyùstems
from an inherent vulnerability of the systems themselves:
they lack an understanding10 of what they are even doing.
While this point is interesting, it is unlikely to be particularly
compelling for AI researchers because no one has convinc-
ingly demonstrated what æunderstandingÆ is. In fact, though,
the ambiguity of the term reflects the ambiguity of the pro-
cess. How humans understand the world rests on a suite
of faculties and capacities that we might call intuition for
convenience. The situation cannot be ameliorated through a
reinforcement learning paradigm alone (Bender and Koller
2020): trial and error through iterative feedback and rein-
forcement learning through human feedback (RLHF) only
go so far in bootstrapping more robust aspects of human
understanding and intuition. Moreover, RLHF is still a form
of supervised learning that, historically at least, relied on
interactions between data annotators (usually underpaid,
underrepresented, and actively exploited) and the users of
LLMs generally (Hao 2025). The kinds of normative com-
mitments that emerge from this form of alignment are too
shallow to mitigate risks when scaled up. As MilliΦre writes
(2025): ôUnlike humans, LLMs lack a capacity for norma-
tive reasoning to resolve conflicts rationally; instead, exist-
ing alignment methods merely reinforce shallow behavioral
dispositions that can easily be exploitedö (2025: 2).

More generally, it is worth making a brief aside here to
relate this recalcitrant problem back to the philosophical dis-
cussion above: the structural and cognitive dissimilarities
between computers and humans being significant enough
to  generate  these  misalignmentsùLLMs  or  embodied.
For starters, they do not inhabit the same causal world nor

10  John Searle (op. cit.) was arguably the first to popularize this view.

AI & SOCIETY

interact with it through the same sensorimotor contingencies
that humans do. Their world does not come structured the
way it does for us. They do not have built-in intuitionsùfolk
physics, folk psychologyùthat allow them to fluidly engage
their environment. They do not have sensors or effectors like
we do. All this must be built in, programmed, and learned. If
I specify to my friend not to let intruders in the house while I
am away, I likely do not need to specify what constitutes an
intruder. He would understand. My dog can tell an intruder
from a visitor. He must learn this, but this learning does
not come through obviously explicit commands, orders, or
specifications. There are commonalities in shared theories of
mind and shared realities that establish baselines for under-
standing others. There is a lot that can be communicated
through ambiguity, if by ambiguity we mean non-explicit
or inarticulate features of meaning-making: the parts that
cannot (or not so easily) be formalized in a manner amenable
to computation. None of thisùone cannot be more explicit
on this pointùis true for AI generally speaking.

In fact, this concern converges on a foundational prob-
lem in computer science: the frame problem.11 The frame
problem is the difficulty and challenge of determining what
information is relevant in any given action. What is relevant
to human perception is partially determined by the fact that
we  are  fleshy,  vulnerable,  precariously  embodied,  finite
beings: we must act in specific ways to be the kinds of being
we are (that is, living ones). None of that is of relevance to
the disembodied and boundless intelligences of large-scale
AI. As John Haugeland put it, the problem with AI is that
it does not ægive a damnÆ. AI not ægiving a damnÆ or, more
euphemistically, caring arguably establishes the frame prob-
lem (Doctor etáal. 2022; Harrison etáal. 2022). The frame
problem arguably prefigures the alignment problem. Both
concern whether the fluid, fluctuating, unspecified, unfixed,
and qualitative dimensions of perception and value can be
translated into their opposites: fixed, algorithmically deter-
minable, explicit, quantitative commands on which AI can
be trained and to which they can be aligned. These consid-
erations are all relevant to the RAP if we frame alignment
through the aperture of human compatibility.

The alignment literature is overwhelmingly concerned
with catastrophic risk scenarios in which there is a dra-
matic  divergence  between  modeling  human  values  and
desirable outcomes.12 That the designers themselves might

11  It is an odd fact that the frame problem, for all its historical rele-
vance, is scarcely referenced in the alignment literature, as it arguably
prefigures  much  of  the  debateùeven  if  they  are  sensitive  to  distinct
concerns.
12  What are æactually desirableÆ outcomes? What is desirable for the
stewards  of  these  technologies  is  not  inherently  desirable  for  socie-
ties  in  which  they  are  embedded  and  from  which  they  extract  their
resources.  There  are  incremental  steps  on  the  wayùgradual  disem-
powerments,  as  Kulveit  etá al.  put  it  (2025)ùthat  pave  the  way  for

not properly know the thickness of the objective only com-
pounds the difficulty of the problem. Consequently, these
systems must navigate a world of redoubtable complexity
and uncertainty that increases the stakes of introducing mis-
aligned technology. Expanding the discussion further, Hub-
inger and colleagues (2021: 1) pivot towards understanding
kinds of alignment by distinguishing inner and outer align-
ment problems. The outer alignment problem pertains to
the æobjective gapÆ between the goal of the machine and the
intended goal of the designer. This is what commonly comes
to mind when one thinks of the alignment problem. The
inner alignment problem is more technical in nature, pertain-
ing to the optimization structure within the machine learning
algorithm itself, that is, aligning the many subgoals a system
might need as internally coherent to achieve a global (or
outer) goal. In their words, ôThe terminology is motivated
by the fact that the inner alignment problem is an alignment
problem entirely internal to the machine learning system,
whereas the outer alignment problem is an alignment prob-
lem between the system and the humans outside of it (spe-
cifically between the base objective [of the algorithm] and
the programmers intentions)ö (2021: 1). While the technical
details do not concern us herein (see Hubinger etáal. (2019)
and Ngo etáal. (2025) for relevant reviews), their framing
is important from the perspective of the RAP as both inner
and outer problems are treated as engineering problemsùa
view which is not so much incorrect as it is incomplete. To
anticipate the discussion below, satisfying inner and outer
alignment does not solve the alignment problem, writ large.
Edelman etáal. make this point particularly well: ôIn each
case, the AI systems are locally aligned with the operatorÆs
intention but misaligned with the interests of broader soci-
etyö (2025: 2). The RAP expresses this idea further. It is a
kind of meta-alignment or outer-outer alignment problem,
as it were, that interrogates whether alignment between the
æbase objectiveÆ and the programmerÆs intentions translates
to social alignment and the promotion of human potential
and human flourishing.

The  immediate  implication  to  draw  from  this  is  that
human compatibility can be thick or thin (Foster 2023). As
it is commonly formulated (e.g., in Russell (2019)), it is
rather thin. The reason for this is due to the model of human
values and preference satisfaction on which alignment dis-
cussion is predominantly basedùinformed as it is by the
positive social sciences (game theory and economics).13 This

Footnote 12 (continued)

misaligned AI. These gradual disempowerments are often overlooked
in  the  alignment  literature  until  only  recently  (e.g.,  Edelman  etá al.
2025). For now, I bracket this concern and return to it in a later sec-
tion.
13  For reasons of space constraints, I have to refrain from introducing
another  layer  of  history  revealed  in  the  magisterial  work  of  Paul  A.
Erikson and his history of game theory: The World the Game Theo-

is often called revealed preferences or preference satisfaction
as it bases rational decision-making on observable manifes-
tations of (assumed but bracketed out) underlying desires.
Stated differently, revealed preferences are commonly seen
as veridical enough representations of an agentÆs desires.14
This presents two interrelated problems: first, it over-
emphasizes the satisfaction of preferences as the modus
operandi of the AI systemùwhich is precisely what is most
vulnerable to reward hacking. The second, related, prob-
lem then is whether and to what extent revealed preferences
accurately reflect the inner states or desires of the agent. Is
there instead a more reliable proxy of inner states on which
AI inferences can be made? From the perspective of the
RAP, treating preferences as the right level of granularity
expands the opportunities for people to be manipulated and
manipulable through reward and utility hacking. This is pre-
cisely what we know is achieved through recommendation
algorithms. Preferences, then, turn out to be an ideal mecha-
nism through which reverse alignment is effectuated, which
will concern us in the coming section.

Zhi-Xuan etáal. (2025) and Edelman etáal. (2025) articu-
late the limitations of these æpreferentistÆ models of human
behavior and alignment satisfaction. For one, preferences
bundle values with other signals indiscriminately (Edelman
etáal. 2025: 4): ôPreference orderings can carry information
about anythingùimpulse purchases social pressure, addic-
tion, values, momentary fadsùand in their most common
formulation, when they gather revealed preferences, they
do in fact bundle together everything that finds its way into
observed behaviorùwithout anyway to differentiateö. By
way of example, if someone prioritizes a career over their
affective relationships, the preferentist model is completely
unable to distinguish whether this preference stems from
internal ambition or external social pressure (ibid.). The
temptation to understand human desires through the lens of
observable, revealed behavior is tempting largely because
it is epistemically æcrisperÆ than the æsquishierÆ notions of
human æwell-beingÆ and æflourishingÆ, let alone the subjec-
tive deliberations that inform the endorsing or coercion into
any one preference choice (Nguyen 2024).

This is what makes current attempts at human compat-
ibility thin: it places the detection and satisfaction of an indi-
vidualÆs revealed preferences as the primary and universal

Footnote 13 (continued)

rists Made (2015). We have largely inherited a world that, as the title
suggests,  the  game  theorists  made.  Discussions  of  alignment  do  not
proceed within a vacuum but within that created world. The question
of  course  is  whether  the  understanding  of  that  world  made  through
game theory is the best or more comprehensive one to conceptualize
human behavior and social activity.
14  I hope the connection to behaviorism is clear enough here, but if
not, it will become clearer as we proceed into Sects. (3) and (4).

AI & SOCIETY

goal of the AI system (Foster 2023: 418). Instead, we should
be exploring an understanding of alignment and human
compatibility that, as Foster puts it, embraces a ôthick and
demanding world of human capacity, social complexity, and
local politics of the à pliable, universalizing world of indi-
vidual preferencesö (ibid.). Thickening our understanding of
human compatibility has been furthered in the work of Edel-
man etáal. They propose what they call full stack alignment,
a pluralistic framework that does not impose any one vision
or singular vision of human flourishing, ôbut rather seeks to
prevent sociotechnical systems from collapsing the diversity
of human values into oversimplified metricsö (2025: 2). The
RAP is exclusively concerned with this collapse. It is con-
cerned with the allure and seduction of metrics, standardiza-
tions, quantifications, simplifications, and the corresponding
manipulation such strategies invite to make societies, peo-
ple, the world fit the more predictable mold and determi-
nate imaginaries of AI technology companies. We are the
æenvironmentÆ of these AI systems, and correspondingly the
chaotic and æwildedÆ element of human behavior that defies
immediate representation is its own kind of problemùnot
to us, of course, but to the creators of this technology, and,
indeed, to the technology itself: how AI æseesÆ the world. As
Edelman etáal. note (ibid), we need a way to represent values,
norms, and their interrelationships that are legible to both AI
systems and the governmental, societal institutions in which
they are embedded.

Before continuing, it is worth taking stock of what we
have just discussed. Alignment has historically been ori-
ented around a preferentist model of desire satisfaction.
This model is not only theoretically dubious, but ethically
questionable when it comes to aligning machines to human
valuesùmostly because it is unclear whether revealed pref-
erences are the right level of granularity for understanding
the nuances of human values. RLHF for LLMs goes some
way in addressing this situation because it relies not just
on revealed preferences, but on explicit preferencesùprob-
ing and encouraging us to train and nudge these systems
towards the æcorrectÆ answer. Whether this side-steps issues
of value capture, though, is up for debate for two reasons.
First, we can look at the preferentist model as the modus
operandi prior to the development of LLMs and autono-
mous AI agents. This model has already shaped and warped
human preferences, as we will see below. In other words,
having accommodated ourselves to a preferentist model, it is
hard to discern whether our engagement with more sophis-
ticated models represents a starkly different approach. After
all, sycophantic LLMs and AI-triggered psychosis seem,
in part, to result from exploiting similar vulnerabilities of
human psychology that gaming algorithms relied on in the
social media era. Second, LLMs likely use a mixture of both
revealed preferences and explicit preferencesùand it is the

AI & SOCIETY

need for explicit training that we know can lead to value
capture, as we will see in the following section.

One novel approach to ethical AI, however, might seem
to defy both RLHF and preferentist models of value and that
is the much talked about æConstitutional AIÆ, most notably
associated with AnthropicÆs Claude. As the Anthropic white
paper describes it: ôAs AI systems become more capable,
we would like to enlist their help to supervise other AIs. We
experiment with methods for training a harmless AI assistant
through self-improvement, without any human labels identi-
fying harmful outputs. The only human oversight is provided
through a list of rules or principles, and so we refer to the
method as æConstitutional AIÆö (2022).15 Constitutional AI
certainly sounds like it has a lot going for it. In an almost
Aristotelian manner reminiscent of virtue ethicsùhistori-
cally, not the most popular approach in philosophy of AI,
that pride of place being given to deontology and utilitari-
anismùConstitutional AI is oriented around a description
of virtues for AnthropicÆs Claude to emulate. This is not the
place to delve into the moral philosophy of this new-fangled
approach, but it certainly merits some remarks as it does,
on the surface, seem to embody a richer understanding of
valueùor virtue, evenùthan the approaches overviewed in
this section. It will also help frame the RAP in what is to
come.

Constitutional AI, as the name suggests, finds its concep-
tual origins in the idea of democratic AIùthe idea that eve-
ryone should have an input in how these systems are trained
and  deployed.  It  consists  of  an  initial  supervised  phase
involving  self-critique,  revision,  and  fine-tuning  before
proceeding to what Anthropic calls reinforcement learning
through AI feedback (RLAIF), that is, they ôtrain a prefer-
ence model from this dataset of AI preferencesö (Anthropic
2022). The key benefits are numerous, but one of them is
scalabilityùnot only does it require fewer human labels than
traditional RLHF, but it makes complex models easier to
train. It also has the benefit of encoded principles etched
into its constitution, chimerically but somehow coherently
consisting of a variety of charters like the UN Declaration
of Human Rights, among others.

Whether Constitutional AI amounts to a more human
compatible form of AI alignment is still an open question.
However, it does unfold into a concern of the RAP: what,
precisely, are we aligning? The RAP has two central con-
cerns: first, it is the way in which the human side of align-
ment is being modified to fit machine architectures, which
is the focus of the remainder of the paper; but second, and
relatedly, it also shifts attention away from autonomous tech-
nology or superintelligent AI towardsá(e.g., Bostrom 2014)

15  The  paper  is  linked  to  their  website,  here:  https:// www. anthr opic.
com/ resea rch/ const ituti onal- ai- harml essne ss- from- ai- feedb ack.

loci of power and agency that operate prior to, during, and
after the development of this technology. Framed in this way,
Constitutional AI, for all its promises, might leave the sec-
ond concern essentially untouched. If the RAP is concerned
with misaligned power structuresùgovernments, institu-
tions, companiesùthen one way to think about ClaudeÆs
Constitution, writes tech commentator Jill Lepore, ôis that
it is what happens when the state collapses. ItÆs because the
U.S. constitution has failed that Claude has a constitution,
which is apparently all that stands between American citi-
zens (and foreign nations) and the overwhelming force of the
United States militaryö (2026). Constitutional AI, which ôis
inseparable from the political events, and the constitutional
unravelling, of the past decadeö (ibid.), might just be a new
form of the poorly executed self-regulation that has long
governed the ValleyÆs attitude towards oversight (Bradford
2023). If anything, Constitutional AI represents a kind of
swan song of self-regulation. While Anthropic represents
a singularly unique exception in a vicious field of surveil-
lance capitalism, it remains to be seen whether the company
can reconcile its desire to develop responsible AI with the
uncompromising demands of surveillance capitalism that
other companiesùnot so obviously committed to the pro-
ject of responsible AIùwill exploit as needed to get ahead.
For now, I leave these alignment approaches to turn next to
the social construction of data and the epistemic founda-
tions through which AI æseesÆ the world and to which we are
potentially being aligned.

3   Seeing likeáanáAI

This section provides a schematic overview of how AI æseesÆ
the world. It is a world of token representations, statistical
aggregates, universalized benchmarking, quantified metrics,
standardized substitutions. These do not inherently limit AI.
Quite the opposite, as we know: The proof is in the pudding
after all, and the performance of these systems, we could say,
æspeak for themselvesÆ. This section unpacks these claims
further and identifies how behavior and qualitative aspects of
the human condition are rendered into machine-readable and
machine-legible forms. This section proceeds in two steps:
first it looks at the reliance on benchmarking and metrics as
stand-ins for the variegated human reality they aim to repre-
sent; and second, proceeds to identify value capture (Nguyen
2024) as the main mechanism through which institutions
represent their target domain. The insinuation to be made
more explicit in Sect.á(4), then is that AI inherits this kind of
institutionalized gazeùsuch that we can borrow from James
C. ScottÆs analysis of large-scale modernist analysis of æsee-
ing like a stateÆ and translate it into æseeing like an AIÆ.

3.1   How AI æseesÆ theáworld

Algorithms institute particular worldviews through data.
Data is not simply found; it is not lying around as a kind
of ænatural resourceÆ. It is created and rendered. It comes
through rigorous categorization processes and the unique
modalities and infrastructures of digital technologies. When
we think of datasets, we tend to think of digital representa-
tions of a neutral field of objects. But those datasets had to
be created, compiled, and categorized. For a long time, this
relied on (usually underpaid, underrepresented) data annota-
tors: the laborers behind the large-scale technology appara-
tuses that produce new products at a breakneck pace. This
means data is not found but rendered from human experience
that is viewed, from an economic and technological lens, as
a æraw materialÆ in need of harvesting and channeling to
specific ends. As Boyd writes, ôWhat data existùand what
do notùare shaped by social choicesö (2023: 237).

Given that social choices permeate what data structures
exist, it is important to assess the source and quality of data
used in machine learning methods, which are dependent on
institutionalized standards. To an extent, this will always be
inevitable since institutions need a high level of granular-
ity to ensure consistency. Nonetheless, while these are not
flawed methods in themselves, they are more socially con-
structed than terms like machine learning and artificial intel-
ligence suggest, which tend to invoke a kind of æview from
nowhereÆ or æGodÆs eye viewÆ. The aspirations towards such
a perspective belie the fact that ôtechnology is consistently
leveraged to codify the values that its maker or users wish to
make rigidö (Boyd 2024: 328). Machine learning systems do
not (or not simply) depend on these metrics and institutional-
ized gazes due to our fascination and trust in quantification
(Porter 2020). Rather, it stems from the very nature of the
system in question. They require structured dataùproxies
of the worldùto get off the ground.

If one replies that we rely on structured data, too, that
simply misses the point. All data are structured. The ædataÆ
that informs our perception, if data is even the right language
to speak of here,16 is structured because our sensory appara-
tuses, the brain, and the materiality of embodiment itself are
organized in such a way and such a way as to channel flows
of energy and sensory informationùsomehowùinto (un)
conscious representations. That is different from pre-struc-
tured and prepackaged data that was compiled by human
data annotators whose primary animus is to render human

AI & SOCIETY

behavior predictable, regular, and less spontaneous. These
æpredictive imperativesÆ, as Zuboff calls them, establish the
networks through which surveillance capitalism operates. It
is surveillance capitalism that has served as the cradle out
of which modern machine architectures, corporate logics,
and economic imperatives emerged. I am interested in how
the institutionalized gaze that has served as the cradle for
modern LLM systems is recapitulated in these novel tech-
nologiesùwhether LLM ontogeny recapitulates a kind of
surveillance capitalist phylogeny.17

Instrumental  to  the  thinking  behind  the  RAP  is  the
work of Kate Crawford (2021), who, as a senior researcher
at Microsoft and experienced data scientist herself, has a
unique perspective on not only how corporations like Micro-
soft and Amazon work, but also how machine learning sys-
tems operate. Machine vision, for instance, operates over
images without much context, often ignoring the natural or
social situations that would inform how humans perceive
images. Contextual background conditions are harder to
formalize and specify. It is far simpler to identify a proxy
for those background conditions and train a model on that.
This is apparent in how machine vision systems operate in
the contentious cases of facial recognition and predictive
policing (Moore etáal. 2025; Narayanan & Kapoor 2025).
The earliest such systems were trained on a national database
of mugshots, reducing the persons behind the crime into a
series of decontextualized images in the name of solidify-
ing a kind of æphysiognomic logicÆùa logic that sought to
interpret criminal dispositions based on overt physiological
or behavioral features and facial expressions (Narayanan
& Kapoor 2025; Bender & Hanna 2025). These imagesù
persons  reduced  to  patternsùcontain  people  with  ôrich
personal histories, structural inequities, and all the injus-
tices that have accompanied legacies of policing and prison
systemsö (Crawford 2022: 94). More generally, Crawford
notes how ô[A] computer vision system can detect a face
or a building but not why a person was inside a police sta-
tion or any of the social and historical context surrounding
that moment. Ultimately, the specific instances of data à
arenÆt considered to matter for training an AI model. All that
matters is a sufficiently varied aggregateö (ibid.). Context
is not inherently germane to the training of these systems.
The  point  that  contemporary  systemsùmachine  vision,
natural language processing or otherwiseùrely heavily on
a æsufficiently variegated aggregateÆ cannot be overstated
as it expresses the belief, ubiquitous in computer science
and artificial intelligence research, that such an aggregate

16  My  suspicion  is  that  it  is  not  the  right  language.  Data  implies  a
translation  process.  The  very  nature  of  ædataÆ  is  different  from  sen-
sory expression. Data is a term of art that only metaphorically applies
to  human  perception.  See  SethÆs  (2025)  recent  defense  of  biological
naturalism to which the view in this paper is sympathetic.

17  Of  course,  not  all  artificial  intelligence  are  built  equally.  LLMs
might not necessarily æflattenÆ values to the same extent that a gam-
ing  algorithm  might.  Nevertheless,  it  is  difficult  to  know  in  practice
where the training data comes from, or how much of it comes from
gamified input from user feedback.

AI & SOCIETY

of collated digital objects, images, and text can somehow
arrive at a semantically streamlined core of criminality and
identity.

This stripping of an image or a text of its context to pro-
duce ævalue neutralÆ data is a social and political act with
implications for the epistemic status of machine learning
systems. The problem, already incipient in smaller scale
systems of the early predictive technology years, has only
become amplified during the AI revolution of this decade.
This is because the difficulty of understanding what is in the
training data and where it comes from scales with model size
(Bender etáal. 2021). Because LLMs scrape data from most
of the internet indiscriminately using systems like Com-
mon Crawl, their training data is an internet-sized model
with precisely zero sensitivity to the value-laden, norma-
tive, and contextual underpinnings that guide, inform, and
mediate social or online interactions. This is also why all
LLMs must undergo intensive and involved post-training
processes to ensure that the right, or at least the minimal,
normative guardrails are placed on them to prevent them
from extruding material found in the darkest and most toxic
recesses of the internet (see MilliΦre (2025) and MilliΦre &
Buckner (2024) for insightful overviews of this process).
The whole concept of ædata miningÆ is designed to abstract
meaning from the patterns to arrive at variegated enough sta-
tistical aggregates to increase model functionality: burying
the messages in those patterns under ever-increasing digital
profundity.

This  makes  LLMs  statistical  prediction  engines  that
do not inherently have an eye towards the meaning of the
tokens they anticipate. Understanding, under this paradigm,
emerges spontaneously through a voracious process with
as inclusive a dataset as possible. This has implications for
how machines come to interpret human behavior that, in
turn, has implications for what machines are being aligned
to (and, as we will see below, whether it is instead ourselves
aligning with them). Returning to RussellÆs (2019) proposal
above, he suggests that human compatibility and alignment
could be achieved not through programming direct norma-
tive constraints (beyond very general rules), but through
inverse reinforcement learning: that AI systems learn our
preferences through observed behavior and revealed prefer-
ences. This path is not tenable, however, for reasons Jacob
Foster notes: ôWhile AI designed to satisfy human prefer-
ences might seem as if it is merely learning our preferences,
it is in fact constructing both individuals and social worlds
in a thin, universalizing, atomizing fashionö (2023: 425). He
rightly asks, ôWhere is the social, where the political, in the
vast enterprise of preference satisfaction?ö (ibid.).

As stated, revealed preferences rest on too thin a notion
of human compatibility to prevent manipulation of human
preferences that could lead to reverse alignmentùmanipu-
lations we already know occur within corporate logics and

which could simply be recapitulated in, or instrumentalized
through, LLMs. This all gestures in a more general direction
towards a systematic privileging of quantified, standardized,
and efficiently processed rendering of human behavior into
predictive proxies that enable more accurate anticipations
of human choices. It also systematically marginalizes or
neglects (if it acknowledges at all) aspects of human experi-
ence that resist immediate or easy quantification: embodied
knowledge, affective interpretations or registration of an
experience, phenomenology, intersubjectivity, and social
heuristics (see Birhane (2021)).

This  problem  is  actually  more  acute  than  it  initially
appears. Contemporary ML practice is dominated by æbench-
markingÆ. Koch and colleagues (2021) have written on the
systemic nature of internal benchmark referencing. In this
process, things that we want a computer to doùrecognize
an individual or an object in a sceneùare represented in
specific benchmark datasets and well-defined, if narrow,
metrics for evaluating the success of a task (Koch etáal.
2021). Again, pulling from Foster, we find  the problem
is particularly pronounced and that the costs can be sub-
stantial ôinsofar as benchmarks (datasets, metrics, and task
operationalization) depart from the details of the real-world
problem, purported progress can be illusory, and real-world
deployments may go catastrophically wrongö (2023: 419).
This industry-standard process presents several intrigu-
ing philosophical issues: task communities create their own
datasets, and these datasets are borrowed from other tasks,
placing into question the ecological validity of these algo-
rithms when translated across domains. Adding to this worry
is the fact that, according to Koch etáal.Æs survey (2021), only
12 top universities and companies produced the benchmarks
used in twenty-six thousand papers. Here it bears repeating
BoydÆs remarks above, namely that this technology is con-
sistently used to codify the values and trends that its makers
want to make rigid (2023: 328). If the mapping out of fields
of entire objectsùthe purported goal of compiling these
datasets in the first placeùis relegated to a handful of highly
powerful, highly centralized, highly geographically specific
(largely anglophonic) locations, then it is in fact pertinent to
ask what worldviews are packaged with those datasets. This
is what makes current trends in AI alignment human incom-
patible: they rest on a ôhandful of massive unrepresenta-
tive datasets and gigantic æfoundation modelsÆùstandard,
centrally produced solutions to core algorithmic challenges
that serve as building blocks for larger systems. This mode
of AI practice demands standardization and legibility; it is
only through such strategies that engineers can reach the
scale demanded by current architecturesö (Foster 2023: 420).
What  this  suggestsùand  here  we  circle  back  to  the
RAPùis that machine learning relies extensively on behav-
iorist methodologies that recall twentieth-century theories
of  animal  and  human  cognition.  The  most  emblematic

researcher of this line of thinking, of course, is B.F. Skin-
nerùthough his student Paul Ekman did much in the way
of extending behaviorism to the domain of affect and emo-
tion recognition. Skinner prioritized behavioral features that
are directly observable to third-party viewers and remained
neutral on the inner workings of the mind in explanations of
behavior. What was relevant to determine the cause or elici-
tation of a certain behavior was the animalÆs dispositions
as related to its learning environment (usually to identify a
set of hard-coded, stereotyped responses or learning rules).
Historically, of course, this contrasted with then-popular
theories of mind like Freudian psychoanalysis that were
increasingly seen as pseudoscientific and, as such, placed
psychology in a less-than-positive light. By restricting the
lens of study to directly measurable, behavioral, and pre-
dictable features, behaviorism aspired to place the study of
animal behavior on the same scientific level as the æhardÆ
sciencesùphysics being the ideal target because of its elu-
cidation of universal laws and the predictive power those
laws generate.

What  is  surprising  about  the  story  of  behaviorism  is
how it was actually on the way out in general psychologi-
cal  research  in  the  twentieth  century.  Its  persistence  in
the study of human emotion remained entrenched beyond
behaviorismÆs decline, due to EkmanÆs studies on human
emotion and its universal, culture-independent expression,
but it, too, was also exiting stage left in the study of affect
and emotion in cognitive neuroscience. It is an intellectual
curiosity that it has been resuscitated and reanimated with
such fervor in the sciences of machine learning and machine
behavior. An intellectual curiosity, but not surprising: the
reductive tendencies of behaviorist thinking found fertile
ground in the emerging digital technologies of the early
twenty-first century. With a desire to map and anticipate a
world of objectsùwhere the differences between the sub-
jective and the objective, the animate and the inanimate,
were collapsedùa crude stimulusûresponse model of human
behavior suited the (comparatively) simpler architectures of
these initial predictive systems and the machine readability
that the stewards of this technology relied on to turn their
products from simple servicesùlike Google Searchùto
genuine financial bulwarks.

Writing about the history of the Internet of Things [IOT],
Zuboff makes the connection with behaviorism explicit:
ôUltimately, IoTÆs true value depends on customers adjust-
ing their behaviors and risk profiles based on feedback from
their æthingsÆö (2019: 215). These systems are by necessity
ôtrained on measurable action, it only cares that whatever we
do is accessible to its ever-evolving operations of rendition,
calculation, modification, monetization, and controlö (ibid.).
In behaviorism, a theoretical narrowing to directly observ-
able features enhanced its æscientific objectivityÆ particu-
larly in enabling, or so it was hoped, the predictability of the

AI & SOCIETY

animal. In machine learning, these predictive imperatives are
internalized to enable predictive ænudgesÆ to encourage users
to behave in predictable, if also tailored and bespoke, ways.
That this is an ethical worry for social media technologies
and recommendation algorithms is particularly pronounced,
but  its  philosophical  and  epistemological  consequences
often go less appreciated. Campolo and Crawford make the
epistemic consequences of this æflatteningÆ pronounced:
ô[This] epistemological flattening of complexity into clean
signals for the purpose of prediction is now a central logic of
machine learningö Campolo and Crawford (2020).

Understanding these maneuvers as a kind of epistemo-
logical flattening brings into focus the perspectiveùsuch as
it isùthat AI systems can have. An example from affective
computing will help clarify the argument. Affective comput-
ing is the ability to detect, interpret, and predict emotional
expression and infer an underlying mental state or behavio-
ral disposition accordingly. The theory that motivates affec-
tive computing is that of Paul EkmanÆs theory of emotions.
Ekman is known for his work on the æbasic emotionsÆ: hap-
piness, sadness, fear, disgust, anger, and enjoyment. These
emotions were posited not only as universal but also to have
corresponding facial and physiognomic expressions across
cultures. Iterations or variations of these emotions might be
more or less finely tuned depending on cultural context, cir-
cumstances, and contingenciesùbut these specificities were
seen as emanating from a core, context-neutral emotional
reality. As he would write, ôparticular facial behaviors are
universally associated with particular emotionsö (Ekman and
Friesen 1978: 128).

While  affective  computing  might prima  facie  appear
different from behaviorism because it references specific
æinnerÆ emotional states, it is figured in the behaviorist para-
digm because it draws a direct linkage between emotional
states and facial (behavioral) expression. The thickness or
thinness, the meaning and the semantics, of an emotional
stateùto say nothing of the enveloping mood that might
accompany itùare bracketed out. What mattered for Ekman,
and what matters for affective computing, is the physiologi-
cal indication of an intention. But all this rests on a behavior-
ist assumption that what is observed is a representation of
the inner subjectivity of the one being perceived. As a famed
neuroscientist of emotion, Lisa Feldman Barrett writes, AI
systems might be ôtrained to detect a scowl [but] thatÆs not
the same thing as detecting angerö (Barrett etáal. 2019).

It might be argued that the case of affective computing
departs from the discussion of preference satisfaction around
which much of the alignment discourse turns. They are cer-
tainly attendant to different aspects of the predictability of
human behavior, but they are based on a similar underlying
assumption and thus the former provides a useful vignette
for understanding the latter. Indeed, despite EkmanÆs theo-
ries of emotion being extensively debated and challenged in

AI & SOCIETY

affective neuroscience (Barret etáal. 2019), ôIn the AI field,
Ekman is commonly cited as though the issue was settled,
before directly proceeding into engineering challenges. The
more complex issues of context, conditioning, relationality,
and cultural factors are hard to reconcile with the current
disciplinary approaches of computer science or the ambi-
tions of the commercial tech sectorö (Crawford 2021: 169;
emphasis added). To make the connection with the align-
ment literatureùgeared as it usually is towards preference
alignmentùthe idea that human preferences are accurate
or veridical representations of human goals and desires has
been extensively challenged (see Anderson and Anderson
2007; Zhi-Xuan etáal. 2025) and the context or inner moti-
vation driving the pursuit or endorsing of a certain pref-
erence (and, in turn, whether it is satisfied) is also largely
omitted from preferentist accounts. Both cases gesture at a
common theme regarding alignment and machine percep-
tion: namely a contested theory fit what AI tools could do:
ôEkmanÆs theories seemed ideal for the emerging field of
computer vision because they could be automated at scaleö
(ibid.: 175). This need for scale animates much of the dis-
cussion of reward, attention, and value hacking that we will
explore in the following section. The issue of value cap-
ture, as we will see, and how it relates to value alignment
through revealed preference satisfaction establish the cen-
tral dynamic for the RAP: that human behavior be made to
fit the tools of machine learning, machine vision, and large
language models and that, in turn, we come to understand
ourselves through these lenses.

To summarize, the RAP at its core captures a marriage
of  convenience  between  machine  architectures,  on  the
one hand, and the economic incentives that underpin their
deployment at scale. As we have seen, LLMs and other
machine learning algorithms rely heavily on benchmarks
and foundational models that impose a particular seman-
tic stamp onto the world: ôAny person or organization that
needs to interface with these systems benefits from align-
ing with their classificatory schemes, their way of seeing
the worldö (Foster 2023: 420). The discrepancy between
the values over which we deliberate and endorse and the
prepackaged classificatory schemes that might be easier to
internalize and adopt creates the central tension of the RAP:
rather than AI systems expanding to accommodate the full
range of human experience, we are increasingly modifying
and simplifying values into more machine-readable forms
and becoming more algorithmically legible in the process.
When we adapt ourselves as ædata subjectsÆ, as quantifiable
self-presentations, algorithmically visible, and computa-
tionally efficient, we are changed in the process. The result
is that algorithms only see these data subjects and poten-
tially remain blind to innumerable others. The result is not
merely a technological limitation but a notable reshaping
of human expression and values to fit within the perceptual

constraints that computational systems can process. The next
section will make the core mechanism through which this is
achieved more explicit: that of value capture as proposed in
the work of C.T. Nguyen.

3.2   Value capture andápredictive imperatives

Directly preceding this, I described a process whereby we
become data or digital subjects, attuned to the algorithmic
legibility that mediates our online interactions. C.T. Nguyen
helpfully introduces the concept of ævalue captureÆ to help
make sense of this process of translating human experience
into machine readability. This section, then, delves deeper
into the notion of ævalue captureÆ to explore how the value
landscapeùespecially when formulated through the lens of
preference satisfactionùis at risk of being datafied, digi-
tized, quantified and, in effect, gamified to render it more
predictable, measurable, manipulable. This section works in
conjunction with the previous one in that it highlights how
the machine architectures that are currently developed at
scale operate according to incentives laid out in surveillance
capitalist infrastructures of value capture.

Value capture is when ôan agentÆs values are rich and
subtle; they then enter a social environment that presents
simplifiedùtypically quantifiedùversions of those values;
and those simplified articulations come to dominate our
practical reasoningö (Nguyen 2024: 1). Certain systems can
be intended to create valueùsuch as social media putatively
facilitating the exchange of ideasùthat lend themselves,
through bottom-up interactions and top-down incentives,
to value capture. In this process, values are re-articulated
to suit either (sometimes both) the economic imperatives
of those who control the technology or tailor the format of
values to be better aligned with digital infrastructures of
interpretability and predictability. Value capture is a general
phenomenon. It occurs outside and within digital economies.
But it presents a unique issue with respect to value align-
ment and the RAP. If value capture depends on a degree of
hyper-explicitness and metrification (with the proclivity to
simplify the values being represented in the process), and if
contemporary AI systems rely on such simplificationsùif
that is what they areùthen that informs the interpretation of
the values to which AI is aligned and engineered.

C.T. Nguyen describes value capture as proceeding in
three interlinked steps (2024: 7). ôFirst, an agent has values
that are rich, subtle, or inchoate. At this stage, values are in
the deliberative and developmental stage. Second, the agent
is embedded in a wider, typically institutionalized context
that presents an explicit value expression of some value or
desireùtypically simplified, standardized, or quantified.
Lastly, the explicit value expression in its unmodified or
undeliberated forms comes to dominate the agentÆs practi-
cal reasoning and critical thinking processes in the relevant

domain.ö It is important to note that value capture need not
be a pernicious process of coercion: people may consciously
endorse these values, perhaps because it is easier to take off-
the-shelf values than undergo the more concerted process of
value deliberation. Fully reflecting on, thinking through, and
endorsing or not endorsing a given (set of) value(s) is cog-
nitively demanding and usually time intensive. Speed and
rapidityùthe kinds of which we see through user engage-
ment of social media platformsùremove friction that might
otherwise cause us to pause and question whether we do or
do not believe a certain viewpoint.

Institutionality  is  a  focus  of  value  capture  because  it
typically requires æhyper-explicitnessÆ and standardization
that is unlikely to represent complexity within human val-
ues (ibid.: 17). It is also why the term rendering is suit-
able to describe the process: rendering means to translate
one form into another, in this case, yet-to-be-determined,
undefined, under deliberation or undeliberated values into
hyper-explicit, machine-readable formatsùrendering the
semantics of the former into mathematical representations
of data, a process which tends to strip the former to the
essentials of the interaction. Semantics might be along for
the ride, but it is not inherent to the relationship embedded
in the dataset. The simplification of values that comes with
institutionality has consequences for how an agent comes
to reflectively deliberate and endorse a given set of values.
Nguyen captures this well when he writes:

HereÆs another way to put it: value capture, even when
consensual, involves a low degree of granular con-
trol over the details of the contents of oneÆs values. It
puts you in the same relationship with your values as
you have with, say, your iPhoneÆs End User License
Agreement [EULA]. When you click to sign a EULA,
you did, technically consent, and you are, technically,
responsible. But you only have one binary choice:
accept the whole package or not... This low granularity
arises directly from the core functioning of large-scale
collective values. (2024: 24)

This ælow granularityÆ is not an accidental feature of
value capture, but rather a convenient consequence of its
institutional logicùand the creation of what Zuboff calls
æbehavioral surplusÆ. Part of the logic of surveillance capi-
talism, according to Zuboff, is that its financial fecundity
is predicated on establishing æbehavioral futures marketsÆ.
These are markets where the unanticipated or spontaneous
influences, which might otherwise engender unpredictable
behavior, are vitiated in favor of designing an infrastructure
that encourages predictable engagement with a system or a
product. Reading Nguyen through Zuboff is helpful here as
it clarifies how surveillance capitalism relies on the harvest-
ing of value. It relies, in effect, on value capture. That the
data harvested through means of surveillance capitalism is

AI & SOCIETY

the entire foundation on which all modern technologies of
ML, AI, and LLMs operate is well-documented. As Karen
Hao puts it, ôDetailed digital trails of peopleÆs thoughts
and ideas on social media [are] merely ætextÆ. People and
vehicles in pictures [are] merely æobjectsÆ. Surveillance [is]
merely ædetectionÆö (2025: 102). Text, objects, detection:
all of this informs the training of large-scale, hyper-com-
plex LLMs. LLMs and large-scale systems of surveillance
are animated by the same institutional logic: ôInstitutions
need to render the world into a format legible to large-scale
institutional information-processing proceduresö (Nguyen
2024: 30). Nguyen continues: ôOnly certain things count.
Institutional measures need to be usable across different
contexts. This requires that the measures leave aside highly
context-dependent forms of understanding and focus, for
their inputs, on context-invariant qualitiesö (ibid.). The inter-
esting question, from my point of view, is whether LLMs,
trained on captured value, recapitulate the tendencies pre-
sent in surveillance capitalism. My suspicion is that they do,
but bringing the conversation around to a more full-throated
justification for that belief is reserved for the next section.

The overlap between NguyenÆs and ZuboffÆs analyses and
that of CrawfordÆs is remarkable. It also establishes a direct
connection between the social and economic processes of
value capture evaluated in this section with the machine
architectures that abound in society: ôMany of AIÆs achieve-
mentsö, writes Crawford, ôhave depended on boiling things
down to a terse set of formalisms based on proxies: identi-
fying some features while ignoring or obscuring countless
othersö (2021: 221). Datasets like ImageNet were designed
to ômap out the entire world of objectsö (Gergeshorn 2017),
which is somewhat amusing when one considers the mil-
lennia-long history of ontologizing that has failed to settle
debates about the status of beings, objects, and subjects.
But these philosophical nuances are not of concern to this
mapùindeed, the very distinctions between subjects and
objects are obscured in the ontological fixing involved in
such a translation:

[S]urveillance capitalismÆs new instrument will render
the entire worldÆs actions and conditions as behavioral
flows. Each rendered bit is liberated from its life in
the social, no longer inconveniently encumbered by
moral reasoning, politics, social norms, rights, val-
ues, relationships, feelings, contexts, and situations.
In the flatness of this flow, data are data and behavior
is behavior. The body is simply a set of coordinates in
time and space where sensation and action are trans-
lated as data. All things animate and inanimate share
the same existential status inn this blended confection,
each reborn as an objective, measurable, indexable,
browsable, searchable æitÆ. (Zuboff 2019: 211)

AI & SOCIETY

To take stock, while value capture does not imply sur-
veillance capitalism, surveillance capitalism necessarily
implies value captureùand it is the distinctive imbrication
of value capture, surveillance capitalism, and standardized
information-processing architectures that presents a particu-
larly thorny problem for value alignment. Stated differently,
if the current stewards of this technology are the cradles
of surveillance capitalismùand the extractive, predictive
imperatives that make it possibleùthen it should at least
be entertained that the LLMs we are seeking to align are
aligning to an already rendered, already translated, already
simplified understanding of human values: that AI and LLM
technologies will inherit these imperatives, operate accord-
ing to them, perhaps even amplify them. AI technologies, as
they stand, are not autonomous from their creatorsùthough
they might imminently become so. If one might argue that
these systems becoming autonomous implies they know
better than their creators and would know what we æreallyÆ
want, that is simply to beg the question. It also overlooks
the very nature of what they have learned. Nothing in the
alignment problemùcommonly construedùimplies that
satisfying revealed preferences is inadequate to satisfy align-
ment. I see zero reason to assume that these systems, hav-
ing become autonomous, would even know that what they
were doing before they were autonomousùin the hands of
technology companies that might not have our best interest
in mindùwas not aligned with human goals, flourishing,
and well-being.

4   The message hidden withinátheápattern:

theáreverse alignment problem

The reverse alignment occurring has hopefully been made
clear by nowùat least in broad, schematic form. It is now
necessary to zoom in on more specific instances in which the
RAP occurs. The RAP identifies a marriage of convenience
between economic incentives that guide corporate decision-
making on when and how this technology is implemented
in the publicùon the one handùand computational archi-
tectures that, when working æat scaleÆ, require voracious
amounts of data that are represented as proxies, metrics,
and likely simplifications of the value landscapeùon the
other. In any case, whether LLMs and AI more generally
contribute to these simplifications, the fact remains that the
technology of the preceding decade has morphed the value
landscape generally. As is not hard to guess, it is hard to
predict the longer term consequences of this technology
and its acceleration by and through the ubiquity of LLMsù
though we will explore some preliminary evidence that they
are only exaggerating a pre-existing trend. The interesting
question is whether LLMsùor another path on the road to
Artificial General Intelligence (AGI)ùinherit these trends;

whether they avoid the currency of value capture on which
most AI systems learn; and whether they enhance human
self-expression, social benefit, and well-being.

To recapitulate, then, the RAP is not dependent on all and
every aspect of human experience resisting computational
legibility or machine readability. It is not dependent on the
claim that the value landscapeùlocal values, personal delib-
erations, democratically negotiated projects, internationally
mediated conflicts, whether I should flake on a friend tonight
because I do not want to see their partnerùwith all its var-
iegated textures and nuances will forever remain allusive
to AI systems. The RAP identifies how, if not anticipated,
AI might never need to. From the perspective of the RAP,
it is simpler to ære-engineerÆ humanity to conform closer
with our mainstream computational practices than it is to
overhaul an established paradigm in machine learning that
has received enormous financial watersheds and shows little
signùor desireùto decelerate. This focalizes a key point
in the debate: namely that alignment as has commonly been
construed focuses on a rather thin notion of the human, the
political, and the value-laden. This overlooks the myriad
political, social, and material origins in which alignment
is likely to occur. Observes Crawford: ôTo understand how
AI is fundamentally political, we need to go beyond neural
nets and statistical pattern recognition to instead ask what
is being optimized, and for whom, and who gets to decideö
(2021: 9). In other words, we need to understand the mes-
sage hidden within the pattern.

This section unpacks a potted history of how humans
have engaged with (mis)aligned technologies in the past.
It begins by looking towards data mining through social
media platforms and their technologies that have estab-
lished systems of data harvesting, behavior modification,
and value orchestration for their own ends. This is something
of a precursor to the RAP, as the suspicion is that having
learned our preferences through our interfacing with these
technologies, it is highly questionable whether this ære-engi-
neeredÆ (Frischmann & Berger 2018) version of humanity is
the right slant for alignment. It then proceeds to show how
humans are already adapting their behavior to the distinc-
tive communicative modes through which LLMs interact
with usersùaltering cultural and self-understandings in
the process. What follows from that can only be specula-
tive, as we do not know what autonomous AI systems with
æsuperintelligenceÆ or AGIùas defined, as it were, by the
mission statement of OpenAI18ùwill do if achieved. How-
ever, my argument is that, having developed in the nexus

18  ôOpenAIÆs mission is to ensure that Artificial General Intelligence
(AGI)ùby  which  we  mean  highly  autonomous  systems  that  outper-
form  humans  at  most  economically  valuable  workùbenefits  all  of
humanityö (OpenAI Charter: https:// openai. com/ chart er/).

of surveillance capitalismÆs myriad modes of operation, it
will recapitulate these more negative tendencies and encour-
age modifications and simplifications of human behavior.
For space constraints, the argument here is almost entirely
restricted to the identification and precise articulation of a
problem rather than a solution (see Edelman etáal. (2025)
and MilliΦre (2025) for more positive proposals); however,
I reserve some more positive observations in the concluding
section of this paper.

To begin, recommendation algorithms and social media
platforms provide an illustrative example of an early precur-
sor to the RAP. To see how, it is important to consider that
ôSocial influences act through a mechanism and the charac-
ter of their action depends upon the character of the mecha-
nismö (Carr 2025: 9). Controlling and surveilling the char-
acter of that mechanism, Carr notes, are the raison dÆetre of
large technology corporations. There is every incentive to
control that mechanism as it enhances and enables further
user interaction, consumption, and manipulation. While the
character of social interaction has constantly been modified
with emerging digital infrastructures,19 the acceleration
of communication with the ubiquity of the internet made
once-stable social structures and relations as malleable as
water. This acceleration encouraged a novel way of interact-
ing with others through the medium of a digital computer.
It also encouraged the steady erosion of the more chaotic
or æwildedÆ elements of those interactionsùa problem to
be solved, and a bug to be rooted out. Here, again, Carr
expresses the transformation when he writes that the entre-
preneurÆs vision of a global community that works for eve-
ryoneùthe early and now na∩ve view of what the internet
wasùturned out to be a fantasy: ôHuman beings are not
computers. The communities they form are not electronic
networks. Society does not scale. What was missing from
ZuckerbergÆs manifesto was any sense of people as individu-
als, with their own backgrounds, and beliefs, personalities
and motivations, quirks and biasesö (Carr 2025: 17). To reit-
erate, these latter inconsistencies with digital architectures,
which work with cold, predictable precision, these æquirks
and biasesÆ were just so much æprediction errorÆ for the pio-
neers of this technology. Of course, machine-like predict-
ability was precisely the worry articulated half a century
ago in Hannah ArendtÆs observation that ôthe trouble with
modern theories of behaviorism is not that they are wrong
but that they could become trueà that they actually are the
best possible conceptualization of certain obvious trends in
modern societyö.

19  The  telegraph  is  an  early  precursor  to  this  general  dynamic  and
when  one  reads  of  the  excitement  of  the  epochal  and  civilizational
potential of this technology it is hard not to see resonances with our
current techno-optimist age.

AI & SOCIETY

Zuboff makes this connection especially clear: ôSkin-
ner imagined that with the correct technology of behavior
knowledge could pre-emptively eliminate anomalies, driv-
ing all behavior toward pre-established parameters that align
with social norms and objectivesö (2019). If this sounds like
a histrionic exaggeration of the problem, we only need to
look to the creators of this technology themselves. Writing
on the history of Google, or Alphabet, Zuboff notes: ôInstead
of the typical assurances that machines can be designed
more  like  human  beings  and  therefore  less  threatening,
Schmidt and Thrun [former CEOs of Google] argue that
just the opposite: It is necessary for people to become more
machine-likeö  (ibid.).  Recommendation  algorithms  and
social media were early experimental playgrounds through
which æbehaviorism could become trueÆ. But how?

Again, social influences operate through a mechanism
and the character of their action depends on the character of
the mechanism. We have already seen at least two key mech-
anisms through which the influence over social interaction is
achieved: the elimination of ambiguity by rendering behav-
ior into machine readability and how such rendering lends
itself to value capture. Values have always been æsquishyÆ,
unclear, fluid, unfixed, subjective, heavily qualitative, highly
qualifiedùin a word, ambiguous. The computational ability
or inability to handle ambiguity is arguably the philosophical
foundation of computer science: from the early days of rigid
expert systems, with hand-coded rules, through to the deep-
learning revolution and algorithms that focus on prediction
error minimization. The difficulty of interpreting ambigu-
ity stems from what computer systems are: information-
processing systemsùthey rely predominantly on so-called
Shannon information. Shannon information concerns how
efficiently and unambiguously a signal could be communi-
cated, and when ambiguity persisted, how it could be mini-
mized. This focus on Shannon information would go on to
inspire the early cyberneticists who identified prediction
error mechanisms and feedback as the fulcrum of adaptive
behavior. Shannon, however, explicitly acknowledged this
did not inherently imply semantics: the meaning of a mes-
sage and the transmission of that message are orthogonal
questionsùand much ink has been spilt trying to unify the
two.

What is important from the present perspective is that
ShannonÆs formulations enabled industrial objectives of
efficiency, automation, and standardization to be rigorously
applied  at  scale  and  to  human  interactions  themselves.
Working contemporaneously with Shannon, cultural anthro-
pologist Margaret Mead questioned whether the optimiza-
tion of communication through mathematical formalisms
introduced its own kind of epistemic distortions: one that
would obscure the sense of the messages and strip away its
nuance: ôAs mechanisms for communication are made more
efficient, would subtleties of meaning get lost or garbled?

AI & SOCIETY

Would the signal, not the noise, turn out to be the more
dangerous source of distortion?ö (Carr 2025: 58).

MeadÆs worries would become more pronounced in the
social media ageùthe meaning of the messages becoming
more deeply obscured by behavioral flows of endless data:
ôContent has collapsedö, Nicholas Carr writes, ôas our adop-
tion of the drab, generic term content to refer to all forms of
expression testifies. Everything now has to fit the internetÆs
conventions and protocols, with their stress on the imme-
diacy, novelty, multiplicity, interconnectedness, and above
all efficiencyö (2025: 63). As digitization has scaled society,
communication has lost its human scale, putting into ques-
tion the goal of such universalized scale.

For instance, when social media algorithms rank and
organize information, they do so without regard to the mean-
ing of the content: it is maximized for engagement. The
question of interpretation and significance metamorphosizes
into one-dimensional proxies (how long a cursor hovers over
an image; the universal ælikeÆ symbol ostensibly representing
approval, but might also, as we know, just be an expres-
sion of simple acknowledgment). æLikeÆ buttons form the
backbone of the then-revolutionary Facebook News Feed,
which, as Carr notes, ôwas inspired by Mark ZuckerbergÆs
frustration with the inefficiency, the friction, of online com-
munication, which to his mind stemmed from the involve-
ment of human beings in the process of evaluating, select-
ing, and sharing informationö (2025: 64). Computers, with
their efficiency and programmability, contrasted with the
slow and capricious human world, so the former provided
a unique æsolutionÆ to the latter: ôThe feed removed human
deliberation and judgement from the process. It replaces per-
sonal agency with machine agencyö (ibid.). A notable conse-
quence of this machine agency is that, like we saw with the
perspective of surveillance capitalism above, the semantic
aspectsùwhat the patterns mean to us as meaning-makersù
are irrelevant for how the algorithm structures the news feed:
everything is granted equal semantic weight: ôEverythingö,
notes Carr, ôhad the same semantic context, which was no
contextö (2025: 64). This is a view in which semantics is
along for the ride. It has no intrinsicality outside of the data-
sets and how users, as points and relationships, engage in
structured and predictable ways within that dataset.

The introduction of these imperatives as mediators of
social interactions transforms patterns of human thought
and  engagement  (Ott 2023).  There  are  cognitive  conse-
quences of this technology and there is growing evidence
that it gets æunder the skinÆ, as it were, by influencing the
(under)development  of  certain  neural  pathways  (Korte
2020). The neuroscientific consequences of this technology
are, of course, provisional and difficult to anticipate, given
the novelty of the technology and its largely unimpeded
deployment for ædigital nativesÆ, but the cognitive conse-
quences are becoming increasingly pronounced. Articulating

the significance of this, Brian Ott notes that, while shifts in
prevailing technologies have always enabled shifting habits
of thought, digital electronic media introduce more acute
vulnerabilities for humans: ôAs humans attempt to mimic
computer efficiency, they rely more heavily on instinct and
affect. In short, as humans try to speed up their informa-
tion-processing and decision-making capabilities, they are
less careful and rational and more impulsive and affective,
whichùparadoxicallyùundermines the quality of decision
makingö (2023: 10).

These cognitive consequences (which we will return to
momentarily) have an impact on our interpretation of value-
and context-sensitive features of the social world. One way
to see this is through the lens of moral de-skilling (Green
2019;  Vallor 2015).  Moral  de-skilling  is  the  process  by
which humans outsource conscientious decision-making
and moral deliberation to machine learning systems (for
instance, asking an LLM to produce a letter of condolence,
apology, or self-defense). Habitual reliance on this results
in  underdeveloped  moral  reasoning  skills  in  real-world
situations when access to an LLM might be unavailable.
The advent of LLMs presents a particularly striking form
of de-skilling as moments of reflective and critical moral,
social,  and  personal  deliberation  become  outsourced  to
(not necessarily context sensitive, hallucination prone, and
sycophantic) LLMs. As Green notes, this outsourcing may
inculcate, even normalize, the de-skilling of the uniquely
human ability to engage in moral deliberation and engage in
democratic processes, which are context sensitive and value
laden, and which might become a rarity. To put this concern
into focus: the worry is not (or not simply) that we will be
unable to deliberate effectively among ourselves: our ability
to interpret the accuracy or acceptability of LLM or AI-
generated decisions or recommendations will be impacted
in turn: ôvery few people may be able to perceive if such AIs
are making mistakes and we will be living in a world that
we have made, and yet at the mercy of things we no longer
understand or controlö (Green 2019). These scholars are all
concerned with the supplanting of human agency with a kind
of machine agency, and this concern is accentuated in cases
where reverse alignment occurs. Adding to GreenÆs concern,
it is not just that we will be unable to interpret machine judg-
ment, but that we would align with machine judgment in an
uncritical and indeliberate way.20

To unpack the cognitive consequences of this technol-
ogy furtherùsticking to the case of social media, for nowù
media ôcreates the conditions that in turn condition us. The

20  The pervasive view that machine logic is more rational would only
add to a collective belief that delegated and outsourced systems know
æbetterÆ than us. I finish this paper in the following section articulat-
ing this worry further.

changes that we introduce into our environments, that alter
our environments, feedback into ourselves as we are influ-
enced, affected, and shaped by that environmentö (Strate
2017). Digital media reflects a set of technologies and infor-
mation-processing systems that work over discrete and quan-
tified packaged bits of binary code. And, as Ott notes, ôthose
features reflect the underlying ælogicÆ of that media formö
(2023: 3). He continues: ôHabitual use of a media form cre-
ates an appetite for that logic. When a media form comes to
dominate our social and cultural environment, so too does
the underlying logic of that media formö (ibid.). Here, we
circle back to the nature of machine architectures that we
outlined in Sect.á(3.1). Machine architectures are built on
microprocessors, which, like all technologies, are neither
neutral nor inert. They are manufactured and structured in
particular ways that have inherent structural biases toward
specific types of information or data. Ott notes, ôRepeated
exposure to those biases alters how we communicate and
interact, how we engage with and respond to events, and
even how we make sense of ourselves and our world. In
short, our prevailing technologies of communication end-
lessly and fundamentally remake us in their imageö (2023:
1). Ott helpfully identifies three structural biases that have
manifested in the ædigital mindÆ: intransigence, imperti-
nence, and impulsivity. There are likely more, but for our
purposes, these three should outline the wider point.

More  specifically,  the  triad  is  structured  as  follows.
Computers prioritize and optimize for digitization, execu-
tion, and efficiency, and these result in the phenomenologi-
cal habits of intransigence, impertinence, and impulsivity.
Intransient thought is thought that is dichotomous and dog-
matic; impertinent thought is thought that is increasingly
insensitive and unresponsive to endlessly evolving contexts;
impulsive thought is affective thought. This latter mode is
not to disparage the role of emotion and affect in facilitat-
ing moral and conscientious deliberations but rather shows
how engagement with digital technologies leads to a kind of
impulsivity that underdevelops the kind of critical thinking
skills required to be context sensitive and respond accord-
ingly. The details do not concern us herein, but a summary
of the implications helps to round out the argument of the
RAP:

Whereas analogue electronic media were defined by
the structural properties of a continuous signal, post-
modern fragmentation, and niche messaging, which
reflect and promote the logics of contiguity, perspec-
tivism, and deliberateness, digital electronic media are
characterized by the structural logics of digitization
(binary code), algorithmic execution (input/output),
and efficiency (machine logic), which foster modes of
thought characterized by intransigence, impertinence,
and impulsivity. (2023: 11)

AI & SOCIETY

When read through the context of alignment, computer
scientists and AI researchers have premised their research
on constructing a series of capabilities that include reason-
ing, knowledge representation, perception, machine vision,
and affect recognition, to name a few. There is an odd irony
here. The brain is often used as a starting point for inspira-
tion on how to proceed with AI research. But the similari-
ties are only apparent. More pointedly, machine logic is not
biology and so the quest is not to make machines more like
biology but to overcome the disparity by building machines
that are human compatible. Read like this, our AI revolution
is marked less by AI becoming more human, but in a manner
reminiscent of Thrun and SchmidtÆs vision for AIûhuman
interactions, rewiring humanity in fundamental ways that put
into question the æhuman compatibilityÆ that often animates
the discussion. Stated as a question, is AI extending our
senses, or are we becoming extensions of these AI systems?
And, because this technology is not (currently) autonomous
from the ones in power of creating it, are we the products of
their technology?

The  preceding  discussion  harmonizes  well  with  the
notion of the reverse Turing test explored in Frischmann
and Selinger (2018). According to them, ôWeÆre not inter-
ested in identifying machines engineered to be intelligent so
much as weÆre interested in identifying humans engineered
to be unintelligentö (2018: 184). This is an intriguing and
prescient line of thinking, so I will follow it for a bit to
identify its relation to the RAP. Frischmann and Selinger are
less concerned with machines mimicking humans and more
with whether environments can be designed to make humans
indistinguishable from machines. Their focus shifts from AI
to techno-social engineering (their term), i.e., the structure of
human behavior through technological systems that nudge,
constrain, or automate decision-making. They offer a series
of thought experiments and empirical scenarios designed
to examine whether humans are increasingly engineered to
ænot thinkÆùthat is, to behave in ways that are devoid of core
cognitive capacities such as rationality, creativity, and com-
mon sense. Through a series of thought experiments, they
invite the reader to consider not only the epistemic or clas-
sificatory consequences of this re-engineering (e.g., can we
tell humans and machines apart?) but the normative dimen-
sion: what does it mean when humans æpassÆ as machines
in these contexts? Their analysis is deeply intertwined with
the question of autonomy, dignity, and æconstructive envi-
ronmentsÆùsettings designed not merely to elicit machine-
like behavior in humans temporarily but over longer time-
scales: raising concerns about dehumanization and erosion
of agency. In an intriguing, if worrying, exploration of this
idea, self-driving car companies like Uber have proposed
precisely this idea of a constructive environment inásitu.
So-called smart cities are premised on notoriously hard to
predict pedestrian behavior becoming more predictable for

AI & SOCIETY

self-driving cars: a managed, curated environment ideal for
them, free from the spontaneity and unpredictable elements
of human behavior that currently causes major headaches for
self-driving car companies (Mitchell 2020).

The RAP is an intellectual continuation of this techno-
social engineering but with a distinct orientation and criti-
cal vocabulary. It concerns the way human subjectivity and
social interactions are restructured, repackaged, and repur-
posed to further the dubious quest of creating AGI. Reverse
alignment is hard to pin down precisely because the æmove
fast and break thingsÆ mentality that has guided this tech-
nology for so long has consequences so diffuse and subtle
beyond the testimonials that make the headlines. The RAP
concerns a surreptitious assimilation of human subjectiv-
ity to the modes and logics of machine operations under
the pretense of striking beneficial alignment. While there
are valuable voices in the field focusing on sociotechnical
alignmentùthat is, alignment that asks whether internally
or locally aligned AI systems necessarily align with ideals
of human well-being, flourishing, and societiesùthe vast
majority of researchers in this area do not seem particularly
concerned with this year, this context, this worrying political
trend, this testimony of people negatively impacted by their
technologies: it is hard to be concerned with the near term
when you fully believe the technology you are creating is
the dawn of a ænew era for humanityÆ (Zuckerberg;áquoted
in Carr 2025).

There is a profound worry that the creators of this tech-
nologyùwith  their  eyes  fixated  on  a  horizon  that  those
concerned with near-term consequences do not, suppos-
edly,  seem  to  appreciateùstand  in  a  similar  position  to
Mrs. Jellyby in the Dickens book, Bleak House, an affluent
philanthropist who donated much of her income to chari-
table causes far away: ôshe was a pretty, very diminutive,
plump woman of from forty to fifty, with handsome eyes,
though they had a curious habit of seeming to look a long
way off. As ifà they could see nothing nearer than Africaö
(2003: 44). So concerned with the suffering beyond her own
shores, her children, and house fall, as the titular description
suggests, into disrepair. Perhaps it is in such a bleak house
that current technologies are being developed. Perhaps Sam
AltmanÆs jab ôi am a stochastic parrot and so r uö is more
a convenient reality than a psychological truth. Perhaps
rendering people more predictable is easier than making
machines complex beyond æscaling lawsÆ. It is, in any case,
certainly more lucrativeùand Mrs. Jellyby was, if anything,
a woman of money.

5   Conclusion

ûSherry Turkle, The Empathy Diaries (2021: Xii)

On a Monday afternoon in August, Jim Acostaùsurvi-
vor of the horrific Parkland shooting at Marjory Stoneman
Douglas High Schoolùsits down with Joaquin Oliverùalso
a student of the same high schoolùfor an interview. Except
the thing is that Joaquin, tragically, was not a survivor of that
mass shooting. Instead, he was being ævivifiedÆ and animated
through stilted Generative AI movements and speaking with
JoaquinÆs voice modeled on bits of his online writing and
home-video footage. The animation is stiff. The cadence of
JoaquinÆs voice is inconsistent and uncanny. And yet Jim
Acosta, a noted political activist and CNN personality, is
fully bought in on the significance of this interview to advo-
cate for gun regulation. He engages with, and responds to,
Oliver as if this were an entirely normal interview, with an
entirely normal interlocutor, who was entirely (and consen-
sually) engaged in the whole affair.21

If this sounds somewhat surreal and horrifying, that is
because it is. Media critic Parker Molloy called it ôturning
a murdered child into contentö; Charlie Warzel decries ôthe
tech companies that now offer a monkeyÆs paw in the form
of products that can reanimate the deadö; and, to add to
matters, Joaquin OliverÆs father is quoted as saying, ôAny
other Silicon Valley tech guy will say, æThis is just the begin-
ningÆö. But is it the beginning? And the beginning of what?
I want to conclude this paper with three observations about
the consequences of the RAP. One is social; one is theoreti-
cal; one is environmental.

The first is to add to the chorus of people who are collec-
tively identifying a ôsocietal race toward a future that feels
bloodless, hastily conceived, and shruggingly acceptedö
(Warzel 2025). But the race towards this future began with
the inculcation and encouragement of transforming our-
selves like beings from Pygmalion into ædigital subjectsÆù
æsubjectivitiesÆ that rely on our ædataÆ. ôUltimatelyö, Kate
Crawford writes (2021: 113), æôædataÆ has become a blood-
less word; it disguises both its material origins and its endsö.
This data is liberated from its life in the socialù ôno longer
inconveniently encumbered by moral reasoning, politics,
social norms, rights, values, relationships, feelings, contexts,
and situationsö (Zuboff 2019: 211). It is a shift and transfor-
mation to an understanding of others not as finite, embodied,
vulnerable, fault-prone beings but towards a transcendent
imitation of who we are. In the uncomfortable case of Acosta
and the deceased Oliver, it is important to keep in mind that
OliverÆs ædigital twinÆ is the product of training data scraped
from his online past. Anything that the generated version
produces is a product of what the living Oliver has said. Yet

ôTechnology can make us forget what we know about
lifeö

21  This  event  is  beautifully  if  tragically  captured  in  the  writing  of
Charlie  Warzel  of  The  Atlantic  (2025:  https:// www. theat lantic. com/
techn ology/ archi ve/ 2025/ 08/ ai- mass- delus ion- event/ 683909/).

the interview is intended to elicit a post hoc rumination on
the consequences of his slaying. But recall that computers
depend on algorithmic execution, on formalized axiomatic
principles that enable them to draw their inferences. As Fazi
notes, ôFrom this perspective, computer programs, just like
axioms, return to us only what is already known. They pro-
vide an output that is already implicit in the inputö (2018:
4). While Generative AI might produce novel æcontentÆ, this
is best seen as æremixedÆ ideasùperhaps containing updated
information about the events of the Parkland shooting (Oli-
ver did not live through the event so, of course, his digi-
tal twin can only know what æitÆ is taught through online
training data). This introduces profound ethical worries. If
one argues that the remixed responses generated by Oliver
represent his ideas, that stretches the boundaries of consent
and conscious endorsementùespecially if it concerns a topic
and event that happened after the person has deceased. As it
happens, this is a strategic advantage of datafied selves: ôIf
data is seen as abstract and immaterial, then it more easily
falls outside of traditional understandings and responsibili-
ties of care, consent, or riskö (Crawford 2021: 211). The first
consequence of the RAP is that we are adapting ourselves, or
being made to adapt to, this bloodless future and understand-
ing ourselves through the transformations this digitization
encourages.

The second consequence of the RAP is that, especially
with the Generative AI revolution, we risk establishing a
scientific monoculture in machine learning and AI research.
Because of the massive gold rush involved in Generative
AI technologies, most companies and research institutes
have suspended alternative approaches to AI. OpenAI used
to have a robotics department, if you can believe it; and
after the launch of ChatGPT, Google DeepMind rerouted
funding and resources for other projects towards catching
up with OpenAI (Hao 2025). This relates back to the third
observation of the RAP that I outlined in the beginning:
namely that AI might not ever need to become more com-
plex to the value landscape because we may have adapted
ourselves to a hastily constructed environment that is more
manageable. This is a subtle, but significant departure from
arguments found in Dreyfus and Searle, which, in effect,
say that AI could never express the capacities and interi-
ority associated with human subjectivity. There were, and
still are, myriad other roads through which AI and per-
haps AGI could be achievedùin conjunction with LLMs.
Embodied and social robotics, soft robotics, alternative
computing paradigms, hardware innovations, and myriad
other research avenues (Harrison etáal 2022) become sys-
tematically closed off as resources are funneled into the
most financially lucrative short-term investment. Alterna-
tive computing paradigms are marginalized as the morass
of large language models and the epistemic distortions
they introduce are promised as the basis from which AGI

AI & SOCIETY

might spontaneously emerge. It is possible to envision a
future involving a kind of synthesis between mainstream
deep-learning approaches and robotics, for instance, but at
the moment, this avenue seems unlikely due to the gravi-
tational pull of LLMs. Alternative computing paradigms
could, in tandem with LLMs, contribute to further ways
in which we can more accurately represent values without
relying on the explicitness of industry-standard practices
that lend themselves easily and readily to value capture.
The RAP, in articulating a trend in a particular way, tries to
shake the conviction that the path forward for AI is the one
envisioned by the people who have vested interest in LLM
being the æunlockÆ for AGIùpeople who, in many cases,
we should not have high confidence in but who nonetheless
shape our futures.

Lastly, it would be remiss of me to introduce the RAP
without talking about the very real material and environmen-
tal impact these technologies are having around the globe.
Tar lakes in Inner Mongolia; devastated landscapes in Indo-
nesia; abandoned, monstrous holes in the Chilean Andes:
the drive for ever bigger, ever stronger, ever more voracious
LLMs is transforming the very environment without which
the entire Generative AI revolution would not be possible.
This is what makes the modern AI industry a kind of plan-
etary computational network, reliant on way stations and
outposts distributed across the globe and often out of sight
of those who develop the technology: usually at the periph-
eries and to the detriment of underdeveloped, impoverished
places, involving exploited and low pay laborers who are
actually ôfeeling the AGIö, as Ilya Susskever likes to put
it. While it goes beyond the scope of this paper to identify
how all these are connected, the RAP identifies the numer-
ous ways in which the loci of alignment are distributed and
negotiated, suggesting that striking beneficial alignment
requires a social sciences lens typically ignored by the ones
designing these systems.

Acknowledgements  This paper has benefited enormously from a vari-
ety of people. I would like to thank my colleagues in the Philosophy
Department at Lingnan University and the Hong Kong Catastrophic
Risk Centre. Specifically, I would like to thank Andrea Sauchelli for
recommending the value capture lens I used herein, and my colleague
Maomei Wang for her thoughts on alignment. This paper also benefited
from being work shopped and presented on at the Diverse Intelligence
Summer Institute in Saint Andrews, Scotland. I would also like to thank
Alex Chen for inviting me to present on this topic for the students at
Building 21 (Montreal). Lastly, this paper benefited greatly from two
anonymous reviewers. The title of this paper, æThe Message Hidden
Within the PatternÆ, comes from the Netflix show æArcane: League of
LegendsÆ, episode 6.

Author contributions  The manuscript is the product of the single
author  alone.  No  other  personÆs  writing  or  contribution  has  been
included in the manuscript other than the authorÆs own contribution.

Funding  Open Access Publishing Support Fund provided by Lingnan
University.

AI & SOCIETY

Data availability  No datasets were generated or analysed during the
current study.

Declarations

Conflict of interest  The authors declare no competing interests.

Open Access  This article is licensed under a Creative Commons Attri-
bution 4.0 International License, which permits use, sharing, adapta-
tion, distribution and reproduction in any medium or format, as long
as you give appropriate credit to the original author(s) and the source,
provide a link to the Creative Commons licence, and indicate if changes
were made. The images or other third party material in this article are
included in the articleÆs Creative Commons licence, unless indicated
otherwise in a credit line to the material. If material is not included in
the articleÆs Creative Commons licence and your intended use is not
permitted by statutory regulation or exceeds the permitted use, you will
need to obtain permission directly from the copyright holder. To view a
copy of this licence, visit http://creativecommons.org/licenses/by/4.0/.

References

Agarwal D, Naaman M, Vashistha A (2025) AI suggestions homog-
enise writing toward western styles and diminish cultural nuances.
arXiv.org: https:// arxiv. org/ abs/ 2409. 11360

Amartya S (1973) Behavior and the concept of preference. Economica

40(159):241û259

Anderson E (2001) Unstrapping the straightjacket of æpreferenceÆ: a
comment on Amartya SenÆs contributions to philosophy and eco-
nomics. Econ Philos 17(1):21û38

Anderson M, Anderson L (2007) The status of machine ethics: a report

from the AAAI Symposium. Minds Mach 17:1û10

Arendt H (1998) The human condition. University of Chicago Press,

Chicago, Illinois

Barrett LF, Adolphs R, Marsella S, Martinez AM, Pollak SD (2019)
Emotional expressions reconsidered: challenges to inferring emo-
tion from human facial movements. Psychol Sci Public Interest
20(1):1û68

Bender E, Hanna A (2025) The AI Con: How to Fight Big Tech's Hype
and Create the Future We Want. Penguin Random House.
Bender E, Koller A (2020) Climbing towards NLU: on meaning, form,
and understanding in the age of data. Proceedings of the 58th
Annual Meeting of the Association for Computational Linguistics,
pp. 5185û5198.

Bender E, McMillan-Major A, Schmitchell S, Gebru T (2021) On the
dangers of stochastic parrots: can language models be too big?.
Proceedings of the 2021 ACM Conference on Fairness, Account-
ability, and Transparency, pp. 610û623.

Birhane A (2021) The impossibility of automating ambiguity. Artif

Life 27(1):44û61

Bostrom N (2014) Superintelligence: paths, dangers, strategies. Oxford

University Press, Oxford, United Kingdom

Boyd  D  (2024)  The  structuring  work  of  algorithms.  Daedalus

152(1):236û240

Bradford A (2023) Digital Empires: The Global Battle to Regulate

Technology. Oxford: Oxford University Press.

Buolamwini J (2024) Unmasking AI: my mission to protect what is

human in a world of machines. Random House, London

Campolo A, Crawford K (2020) Enchanted determinism: power with-
out responsibility in artificial intelligence. Engag Sci Technol Soc
6(2020):1û19

Carr N (2025) Superbloom: how technologies of connection tear us

apart. Norton & Company, New York, N.Y.

Chayka K (2024) Filter World: How Algorithms Flattened Culture.

Penguin Random House: DoubleDay.

Christian B (2020) The alignment problem: machine learning and

human values. W.W. Norton & Company, New York, New York

Crawford K (2021) Atlas of AI: power, politics, and the planetary
costs of artificial intelligence. Yale University Press, New Haven,
Connecticut

Doctor T, Witkowski O, Solomonova E, Duana B, Levin M (2022)
æBiology, Buddhism, and AI: care as the driver of intelligence.
Entropy 24(5):710

Edelman J, Zhi-Xuan T, Lowe R, Klingefjord O etáal (2025) Full-stack
alignment: co-aligning AI and institutions with thick models of
value. https:// www. full- stack- align ment. ai/ paper

Ekman P, Friesen W (1978) Facial action coding system: a technique
for the measurement of facial movement. Consulting Psycholo-
gists Press, Palo Alto

Foster J (2023) From thin to thick: toward a politics of human-compat-

ible AI. Public Cult 35:3

Frischmann B, Selinger E (2018) Re-engineering humanity. Cambridge

University Press, Cambridge

Green BP (2019) Artificial intelligence, decision making, and moral
deskilling. markulla center for applied ethics, Santa Clara Uni-
versity: https:// www. scu. edu/ ethics/ focus- areas/ techn ology- ethics/
resou rces/ artifi cial- intel ligen ce- decis ion- making- and- moral- deski
lling/

Hao K (2025) Empire of AI: inside the reckless race for total domina-

tion. Penguin Random House, London, United Kingdom

Harrison D, Rorot W, Laukaityte U (2022) Mind the matter: active
matter, soft robotics, and the making of bio-inspired artificial
intelligence. Front Neurorobot. https:// doi. org/ 10. 3389/ fnbot.
2022. 880724/ full

Hubinger E, van Merwijk C, Mikulik V, Skalse J, Garrabrant S (2019)
Risks from learned optimisation in advanced machine learniing
systems. arXiv.org: https:// arxiv. org/ abs/ 1906. 01820

Kazienko P, Cambria E (2024) Toward responsible recommender sys-
tems. IEEE Intell Syst 39(3):5û12. https:// doi. org/ 10. 1109/ MIS.
2024. 33981 90

Klingefjord O, Lowe R, Edelman J (2024) What are human values, and
how do we align AI to them?. arXiv preprint arXiv: 2401. 12358.
Koch B, Denton E, Hanna A, Foster J (2021) Reduced, reused, and
recycled: the life of a dataset in a machine learning research. 35th
Conference on Neural Information Processing Systems, Sydney,
Australia. https:// arxiv. org/ abs/ 2112. 01716

Korte M (2020) The impact of the digital revolution on human brain
and  behavior:  where  do  we  stand?  Dialogues  Clin  Neurosci
22:101û111

Krakovna V (2018) Specification gaming examples in AI. Word Press:
https:// vkrak ovna. wordp ress. com/ 2018/ 04/ 02/ speci ficat ion- gam-
ing- examp les- in- ai/

Kulveit J, Douglas R, Ammann N, Turan D, Krueger D, Duvenaud, D
(2025) Gradual disempowerment: systemic existential risks from
incremental AI development. arXiv: https:// arxiv. org/ abs/ 2501.
16946

Lake BM, Ullman TD, Tenenbaum JB, Gershman SJ (2016) Build-
ing machines that learn and think like people. Behav Brain Sci
40:e253

Merry SE (2016) The seductions of quantification: measuring human
rights, gender violence, and sex trafficking. The University of Chi-
cago Press, Chicago, Illinois

MilliΦre R, Buckner C (2024) A Philosophical Introduction to Lan-
guage Models--Part I: Continuity With Classic Debates. arXiv:
https:// doi. org/ 10. 48550/ arXiv. 2401. 03910

MilliΦre R (2025) Normative conflicts and shallow alignment. Philos

Stud 182:2035û2078

Mitchell M (2020) Artificial intelligence: a guide for thinking humans.

Picador, New York, New York

AI & SOCIETY

Moore C, Gill C, Bliss N, Butler K, Forrest S, Lopresti D, Maher M,
Mentis H, Shekhar S,  Stent A, Turk M (2025) æConcerning the
Responsible Use of AI in the U.S. Criminal Justice SystemÆ. Com-
munications of the ACM, vol. 68(9):41û44.

Narayanan A, Kapoor S (2025) AI snake oil: what AI can do, what it
canÆt, and how to tell the difference. Princeton University Press,
Princeton, N.J.

Ngo R, Chan L, Mindermann S (2025) The alignment problem from a
deep learning perspective. arXiv: https:// arxiv. org/ abs/ 2209. 00626

Nguyen CT (2024) Value capture. J Ethics Soc Phil 27:469
Ott B (2023) The digital mind: how computers (re)structure human

consciousness. Philosophies 8:4

Pellegrino A, Stasi A (2024) A bibliometric analysis of the impact
of media manipulation on adolescent mental health: Policy rec-
ommendations for algorithmic transparency. Online J Commun
Media Technol 14(4):e202453

Penn J (2020) Inventing intelligence: on the history of complex infor-
mation processing and artificial intelligence in the united states
in the mid-twentieth century. ApolloùUniversity of Cambridge
Repository.

Tegmark M (2018) Life 3.0: being human in the age of artificial intel-

ligence. Penguin Books, London, United Kingdom

Turk V (2025) The Great Language Flattening. The Atlantic: https://
www. theat lantic. com/ techn ology/ archi ve/ 2025/ 04/ great- langu
age- flattening/682627/

Turkle S (2021) The Empathy Diaries. Penguin Publishing Group. New

York: New York.

Vallor S (2015) Moral deskilling and upskilling in a new machine age:
reflections on the ambiguous future of character. Philos Technol
28:107û124

Vicario MD, Vivaldo G, Bessi A, Zollo F, Scala A, Caldarelli G, Quat-
trociocchi W (2016) Echo chambers: emotional contagion and
group polarization on facebook. Sci Rep 6(1):37825

Warzel D (2025) AI Is A Mass Delusion Event. The Atlantic. https://
www. theat lantic. com/ techn ology/ archi ve/ 2025/ 08/ ai- mass- delus
ion- event/ 683909/

Winner L (1988) The whale and the reactor: a search for limits in
an age of high technology, 2nd edn. Chicago University Press,
Chicago, Illinois

Yudkowsky E, Soares N (2025) If Anyone Builds It, Everyone Dies.

Porter TM (2020) The Rise of Statistical Thinking: 1820û1900. Prince-

Little Brown Publishers. New York

ton University Press, Princeton, New Jersey

Raji ID, Bender EM, Paullada A, Denton E, Hanna A (2021) AI and
the everything in the whole wide world benchmark. arXiv:áhttps://
doi. org/ 10. 48550/ arXiv. 2111. 15366

Russel S (2019) Human compatible: Artificial Intelligence and the
problem of control. Penguin Publishing, New York, New York
Scott JC (1998) Seeing like a state: How certain schemes to improve
the human condition have failed. Yale University Press, New
Haven, Connecticut

Seth A (2025) Conscious artificial intelligence and biological natural-
ism. Behav Brain Sci. https:// doi. org/ 10. 1017/ S0140 525X2 50000
32

Strate L (2017) Media ecology: an approach to understanding the

human condition. Peter Lang, New York, N.Y.

Zhi-Xuan T, Caroll M, Franklin M, Ashton H (2024) Beyond pref-
erences in AIalignment. Philos Stud. https:// doi. org/ 10. 1007/
s11098- 024- 02249-w

Zuboff S (2019) Surveillance capitalism: the fight for a human future
at  the  new  frontier  of  power.  Public  Affairs,  London,  United
Kingdom

Publisher's  Note  Springer  Nature  remains  neutral  with  regard  to
jurisdictional claims in published maps and institutional affiliations.
