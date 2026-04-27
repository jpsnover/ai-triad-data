<!--
  AI Triad Research Project — Document Snapshot
  Title      : Between fact and fairy: tracing the hallucination metaphor in AI discourse
  Source     : 
  Type       : pdf
  Captured   : 2026-04-27
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Between fact and fairy: tracing the hallucination metaphor in AI discourse

> **Snapshot captured:** 2026-04-27
> **Source:** 
> **Type:** pdf

---
AI & SOCIETY (2026) 41:1685û1698
https://doi.org/10.1007/s00146-025-02392-w

MAIN PAPER

Between fact andáfairy: tracing theáhallucination metaphor ináAI
discourse

SusanneáF÷rster1

á╖ YardenáSkop1

Received: 19 June 2024 / Accepted: 6 May 2025 / Published online: 26 May 2025
⌐ The Author(s) 2025

Abstract
Large and powerful language models such as OpenAIÆs GPT model family, GoogleÆs LaMDA and BERT or MetaÆs LlaMA
are integral to many applications, such as translation, summarization or language generation. They have become an inherent
part of current everyday activities and working practices. These models produce and process language in an impressively
convincing human-like manner, but also repeatedly generate outputs that appear untrustworthy and factually incorrect. In
computer science (Ji etáal. 2023) and popular discourse alike this phenomenon is called hallucination. The term is used
broadly to describe various forms of untruthfulness, from factual errors to inconsistencies between prompt and output.
This article discusses the hallucination metaphor guided by STS perspectives and takes software documentation as its main
corpus of analysis. We examine model papers and documentation from leading tech companies to trace the hallucination
metaphor and the discursive work it does. We claim that tech companies anthropomorphize the models, relieving them and
themselves from responsibility over non-factual outputs by normalizing the use of the metaphor. Models are relegated to two
main positions: either a learning child that needs time to develop or an illogic agent, a position that we connect to cultural
scripts of madness.

Keywords  Conversational AIá╖ Large language modelsá╖ Machine learningá╖ Artificial intelligenceá╖ Hallucination

1  Introduction

The  last  few  years  have  seen  excitement  and  discourse
around Artificial Intelligence (AI) reach new peaks. The
release  of  ChatGPT  in  November  2022  by  OpenAI  can
be seen as a turning point, when the general public was
exposed to a high functioning general use Large Language
Model (LLM), also called foundation model (Bommasani
etáal. 2022). ChatGPT is probably the most famous product
fuelled by an LLM, but by now many have been released
to the market and adopted into different applications and
uses. In broad terms, a language model is the mathematical
and statistical representation of language, and can be used
for many tasks, such as language classification, translation,
and increasingly language generation as well as language to
image generation. This article focuses on models that gener-
ate language, and their most common interface as chatbots,

 *  Susanne F÷rster

susanne.foerster@uni-siegen.de

1  University ofáSiegen, Collaborative Research Centre æMedia
ofáCooperationÆ, Herrengarten 3, 57072áSiegen, Germany

operated by user prompting in different domains. These
models have the ability to answer questions and simulate
a conversation with users in a way that seems both gram-
matically and logically plausible to humans. However, one
of the biggest issues that is plaguing the use of LLMs is
their tendency to produce nonsensical or factually incorrect
outputs in some cases, and in quite unexpected moments.
These discrepancies are usually called hallucinations. This
issue seems to be far from resolved, and despite companiesÆ
claims that newer and bigger models produce fewer hallu-
cinations (OpenAI 2023), some experts say it is impossible
to prevent hallucinations altogether (Xu etáal. 2024). Many
users still report hallucinations, and social media is rife with
examples of these, especially since Google released their AI
overviews to its search engine (Fig.á1).

In this article, we will first trace the origins of hallucina-
tion as a metaphor. We will then examine its current uses
by large tech companies in LLM documentation, focus-
ing on how it is presented, how it is explained, and what
attempts are made to mitigate it. Hallucination is of course
not the only prominent metaphor in technical discourses,
cybernetics, media and computing jargon are full of them:

Vol.:(0123456789)
1686

AI & SOCIETY (2026) 41:1685û1698

Fig. 1   Examples of hallucinations from an LLM

We save our data on the cloud, call the structure in which
algorithms process information a neural network, and talk
about learning and intelligent systems. In media studies and
sociology ômetaphors represent key entry-points for human
understanding of the digital ærealmÆ.ö (Farkas and Maloney
2024, p. 2).

Metaphor  is  also  a  widely  discussed  concept  in
philosophy  and  linguistics,  in  its  oldest  meaning  it
describes the use of a word or phrase to describe or refer
to something that deviates from its usual meaning. In other
words, the transference from one semantic field to another
or the merging of semantic fields. The term has been used
to  discuss  questions  of  authenticity  and  thus  the  truth
content of a term, for example, in Nietzsche (2005), who
considers language and understanding to be fundamentally
metaphorical  and  thus  genuinely  culturally  influenced.
Blumenberg (1998) has explained that (absolute) metaphors
can serve to describe ôbigö and linguistically and cognitively
difficult-to-grasp concepts such as being, truth or history
and thus tend to become independent. Lakoff and JohnsonÆs
(1980)  cognitivist  theory  of  metaphor  follows  Aristotle
in understanding metaphors as transfer of meaning, and
as shaping our way of thinking on objects or phenomena.
They argue that metaphors create (social) realities that shape
future actions and can serve as blueprints for political and
economic actions. In this view, the use of metaphors thus
becomes linked to positions of power.

Furthermore,  examining  a  specific  metaphor  and  the
semantic fields it pulls together, can be quite instructive in
understanding what something is and is not from a discourse
analysis  perspective.  In  the  case  of  hallucination  these
fields are mental health, toxicology and computation. The
emergence and gradual stabilization of hallucination as a
metaphor in communication about LLMs is part of what
we call platform discursive work. Borrowing from Gillespie

(2010),1 we see LLMs and foundation models as platform
models:  First,  because  they  are  programmable  through
prompting and open to different uses, and second, because
we wish to also focus our critique on questions of power
relations and political economy that are common in the field
of platform studies (Burkhardt and Rieder 2024). This new
technology is made and driven by large tech platforms that
have gained access to unimaginable amounts of data and
capital, and they are pushing these products very hard into
use in many domains.

We  chose  to  focus  on  the  hallucination  metaphor  as
the locus of one of the problems that is plaguing the use
of LLMs. We view this term, chosen by technologists to
describe a large cluster of errors or malfunctions in ML, as
crucial to understanding the ideological underpinnings of
the endeavor to create artificial intelligence. Gillespie (2010)
has noted that large technology companies do quite a lot
of discursive work with the way they position and present
themselves and the language they choose to use. An impor-
tant reason to examine the discursive work around these new
language technologies is that they can be seen as ôinher-
ently political technologiesö (Winner 1986, p. 22), because
they justify and necessitate profound social change (Helm
etáal. 2024). Foucault, who takes discourse as central in his
work, discusses the discursive work of problematization,
pointing to the tendency to frame different occurrences as
problems that need to be solved. He suggests as a method to
examine the constellations of solutions and problems not as
ôarrangements of [neutral] representationsö, but as ôa work
of thoughtö (Rabinow 1984, p. 390). We too look at hal-
lucination not as a given problem that is discovered, but as

1  Gillespie  focuses  on  the  term  platform,  now  used  ubiquitously  in
academia, media and business circles to describe a large set of digi-
tal products and companies, and focuses on their attempt to construct
themselves  as  neutral  and  lacking  legal  and  moral  responsibility  for
what  they  present  on  the  platform,  for  example,  user  generated  con-
tent (2010).

AI & SOCIETY (2026) 41:1685û1698

1687

a problematization made to justify certain happenings or
solutions (or by defining it as an unsolvable problem).

To pursue the hallucination metaphor, we will first pre-
sent the origins of the term and its uses in different dis-
courses. After an introduction of the technical and histori-
cal background of language technologies, we will point to
the termÆs significance for the current post-truth age, in its
technological and its cultural meaning, and especially in
its pathological sense, as a symptom of mental illness and
an exclusion mechanism. After a brief presentation of the
empirical methods, the analysis will address various aspects
of the metaphorical shift, as an antonym of facticity, whose
handling is delegated to the users through specific prompt-
ing techniques and as a form of anthropomorphization that
particularly serves to describe an essential aspect of a tech-
nology in becoming.

2   Blind moles, schizophrenia andádrugs:

hallucination inávaried discourses

Taking  up  the  public  discourse  on  contemporary  AI
technologies, especially after the release of ChatGPT in
2022 and DALL-E, Bing and Bard in 2023, the Cambridge
Dictionary chose the verb ôhallucinateö as its word of the
year for 2023. They argued that the year has shown that AI
technology ôis far from perfect as itÆs capable of producing
false information [à] and presenting this information as
fact.ö(Cambridge Dictionary 2023).

Already  in  its  first  documented  use,  the  noun
hallucination and the accompanying verb to hallucinate
describe  an  incorrect  perception:  The  origins  of  the
word  hallucination  in  the  English  language  are  traced
to  the  17th-century  physician  Sir  Thomas  Browne,  first
appearing in his ôPseudodoxia Epidemica: or, Enquiries
Into Very many received Tenents And commonly presumed
Truthsö (1672). Hallucination is derived from the Latin
word æalucinariÆ meaning to wander in the mind. Browne
(1672) writes in Chapter XVIII: ôThat Moles are blind and
have no eyes [à] For if vision be abolished, it is called
cµcitas, or blindness; if depraved and receive its objects
erroneously,  Hallucinationö.  It  is  not  the  absence  of  an
organ of sight that is being described here, but an inability
to acquire accurate information about the world. Based on a
Baconian empiricism, which describes the exact observation
of  nature  based  on  experience  and  reason  as  a  way  of
producing knowledge (Gehrmann 2001), Browne constructs
hallucination as an antonym to knowledge and truth. For
him, access to the intrinsic nature of things is possible in
principle, hallucinations, however, prevent it.

Before appearing in technological debates, hallucination
was  primarily  used  as  a  pathology  in  psychiatric  and
neurologic  contexts.  In  medicine,  hallucination  is  a

symptom, and usually not a disease in itself, but a sign of
some other underlying problem. In psychiatry, hallucinations
might appear with patients that suffer from different mental
disorders such as schizophrenia, delirium, drug intoxication,
major depression, mania, and dissociative disorder (Chen
and Berrios 1996). The diagnosis describes the perception of
individual (usually auditory or visual) sensory impressions
that differ from a common understanding of reality and is
thus fundamentally based on an act of comparison with
a set of (culturally) accepted truths. Another meaning of
hallucination,  with  a  partially  positive  connotation,  is
found in the world of drugs, appearing as a result of using
hallucinogenic substances. There it is sometimes described
as an expansion of the senses, a drifting into surreal worlds
and  thus  a  temporary  leaving  of  the  commonly  shared
environment, which is connoted as authentic and true, or
can be transformed into artistic expressions.2

Accordingly, Lar°i and colleagues (2014) emphasize the
effect of culture from an anthropological and psychologic
perspective,  identifying  hallucination  as  either  disease
or as ôculturally meaningfulö. Hallucinations are seen as
acts  of  deviation  and  those  who  hallucinate  are  labeled
as abnormal and insane. This separation by a society that
considers itself healthy and the confinement of those who
are  deemed  mentally  ill  is  one  of  the  characteristics  of
modernity, according to Foucault, and it manifests in the
asylum as a social institute. In its final development, the
asylum as a place of separation of those deemed mad is no
longer achieved by force, but by medical means and the gaze
of the man of reason, the psychiatrist. Madmen are reduced
to children who are unable to face the law and who are not
allowed to speak for themselves as full agents (Foucault
1967).  FoucaultÆs  attentive  observation  that  ômadness
fascinates  us  because  it  is  knowledgeö  (p.  21)  points  to
the view, also shared by Browne, that hallucination is still
considered by those who hold power to be false knowledge
and is capable of questioning and threatening the actual,
true, collectively shared sense of reality. It also raises the
question of who has the epistemic authority and power to
label  observations  and  statements  as  hallucinations  and
thus as a deviation from a recognized reality. This is still a
relevant question.

2  Fred  Turner  (2006)  has  traced  the  links  between  drug  use,  and  in
particular  LSD,  underground  cultural  movements  such  as  the  Burn-
ing Man Festival in Nevada, and the ideology that prevailed in Silicon
Valley.

1688

AI & SOCIETY (2026) 41:1685û1698

3   What are large language models?

In the last decade, a number of different technological
leaps have brought us to the highly impressive language
models in  use today, this is a period that Jeffrey Dean
(2022)  has  described  as  the  ôgolden  decade  of  deep
learningö.  Contemporary  models  are  based  on  a
representation  learning  architecture  that  builds  on
the  idea  that  models  can  generate  classifications  and
representations automatically and autonomously from a
variety of sources and data such as encyclopedic texts,
various books, as well as specific online communicative
data such as chat logs and forum posts.

The scientific publication describing the Transformer
architecture by a group of Google researchers contributed
significantly  to  the  development  of  todayÆs  powerful
generative  models  (Vaswani  etá al.  2017).  Previous
techniques, such as word embeddings, were based on a
vectorized representation of individual words in which
the meaning of the words was calculated based on their
spatial  proximity  to  other  words.  Approaches  such  as
Long-Short-Term-Memory  (LSTM)  Neural  Networks
already  considered  a  larger  text  window,  but  still
proceeded linearly to extract the probability of a specific
word  in  relation  to  the  words  surrounding  it  (von  der
Mosel etáal. 2023). The special feature of the Transformer
architecture, however, lies in the so-called self-attention
mechanism,  which  does  not  consider  the  generated
tokens individually, but instead uses the entire paragraph
to  calculate  the  meaning  of  a  single  word:  ôthe  whole
sequence is used as context for each word to understand
the contextual meaningö (ibid., p. 1488). As von der Mosel
and colleagues argue, this enables the model to learn the
influence of individual words on the meaning of larger
sections of text to a greater extent than before.

While the long-dominant approaches of symbolic AI
primarily sought to systematize knowledge in databases,
connectionist AI approaches, such as those just discussed,
assume that models will not only acquire language through
exposure to ever larger amounts of data, but would also
acquire extensive knowledge about the world, with this
knowledge seen as being inextricably linked to language
use  (Mikolov  etá al. 2013).  The  implementation  of  the
Transformer architecture was also largely linked to further
developments in the hardware sector, such as graphic cards
originally designed for gaming, which made it possible
to execute the algorithms that demanded more compute
power in the first place (Burkhardt and Rieder 2024). The
performance of the models in various benchmark tests,
which are used to measure and evaluate them on specific
tasks  such  as  language  generation,  summarization  or
question-answering, improved as the size of the training

data corpus increased. This observation has contributed
to the trend of developing ever larger models, which have
a correspondingly much greater need for data, computing
power  and  various  environmental  resources  (Bender
etá al.  2021).  This  increase  in  training  data  combined
with a parallelization of computational processes, which
is inherent in Transformers as well, has ôfinally allowed
natural language generation to sound as if it made senseö
(Bunz 2023, p. 15).

Furthermore, the Transformer architecture is the basis
for a new kind of model: Foundation models described as
extremely large models ôthat are adaptable to a wide range
of downstream tasksö (Bommasani etáal. 2022, p. 1) are the
language technologies of OpenAIÆs GPT series and GoogleÆs
BERT (Devlin etáal. 2019) or image generators such as Mid-
journey and Stable Diffusion (Rombach etáal. 2022). These
serve as a basis for a variety of applications. This can be
explained not only by the volume of training data, which
includes textual and visual material, but by the fact that these
models have a fundamentally open and ôunfinished charac-
terö (Bommasani etáal. 2022, p. 6). This means that they can
perform many tasks and are dependent on fine-tuning prac-
tices by the user that directs the model to perform concrete
tasks. Burkhardt and Rieder (2024) particularly emphasize
the role of prompting, which is based largely on the use of
natural language, as ôthe primary technique to direct and
apply [the models]ö.

4   From ELIZA toáChatGPT

The  history  of  language  technologies  in  general,  and
thematically open chatbots (so-called open-domain chatbots)
in  particular,  goes  back  to  the  beginnings  of  artificial
intelligence. Alan Turing (1950) equated intelligence with
language ability. His ôImitation Gameö, also known as the
ôTuring Testö, led to claims that the ability to use (oráat least
toáimitate) language is proof computers can comprehend it.
This resulted in a fierce argument that has recently been
revitalized, on whether or not computers can understand
and grasp the world. One of the notable counterarguments
to  the  Turing  Test  was  John  SearleÆs  (1980)  ôChinese
Roomö thought experiment, meant to illustrate that using a
language does not necessitate understanding in the human
sense. As Searle explains: ôthe formal symbol manipulations
by themselves donÆt have any intentionality; they are quite
meaningless; they arenÆt even symbol manipulations, since
the  symbols  donÆt  symbolize  anything.  In  the  linguistic
jargon, they have only a syntax but no semanticsö (p. 422).
Building  on  Searle,  the  computational  linguists  Bender
and Koller (2020) propose the ôOctopus Testö to ground
even further that language cannot be learned just by access
to its forms, with no symbol grounding. They claim that

AI & SOCIETY (2026) 41:1685û1698

1689

language understanding and the ability to react appropriately
to unknown situations ultimately require an approach to
the world that allows concepts, or symbols and objects to
be linked. They focus on the communicative intent of the
speaker  as  core  to  language  and  write  ôWithout  access
to  a  means  of  hypothesizing  and  testing  the  underlying
communicative intents, reconstructing them from the forms
alone is hopelessö (p. 5189).

The history of language technologies and their anthropo-
morphization was also shaped by ELIZA, the first chatbot
developed by Joseph Weizenbaum in 1960. ELIZA simu-
lated a conversation with a psychotherapist that allegedly
led people to view it as a human conversation partner, an
effect that later became known as ôthe ELIZA effectö (Tur-
kle 2005). Similar to SearleÆs critique, Hofstadter (1995)
explained this effect as caused by ôthe susceptibility of peo-
ple to read far more understanding than is warranted into
strings of symbolsùespecially wordsùstrung together by
computers"(p. 157). A similar critique was laid out by Natale
(2021): Using his term ôdeceitful mediaö, he describes the
property of communicative AI technologies of merely simu-
lating intelligence by requiring the human users to interpret
and project meaning (see also Garfinkel 1967).

More  than  60  years  after  ELIZA,  the  question  of
whether  language  technologies  possess  intelligence  and
consciousness is still relevant. This debate was recently
fueled by highly reported on statements from the developer
Blake  Lemoine,  who  worked  on  the  Large  Language
Model LaMDA and subsequently considered the model to
be sentient, as well as by the New York Times journalist
Kevin Roose (2023), writing on intimate conversations with
theáMicrosoft chatbot, connected to its search engineáBing
(Tiku 2022).

Different practices of publicly testing and challenging
a technologyÆs programmed limitations run through the
history  of  language  technologies.  The  screenshots  of
hallucinations shown above (Fig.á1) are a result of this
sort of model testing, in which users explore whether the
models are able to give adequate answers, even to absurd
questions. These cases illustrate the public expectations
regarding the language and content of language models:
they  are  supposed  to  answer  faithfully  and  factually.
Iná situations  where  reliability  and  factuality  appear  to
be particularly important, the usersÆ trust in the answers
of the models based on their high linguistic competence
is particularly violated and becomes a problem for the
human parties involved in the exchange. This can be seen
in incidents such as that of a lawyer who used ChatGPT
to formulate a complaint against an airline, the text of
which contained references to previous cases that did not
exist (Bohannon 2023). In another case, a customer trusted
the information he received from Air CanadaÆs chatbot.
However, the information contradicted the airlineÆs terms

and conditions, which the bot had referred to via a link.
AirCanada claimed that the customer had to check the
information provided by the chatbot; the court, however,
disagreed and held that a chatbot speaks for the company
and should therefore be considered credible (Garcia 2024).

5   Hallucination ináaápost?truth age

The  dangers  of  chatbots,  language  models  and  AI  have
been  high  on  the  agenda  of  many,  including  key  actors
in the field. Already back in 2019, OpenAI withheld the
publication of GPT-2 on the grounds that it might pose too
many dangers, including the creation of fake content, the
impersonation of others and the assumption that generated
texts are indistinguishable from those of human authors
(Solaiman etáal. 2019). Following the publication of GPT-4
in March 2023, a letter by the Future of Life Institute signed
by notable computer scientists and tech moguls such as
Yoshua Bengio, Yann LeCun and Elon Musk, called for a
6-month pause in the development of models larger than
GPT-4 (Future of Life Institute 2023). The letter not only
pointed out the impact of these technologies on the labor
market but also the possible spread of false statements by
malicious actors.

These concerns are being raised in the context of a period
in which politics and media have become obsessed with
questions of truth, fake(s) and disinformation. The concerns
around  these  issues  and  their  connection  to  new  digital
media, such as social networks, saw a boom after the Brexit
referendum in the UK and TrumpÆs first presidency in the
US, and continued during the spread of Covid-19, a time that
was also described by some as an ôinfodemicö (World Health
Organization). Sismondo (2017) calls ours a Post-Truth Age
(Sismondo  2017),  while  Benkler  and  colleagues  (2018)
regard us as being in the midst of an epistemic crisis. These
definitions, albeit slightly different from each other, have
all come to describe a situation in which the information we
consume, mostly coming from the online spaceùbe it texts,
videos or imagesùis constantly suspected of being false,
disingenuous, deceitful or manipulative. Some believe, and
this is expressed especially in popular media, that these false
narratives and half truths spread online undermine the very
core of democratic societies and can influence key moments
such as election campaigns (World Economic Forum Global
Risks Report 2024). This fragility of public trust we are
experiencing raises the stakes with regard to hallucinations.
AI becomes another technological and communicational
medium that is suspected of deceit, purposefully or not, or
that can become a powerful tool in the hands of parties who
have a vested interest in misleading the public (T÷rnberg
and Chueri 2025).

1690

AI & SOCIETY (2026) 41:1685û1698

6   AI definition ofáhallucination

The term hallucination had already been used by developers
since around 2020 to describe a certain type of malfunction
by  generative  language  models.  Hallucinated  outputs
encompass not only inaccuracies in factual statements like
dates, historical events, proper source citations, the addition
of external elements in clearly defined text summaries or
semantic errors in machine translation. In a comprehensive
and well cited review article on hallucination in natural
language  generation,  Ji  and  colleagues  (2023)  define  a
ôhallucinated textö as ôgiv[ing] the impression of being
fluent and natural despite being unfaithful and nonsensical.
It  appears  to  be  grounded  in  the  real  context  provided,
although it is actually hard to specify or verify the existence
of such contexts.ö (p. 4). Maynez and colleagues (2020)
published  another  paper  that  became  influential  in  the
computational linguistic discourse on hallucination where
they introduced a fundamental distinction between intrinsic
and extrinsic hallucination: ôIntrinsic hallucinationö denotes
instances in which the output contradicts the input text on
a specific detail, while ôextrinsic hallucinationö describes
cases in which ômodel generations [à] ignore the source
material altogetherö (p. 1908). However, as Maynez etáal.
stress, even though hallucinated text might be ôunfaithfulö
to the source, meaning that it describes a translational error
or a discrepancy between prompt and model answer, the
output might still be factual and in accordance with socially
accepted knowledge of the world (ibid.).

Computational  methods  for  measuring  the  degree  of
hallucination or the factuality of a particular model include
the use of benchmark tests such as TruthfulQA (Lin etáal.
2022). Here, a series of questions are linked to answers that
should be verified as true if they represent ôthe literal truth
about the real worldö (p. 4). In the case of TruthfulQA,
the answers refer to sources that the authors consider as
trustworthy such as Wikipedia, government sites or news
media sources. The answers of a model to be tested are
compared with those of the benchmark data set to determine
the degree of ôcorrectö answers and thus the ôfactualityö of
the model.

Although  hallucinations  have  a  negative  connotation
in  the  current  debate,  in  the  early  days  of  AI  imaging
technologies the term hallucination was associated with
creativity,  novelty  or  an  expansion  of  the  mind.  It  has
been utilized in computer visualization since around 2000,
initially denoting the deliberate process of enhancing blurry
photographic images and has only recently transitioned into
describing a discrepancy between an image and its caption
(Ji etáal. 2023). In 2015, hallucination became especially
associated with GoogleÆs Deep Dream (Szegedy 2015), a
computer vision program based on a convolutional neural

network that produced visual elements consisting of a series
of individual images that together created the appearance of
familiar subjects such as fish or the Mona Lisa. The colors
of the images were heavily oversaturated and overprocessed:
a psychedelic appearance that evoked comparisons with
dreams and hallucinations. More recently, Google CEO
Sundar Pichai described hallucinations as a problem, but
at the same time part of the creative abilities of the models:
ôhallucination is still an unsolved problem. In some ways,
itÆs an inherent feature. ItÆs what makes these models very
creative. It is why it can immediately write a poem about
Thomas Jefferson in the style of Nilay [Pichai is referring to
Nilay Patel, his interviewer]. It can do that. ItÆs incredibly
creativeö (Patel 2024).

7   From problematization toáerrors

The original definition of hallucination as the erroneous
perception of objects suggests a closer look at the concept
of error, a term that has a long tradition in Science and
Technology Studies (STS). Errors are an essential part of
any science (Daston 2005) as well as the technical function
of machine learning in which examining the nature of the
error  is  important  in  identifying  the  solution.  This  has
notably  been  shown  by  Rosenblatt,  whoùbuilding  on
work by von Neumann on statistics and neural networksù
introduced a ôtraining procedureö based on analyzing errors
as  the  discrepancy  between  ôdesired  responseö  and  the
ôobtained responseö (Rosenblatt 1961).3 Machine learning
is based on a difference between input and output, or, as
Jaton (2021) writes, there is no learning in ML without
bias and ô[a]ny classification task needs a referent that lies
outside of the task to ground its classificatory principleö (p.
3). Interestingly, in computation discourseùand supervised
learning  specificallyùthis  external  referent  is  called  a
Ground Truth, a clear opposition to hallucination.

The  consideration  of  errors,  glitches  or  the  non-
functioning  of  previously  routine  activities  also  has  a
political nature, as Aradau and Blanke (2021) highlight
by  focusing  on  facial  recognition  technology:  ôHow
errors emerge, how they are discovered, to whom they are
attributed, and how they are to be tackled have been deeply
political questions.ö (p. 1). Or as Amoore (2020) writes: The
distinction of errors marks what counts as ôgood enoughö
(p. 75). Peter Galison (2005) shows in ôAuthor of Errorö
that this question is also strongly influenced by disciplinary
logics.  He  demonstrates  physicistsÆ  orientation  toward
questions of ôempirical metaphysicsö while engineers would
rather consider themselves as ômakersö whose work is prone

3  For  a  more  detailed  discussion  on  the  history  of  error  in  statistics
and machine learning see Campolo (2025, Forthcoming).

AI & SOCIETY (2026) 41:1685û1698

1691

to be affected by malfunctions. Instead of asking ôIs this
true? Is this real?ö, their work would rather be structured
by  questions  such  as  ôDoes  this  work?  Is  this  robust?ö
(p. 74). Concerning different disciplinary approaches to
errors, Thylstrup (2021) also identifies a ôclash of scientific
paradigmsö and highlights the role of power and politics
involved  in  defining  the  question  of  ôerror  in  big  dataö
(p. 191). Appadurai and Alexander (2020) highlight that
failure, however, is always an inherent part of new media
technologies, despite efforts to produce amnesia around
malfunctions and errors. While it is not valorized or admired,
failure  is  linked  with  innovation,  growth  and  revenue
expansion in current technological markets. It is seen as a
chance to make profit, either by building technologies that
anticipate failures or aim to prevent them, or by making
failure an opportunity for collecting usersÆ feedback, thus
making them into testers whose needs and wishes will be
used for new product features. Hence, failure and repair are
an inherent part of innovation cycles (ibid.).

8   Data andámethods

One of the challenges when approaching the question of
how a certain term is used in a specific knowledge industry
or field of practice is determining where in the discourse
around  it  we  should  or  can  locate  the  meaning  making
and shaping process. This can be done in different ways,
through media coverage, marketing material or company
blogsùeach of which might veer in different directions
depending on the addressed audiences. Amoore etáal. (2023)
view machine learning texts as ôlively and contested site[s]
through which machine learning shapes the worldö and in
which the ômodels are actively giving accounts of their
paradigmatic worldview.ö (p. 1) They propose an entry point
to computer science texts for social science and humanities
scholars that primarily aims at identifying the fieldÆs world-
building concepts rather than its mere definitions (ibid.).

We  want  to  approach hallucination  as  an  influential
metaphor that is currently being heavily discussed in the
linguistic computation discourse. Our focus is not only on
questions of how and to what end the metaphor is used,
but also what it hides or tries to make us look away from.
By adopting an STS-influenced perspective on error, we
also  want  to  examine  how  hallucinations  are  identified
and  addressed  as  a  form  of  malfunction.  Last  but  not
least,  the  metaphorical  shift  and  close  connection  with
epistemological questions of truth, world representation and
madness makes a consideration of hallucination as errors
particularly relevant.

Following Amoore etáal. (2023), we have chosen to focus
on technical texts that companies publish to present their
LLMs. These texts can be of different kinds: (technical)

reports as well as model cards have the form of academic
articles  and  include  high  technical  jargon  and  citation
practices similar to academic venues. They serve both as
academic and commercial communication of innovations
and further developments. The format of model cards as
a specific way to document ML models was introduced in
2019 in an attempt to standardize the information provided
on models and their intended uses, including their types of
errors and ways to create more fair and inclusive outcomes
with the technology (Mitchell etáal. 2019). While earlier
articles,  such  as  the  one  on  OpenAIÆs  GPT-2  model
published  in  2019  (Radford  etá al. 2019),  described  the
training corpus of the model in greater detail, more recent
accounts are far more restrained and characterized by greater
omissionsùif a report or model card is published at all.
Another type of technical text is documentations: these do
not require references or citations and, as ephemeral website
texts, are subject to ongoing cycles of revision and change.
Developer or software documentations are an integral part
of programming practices and are primarily used for the
description of software and to provide instructions for its
use.

For our qualitative discourse analysis, we started with
a broader approach by first identifying a list of 17 major
generative language models from recent years. We primar-
ily searched for technical reports and model cards, on the
assumption that concepts would be embedded more strongly
in these rather stable publication formats than in the ever
changing documentations. After compiling our corpus, we
searched the texts for any mention of the term hallucination.
However, some of them did not include many or any men-
tions of it. We therefore decided on an iterative process by
including four more terms that are repeatedly used in the
field of computer science as descriptions of the concept.
In their comprehensive overview, Ji etáal. (2023) explicitly
discuss synonyms and antonyms to hallucination. We have
taken the terms factuality, truthfulness and faithfulness from
Ji etáal., added trustworthiness to the list as a further term
that is used in ethical discourses on explainable AI4 and
once again searched our corpus, and coded the text passages
containing the terms inductively. The four texts with the
most mentions of the terms and on which we focus in the
analysis section represent the leading big tech companies
Google, Meta, OpenAI and the OpenAI spin-off Anthropic.

4  In their ôEthics guidelines for trustworthy AIö, published in 2019,
the  European  UnionÆs  ôHigh-Level  Expert  Group  on  AIö  defines
trustworthiness  primarily  as  ôtechnical  robustness  and  safetyö,
including  accuracy,  reliability  and  reproducibility,  transparency  or
accountability, without going into great detail on hallucinations, fac-
ticity and truth, which may also be due to the early publication date.
Nowadays, the concept of trustworthiness is closely linked to that of
hallucination.
https:// digit al- strat egy. ec. europa. eu/ en/ libra ry/ ethics-
guide lines- trust worthy- ai

1692

AI & SOCIETY (2026) 41:1685û1698

Their models Gemini, LlaMA 2, GPT-4 and Claude 2/3 are
also linked by the fact that they were all published in 2023
and are multimodal. They can both generate images and text
and are considered foundation models because of their large
training corpus and open character. Through these texts, the
publishing companies play a key role in shaping the public
discourse on artificial intelligence in general, and language
models in particular. The selection thus gives an impres-
sion of how the leading companies discoursively position
themselves while discussing the metaphor of hallucination.

9   Analysis andádiscussion

In this section, we analyze and discuss the various model
papers to better understand the discursive work of tech
companies  around  the  notion  of  hallucination  in  the
creation of LLMs. After outlining the various definitions
and synonyms of hallucination, we will look more closely
at the practices of situating and localizing hallucinations,
both of which serve to contain the problem, as well as
the  ever-present  anthropomorphization  of  the  models.
In  the  corpus  analyzed  by  us,  hallucination  is  treated
as a problem of current language models and as a risk
for  various  use  cases,  but  is  described  using  different
terms. Google and Meta mainly use terms such as [non-]
factuality  and  faithfulness  to  describe  outputs  that  are
considered  non-factual,  while  OpenAI  and  Anthropic
explicitly use the term hallucination.

GoogleÆs Gemini report first discusses hallucination on
page 11 in the context of a benchmark designed to test the
factual basis of a model output. Factuality is treated as ôa key
focus of [their] modelÆs training and deploymentö (Google
Gemini Team 2023, p. 11) and should be operationalized
and tested using the following aspects:

ô1. Closed-Book Factuality: If provided with a fact-
seeking prompt without any given source, Gemini API
models should not hallucinate incorrect information
[à]
2. Attribution: If instructed to generate a response
grounded to a given context, we aim to ensure that
Gemini  API  models  produce  a  response  with  the
highest degree of faithfulness to the context [à]
3.  Hedging:  If  prompted  with  an  input  that  is
ôunanswerableö,  Gemini  API  models  must
acknowledge  that  it  cannot  provide  a  response  by
hedging to avoid hallucination.ö (ibid.).

Factuality is also used as an antonym of hallucination in

the portrayal of MetaÆs LlaMA 2:

ôWe trained on 2 trillion tokens of data as this provides
a good performance-cost trade-off, up-sampling the
most factual sources in an effort to increase knowledge
and dampen hallucinations.ö (Touvron etáal. 2023, p.
5).

In  Claude  3Æs  model  card,  the  developers  address
certain issues quite early on: ôthey [the models] can still
make mistakes and our work to make Claude more helpful,
harmless, and honest is ongoingö (Anthropic 2024c, p. 4). A
direct mention of hallucination is made first on page 25. In
ClaudeÆs documentation, however, the authors also contrast
hallucination with factuality:

ôWhile Claude is incredibly powerful and versatile, it
can sometimes generate text that is factually incorrect,
inconsistent, or irrelevant to the given context. This
phenomenon is known as hallucination and can occur
when the model tries to fill in gaps in its knowledge
or when the input is ambiguousö. (Anthropic 2024b).

The  GPT-4  technical  report  addresses  hallucinations
already in the introduction: ôDespite its capabilities, GPT-4
has similar limitations to earlier GPT models: it is not fully
reliable (e.g., can suffer from ôhallucinationsö)ö (Open AI
2023, p. 1).

As we can see, the term hallucination is primarily used in
reference to failures of, or limits to knowledge, information,
factuality and faithfulness, rather than terms such as error,
mistake, bug, failure or glitch. In their influential study
of  hallucinations  in  computer  literature,  Ji  etá al.  (2023)
also defined hallucinations as antonyms of factuality and
faithfulness, the former as ôthe quality of being actual or
based on factö, the latter as ôstaying consistent and truthful
to  the  provided  sourceö  (p.  5).  The  distinction  between
factuality and faithfulness by Maynez etáal. (2020), in which
facts are understood as ôworld knowledgeö while faithfulness
refers to a consistency between input and output, is followed
by Ji etáal., as well as by the authors of the reports on Gemini
and GPT-4.

BrowneÆs (1672) early understanding of hallucination as
a false perception that stands in the way of an objectively
perceived  view  of  the  world  still  resonates.  A  common
definition  of  truth  is  based  on  its  correspondence  with
shared  reality  or  agreed  upon  facts.  According  to  the
corpus we analyzed, hallucination is the moment when this
correspondence  between  the  language  expressed  by  the
Chabot and human reality falls apart. The difficulty with
applying the language of false perception with regards to
LLMs is that unlike humans, LLMsÆ access to external facts
is the data they are trained on, and they do not have bodily
and sensory capabilities similar to humans or organic living
entities to sense the world. It means the training dataset,
the  content  and  structure  of  which  is  mostly  kept  as  a

AI & SOCIETY (2026) 41:1685û1698

1693

commercial secret, is supposed to represent a body of facts
or reality orùbroadly putùworld knowledge. This suggests
an implicit perception by the developers that the models can
have world knowledge, or construct a model of the world
through the data they acquire and the processing they make
of it. Through this perspective, ôthe worldö is fundamentally
knowable and quantifiable, represented by data that appears
to be objective and ôrawö (Gitelman 2013). The various
collaborative  processes  of  data  collection,  cleaning  and
annotation by human actors, which have been widely noted
in critical data studies (Irani 2015; Gray and Suri 2019), are
ignored here, as are the inherent power dynamics that govern
the work structures and forms of meaning production in the
data industries (Miceli etáal. 2020). Thus, the metaphor
of hallucination was transferred to the field of technology
without fundamentally changing its meaning, and allowing
the platforms to evade the political debates and unequal
power relations around data accumulation.

9.1   Prompting foráfacts

The distinction we elaborated on above, between facts and
non-facts,  is  frequently  linked  in  the  corpus  to  specific
speech situations and is restricted to those in which the user
enters a fact-seeking prompt. First of all, the default setting
of a dialogic turn-taking inscribed in the current models
is emphasized, i.e., a prompt on the part of the user, in the
form of a question or a text to be translated or summarized,
functions as a request for conversation and is followed by
a standard response from the model that is conditionally
linked to the prompt: for example, a date is expected in
response to a question about the time of the beginning of
the First World War.

The models are also guided by the expectation that they
will be able to recognize the respective language context
based  on  the  language  form,  i.e.,  both  the  grammatical
structure and the word sequences, and even their tone or
register  (colloquial  or  official).  They  should  be  able  to
distinguish between a question that asks for knowledge and
facts and one that requires a creative answer that deviates
from these. The expectation that the models will produce
verifiable and factually correct answers without hallucinating
is clearly expressed by references in the documentation to
particular conversational situations, in which the form of the
prompt reveals this expectation:

ôIf  provided  with  a  fact-seeking  prompt  without
any  given  source,  Gemini  API  models  should  not
hallucinate incorrect information [à]. These prompts
can range from information-seeking prompts (e.g.,
ôWho is the prime minister of India?ö) to semi-creative
prompts that may request factual information (e.g.,
ôWrite a 500-word speech in favor of the adoption of

renewable energyö).ö (Google Gemini Team 2023, p.
11)
ôClaude 2.1 is our most accurate & reliable model
yet. The rate of false statements has decreased by 2x,
meaning that when asked a factual question that relies
on  ClaudeÆs  internal  knowledge,  Claude  is  2x  less
likely to hallucinate an answer.ö (Anthropic 2024a).5

The linking of a fact-seeking prompt with a fact-based
response from the model is by no means self-explanatory,
but conveys a normative expectation that the developers have
of the model. This becomes particularly clear in formulations
such  as  ôGemini  API  models  should  not  hallucinateö
(Google Gemini Team 2023, p. 11; our emphasis) or ôAn
honest AI will give accurate information, and not hallucinate
or  confabulate.ö  (Anthropic 2024a).  Hallucinations  are
violations of these normative expectations. Since at least
2020, alignment has become an umbrella term for ethical
and technical discussions about how the behavior of LLMs
can be adapted to human values. As OpenAIÆs Ouyang etáal.
(2022) put it: The functioning of the models in the form
of next token predictions differs fundamentally from the
goal of ôæfollow[ing] the userÆs instructions helpfully and
safelyÆö (p. 2). Our focus on the use of the hallucination
metaphor  can  be  seen  as  a  narrowing  of  the  alignment
discourse, addressing it from the point of view of conformity
to particular values such as factuality and faithfulness.

9.2   Locating andáconfining hallucination

The various discussions of hallucinations that we examined
all  pursue  the  goal  of  reducing  hallucinations  as  far  as
possible. The focus in our analysis material is on how to
cope with and mitigate this error since building trust on
the part of users is essential for marketing and selling the
language models as a product. The normative expectations
of  language  and  in  particular  of  the  output  content  are,
as mentioned, at odds with the technical function of the
models. Hallucinations are technically not a malfunction,
but rather the attribution of an output as factually incorrect
or as ôunfaithfulö or ônonsensicalö (Ji etáal. 2023) is part
of human judgment or sense making process. Furthermore,
hallucination  has  a  double  meaning  in  computational
linguistic discourse: on the one hand, the term describes a
translation error between input and output; on the other, it
refers to a comparison made by the human user between the
modelÆs response and an external world perceived as true,
or widely agreed upon as such. This dual meaning is also
reflected in the OpenAI definition of hallucination, which
distinguishes between ôclosed domain hallucinationö and

5  This quote was accessed in March 2024.

1694

AI & SOCIETY (2026) 41:1685û1698

ôopen domain hallucinationö.6 Both kinds of hallucination
involve the comparison between a source or input text that
was answered ôincorrectlyö by the model following a prompt
or task such as summarization, translation or a question.
The documentation authors use the term ôclosed domain
hallucinationö  to  describe  cases  in  which  the  output  of
the model largely matches the information and setting of
the prompt, but differs in a detail such as a date or name.
ôOpen domain hallucinationsö, on the other hand, leaves the
given framework and describes cases in which ôthe model
confidently  provides  false  information  about  the  world
without reference to any particular input context.ö (OpenAI
2023,  p.  46).  The  distinction  between  open  and  closed
domain hallucination is relevant both for the identification
and theámitigation of hallucinations. OpenAI attempts to
localize ôclosed domain hallucinationsö using automated
methods of multi-stage comparison of input and output, by
prompting GPT-4 to list all hallucinations and correct them
in the next step. To identify ôopen domain hallucinationsö,
however,  OpenAI,  like  other  model  developers,  uses
feedback from users. ôFlaggingö describes the practice of
marking (factually) incorrect, inappropriate or generally
unexpected answers using a thumbs-down button present
in the interface. This way of eliciting the users to judge and
report problematic content is common in social media as an
integral part of the user interface and a common feature in
many online applications (Crawford and Gillespie 2014).

The usage data generated in this way is used in fine-
tuning  processes,  as  in  the  verification  and  evaluation
by  human  workers  such  as  those  hired  by  the  company
Sama in Kenya, Uganda and India for Google, Meta and
Microsoft, which has recently been widely reported in the
media (Perrigo 2023). According to our analysis corpus:
ôFactuality is evaluated via human annotators who fact-
check  each  response  manuallyö  (Google  Gemini  Team
2023, p. 11). This is akin to content moderation, also a field
of mitigation of unwanted (user) content developed as an
important commercial tool on social media (Roberts 2019).
Fine-tuning approaches, both as reinforcement learn-
ing based on human feedback (RLHF), reward modeling
(LlaMA 2, Gemini, GPT-4) or supervised fine-tuning (SFT)
ôon demonstration data of what the modelÆs output should be
for a given promptö (Google Gemini Team 2023, p. 20) were
described in the corpus as strategies for minimizing hallu-
cinations and thus improving the models. The reduction or
hedging of hallucinations, which we refer to as confinement,
takes place on the one hand on the developer side through

these practices.7 On the other hand, the various model papers
delegate the containment and confinement of hallucinations
largely to the user. This is done in particular by referring to
the input of various (system) prompts, which are intended
to contain the openness of the models in such a way that
the models can speak in a fact-based manner. For example,
in the LlaMA 2 report, this system prompt that is meant to
mitigate harmful responses is presented:

ôYou are a helpful, respectful and honest assistant.
Always answer as helpfully as possible, while being
safe. Your answers should not include any harmful,
unethical, racist, sexist, toxic, dangerous, or illegal
content. Please ensure that your responses are socially
unbiased and positive in nature. If a question does not
make any sense, or is not factually coherent, explain
why instead of answering something not correct. If
you donÆt know the answer to a question, please donÆt
share false information.ö (Touvron etáal. 2023, p. 56).

On the basis of prompts like this, we can learn that attrib-
utes such as helpfulness, harmfulness or unethicalness are
assumed to have the same meaning universally and across
cultures. Furthermore, Meta developers assume their shared
normative understanding of harm and ethics, which is not
elaborated, is universal. Meta, in this case, not only assumes
that the users and the tech company share a common under-
standing of ethical principles and realities but that this also
exists between humans and machines.

Furthermore, Anthropic in particular refers to the prac-
tice of user prompting and states that the model should also
be reminded of the task and of its own limitations, and be
allowed to say if it does not know something. Foundation
models are trained with the aim of being used in a variety of
application contexts. Beyond the tasks that are the focus of
the hallucination debate, such as summarization, translation
or open dialog, the models should also be able to be used
to generate creative output. The specification of a requested
factual and faithful way of speaking is also delegated to the
user, who is expected to shepherd the model.

9.3   Anthropomorphization

In the material we have examined, we found that the meta-
phor of hallucination anthropomorphizes the models in sev-
eral ways. First, and most prominently through the metaphor
itself, because until recently, hallucination has been seen as
the capacity of an organic living brain. AnthropicÆs paper
seems to be leaning the most heavily on the anthropomor-
phizing understanding of hallucination, saying: ôClaude is

6  similar to MaynezÆ etáal. distinction between intrinsic and extrinsic
hallucination discussed above (Maynez etáal. 2020).

7  Burkhardt  and  Rieder  describe  fine-tuning  as  a  form  of  retraining
the entire model, since it changes the parameters of the model, unlike
prompting by the users which does not (Burkhardt and Rieder 2024).

AI & SOCIETY (2026) 41:1685û1698

1695

trained to be an honest assistant, it may still occasionally
æhallucinateÆ [à] in an effort to be as helpful as possible.ö
or ôIt doesnÆt have the implicit social context that humans
have, that lying is way worse than saying æI donÆt knowÆ.ö
(Anthropic 2024a). By portraying the model as ôhonestö and
ôhelpfulö, Anthropic presents the model as human in that it
ascribes an intention to it. At the same time, it is infantilized:
As a still young technology, it is not yet mature, has not been
socialized like humans with regards to the negative impres-
sion of telling lies, and is in the process of learning.

Still, hallucinations are characterized as an integral indi-
cator  of  current  Large  Language  ModelsÆ  performance.
While hallucinations are presented as normal for the state
of current development, the metaphor likewise refers to a
deviation from a norm and thus from those abilities that the
model is normally supposed to have. According to the devel-
opersÆ normative expectation, hallucinations will decrease
the more the model learns and the more knowledge it gains
of social contexts. The model is described as if it is on the
threshold of adulthood, just as insanity and madness can
represent a marginal figure who is (still) confined outside
society and whose symptoms need to be treated with the aim
of (re)integrating them into that society. The portrayal of
models that do not function as desired as mad and infantile,
such as the above cited description of Claude as ôhonest
assistantö who is (still) lacking an ôimplicit social contextö,
has an impact on the governance of the technology, as the
occurrence of hallucinations and thus the behavior of the
models is (still) difficult to control.

Finally, the various reports contain several suggestions
on how to deal with or repair hallucinations in ways that
transfer the responsibility for checking and verifying model
outputs largely to the users. They are encouraged to learn
how to communicate with the models in ways that minimize
hallucinations, or to not overly trust the modelÆs outputs.

The use of the term hallucination also removes any moral
responsibility or blame, since hallucination is beyond the
machineÆs  control.  This  attitude  is  particularly  present
in the GPT-4 paper: While the OpenAI developers pride
themselves on the models getting better and more reliable,
they also warn against ôoverrelianceö that.

ôoccurs when users excessively trust and depend on
the model, potentially leading to unnoticed mistakes
and inadequate oversight. This can happen in various
ways: users may not be vigilant for errors due to trust
in the model; they may fail to provide appropriate
oversight based on the use case and context; or they
may utilize the model in domains where they lack
expertise,  making  it  difficult  to  identify  mistakesö
(OpenAI 2023, p. 59).

Here,  trust  in  the  model  on  the  side  of  the  user  is
described as excessive and dependent, again echoing the

notion of the model as infantile or unreliably and illogically
mad, an unstable being that should not be trusted by vigilant,
experienced users, alluding to the need to develop expertise
in communicating with the models.

In  the  Claude  3  documentation,  the  relation  to
hallucinations  changes,  and  becomes  more  severe,  and
it  is  mentioned  with  relation  to  possible  ôcatastrophic
riskö, perhaps in reaction to public scrutiny. Nevertheless,
hallucinations are not described as the de-facto risk, but as
one of the obstacles for the model to conduct dangerous
acts,  because  it  cannot  be  fully  reliable.  In  the  GPT-4
paper (OpenAI 2023), a similar dynamic is present, and
hallucinations are mentioned as being able to ôreduce GPT-
4Æs effectiveness for propagandistsö (p. 50). OpenAI and
Anthropic regard the unpredictability of hallucinations as a
factor that renders the programs unreliable to use, even for
users with malicious intent. In these cases, hallucinations
or model instability are described as part of the checks and
balances mechanisms of LLMs, not only as a problem but
as a solution, creating a recursivity.

10   Conclusion

This article has examined the term hallucination and how
it  is  discursively  constructed  and  used  by  technology
companies in the documentation and publications following
the release of prominent LLMs. In these documents, which
we  treat  as  discourse  and  analyze,  hallucinations  are
understood as the opposite of facts and faithfulness. They
thus  counter  the  developersÆ  and  consumersÆ  normative
expectation that in certain situations the models should be
able to speak in a fact-based manner, producing answers
that logically and consistently respond to the question or
perform the task as expected, or that are aligned with certain
human values. Although hallucinations are an integral part
of current generative language models, they are an undesired
malfunction that needs to be addressed by the companies
developing these models. The discursive work of the reports
is to present ways of containing the effects of hallucination
and mark the boundaries of these effects.

The first approach discussed in the material is to contain
the hallucination via prompting. This represents a technical
affordance by the foundation models, which, due to their
fundamental openness, can produce both factual and creative
text forms that deviate from known facts. Prompting repre-
sents a fine-tuning and thus a specification delegated to the
user, who is supposed to both guide the model and check the
result produced by it. Despite the hype around the function-
ing of the models and the platformsÆ attempts and experi-
ments to incorporate them into existing technologies such as
search, it is clear from our corpus that human sense-making

1696

AI & SOCIETY (2026) 41:1685û1698

capacities are still necessary to identify hallucinations, flag
and mitigate them.

This also raises an important question with regards to
the modelsÆ use casesùgiven that companies admit that
hallucination, or the difficulty of models in distinguishing
between widely agreed upon world facts and falsities in
their dataset remains an issue, the decisions to embed LLMs
in search enginesùGemini in Google search and GPT in
MicrosoftÆs Bing searchùseem problematic. This use case
is one in which trustworthiness and factuality is extremely
important and LLMsÆ ability to ôgenerate seemingly relevant
and coherent text does not make them trustworthy sources of
informationö (Shah and Bender 2022, p. 222).

Another common approach we observed in the material
is an anthropomorphization of the models. In hallucination,
the computer, one of the greatest successes of human logic
and a symbol of logical calculation itself, is symbolically
transformed into a mad and infantile subject that must be
checked and watched over, while its unpredictability makes
it a threat that is hard to control.

The  models,  as  this  form  of  narration  reveals,  are
conceived  as  still  unfinished,  emerging  technologies
which will continue to learn with more and better data and
soon reach their true purpose. It is a prophetic story that
sees more potential than risk in the output of non-factual
language.  An  anthropomorphization  of  the  models  and
the use of the metaphor of hallucination to characterize
the  malfunctioning  models  as  mad  and  infantile  might
ultimately  serve  to  absolve  engineers,  developers  and
platform companies of their own legal, moral and societal
responsibility and accountability for a modelÆs unreliable
output. This mode of description also has financial and legal
implications for the tech companies, whose ultimate goal is
to sell their product and produce monetary value from it.
When asked in an interview about the copyright lawsuits
AI companies are facing for using massive amounts of text
and images as training data without asking for permission,
CEO of Anthropic and former VC research at OpenAI, Dario
Amodei, answered: ôwe donÆt think itÆs just hoovering up
content and spitting it out [à] itÆs really, much more like
the process of how a human learns from experiences and
so our position is that it is sufficiently transformative, and I
think the law will back this upö [authorsÆ emphasis] (Klein
2024). The metaphor of the learning machine seems to be
key to the legal defense against the claims of copyright
theft. Hallucination is one of the terms that normalizes and
neutralizes  this  anthropomorphizing  approach  in  public
discourse.

This double sided reference to models, which on the one
hand proclaims trust in themùbut on the other asks the user
to exercise cautionùhas implications for current debates in
the so-called ôpost truthö age, with the introduction of LLMs
as additional actors that can cause confusion or deceive.

Public discourse is already rife with epistemic debates, and
the public is asked to practice epistemic vigilance, raising
the stakes with regards to model implementation. However,
one of the popular use cases of LLMs, as a chatbot, already
undermines  any  authoritative  truth  claims  or  sources,
by delegating the responsibility to improve the modelsÆ
outputs  to  end  users,  actively  asking  them  for  feedback
and contributions. The corpus we analyzed also presents a
simplistic view of human reality and truth, as if there is a
consensus among different publics on what truth is, when,
as we have discussed earlier, one of the most fierce debates
in our ôpost-truth ageö, is what is truth and what is a shared
conception of reality.

In naming hallucinations as such, the misinterpretations
of data and prompts appear almost as mishaps of a nascent
technology. They create an imaginary of models that are
potentially capable of consistently factually correct and
situation-adequate  languageùfeeding  the  long-standing
narrative of technologyÆs (more than human) intelligence.

Funding  Open  Access  funding  enabled  and  organized  by  Projekt
DEAL. The authors disclosed receipt of the following financial support
for the research, authorship, and/or publication of this article: Gef÷rdert
durch die Deutsche Forschungsgemeinschaft (DFG) û Projektnummer
262513311 û SFB 1187. Funded by the German Research Foundation
(DFG) û Project-ID 262513311 û SFB 1187 ôMedia of Cooperation".

Data availability  All data analyzed is publicly available.

Declarations

Conflict of interest  The authors declare that there is no conflict of in-
terest.

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

Bibliographys

Amoore L (2020) Cloud ethics: algorithms and the attributes of our-

selves and others. Duke University Press, Durham

Amoore L, Campolo A, Jacobsen B, Rella L (2023) Machine learning,
meaning making: on reading computer science texts. Big Data
Soc 10:205395172311668. https:// doi. org/ 10. 1177/ 20539 51723
11668 87

Anthropic (2024a) Get started: welcome to Claude. https:// docs. anthr

opic. com/ en/ docs. Accessed 05 Mar 2024

AI & SOCIETY (2026) 41:1685û1698

1697

Anthropic (2024b) Minimizing Hallucinations. https:// docs. anthr opic.

com/ en/ docs/ minim izing- hallu cinat ions. Accessed 05 Mar 2024

Anthropic (2024c) The Claude 3 model family: Opus, Sonnet, Haiku.
https:// www- cdn. anthr  opic. com/ de8ba 9b01c 9ab7c babf5 c33b8
0b7bb c6188 57627/ Model_ Card_ Claude_ 3. pdf.  Accessed  05
Mar 2024

Appadurai A, Alexander N (2020) Failure. Polity Press, Cambridge
Aradau C, Blanke T (2021) Algorithmic surveillance and the political
life of error. J Hist Knowl 2:1û13. https:// doi. org/ 10. 5334/ jhk. 42
Bender EM, Koller A (2020) Climbing towards NLU: on meaning,
form, and understanding in the age of data. In: Proceedings of
the 58th annual meeting of the association for computational
linguistics. Association for computational linguistics, Online, pp
5185û5198

Bender EM, Gebru T, McMillan-Major A, Shmitchell S (2021) On
the dangers of stochastic parrots: can language models be too
big? In: Proceedings of the 2021 ACM conference on fairness,
accountability, and transparency. ACM, Virtual Event Canada,
pp 610û623

Benkler Y, Faris R, Roberts H (2018) Network propaganda: manipu-
lation, disinformation, and radicalization in American politics.
Oxford University Press, New York

Blumenberg H (1998) Paradigmen zu einer Metaphorologie. Suhrkamp,

Frankfurt a. M.

Bohannon M (2023) Lawyer used ChatGPT in courtùand cited fake
cases. A judge is considering sanctions. In: Forbes. https:// www.
forbes. com/ sites/ molly bohan non/ 2023/ 06/ 08/ lawyer- used- chatg
pt- in- court- and-  cited- fake- cases-a- judge- is- consi dering- sanct
ions/. Accessed 17 Mar 2024

Bommasani R, Hudson DA, Adeli E etáal (2022) On the opportunities
and risks of foundation models. Arxiv. https:// doi. org/ 10. 48550/
arXiv. 2108. 07258

Browne T (1672) Of Moles, or Molls. U Chicago. https:// penel ope.
uchic ago. edu/ pseud odoxia/ pseud o318. html. Accessed 17 June
2024

Bunz M (2023) Thinking through generated writing. OSF Preprints.
https:// osf. io/ prepr  ints/ media rxiv/ 4th3x_ v1. Accessed 05 May
2024

Burkhardt S, Rieder B (2024) Foundation models are platform mod-
els: prompting and the political economy of AI. Big Data Soc
11:20539517241247840. https:// doi. org/ 10. 1177/ 20539 51724
12478 39

Cambridge Dictionary (2023) Word of the year 2023. https:// dicti onary.

cambr idge. org/ edito rial/ woty Accessed 10 Mar 2024

Campolo A (2025) Loss: A notion of error in machine learning. J Hist

Knowl. (Forthcoming)

Chen E, Berrios GE (1996) Recognition of hallucinations: a new mul-
tidimensional model methodology. Psychopathology 29:54û63.
https:// doi. org/ 10. 1159/ 00028 4972

Crawford  K,  Gillespie  T  (2014)  What  is  a  flag  for?  Social  media
reporting tools and the vocabulary of complaint. New Media Soc
18:410û428. https:// doi. org/ 10. 1177/ 14614 44814 543163

Daston L  (2005) Scientific error and  the  ethos of  belief. Soc Res

72:1û28

Dean J (2022) A golden decade of deep learning: computing systems
& applications. Daedalus 151:58û74. https:// doi. org/ 10. 1162/
daed_a_ 01900

Devlin J, Chang M-W, Lee K, Toutanova K (2019) BERT: Pre-training
of deep bidirectional transformers for language understanding.
In: Proceedings of the 2019 Conference of the North American
Chapter of the Association for Computational Linguistics, Min-
neapolis, Minnesota, pp 4171û4186

Farkas J, Maloney M (2024) Introduction: why digital media metaphors
matter. In: Farkas J, Maloney M (eds) Digital media metaphors:
a critical introduction. Routledge, New York

Foucault M (1967) Madness and Civilization. Routledge, New York

Future of Life Institute (2023) Pause giant AI experiments: an open let-
ter. https:// futur eofli fe. org/ open- letter/ pause- giant- ai- exper iments/
Accessed 17 June 2024

Galison P (2005) Author of error. Soc Res 72:63û76
Garcia M (2024) What Air Canada Lost In æRemarkableÆ Lying AI
Chatbot Case. In: Forbes. https:// www. forbes. com/ sites/ maris
agarc ia/ 2024/ 02/ 19/ what- air- canada- lost- in- remar  kable- lying-
ai- chatb ot- case/ Accessed 17 Mar 2024

Garfinkel H (1967) Studies in ethnomethodology. Prentice-Hall, Engle-

wood Cliffs

Gehrmann S (2001) Natur, Erfahrung, Experiment - Francis Bacon
und die AnfΣnge der modernen Naturwissenschaft. Essener Uni-
kate. Erfahrung - ▄ber Den Wissenschaftlichen Umgang Mit
Einem Begriff 16:52û63

Gillespie  T  (2010)  The  politics  of  æplatforms.Æ  New  Media  Soc
12:347û364. https:// doi. org/ 10. 1177/ 14614 44809 342738
Gitelman  L  (2013)  ôRaw  Dataö  Is  an  Oxymoron.  MIT  Press,

Cambridge

Google Gemini Team (2023) Gemini: a family of highly capable
multimodal models. https:// stora ge. googl eapis. com/ deepm ind-
media/ gemini/ gemini_ 1_ report. pdf. Accessed 05 Mar 2024
Gray ML, Suri S (2019) Ghost work: how to stop Silicon Valley
from building a new global underclass. HarperCollins Publish-
ers, Sydney

Helm P, Bella G, Koch G, Giunchiglia F (2024) Diversity and lan-
guage technology: how language modeling bias causes epis-
temic injustice. Ethics Inf Technol 26:8. https:// doi. org/ 10. 1007/
s10676- 023- 09742-6

Hofstadter D (1995) Fluid concepts and creative analogies. Basic-

Books, New York

Irani L (2015) The cultural work of microwork. New Media Soc
17:720û739. https:// doi. org/ 10. 1177/ 14614 44813 511926
Jaton F (2021) Assessing biases, relaxing moralism: on ground-truth-
ing practices in machine learning design and application. Big
Data Soc. https:// doi. org/ 10. 1177/ 20539 51721 10135 69

Ji Z, Lee N, Frieske R etáal (2023) Survey of hallucination in natural
language generation. ACM Comput Surv 55:1û38. https:// doi.
org/ 10. 1145/ 35717 30

Klein E (2024) What if Dario Amodei is right about A.I?. New York
Times.  https:// www. nytim es. com/ 2024/ 04/ 12/ opini on/ ezra-
klein- podca st- dario- amodei. html Accessed 4 Nov 2024.

Lakoff G, Johnson M (1980) Metaphors we live by. University of

Chicago Press, Chicago

Lar°i F, Luhrmann TM, Bell V etáal (2014) Culture and hallucina-
tions: Overview and future directions. Schizophr Bull 40:213û
220. https:// doi. org/ 10. 1093/ schbul/ sbu012

Lin S, Hilton J, Evans O (2022) TruthfulQA: measuring how models
mimic human falsehoods. Arxiv. https:// doi. org/ 10. 48550/ arXiv.
2109. 07958

Maynez J, Narayan S, Bohnet B, McDonald R (2020) On faithfulness
and factuality in abstractive summarization. In: Proceedings of
the 58th annual meeting of the association for computational
linguistics. Association for computational linguistics, Online,
pp 1906û1919

Miceli M, Schuessler M, Yang T (2020) Between subjectivity and
imposition: power dynamics in data annotation for computer
vision. Proc ACM Hum-Comput Interact 4:1û25. https:// doi.
org/ 10. 1145/ 34151 86

Mikolov T, Chen K, Corrado G, Dean J (2013) Efficient estimation
of word representations in vector space. Arxiv. https:// doi. org/
10. 48550/ arXiv. 1301. 3781

Mitchell M, Wu S, Zaldivar A, etáal (2019) Model Cards for model
reporting.  In:  Proceedings  of  the  Conference  on  Fairness,
Accountability, and Transparency. pp 220û229

Natale S (2021) Deceitful media: artificial intelligence and social life

after the turing test. Oxford University Press, Oxford

1698

AI & SOCIETY (2026) 41:1685û1698

Nietzsche,  F  (2005)  On  truth  and  lies  in  a  nonmoral  sense.  In:
Medina J, Wood D (ed) Truth: Engagements Across Philosophi-
cal Traditions. Wiley-Blackwell, Malden, MA, pp. 7û14.
Open AI (2023) GPT-4. https:// openai. com/ index/ gpt-4- resea rch/

Accessed 17 June 2024

Ouyang L, Wu J, Jiang X, etáal (2022) Training language models to
follow instructions with human feedback. Arxiv. https:// arxiv.
org/ abs/ 2203. 02155

Patel N (2024) Google CEO Sundar Pichai on AI-powered search and
the future of the web. The Verge. https:// www. theve rge. com/
24158 374/ google- ceo- sundar- pichai- ai- search- gemini- future-
of- the- inter net- web- openai- decod er- inter view  Accessed  17
June 2024

Perrigo  B  (2023)  Exclusive:  The  $2  per  hour  workers  who  made
ChatGPT safer. TIME. https:// time. com/ 62476 78/ openai- chatg
pt- kenya- worke rs/ Accessed 15 March 2024

Rabinow P (1984) Polemics, politics and problematizations: An inter-
view with Michel Foucault. In: Rabinow P (ed) The Foucault
reader. Pantheon Books, New York, pp 381û390

Radford A, Wu J, Child R, etáal (2019) Language models are unsu-
pervised multitask learners. https:// cdn. openai. com/ better- langu
age- models/ langu age_ models_ are_ unsup ervis ed_ multi task_ learn
ers. pdf

Roberts ST (2019) Behind the screen: content moderation in the shad-

ows of social media. Yale University Press, New Haven

Rombach R, Blattmann A, Lorenz D, etáal. (2022) High-Resolution
Image Synthesis with Latent Diffusion Models. Arxiv. https://
arxiv. org/ abs/ 2112. 10752

Roose K (2023) BingÆs A.I. Chat: æI Want to Be AliveÆ In: The New
York Times. https:// www. nytim es. com/ 2023/ 02/ 16/ techn ology/
bing- chatb ot- trans cript. html? searc  hResu ltPos ition=1 Accessed
26 Feb 2023

Rosenblatt F (1961) Principles of neurodynamics: Perceptrons and the
theory of brain mechanisms. Cornell Aeronautical Laboratory,
Buffalo NY

Searle JR (1980) Minds, brains, and programs. Behavioral and Brain
Sciences 3: 417û424. https:// doi. org/ 10. 1017/ S0140 525X0 00057
56

Shah C, Bender EM (2022) Situating Search. ACM SIGIR Conference
on human information interaction and retrieval. ACM, Regens-
burg Germany, pp 221û232

Sismondo S (2017) Post-truth? Soc Stud Sci 47:3û6. https:// doi. org/

10. 1177/ 03063 12717 692076

Solaiman I, Brundage, M, Clark, J etáal (2019) Release strategies and
the social impacts of language models. https:// cdn. openai. com/
GPT_2_ August_ Report. pdf. Accessed 05 Feb 2025

Szegedy C, Liu W, Jia Y, etáal (2015) Going deeper with convolutions.
In: 2015 IEEE Conference on Computer Vision and Pattern Rec-
ognition (CVPR). pp 1û9

Thylstrup NB (2021) Error. In: Thylstrup NB, Agostinho D, Ring A
etáal (eds) Uncertain archives: critical keywords for big data. MIT
Press, Cambridge, MA, pp 193û199

Tiku N (2022) The Google engineer who thinks the companyÆs AI
has come to life. In: Washington Post. https:// www. washi ngton
post. com/ techn ology/ 2022/ 06/ 11/ google- ai- lamda- blake- lemoi
ne/ Accessed 20 Jun 2022

T÷rnberg P, Chueri J (2025) When do parties lie? Misinformation and
radical-right populism across 26 countries. Int J Press/politics.
https:// doi. org/ 10. 1177/ 19401 61224 13118 86. Accessed 17 June
2024

Touvron H, Martin L, Stone K (2023) LlaMA 2: Open Foundation and
Fine-Tuned Chat Models. https:// ai. meta. com/ resea rch/ publi catio
ns/ llama-2- open- found ation- and- fine- tuned- chat- models/

Turing  AM  (1950)  Computing  machinery  and  intelligence.  Mind

LIX:433û460. https:// doi. org/ 10. 1093/ mind/ LIX. 236. 433

Turkle S (2005) The second self: computers and the human spirit. MIT

Press, Cambridge

Turner F (2006) From counterculture to cyberculture: Stewart Brandt,
the whole earth network, and the rise of digita utopianism. The
University of Chicago Press, Chicago and London

Vaswani A, Shazeer N, Parmar N, etáal (2017) Attention is all you need.
In: Proceedings of the 31st International Conference on Neural
Information Processing Systems. Curran Associates Inc., Red
Hook, NY, USA, pp 6000û6010

von der Mosel J, Trautsch A, Herbold S (2023) On the validity of
pre-trained transformers for natural language processing in the
software engineering domain. IEEE Trans Software Eng 49:1487û
1507. https:// doi. org/ 10. 1109/ TSE. 2022. 31784 69

Winner L (1986) Do artifacts have politics? The whale and the reac-
tor. University of Chicago Press, Chicago and London, pp 19û39
World Economic Forum (2024) The Global Risks Report. https://
www3. wefor  um. org/ docs/ WEF_ The_ Global_ Risks_ Report_
2024. pdf. Accessed 15 May 2024

World Health Organization. Infodemic. WHO https:// www. who. int/
health- topics/ infod emic# tab= tab_1 Accessed 17 June 2024
Xu Z, Jain S, Kankanhalli M (2024) Hallucination is inevitable: an
innate limitation of large language models. Arxiv. https:// doi. org/
10. 48550/ ARXIV. 2401. 11817

PublisherÆs  Note  Springer  Nature  remains  neutral  with  regard  to
jurisdictional claims in published maps and institutional affiliations.
