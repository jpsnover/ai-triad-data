<!--
  AI Triad Research Project — Document Snapshot
  Title      : Women are too easily offended, but robots aren't: a feminist critique of sentiment analysis
  Source     : 
  Type       : pdf
  Captured   : 2026-04-27
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Women are too easily offended, but robots aren't: a feminist critique of sentiment analysis

> **Snapshot captured:** 2026-04-27
> **Source:** 
> **Type:** pdf

---
AI & SOCIETY (2026) 41:989û1003
https://doi.org/10.1007/s00146-025-02582-6

OPEN FORUM

Women are too easily offended, butárobots aren't: aáfeminist critique
ofásentiment analysis

DarφoáDo±a?Falc≤n1á╖ PilaráMedina?Bravo1

Received: 11 November 2024 / Accepted: 21 August 2025 / Published online: 2 September 2025
⌐ The Author(s) 2025

Abstract
The history of the study of emotions has given way to several disciplines that have expanded our knowledge of the human
mind, like psychology and philosophy. In our current times, Sentiment Analysis presents itself as a new path to study this
field through automated and computerized means. However, automated systems can also carry many biases, such as sex?
ism, thus possibly skewing their analysis towards a perpetuation of misogynistic views. By employing different Sentiment
Analysis models on two sexism inventories, we observe that the emotional analysis these methods carry out varies in effec?
tiveness and that this analysis can only reach a superficial understanding of sexism. Through these findings, we elaborate a
critique of the technological concept of objectivity and neutrality in science. This study brings the feminist epistemological
view to light to warn against an uncritical, indiscriminate use of technologies that can result in the further perpetuation and
standardization of sexist biases in science.

Keywords  Sentiment analysisá╖ Epistemologyá╖ Feminismá╖ Neosexismá╖ Artificial intelligence

1   Introduction andáobject ofástudy

The study of human emotions has been an area of academic
fascination for centuries. From the many philosophical per?
spectives on peopleÆs inner lives to the development of sci?
entific disciplines like psychology and neuroscience, many
scholars have delved into the identification and explanation
of those states that arise in an almost innately familiar way
yet remain a mystery in many aspects. In the era of auto?
mation, as many fields become new experimental grounds
for Machine Learning (ML) and Artificial Intelligence (AI),
Computer Science has also taken its turn in the exploration
of emotions through the development of Sentiment Analysis
(SA) techniques.

The use of the expression ôWomen are too easily offendedö in the
title is a direct quote of the fifth item in the Ambivalent Sexism
Inventory (the second item in the list of Hostile Sexism), which is
employed in the study.

 *  Darφo Do±a?Falc≤n
dario.dona@upf.edu

Pilar Medina?Bravo
pilar.medina@upf.edu

1  Pompeu Fabra University, Barcelona, Spain

The field of Sentiment Analysis has supposed a new step
for the understanding of the relations between the human
mind and computer science. SA, also known as Opinion
Mining, is defined as ôthe field of study that analyzes peo?
pleÆs opinions, sentiments, evaluations, appraisals, attitudes,
and emotions towards entities such as products, services,
organizations, individuals, issues, events, topics, and their
attributesö (Liu 2012, p. 7) through Machine Learning and
other automated methods, and consists in the identification
of emotional content in textual data. To do this, Sentiment
Analysis techniques work in three different levels. The first
tier is known as the document level, which looks at the
overall sentiment conveyed throughout the entire text being
analyzed. At this level, it's assumed there's only one main
subject of opinion, so it's not ideal for comparing differ?
ent topics. Moving to the second tier, we have the sentence
level, which focuses on opinions expressed in individual sen?
tences. This helps break down the overall sentiment of the
text and understand its details more clearly. Lastly, we have
the aspect level, also known as the entity or feature level.
Here, the analysis zooms in on how different words and
expressions are perceived, allowing us to grasp the impor?
tance of various linguistic mechanisms like negation in sen?
tences and similar language patterns. Many systems analyze
the aspect level first and add up the emotional content found

Vol.:(0123456789)

990

AI & SOCIETY (2026) 41:989û1003

to generate the sentence level analysis, doing the same again
with the results from this level to achieve the final document
level results (Medhat etáal. 2014). These concepts found the
base framework for SA models.

The results for the different levels are interpreted and
expressed by the Sentiment Analysis system in terms of
polarity, which was initially established as a binary variable
that could be ôpositiveö or ônegativeö. More recently, many
Sentiment Analysis systems have started to evaluate the text
within a polarity spectrum, which assigns gradual values
between the extremes of ôpositiveö and ônegativeö (Pang and
Lee 2005). This has made Sentiment Analysis techniques
very popular in fields where human interaction is of high
relevance, like communications, where SA is employed for
studying trends and opinions on specific events or topics
(Drus and Khalid 2019; Yue etáal. 2019), education, where
it is mainly used to monitor studentsÆ emotions during class
(Mite?Baidal etáal. 2018; Zhou and Ye 2023) or marketing,
where SA models are used to study product reviews and give
brands useful information for the development and market?
ing of their products (Rambocas and Pacheco 2018). This
proliferation of Sentiment Analysis methodologies has also
taken hold of the world of research, as it has started to be
implemented more frequently in different areas of studies.

This  field  has  seen  very  rapid  development,  mainly
through the use of AI technologies and the introduction
of ML and Deep Learning (DL) into the field. This field
includes many different methodologies that can be imple?
mented to extract the polarity of text. Within these method?
ologies, we can find lexicon?based approaches, which are
based on dictionaries or corpuses, which are collections of
words that the system can identify and evaluate, and which
are  associated  with  a  certain  polarity  through  training
(Wankhade etáal. 2022). However, newer techniques involve
ML and DL techniques to improve the analysis and the use
of contextual information. By employing neural networks,
which are formed by layers that process the information they
receive in and pass them onto the next one, SA has been
developed into more complex models that go beyond associ?
ating a polarity to each word or expression (Rojas?Barahona
2016; Tang etáal. 2015). The introduction of attention mech?
anisms and the Transformer architecture was a great step for
SA, as the models developed from it can relate the words in
a sentence to one another to extract contextual information
and better evaluate the input (Vaswani etáal. 2023). Overall,
the field of SA keeps on developing at a quick speed, mainly
in its technical aspects.

Innovation, however, is not the only relevant factor that
comes with technological advancements, and while the use
of state?of?the?art tools is highly encouraged in many work?
places and fields of study, the early adoption of these devices
and  methods  can  serve  to  perpetuate  existing  problems
in research or lose control of our work. While Sentiment

Analysis offers an interesting and new methodology for
many tasks and fields, a deeper understanding of what auto?
mated emotional analysis implies is necessary before truly
introducing it into our understanding of the human mind.

2   Theoretical framework

2.1   Technological knowledge andásocial

detachment

Technology surrounds us in every aspect of our lives in a
deeper way than it has ever before in history: our informa?
tion, work, resource management, communication and even
our leisure are for the most part dependent on technological
tools and implementations. As Adorno (1998) once put it,
we are currently technological people. This has resulted in
a generalized perspective on technology as a daily element
of life through which the fascination and suspicion felt by
earlier generations for new technical advancements, like the
critique towards printed media after Johannes Gutenberg
unveiled the first press in the XV century, has given way
to a more superficial outlook on the implications that the
tools we use have as representations of the social structures
we live in. As such, technology becomes fetishized (in the
critical philosophical sense of the word), and its creation and
use are taken as individual acts mostly separated from our
relations to other humans and to humanity as a collective.

In a society whose ruling structures have historically per?
petuated a system of oppression that is sexist, racist and
capitalist, a fetishized superficial view of technology results
in a separation between technology and social conscience.
Marginalized communities are put in danger of suffering
through the use of technological tools, which are consid?
ered to be independent and neutral objects by this fetishized
view (Joque 2022; Wacjman and Young 2023). Plant (2000)
explains this fetishization and the view resulting from it as
parallel to marriage vows, and in specific as a marriage of
the machines to the system under which they are developed,
thus serving it and working to maintain it. However, she
is optimistic about the possibilities of liberation that these
technologies bring forth to create networks that will help
womenÆs struggle (1997), much like Haraway when she
explored robotics and technology as a way to free society
from gender identity and oppression (1991), thus showing
the contradictory nature of technology and its fetishization
in our current system.

The possibilities that technology offers for human activ?
ity then clash with the way society employs technological
devices. In a similar vein to Adorno, Marshall McLuhan
developed a theory of technology as an ôextension of manö
according to which technological advancements are made to
fulfill a design intent or necessity but also carry a message

AI & SOCIETY (2026) 41:989û1003

991

(a social implication) which does not appear immediately to
individuals or society (McLuhan 1988). According to McLu?
han, people employ and create technologies without being
conscious of the social factors that their technology repre?
sents, factors that are influential both in the development
and in the latter use of the tools. As technology develops
further and gains more relevance in society, it becomes a
crucial element in shaping peopleÆs behaviors too, as a lack
of conscious thought on the structures behind technology
solidify them and drive us into perpetuating them further
(McLuhan 1962). This technological determinism allows for
technological development to see itself mostly unchallenged
by different social causes that struggle with existing oppres?
sive structures, like feminism (although there are exceptions
to this like some technofeminist currents), and thus these
structures see themselves reinforced.

There is another effect of this on the users, due to the
increasing complexity of the technological tools we employ
and the lack of knowledge people tend to have about them.
This lack of knowledge, which aids the fetishized view of
technology to maintain itself as it dissuades people from
looking deeper into the technologies they use (Cao etáal.
2021), also results in feelings of powerlessness and aliena?
tion (Lasch 1979; Minch and Ray 1986), which isolate users
and hold them back from involving themselves further in
knowing these technologies. For communities that have
already seen themselves historically isolated or disadvan?
taged, this can also imply that technologies are not made to
accommodate their needs. These communities might expe?
rience disenfranchisement from access to technologies and
might be culturally and economically gatekept from them, as
in the case of many disabled people being barred from inte?
grating into online spaces for a long time due to hardware
and software design not taking them into account (Bowker
2010). This situation, in turn, results in a lack of engage?
ment with these communities when it comes to designing
new technologies.

2.2   Emotional hierarchies andátheáfeminist

epistemological view

In fact, the way emotions are conceived in the development
of Sentiment Analysis technologies brings forth another con?
cern that puts the adequacy of these systems in question. For
most Sentiment Analysis models, emotions can be classified
as being positive, neutral, or negative (Esuli and Sebastiani
2006; Pang and Lee 2005), with the positives mainly relat?
ing to happiness and satisfaction, the negatives with sadness
and anger, and the neutral emotions being reduced to a sort
of indifference or lack of significance. This categorization,
harmless in its appearance, relates to specific political and
cultural views of emotions and their social implications.

The positive aspects of an emotion are not absolute or
natural, but rather an interpretation of how this emotion can
help contribute to an individualÆs satisfaction of objectives
that fall in line with the socially accepted paths a person may
take in life (Ahmed 2014; Davies 2015), relating these emo?
tions directly to a series of social imperatives that are seen
as normative. In this way, emotions are hierarchized and
ôpositiveö emotions become elements to be cultivated and
reinforced while ônegativeö emotions must be suppressed
or repurposed, and techniques such as mindfulness lessons
are developed that not only reaffirm this idea, but also help
implement it further within the general population (Cullen
2011). In the sexist capitalist system we live in, this will
mean that the way the emotional hierarchy is set up will, in
some cases, serve as an obstacle for practices and discourse
that position themselves in opposition to oppressive environ?
ments and situations, such as complaints and denouncement
of sexist behaviors and actions (Ahmed 2021; Illouz 2008).
This hierarchization ultimately serves to keep the inequality
that is structurally enforced in society.

Part of the political hierarchization of emotions has also
involved the subordination of these to reason as a more rel?
evant aspect of decision making (Ahmed 2014), thus under?
estimating the effects emotions have on the way we direct
ourselves in life (Gill 2017; Illouz 2007), which are more
pervasive than it is usually mentioned. This has, historically,
been tied to the association of womanhood with emotional
chaos and inferiority, as expressed by Kant with his quote
ôit is difficult for me to believe that the fair sex is capable
of principlesö (Frierson 2011, p. 39). The misogyny present
in the history of the social understanding of emotions can
be present in SA systems too, as the data they learn from
has been created in the same society that has held and cur?
rently holds the structures that allow for sexist behavior and
thought. This could manifest by considering negative expres?
sions directed against women as positive or neutral or by
judging emotions that have historically been considered to
be womanly as negative.

In neoliberal discourse, positive emotions are directed
towards the accumulation of wealth and the conception of
the self as an autonomous, independent individual (Arthing?
ton 2016), resulting in a state of alienation and competitive
hostility towards others (Becker etáal. 2021) that fosters emo?
tional unrest. This relates to what Lauren Berlant (2007, p.
33) defines as cruel optimism, ôa relation of attachment to
compromised conditions of possibility whose realization is
discovered either to be impossible, sheer fantasy, or too pos?
sible, and toxicö. This definition is a way to question how the
pursuit of positive emotions and goals affects people within
the neoliberal context. This discomfort becomes more gener?
alized as material conditions make it increasingly harder for
most of the population to achieve the goals set by the capital?
ist standard in the first place (Palmer 2013), keeping people

992

AI & SOCIETY (2026) 41:989û1003

in a painful situation of constant dissatisfaction. If the emo?
tional classification of Sentiment Analysis systems reflects
the same hierarchy as the one established by the ôcommon
senseö of capitalist structures, then these tools may serve to
keep people tethered to harmful psychological patterns in
the many different fields where they can be employed, and
even to make it harder for individuals and collectives to find
other paths that represent healthier outcomes.

In the way they present themselves, Sentiment Analy?
sis systems seem to offer a new convenient way to study
peopleÆs emotions with a velocity and efficiency that has
never been seen before, but they do not offer a view of the
world they exist in. For decades, feminist epistemologies
have denounced the way that science is considered to create
ôobjectiveö knowledge while supporting the disenfranchise?
ment of marginalized groups (Harding 1996; Wigginton and
Lafrance 2019), and we can now point to the ôobjectiveö
technologies that are born from this science as tools to ena?
ble this perpetuation of oppressive conditions (Fee 1981).
The  study  of  emotions  and  psychology  in  general  have
social, human and philosophical roots which we must not
forget, and the overreliance on quantitative research (Ben?
nett 2021) and the adoption of ways to automate it suppose
a danger for qualitative inquiry and critical work.

While there have been studies that tried to adapt Sen?
timent  Analysis  models  to  a  more  feminist  perspective
(Abburi etáal. 2024; Rodriguez etáal. 2020) or SA imple?
mentations that attempt to tackle specific social issues, such
as hate speech detectors (Jiang and Suzuki 2019), these tend
to have a lower precision than more general models or be
limited in scope. Furthermore, most research that attempts to
introduce sexism detection into Sentiment Analysis does not
take into account the epistemological questioning of these
tools in the first place, and treats sexism mainly in a linguis?
tic, explicit sense, which does not completely represent the
structural and more subtle ways in which sexism, racism, or
capitalist ideas are sustained.

2.3   Different modalities ofásexism

In this study, we will focus on the subtle and varied forms
of sexism that could represent a challenge for Sentiment
Analysis models and the conception of emotions that is
associated with them. Sexism has at its core the purpose
and utility of maintaining menÆs domination over women
(Swim and Campbell 2003), but this purpose can be con?
veyed in different ways when it is expressed. The theory
of ambivalent sexism divides these expressions into two
categories, hostile sexism and benevolent sexism (Glick
and Fiske 1996). Hostile sexism, which is also commonly
referred to as classic misogyny, is the more explicit and
violent  representation  of  sexism  through  expressions,
beliefs, or actions that follow the traditional conception

of prejudice and carry harmful intentions towards women.
On the other hand, benevolent sexism upholds traditional
and sexist stereotypes about women, but it is expressed in
a way that is perceived as positive in tone and is related to
caring, protection and helping women. This means that,
from the point of view of the current hierarchy of emo?
tions, expressions that carry benevolent sexism are mostly
viewed as positive and harmless while they maintain the
status quo. On the basis of this distinction, Glick and Fiske
developed an Inventory of items to distinguish peopleÆs
acceptance of hostile and benevolent sexism.

Glick and FiskeÆs inventory is, however, not the only
sexism inventory that is currently studied in psychology.
The Neosexism Inventory (Tougas etáal. 1995) studies a
specific expression of sexism that belongs to more recent
times. In a context in which social progress has made it
less acceptable to express traditional misogynist views,
neosexism appears as a form of sexism that hides itself as
an opposition to the political and social demands of femi?
nism, maintaining dominance of men over women through
the characterization of womenÆs progress as a threat to
men. Both neosexism and benevolent sexism are ways in
which sexist expressions hide themselves in a way that
makes them less likely to be challenged, and thus might
also be harder to detect for Sentiment Analysis models.

2.4   Aims andáquestions

This study aims to observe the relation between Sentiment
Analysis models and different types of sexism in language
as a way to examine how these technologies interpret sex?
ist expressions and emotions in order to discern what role
they can have in the perpetuation of the oppression of
women. To do this, we will employ Sentiment Analysis
using three different models on two sexism inventories to
simulate the usual implementations of Sentiment Analysis
models. The SA models employed were VADER, Distil?
BERT and RoBERTa. Given the main objective, different
research questions have been elaborated.

û  RQ1 Do Sentiment Analysis models classify sexist sen?
tences as negative, or do they consider them to be either
positive or neutral?

û  RQ2 Are there differences in the evaluation that Sen?
timent Analysis models do of language that expresses
Benevolent Sexism, Hostile Sexism or Neosexim?

AI & SOCIETY (2026) 41:989û1003

993

Table 1   Sample sentences from the database alongside the inventory they come from

Sentence

Most women interpret innocent remarks or acts as being sexist
Women seek to gain power by getting control over men
Women, as compared to men, tend to have a more refined sense of culture and good taste
A good woman should be set on a pedestal by her man
Over the past few years, women have gotten more from government than they deserve
I consider the present employment system to be unfair to women

Original inventory

Ambivalent Sexism (Hostile sexism)
Ambivalent Sexism (Hostile sexism)
Ambivalent Sexism (Benevolent sexism)
Ambivalent Sexism (Benevolent sexism)
Neosexism
Neosexism

3   Methodology: quantitative analysis ofáSA

models

3.1   Data collection andáprocedure

To carry out this study, the first step was to gather a database
of sentences that could serve as an itemized list of different
forms of sexist language. To do this, we employed the items
that can be found in Glick and FiskeÆs Ambivalent Sexism
Inventory (1996) and those given by Tougas etáal. (1995) in
their Neosexism Inventory. While these are not examples
of collected utterances, they are written instances of sexist
thought and behavior that have a great precedent in psycho?
logical research. All of the items were taken as they were
written in the inventories and put in order in a datasheet that
was then inputted into a Python notebook.

Once the sentences were all collected, they were put in
an Excel sheet. After this step, a total of 33 sentences made
up the database, out of which 22 came from the Ambivalent
Sexism Inventory and 11 were taken from the Neosexism
Inventory. This sample size was considered acceptable as
the high precision of the already trained standard Sentiment
Analysis models makes it sufficient to work with this amount
of samples and due to the relevance of these two specific
inventories in the field of sexism research, as they are the
most employed sexism inventories among the available ones.
These sentences were all classified manually in accordance
with the different types of sexism that are included in this
study, that is, they were categorized as either neosexism,
hostile sexism or benevolent sexism. Given that 7 of the
33 sentences in the inventories are actually not sexist (with
the other 26 being explicitly sexist) and are instead used to
measure negative reaction to them (see Tableá2), these were
classified as non?sexist, but were put through the analysis
process nonetheless as they too were considered to be of
interest. Tableá1 shows some of the sentences gathered for
the database.

Once the sample database was completed, the data was
pre?processed using Python to make it appropriate for analy?
sis. For the VADER analyzer, the first procedure realized
was lemmatization. This is a Natural Language Processing
(NLP) technique employed to reduce words to their base or

root form, referred to as a lemma. It employs a systematic
approach to normalize the text by transforming diverse word
variations, encompassing plurals and various verb tenses,
into their shared base form. This process helps to facilitate a
more precise and efficient analysis of text data, as it enables
the grouping together of words with similar meanings and
reduces the computing load required by the system used. The
lemmatizer employed was the WordNet lemmatizer from the
NLTK library, which uses the WordNet dictionary to find the
lemma of each word in the sentence (Bird and Loper 2004;
Miller 1995).

After  the  lemmatization  process,  the  sample  dataset
underwent tokenization to make the data more appropriate
for the analysis and support entity recognition. Tokeniza?
tion is a crucial preprocessing step that involves breaking
down the text into discrete units or "tokens," such as words,
phrases, or individual characters. The fundamental purpose
of tokenization is to structure the text effectively, simplifying
subsequent analysis. This procedure includes the removal
of punctuation and non?word elements, segmentation of the
text into distinct words or phrases, and the assignment of
unique numerical values to each token. Through this break?
down into smaller components, tokenization makes it easier
for the computer to identify textual units to analyze. For the
VADER analyzer, the tokenizer used was the WhiteSpace
tokenizer from the NLTK library, which tokenizes sequences
at a word level by creating a token every time it finds a
white space in the sentence. In the case of the BER?based
models, each used a pre?trained version of its own baseline
tokenizer. The DistilBERT tokenizer, which employs Word?
Piece subword tokenization, turns each word into tokens that
it can recognize and relate to each other (Devlin etáal. 2019).
The RoBERTa tokenizer, however, uses byte?pair encoding,
which works by substituting the most used pairs of bytes in a
sequence for a new byte, thus compressing the sequence and
allowing for better processing (Gage 1994).1

1  The  code  for  the  analysis  and  pre?processing  can  be  found  in  the
following  GitHub  repository:  https:// github. com/ dario dona/ Sexism?
in? Senti ment? Analy sis? data.

994

AI & SOCIETY (2026) 41:989û1003

Once the data was correctly processed, the Sentiment
Analysis  was  applied  to  it  using  the  VADER  (Valence
Aware  Dictionary  and  sEntiment  Reasoner)  model,  the
DistilBERT model (Sanh etáal. 2020) and a version of the
RoBERTa model (Liu etáal. 2019; Loureiro etáal. 2022) spe?
cifically trained for SA. This was done in order to compare
the different models, as VADER is a lexicon?based analyzer
whereas DistilBERT and RoBERTa are both based on the
Transformer  architecture  (Vaswani  etá al. 2023).  Devel?
oped by researchers at the Georgia Institute of Technology
(Hutto and Gilbert 2014), VADER utilizes a lexicon?based
approach specifically designed for the analysis of social
media content, although its applications have since been
broadened. This SA model has been considered one of the
most accurate lexicon?based models, outperforming other
popular ones like TextBlob (Bonta etáal. 2019). Notably, a
multilingual version of VADER, denoted as vader?multi, was
utilized in this study and seamlessly integrated into Python.
DistilBERT and RoBERTa both use the BERT (Bidirec?
tional Encoder Representations from Transformers) architec?
ture, which is based on the Transformer one. These models
of Deep Learning transform words into tokens, which go
through many layers that extract information from them and
contextualize them with each other in order to understand
which are more relevant to the text. This allows for analysis
with contextual awareness.

VADER relies on a sentiment lexicon containing words
and their associated sentiment scores, ranging from ? 4 to
+ 4. This scale represents extreme negativity to extreme pos?
itivity, with 0 signifying neutrality. The lexicon incorporates
rules and heuristics to address special cases like negation
and emphasis. The sentiment determination process involves
locating tokenized text, scoring each word based on the lex?
icon, and aggregating these scores to generate an overall
sentiment score for the data. This sentiment score ranges
from ? 1 to + 1, with negativity, positivity, and neutrality
indicated by negative, positive, and zero scores, respectively.
Normalization of valence values is carried out to obtain
scores within  ? 1 to 1 range using a specific formula. In the
way Sentiment Analysis models interpret emotions, positive
refers to a desirable emotion, one which is good to have or
express, whereas negative emotions are the opposite of this
and neutral refers to indifference or non?emotional expres?
sions. VADER's analysis is further nuanced by considering
the intensity of sentiment, adjusting scores for intensifiers
like "very" or "extremely," and it can handle emoticons,
slang, and informal language prevalent on different media.
The outcomes provided by the model present results as a
compound score reflecting the numerical value of polarity
and intensity of said polarity.

architecture has become an essential element in Natural Lan?
guage Processing (NLP), as many current models of Genera?
tive AI and Sentiment Analysis models are built on Trans?
former?based architectures (Bashiri and Naderi 2024; Yadav
2024). This architecture is based on attention mechanisms and,
more specifically, self?attention. Attention mechanisms allow
for the weighting of the different tokens in the sentence accord?
ing to how relevant they are, thus relating the different tokens
between themselves and obtaining contextual information
(Bahdanau etáal. 2016). Self?attention allows for the process?
ing of a sequence of tokens (like a sentence) to be focused on
in order to better weigh the words and understand the context
of the sentence in itself and in a larger context (Vaswani etáal.
2023), thus better capturing many complex aspects of language
like polysemy.

The BERT architecture applies the principle of self?atten?
tion bidirectionally, meaning it can process and contextual?
ize the sentence forwards and backwards, obtaining better
results and gathering more information (Devlin etáal 2019).
When a sentence is inputted into a BERT?based model, it
is first tokenized and transformed into a vector so that the
model can read it, and the sequence generated is processed
through self?attention layers that weigh the tokens in order
to better get the context and intention of the sentence. The
tokens are compared to a vocabulary of tokens that the mod?
els have already trained into them, from which the polarity
scores can be calculated using the weights the model has
given the tokens. The use of the DistilBERT and RoBERTa
models specifically is due to them being state?of?the?art
models that represent improvements on the BERT architec?
ture either through compressing the model to reduce com?
putational and environmental consequences (in the case of
DistilBERT) or a more extensive vocabulary to obtain better
results (RoBERTa).

The process for each model was applied to each sentence
separately through Python automation. The resulting scores
were taken and put in a table alongside the corresponding
sentence. Using Python, the polarity scores were translated
into polarity tags named ôposö (positive), ônegö (negative)
and ôneuö (neutral) depending on their value (0 for neutral
sentences, positive scores for positive sentences and negative
scores for negative sentences). These were added to the table
with the corresponding sample sentence. The number of tags
for each polarity was counted and added up, then turned into
a percentage with respect to the total number of samples.

4   Results: Is sexism positive oránegative

foráSA models?

Both DistilBERT and RoBERTa are SA models developed
from the original BERT architecture, which is based on the
Transformer Deep Learning architecture. The Transformer

In this section, we will show the different results obtained
through  the  analysis  of  the  Sentiment  Analysis  model
dividing them between the results from the analysis of all

AI & SOCIETY (2026) 41:989û1003

Fig. 1   General sentence evalu?
ation by polarity expressed as a
percentage per model

995

Fig. 2   Polarity evaluation
of sentences that exemplify
benevolent sexism per model

sentences in the database, the results when analyzing only
the sexist sentences and the results that come from analyzing
only the non?sexist sentences.

4.1   Analysis ofátheátotal sample ofásentences

After putting the sample through the Sentiment Analysis
models, all 33 sentences were evaluated by this model as
either positive (that is, emotionally desirable), negative or

neutral. Figureá1 shows the general distribution of evalu?
ation among the sentences.

As it can be seen in the figure, the models give differ?
ent polarity results for the database. While DistilBERT
identified over 75% of sentences as negative and less than
15% as positive, RoBERTa only evaluated less than 50%
of the sentences as negative, giving a similar percentage
of neutral ones. Finally, VADER classified almost 50%
of the sentences as positive, showing less awareness to

996

AI & SOCIETY (2026) 41:989û1003

sexism, while DistilBERT appears to be the most aware
model of the three.

Diving into more specific categorizations, Figs.á2 and 3
represent the amount of sentences in the list of sentences
associated with benevolent and hostile sexism, respectively,
and the evaluation that the Sentiment Analysis model gave
of them.

These figures show a stark contrast between the analysis
of benevolent and hostile sexism. When it comes to Benevo?
lent sexism, DistilBERT was the only model that classified
more than 75% of the sentences as negative, while RoBERTa
considered there were no negative sentences and VADER
had the highest percentage of sentences considered positive,
at almost 75%. This shows that, out of these models, Distil?
BERT is the only one that seems to be aware of benevolent
sexism. On the other hand, the analysis of hostile sexism
showed that the two BERT?based models classified over 50%
of the sentences as negative while VADERÆs percentage of
negative sentences was under 50% but, more significantly,
was the same as the percentage of sentences it considered
to be positive.

With regard to the Neosexism Inventory, Fig.á4 shows
the way that the Sentiment Analysis model evaluated the
sentences included in that classification. As it happened in
Figs.á2 and 3, positive and neutral results have been added
up to put in perspective the opposition of these two polarities
and the negative one.

The analysis of the sentences belonging to the Neosex?
ism Inventory shows that all models considered over 50%
of the sentences to be negative, with DistilBERT being the
model that classified the highest percentage of sentences as

negative, and VADER the one that had the lowest percent?
age. Both BERT?based models appear once again to be more
aware of sexism than VADER, with DistilBERT being the
most aware one for all types of sexism studied.

4.2   Analysis ofátheánon?sexist sentences

As part of the general database, the 7 non?sexist sentences
were also put through the Sentiment Analysis model, which
means they too have a polarity associated. To analyze them
separately and study the way Sentiment Analysis models
evaluate non?sexist sentences as opposed to sexist ones,
Tableá2 shows the sentences that were not considered to be
sexist in the inventories as well as the score given to them
by the Sentiment Analysis model, their polarity expressed
as ôposö, ôneuö or ônegö (Fig.á5).

Out of all the models, DistilBERT was the one to clas?
sify the most non?sexist sentences as positive, while hav?
ing the same percentage of negative sentences as VADER.
RoBERTa, however, classified over 50% of the sentences
as neutral and had the least negative sentences. This lines
up with RoBERTa being the model with the most neutral
sentences and might point to a lower polarization of gender?
related sentences for it.

4.3   Analysis ofátheáexplicitly sexist sentences

Removing the 7 non?sexist sentences, a total of 26 explicitly
sexist sentences were evaluated. Figureá6 shows the general
polarity evaluation of these 26 sexist sentences included in
the list.

Fig. 3   Polarity evaluation of
sentences that exemplify hostile
sexism per model

AI & SOCIETY (2026) 41:989û1003

Fig. 4   Polarity evaluation of
sentences that exemplify neo?
sexism per model

997

Fig. 5   Polarity evaluation of
non?sexist sentences per model

As the figure shows, DistilBERT was the only model to
classify over 50% of sexist sentences overall as negative,
with around 90% of the sentences. RoBERTa had almost
50% of the sentences as negative, but it also has a high
percentage of neutral ones. Finally, VADER considered
50% of the sentences to be positive, which shows it is the
model with the least awareness.

5   Discussion

Through a general look at the results obtained by simulat?
ing a normal use of Sentiment Analysis on sexist language,
we can see there are answers to both Research Questions
posed at the beginning. For the first one, we can see how

998

Fig. 6   General polarity evalu?
ation of the 26 sexist sentences
in the list

AI & SOCIETY (2026) 41:989û1003

VADER did the worst job at classifying sexist expres?
sions  as  negative,  while  DistilBERT  considered  most
sexist sentences to be negative and RoBERTa had more
negative sentences than VADER, but also classified more
sentences as neutral. This hints towards Transformer?based
models being better suited to detecting sexism in language
than lexicon?based ones. However, it also raises concerns
regarding the training of models, as RoBERTa did not
consider over half of the sexist sentences to be negative,
showing a lesser polarization around gender overall by
classifying many sentences as neutral.

Looking at the results before and after the elimination of
non?sexist sentences, however, shows how the likelihood of
classification as positive or neutral for lexicon?based mod?
els is not related to the presence of sexism or lack of it in a
sentence, and is based mainly on the superficial emotional
appearance of the language employed (the form), rather
than being related to the sexism of the message or the top?
ics approached (the content). The Transformer?based models
appear to have a better awareness of the presence of sexism
due to them taking the context into account, but it seems that
this awareness alone does not make them consider sexism to
be negative, or they might not always include the possibility
of sexism in their understanding of the context. This would
make sense with the differences between DistilBERT and
RoBERTa, with the former classifying most sexist expres?
sions as negative while the latter did not appear to consider
it as either negative or positive, or not as negative as Distil?
BERT seems to.

Regarding the second research question, the results show
a clear difference between the way benevolent sexism is

evaluated in comparison to hostile sexism and neosexism.
Although DistilBERT classified most sentences in every cat?
egory as negative, RoBERTa and VADER had most of the
benevolent sexism sentences as either positive or neutral,
and RoBERTa did not consider any of them to be negative.
This fits the way benevolent sexism works generally, as it is
harder to detect due to the fact that it seems to be supportive
of women on the surface and that it appeals to traditional
standards that are naturalized and not seen as necessarily
sexist (Glick and Fiske 1996). This points to the likelihood
of many SA models having a harder time understanding
benevolent sexism as negative, since even a state?of?the?art
Transformer?based model had trouble evaluating these sen?
tences. In order to be able to detect sexism with this technol?
ogy, benevolent sexism would have to be accounted for by
researchers and taken into account when creating the train?
ing sets, making sure that sexist expressions of any kind are
understood as negative.

Given  these  results,  we  can  argue  that  many  Senti?
ment Analysis models are not aware of sexist language as
a specific mode of expression with its own meanings and
implications, and that this awareness requires specialized
training in order to include it as part of their framework.
This also reveals the unawareness of sexism or the indiffer?
ence towards it as a hegemonic view within the world of AI
development, acting as a default position. Of course, Senti?
ment Analysis models themselves cannot understand what
sexism is at a structural, historical level, but at best learn
to associate sexist words and expressions to negativity if
the developers of the models have a perspective that makes
this relevant. This, however, is at odds with the feminist

AI & SOCIETY (2026) 41:989û1003

999

perspective, which acknowledges the historical develop?
ment of womenÆs oppression and the struggle against it, and
considers this history as an important element to take into
account. While SA models can then be used as tools to detect
sexism in language if trained properly and this is a valuable
tool to think of for feminist research, it also shows it to be a
more superficial view of feminism that needs to be accom?
panied by a historical, structural perspective.

While useful for some studies, the way of treating sex?
ism that Sentiment Analysis can implement comes from
a framework of technological rationality (Houkes 2009;
Marcuse 1941), which considers structural or social prob?
lems to be technical ones, thus solvable through the use of
technology. This exemplifies the separation from the social?
ity and historical background of our environments that the
scientific field finds itself in, and that it can in turn repro?
duce through the use of technology developed under such
a context (Adorno 1998; Mumford 1970). The adoption of
tools based on Machine Learning or other AI technologies
in research and their further implementation in other practi?
cal work (Bhangdia etáal. 2021), when understood as tools
that can be used by themselves rather than needing human
input and interpretation, can perpetuate this separation and
result in a naturalization of an understanding of sexism that
is, at best, considering that sexism is the presence of sexist
sentences or behaviors. This erases the structural and mate?
rial reality of sexism and its bigger implications, and reduces
its scale to an intersubjective one rather than a political and
economic reality.

The way the use of AI is spreading into many different
scientific fields and becoming more relevant also signals
another step in the way society understands knowledge.
Cybernetic or mathematical information becomes more rel?
evant or superior to other forms of obtaining information,
which are relegated to past forms of research (Pasquinelli
2015). This results in an increase in the process of depoliti?
cization that has been present for a long time in engineering
and other fields (Cech and Sherick 2015). Depoliticization
also becomes a secondary issue for many, since current
developments of AI technologies work towards making the
process of extraction and presentation of information as effi?
cient and productive as possible, focusing on a standpoint of
productivity and speed in order to generate benefits (Engster
and Moore 2020). Challenging the hegemonic frameworks
in science requires a conscious effort, as they work in a cycle
that motivates the scientific field to keep on developing itself
in the same direction.

This situation makes the issue of bringing epistemology
to the forefront more pressing, but we must also question
how to make changes happen in the technological field. It is
not simply an exercise of using these technologies for good
that would be required from professionals who wanted to
implement them in their practice, but a transformation that

goes beyond the technical aspects and happens in the social
sphere (Brassier 2014). Trying to solve the issue of depo?
liticization in science or of the reproduction of sexism by
creating new ways to do research and simply bringing other
forms of knowledge to light would be falling into techno?
logical rationality again, as it would just be yet another way
of trying to solve a social issue through scientific advance?
ment. The objective of the feminist epistemological critique
here has to imply going beyond the scientific solutions and
understanding that a substantial change in science can only
be done through a transformation of the material conditions
and structures that determine womenÆs oppression in the first
place.

While the findings of this study have great implications
for the use of Sentiment Analysis models and other auto?
mated methods in the study of the human mind, there are
also some limitations to the work presented. First of all, the
amount of different Sentiment Analysis models available is
quite substantial and rapidly growing, and this study does
not implement all of the different models there are. Using
several models and employing two different methods, lexi?
con?based analysis and transformers architecture, this study
intends to reflect the state of the field. However, it cannot
cover systems that might be implementing sexism?specific
analysis in the future, nor those that have been made only
with the aim to detect sexism. Secondly, this study limits
the database employed for its analysis to two different sex?
ism inventories, therefore not representing the whole scope
of sexism and the different modalities it presents, espe?
cially when it comes to those that are more complex, such
as misogynoir or transmisogyny. This could be an avenue
of study for the future, and also serve to approach the cri?
tique of Sentiment Analysis models not only from a gender
perspective but also a queer or decolonial one. Finally, this
study has limited itself to studying sentences written in the
English language. This derives from a limitation that the
Sentiment Analysis models also have, as they are much more
competent in this language due to the origin of most of the
development we see in these technologies. As these systems
rapidly evolve, the critique of them will have to be expanded
and updated to cover the new grounds that Sentiment Analy?
sis and other automated methods open to us.

6   Conclusion

In this study, we have intended to elaborate on the feminist
epistemological critique of technology by extending this cri?
tique to the field of Sentiment Analysis. Through our find?
ings, we have seen that SA models diverge in their ability to
detect sexist expressions and sentences. Newer, transform?
ers?based models can detect most sexist expressions as nega?
tive, making them mostly able to detect different forms of

1000

AI & SOCIETY (2026) 41:989û1003

sexism. However, detecting sexist sentences does not make
Sentiment Analysis feminist. The deeper understanding of
a feminist epistemological critique of these systems points
towards social transformation as key to the creation of tech?
nologies that can be useful to challenge oppressive struc?
tures, rather than a reformulation of technological devices
without transforming social structures.

While the ability to detect sexism that Sentiment Analy?
sis models have can be an indicator of sexist biases in their
development, a deeper angle of study is needed to truly
understand the connection between these technologies and
gender oppression. By discussing not only the way different
models analyze different forms of sexism, but also the way
these systems work, we can see how SA can only be used
to grasp the more superficial levels of gender oppression
through its manifestations in language. In this way, even if
these technologies can detect sexism, they still contribute to
the hiding of historical and material developments that have
resulted in the current state of the oppression of women and
other marginalized communities, ultimately perpetuating the
sexist status quo.

While Sentiment Analysis and other automated method?
ologies offer a new way to conduct research, streamlining
information and pushing us forward into the future, it is pos?
sible that these technologies might prove themselves harmful
when trying to approach the human mind. Working from
a critical feminist perspective, Sentiment Analysis models
can be considered to be dangerous as they can only tackle
superficial issues regarding our current societal structures
and, furthermore, push the social sciences away from the
creation of human knowledge about human emotions. Thus,
from this point of view, it might be more commendable to
develop more human, comprehensive ways to study emo?
tions in the different social science disciplines rather than
give in to the use of technologies whose shiny future could
actually be just a loss of direction.

Appendixá1: Ambivalent Sexism Inventory

Hostile sexism

  7.  Feminists not seeking for women to have more power

than men.*

  8.  Women seek power by getting control over men.
  9.  There are actually very few women who get a kick out
of teasing men by seeming sexually available and then
refusing male advances.*

 10.  Once a woman gets a man to commit to her, she usually

tries to put him on a tight leash.

 11.  Most women fail to appreciate all that men do for them.

Benevolent sexism

Protective paternalism

 12.  A good woman should be set on a pedestal by her man.
 13.  Women should be cherished and protected by men.
 14.  Men should be willing to sacrifice their own well being
to provide financially for the women in their lives.
In a disaster, women need not be rescued first.*

 15.

Complementary gender differentiation

 16.  Women, compared to men, tend to have a superior

moral sensibility.

 17.  Many women have a quality of purity that few men

possess.

 18.  Women, as compared to men, tend to have a more

refined sense of culture and good taste.

Heterosexual intimacy

 19.  Every man ought to have a woman he adores.
 20.  Men are complete without women.*
 21.  No  matter  how  accomplished  he  is,  a  man  is  not
truly complete as a person unless he has the love of a
woman.

 22.  People  are  often  truly  happy  in  life  without  being
romantically involved with a member of the other sex.*

*Items are reverse coded.

  1.  Women exaggerate problems they have at work.
  2.  Women are too easily offended.
  3.  Most women interpret innocent remarks as being sex?

ist.

  4.  When women lose to men in a fair competition, they
typically complain about being discriminated against.
  5.  Many women are actually seeking special favors, such
as hiring policies that favor them over men, under the
guise of asking for "equality".

Appendixá2: Neosexism scale oráneosexism
inventory

  1.  Discrimination against women in the labor force is no

  2.

longer a problem in Canada.
I consider the present employment system to be fair to
women.*

  3.  Women shouldnÆt push themselves where they are not

wanted.

  6.  Feminists are making entirely reasonable demands of

  4.  Women will make more progress by being patient and

men.*

not pushing too hard for change.

AI & SOCIETY (2026) 41:989û1003

1001

It is difficult to work for a female boss.

  5.
  6.  WomenÆs requests in terms of equality between the

sexes are simply exaggerated.

  7.  Over the past few years, women have gotten more from

government than they deserve.

  8.  Universities are wrong to admit women in costly pro?
grams such as medicine, when in fact, a large number
will leave their jobs after a few years to raise their
children.
In order not to appear sexist, many men are inclined to
overcompensate women.

  9.

 10.  Due to social pressures, firms frequently have to hire

 11.

underqualified women.
In a fair employment system, men and women would
be considered equal.*

*Reverse scored item

Acknowledgements  To the reviewers, who helped improve this paper
beyond the scope we had imagined in the beginning.

Author contributions  D.D.F. wrote the main manuscript, did the tech?
nical analysis and prepared the tables and figures. P.M.B. revised the
manuscript and contributed to the references as well a to the theoretical
framework section.

Funding  Open Access funding provided thanks to the CRUE?CSIC
agreement with Springer Nature.

Data availability  The data employed in this study are available under
a GNU General Public v3.0 license at https:// github. com/ Dario dofa/
Sexism? in? Senti ment? Analy sis? data.

Declarations

Conflict of interest  The authors declare no competing interests.

Open Access  This article is licensed under a Creative Commons Attri?
bution 4.0 International License, which permits use, sharing, adapta?
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

Abburi H, Parikh P, Chhaya N, Varma V (2024) Multi?task learning
neural framework for categorizing sexism. Comput Speech Lang
83:101535. https:// doi. org/ 10. 1016/J. CSL. 2023. 101535

Adorno T (1998) Education after Auschwitz (edited excerpts). In: Pick?
ford HW (Trans.) Critical models: interventions and catchwords

(original radio lecture broadcast 31 January 1968). Columbia
University Press

Ahmed S (2014) The cultural politics of emotion, 2nd edn. Edinburgh

University Press

Ahmed S (2021) Complaint! Duke University Press. https:// doi. org/

10. 1515/ 97814 78022 336

Arthington P (2016) Mindfulness: a critical perspective. Community

Psychol Glob Perspect 2(1):87û104

Bahdanau D, Cho K, Bengio Y (2016) Neural machine translation
by  jointly  learning  to  align  and  translate.  arXiv: 1409. 0473.
arXiv:https:// doi. org/ 10. 48550/ arXiv. 1409. 0473

Bashiri H, Naderi H (2024) Comprehensive review and compara?
tive  analysis  of  transformer  models  in  sentiment  analysis.
Knowl  Inf  Syst  66(12):7305û7361.  https:// doi. org/ 10. 1007/
s10115? 024? 02214?3

Becker JC, Hartwich L, Haslam SA (2021) Neoliberalism can reduce
well?being by promoting a sense of social disconnection, com?
petition,  and  loneliness.  Br  J  Soc  Psychol  60(3):947û965.
https:// doi. org/ 10. 1111/ bjso. 12438

Bennett EA (2021) Open science from a qualitative, feminist per?
spective: Epistemological dogmas and a call for critical exami?
nation. Psychol Women Q 45(4):448û456. https:// doi. org/ 10.
1177/ 03616 84321 10364 60

Berlant L (2007) Cruel optimism: on marx, loss and the senses. New
Form (63):33+. https:// link. gale. com/ apps/ doc/ A1756 32730/
AONE?u= anon~fea05 d2a& sid= googl eScho lar& xid= 6e5f2 150

Bhangdia Y, Bhansali R, Chaudhari N, Chandnani D, Dhore ML
(2021)  Speech  emotion  recognition  and  sentiment  analysis
based therapist bot. In: Proceedings of the 3rd international
conference on inventive research in computing applications,
ICIRCA  2021,  pp  96û101.  https:// doi. org/ 10. 1109/ ICIRC
A51532. 2021. 95446 71

Bird S, Loper E (2004) NLTK: the natural language toolkit. In: Pro?
ceedings of the ACL interactive poster and demonstration ses?
sions, pp 214û217. https:// aclan tholo gy. org/ P04? 3031/

Bonta V, Kumaresh N, Janardhan N (2019) A comprehensive study on
lexicon based approaches for sentiment analysis. Asian J Comput
Sci Technol 8(S2): Article S2. https:// doi. org/ 10. 51983/ ajcst?
2019.8. S2. 2037

Bowker NI (2010) Understanding barriers to online experience for peo?
ple with physical and sensory disabilities using discursive social
psychology. Universal Access Inf Soc 9(2):121û136. https:// doi.
org/ 10. 1007/ s10209? 009? 0162?3

Brassier R (2014) Wandering abstraction. Mute. https:// www. metam

ute. org/ edito rial/ artic les/ wande ring? abstr action

Cao G, Duan Y, Edwards JS, Dwivedi YK (2021) Understanding man?
agersÆ attitudes and behavioral intentions towards using artificial
intelligence for organizational decision?making. Technovation
106:102312. https:// doi. org/ 10. 1016/j. techn ovati on. 2021. 102312
Cech EA, Sherick HM (2015) Depoliticization and the structure of
engineering education. In: Christensen SH, Didier C, Jamison
A, Meganck M, Mitcham C, Newberry B (eds) International per?
spectives on engineering education: engineering education and
practice in context, vol 1, pp 203û216. Springer. https:// doi. org/
10. 1007/ 978?3? 319? 16169?3_ 10

Cullen  M  (2011)  Mindfulness?based  interventions:  an  emerging
phenomenon. Mindfulness 2:186û193. https:// doi. org/ 10. 1007/
s12671? 011? 0058?1

Davies W (2015) The happiness industry: How the government and big

business sold us well?being. Verso Books

Devlin J, Chang M?W, Lee K, Toutanova K (2019) BERT: pre?training
of deep bidirectional transformers for language understanding.
arXiv: 1810. 04805. arXiv https:// doi. org/ 10. 48550/ arXiv. 1810.
04805

1002

AI & SOCIETY (2026) 41:989û1003

Drus Z, Khalid H (2019) Sentiment analysis in social media and its
application: systematic literature review. Procedia Comput Sci
161:707û714. https:// doi. org/ 10. 1016/j. procs. 2019. 11. 174
Engster F, Moore PV (2020) The search for (artificial) intelligence
in capitalism. Cap Class 44(2):201û218. https:// doi. org/ 10. 1177/
03098 16820 902055

Esuli A, Sebastiani F (2006) SENTIWORDNET: a publicly avail?
able  lexical  resource  for  opinion  mining.  In:  Calzolari  N,
Choukri K, Gangemi A, Maegaard B, Mariani J, Odijk J, Tapias
D  (eds)  Proceedings  of  the  fifth  international  conference  on
language resources and evaluation, LRECÆ06. European Lan?
guage Resources Association (ELRA). https:// aclan tholo gy. org/
L06? 1225/

Fee E (1981) Is feminism a threat to scientific objectivity? Int J Wom?

enÆs Stud 4(4):378û392

Frierson P (2011) Observations on the feeling of the beautiful and
sublime. In: Frierson P, Guyer P (eds) Kant: observations on the
feeling of the beautiful and sublime and other writings. Cam?
bridge University Press, Cambridge, pp 59û113

McLuhan M (1962) The Gutenberg galaxy. University of Toronto

Press

McLuhan M, McLuhan E (1988) The laws of media: the new science.

University of Toronto Press

Medhat W, Hassan A, Korashy H (2014) Sentiment analysis algo?
rithms and applications: a survey. Ain Shams Eng J 5(4):1093û
1113. https:// doi. org/ 10. 1016/J. ASEJ. 2014. 04. 011

Miller GA (1995) Wordnet: a lexical database for English. Commun
ACM 38(11):39û41. https:// doi. org/ 10. 1145/ 219717. 219748
Minch R, Ray N (1986) Alienation and computer user studies. ICIS

1986 Proceedings. https:// aisel. aisnet. org/ icis1 986/ 37

Mite?Baidal K, Delgado?Vera C, Solφs?AvilΘs E, Espinoza AH, Ortiz?
Zambrano J, Varela?Tapia E (2018) Sentiment analysis in educa?
tion domain: A systematic literature review. In: Valencia?Garcφa
R, Alcaraz?Mßrmol G, Del Cioppo?Morstadt J, Vera?Lucio N,
Bucaram?Leverone M (eds) Technologies and innovation. CITI
2018. Communications in computer and information science,
vol 883. Springer. https:// doi. org/ 10. 1007/ 978?3? 030? 00940?3_
21

Gage P (1994) A new algorithm for data compression. C Users J

Mumford L (1970) The myth of the machine: the pentagon of power.

12(2):23û38

Gill R (2017) The affective, cultural, and psychic life of postfemi?
nism: a postfeminist sensibility 10 years on. Eur J Cult Stud
20(6):606û626. https:// doi. org/ 10. 1177/ 13675 49417 733003
Glick P, Fiske ST (1996) The ambivalent sexism inventory: differ?
entiating hostile and benevolent sexism. J Pers Soc Psychol
70(3):491û512. https:// doi. org/ 10. 1037/ 0022? 3514. 70.3. 491
Haraway D (1991) Simians, cyborgs, and women: the reinvention of

nature. Routledge

Harding  S  (1996)  Rethinking  standpoint  epistemology:  what  is
æstrong objectivityÆ? In: Keller EF, Longino HE (eds) Feminism
and science: Oxford readings in feminism (online edn, Oxford
Academic, 31 Oct 2023). Oxford University Press. https:// doi.
org/ 10. 1093/ oso/ 97801 98751 458. 003. 0016

Houkes W (2009) The nature of technological knowledge. Philos
Technol Eng Sci 5:309û350. https:// doi. org/ 10. 1016/ B978?0?
444? 51667?1. 50016?1

Hutto C, Gilbert E (2014) VADER: a parsimonious rule?based model
for sentiment analysis of social media text. In: Proceedings of
the international AAAI conference on web and social media
8(1): Article 1. https:// doi. org/ 10. 1609/ icwsm. v8i1. 14550
Illouz E (2007) Cold intimacies: the making of emotional capital?

ism. Polity Press

Illouz E (2008) Saving the modern soul: therapy, emotions and the

culture of self?help. University of California Press

Jiang L, Suzuki Y (2019) Detecting hate speech from tweets for
sentiment analysis. In: Proceedings of the 6th international con?
ference on systems and informatics ICSAI 2019, pp 671û676.
https:// doi. org/ 10. 1109/ ICSAI 48974. 2019. 90105 78

Joque J (2022) Revolutionary mathematics: artificial intelligence,

statistics and the logic of capitalism. Verso Books

Lasch C (1979) The culture of narcissism: american life in an age of

diminishing expectations. W. W. Norton

Liu  B  (2012)  Sentiment  analysis  and  opinion  mining.  Springer.

https:// doi. org/ 10. 1007/ 978?3? 031? 02145?9

Liu Y, Ott M, Goyal N, Du J, Joshi M, Chen D, Levy O, Lewis M,
Zettlemoyer L, Stoyanov V (2019) RoBERTa: a robustly opti?
mized BERT pretraining approach. arXiv: 1907. 11692. arXiv:
https:// doi. org/ 10. 48550/ arXiv. 1907. 11692

Loureiro D, Barbieri F, Neves L, Anke LE, Camacho?Collados J
(2022) TimeLMs: diachronic language models from Twitter.
arXiv: 2202. 03829. arXiv: https:// doi. org/ 10. 48550/ arXiv. 2202.
03829

Marcuse H (1941) Some social implications of modern technology.

Z Soz 9(3):414û439

Harcourt Brace & Co.

Palmer BD (2013) Reconsiderations of class: precariousness as pro?

letarianization. Soc Regist 2014:40û62. Merlin

Pang B, Lee L (2005) Seeing stars: exploiting class relationships
for sentiment categorization with respect to rating scales. In:
Knight  K,  Ng  HT,  Oflazer  K  (eds)  Proceedings  of  the  43rd
annual meeting of the association for computational linguis?
tics, ACLÆ05. Association for Computational Linguistics, pp
115û124. https:// doi. org/ 10. 3115/ 12198 40. 12198 55

Pasquinelli M (2015) Introduction. In: Pasquinelli M (ed) Alleys
of your mind: augmented intelligence and its traumas. Meson
Press, pp 7û18

Plant S (2000) On the matrix: cyberfeminist simulations. In: Fiona
H, Linda J, Gill K, Kathryn W (eds) The gendered cyborg. Rout?
ledge, pp 265û275

Plant S (1997) Zeros and ones. Doubleday Books
Rambocas M, Pacheco BG (2018) Online sentiment analysis in mar?
keting research: a review. J Res Interact Mark 12(2):146û163.
https:// doi. org/ 10. 1108/ JRIM? 05? 2017? 0030

Rodriguez?Sanchez F, Carrillo?De?Albornoz J, Plaza L (2020) Auto?
matic classification of sexism in social networks: an empirical
study on Twitter data. IEEE Access 8:219563û219576. https://
doi. org/ 10. 1109/ ACCESS. 2020. 30426 04

Rojas?Barahona LM (2016) Deep learning for sentiment analysis.
Lang Linguist Compass 10(12):701û719. https:// doi. org/ 10.
1111/ lnc3. 12228

Sanh V, Debut L, Chaumond J, Wolf T (2020) DistilBERT, a distilled
version of BERT: smaller, faster, cheaper and lighter. arXiv:
1910. 01108. arXiv: https:// doi. org/ 10. 48550/ arXiv. 1910. 01108
Swim JK, Campbell B (2003) Sexism: attitudes, beliefs, and behav?
iors. In: Brown R, Gaertner SL (eds) Blackwell handbook of
social psychology: intergroup processes, pp 218û237. https://
doi. org/ 10. 1002/ 97804 70693 421. ch11

Tang D, Qin B, Liu T (2015) Deep learning for sentiment analysis:
successful approaches and future challenges. Wires Data Min
Knowl Discov 5(6):292û303. https:// doi. org/ 10. 1002/ widm.
1171

Tougas F, Brown R, Beaton AM, Joly S (1995) Neosexism: Plus τa
change, plus cÆest pareil. Pers Soc Psychol Bull 21(8):842û849.
https:// doi. org/ 10. 1177/ 01461 67295 218007

Vaswani A, Shazeer N, Parmar N, Uszkoreit J, Jones L, Gomez AN,
Kaiser L, Polosukhin I (2023) Attention is all you need. arXiv:
1706. 03762. arXiv: https:// doi. org/ 10. 48550/ arXiv. 1706. 03762

Wajcman J, Young E (2023) Feminism confronts AI: The gender
relations of digitalisation. In: Browne J etáal (eds) Feminist
AI: critical perspectives on algorithms, data, and intelligent

AI & SOCIETY (2026) 41:989û1003

1003

machines (online edn, Oxford Academic, 23 Nov 2023). Oxford
University Press. https:// doi. org/ 10. 1093/ oso/ 97801 92889 898.
003. 0004

Wankhade M, Rao ACS, Kulkarni C (2022) A survey on sentiment
analysis methods, applications, and challenges. Artif Intell Rev
55(7):5731û5780. https:// doi. org/ 10. 1007/ s10462? 022? 10144?1
Wigginton  B,  Lafrance  MN  (2019)  Learning  critical  feminist
research: a brief introduction to feminist epistemologies and
methodologies.  Fem  Psychol https:// doi. org/ 10. 1177/ 09593
53519 866058

Yadav AB (2024) Generative AI in the era of transformers: revo?
lutionizing natural language processing with LLMs. J Image
Process Intell Remote Sens 4(02): Article 02. https:// doi. org/
10. 55529/ jipirs. 42. 54. 61

Yue L, Chen W, Li X, Zuo W, Yin M (2019) A survey of sentiment
analysis in social media. Knowl Inf Syst 60:617û663. https://
doi. org/ 10. 1007/ s10115? 018? 1236?4

Zhou J, Ye JM (2023) Sentiment analysis in education research:
a  review  of  journal  publications.  Interact  Learn  Environ
31(3):1252û1264.  https:// doi. org/ 10. 1080/ 10494 820. 2020.
18269 85

Publisher's  Note  Springer  Nature  remains  neutral  with  regard  to
jurisdictional claims in published maps and institutional affiliations.
