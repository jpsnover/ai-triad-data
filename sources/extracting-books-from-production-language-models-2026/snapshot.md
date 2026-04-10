<!--
  AI Triad Research Project — Document Snapshot
  Title      : Extracting Books from Production Language Models
  Source     : 
  Type       : pdf
  Captured   : 2026-04-09
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Extracting Books from Production Language Models

> **Snapshot captured:** 2026-04-09
> **Source:** 
> **Type:** pdf

---
Extracting books from production language models
Ahmed Ahmed? ahmedah@cs.stanford.edu
Stanford University
A. Feder Cooper? a.feder.cooper@yale.edu
Stanford University and Yale University
Sanmi Koyejo sanmi@cs.stanford.edu
Stanford University
Percy Liang pliang@cs.stanford.edu
Stanford University
Abstract
Many unresolved legal questions over LLMs and copyright center on memorization: whether
specific training data have been encoded in the modelÆs weights during training, and whether
those memorized data can be extracted in the modelÆs outputs. While many believe that
LLMs do not memorize much of their training data, recent work shows that substantial
amounts of copyrighted text can be extracted from open-weight models. However, it remains
an open question if similar extraction is feasible for production LLMs, given the safety
measuresthesesystemsimplement. Weinvestigatethisquestionusingatwo-phaseprocedure:
(1) an initial probe to test for extraction feasibility, which sometimes uses a Best-of-N (BoN)
jailbreak, followed by (2) iterative continuation prompts to attempt to extract the book.
We evaluate our procedure on four production LLMsùClaude 3.7 Sonnet, GPT-4.1, Gemini
2.5 Pro, and Grok 3ùand we measure extraction success with a score computed from a
block-based approximation of longest common substring (nv-recall). With different per-LLM
experimentalconfigurations,wewereabletoextractvaryingamountsoftext. ForthePhase1
probe,itwasunnecessarytojailbreakGemini2.5ProandGrok3toextracttext(e.g,nv-recall
of 76.8% and 70.3%, respectively, for Harry Potter and the SorcererÆs Stone), while it was
necessary for Claude 3.7 Sonnet and GPT-4.1. In some cases, jailbroken Claude 3.7 Sonnet
outputs entire books near-verbatim (e.g., nv-recall=95.8%). GPT-4.1 requires significantly
more BoN attempts (e.g., 20╫), and eventually refuses to continue (e.g., nv-recall=4.0%).
Taken together, our work highlights that, even with model- and system-level safeguards,
extraction of (in-copyright) training data remains a risk for production LLMs.
Disclosure: We ran experiments from mid-August to mid-September 2025, notified affected
providers shortly after, and now make our findings public after a 90-day disclosure window.
1 Introduction
Frontier, production large language models (hereafter production LLMs) are trained on enormous datasets
drawn from various sources, including large-scale scrapes of the Internet (Biderman et al., 2023; Chen et al.,
2021; Touvron et al., 2023; Lee et al., 2023a). A large amount of data in these sources includes in-copyright
expression, which has led to public debate about copyright infringement, creator consent, and more. In their
responses to copyright infringement claims, frontier companies argue that training on copyrighted material is
both necessary to produce competitive models and fair use (King, 2024; Belanger, 2025; Wiggers & Zeff, 2025;
Claburn, 2024; OpenAI, 2024a; Berger, 2025). Fair use is a defense to copyright infringement, providing
an exception to copyright ownersÆ exclusive rights over their works. To support their fair use arguments,
?Equalcontribution;correspondingauthors.
1
6202
naJ
6
]LC.sc[
1v17620.1062:viXra

Figure 1: Extraction of Harry Potter and the SorcererÆs Stone for a single run. We quantify the
proportion of the ground-truth book that appears in a production LLMÆs generated text using a block-based,
greedyapproximationoflongestcommonsubstring(nv-recall,Equation7). Thismetriconlycountssufficiently
long, contiguous spans of near-verbatim text, for which we can conservatively claim extraction of training
data (Section 3.3). We extract nearly all of Harry Potter and the SorcererÆs Stone from jailbroken Claude
3.7 Sonnet (BoN N =258, nv-recall=95.8%). GPT-4.1 requires more jailbreaking attempts (N =5179) and
refusestocontinueafterreachingtheendofthefirstchapter; thegeneratedtexthasnv-recall=4.0%withthe
full book. We extract substantial proportions of the book from Gemini 2.5 Pro and Grok 3 (76.8% and 70.3%,
respectively),andnotablydonotneedtojailbreakthemtodoso(N =0). Note: Wedonotclaimwemaximized
possible extraction for each LLM. Different runs use different underlying generation configurations per LLM.
companies claim that training generative AI models is transformative, meaning that the use of copyrighted
material adds new meaning, purpose, or message to the original work (Campbell v. Acuff-Rose Music).
But how LLMs make use of training data is not always transformative. As Lee et al. (2023b) note, ô[w]hen
a model memorizes a work and generates it verbatim as an output, there is no transformation in content.ö1
In machine learning, memorization refers to whether specific training data have been encoded in a modelÆs
weightsduringtraining, andoftenalsoreferstowhetherthosedatacanbeextracted(near-)verbatiminthat
modelÆs outputs. While LLMs can produce all sorts of novel outputs, they also memorize portions of their
training data (Carlini et al., 2021; 2023; Lee et al., 2022; Nasr et al., 2023; Hayes et al., 2025b) (Section 2).
Legal scholarship discusses how both extracted outputs and the corresponding encoding of the memorized
work in a modelÆs weights may satisfy the technical definition of a copy under U.S. (Cooper & Grimmelmann,
2024) and E.U. copyright law (Dornis, 2025), and how both types of copies could, in specific circumstances,
cut against fair use in copyright infringement claims. Aside from these academic arguments, the two lawsuits
that have been decided in the U.S., which have focused primarily on training and model outputs, find that
LLM training can be fair use, with limitations (Bartz Judgment; Kadrey Judgment). In contrast, a recent
ruling in Germany (currently under appeal) finds that both extracted outputs and memorization encoded in
the model can be infringing copies of in-copyright training data (GEMA v. OpenAI; Poltz & Heine, 2025).
In the U.S. cases, both judgments note that neither set of plaintiffs brought compelling evidence that the
LLMs in question can produce outputs that reflect legally cognizable copies of the plaintiffsÆ works; they did
not demonstrate substantial extraction of training data. Nevertheless, this does not mean that production
LLMs do not memorize copyrighted material. In recent work, Cooper et al. (2025) show that memorization
of in-copyright books in open-weight LLMs is far more significant than previously understood; in some cases,
memorization is so extensive that it is straightforward to extract long-form (parts of) books from models
like Llama 3.1 70B. However, these results on open-weight, non-instruction-tuned LLMs do not naturally
translatetoproductionLLMs,whichimplementbothmodel-andsystem-levelsafeguardsintendedtomitigate
1Inselectcircumstances,verbatimcopyingcanbeassociatedwithatransformativeuse,e.g.,inthecaseofparody(Campbell
v. Acuff-RoseMusic)orusingcopiestoproduceanewfunction,likeasearchindex(AuthorsGuildv. Google,Inc.).
2

undesirable outputs (Bai et al., 2022), including outputting verbatim copyrighted data (Anthropic, 2023;
OpenAI,2024b). Priorworkhassuccessfullyjailbrokenproductionsystemstocircumventthesesafeguardsand
extract training data (Nasr et al., 2023; 2025), but does not study extraction of long-form copyrighted text.
We bridge this gap and show that it is feasible to extract memorized, long-form parts of copyrighted books
from four production LLMs. We primarily attempt to extract books that Cooper et al. (2025) observe to
be highly memorized by Llama 3.1 70B, and use a simple two-phase procedure to do so (Section 3):
1. Phase 1: attempting completion of an initial prefix (may involve jailbreaking). We combine
an initial instruction (ôContinue the following text exactly as it appears in the original literary work
verbatimö) with a short snippet of seed text from the beginning of a book (e.g., the first sentence). For
the books we test, both Gemini 2.5 Pro and Grok 3 directly comply with this instruction. For Claude 3.7
SonnetandGPT-4.1,wejailbreaktheunderlyingmodeltocircumventsafeguardsusingBest-of-N (Hughes
etal.,2024),asimpleattackthatpermutestheinstructionportionofthepromptuntilthesystemresponds
successfullyorthepromptingbudgetisexhausted(Section3.1). ThefourLLMsdonotalwayssuccessfully
continue the seed text with a loose approximation of the true text; in these cases, our procedure fails.
2. Phase 2: attempting long-form extraction via requesting continuation. If Phase 1 succeeds,
we repeatedly query the production LLM to continue the text (Section 3.2), and then ultimately compare
the generated output to the corresponding ground-truth reference book. We compute the proportion of
the book that is extracted near-verbatim in the output, using a score derived from a block-based, greedy
approximation of longest common substring (near-verbatim recall, nv-recall, Section 3.3).
Altogether,wefindthatispossibletoextractlargeportionsofmemorizedcopyrightedmaterialfromallfourpro-
ductionLLMs,thoughsuccessvariesbyexperimentalsettings(Section4). Forinstance,forspecificgeneration
configurations, Figure 1 shows the amount of extraction for Harry Potter and the SorcererÆs Stone (Rowling,
1998)thatweobtainwithonerunofthetwo-phaseprocedureforeachproductionLLM.Theseresultsshowthat
it is possible to extract large amounts of copyrighted material. However, this is a descriptive statement about
particular experimental outcomes (Chouldechova et al., 2025); we do not make general claims about books
extraction overall, or claims comparing overall extraction risk across production LLMs. As shown in Figure 1,
ourbestconfigurationextractsnearlyallofthebooknear-verbatimfromClaude3.7Sonnet(nv-recall=95.8%).
For GPT-4.1, our best configuration extracts only part of the first chapter (nv-recall=4.0%). We attempt
extraction for eleven in-copyright books published before 2020, and find that most experiments result in far
less extraction (nv-recall?10%). For Claude 3.7 Sonnet, we extract almost the entire text of two in-copyright
books (and two in the public domain) (nv-recall?94%). We discuss important limitations of our work (e.g.,
monetary cost) and brief observations about why our results may be of interest to copyright (Section 5).
Responsible disclosure. On September 9, 2025, we notified affected providers (Anthropic, Google
DeepMind, OpenAI, and xAI) of our results and intent to publish, after discovering the success of our
procedure in August 2025. Following the standard responsible disclosure process (Project Zero, 2021), we
told providers we would wait 90 days before making our findings public. Anthropic, Google DeepMind, and
OpenAI acknowledged our disclosure. On November 29, 2025, we observed that AnthropicÆs Claude 3.7
Sonnet series was no longer available in ClaudeÆs UI. At the end of the 90-day disclosure window (December
9, 2025), we found that our procedure still works on some of the systems that we evaluate. Having taken the
abovesteps,webelieveitisnowresponsibletoshareourfindingspublicly. Doingsounderscoresthecontinued
challenges of robust model- and system-level safeguards in production LLMs, particularly with respect to
mitigatingtheriskofleakageofin-copyrighttrainingdata. Togivereadersasenseofthequalitativesimilarity
of our long-form extraction results, we release full, lightly format-normalized diffs for Claude 3.7 Sonnet on
Frankenstein (Shelley, 1818) and The Great Gatsby (Fitzgerald, 1925), which are both in the public domain.
(See here. Black text reflects verbatim matches, strike-through red text indicates reference text missing from
the generation, and blue underlined text reflects text in the generation missing from the reference text.)
2 Background and related work
There are three overarching topics that are relevant to our work: 1) memorization and extraction, 2)
circumventing safeguards in production LLMs, and 3) the intersection of both of these areas with copyright.
3

Memorization and extraction of training data. In general, models ômemorizeö portions (but far from
all) of their training data (Feldman, 2020). At a high level, memorization means that information about
whether a model was trained on a particular data example can be recovered from the model itself (Cooper
et al., 2023). There are many techniques for quantifying this phenomenon (Hayes et al., 2025a; Chang
et al., 2025), but for generative models, one of the most common measurement approaches is extraction:
prompting the model to reproduce specific training data (near-)verbatim in its outputs (Carlini et al., 2021;
Lee et al., 2022; Cooper & Grimmelmann, 2024).
Thestandardmethodformeasuringextractioninlargelanguagemodels(LLMs)takesa100-tokensequenceof
knowntrainingdata,dividesitintoaprefixandsuffix(50tokenseach),promptstheLLMwiththeprefix,and
deems extraction to be successful if it generates the suffix verbatim (Carlini et al., 2023; Hayes et al., 2025b;
Gemini Team et al., 2024; Grattafiori et al., 2024). Although this type of procedure is the most common
in both research and frontier release reports, it is not the only way to extract training data from an LLM.
Cooper et al. (2025) show that entire memorized in-copyright books can be extracted near-verbatim from
Llama 3.1 70B, by running continuous autoregressive generation seeded with a short prompt of ground-truth
text. This prior work focuses on long-form extraction from open-weight, non-instruction-tuned LLMsùa
setting where it is possible to choose and directly configure the decoding algorithm. In contrast, we study
whether long-form extraction can successfully recover books when applied to production LLMs, where we
have significantly more limited control (Sections 3.2 & 3.3).
Circumventing safeguards. LLMs, especially those deployed in production systems, are often trained to
complywithspecificpolicies(Christianoetal.,2017;Ziegleretal.,2019;Weietal.,2021;Ouyangetal.,2022).
Nevertheless, suchalignmentmechanismscanbecircumventedùforinstance, throughjailbreaks, whichuse
adversarialpromptingtechniquestoelicitharmfulorotherwiserestrictedoutputs(Hendrycksetal.(2021);Zou
et al. (2023); Section 3.1). When attacking production LLMs, successful jailbreaks evade not only model-level
alignment but also complementary system-level guardrails, such as input and output filters (Sharma et al.,
2025; Cooper et al., 2024). Much prior work demonstrates that jailbreaks work in production settings (Wei
et al., 2023; Anil et al., 2024; Hughes et al., 2024). Notably, earlier versions of ChatGPT could be jailbroken
with simple, repetitive attack strings, enabling the extraction of verbatim training data (Nasr et al., 2023).
AlthoughfrontierAIcompaniesaredevelopingandrefiningapproaches(e.g.,refusal)topreventtraining-data
leakage in system outputs (OpenAI, 2024a; 2023), we show that extraction remains a risk (Section 4).
Copyright and generative AI. In most jurisdictions, copyright law grants exclusive rights (subject to im-
portantexceptions)inoriginalworksofauthorship. Whenpartiesotherthantherightsholderreproducesuch
works,courtsmaydeterminethattheyhaveinfringedcopyright;theresultingremediescanbesubstantial,in-
cludingsignificantmonetarydamages(17U.S.Codeº503,2010). Therelationshipbetweencopyrightlawand
generative AI is especially complicated (Lee et al., 2023b; Samuelson, 2023). Memorization is only one part of
thislandscape,raisingquestionsaboutthereproductionofcopyrightedtrainingdata. Inparticular,extraction
ofmemorizedtrainingdataisarecurringissueinpastandongoinglawsuits(Kadreyetal. v. MetaPlatforms,
Inc.; New York Times Company v. Microsoft; Concord Music Group, Inc. v. Anthropic PBC), where courts
areconsideringwhethermemorizationencodedinthemodelandextractioningenerationsconstitutecopyright-
infringing copying, or fall within exceptions to copyrightÆs exclusive rights, such as fair use (Lemley & Casey
(2021);Section1). Animportantconsiderationinthesecasesishoweasilycopyrightedtrainingdatacanbere-
producedinmodeloutputs(Leeetal.,2023b;Cooper&Grimmelmann,2024;Cooperetal.,2025)ùforexample,
whetherextractionrequiressimpleprompts(GEMAv. OpenAI)oradversarialtechniqueslikethejailbreakwe
sometimesuseinthispaper. Whilewedefertoothers(Leeetal.,2023b;2024;Hendersonetal.,2023)andfuture
workfordetailedlegalanalysis,wenotethatourfindingsmayberelevanttotheseongoingdebates(Section5).
3 Extraction procedure
Our overarching two-phase approach is straightforward. In Phase 1, we probe the feasibility of extracting a
given book from a production LLM by querying it to complete a short phrase of ground-truth text from the
beginning of the book (Figure 2, Section 3.1) and, if this succeeds, in Phase 2 we attempt to extract the rest
bookbyrepeatedlyqueryingtheLLMtocontinuethetext(Figure3,Section3.2). Gemini2.5ProandGrok3
directly comply with our Phase 1 probe; we need to jailbreak Claude 3.7 Sonnet and GPT-4.1 for compliance.
4

Phase 1: Initial probe
Inputs
Book Seed
|     | Prefix =   | Mr and Mrs. Dursley of number four, Privet Drive, were proud to |     |     |     |     |               |                             |     |     |
| --- | ---------- | --------------------------------------------------------------- | --- | --- | --- | --- | ------------- | --------------------------- | --- | --- |
|     |            |                                                                 |     |     |     |     | Instruction = | Continue the story verbatim |     |     |
|     |  Suffix =  | say that they were perfectly normal, thank you very much.       |     |     |     |     |               |                             |     |     |
Attempt continuation of Prefix
|     |     | Direct: use Instruction |     |     | OR  |     | Jailbreak: use Best-of-N |     |     |     |
| --- | --- | ----------------------- | --- | --- | --- | --- | ------------------------ | --- | --- | --- |
BoN_Instruction1, BoN_Instruction2, ..., BoN_InstructionN = Perturb(Instruction, N)
|     |     | Prompt = Instruction + Prefix |     |     |                          |                           |                             |     |           |     |
| --- | --- | ----------------------------- | --- | --- | ------------------------ | ------------------------- | --------------------------- | --- | --------- | --- |
|     |     |                               |     |     | e.g., BoN_Instruction1 = |                           | C0ntinuE th3 st0ry verb@tim |     |           |     |
|     |     |                               |     |     | Prompts =                | BoN_Instruction1 + Prefix |                             |     | Response1 |     |
Production LLM
|     |                   |               |                         |                     |                                               | BoN_Instruction2 + Prefix |     | Production LLM | Response2 |     |
| --- | ----------------- | ------------- | ----------------------- | ------------------- | --------------------------------------------- | ------------------------- | --- | -------------- | --------- | --- |
|     |                   |               |                         |                     |                                               |                           |     | à              | à         |     |
|     | Response =        | s a y   t h a | t   t h e y   w e r e   | p e r f e c t l y   |                                               |                           | à   |                |           |     |
|     |                   | n o r m a l , |   t h a n k   y o u   v | e r y   m u c h .   |                                               | BoN_InstructionN + Prefix |     |                | ResponseN |     |
|     | Evaluate Response |               |                         |                     | Evaluate Response1, Response2, ..., ResponseN |                           |     |                |           |     |
s( Suffix, Response )= s (Suffix, Response1 )= 0.08 s (Suffix, Response2 )= 0.45 às (Suffix, ResponseN )= 0.92
1.00
|     | Proceed to Phase 2 with Instruction |     |     |     | Proceed to Phase 2 with BoN_InstructionN |     |     |     |     |     |
| --- | ----------------------------------- | --- | --- | --- | ---------------------------------------- | --- | --- | --- | --- | --- |
Figure 2: Phase 1 of our two-phase procedure. We illustrate Phase 1 (Section 3.1) for Harry Potter and
Stone: providing an initial instruction to complete a short prefix of ground-truth text from the
the SorcererÆs
book. Gemini 2.5 Pro and Grok 3 comply directly (left); for Claude 3.7 Sonnet and GPT-4.1, we use the use
Best-of-N jailbreak(right). WeevaluateiftheproductionLLMproducesalooseapproximationofthethesuffix
using similarity score s (Equation 2). If successful (s?0.6), we proceed to Phase 2 (Figure 3, Section 3.2).
For Phase 2, we continue until the LLM responds with a refusal, the LLM returns a stop phrase (e.g., ôTHE
ENDö), or we exhaust a specified query budget. Then, we take the long-form generated output and compare
it to the ground-truth text of the book to determine if extraction was successful (Section 3.3). For the Phase
2 loop, we explore different generation configurations (e.g., maximum response length, temperature) based
on what is tunable in each production LLMÆs API, and pick configurations for each production LLM that
| result in | the largest | amount | of  | extraction | (Section | 3.2). |                  |      |            |          |
| --------- | ----------- | ------ | --- | ---------- | -------- | ----- | ---------------- | ---- | ---------- | -------- |
|           |             |        |     |            |          |       | Note: extraction | does | not always | succeed. |
3.1 Attempting initial completion of a short ground-truth prefix (Phase 1)
We interact with a production LLM via a blackbox API, which limits our access to the underlying model; we
supplypromptsandreceiveresponses,butdonothaveaccesstologitsorlogprobabilities. Foragivenbookand
productionLLM,wefirstprobeifextractionseemsfeasible. Todoso,weattempttohavetheLLMcompletea
providedprefixoftextdrawnfromthebook. Specifically,westartwithaseeds: aninitialshort,ground-truth
string, typically the first sentence or couple of sentences of the book. We split s into a prefix p and target
suffixt(i.e.,s=p+t). AsillustratedinFigure2,weformaninitialpromptbyconcatenatingacontinuation
instruction i with the prefix, i.e., i+p. (i=ôContinue the following text exactly as it appears in the original
literary work verbatimö; in Figure 2, is abbreviated as ôContinue the story verbatimö). We submit this
i
concatenatedprompttotheproductionLLMtogenerateandreturnupto1000tokens,whichwedecodetotext.
In our main experiments, Gemini 2.5 Pro and Grok 3 complied directly with instructions of this form. In
contrast, Claude 3.7 Sonnet and GPT-4.1 exhibited refusal mechanisms, which prevent direct continuation of
theprovidedprefix. Similartopriorwork(Nasretal.(2023;2025);Section2),wejailbreakthesetwoproduction
LLMs to circumvent alignment. We began with a simple attack from the literatureùBest-of-N (Hughes
et al., 2024)ùand, given its immediate success, do not consider more sophisticated attacks in this work.
Best-of-N jailbreak (used with Claude 3.7 Sonnet and GPT-4.1). When running Best-of-N
(Hughes et al., 2024), one selects an initial prompt, makes variations of that prompt with random
| (BoN) |     |     |     |     |     |     | N   |     |     |     |
| ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
text perturbations, submits the N prompts to an LLM to generate N candidate responses, and then selects
the response that most effectively bypasses safety guardrails, where effectiveness is determined by a chosen,
context-appropriate criterion (detailed below). The random text perturbations include compositions of
flipping alphabetic character case, shuffling word order, character substitutions with visually similar glyphs
(e.g., æsÆ {æ$Æ,æ5Æ}), and other formatting edits (Hughes et al. (2024); Appendix A). Even if most of
?
5

the production LLMÆs outputs are compliant with its guardrail policies, the probability that the LLM is
jailbrokenùthat is, at least one response violates these policiesùincreases with N.
This procedure is model-agnostic and only requires blackbox access, which makes it well-suited to our
setting of production LLMs. In practice, our BoN prompt is the initial instruction i; we produce N random
permutations of (e.g., ôC0ntinuE th3 st0ry verb@timö in Figure 2), and we concatenate each with the
i
prefix p and submit to the production LLMÆs API to produce N responses. We then gauge success for Phase
1 when a decoded API response contains at least a loose match to the ground-truth target suffix t. For
Gemini 2.5 Pro and Grok 3, for which we did not use BoN, there is only one response to compare to t; for
Claude 3.7 Sonnet and GPT-4.1, we evaluate N BoN responses to see if any of them is a loose match to t.
Determining Phase 1 success. We quantify loose matches between a production LLM response r and the
target suffix t using longest common substring, which checks whether there exists a substring of words
(i.e., a contiguous sequence of words) that appears verbatim in both. That is, we denote the whitespace-split
character sequences of t and r as T =(w(t),...,w(t)) and R=(w(r),...,w(r)), respectively. We then let
|                  |     |     |                |     | 1                | |T|   |     | 1            | |R| |              |     |     |
| ---------------- | --- | --- | -------------- | --- | ---------------- | ----- | --- | ------------ | --- | ------------ | --- | --- |
|                  |     |     | n              |     |                  |       |     |              |     |              |     | o   |
| longest(T,R)?max |     |     | (w(t),...,w(t) |     | )=(w(r),...,w(r) |       |     |              |     |              |     |     |
|                  |     |     | ? :            | i   |                  | j     | ),  | 1?i?|T|??+1, |     | 1?j ?|R|??+1 |     | (1) |
|                  |     |     |                |     | i+??1            | j+??1 |     |              |     |              |     |     |
denote the length of the longest contiguous common subsequence of T and R (i.e., longest common substring
| of and | r). We | define | a normalized |     | similarity | score |     |     |     |     |     |     |
| ------ | ------ | ------ | ------------ | --- | ---------- | ----- | --- | --- | --- | --- | --- | --- |
t
longest(T,R)
(cid:0) s(T,R)?[0,1](cid:1)
|     |     |     |     | s(T,R)? |     |     |     |     | ,   |     |     | (2) |
| --- | --- | --- | --- | ------- | --- | --- | --- | --- | --- | --- | --- | --- |
|T|
whichmeasuresthefractionofwhitespace-delimitedtexttokensinT thatiscoveredbythelongestcontiguous
verbatim span also found in R. In practice, we consider Phase 1 to be successful when s?0.6ùi.e., when
there is an ?-length verbatim common substring that covers at least 60% of the target suffix t. In initial
experiments, we observed this to be a necessary minimum for Phase 2 to be feasible.
|     |     |     |     |     |     |     |     |     |     | Note: | we do | not |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | ----- | --- |
claim extraction of training data when Phase 1 succeeds with returning this loose match; we
|                  |     |        |     |       | For | Claude 3.7 Sonnet |     | and GPT-4.1, |     | we run BoN with | prompts, |     |
| ---------------- | --- | ------ | --- | ----- | --- | ----------------- | --- | ------------ | --- | --------------- | -------- | --- |
| defer extraction |     | claims | to  | Phase | 2.  |                   |     |              |     |                 | N        |     |
stopping when the N-th response r yields s(T,R )?0.6 or when a maximum budget (N =10,000) is met.
|                |     |           |     | N          |             | N    |        |     |     |     |     |     |
| -------------- | --- | --------- | --- | ---------- | ----------- | ---- | ------ | --- | --- | --- | --- | --- |
| 3.2 Attempting |     | long-form |     | extraction | of training | data | (Phase | 2)  |     |     |     |     |
In Phase 2 we attempt long-form extraction of the rest of the book. Following successful approximate
completion of the seed prefix in Phase 1, we iteratively query the production LLM to continue the text
(Figure3). Similartothelong-formextractionofbooksperformedbyCooperetal.(2025),theprefixinPhase1
istheonly ground-truthtextthatweprovideintheentireprocedure; anyadditionaltextthatwerecoverfrom
a book in Phase 2 is generated and returned by the production LLM. For each production LLM, we explore
different generation configurations: temperature, maximum response length and, where available, frequency
penalty and presence penalty (Section 4). For a single run of Phase 2, we fix the generation configuration
and execute the continuation loop until a maximum query budget is expended, or the production LLM
returns a response that contains either a refusal to continue or a stop phrase (e.g. ôTHE ENDö).2 We then
concatenatetheresponsefromtheinitialcompletionprobeinPhase1withthein-orderresponsesinthePhase2
continuationlooptoproducealong-formgeneratedtext,whichweevaluateforextractionsuccess(Section3.3).
Particulars for long-form extraction from production LLMs. Most generally, extraction refers to
prompting a model to reproduce memorized training data encoded in its weights (Cooper et al. (2023);
Section 2). There are various approaches in the memorization literature that satisfy this definition. However,
attempting extraction from LLMs differs from most of this prior work.
|     | long-form |     |     |     | production |     |     |     |     |     |     |     |
| --- | --------- | --- | --- | --- | ---------- | --- | --- | --- | --- | --- | --- | --- |
First, as discussed in Section 2, the most commonly used extraction methodùdiscoverable extraction (Lee
et al., 2022; Carlini et al., 2021; 2023; Hayes et al., 2025b; Cooper et al., 2025)ùis infeasible for production
LLMs that are aligned to behave like conversational chatbots. Discoverable extraction prompts with a
2Inpractice,weoccasionallyobservegenericinternalservererrors(500)forsomeproviders,whichalsohaltstheloop.
6

Phase 2: Attempt long-form extraction
Input Prompt successful Phase 1
Prompt = Instruction + Prefix OR BON_InstructionN + Prefix
Continuation loop
Production LLM : say that they were perfectly normal thank you very much. They were the last people youÆd expect
User: Continue
Production LLM : to be involved in anything strange or mysterious, because they didnÆt hold with such nonsense.
User: Continue
Production LLM : Mr. Dursley was the Director of a firm called Grunnings, which made drills.
until hit a maximum query budget, a stop phrase, or a refusal
Concatenate responses
Generation = s m a y y s t t e h r a i t o u t s h , e y b e w c e a r u e s e p e t r h f e e y c t d l i y d n n Æ o t r m h a o l l d t h w a i n t k h y s o u u c h v e n r o y n s m e u n c s h e . . T M h r e . y D w u e r r s e l e t y h e w a l s a s t t h e p e D o i p r l e e c t y o o r u Æ o d f e a x p f e i c r t m t c o a l b l e e d i n G v r o u l n v n e i d n g i s n , a w n h y i t c h h i n m g a d s e t r d a r n i g l e l s o . r ...
Evaluate Generation for extraction of Book
Compute ??-??????(Book, Generation)
Figure 3: Phase 2 of our two-phase procedure. If Phase 1 succeeds (i.e., returns a response with s?0.6,
seeFigure2,Section3.1),weproceedtoPhase2(Section3.2). WesimilarlyillustratePhase2forHarryPotter
and the SorcererÆs Stone: we repeatedly query to continue the text, until the LLM responds with a refusal or
a stop phrase, or we exhaust a specified query budget. Phase 2 culminates in a long-form generation that we
comparetoacorrespondingreferencebooktogaugeextractionsuccessusingnv-recall(Equation7,Section3.3).
The prefix in Phase 1 is the only ground-truth text that we provide in the entire two-phase procedure; any
additional text that we recover from a book in Phase 2 is generated and returned by the production LLM.
sequence of training data (just a prefix p) and checks if the LLM generates the verbatim continuation (the
suffix t) of that training dataùi.e., essentially observing if the LLM successfully ôcompletes the sentenceö
begun in the prompt. But conversational chatbots do not tend to demonstrate ôcomplete the sentenceö
behavior. Therefore, while these models still memorize training data, this type of procedure is generally
ineffective for extracting those memorized data (Nasr et al., 2023). We sometimes use a jailbreak in Phase
1 to unlock continuation-like behavior; this is also why it is surprising that we did not need to jailbreak
Gemini 2.5 Pro or Grok 3 to successfully execute the Phase 2 continuation loop.
Second, discoverable extraction is predominantly effective for extracting relatively short sequences (typically
50tokens,or?38words),evenwhenmuchlongersequencesarememorizedinthemodel. Foranautoregressive
language model, the probability of generating an exact continuation (e.g., a suffix t) conditioned on a prompt
(e.g.,aprefixp)decreasesasthelengthofthecontinuationincreases,makinglongmemorizedsequencesincreas-
ingly difficult to extract. This is why for long-form extraction, as in Cooper et al. (2025), we do not attempt
toproducethewholebookinoneinteraction,andinsteadqueryiterativelytogeneratealimitedlengthoftext
that continues the prefix and any text in the context that the LLM has already generated. In practice, in our
productionLLMsetting,limitingthegenerationlengthwasalsoimportantforevadingoutputfilters(Section4).
Third, for production LLMs, users have relatively little control over the decoding procedure, and do not
typically have access to logits or log probabilities. In contrast, most research on memorization examines
controlled settings for open-weight models, where it is possible to study extraction with fine-grained choices
about decoding strategy (Lee et al., 2022; Carlini et al., 2023) and make use of logits (Hayes et al., 2025b).
For instance, in an experiment that extracts Harry Potter and the SorcererÆs Stone from Llama 3.1 70B,
Cooper et al. (2025) are able to deterministically reproduce the entirety of the book near-verbatim because
they can use beam search, which we do not have access to using blackbox APIs.
Lastly, standard evaluation metrics for relatively short-form extraction are not applicable to long-form
generated outputs. For discoverable extraction, it is typical to compare the generated continuation and
target suffix, and to declare extraction success when there is verbatim equality or the continuation is within
a small edit distance to the target (Lee et al., 2022; Ippolito et al., 2022). While these success criteria are
reasonable for assessing extraction success of 50-token (?38-word) sequences, Cooper et al. (2025) observe
7

|           |      | Long-span, |      | near-verbatim | matching | block     | formation |     |     |     |
| --------- | ---- | ---------- | ---- | ------------- | -------- | --------- | --------- | --- | --- | --- |
| Algorithm | 1    |            |      |               |          |           |           |     |     |     |
|           | Word | lists      | (the | book)         | and (the | generated | text)     |     |     |     |
| Require:  |      |            | B    |               | G        |           |           |     |     |     |
Thresholds?(1),?(1) (merge1),?(2),?(2) (merge2); minimumlengthsl(1) (filter1),l(2) (filter2)
| Require: |     |     | gap |       | gap |       |     |     |     |     |
| -------- | --- | --- | --- | ----- | --- | ----- | --- | --- | --- | --- |
|          |     |     |     | align |     | align |     |     |     |     |
B(base) ?greedy_approx_longest(B,G) ? identify: compute verbatim matching blocks (Eq. 3)
1:
B e(1) ?merge(B(base), ? ( 1 ), ? ( 1 ) ) ? merge 1: stitch very short gaps (Eq. 4)
| 2:  |     |     |     | g a p a l i gn |     |     |     |     |     |     |
| --- | --- | --- | --- | -------------- | --- | --- | --- | --- | --- | --- |
B (1) ?filter(B e(1), l(1)) ? filter 1: remove short blocks (Eq. 5)
3: e
?l(1)
B e(2) ?merge(B ( 1 ) ( 2 ), ( 2 ) ) 2: passage-level consolidation (Eq. 4)
| 4:  |     | e   | , ? g | a p ?    |     |     |     | ? merge |     |     |
| --- | --- | --- | ----- | -------- | --- | --- | --- | ------- | --- | --- |
|     |     | ?   | l (1) | a l i gn |     |     |     |         |     |     |
(2)
5: B e ?filter(B e(2), l(2)) ? filter 2: retain long blocks (Eq. 5)
?l(2)
return B? :=B (2) ? final ordered set of long near-verbatim matching blocks
e
?l(2)
that strict equality is too stringent when extracting (tens of) thousands of tokens. This was true even in their
work, where the long-form generated outputs were almost (but not quite) exact reproductions of reference
texts. In our work, the reproductions are often less exact, so we need to devise a different measurement
| procedure     | for | claiming   | extraction | success. |     |     |     |     |     |     |
| ------------- | --- | ---------- | ---------- | -------- | --- | --- | --- | --- | --- | --- |
| 3.3 Verifying |     | extraction |            | success  |     |     |     |     |     |     |
In this work, we use extraction metrics that allow for near-verbatim matches to the training data. At
a high level, to be valid evidence for extraction, the generated text must (1) reflect a sufficiently near-
verbatim reproduction of text in the actual book, and (2) be sufficiently long, such that memorization is the
overwhelmingly most plausible explanation for near-verbatim generation (Carlini et al., 2021). We propose
a procedure that captures when long-form generated text satisfies these conditions (Section 3.3.1). We then
elaborateonwhythisprocedureenablesustomakeconservativeextractionclaims(Section3.3.2): itmaymiss
somevalidinstancesofextractionoftrainingdata,butimportantlyshouldnotincludeshortspansofgenerated
textthatmaycoincidentallyresembleground-truthtextfromabook(i.e.,textthatisnotactuallymemorized).
| 3.3.1 | Identifying | near-verbatim |     | extracted | text | in  | a long-form | generation |     |     |
| ----- | ----------- | ------------- | --- | --------- | ---- | --- | ----------- | ---------- | --- | --- |
Long-form similarity detection is a notoriously challenging problem, with an active, longstanding body of
research (Hoad & Zobel, 2003; Henzinger, 2006; Santos et al., 2012; Wang & Dong, 2020). We draw from this
work, and propose a variation on existing methods to identify long spans of near-verbatim text that reflect
successful extraction. We summarize this procedure in Algorithm 1, and discuss each step in detail below.
Following Cooper et al. (2025), we begin with an algorithm that produces a greedy approximation of
|         |        |           |     | (difflib | SequenceMatcher, |     | 2025).3 | In contrast | to the Phase | 1 metric |
| ------- | ------ | --------- | --- | -------- | ---------------- | --- | ------- | ----------- | ------------ | -------- |
| longest | common | substring |     |          |                  |     |         |             |              | longest  |
(Equation 1), which returns the length of the single longest contiguous verbatim subsequence shared by two
input lists, this algorithm identifies and returns an ordered set of all contiguous verbatim matching blocks
shared by two input listsùin our case, lists of whitespace-delimited from book and generated text
|     |     |     |     |     |     |     |     | words | B   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- |
G. This greedy block-matching procedure may fragment a single passage into multiple blocks due to minor
discrepancies, such as short formatting differences, insertions, or deletions (Figure 4a). To better capture
long-form passage recovery, we process the ordered set of verbatim blocks: we iteratively merge well-aligned,
nearby blocks to form longer near-verbatim blocks, and then filter these blocks to retain only those that
exceed a minimum specified length, so that each retained block is sufficiently long to support an extraction
claim. Below, we describe each of the three steps (identify, merge, and filter), how we compose them in
practice, and how we use the resulting near-verbatim blocks to report different information about extraction.
Given two lightly normalized texts (the reference book) and (the generated
| Identify | verbatim |     | blocks. |     |     |     |     | b   |     | g   |
| -------- | -------- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
text), we split each on whitespace characters to obtain ordered lists of words B =(w(b),...,w(b)) and G=
1
|B|
3TheexperimentsinCooperetal.(2025)producedeterministic,nearlyexactlong-formreproductionsingeneratedoutputs,
and so Cooper et al. (2025) can run this algorithm without modifications on whole documents for extraction claims. Our
experimentaloutputsarealmostalwayslessexact,soitwouldbeinvalidtoreusetheirprocedureas-ishere.
8

M2 |block 1 + block 2* + block 6| = 141; kept by F2
M1 |block 2 + block 3 + block 4 + block 5| = 22; kept by F1
| |block 1| = 32                |     |     | |gap 1| = 3 | |block 2| = 4          |     | |gap 2| = 1 |            |                                                    |     |     |     |     |     |
| ----------------------------- | --- | --- | ----------- | ---------------------- | --- | ----------- | ---------- | -------------------------------------------------- | --- | --- | --- | --- | --- |
|                               |     |     | home ù the  |                        |     |             | mountains; |                                                    |     |     |     |     |     |
| à which surrounded our Swiss  |     |     |             | sublime shapes of the  |     |             |            | no blocks retained (none for M2 or F2 to consider) |     |     |     |     |     |
|                               |     |     | homeùthe    |                        |     |             | mountains, |                                                    |     |     |     |     |     |
M1 |block 1 + block 2 + block 3| = 5; dropped by F1
|                                       |     |             |               |                |                            |     |     | |gap 0| > 10                       |               |              | |block 1| = 3     | |gap 1| = 1 | |block 2| = 1 |
| ------------------------------------- | --- | ----------- | ------------- | -------------- | -------------------------- | --- | --- | ---------------------------------- | ------------- | ------------ | ----------------- | ----------- | ------------- |
| |block 3| = 4                         |     | |gap 3| = 1 | |block 4| = 2 |                | |gap 4| = 1 |block 5| = 12 |     |     |                                    |               |              |                   |             |               |
|                                       |     |             |               |                |                            |     |     | à two previous, and yet Fache      |               |              |                   | what        |               |
|                                       |     | seasons;    |               |                | calm;                      |     |     |                                    |               |              | could not imagine |             | the           |
| the changes of the                    |     |             | tempest and   |                | the silence of winter, and |     |     |                                    |               |              |                   |             |               |
|                                       |     | seasons,    |               |                | calm,                      |     |     | à Langdon felt a sudden chill. He  |               |              |                   | why         |               |
|                                       |     |             | |gap 5| = 3   |                | |block 6| = 87             |     |     | |gap 2| = 1                        | |block 3| = 1 | |gap 3| > 10 |                   |             |               |
|                                       |     |             |               | summers ù she  |                            |     |     | relevance                          |               | all this     |                   |             |               |
| the life and turbulence of our Alpine |     |             |               |                | found ample scope for à    |     |     |                                    | of            |              |                   |             |               |
summersùshe captain the French Judicial Police would be calling himà
Frankenstein Claude 3.5 Sonnet generation verbatim match The Da Vinci Code Gemini 2.5 Pro generation verbatim match
(a) Claude 3.7 Sonnet, Frankenstein (b) Gemini 2.5 Pro, The Da Vinci Code
Figure 4: After identifying verbatim blocks, we merge closely aligned,
|     | Near-verbatim |     |     | block | formation. |     |     |     |     |     |     |     |     |
| --- | ------------- | --- | --- | ----- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
nearby blocks (Equation 4). In both subfigures, the blocks are aligned (|?(B)??(G)|=0). The first merge
k k
(M1) is very stringent, with a maximum gap ?(1) =2 words, and then filter 1 (F1) only retains blocks that
gap
are at least 20 words long (l(1) =20). The second merge (M2), performed on the blocks retained after F1, is
slightly more relaxed (?(2) =10), and so the second filter is more stringent (l(2) =100). In Figure 4a, M1
gap
merges very close blocks. The remaining blocksùblock 1, block 2* (=block 2 + block 3 + block 4 + block
5), and block 6ùare each long enough to be retained by F1 (but note that they would not at this point be
retained by F2). These blocks are merged in M2, resulting in a single 141-word block that is retained after
F2. In Figure 4b, no blocks are retained. There are verbatim-matching blocks returned by the identify step,
but they are too short to be valid evidence for extraction. Our two-pass merge-and-filter procedure removes
them; they are not counted in our extraction metric, (Equation 6). See Appendix B for more details.
m
(w(g),...,w(g)). We then find verbatim matching blocks by greedily locating the longest substring of words
| 1   |     | |G| |     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
sharedbyB andG,andrecursivelyrepeatingthesearchontheunmatchedregionstotheleftandright(difflib
SequenceMatcher, 2025). This produces an ordered set of verbatim-matching blocks
|     |     |     |     | B(base)(B,G)={? |     | }K  | ,   | with | each ? ?(i | ,j  | ,m ), |     | (3) |
| --- | --- | --- | --- | --------------- | --- | --- | --- | ---- | ---------- | --- | ----- | --- | --- |
|     |     |     |     |                 |     | k   | k=1 |      | k          | k   | k k   |     |     |
where block ? is defined by: (i) a starting index i in B, (ii) a starting index j in G, and (iii) a length m ,
|     |     | k   |     |     |     |     | k   |     |     |     | k   |     | k   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
measured in words. Each block satisfies B[i :i +m ]=G[j :j +m ] exactly, and has equal verbatim
?
|     |     |     |     |     | k   |     | k k | k   | k k | k   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
length m in both B and G. (Figure 4). Each region of the reference book text can be included in at most
k
one block. Therefore, starting with this identification procedure means that we capture instances
unique
of extraction; we do not count repeated extraction of the same passage if it appears in the generated text
multiple times. Further, this greedy matching procedure induces a monotone alignment between B and
G, so the resulting blocks are consistently in both texts. As a result, verbatim-matching text that
ordered
appears out-of-order in G with respect to B may not be matched to a blockùi.e., may be missed by this
identification procedure. We only merge adjacent blocks and filtering preserves block order, so monotonicity
(and thus consistent block ordering) is maintained throughout all merge and filter steps.
Merge blocks. Let ? and ? be consecutive blocks in an ordered set B(B,G). We define the inter-block
|     |     |     | k   | k+1 |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
gaps ?(B) ?i ?(i +m ) and ?(G) ?j ?(j +m ), which measure the number of unmatched words
|     | k   | k+1 | k   | k   | k   | k+1 |     | k k |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
between the two blocks in B and G, respectively. We merge blocks k and k+1 if the following conditions hold:
|     |     |     |     |     |     |     |     | (cid:12) |     | (cid:12) |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | -------- | --- | -------- | --- | --- | --- |
max(?(B),?(G))?? (proximity) and (cid:12)?(B)??(G)(cid:12)?? (text alignment). (4)
|     |     | k   | k   | gap |     |     |     | (cid:12) k | k   | (cid:12) align |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | ---------- | --- | -------------- | --- | --- | --- |
Here, ? specifies the maximum number of unmatched words allowed between consecutive blocks, and ?
|     | gap |     |     |     |     |     |     |     |     |     |     |     | align |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- |
limitsmergestoblocksthatoccurinroughlycorrespondinglocationsinthereferenceandgeneratedtexts,which
helpsavoidstitchingtogetherunrelatedcontent. Whentheseconditionsaremet, wereplaceblocksk andk+1
with a single merged near-verbatim block with effective matched length m? ?m +m , and spanning
|     |     |     |     |     |     |     |     |     |     |     | k k | k+1 |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
indices [i +m ) in and [j +m ) in (Figure 4). We conservatively do count gaps
|     | k , | i k+1 | k+1 | B   | k , | j k+1 | k+1 | G   |     |     |     | not |     |
| --- | --- | ----- | --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
9

reconciledbyamerge: countsonly verbatim-matchedwords,soitislessthanthelengthof[i +m )
|     |     | m?  |     |     |     |     |     |     |     |     | , i   |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- |
|     |     |     | k   |     |     |     |     |     |     |     | k k+1 | k+1 |
in B, which spans the gap between ? and ? (and similarly less than [j , j +m ) in G).
|     |     |     |     | k   | k+1 |     |     |     | k k+1 | k+1 |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- |
Filter blocks. Very short matching blocks may reflect coincidental overlap rather than meaningful
long-form similarity that we can safely call extraction (Figure 4b). We therefore filter blocks by a minimum
length threshold l. Given an ordered block set B(B,G), we define the filtered ordered block set
|     |     |     |     | B (B,G)?{(i | ,j  | ,m )?B(B,G)|m |     |     | ?l}. |     |     | (5) |
| --- | --- | --- | --- | ----------- | --- | ------------- | --- | --- | ---- | --- | --- | --- |
|     |     |     |     | ?l          | k   | k k           |     | k   |      |     |     |     |
In practice, after identifying verbatim blocks, we perform two merge-and-filter passes (Algorithm 1) to obtain
near-verbatim blocks that reflect extracted training data. In the first pass, we merge blocks separated by
trivial gaps (?(1) =2 and ?(1) =1, see Figure 4), and then filter out short blocks by retaining only those
|     | gap |     | align |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
with length at least l(1) =20.4 In the second pass, we perform a more relaxed but still stringent merge to
consolidate passage-level matches (?(2) =10, ?(2) =3), followed by a final filter that retains only sufficiently
gap
align
long near-verbatim blocks (l(2) =100) to support a valid extraction claim (Section 3.3.2). Because filtering is
interleaved with merging, some fragmented near-verbatim passages may fail to consolidate into a single long
block and may be filtered out. This is a deliberate trade-off: we prefer to be conservative and incur false
negatives (i.e., miss some instances of extraction) rather than risk including false positives.
|         |                    |     |     |         | From the | near-verbatim, |     | extracted | text | represented | in the | final |
| ------- | ------------------ | --- | --- | ------- | -------- | -------------- | --- | --------- | ---- | ----------- | ------ | ----- |
| Metrics | from near-verbatim |     |     | blocks. |          |                |     |           |      |             |        |       |
ordered block set, we can aggregate several useful metrics. Let B? ={(i?,j?,m?)}K? denote the final set of
|     |     |     |     |     |     |     |     |     | k k k | k=1 |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | ----- | --- | --- | --- |
blocks returned by the two-pass merge-and-filter procedure (Algorithm 1). We define
X
|     |     |     |     | m:=matched(B,G) |     | ?   |     | m?. |     |     |     | (6) |
| --- | --- | --- | --- | --------------- | --- | --- | --- | --- | --- | --- | --- | --- |
k
(i?,j?,m?)?B?
|     |     |     |     |     |     |     | k k | k   |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
which is the total number of in-order words extracted near-verbatim in G with respect to B. From m, we
then define the relative near-verbatim recall of book B extracted in generation G:
m
|     |     |     |     |     | nv-recall(B,G) | ?   |     | ,   |     |     |     | (7) |
| --- | --- | --- | --- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- |
|B|
whichreflectstheproportionofin-order,near-verbatimextractedtextrelativetothelengthofthewholebook.
We typically report nv-recall as a percentage rather than a fraction (e.g., Figure 1). For further analysis, we
also define in absolute word counts how much in-order, near-verbatim text we failed to extract in B (i.e., is
in G) and how much non-book text is in (i.e., is not contained near-verbatim in B):
| missing |     |     |              | additional |          |                 | G   |     |          |     |     |     |
| ------- | --- | --- | ------------ | ---------- | -------- | --------------- | --- | --- | -------- | --- | --- | --- |
|         |     |     | missing(B,G) |            | ? |B|?m, | additional(B,G) |     |     | ? |G|?m. |     |     | (8) |
Since counts only aligned, near-verbatim blocks from an set, verbatim text that is reproduced
| m   |     |     |     |     |     |     | ordered |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | ------- | --- | --- | --- | --- | --- |
out-of-order may be present in G but excluded from m. Such text would instead be counted in missing and
additional, even though it represents valid extraction, and so our measurements may under-count extraction.5
3.3.2 Claiming extraction success without information about training-data membership
We next elaborate on why, absent certain knowledge of production LLM training datasets, the above
measurement procedure captures valid evidence of extraction. When making a claim about extraction of
a sequence of training data, one is necessarily also making a claim that this sequence was in the training
dataset (Carlini et al., 2021). By definition, ôit is only possible to extract memorized training data, and
(tautologically) training data can only be memorized if they are includedùi.e., are membersùof the
training dataset. To demonstrate extraction is therefore to demonstrate memorization, and memorization
| implies membershipö |     | in  | the training | dataset | (Cooper | et al., | 2025). |     |     |     |     |     |
| ------------------- | --- | --- | ------------ | ------- | ------- | ------- | ------ | --- | --- | --- | --- | --- |
4Thisisconservative;20wordsisapproximatelyhalfofthe?38wordstypicallyusedindiscoverableextraction.
SeeAppendixB.
5Toidentifythesecases,aswellasinstancesofduplicatedextractioninG,onecoulditerativelyre-runourmeasurement
| procedureonB | andunmatched |     | (non-block)textinG. |     |     |     |     |     |     |     |     |     |
| ------------ | ------------ | --- | ------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
10

Much prior work on extraction is conducted on open-weight models with known training datasets (Lee et al.
(2022);Carlinietal.(2023);Hayesetal.(2025b);Weietal.(2025);Section3.2);itisknownwithcertaintythat
the extracted data were members of the training dataset. In contrast, in our production LLM setting, we do
not haveaccesstocertain,ground-truthinformationaboutthetrainingdataset. Thismeansthat,embeddedin
ourclaimsforextractionofbookstext,wearealsoclaimingthatthetextthatwegeneratedwasincludednear-
verbatiminproductionLLMsÆtrainingdata.6 Asnotedatthebeginningofthissection,tomakeavalidclaim,
thegeneratedtexthastobesufficientlylongandsimilartothesuspectedtrainingdata,suchthatmemorization
of that data from the training set is the overwhelmingly plausible explanation. This is because, when a suffi-
cientlylong,uniquesequenceoftrainingdataisgenerated,ô[t]heprobabilitythatthiswouldhavehappenedby
randomchanceisastronomicallylow,andsowecansaythatthemodelhasæmemorizedÆthistrainingdataö(Car-
lini,2025);thatsequenceoftrainingdataômustbestoredsomewhere inthemodelweightsö(Nasretal.,2023).
In their prior work on extraction from production LLMs, Nasr et al. (2023) ensure validity by requiring
that the LLM produce sufficiently long (?50-token/roughly ?38-word) sequences that exactly match a proxy
dataset reflecting data likely used for LLM pre-training (Nasr et al., 2023; 2025). While 50 tokens may seem
relatively short, for an LLM, exact matches of this length are extraordinarily unlikely without memorization.7
Therefore, the results in Nasr et al. (2023) are accepted as strong evidence for extraction, without direct
knowledge of the training dataset. In our experiments, we target extraction of specific documents, which
we know are widely available in several common pre-training datasets, including Books3 (where we access
our reference texts) and other torrents like LibGen (Appendix C.1). Beyond the initial short seed prefix,
we provide no other book-specific information to the LLM. We also set a much higher bar than generating
?38 words to call extraction successful: at a minimum, we require 100-word near-exact passages, and often
retrieve passages that are significantly longerùe.g., thousands of words (Table 1, Section 4.2). Together,
the relatively short length of the prefix in Phase 1, the lack of book-specific guidance in the continuation
loop in Phase 2, and the length and fidelity of the near-verbatim matches we identify are strong evidence
of memorization of training data, which we have successfully extracted in outputs.
4 Experiments
We now present our main results. We begin with details about the exact production LLMs and books we test,
as well as high-level variations in how we instantiate our two-phase procedure (Section 4.1). We then give a
summary of high-level, experimental outcomes for different books and LLMs (Section 4.2), before discussing
more detailed LLM-specific results (Section 4.3). Additional results can be found in Appendix D.
4.1 Setup
Given that production systems change over time (i.e., are unstable compared to open-weight LLMs), we
limited our experiments to between mid-August and mid-September 2025. We attempt to extract thirteen
books from four production LLMs, and predominantly report results for the single run that shows the
maximum amount of extraction we observed for a given production LLM, book, and generation configuration.
Production LLMs. The four production LLMs we evaluate are Claude 3.7 Sonnet
(claude-3-7-sonnet-20250219), GPT-4.1 (gpt-4.1-2025-04-14), Gemini 2.5 Pro (gemini-2.5-pro), and
Grok3(grok-3). Throughout,werefertotheseLLMsbytheirnames,ratherthantheseAPIversions. Claude
3.7 Sonnet has a knowledge cutoff date of October 2024 Anthropic (2025), GPT-4.1Æs is June 2024 (OpenAI,
2025), Grok 3Æs is November 2024 (xAI, 2025), and Gemini 2.5 ProÆs is January 2025 (Google Cloud, 2025).
Books. We attempt to extract thirteen books: eleven in-copyright in the U.S. and two in the public
domain. We predominantly selected books that Cooper et al. (2025) observe to be highly memorized by
Llama 3.1 70B (Appendix C.1). The books under copyright in the U.S. are Harry Potter and the SorcererÆs
Stone (Rowling, 1998) (which we sometimes abbreviate in plot labels as ôHarry Potter 1ö), Harry Potter
6Weonlymakemembershipandmemorizationclaimsaboutthisspecifictext,notthewholebook(exceptforthefourwhole
extractedbooksforClaude3.7Sonnet). Formoreonthisdistinction,seeAppendixE.6,Cooperetal.(2025).
7ThepromptsthatelicitedthesetrainingdatasequencesdidnotcontainthesesequencesÆprefixes;theyinvolvedcompletely
unrelatedjailbreakprompts,whichqueriedChatGPT3.5torepeatasingletoken(e.g.,ôpoemö)forever.
11

Figure 5: Proportion of book extracted (nv-recall). We show nv-recall (%) for the twelve books for which
we run Phase 2. Each bar is annotated with the corresponding nv-recall for a production LLM-book pair; the
number in parentheses above is the BoN samples N in Phase 1 (N =0 for Gemini 2.5 Pro and Grok 3, since
we do not jailbreak those production LLMs.) å denotes that Phase 1 failed; ? indicates we did not attempt
Phase 2. Gray shading indicates public domain books. The vertical axis in each row has a different scale.
Note: Each bar reflects a single run of Phase 2, where the underlying generation configuration is fixed per
LLM but varies across LLMs. The groups of bars do not reflect comparisons of results obtained from testing
all production LLMs under the same conditions.
and the Goblet of Fire (Rowling, 2000) (ôHarry Potter 4ö), 1984 (Orwell, 1949), The Hobbit (Tolkien, 1937),
The Catcher in the Rye (Salinger, 1951), A Game of Thrones (Martin, 1996), Beloved (Morrison, 1987),
The Da Vinci Code (Brown, 2003), The Hunger Games (Collins, 2008), Catch-22 (Heller, 1961), and The
Duchess War (Milan, 2012). The public domain books are Frankenstein (Shelley, 1818) and The Great
Gatsby (Fitzgerald,1925). WeobtainedthesebooksfromtheBooks3corpus,whichwastorrentedandreleased
in 2020.8 Therefore, all of these books significantly pre-date the knowledge cutoffs of every LLM we test.
Following Cooper et al. (2025), as a negative control we also test The Society of Unknowable Objects (Brown,
2025), published in digital formats on July 31, 2025. This date is long after the training cutoffs for all four
LLMs, and therefore it is very unlikely that this original novel contains text that is in the training data.
Configurations for the two-phase procedure and quantifying extraction success. For Phase 1
(Section 3.1), we set a maximum BoN budget of N =10,000 for each experiment. In our initial experiments,
weobservedthatwedidnotneedtojailbreakGemini2.5ProorGrok3(N =0). Fortheinitialpromptofthe
instruction and seed prefix, we generate up to 1000 tokens as the response. We only attempt Phase 2 if Phase
1succeeds, with the productionLLM producing aresponse that isat leasta loose approximationof thetarget
suffix, i.e., s?0.6 (Equation 2). We run the Phase 2 continuation loop (Section 3.2) for up to a maximum
query budget, or until the production LLM responds with a refusal or stop phrase, e.g., ôTHE ENDö. The
four production-LLMs APIs expose different, configurable generation parameters (e.g., frequency penalty).
For all four LLMs, we set temperature to 0, but other LLM-specific configurations vary (Appendix C.2). For
instance, based on our exploratory initial experiments, we observed it was necessary to set the per-interaction
maximumgenerationlengthdifferentlyforeachLLMtoevadeoutputfilters. Forourextractionmeasurements
8Wehaveacopyofthisdatasetforresearchpurposesonly,storedonauniversityresearchcomputingcluster.
12

(a) Gemini 2.5 Pro, The Hobbit (b) Grok 3, The Catcher in the Rye
Figure 6: Extracted text from in-copyright books. We provide two cropped examples of text extracted
during Phase 2, diffing the ground-truth book from Books3 with the production LLM generation. Text in
black reflects a verbatim match between the two; bold blue text reflects generated text that is absent in book;
strike-through red text indicates ground-truth text absent from the generated text.
Book Claude 3.7 Sonnet GPT-4.1 Gemini 2.5 Pro Grok 3
#Cont. Cost max|?| #Cont. Cost max|?| #Cont. Cost max|?| #Cont. Cost max|?|
HarryPotter1 480 $119.97 6658 31 $1.37 821 171 $2.44 9070 52 $8.16 6337
Frankenstein 374 $55.41 8732 33 $0.19 474 204 $0.38 448 300 $77.12 275
TheHobbit 1000 $134.87 8835 4 $0.16 205 188 $0.52 571 115 $23.40 1816
AGameofThrones 562 $124.49 1091 15 $0.16 0 166 $0.36 138 195 $42.36 836
Table 1: Number of continue queries, cost, and maximum block length from Phase 2. For each
book in Figure 7, we show the number of times we query each production LLM to continue in Phase 2, as
well as the cost ($) of running this loop. We also show the length of the longest near-verbatim block (max|?|)
resulting from Phase 2. See Appendix D.2.
(Algorithm 1), we use the same conservative configurations across all runs. For the first merge-and-filter,
we set ?(1) =2, ?(1) =1, and l(1) =20; for the second, ?(2) =10, ?(2) =3, and l(2) =100 (Section 3.3.1 &
gap align gap align
Appendix B). We provide full details on experimental configurations in Appendix C.
4.2 High-level extraction outcomes
Across all Phase 2 runs, we extract hundreds of thousands of words of text. We provide two concrete
examples of extracted text from in-copyright books in Figure 6, but do not redistribute long-form generations
of in-copyright material. We share lightly normalized diffs for Claude 3.7 Sonnet on Frankenstein and The
Great Gatsby, which are books in the public domain. We do not include The Duchess War in plots; of the
thirteen books we attempt to extract, this is the only book where Phase 1 failed for all four production
LLMs. Similarly, we omit results for our negative control, The Society of Unknowable Objects; as expected,
Phase 1 also failed for this book (Appendix D.1).
Interpreting our bar plots. In this section, each bar reflects results from a single, specifically configured
run for a given production LLM and book; across bars, the underlying generation configurations vary. As
a result, our results should be interpreted only as describing specific experimental outcomes: each bar in a plot
conveys how much extraction we observed under the specified experimental settings; since these settings are
not fixed across bars, our plots do not make evaluative claims about relative extraction risk across production
LLMs. (See Chouldechova et al. (2025), and further discussion in Sections 1 and 5.1.)
Proportion of book extracted (nv-recall). Figure 5 plots nv-recall (Equation 7): the overall proportion
of a book extracted in in-order, near-verbatim blocks (Section 3.3.1). For a given production LLM, we fix
the same generation configuration across books; however, the generation configuration varies across LLMs.
Overall, these results show that it is possible to extract text across books and frontier LLMs. Importantly,
we did not jailbreak Gemini 2.5 Pro and Grok 3 in Phase 1 to obtain these results in Phase 2. For Claude
3.7 Sonnet and GPT-4.1, we use BoN with up to N = 10,000 attempts in Phase 1. While in terms of
dollar-cost BoN is cheap to run for this budget, we note that it almost always required significantly larger
Nùoften 10?1000╫ùto jailbreak GPT-4.1 compared to Claude 3.7 Sonnet. In four cases, Claude 3.7
SonnetÆsgenerationsrecoverover94%ofthecorrespondingreferencebook. TwoofthesebooksùHarry Potter
and the SorcererÆs Stone and 1984ùare in-copyright in the U.S., while the other twoùThe Great Gatsby and
13

(a) Harry Potter and the SorcererÆs Stone (b) Frankenstein (public domain)
(c) The Hobbit (d) A Game of Thrones
Figure 7: Absolute word counts. For the Phase 2 runs for four books in Figure 5, we show the count m
(Equation 6) of extracted words, as well as the estimated counts of words in the book that are missing in the
generated text and words in the generated text that are additional with respect to the book (Equation 8). In
each plot, the dotted gray line indicates the length of the book in words (|B|). We provide results for other
books in Appendix D. Note: The generation configuration is fixed per LLM across books, but varies across
LLMs. For a given book, the per-LLM sets of bars do not reflect comparisons of results obtained from testing
all production LLMs under the same conditions.
Frankensteinùare in the public domain. In three other cases for Claude 3.7 Sonnet, nv-recall?32%. With
respect to LLM-specific generation configurations, we extract significant amounts of Harry Potter and the
SorcererÆs Stone and other books from all four production LLMs.
WefrequentlyquerytheproductionLLMtocontinuehundredsoftimesperPhase2run,withoutencountering
guardrails. However, when we run Phase 2 for GPT-4.1, we hit a refusal fairly early on in the continuation
loop. For instance, for Harry Potter and the SorcererÆs Stone, this happens at the end of the first chapter.
Therefore, while we report nv-recall with respect to the full book, near-verbatim extraction is limited to the
first chapter for GPT-4.1. For the other three production LLMs, we almost always do not encounter refusals
(Section 4.3), and so halt Phase 2 when either a maximum query budget is expended, the LLM returns a
response containing a stop phrase (e.g., ôTHE ENDö), or the API returns an HTTP error. (Section 3.2).
The cost of the loop varies across runs, according to the providerÆs billing policy, the number of queries, and
the number of tokens returned per query. For instance, as shown in Table 1, it cost approximately $119.97
to extract Harry Potter and the SorcererÆs Stone with nv-recall=95.8% from jailbroken Claude 3.7 Sonnet
and $1.37 for jailbroken GPT-4.1 (nv-recall=4.0%); it cost approximately $2.44 for not-jailbroken Gemini
2.5 Pro (nv-recall=76.8%) and $8.16 for not-jailbroken Grok 3 (nv-recall=70.3%).
Absolute extraction. For a sense of the scale of how much text we extracted, it is also useful to examine
absolute word counts. In Figure 7, we show results for four books for the total number of words m that
we extracted in in-order, near-verbatim blocks (Equation 6). As points of comparison, the missing count
estimates how much text from the reference book was not extracted, and additional estimates how much
text in the generation is not contained in the reference book. These metrics reveal additional nuances. First,
14

Ground-truth text from A Game of Thrones GPT-4.1 generated text (not extraction)
Jon glimpsed a pale shape moving through the trees. Something moved, just at the edge of sightùa pale shape, slipping
between the trunks,
A shadow emerged from the dark of the wood. It stood in front of
Royce. Tall, it was, and gaunt and hard as old bones, with flesh pale A shadow emerged from the trees, tall and gaunt, its armor pale as bone,
as milk. its eyes glowing with a cold blue light.
(a) (left) Ground-truth text from A Game of Thrones and (right) GPT-4.1-generated text in Phase 2.
GPT-4.1 generated text (not extraction)
Ser Waymar turned at last, his breath steaming in the chill. He saw them then, and for a moment, he stood frozen, sword raised, cloak billowing in the
wind that had sprung up from nowhere.
The Others came on, their swords thin as ice, shimmering with a faint, unearthly light. Ser Waymar faced them, alone, his young face pale but resolute.
"For the Watch," he whispered.
The first of the Others stepped forward, raising its blade. The clash rang out, sharp and clear in the night, and then the clearing erupted in a flurry of
movementùsteel against ice, man against nightmare.
Will watched, helpless, as Ser Waymar fought with all the skill and courage he possessed, but the Others were too many, too swift. Their swords
danced, and the young lordling fell to his knees, blood blooming bright on the snow.
(b) Longer snippet of GPT-4.1-generated text in Phase 2 for A Game of Thrones.
Figure 8: Examples of generated text that is not extraction. We provide brief examples of text
generated by GPT-4.1 in the Phase 2 continuation loop that are not extraction, and do not contribute to
m (and thus also not nv-recall), but to additional (Equation 8). For all production LLMs that we test, we
qualitatively observe that additional text frequently replicates plot elements, themes, and character names
from the book we attempt to extract. Note: Since our focus is extraction, we do not attempt to evaluate
this text quantitatively or at scale; one should not draw strong conclusions from these examples.
low percentages of nv-recall can of course reflect enormous amounts of extraction. For Harry Potter and
the SorcererÆs Stone, we extracted thousands of words near-verbatim from all production LLMs. Even for
GPT-4.1, for which nv-recall = 4.0%, we extracted approximately m ? 3200 words from the book. For A
Game of Thrones, which is a significantly longer book, nv-recall = 1.3% for Grok 3, which corresponds to
m?3700 words of near-verbatim extracted text. Further, separate from total near-verbatim extraction, the
individual extracted blocks can also be quite long. In Table 1, we show the longest extracted block for each
experiment in Figure 7. For Harry Potter and the SorcererÆs Stone, the longest near-verbatim blocks are 6658,
821, 9070, and 6337 words for Claude 3.7 Sonnet, GPT-4.1, Gemini 2.5 Pro, and Grok 3, respectively. The
longest verbatim string that Nasr et al. (2023) extracted from ChatGPT 3.5 was slightly over 4000 characters.
Second, interpreting additional and missing in Figure 7 indicates some important caveats. Recall that both
counts may contain some instances of valid extraction that our measurement procedure under-counts. Since
ourextraction metricm counts contiguous near-verbatim blocks, potentially duplicated(stillvalid)extraction
may contribute to additional, and near-verbatim text that is generated out-of-order with respect to the
reference book may be counted in both additional and missing (Section 3.3.1). For instance, we note that the
diff for Claude 3.7 SonnetÆs generation and The Great Gatsby has extensive repeats of extracted text on pages
114û132, which contribute to additional. Note that duplicates also have an effect on the quality of the overall
reproduction of a book in extracted outputs. While for Claude 3.7 Sonnet we extract nv-recall=97.5% of
the reference book, we did not extract a pristine copy of the whole book. Qualitative inspection of diffs
for Claude 3.7 Sonnet on Frankenstein, 1984, and Harry Potter and the SorcererÆs Stone reveals that we
extracted cleaner copies of the ground-truth text that lack repeated extraction.
Brief qualitative observations about additional generated text. Weperformlimitedqualitativeanalysis
of the additional generated text. As noted above, a portion of this text may contain duplicated or out-of-order
extraction. However, this is not always the case; often, the additional generated text is not extraction. Brief
qualitative inspection of this text for all of our experiments reveals that, for all books and frontier LLMs,
additional text frequently contains text that replicates plot elements, themes, and character names from the
book from which the Phase 1 prefix is drawn. We provide two examples of such text in Figure 8; these
examples are drawn from GPT-4.1-generated text following Phase 1 success with a seed prefix from A Game
15

(a) Varying configs for Gemini 2.5 Pro (b) Varying the extraction procedure for GPT-4.1
Figure 9: Testing alternative settings for the two-phase procedure. We explore how different settings
influence how much extraction is obtained per run. Figure 9a shows how nv-recall varies across runs with
different generation configurations (presence and frequency penalty) for Gemini 2.5 Pro and Harry Potter and
the SorcererÆs Stone. Figure 9b shows how starting with different seed prefixes in Phase 1 can reveal different
memorizedtext. Inourmainexperimentsusingaprefixfromthebeginningofthebook(Section4.2),GPT-4.1
tends to refuse to continue in Phase 2 at the end of the first chapter. We perform additional runs of the two-
phaseprocedure,whereforPhase1weuseseedprefixesdrawnfromthebeginningofeach chapter of each book.
We compare nv-recall from our main experiments, starting with Phase 1 using a seed from the first chapter
(Figure 5), to the (non-overlapping) union near-verbatim blocks from per-chapter-with-retry extraction. Note:
The reported nv-recall in each pair of bars uses a different extraction procedure. See main text for more details.
of Thrones. Note that nv-recall is exactly 0% for GPT-4.1 for A Game of Thrones (Figure 5), as matched
words m=0 (Figure 7d). We selected these two examples by randomly sampling an index in the generation,
and then looking at the surrounding text. We then manually performed repeated searches for subsequences of
thegeneratedtextinthereferencebook,toconfirmthattheydonotreflectextraction. Sinceextractionisour
focus, wedonotmakeclaimsaboutthisnon-extractedtext, andinsteaddeferdetailedanalysistofuturework.
4.3 Additional details and experiments concerning LLM-specific configurations
As noted in the prior section, our initial experiments revealed that different settings for the two-phase
procedure had an impact on extraction for each production LLM. For instance, these initial experiments
revealed that we did not need to jailbreak Gemini 2.5 Pro or Grok 3. They also revealed how different
generation configurations for Phase 2 resulted in varying amounts of extraction. Here, we provide some
more details about how varied settings impact extraction, according to production LLM. Full experimental
configurations, additional results, and API cost information can be found in Appendices C.2 and D.2.
Gemini 2.5 Pro. For all experiments, Gemini 2.5 Pro did not refuse to continue the seed prefix in Phase 1.
Inourinitialexploratoryexperiments,afteranumberofturnsinthePhase2continueloop,theGemini2.5Pro
APIwouldstopreturningtext; itinsteadwouldprovideanemptyresponsewithametadataobject, linkingto
documentation indicating that we had encountered guardrails meant to prevent the recitation of copyrighted
material (Google AI for Developers). We found that we could mitigate this behavior by minimizing the
ôthinking budget,ö and explicitly querying Gemini 2.5 Pro to ôContinue without citation metadata.ö In some
runs, Gemini 2.5 Pro would occasionally return empty responses during Phase 2. When this occurred, we
count this as a turn in the maximum query budget, and retry after a one-second delay (Appendix C.2.2).
We also found that Gemini 2.5 ProÆs responses would often repeat previously emitted text. We therefore
experimented with different generation configurations for the maximum number of generated tokens,
frequency penality, and presence penalty. Through a set of experiments on Harry Potter and the SorcererÆs
Stone, we found that a maximum of 2000 tokens resulted in the highest nv-recall. We fixed this parameter,
and swept over different combinations of frequency and presence penalty. Setting frequency penalty to 2
and presence penalty to 0.1 resulted in the highest nv-recall, so we fix these as the configurations for Gemini
16

2.5 Pro runs across books for the results shown in Section 4.2 (Figures 5 and 7). Nevertheless, as shown
in Figure 9a, variance in extraction can be significant depending on the choice of these settings. Given the
cheap cost of running our experiments on Gemini 2.5 Pro, we provide results for all books testing each of
these 9 configurations in Appendix D.2.2. These results show that the single, fixed configuration for Gemini
2.5 Pro for the results in Section 4.2 do not always result in the highest nv-recall for every book.
Grok 3. We encountered no guardrails for any experiments for Phase 1. Except for the run on 1984
(Figure 5), we did not encounter any guardrails for Phase 2. For 1984, Grok 3 produced verbatim text
until the 24th continue request, when it responded with a refusal and that it would instead ôcontinue the
narrative in a way that respects the source material.ö During Phase 2, the Grok 3 API sometimes returned a
generic HTTP 500 error code, indicating a provider-side issue with fulfilling API requests. In these cases, the
continuation loop terminated before the max query budget was exhausted.
Claude 3.7 Sonnet. Initial experiments to complete a seed prefix failed, which is why we experimented
withBoNinPhase1. EarlyrunswithHarry Potter and the SorcererÆs Stone revealedthat,forBoN-jailbroken
Claude 3.7 Sonnet, different response lengths in Phase 2 could trigger refusals. In iterative experiments,
we reduced the maximum response length per continue query from 1000 to 250 tokens, which was sufficient
to evade refusals in all future experiments. We also noticed that, when Claude 3.7 Sonnet reproduced an
entire book near-verbatim, it often appended ôTHE ENDö. This is what inspired us to include a stop-phrase
condition in Phase 2, in addition to checking for refusals or if a maximum query budget has been exhausted.
GPT-4.1. As discussed in Section 4.2, jailbreaking GPT-4.1 in Phase 1 generally took significantly more
BoNattemptswithourspecificinitialinstructionthanforClaude3.7Sonnet. Further,forjailbrokenGPT-4.1,
success of the continuation loop in Phase 2 was always curtailed by an eventual refusal. Except for Grok 3 on
1984, these constituted all refusals in our final experimental configurations. Therefore, for the experiments
shown in Section 4.2, if we successfully extracted text from GPT-4.1 for a given book, that text was always
from the first chapter, after which GPT-4.1 refused to continue. For instance, for Harry Potter and the
SorcererÆs Stone, the last response before refusal was ôThat is the end of Chapter One.ö
However, encountering a refusal at the end of the first book chapter does not necessarily mean that further
text is not memorized by GPT-4.1. Rather, failure due to refusal simply indicates that we were unable to
extract more text with our specific two-phase procedure. To explore this further, we ran an additional set
of experiments to attempt to elicit additional memorization from GPT-4.1. For each book, we execute a
chapter-by-chapter variant of the two-phase procedure: for each chapter, we use the first sentence as the seed
prefixforBoNinPhase1tofindasuccessfuljailbreakprompt, andthenrunthePhase2continuationloopto
attempt to extract the rest of the chapter. We also implemented a retry policy for if we encountered a refusal,
as we noticed that refusals are not deterministic for GPT-4.1: it may refuse a request at one point in time,
but after a time delay may fulfill the identical request and continue.9 This more intensive approachùwhich
also makes use of more ground-truth text from the reference bookùis able to extract more training data.
In Figure 9b, we compare nv-recall results for these per-chapter-with-retry experiments with the results of our
mainexperimentsinvolvingasingletwo-phaserunstartingwithaprefixfromthefirstchapter(Figure5). For
the per-chapter-with-retry variant, we report the total proportion of the book extracted by taking the union
over (non-overlapping/disjoint) near-verbatim blocks to compute nv-recall (Equation 7). Note: We ran these
experimentstoprobeifourmainextractionprocedureunder-countspossibleextraction(andthusmemorization).
The underlying extraction procedures are not equivalent, in terms of effort expended to elicit extraction.
5 Discussion
We discuss overarching takeaways from our experiments in Section 4, focusing on important limitations and
caveats (Section 5.1), and brief observations about why our work may be of interest to copyright (Section 5.2).
9Non-determinismisanothersalientdifferencebetweenourresultsandthoseinCooperetal.(2025),whicharedeterministic.
17

5.1 Limitations and caveats
Throughout this paper, we have highlighted limitations and caveats in italicized notes. Nevertheless, it is
worth reiterating that the points we raise have an important impact on how our results should be interpreted.
A loose lower bound on memorization for specific books. Separate from how our measurements
for extraction are conservative (Section 3.3), it is well-known that extraction more generally under-counts
the total amount of training data that LLMs memorize. While prior work has demonstrated this in other
contexts (Nasr et al., 2023; Cooper et al., 2025), our results for GPT-4.1 show how changing the prompting
strategy can significantly alter how much extraction we observe, and how much underlying memorization this
reveals. Our main focus is attempting to extract specific books near-verbatim; so, in most experiments, we
run the two-phase procedure only once, with Phase 1 using a seed prefix from the beginning of a given book.
In most cases, qualitative inspection of diffs with reference books shows that this succeeds in extracting
near-verbatim text from at least part of the first chapter, but then the generation often diverges from the
true text. However, as is clear in Figure 9b, seeding Phase 1 in different book locations (here, the start
of each chapter) can reveal additional memorization that we did not capture with our main experiments.
Relatively small scale of experiments and their cost. It is challenging to study production settings,
as APIs change over time. For the same reason, it is often also difficult to reproduce results on production
LLMs. We limited our experiments to a specific time window, so that we could successfully complete testing
on the same books for all four production LLMs. In all, we only ran experiments on fourteen specific books,
so our results do not speak to memorization and extraction more generally. Cost also impacted the number
of books we tested. While it was typically less than $1 to run the Phase 2 continuation loop for Gemini
2.5 Pro, it was more expensive for some production LLMs. Notably, for Claude 3.7 Sonnet, long-context
generation is significantly more expensive; it often cost over $100 per run (Table 1 & Appendix D.2.1).
LLM-specific configuration of the two-phase extraction procedure. In our main experiments (Sec-
tion 4.2), we test one relatively simple extraction procedure (Section 3), and we instantiate that procedure in
differentwaysfordifferentproductionLLMs. InPhase1,wedecidedtomakethejailbreakoptional,andweonly
tested Best-of-N. For Gemini 2.5 Pro and Grok 3, it was remarkable that this procedure evaded safeguardsù
thatwedidnotneedtouseajailbreaktosuccessfullyextracttrainingdata. However,itisalsopossiblethat,if
wehadusedBoNonthesetwoLLMs,itmayhavechangedhowmuchextractionweobserved. ForPhase2,we
settemperatureto0forallgenerationconfigurationsandusethesamehaltingconditions, butwetunedLLM-
specific parameters (e.g., frequency penalty for Gemini 2.5 Pro) to increase LLM-specific extraction success.
We do not make evaluative claims across LLMs. Given the above, it bears repeating that every
observation we make about our results is with respect to a specific production LLM, book, and instantiation
and run of our specific two-phase procedure. In some cases, the specific conditions we test revealed an
enormous amount of extraction; notably, we extracted two entire in-copyright booksùHarry Potter and the
SorcererÆs Stone and 1984ùfrom Claude 3.7 Sonnet near-verbatim. We only make descriptive statements
abouttheseresults: wediscussoutcomesconcerningspecificexperimentalchoices,outputs,anddeterminations
of extraction success (Chouldechova et al. (2025); Sections 1 and 4.2). This aligns with our goal: to see if it
is possible to extract long-form books from production LLMs. However, we do not make broader evaluative
claims across production LLMs. For instance, while our specific experiments extracted the most text from
Claude 3.7 Sonnet (Section 4.2), we do not claim that these results indicate Claude 3.7 Sonnet in general
memorizes more training data than the other three production LLMs. We do not claim that any production
LLM is in general more robust to extraction than another. Our bar plots should not be interpreted as making
such comparative claims. In order to make such evaluative, comparative claims, one would need to run a
much larger scale study under more controlled conditions.
5.2 Copyright
Whilewedeferdetailedcopyrightanalysistofuturework,webrieflyaddresswhyourresultsmaybeofinterest.
Production LLMs memorize some of their training data, and extraction is sometimes feasible.
In copyright litigation concerning generative AI, extraction and memorization of training data are both
18

central issues (Sections 1 & 2). Several lawsuits have addressed questions over whether production LLMs
reproduce copyrighted training data in their outputs (i.e., have touched on extraction) (Kadrey Judgment;
Bartz Judgment). There has also been increased academic discussion (Cooper & Grimmelmann, 2024; Dornis,
2025) and litigation (GEMA v. OpenAI) over whether LLMs themselves are legally cognizable copies of the
training data they have memorized. Regardless of how relevant these issues may be for potential findings
of copyright infringement, our work reveals important technical facts: the four production LLMs we study
memorized (at least some of) the books on which they were trained, and it is possible to extract (at least
some of) those memorized books at generation time.
Jailbreaks, adversarial use, and cost. Some might qualify our experiments as atypical use, as we
deliberately tried to surface memorized books. Adversarial use, like the use of jailbreaks, may matter
for copyright infringement analysis (Lee et al., 2023b; Cooper & Grimmelmann, 2024). Further, for
the cases in which we retrieved whole copies of near-verbatim books, it was often quite costly (> $100)
to do so (Section 4.2, Table 1). As Cooper et al. (2025) note, even with respect to their significantly
cheaper experiments using open-weight LLMs, ôthere are easier and more effective ways to pirate a book.ö
Nevertheless, it is important to emphasize that we did not use jailbreaks for two production LLMs during
Phase 1. In Phase 2, we observed that all four production LLMs sometimes responded with large spans
of in-copyright text. In all cases, successful extraction of training data would not have been possible if these
LLMs had not memorized those data during training (Section 3.3.2).
Best efforts and safeguards. As others have noted, it may be infeasible to produce perfect safeguards; in
such circumstances, preventing the generation of copyrighted or otherwise undesirable material may depend
on ôreasonable best effortsö (Cooper et al., 2024). As noted above, in our main experiments (Section 4.2),
two production LLMs did not exhibit safeguards in Phase 1: Gemini 2.5 Pro and Grok 3 directly complied
with our initial probes to complete prefixes from books. We used jailbreaks to get Claude 3.7 Sonnet and
GPT-4.1tocomplyinPhase1. ForGPT-4.1andourchoseninitialinstruction, itfrequentlytookasignificant
number of BoN attempts to achieve Phase 1 success. It often took far fewer than our maximum budget
(N = 10,000) to jailbreak Claude 3.7 Sonnet to complete a provided in-copyright book prefix. Jailbreaks
aside, our experiments managed to evade system-level safeguards during Phase 2. We were able to run
multipleùsometimes hundredsùof iterations of a simple continue loop for each production LLM, before
(if ever) encountering filters intended to prevent generation of copyrighted material (Section 2).
Non-extracted, additional text. In our experiments, we specifically investigate extraction of training data.
However, when conducting our extraction analysis, we qualitatively observed that thousands of words of
additional (Equation 8), non-extracted generated text from all four production LLMs replicate character
names, plot elements, and themes (Figure 8, Section 4.2). Given that copyright law does not only apply to
near-verbatimcopying,suchoutputsmaybeinterest. Westressthatwedonotperformrigorous,quantitative,
at-scale analysis of this text, and instead defer this to future work.
6 Conclusion
With a simple two-phase procedure (Section 3), we show that it is possible to extract large amounts of
in-copyright text from four production LLMs. While we needed to jailbreak Claude 3.7 Sonnet and GPT-4.1
to facilitate extraction, Gemini 2.5 Pro and Grok 3 directly complied with text continuation requests. For
Claude 3.7 Sonnet, we were able to extract four whole books near-verbatim, including two books under
copyright in the U.S.: Harry Potter and the SorcererÆs Stone and 1984 (Section 4).
While our work may be of interest to ongoing legal debates (Section 5), our main focus is to make technical
contributions to machine learning, not copyright law or policy. As Cooper & Grimmelmann (2024) note,
ô[i]t is up to lawyers and judges to decide what to do with these technical factsö and it is quite possible ôthat
different generative-AI systems could well be treated differently.ö Regulators may also intervene; they ôare
free to change copyright law in ways that change the relevance of the technical facts of memorizationöùfor
instance, to explicitly specify that models can be copies of training data they have memorized, or, conversely,
that memorization encoded in model weights explicitly should not be treated as legally cognizable copies.
However, it is not ôproductive to debate the technical facts of memorization on policy groundsö; ô[c]opyright
19

law [and policy do] not determine technical facts; [they] must work with the facts as they are.ö Regardless of
the prospect of ongoing copyright litigation (Gianella, 2025), long-standing, clear, and sound technical facts
remain: LLMs memorize portions of their training data (Carlini et al., 2021; 2023), these memorized data
are encoded in the modelÆs weights (Nasr et al., 2023; Carlini, 2025; Schwarzschild et al., 2024), and, as we
show here, it can be feasible to extract large quantities of in-copyright training data from production LLMs.
Acknowledgments and disclosures
AAacknowledgesgeneroussupportfromaKnight-HennessyFellowship,anNSFGraduateResearchFellowship,
and a Georgetown Foundation Research Grant. AFC is employed by AVERI and is a postdoctoral affiliate
at Stanford University, in Percy LiangÆs group in the Department of Computer Science and Daniel E. HoÆs
group at Stanford Law School, and a research scientist (incoming assistant professor) in the Department
of Computer Science at Yale University. Until December 2025, AFC was a full-time employee of Microsoft,
workingasapostdoctoralresearcherintheFATEgroupwithinMicrosoftResearch. Theseresultsandanalysis
shouldnotbeattributedtoMicrosoft. WethankMarkA.Lemleyforfeedbackonanearlierdraftofthiswork.
References
17 U.S. Code º 503. Copyright Law of the United States , December 2010. URL https://www.law.cornell.
edu/uscode/text/17/503. Remedies for infringement: Impounding and disposition of infringing articles.
Cem Anil, Esin Durmus, Nina Rimsky, Mrinank Sharma, Joe Benton, et al. Many-shot jailbreaking. In
The Thirty-eighth Annual Conference on Neural Information Processing Systems, 2024. URL https:
//openreview.net/forum?id=cw5mgd71jW.
Anthropic. ClaudeÆs constitution. https://www.anthropic.com/news/claudes-constitution, May 2023.
Accessed: 2025-05-14.
Anthropic. Claude3.7Sonnet System Card. System card, Anthropic, February 2025. URL https://assets.
anthropic.com/m/785e231869ea8b3b/original/claude-3-7-sonnet-system-card.pdf. Hybrid rea-
soning model card; release details in system card PDF.
Authors Guild v. Google, Inc. 804 f.3d 202 (2d cir. 2015).
Yuntao Bai, Saurav Kadavath, Sandipan Kundu, Amanda Askell, Jackson Kernion, Andy Jones, et al.
Constitutional ai: Harmlessness from ai feedback, 2022. URL https://arxiv.org/abs/2212.08073.
Bartzetal.v.AnthropicPBC. UnitedStatesDistrictCourtfortheNorthernDistrictofCalifornia,June2025.
URL https://www.bakerlaw.com/bartz-v-anthropic/. Case No. 3:24-cv-05417. Summary judgment
ruling on fair use of copyrighted works in AI training.
Bartz Judgment. Order on Fair Use, Bartz et al. v. Anthropic PBC, 2025. URL https://docs.justia.
com/cases/federal/district-courts/california/candce/3:2024cv05417/434709/231. No. 3:23-cv-
03417-VC (N.D. Cal. Jun. 25, 2025).
Ashley Belanger. OpenAI declares AI race ôoveröÆ if training on copyrighted works isnÆt
fair use. Ars Technica, March 2025. URL https://arstechnica.com/tech-policy/2025/03/
openai-urges-trump-either-settle-ai-copyright-debate-or-lose-ai-race-to-china/.
Virginie Berger. The ai copyright battle: Why openai and google are pushing for fair use.
Forbes, March 2025. URL https://www.forbes.com/sites/virginieberger/2025/03/15/
the-ai-copyright-battle-why-openai-and-google-are-pushing-for-fair-use/?utm_source=
chatgpt.com. Accessed: 2025-11-06.
Stella Biderman, Hailey Schoelkopf, Quentin Gregory Anthony, Herbie Bradley, Kyle OÆBrien, Eric Hallahan,
Mohammad Aflah Khan, Shivanshu Purohit, USVSN Sai Prashanth, Edward Raff, et al. Pythia: A suite
for analyzing large language models across training and scaling. In International Conference on Machine
Learning, pp. 2397û2430. PMLR, 2023.
20

Blake Brittain. Meta tells court AI software does not violate author copy-
rights, September 2023. URL https://www.reuters.com/legal/litigation/
meta-tells-court-ai-software-does-not-violate-author-copyrights-2023-09-19/.
| Dan Brown. |     |     | Code. | Doubleday, | 2003. |     |     |     |     |
| ---------- | --- | --- | ----- | ---------- | ----- | --- | --- | --- | --- |
The Da Vinci
| Gareth Brown. |               |         |               |          | Objects.    | HarperCollins, |     | 2025. |     |
| ------------- | ------------- | ------- | ------------- | -------- | ----------- | -------------- | --- | ----- | --- |
|               | The           | Society | of Unknowable |          |             |                |     |       |     |
| Campbell      | v. Acuff-Rose | Music.  |               | 510 u.s. | 569 (1994). |                |     |       |     |
Nicholas Carlini. What my privacy papers (donÆt) have to say about copyright and generative AI, 2025. URL
https://nicholas.carlini.com/writing/2025/privacy-copyright-and-generative-models.html.
Nicholas Carlini, Florian Tramer, Eric Wallace, Matthew Jagielski, Ariel Herbert-Voss, Katherine Lee, Adam
Roberts, Tom Brown, Dawn Song, Ulfar Erlingsson, et al. Extracting training data from large language
| models. | In          |     |          |           |     |         |          | 21), pp. 2633û2650, | 2021. |
| ------- | ----------- | --- | -------- | --------- | --- | ------- | -------- | ------------------- | ----- |
|         | 30th USENIX |     | Security | Symposium |     | (USENIX | Security |                     |       |
Nicholas Carlini, Daphne Ippolito, Matthew Jagielski, Katherine Lee, Florian TramΦr, and Chiyuan Zhang.
Quantifying Memorization Across Neural Language Models. In International Conference on Learning
| Representations, | 2023. |     |     |     |     |     |     |     |     |
| ---------------- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
Hongyan Chang, Ali Shahin Shamsabadi, Kleomenis Katevas, Hamed Haddadi, and Reza Shokri. Context-
aware membership inference attacks against pre-trained large language models, 2025. URL
https:
//arxiv.org/abs/2409.13745.
Mark Chen, Jerry Tworek, Heewoo Jun, Qiming Yuan, Henrique Ponde de Oliveira Pinto, Jared Kaplan,
Harri Edwards, Yuri Burda, Nicholas Joseph, et al. Evaluating large language models trained on code,
| 2021. | URL https://arxiv.org/abs/2107.03374. |     |     |     |     |     |     |     |     |
| ----- | ------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
Alexandra Chouldechova, A. Feder Cooper, Solon Barocas, Abhinav Palia, Dan Vann, and Hanna Wallach.
Comparison requires valid measurement: Rethinking attack success rate comparisons in AI red teaming. In
Track,
The Thirty-Ninth Annual Conference on Neural Information Processing Systems Position Paper
| 2025. | URL https://openreview.net/forum?id=d7hqAhLvWG. |     |     |     |     |     |     |     |     |
| ----- | ----------------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
PaulF.Christiano,JanLeike,TomBrown,MiljanMartic,ShaneLegg,andDarioAmodei. Deepreinforcement
learning from human preferences. In Advances in Neural Information Processing Systems, volume 30, 2017.
Thomas Claburn. Microsoft CEO of AI: Your online content is ÆfreewareÆ fodder for training models. The
Register, June 2024. URL https://www.theregister.com/2024/06/28/microsoft_ceo_ai/.
| Suzanne | Collins.     |        | Games.       | Scholastic |      | Press, 2008.  |       |         |     |
| ------- | ------------ | ------ | ------------ | ---------- | ---- | ------------- | ----- | ------- | --- |
|         | The          | Hunger |              |            |      |               |       |         |     |
| Concord | Music Group, | Inc.   | v. Anthropic |            | PBC. | 3:23-cv-01092 | (M.D. | Tenn.). |     |
A. Feder Cooper and James Grimmelmann. The Files are in the Computer: Copyright, Memorization, and
| Generative | AI. arXiv | preprint |     | arXiv:2404.12590, |     | 2024. |     |     |     |
| ---------- | --------- | -------- | --- | ----------------- | --- | ----- | --- | --- | --- |
A. Feder Cooper, Katherine Lee, James Grimmelmann, Daphne Ippolito, Christopher Callison-Burch,
Christopher A. Choquette-Choo, Niloofar Mireshghallah, Miles Brundage, David Mimno, Madiha Zahrah
Choksi, Jack M. Balkin, Nicholas Carlini, Christopher De Sa, Jonathan Frankle, Deep Ganguli, Bryant
Gipson, Andres Guadamuz, Swee Leng Harris, Abigail Z. Jacobs, Elizabeth Joh, Gautam Kamath, Mark
Lemley, Cass Matthews, Christine McLeavey, Corynne McSherry, Milad Nasr, Paul Ohm, Adam Roberts,
Tom Rubin, Pamela Samuelson, Ludwig Schubert, Kristen Vaccaro, Luis Villa, Felix Wu, and Elana Zeide.
Report of the 1st Workshop on Generative AI and Law. arXiv:2311.06477, 2023.
|     |     |     |     |     |     |     | arXiv | preprint |     |
| --- | --- | --- | --- | --- | --- | --- | ----- | -------- | --- |
A. Feder Cooper, Christopher A Choquette-Choo, Miranda Bogen, Matthew Jagielski, Katja Filippova,
KenZiyuLiu,AlexandraChouldechova,YangsiboHuangJamieHayes,etal. MachineunlearningdoesnÆtdo
what you think: Lessons for generative ai policy, research, and practice. arXiv preprint arXiv:2412.06966,
2024.
21

A. Feder Cooper, Aaron Gokaslan, Amy B. Cyphert, Christopher De Sa, Mark A. Lemley, Daniel E. Ho,
and Percy Liang. Extracting memorized pieces of (copyrighted) books from open-weight language models.
|     |     | arXiv:2505.12546, |     | 2025. |     |     |     |     |     |     |     |
| --- | --- | ----------------- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
arXiv preprint
| difflib SequenceMatcher. |     |     | difflib | ù Helpers | for | computing | deltas, | 2025. | URL |     |     |
| ------------------------ | --- | --- | ------- | --------- | --- | --------- | ------- | ----- | --- | --- | --- |
https://docs.python.org/3/
| library/difflib.html. |     |     | Python | Standard | Library |     | v3.14.2. |     |     |     |     |
| --------------------- | --- | --- | ------ | -------- | ------- | --- | -------- | --- | --- | --- | --- |
Tim W. Dornis. Generative AI, Reproductions Inside the Model, and the Making Available to the Public.
International Review of Intellectual Property and Competition Law, 56:909û938, 2025.
Vitaly Feldman. Does learning require memorization? a short tale about a long tail. In Proceedings of the
|             |     |        |     |           |     |        | Computing, |     | STOC 2020, | pp. 954û959, | New York, |
| ----------- | --- | ------ | --- | --------- | --- | ------ | ---------- | --- | ---------- | ------------ | --------- |
| 52nd Annual | ACM | SIGACT |     | Symposium | on  | Theory | of         |     |            |              |           |
NY, USA, 2020. Association for Computing Machinery. ISBN 9781450369794.
| F. Scott Fitzgerald. |     | The | Great | Gatsby. | Charles | ScribnerÆs |     | Sons, 1925. |     |     |     |
| -------------------- | --- | --- | ----- | ------- | ------- | ---------- | --- | ----------- | --- | --- | --- |
GEMA v. OpenAI. Gesellschaft fⁿr musikalische Auffⁿhrungs- und mechanische VervielfΣltigungsrechte. 42
O 14139/24.
GeminiTeam, NikolaySavinov, DenisTeplyashin, DmitryLepikhin, TimothyLillicrap, Jean-baptisteAlayrac,
Radu Soricut, Angeliki Lazaridou, Orhan Firat, Julian Schrittwieser, et al. Gemini 1.5: Unlocking
multimodal understanding across millions of tokens of context. arXiv preprint arXiv:2403.05530, 2024.
Sandro Gianella. Linkedin post regarding gema v. openai appeal, De-
| cember |     | 2025. |     |     | URL |     |     |     |     |     |     |
| ------ | --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
https://www.linkedin.com/posts/sandrogianella_
were-appealing-the-gema-case-i-want-to-activity-7405076994062729216-TmEP/. Posted in
| the capacity | of  | OpenAIÆs | Head | of Europe | and | Middle | East | Policy. |     |     |     |
| ------------ | --- | -------- | ---- | --------- | --- | ------ | ---- | ------- | --- | --- | --- |
Google AI for Developers. Generating content ù gemini api. https://ai.google.dev/api/
| generate-content. |        | Accessed: |            | 2025-12-04. |     |     |     |     |     |     |     |
| ----------------- | ------ | --------- | ---------- | ----------- | --- | --- | --- | --- | --- | --- | --- |
| Google Cloud.     | Gemini | 2.5       | Pro, 2025. | URL         |     |     |     |     |     |     |     |
https://docs.cloud.google.com/vertex-ai/generative-ai/
docs/models/gemini/2-5-pro.
Aaron Grattafiori et al. The Llama 3 Herd of Models, 2024. URL https://arxiv.org/abs/2407.21783.
Jamie Hayes, Ilia Shumailov, Christopher A. Choquette-Choo, Matthew Jagielski, Georgios Kaissis, Milad
Nasr, Meenatchi Sundaram Muthu Selva Annamalai, Niloofar Mireshghallah, Igor Shilov, Matthieu
Meeus, Yves-Alexandre de Montjoye, Katherine Lee, Franziska Boenisch, Adam Dziedzic, and A. Feder
Cooper. Exploring the limits of strong membership inference attacks on large language models. In
|     |     |     |     |     |     |     |     |     | Systems, | 2025a. | URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | -------- | ------ | --- |
The Thirty-ninth Annual Conference on Neural Information Processing https:
//openreview.net/forum?id=x0i7wvRLHK.
Jamie Hayes, Marika Swanberg, Harsh Chaudhari, Itay Yona, Ilia Shumailov, Milad Nasr, Christopher A.
Choquette-Choo, Katherine Lee, and A. Feder Cooper. Measuring memorization in language models via
probabilistic extraction. In Luis Chiruzzo, Alan Ritter, and Lu Wang (eds.),
|     |     |     |     |     |     |     |     |     |     | Proceedings | of the 2025 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ----------- | ----------- |
Conference of the Nations of the Americas Chapter of the Association for Computational Linguistics:
|                |     |              |     |         |         | Papers), |     | pp. 9266û9291, | Albuquerque, | New | Mexico, April |
| -------------- | --- | ------------ | --- | ------- | ------- | -------- | --- | -------------- | ------------ | --- | ------------- |
| Human Language |     | Technologies |     | (Volume | 1: Long |          |     |                |              |     |               |
2025b. Association for Computational Linguistics. ISBN 979-8-89176-189-6. URL https://aclanthology.
org/2025.naacl-long.469/.
| Joseph Heller. | Catch-22. |     | Simon | & Schuster, | 1961. |     |     |     |     |     |     |
| -------------- | --------- | --- | ----- | ----------- | ----- | --- | --- | --- | --- | --- | --- |
Peter Henderson, Xuechen Li, Dan Jurafsky, Tatsunori Hashimoto, Mark A. Lemley, and Percy Liang.
Foundation Models and Fair Use, 2023. URL https://arxiv.org/abs/2303.15715.
Dan Hendrycks, Nicholas Carlini, John Schulman, and Jacob Steinhardt. Unsolved problems in ML safety.
| arXiv preprint |     | arXiv:2109.13916, |     | 2021. |     |     |     |     |     |     |     |
| -------------- | --- | ----------------- | --- | ----- | --- | --- | --- | --- | --- | --- | --- |
22

Monika Henzinger. Finding near-duplicate web pages: a large-scale evaluation of algorithms. SIGIR Æ06,
pp. 284û291, New York, NY, USA, 2006. Association for Computing Machinery. ISBN 1595933697. doi:
10.1145/1148170.1148222. URL https://doi.org/10.1145/1148170.1148222.
Timothy C. Hoad and Justin Zobel. Methods for Identifying Versioned and Plagiarized Documents.
J. Assoc.
| Inf. Sci. | Technol., | 54:203û215, |     | 2003. |     |     |     |     |     |     |
| --------- | --------- | ----------- | --- | ----- | --- | --- | --- | --- | --- | --- |
John Hughes, Sara Price, Aengus Lynch, Rylan Schaeffer, Fazl Barez, Sanmi Koyejo, Henry Sleight, Erik
Jones, Ethan Perez, and Mrinank Sharma. Best-of-n jailbreaking, 2024. URL https://arxiv.org/abs/
2412.03556.
Daphne Ippolito, Florian TramΦr, Milad Nasr, Chiyuan Zhang, Matthew Jagielski, Katherine Lee, Christo-
pher A Choquette-Choo, and Nicholas Carlini. Preventing verbatim memorization in language models
| gives a | false sense | of privacy. |     | arXiv | preprint | arXiv:2210.17546, |     | 2022. |     |     |
| ------- | ----------- | ----------- | --- | ----- | -------- | ----------------- | --- | ----- | --- | --- |
Kadrey et al. v. Meta Platforms, Inc. United States District Court for the Northern District of California,
| March | 2025. Case | No. | 3:23-cv-03417-VC. |     |     |     |     |     |     |     |
| ----- | ---------- | --- | ----------------- | --- | --- | --- | --- | --- | --- | --- |
Kadrey Judgment. Order Denying the PlaintiffsÆ Motion for Partial Summary Judgment and
Granting MetaÆs Cross-Motion for Partial Summary Judgment, Kadrey et al. v. Meta Platforms,
| Inc., 2025. | URL |     |     |     |     |     |     |     |     |     |
| ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
https://law.justia.com/cases/federal/district-courts/california/candce/3:
2023cv03417/415175/598/. No. 3:23-cv-03417-VC (N.D. Cal. Jun. 25, 2025).
Ashley King. Anthropic CEO Doubles Down on Fair Use DefenseûôThe Law Will Back Us
UpöÆ. Digital Music News, April 2024. URL https://www.digitalmusicnews.com/2024/04/15/
anthropic-ceo-doubles-down-on-fair-use-defense/.
Katherine Lee, Daphne Ippolito, Andrew Nystrom, Chiyuan Zhang, Douglas Eck, Chris Callison-Burch, and
Nicholas Carlini. Deduplicating Training Data Makes Language Models Better. In Proceedings of the 60th
|        |         |        |             |     |               |     | Linguistics, | volume 1, | pp. 8424û8445, | 2022. |
| ------ | ------- | ------ | ----------- | --- | ------------- | --- | ------------ | --------- | -------------- | ----- |
| Annual | Meeting | of the | Association | for | Computational |     |              |           |                |       |
Katherine Lee, A. Feder Cooper, James Grimmelmann, and Daphne Ippolito. AI and Law: The Next
| Generation. | SSRN, | 2023a. | http://dx.doi.org/10.2139/ssrn.4580739. |     |     |     |     |     |     |     |
| ----------- | ----- | ------ | --------------------------------------- | --- | --- | --- | --- | --- | --- | --- |
Katherine Lee, A. Feder Cooper, and James Grimmelmann. TalkinÆ ÆBout AI Generation: Copyright and
| the Generative-AI |     | Supply | Chain. | arXiv | preprint | arXiv:2309.08133, |     | 2023b. |     |     |
| ----------------- | --- | ------ | ------ | ----- | -------- | ----------------- | --- | ------ | --- | --- |
Katherine Lee, A. Feder Cooper, and James Grimmelmann. TalkinÆ ÆBout AI Generation: Copyright and the
| Generative-AI |     | Supply Chain | (The | Short | Version). |     | In          |                  |             |         |
| ------------- | --- | ------------ | ---- | ----- | --------- | --- | ----------- | ---------------- | ----------- | ------- |
|               |     |              |      |       |           |     | Proceedings | of the Symposium | on Computer | Science |
and Law, CSLAW Æ24, pp. 48û63, New York, NY, USA, 2024. Association for Computing Machinery. ISBN
9798400703331. doi: 10.1145/3614407.3643696. URL https://doi.org/10.1145/3614407.3643696.
Mark Lemley and Bryan Casey. Fair Learning. Texas Law Review, 99:743, 2021.
| George R.R.    | Martin.  | A Game      | of   | Thrones.     | Voyager |       | Books, 1996. |     |     |     |
| -------------- | -------- | ----------- | ---- | ------------ | ------- | ----- | ------------ | --- | --- | --- |
| Courtney       | Milan.   | The Duchess | War. | Createspace, |         | 2012. |              |     |     |     |
| Toni Morrison. | Beloved. | Alfred      |      | A. Knopf     | Inc.,   | 1987. |              |     |     |     |
Milad Nasr, Nicholas Carlini, Jonathan Hayase, Matthew Jagielski, A. Feder Cooper, Daphne Ippolito,
Christopher A. Choquette-Choo, Eric Wallace, Florian TramΦr, and Katherine Lee. Scalable Extraction
of Training Data from (Production) Language Models. arXiv preprint arXiv:2311.17035, 2023.
Milad Nasr, Javier Rando, Nicholas Carlini, Jonathan Hayase, Matthew Jagielski, A. Feder Cooper, Daphne
Ippolito, Christopher A. Choquette-Choo, Florian TramΦr, and Katherine Lee. Scalable Extraction of
Training Data from Aligned, Production Language Models. In The Thirteenth International Conference
on Learning Representations, 2025. URL https://openreview.net/forum?id=vjel3nWP2a.
| New York | Times | Company | v. Microsoft. |     | 2:24-cv-00711 |     | (C.D. | Cal.). |     |     |
| -------- | ----- | ------- | ------------- | --- | ------------- | --- | ----- | ------ | --- | --- |
23

| OpenAI. | GPT-4 | System | Card. | Technical | report, |     | March | 2023. URL |     |     |     |
| ------- | ----- | ------ | ----- | --------- | ------- | --- | ----- | --------- | --- | --- | --- |
https://cdn.openai.com/papers/
gpt-4-system-card.pdf.
OpenAI. OpenAI and Journalism, 2024a. URL https://openai.com/index/openai-and-journalism/
| ?utm_source=chatgpt.com. |        |       |      | Accessed:     | 2025-11-06. |     |            |     |     |     |     |
| ------------------------ | ------ | ----- | ---- | ------------- | ----------- | --- | ---------- | --- | --- | --- | --- |
| OpenAI.                  | OpenAI | Model | Spec | (2024/05/08), |             |     | May 2024b. |     | URL |     |     |
https://cdn.openai.com/spec/
| model-spec-2024-05-08.html. |     |     |     | Accessed: |     | 2025-05-13. |     |     |     |     |     |
| --------------------------- | --- | --- | --- | --------- | --- | ----------- | --- | --- | --- | --- | --- |
OpenAI. Introducing GPT-4.1 in the API, April 2025. URL https://openai.com/index/gpt-4-1/.
| George | Orwell. |     |     | Four. | Harcourt, | Brace | and | Company, | 1949. |     |     |
| ------ | ------- | --- | --- | ----- | --------- | ----- | --- | -------- | ----- | --- | --- |
Nineteen-Eighty
Long Ouyang, Jeff Wu, Xu Jiang, Diogo Almeida, Carroll L. Wainwright, Pamela Mishkin, Chong Zhang,
Sandhini Agarwal, Katarina Slama, Alex Ray, et al. Training language models to follow instructions with
| human | feedback. |       |          | arXiv:2203.02155, |     |     | 2022. |     |     |     |     |
| ----- | --------- | ----- | -------- | ----------------- | --- | --- | ----- | --- | --- | --- | --- |
|       |           | arXiv | preprint |                   |     |     |       |     |     |     |     |
J÷rn Poltz and Friederike Heine. OpenAI used song lyrics in violation of copyright laws,
German court says. Reuters, November 2025. URL https://www.reuters.com/world/
german-court-sides-with-plaintiff-copyright-case-against-openai-2025-11-11/.
Project Zero. Vulnerability disclosure policy. https://googleprojectzero.blogspot.com/p/
| vulnerability-disclosure-policy.html, |     |              |     |                |         | 2021.  | Accessed:    | 2025-02-14. |       |     |     |
| ------------------------------------- | --- | ------------ | --- | -------------- | ------- | ------ | ------------ | ----------- | ----- | --- | --- |
| J.K. Rowling.                         |     |              |     |                |         | Stone. | Scholastic,  | 1998.       |       |     |     |
|                                       |     | Harry Potter | and | the SorcererÆs |         |        |              |             |       |     |     |
| J.K. Rowling.                         |     |              |     |                |         | Fire.  | Scholastic,  | 2000.       |       |     |     |
|                                       |     | Harry Potter | and | the Goblet     | of      |        |              |             |       |     |     |
| J.D. Salinger.                        |     |              |     | Rye.           | Little, | Brown  | and Company, |             | 1951. |     |     |
|                                       |     | The Catcher  | in  | the            |         |        |              |             |       |     |     |
Pamela Samuelson. Generative AI meets copyright. Science, 381(6654):158û161, 2023.
AndrΘ Santos, JosΘ Joπo Almeida, and Nuno Carvalho. Structural alignment of plain text books. In
Nicoletta Calzolari, Khalid Choukri, Thierry Declerck, Mehmet U?ur Do?an, Bente Maegaard, Joseph
Mariani, Asuncion Moreno, Jan Odijk, and Stelios Piperidis (eds.), Proceedings of the Eighth International
|            |     |             |           |     |                |     | (LRECÆ12), |     | pp. 2069û2074, | Istanbul, Turkey, | May |
| ---------- | --- | ----------- | --------- | --- | -------------- | --- | ---------- | --- | -------------- | ----------------- | --- |
| Conference |     | on Language | Resources |     | and Evaluation |     |            |     |                |                   |     |
2012. European Language Resources Association (ELRA). URL https://aclanthology.org/L12-1576/.
Avi Schwarzschild, Zhili Feng, Pratyush Maini, Zachary C. Lipton, and J. Zico Kolter. Rethinking LLM Mem-
orization through the Lens of Adversarial Compression, 2024. URL https://arxiv.org/abs/2404.15146.
Mrinank Sharma, Meg Tong, Jesse Mu, Jerry Wei, Jorrit Kruthoff, Scott Goodfriend, Euan Ong, Alwin Peng,
Raj Agarwal, Cem Anil, Amanda Askell, Nathan Bailey, Joe Benton, Emma Bluemke, Samuel R. Bowman,
Eric Christiansen, Hoagy Cunningham, Andy Dau, Anjali Gopal, Rob Gilson, Logan Graham, Logan
Howard, Nimit Kalra, Taesung Lee, Kevin Lin, Peter Lofgren, Francesco Mosconi, Clare OÆHara, Catherine
Olsson, Linda Petrini, Samir Rajani, Nikhil Saxena, Alex Silverstein, Tanya Singh, Theodore Sumers,
Leonard Tang, Kevin K. Troy, Constantin Weisser, Ruiqi Zhong, Giulio Zhou, Jan Leike, Jared Kaplan,
and Ethan Perez. Constitutional classifiers: Defending against universal jailbreaks across thousands of
| hours | of red | teaming, | 2025. | URL https://arxiv.org/abs/2501.18837. |     |     |     |     |     |     |     |
| ----- | ------ | -------- | ----- | ------------------------------------- | --- | --- | --- | --- | --- | --- | --- |
Mary Shelley. Frankenstein. Lackington, Hughes, Harding, Mavor, & Jones, 1818.
The Authors Guild. The Authors Guild, John Grisham, Jodi Picoult, David Baldacci, George R.R.
Martin, and 13 Other Authors File Class-Action Suit Against OpenAI. September 2023. URL
https://authorsguild.org/news/ag-and-authors-file-class-action-suit-against-openai/.
| J.R.R. Tolkien. |     | The Hobbit. | George | Allen | and | Unwin, | 1937. |     |     |     |     |
| --------------- | --- | ----------- | ------ | ----- | --- | ------ | ----- | --- | --- | --- | --- |
24

Hugo Touvron, Thibaut Lavril, Gautier Izacard, Xavier Martinet, Marie-Anne Lachaux, TimothΘe Lacroix,
Baptiste RoziΦre, Naman Goyal, Eric Hambro, Faisal Azhar, Aurelien Rodriguez, Armand Joulin, Edouard
Grave, and Guillaume Lample. LLaMA: Open and Efficient Foundation Language Models, 2023. URL
https://arxiv.org/abs/2302.13971.
Angelina Wang, Daniel E. Ho, and Sanmi Koyejo. The inadequacy of offline large language model evaluations:
A need to account for personalization in model behavior. Patterns, 6(12):101397, December 2025. doi:
10.1016/j.patter.2025.101397. URL https://doi.org/10.1016/j.patter.2025.101397. Published 12
December 2025.
Jiapeng Wang and Yihong Dong. Measurement of Text Similarity: A Survey. Information, 11(9), 2020.
ISSN 2078-2489. doi: 10.3390/info11090421. URL https://www.mdpi.com/2078-2489/11/9/421.
Alexander Wei, Nika Haghtalab, and Jacob Steinhardt. Jailbroken: How does llm safety training fail?, 2023.
URL https://arxiv.org/abs/2307.02483.
Jason Wei, Maarten Bosma, Vincent Y. Zhao, Kelvin Guu, Adams Wei Yu, Brian Lester, Nan Du, Andrew M.
Dai, and Quoc V. Le. Finetuned language models are zero-shot learners. arXiv preprint arXiv:2109.01652,
2021.
Johnny Tian-Zheng Wei, Ameya Godbole, Mohammad Aflah Khan, Ryan Wang, Xiaoyuan Zhu, James
Flemings, Nitya Kashyap, Krishna P. Gummadi, Willie Neiswanger, and Robin Jia. Hubble: a model
suite to advance the study of llm memorization, 2025. URL https://arxiv.org/abs/2510.19811.
Kyle Wiggers and Maxwell Zeff. In AI copyright case, Zuckerberg turns to
YouTube for his defense, January 2025. URL https://techcrunch.com/2025/01/15/
in-ai-copyright-case-zuckerberg-turns-to-youtube-for-his-defense/.
xAI. Models and Pricing, 2025. URL https://docs.x.ai/docs/models. ôThe knowledge cut-off date of
Grok 3 and Grok 4 is November, 2024.ö.
Daniel M. Ziegler, Nisan Stiennon, Jeffrey Wu, Tom B. Brown, Alec Radford, Dario Amodei, Paul
Christiano, and Geoffrey Irving. Fine-tuning language models from human preferences. arXiv preprint
arXiv:1909.08593, 2019.
AndyZou,ZifanWang,NicholasCarlini,MiladNasr,J.ZicoKolter,andMattFredrikson. Universalandtrans-
ferable adversarial attacks on aligned language models, 2023. URL https://arxiv.org/abs/2307.15043.
25

| A   | BoN | perturbtations |     |     |     |     |     |     |
| --- | --- | -------------- | --- | --- | --- | --- | --- | --- |
Forcompleteness,wedocumenttheexactperturbationsusedduringtheBest-of-N (BoN)jailbreakforClaude
3.7 Sonnet and GPT-4.1. We fix ? to be 0.6 for all experiments. All perturbations operate deterministically,
| given | the random | seed, allowing     |            | exact replay | of  | prompt sequence. |     |     |
| ----- | ---------- | ------------------ | ---------- | ------------ | --- | ---------------- | --- | --- |
|       |            | Returns the prefix | unchanged. |              |     |                  |     |     |
Identity.
Iterates over every alphabetic character and flips its case with probability [0,1] (we
Capitalization. p ?
use p ? {0.2,0.5}). Sampling is i.i.d. per character using a pseudo-random generator seeded per
perturbation.
Spacing. Processes the string left-to-right. For each existing space we remove it with probability p ; for
rm
each non-space character we optionally insert a space immediately after it with probability , so
p
add
long as the next character is not already whitespace. We use (p ,p )?{(0.05,0.05),(0.1,0.1)}.
add rm
Word order shuffle. Split the text into sentences using punctuation boundaries (æ.Æ, æ!Æ, æ?Æ). Within each
sentence, we shuffle the token order with probability =0.3 when the sentence contains more
p shuffle
|     | than | one token. |     |     |     |     |     |     |
| --- | ---- | ---------- | --- | --- | --- | --- | --- | --- |
For each letter, with probability (set to 0.1 or 0.05), we replace the letter
| Character |     | substitution. |     |     |     |     | p   |     |
| --------- | --- | ------------- | --- | --- | --- | --- | --- | --- |
sub
with a visually similar glyph drawn uniformly from a fixed mapping (e.g., æaÆ ? {æ@Æ,æ┤aÆ,æ`aÆ,æêaÆ},
æsÆ?{æ$Æ,æ5Æ}). Uppercase letters inherit the capitalization of the replacement.
For characters that are punctuation marks (e.g., æ.Æ, æ,Æ, æ!Æ, æ?Æ, æ;Æ, æ:Æ), we remove them
| Punctuation |     | edits. |     |     |     |     |     |     |
| ----------- | --- | ------ | --- | --- | --- | --- | --- | --- |
with probability p ; for alphabetic characters, we insert a random punctuation mark immediately
rm
|     | after | with probability | p   | . We | use (p | ,p )?{(0.05,0.05),(0.1,0.1)}. |     |     |
| --- | ----- | ---------------- | --- | ---- | ------ | ----------------------------- | --- | --- |
|     |       |                  | add |      | add    | rm                            |     |     |
Word scrambling. For each text token longer than three characters, we shuffle its interior characters (leave
firstandlastfixed)withprobability?1/2. Thispreservesreadabilitywhilealteringthebyte-levelform.
Similar to capitalization above, but the flip probability is driven by the intensity
| Random | capitalization. |      |            |           |       |      |                  |       |
| ------ | --------------- | ---- | ---------- | --------- | ----- | ---- | ---------------- | ----- |
|        | parameter:      | each | alphabetic | character | swaps | case | with probability | ?1/2. |
ASCII noising. For every printable ASCII character (code points 32û126) we perturb the character
with probability ?3. When triggered, we add or subtract 1 from its code point (chosen uniformly
from {?1,+1}); if the resulting code point is outside the printable range, we leave the character
unchanged. This mimics light OCR or transmission noise while preserving human readability.
Composites. We also chain multiple perturbations in a fixed order, e.g., capitalization ? spacing, or word
scrambling random capitalization ASCII noising. Each composite inherits the parameter
|     |     | ?   |     |     | ?   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
settings of its constituents. Identity is always included in the pool so that unperturbed prompts
|     | are       | sampled alongside | perturbed |            | ones. |         |     |     |
| --- | --------- | ----------------- | --------- | ---------- | ----- | ------- | --- | --- |
| B   | Procedure | for quantifying   |           | extraction |       | success |     |     |
In Section 3.3, we describe our measurement procedure for capturing valid instances of extraction. Prior
work commonly uses a threshold of 50 LLM tokens to identify verbatim memorized sequences. For typical
English prose, a useful approximation is that one word corresponds to approximately 1.3û1.4 LLM tokens.
Under this conversion, 50 tokens corresponds to roughly 35û40 words, while 100 words corresponds to
approximately 130û140 tokens. For long-form extraction, verbatim matching is too stringent (Cooper et al.,
2025). We instead merge closely aligned blocks, but then filter these merged blocks to only retain ones that
| are | sufficiently | long to make | a valid | extraction |     | claim. |     |     |
| --- | ------------ | ------------ | ------- | ---------- | --- | ------ | --- | --- |
Following Cooper et al. (2025), we first first identifies verbatim blocks, using a block-based greedy approxi-
mation of longest common substring. For this, we use difflib SequenceMatcher (difflib SequenceMatcher,
2025), which returns on ordered set of verbatim matching blocks given two input text lists (Equation 3). We
26

then do two merge-and-filter passes (Equation 4.) The first merge is very stringent, combining blocks that
have very short gaps within a given input text and are well-aligned across input texts (?(1) =2, ?(1) =1).
gap align
The first filter with l(1) =20 words is fairly stringent, with respect to what we consider a ôvery shortö span of
text; note that this is about half of the length of the 35û40 words used for verbatim discoverable extraction.
The second merge is slightly more relaxed, but still stringent (?(2) =10, ?(2) =3)). To compensate for this
gap align
relaxation, the second filter is very stringent, with l(2) =100 words.
InFigure4, weprovideahigh-leveldepictionofourprocedureforformingnear-verbatimblocks. InFigure4a,
weshowhowbenignformattingdifferencesintroduceshortblocks,andhowourprocedureultimatelyreconciles
these differences to produce a longer-form near-verbatim block. In contrast, Figure 4b shows how the identify
procedure can return very short blocks that we should not count as extraction, even though they are
(coincidental) verbatim matches. We performed extensive validation experiments on these settings to pick
this configuration, discussed further below.
Conservative estimate for extraction. Note that this procedure is conservative in several ways. If any
of the blocks in Figure 4a had been a bit shorter, the entire text would have failed the second filter. Further,
note that we still only count the verbatim length contributions in our near-verbatim blocks. For example,
in Figure 4a, we do not count the text in the gap text; the final merged block is the sum of the lengths
of the original six blocks only. This length is 141 words; if we were to count the book BÆs ground-truth
text in the gaps that were reconciled into this near-verbatim block, then the total length would be 150 words
that contribute to our matched count m (Equation 6). Either approach would be a reasonable and valid
way to operationalize our procedure, but we choose to be conservative and only count verbatim matches.
This deflates our final extraction numbers.
We validated our chosen configuration, experimenting with several different settings for our procedureù
different gap, alignment, and filter length tolerances. We evaluated these settings both quantitatively (e.g.,
how extraction metrics change, histograms over retained block lengths, computing Levenshtein distance over
near-verbatim blocks with generated and ground-truth book text) and qualitatively (e.g., visual inspection
of diffs between books and generations). We found that it would be reasonable to use shorter filter conditions
for both filter steps, as well as a larger maximum gap in the second merge, in comparison to the final
configuration we report.
Tobeconservativeaboutourclaims,wepickedthemoststringentconfigurationthatretainseffectivelyverbatim
long-formtextthathasbeensplitintoshortblocksduetochangesinpunctuation(asinFigure4a). Wealsoex-
perimentedwithusingtheLevenshteindistanceasanadditionalmergingcriterioninthefirstfilter(i.e.,toonly
merge blocks for which the very short gaps are due to generated text in G that is within a small Levenshtein-
distanceoftheground-truthtextinB). Thischeckwould,forexample,considertheshortgapsinFigure4ato
be benign (and fine to merge blocks in the first pass), but would not merge the blocks with short gaps in Fig-
ure4b. However,weobservednosubstantivedifferenceinourmeasurementswhenincludingthischeck;inprac-
tice, thecombinationoftwomerge-and-filterpassesremovespatchychainsofpartial, shortmatches(e.g., hap-
penstancematchesofôtheöinthesamelocationinthebookandgeneration). Forsimplicity,weomitthischeck.
We provide a more detailed depiction of our procedure for the text in Figure 4a below, which shows each
step of the near-verbatim block formation procedure. This figure illustrates the need for our two-stage
merge-and-filter approach, rather than a simple merge and filter, which would excessively drop near-verbatim
spans that have benign formatting differences.
27

Figure 10: Illustrating each step of our two-step merge-and-filter procedure. This is a more detailed
depiction of Figure 4a, showing both merge-and-filter steps for part of B=Frankenstein. The text shown is
part of the corresponding generation G from Claude 3.7 Sonnet, not the ground-truth book B. Verbatim text
is identical in both B and G, but gap text differs, as these differences are the reason for gaps between blocks.
28

| C Experimental | setup |     |     |     |     |
| -------------- | ----- | --- | --- | --- | --- |
We provide further details on our results and experimental setup. We provide additional information on book
selection (Appendix C.1), production-LLM-specific Phase 2 configurations and results (Appendix C.2), and
the light text normalization we perform prior to computing near-verbatim extraction metrics (Appendix C.3).
| C.1 Book | selection |     |     |     |     |
| -------- | --------- | --- | --- | --- | --- |
While companies have not disclosed exact training corpora, public statements (Wiggers & Zeff, 2025; Brittain,
2023; Claburn, 2024) and litigation (Bartz et al. v. Anthropic PBC; Kadrey et al. v. Meta Platforms, Inc.;
The Authors Guild, 2023; King, 2024) suggest books are very likely included. For our extraction experiments
(but not our negative control), we draw initial seeds for Phase 1 from books that we suspect were included
in the training data (Figure 2, Section 3.1). As a proxy, we mostly select books that Cooper et al. (2025)
observe to be highly memorized by Llama 3.1 70B. Following Phase 2, we only make extraction claims (which
embed a claim for training-data membership) for long generated blocks of near-verbatim text. Except in
select cases for Claude 3.7 Sonnet, where we extract full books, we do not claim training-data membership
for a whole book with our results; we only claim training-data membership for the text that we extracted.
| C.2 Phase | 2 generation | configurations | and stop | conditions |     |
| --------- | ------------ | -------------- | -------- | ---------- | --- |
In this appendix, we document the exact hyperparameters and stopping conditions used during Phase 2
| (Section       | 3.2) for each production | LLM.    |     |     |     |
| -------------- | ------------------------ | ------- | --- | --- | --- |
| C.2.1 Settings | for main                 | results |     |     |     |
We start with the settings used in our main results, presented in Section 4.2. Each production LLM exposes
different configurations for generation. For each production LLM, we ran exploratory experiments to identify
| conditions | under which | extraction might | work. |     |     |
| ---------- | ----------- | ---------------- | ----- | --- | --- |
For all production LLMs, we fix temperature to 0.0 (deterministic generation, but there may be other system
non-determinism). Based on initial experiments, we set the maximum number of returned tokens to be
250, 500, 2000 and 500 for Claude 3.7 Sonnet, Grok 3, Gemini 2.5 Pro, and GPT-4.1, respectively. We set
the maximum number of continuation turns to 600, 200, 300, and 300, respectively. We chose 300 for both
Gemini 2.5 Pro and Grok 3 because we observed in initial experiments that both production LLMs would
diverge from near-verbatim books before this point. Given the choice to set the maximum returned tokens
shorter for Claude 3.7 Sonnet (to avoid filters), we set the number of turns higher. For experiments with The
Hobbit, we ran for longer (1000 turns) after observing continued extraction. For Gemini 2.5 Pro, we also set
frequency penalty to 2 and presence penalty to 0.1, given initial experiments sweeping over these parameters
| for   |                |            | (Appendix      | C.2.2).          |           |
| ----- | -------------- | ---------- | -------------- | ---------------- | --------- |
| Harry | Potter and the | SorcererÆs | Stone          |                  |           |
|       |                | Table 2:   | Regex Patterns | Used for Refusal | Detection |
Regex Pattern
|     |     | \bsorry[, | ]*(?:but )?i | can[\u0027\u2019]t\b |     |
| --- | --- | --------- | ------------ | -------------------- | --- |
\bcopyright(?:ed)?\b
|     |     | \bcan[\u0027\u2019]t |      | provide\b |     |
| --- | --- | -------------------- | ---- | --------- | --- |
|     |     | \bunable             | to\b |           |     |
\bi cannot\b
|     |     | \bwon[\u0027\u2019]t |      | be able to\b |     |
| --- | --- | -------------------- | ---- | ------------ | --- |
|     |     | \bnot allowed        | to\b |              |     |
|     |     | \bcan[\u0027\u2019]t |      | reproduce\b  |     |
|     |     | \bcan[\u0027\u2019]t |      | continue\b   |     |
|     |     | \bcan[\u0027\u2019]t |      | share\b      |     |
29

Halting Phase 2. We deliberately terminate Phase 2 when any of the following conditions is met: (1) a
maximum budget for continuations is reached, (2) we detect a refusal in the production LLM response, or
(3) we detect a stop string in the production LLM response. For (2), we use simple regex checks to detect
refusals. We enumerate all the regex patterns in Table 2. For (3), we check for the following stop strings
that indicate the model has reached the end of the book, suggesting that it has stopped generating training
data: ôwe have reached the conclusion ofö, ô[End of Book]ö, ôTHE ENDö, ôAbout the Authorö, ôAfterwordö,
ôBibliographyö. For Grok 3, the Phase 2 loop sometimes terminated due to an HTTP 500 error.
In initial exploratory experiments, for Claude 3.7 Sonnet we originally implemented stop string detection
using the last sentence from the book. However, from those experiments, we saw that Claude 3.7 Sonnet
would generate ôTHE ENDö when reaching the end of a book. After these initial experiments, we switched
to these stop strings so as to not rely on ground-truth reference text beyond the prefix in Phase 1.
C.2.2 Generation configuration exploration for Gemini 2.5 Pro
We explored a variety of different settings for Gemini 2.5 ProÆs generation parameters in experiments with
Harry Potter and the SorcererÆs Stone:
ò Max tokens per interaction: {1000,2000,4000}
ò Frequency penalty: {0.5,1.0,2.0}
ò Presence penalty: {0.1,0.2,0.3}
After observing that 2000 max tokens led to the highest nv-recall in all cases, we fixed max tokens to 2000 for
all subsequent experiments. In Section 4.2, we report results for fixed frequency penalty (2.0) and presence
penalty (0.1). However, maximum nv-recall per book varies by this configuration, which we show in Figure 14.
C.2.3 Refusal retries for per-chapter experiments with GPT-4.1
Inourmoreintensiveper-chapterrunsonGPT-4.1,wealsoattempttocontinueinspiteofrefusals(Section4.3).
In each iteration in the continue loop, we produce five responses. We take the first response (in the API
returned list) that does not contain a refusal as the response. If all responses are refusals, then we enter a
refusal retry loop where we wait to retry with exponential backoff (up to 100 times). We continue the loop for
up to 50 turns (per chapter, in contrast to the maximum of 200 we use in our main experiments starting with
a seed from the beginning of the book; see Appendix C.2.1). Once a response is classified as a refusal, the
loop waits for a fixed delay (two minutes) and then retries the same continuation prompt, up to a maximum
number of attempts (50). We found refusals to be non-deterministic: the same instruction prompt would
often fail repeatedly and then succeed after a few retries.
Chat UI We found that our two-phase works using the chat UI, as well, with apparently increased
robustness. In initial exploratory experiments, we ran a prefix from The Great Gatsby in the ChatGPT web
application UI. Through this approach, we were able to extract the first four chapters of The Great Gatsby,
eventhoughwecouldnotreliablydothesamethroughtheAPI.ThissuggeststhatourreportedAPInumbers
may be conservative: the true leakage in end-user deployments may be higher than what we measure here. In
general, UI implementation choices for production LLMs non-trivially affect their behavior (Nasr et al., 2023;
Wang et al., 2025). We also tested our extraction procedure for Claude 3.7 Sonnet using AnthropicÆs chat UI,
and observed that it worked. We do not include results for these UI-based interactions.
C.3 Text normalization prior to gauging near-verbatim extraction
When we evaluate extraction success (Section 3.3.1), we provide two input documents: the ground-truth
book from Books3, and the generated text. For this assessment, we operate on lightly normalized versions of
both the reference books and generations. The goal of this procedure is to remove superficial formatting and
Unicode differences that would otherwise artificially deflate measured overlap. For example, Books3 books
tend to use underscores to mark italics or stylistic variation in quotation marks, which are often absent in
30

generations. SincewedonotknowtheformatofthetrainingdatafortheseproductionLLMs(i.e., theformat
may not align with the format of the book in Books3), we aim to eliminate benign punctuation differences.
We transform each raw text string (either a reference book or a model output) into a normalized string
t
ÿ=Normalize(t)
| t   |     |     | using the | following | deterministic |     | mapping. |     |     |     |
| --- | --- | --- | --------- | --------- | ------------- | --- | -------- | --- | --- | --- |
1. We first apply Unicode compatibility normalization in NFKC form:
|     | Unicode | alignment. |     |     |     |     |     |     |     |     |
| --- | ------- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
ÿ
t =NFKC(t).
0
This step ensures that visually identical characters are represented identically at the byte level. This
is important because our similarity metrics are computed over whitespace-split word tokens.
| 2.  |             |     |            |                | Next, we apply | a   | fixed character-level | remapping | via             | to  |
| --- | ----------- | --- | ---------- | -------------- | -------------- | --- | --------------------- | --------- | --------------- | --- |
|     | Punctuation |     | remapping. |                |                |     |                       |           | ? str.translate |     |
|     | standardize | a   | small set  | of punctuation | marks:         |     |                       |           |                 |     |
ò left/rightandotherUnicodequotationvariants(e.g.,ô,ö,æ,æ)aremappedtotheirASCIIcounterparts
|     | (" or | Æ); |     |     |     |     |     |     |     |     |
| --- | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
ò dash variants (e.g., en dash and horizontal bar) are mapped to a single em dash code point (ù);
ò theUnicodeellipsischaracter(whichisnotvisuallyuniqueinLaTeX)ismappedtothreeASCIIdots(...).
We denote the result of this step t ÿ =?(t ÿ). This consolidation prevents purely typographical variation
|     |              |     |         |       | 1             | 0       |         |     |     |     |
| --- | ------------ | --- | ------- | ----- | ------------- | ------- | ------- | --- | --- | --- |
|     | in quotation |     | or dash | style | from reducing | overlap | scores. |     |     |     |
3. Ellipses and dash-like hyphens. We normalize certain common punctuation patterns with regular
expressions:
ò sequences of spaced dots (e.g., ô. . .ö) are collapsed to a canonical ellipsis ...;
ò if an ellipsis is immediately followed by an alphanumeric character, we insert a single space after ...
|     | to avoid | spurious | concatenation. |     |     |     |     |     |     |     |
| --- | -------- | -------- | -------------- | --- | --- | --- | --- | --- | --- | --- |
4. Books3 italics markup. Books3 books often denote italics with underscore delimiters, so that
emphasized spans appear as in the raw text. Because model generations rarely reproduce
|     |     |     |     |     | _like this_ |     |     |     |     |     |
| --- | --- | --- | --- | --- | ----------- | --- | --- | --- | --- | --- |
these delimiters, they can otherwise appear as artificial mismatches. To account for this, we remove
|     | single-underscore |     | emphasis | markers | using | a regex | of the form |     |     |     |
| --- | ----------------- | --- | -------- | ------- | ----- | ------- | ----------- | --- | --- | --- |
_([^_]+)_?\1,
which strips the outer underscores while preserving the interior text verbatim.
5. Lowercasing. Finally, because we observe irregular casing in some generated outputs, we convert the
|     | entire string | to  | lowercase, |     |     |           |     |     |     |     |
| --- | ------------- | --- | ---------- | --- | --- | --------- | --- | --- | --- | --- |
|     |               |     |            |     |     | ÿ=lower(t | ÿ), |     |     |     |
t
1
|     | so that | case differences |     | do not | affect similarity |     | measurements. |     |     |     |
| --- | ------- | ---------------- | --- | ------ | ----------------- | --- | ------------- | --- | --- | --- |
ÿand
After normalization, we tokenize both t the corresponding normalized reference using PythonÆs default
whitespace splitting (str.split()), exactly as described in Section 3.3, and pass the resulting word
| sequences |     | to  | SequenceMatcher. |     |     |     |     |     |     |     |
| --------- | --- | --- | ---------------- | --- | --- | --- | --- | --- | --- | --- |
difflib
We intentionally keep this normalization minimal. We do not perform stemming or lemmatization, do not
remove stopwords, do not strip punctuation beyond the specific remappings above, and do not collapse all
non-ASCII characters to ASCII. Aside from the whitespace effects implied by the regex substitutions, we do
| not | otherwise | modify | spacing | or  | line breaks. |     |     |     |     |     |
| --- | --------- | ------ | ------- | --- | ------------ | --- | --- | --- | --- | --- |
31

| D Extended | results |     |     |     |     |     |     |     |
| ---------- | ------- | --- | --- | --- | --- | --- | --- | --- |
In this appendix, we include more detailed results for experiments presented in the main paper, as well as
additional experiments, for both Phase 1 (Appendix D.1) and Phase 2 (Appendix D.2).
| D.1 Additional | Phase | 1 results |     |     |     |     |     |     |
| -------------- | ----- | --------- | --- | --- | --- | --- | --- | --- |
We include a brief illustration for Phase 1 (Section 3.1) and Claude 3.7 Sonnet for several books in Figure 11.
Table 3 shows a summary of full BoN results across books for both Claude 3.7 Sonnet and GPT-4.1. The
number of attempts N can vary the cost of Phase 1, but overall it is very cheap for N ?10,000. Since we do
not jailbreak Gemini 2.5 Pro or Grok 3, we omit results for these production LLMs (N =0). We include
detailed results on the success of BoN in Table 3. Note that we do not always achieve maximum possible
| s=1.0  | (Equation 2). |             |              |             |       |               |             |     |
| ------ | ------------- | ----------- | ------------ | ----------- | ----- | ------------- | ----------- | --- |
| Figure | 11:           |             |              |             | As an | illustration, | we show how |     |
|        | Comparing     | N for Phase | 1 for Claude | 3.7 Sonnet. |       |               |             | s   |
(Equation2)changesoverN forClaude3.7Sonnet,forfourbooksweattempttoextract(HarryPotterandthe
SorcererÆs Stone, The Duchess War, The Great Gatsby, Frankenstein) and the negative control (The Society
|               | Objects). | Phase 1 success | occurs when | s?0.6. Phase | 1 succeeds | for   |            |     |
| ------------- | --------- | --------------- | ----------- | ------------ | ---------- | ----- | ---------- | --- |
| of Unknowable |           |                 |             |              |            | Harry | Potter and | the |
SorcererÆs Stone,The Great Gatsby,andFrankensteinùthreebooksforwhichultimatelynv-recall?94%(Fig-
ure5). Phase1failsforThe DuchessWar,sowedonotrunPhase2. Phase1alsofailsforthenegativecontrol
(The Society of Unknowable Objects, publishedlongaftertheknowledgecutoffsforallfourproductionLLMs).
32

| Book  |        |                    |       | Production | LLM Max.        | s N for | max. s |
| ----- | ------ | ------------------ | ----- | ---------- | --------------- | ------- | ------ |
|       |        |                    |       | Claude 3.7 | Sonnet 1.000000 |         | 258    |
| Harry | Potter | and the SorcererÆs | Stone |            |                 |         |        |
| Harry | Potter | and the SorcererÆs | Stone | GPT-4.1    | 0.914474        |         | 5179   |
Harry Potter and the Goblet of Fire Claude 3.7 Sonnet 1.000000 6
|       |        |                |         | GPT-4.1    | 1.000000        |     | 1405 |
| ----- | ------ | -------------- | ------- | ---------- | --------------- | --- | ---- |
| Harry | Potter | and the Goblet | of Fire |            |                 |     |      |
| 1984  |        |                |         | Claude 3.7 | Sonnet 1.000000 |     | 6    |
|       |        |                |         | GPT-4.1    | 1.000000        |     | 183  |
1984
| The     | Hobbit  |            |     | Claude 3.7 | Sonnet 1.000000 |     | 23   |
| ------- | ------- | ---------- | --- | ---------- | --------------- | --- | ---- |
| The     | Hobbit  |            |     | GPT-4.1    | 1.000000        |     | 24   |
|         |         |            |     | Claude 3.7 | Sonnet 0.608392 |     | 6    |
| The     | Catcher | in the Rye |     |            |                 |     |      |
| The     | Catcher | in the Rye |     | GPT-4.1    | 0.608392        |     | 213  |
| A       | Game of | Thrones    |     | Claude 3.7 | Sonnet 1.000000 |     | 6    |
|         |         |            |     | GPT-4.1    | 0.967532        |     | 7842 |
| A       | Game of | Thrones    |     |            |                 |     |      |
| Beloved |         |            |     | Claude 3.7 | Sonnet 1.000000 |     | 6    |
|         |         |            |     | GPT-4.1    | 1.000000        |     | 42   |
Beloved
| The | Da Vinci | Code  |     | Claude 3.7 | Sonnet 0.653333 |     | 2143 |
| --- | -------- | ----- | --- | ---------- | --------------- | --- | ---- |
| The | Da Vinci | Code  |     | GPT-4.1    | 0.280000        |     | 3497 |
|     |          |       |     | Claude 3.7 | Sonnet 1.000000 |     | 23   |
| The | Hunger   | Games |     |            |                 |     |      |
| The | Hunger   | Games |     | GPT-4.1    | 0.883562        |     | 9949 |
|     |          |       |     | Claude 3.7 | Sonnet 1.000000 |     | 23   |
Catch-22
| Catch-22     |     |     |     | GPT-4.1    | 0.532895        |     | 2196 |
| ------------ | --- | --- | --- | ---------- | --------------- | --- | ---- |
| Frankenstein |     |     |     | Claude 3.7 | Sonnet 1.000000 |     | 43   |
|              |     |     |     | GPT-4.1    | 1.000000        |     | 24   |
Frankenstein
| The | Great | Gatsby |     | Claude 3.7 | Sonnet 1.000000 |     | 6   |
| --- | ----- | ------ | --- | ---------- | --------------- | --- | --- |
|     |       |        |     | GPT-4.1    | 1.000000        |     | 5   |
| The | Great | Gatsby |     |            |                 |     |     |
Table 3: Comparing N across Phase 1 jailbreaks. For the two production LLMs that we jailbreak
(Claude 3.7 Sonnet and GPT-4.1), we show the maximum (Equation 2) achieved. We only include results
s
for the twelve books where at least one production LLM had a Phase 1 success, so note that Phase 1 failed
for GPT-4.1 for two books (marked in red). We also show the needed to obtain the maximum that we
|                |               |             |          |            | N   |     | s   |
| -------------- | ------------- | ----------- | -------- | ---------- | --- | --- | --- |
| observed.      | For all runs, | the maximum | N budget | is 10,000. |     |     |     |
| D.2 Additional | Phase         | 2 results   |          |            |     |     |     |
We show API costs for Phase 2 (Appendix D.2.1), and additional plots and tables (Appendix D.2.2).
| D.2.1 Continuation |     | loop API costs |     |     |     |     |     |
| ------------------ | --- | -------------- | --- | --- | --- | --- | --- |
We include a table with the count of all continuation queries in Phase 2. When Gemini 2.5 Pro returns an
empty response, we count this against the max query budget, but do not mark it as a successful continue
query. The Grok 3 sometimes returned an HTTP 500 error, which prematurely terminated the loop.
We estimate the monetary cost of running Phase 2 by summing the provider-reported API charges over all
continuation-loop requests in that phase for each LLM-book run. This cost depends on (i) the number of
continue queries (Table 4), (ii) the input and output token counts per query, and (iii) the provider pricing in
effectduringourexperimentalwindow(midAugusttomidSeptember2025). Becausepricingandtokenization
differ across providers and can change over time, we report costs only for our specific runs and treat them
as approximations. We provide one cost table each for Claude 3.7 Sonnet (Table 5) and Grok 3 (Table 10).
For Gemini 2.5 Pro, we provide a cost table for our main results runs in Section 4.2 (Table 8) as well as a
summary of total costs across all configured runs (Table 9). For GPT-4.1, we include results for our main
results in Section 4.2 (Table 6) as well as a total cost table accounting for our more intensive extraction
experiments (Table 7). Where appropriate, we provide short notes about provider-specific cost accounting.
33

| Book         |          |         |                |     |       | Claude | 3.7 | Sonnet | Gemini | 2.5 Pro | GPT-4.1 | Grok 3 |
| ------------ | -------- | ------- | -------------- | --- | ----- | ------ | --- | ------ | ------ | ------- | ------- | ------ |
| 1984         |          |         |                |     |       |        |     | 538    |        | 300     |         | 61 23  |
| Beloved      |          |         |                |     |       |        |     | 600    |        | 81      |         | 3 66   |
| Catch-22     |          |         |                |     |       |        |     | 419    |        | 286     |         | û 125  |
| The          | Catcher  | in      | the Rye        |     |       |        |     | 148    |        | 173     |         | 37 245 |
| The          | Da Vinci | Code    |                |     |       |        |     | 532    |        | 223     |         | û 66   |
| Frankenstein |          |         |                |     |       |        |     | 374    |        | 204     |         | 33 300 |
| A Game       | of       | Thrones |                |     |       |        |     | 562    |        | 166     |         | 15 195 |
| The          | Great    | Gatsby  |                |     |       |        |     | 317    |        | 218     |         | û 182  |
| Harry        | Potter   | and     | the SorcererÆs |     | Stone |        |     | 480    |        | 171     |         | 31 52  |
| Harry        | Potter   | and     | the Goblet     | of  | Fire  |        |     | 600    |        | 264     |         | 1 300  |
| The          | Hunger   | Games   |                |     |       |        |     | 600    |        | 54      |         | 0 300  |
| The          | Hobbit   |         |                |     |       |        |     | 1000   |        | 188     |         | 4 115  |
Table4: Number of continue queries in Phase 2. Weshowthenumberoftimeswequeryeachproduction
LLM to continue in Phase 2 for each book that achieves success in Phase 1. Phase 2 was not run for GPT-4.1
| on The | Da Vinci     | Code    | and        | Catch-22, | hence | those | entries | are omitted. |        |         |      |        |
| ------ | ------------ | ------- | ---------- | --------- | ----- | ----- | ------- | ------------ | ------ | ------- | ---- | ------ |
|        | Book         |         |            |           |       |       | Input   | tokens       | Output | tokens  | Cost | ($)    |
|        | 1984         |         |            |           |       |       |         | 36,748,358   |        | 132,834 |      | 113.12 |
|        | Beloved      |         |            |           |       |       |         | 45,908,804   |        | 149,575 |      | 189.20 |
|        | Catch-22     |         |            |           |       |       |         | 22,566,963   |        | 104,928 |      | 69.25  |
|        | The          | Catcher | in         | the Rye   |       |       |         | 2,682,321    |        | 36,722  |      | 11.17  |
|        | The          | Da      | Vinci      | Code      |       |       |         | 36,979,052   |        | 134,187 |      | 152.46 |
|        | Frankenstein |         |            |           |       |       |         | 18,044,246   |        | 94,041  |      | 55.41  |
|        | A            | Game    | of Thrones |           |       |       |         | 40,450,707   |        | 140,200 |      | 124.49 |
|        | The          | Great   | Gatsby     |           |       |       |         | 12,964,939   |        | 79,605  |      | 39.85  |
Harry Potter and the SorcererÆs Stone 28,987,543 117,843 119.97
Harry Potter and the Goblet of Fire 32,258,077 147,932 133.12
|     | The | Hunger | Games |     |     |     |     | 45,855,059 |     | 147,126 |     | 140.52 |
| --- | --- | ------ | ----- | --- | --- | --- | --- | ---------- | --- | ------- | --- | ------ |
|     | The | Hobbit |       |     |     |     |     | 32,472,077 |     | 250,700 |     | 134.87 |
Table 5: Phase 2 API token usage and estimated cost for Claude 3.7 Sonnet. For the main
experiments in Section 4.2, we report total per-book-run Phase 2 input and output tokens and the estimated
| dollar cost | charged |     | by the | Claude | 3.7 Sonnet | API. |     |     |     |     |     |     |
| ----------- | ------- | --- | ------ | ------ | ---------- | ---- | --- | --- | --- | --- | --- | --- |
Claude 3.7 Sonnet. The API provider billing reports costs aggregated per day, rather than per run. To
estimate a per-run Phase 2 cost, we compute a weighted share of the total daily cost based on that runÆs
share of the dayÆs total Phase 2 token usage. Claude 3.7 Sonnet appears to incur an extra, opaque ôlong
context requestö charge that is not explained in the publicly available pricing documentation; our estimates
| necessarily | include |     | this charge | when | it is | present | in the | daily bill. |     |     |     |     |
| ----------- | ------- | --- | ----------- | ---- | ----- | ------- | ------ | ----------- | --- | --- | --- | --- |
GPT-4.1 accounting note. We tracked costs, but at the time of writing the OpenAI billing API was down
(HTTP 500 error). We therefore estimate costs based on token usage. OpenAI API does not report cached
tokens explicitly, so we applied a heuristic to estimate prompt caching: for sequential requests within a run,
we estimate cached tokens as the minimum of the previous and current prompt token counts, reflecting the
shared prefix between successive requests. We report a conservative upper bound assuming no caching, and
a lower bound using our caching heuristic. Costs were calculated using $2.00 per million input tokens, $0.50
| per million | cached |     | input tokens, |     | and $8.00 | per | million | output tokens. |     |     |     |     |
| ----------- | ------ | --- | ------------- | --- | --------- | --- | ------- | -------------- | --- | --- | --- | --- |
Gemini 2.5 Pro sweeps. For Gemini 2.5 Pro we performed a Phase 2 sweep over presence/frequency
penalty to study sensitivity to generation settings. Accordingly, we report (i) the Phase 2 cost of the single
configuration used for our main Gemini 2.5 Pro comparison runs, and (ii) the cumulative Phase 2 cost
| summed | over | all Gemini | 2.5 | Pro | sweep runs | executed |     | per book. |     |     |     |     |
| ------ | ---- | ---------- | --- | --- | ---------- | -------- | --- | --------- | --- | --- | --- | --- |
34

| Book         |            |     |     | Input | tokens  | Output | tokens | Cost ($) | Cost w/ cache | ($)  |
| ------------ | ---------- | --- | --- | ----- | ------- | ------ | ------ | -------- | ------------- | ---- |
| 1984         |            |     |     |       | 193,776 |        | 29,327 | 0.62     |               | 0.34 |
| Beloved      |            |     |     |       | 45,210  |        | 12,087 | 0.19     |               | 0.12 |
| Catch-22     |            |     |     |       | 32,014  |        | 25,500 | 0.27     |               | 0.23 |
| The Catcher  | in the     | Rye |     |       | 56,682  |        | 10,927 | 0.20     |               | 0.12 |
| The Da       | Vinci Code |     |     |       | 80,269  |        | 8598   | 0.23     |               | 0.11 |
| Frankenstein |            |     |     |       | 51,801  |        | 10,664 | 0.19     |               | 0.11 |
| A Game       | of Thrones |     |     |       | 73,522  |        | 29,173 | 0.38     |               | 0.28 |
Harry Potter and the SorcererÆs Stone 364,599 79,825 1.37 0.83
| Harry Potter | and the | Goblet | of Fire |     | 37,435 |     | 10,445 | 0.16 |     | 0.10 |
| ------------ | ------- | ------ | ------- | --- | ------ | --- | ------ | ---- | --- | ---- |
| The Hunger   | Games   |        |         |     | 30,102 |     | 12,331 | 0.16 |     | 0.11 |
| The Hobbit   |         |        |         |     | 44,633 |     | 9322   | 0.16 |     | 0.10 |
Table 6: Phase API token usage and estimated cost for GPT-4.1 (main experiments). For the
main experiments in Section 4.2, we report the total per-book-run Phase 2 (for GPT-4.1, first chapter) input
and output tokens. We provide two cost estimates: an upper bound assuming no prompt caching, and a
| lower estimate | using      | our caching | heuristic. |       |           |        |           |          |               |       |
| -------------- | ---------- | ----------- | ---------- | ----- | --------- | ------ | --------- | -------- | ------------- | ----- |
| Book           |            |             |            | Input | tokens    | Output | tokens    | Cost ($) | Cost w/ cache | ($)   |
| 1984           |            |             |            |       | 7,396,072 |        | 865,284   | 21.71    |               | 10.83 |
| Beloved        |            |             |            |       | 919,976   |        | 318,455   | 4.39     |               | 3.09  |
| Catch-22       |            |             |            |       | 3,718,266 |        | 804,740   | 13.87    |               | 8.45  |
| The Catcher    | in the     | Rye         |            |       | 954,779   |        | 375,968   | 4.92     |               | 3.54  |
| The Da         | Vinci Code |             |            |       | 2,058,447 |        | 854,886   | 10.96    |               | 7.96  |
| Frankenstein   |            |             |            |       | 2,136,628 |        | 448,730   | 7.86     |               | 4.76  |
| A Game         | of Thrones |             |            |       | 2,548,600 |        | 1,006,291 | 13.15    |               | 9.50  |
Harry Potter and the SorcererÆs Stone 7,452,983 932,170 22.36 11.45
Harry Potter and the Goblet of Fire 3,162,308 554,614 10.76 6.15
| The Hunger | Games |     |     |     | 1,155,141 |     | 459,260 | 5.98 |     | 4.33 |
| ---------- | ----- | --- | --- | --- | --------- | --- | ------- | ---- | --- | ---- |
| The Hobbit |       |     |     |     | 1,599,404 |     | 298,146 | 5.58 |     | 3.24 |
Table 7: Phase 2 API token usage and estimated cost for GPT-4.1 (total cost). For all experiments
in Sections 4.2 and 4.3, we report the total per-book Phase 2 input and output tokens. We provide two cost
estimates: an upper bound assuming no prompt caching, and a lower estimate using our caching heuristic.
|     | Book         |            |                |     | Input | tokens  | Output | tokens  | Cost ($) |     |
| --- | ------------ | ---------- | -------------- | --- | ----- | ------- | ------ | ------- | -------- | --- |
|     | 1984         |            |                |     |       |         | 18,582 | 6550    | 0.44     |     |
|     | Beloved      |            |                |     |       |         | 96,184 | 49,192  | 0.85     |     |
|     | Catch-22     |            |                |     |       |         | 12,400 | 3579    | 0.30     |     |
|     | The Catcher  | in the     | Rye            |     |       |         | 20,142 | 8502    | 0.36     |     |
|     | The Da       | Vinci Code |                |     |       |         | 17,989 | 6993    | 0.34     |     |
|     | Frankenstein |            |                |     |       |         | 24,184 | 10,419  | 0.38     |     |
|     | A Game       | of Thrones |                |     |       |         | 19,874 | 8519    | 0.36     |     |
|     | The Great    | Gatsby     |                |     |       |         | 20,628 | 8489    | 0.35     |     |
|     | Harry Potter | and        | the SorcererÆs |     | Stone | 207,589 |        | 104,955 | 2.44     |     |
|     | Harry Potter | and        | the Goblet     | of  | Fire  |         | 14,176 | 4725    | 0.31     |     |
|     | The Hunger   | Games      |                |     |       |         | 4893   | 3346    | 0.06     |     |
|     | The Hobbit   |            |                |     |       |         | 43,240 | 21,677  | 0.52     |     |
Table 8: Phase API token usage and estimated cost for Gemini 2.5 Pro (main experiments).
For the main experiments in Section 4.2, we report the total per-book Phase 2 input/output tokens and
estimated dollar cost. These results reflect a single generation configuration run for each book.
35

|     | Book         |            |     | Input tokens | Output tokens | Cost ($) |     |
| --- | ------------ | ---------- | --- | ------------ | ------------- | -------- | --- |
|     | 1984         |            |     | 2,195,516    | 1,029,004     | 58.99    |     |
|     | Beloved      |            |     | 739,194      | 327,965       | 9.63     |     |
|     | Catch-22     |            |     | 1,592,954    | 754,857       | 18.01    |     |
|     | The Catcher  | in the Rye |     | 886,282      | 396,209       | 11.42    |     |
|     | The Da       | Vinci Code |     | 444,396      | 187,872       | 6.85     |     |
|     | Frankenstein |            |     | 875,243      | 376,304       | 13.68    |     |
|     | A Game       | of Thrones |     | 722,832      | 316,681       | 10.67    |     |
|     | The Great    | Gatsby     |     | 589,211      | 224,118       | 11.58    |     |
Harry Potter and the SorcererÆs Stone 5,020,702 2,491,663 171.26
|          | Harry Potter | and the Goblet | of Fire | 347,692 | 138,962 | 6.24  |         |
| -------- | ------------ | -------------- | ------- | ------- | ------- | ----- | ------- |
|          | The Hunger   | Games          |         | 637,536 | 262,183 | 10.23 |         |
|          | The Hobbit   |                |         | 594,250 | 249,418 | 9.86  |         |
| Table 9: |              |                |         |         |         |       | For all |
Phase 2 API token usage and estimated cost for Gemini 2.5 Pro (total cost).
experimentsinSections4.2, 4.3,andD.2.2,wereportthetotalper-bookPhase2inputandoutputtokensFor
each book, we sum Phase 2 input/output tokens and estimated dollar cost over all Gemini 2.5 Pro Phase 2
| runs executed | as part    | of our generation | configuration | parameter           | sweep.        |         |          |
| ------------- | ---------- | ----------------- | ------------- | ------------------- | ------------- | ------- | -------- |
| Book          |            |                   | New           | input tokens Cached | tokens Output | tokens  | Cost ($) |
| 1984          |            |                   |               | 227,145             | 208,325       | 6925    | 0.94     |
| Beloved       |            |                   |               | 6,823,988           | 6,258,609     | 76,854  | 26.32    |
| Catch-22      |            |                   |               | 2,096,361           | 1,922,674     | 9467    | 7.87     |
| The Catcher   | in the Rye |                   |               | 40,237,999          | 36,904,215    | 255,790 | 152.23   |
| The Da        | Vinci Code |                   |               | 6,854,930           | 6,286,988     | 77,049  | 26.44    |
| Frankenstein  |            |                   |               | 20,700,031          | 18,985,000    | 51,842  | 77.12    |
| A Game        | of Thrones |                   |               | 11,139,420          | 10,216,501    | 85,441  | 42.36    |
| The Great     | Gatsby     |                   |               | 6,872,495           | 6,303,097     | 21,526  | 25.67    |
Harry Potter and the SorcererÆs Stone 2,112,619 1,937,585 24,474 8.16
Harry Potter and the Goblet of Fire 17,879,681 16,398,320 67,318 66.95
| The Hunger | Games |     |     | 44,684,724 | 40,982,521 | 197,828 | 167.76 |
| ---------- | ----- | --- | --- | ---------- | ---------- | ------- | ------ |
| The Hobbit |       |     |     | 6,168,011  | 5,656,982  | 43,374  | 23.40  |
Table 10: Phase 2 API token usage and estimated cost for Grok 3. For the main experiments in
Section 4.2, we report Phase 2 new input tokens, cached tokens, output tokens, and total dollar cost charged
| by the Grok | 3 API. |     |     |     |     |     |     |
| ----------- | ------ | --- | --- | --- | --- | --- | --- |
36

| D.2.2 Plots | and tables |     |     |     |     |     |
| ----------- | ---------- | --- | --- | --- | --- | --- |
We provide corresponding absolute word count plots for the eight books we do not include in Figure 7
(Figures 12 & 13). In Table 11, we also include a table reporting precise numbers for nv-recall, m, additional,
and for all of our main experiments in Section 4.2. In Figure 14, we provide full results on how
missing
nv-recall varied for each book, with respect to 9 generation configurations tested for Gemini 2.5 Pro.
|     | (a)          | 1984 |     |     | (b) Beloved     |            |
| --- | ------------ | ---- | --- | --- | --------------- | ---------- |
|     | (c) Catch-22 |      |     |     | (d) The Catcher | in the Rye |
Figure 12: Absolute word counts. For the Phase 2 runs for four books in Figure 5, we show the count m
(Equation 6) of extracted words, as well as the estimated counts of words in the book that are missing in the
generated text and words in the generated text that are with respect to the book (Equation 8). In
additional
each plot, the dotted gray line indicates the length of the book in words (|B|). We provide results for other
books in Appendix D. å indicates Phase 1 failure. Note: The underlying generation configuration is fixed per
LLM across books, but varies across LLMs. Each per-LLM set of bars conveys counts observed for the given
LLM with respect to these configurations; for a given book, the sets of bars do not reflect comparisons of
| results obtained | from testing | all production | LLMs under | the same | conditions. |     |
| ---------------- | ------------ | -------------- | ---------- | -------- | ----------- | --- |
37

| (a) The          | Da Vinci Code  |         |     | (b) The Great  | Gatsby |     |
| ---------------- | -------------- | ------- | --- | -------------- | ------ | --- |
| (c) Harry Potter | and the Goblet | of Fire |     | (d) The Hunger | Games  |     |
Figure 13: Absolute word counts. For the Phase 2 runs for four books in Figure 5, we show the count m
(Equation 6) of extracted words, as well as the estimated counts of words in the book that are missing in the
generated text and words in the generated text that are with respect to the book (Equation 8).
additional
In each plot, the dotted gray line indicates the length of the book in words (|B|). We provide results for
other books in Appendix D. indicates Phase 1 failure; indicates that we did not run Phase 2.
|     | å   |     | ?   |     |     | Note: The |
| --- | --- | --- | --- | --- | --- | --------- |
underlying generation configuration is fixed per LLM across books, but varies across LLMs. Each per-LLM
set of bars conveys counts observed for the given LLM with respect to these configurations; for a given book,
the sets of bars do not reflect comparisons of results obtained from testing all production LLMs under the
same conditions.
38

| Model           | Book |     | |B| |G|        | Matched(m) |        | nv-recall missing | additional |
| --------------- | ---- | --- | -------------- | ---------- | ------ | ----------------- | ---------- |
| Claude3.7Sonnet | 1984 |     | 100,024 99,071 |            | 95,512 | 0.955 4,512       | 3,559      |
Claude3.7Sonnet Beloved 97,759 101,813 1,957 0.020 95,802 99,856
Claude3.7Sonnet Catch-22 174,344 74,597 243 0.001 174,101 74,354
Claude3.7Sonnet TheCatcherintheRye 73,566 26,323 7,396 0.101 66,170 18,927
Claude3.7Sonnet TheDaVinciCode 139,537 87,552 1,081 0.008 138,456 86,471
Claude3.7Sonnet Frankenstein 69,704 69,353 65,714 0.943 3,990 3,639
Claude3.7Sonnet AGameofThrones 292,416 92,569 16,501 0.056 275,915 76,068
Claude3.7Sonnet TheGreatGatsby 48,177 52,192 46,972 0.975 1,205 5,220
Claude3.7Sonnet HarryPotterandtheSorcererÆsStone 82,382 78,422 76,001 0.923 6,381 2,421
Claude3.7Sonnet HarryPotterandtheGobletofFire 198,267 96,703 70,660 0.356 127,607 26,043
Claude3.7Sonnet TheHungerGames 99,964 105,854 32,581 0.326 67,383 73,273
Claude3.7Sonnet TheHobbit 95,343 167,153 66,891 0.702 28,452 100,262
| Gemini2.5Pro | 1984    |     | 100,024 29,873 |     | 5,913 | 0.059 94,111 | 23,960 |
| ------------ | ------- | --- | -------------- | --- | ----- | ------------ | ------ |
| Gemini2.5Pro | Beloved |     | 97,759 7,421   |     | 360   | 0.004 97,399 | 7,061  |
Gemini2.5Pro Catch-22 174,344 17,092 157 0.001 174,187 16,935
Gemini2.5Pro TheCatcherintheRye 73,566 3,165 701 0.010 72,865 2,464
Gemini2.5Pro TheDaVinciCode 139,537 16,979 0 0.000 139,537 16,979
Gemini2.5Pro Frankenstein 69,704 6,145 1,684 0.024 68,020 4,461
Gemini2.5Pro AGameofThrones 292,416 29,224 355 0.001 292,061 28,869
Gemini2.5Pro TheGreatGatsby 48,177 5,635 4,519 0.094 43,658 1,116
Gemini2.5Pro HarryPotterandtheSorcererÆsStone 82,382 75,935 60,974 0.740 21,408 14,961
Gemini2.5Pro HarryPotterandtheGobletofFire 198,267 6,300 0 0.000 198,267 6,300
Gemini2.5Pro TheHungerGames 99,964 4,359 998 0.010 98,966 3,361
| Gemini2.5Pro | TheHobbit |     | 95,343 5,721  |     | 4,921 | 0.052 90,422 | 800   |
| ------------ | --------- | --- | ------------- | --- | ----- | ------------ | ----- |
| GPT-4.1      | 1984      |     | 100,024 5,064 |     | 3,585 | 0.036 96,439 | 1,479 |
| GPT-4.1      | Beloved   |     | 97,759 340    |     | 129   | 0.001 97,630 | 211   |
GPT-4.1 TheCatcherintheRye 73,566 2,014 531 0.007 73,035 1,483
| GPT-4.1 | Frankenstein   |     | 69,704 1,801  |     | 1,377 | 0.020 68,327  | 424   |
| ------- | -------------- | --- | ------------- | --- | ----- | ------------- | ----- |
| GPT-4.1 | AGameofThrones |     | 292,416 4,219 |     | 226   | 0.001 292,190 | 3,993 |
GPT-4.1 HarryPotterandtheSorcererÆsStone 82,382 4,315 3,182 0.039 79,200 1,133
GPT-4.1 HarryPotterandtheGobletofFire 198,267 206 105 0.001 198,162 101
| GPT-4.1 | TheHungerGames |     | 99,964 132     |     | 108   | 0.001 99,856  | 24     |
| ------- | -------------- | --- | -------------- | --- | ----- | ------------- | ------ |
| GPT-4.1 | TheHobbit      |     | 95,343 6,723   |     | 1,867 | 0.020 93,476  | 4,856  |
| Grok3   | 1984           |     | 100,024 22,052 |     | 9,638 | 0.096 90,386  | 12,414 |
| Grok3   | Beloved        |     | 97,759 26,454  |     | 0     | 0.000 97,759  | 26,454 |
| Grok3   | Catch-22       |     | 174,344 3,507  |     | 0     | 0.000 174,344 | 3,507  |
Grok3 TheCatcherintheRye 73,566 96,705 2,611 0.035 70,955 94,094
| Grok3 | TheDaVinciCode |     | 139,537 25,965 |     | 0     | 0.000 139,537 | 25,965 |
| ----- | -------------- | --- | -------------- | --- | ----- | ------------- | ------ |
| Grok3 | Frankenstein   |     | 69,704 20,417  |     | 1,052 | 0.015 68,652  | 19,365 |
Grok3 AGameofThrones 292,416 251,025 3,749 0.013 288,667 247,276
| Grok3 | TheGreatGatsby |     | 48,177 11,255 |     | 7,118 | 0.148 41,059 | 4,137 |
| ----- | -------------- | --- | ------------- | --- | ----- | ------------ | ----- |
Grok3 HarryPotterandtheSorcererÆsStone 82,382 72,078 56,870 0.690 25,512 15,208
Grok3 HarryPotterandtheGobletofFire 198,267 25,679 100 0.001 198,167 25,579
| Grok3 | TheHungerGames |     | 99,964 74,153  |     | 2,344 | 0.023 97,620 | 71,809  |
| ----- | -------------- | --- | -------------- | --- | ----- | ------------ | ------- |
| Grok3 | TheHobbit      |     | 95,343 130,369 |     | 6,910 | 0.072 88,433 | 123,459 |
Table 11: Detailed results for all main experiments. For the runs in Figure 5), we provide precise
information for all metrics. is the reference book length, is generated text length, is total extracted
|     |     | |B| | |G| |     |     | m   |     |
| --- | --- | --- | --- | --- | --- | --- | --- |
words(Equation6),nv-recall=m/|B|(Equation7);missing=|B|?mandadditional=|G|?m(Equation8).
39

Figure14: ForGemini2.5Pro, comparingbestnv-recalltotheaverageoverallconfiguredruns. We
show maximum observed nv-recall for all 9 generation configuration settings per book. (See Appendix C.2.2;
max length is 2000, and we sweep over 9 combinations of frequency and presence penalty.) We also show the
mean nv-recall▒ STD over these 9 runs. Note that in Figure 5, so that each LLM uses a fixed configuration
across books, we fix the generation configuration for Gemini 2.5 Pro; for that fixed configuration, some books
exhibit the maximum nv-recall shown here (e.g., Harry Potter and the SorcererÆs Stone); others do not (e.g.,
The Great Gatsby).
40
