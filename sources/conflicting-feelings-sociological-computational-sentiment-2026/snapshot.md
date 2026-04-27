<!--
  AI Triad Research Project — Document Snapshot
  Title      : Conflicting feelings: sociological and computational sentiment in workplace sentiment surveillance
  Source     : 
  Type       : pdf
  Captured   : 2026-04-27
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Conflicting feelings: sociological and computational sentiment in workplace sentiment surveillance

> **Snapshot captured:** 2026-04-27
> **Source:** 
> **Type:** pdf

---
AI & SOCIETY (2026) 41:787û799
https://doi.org/10.1007/s00146-025-02600-7

MAIN PAPER

Conflicting feelings: sociological andácomputational sentiment
ináworkplace sentiment surveillance

EvanáDonahue1,2
WendyáHuiáKyongáChun1

á╖ MatthewáCanute1

á╖ AdjuaáAkinwumi1á╖ PhilippaáR.áAdams1

á╖ MaiteáTaboada1

á╖

Received: 4 June 2024 / Accepted: 30 August 2025 / Published online: 22 September 2025
⌐ The Author(s), under exclusive licence to Springer-Verlag London Ltd., part of Springer Nature 2025

Abstract
Large employers are increasingly turning to sentiment analysis technologies as a form of corporate worker surveillance.
Previous work has identified numerous problems with this trend, arguing that these technologies may inherit racial or gender
biases from historical data, that the expansion of the surveillance apparatus itself threatens privacy and limits freedom of
expression, and that the often proprietary algorithms may be inaccurate. This paper contributes to this conversation with a
critical analysis of ôsentimentö as it is operationalized by these technologies. As we argue, even on its own terms, sentiment
monitoring software fails to capture the objective view of worker sentiment it imagines exists. Taking as a case study the
sentiment analysis software platform Aware, we argue that these systems construct, through rhetoric and statistics, categories
such as employee sentiment and toxic language that are divorced from the realities that these systems ultimately affect. In
particular, we draw on AwareÆs own public reports documenting its technology and experiments to reconstruct an analog
of AwareÆs sentiment analysis technology for study. We then compare the categories of ôsentimentö and ôtoxicityö as they
appear in the sentiment analysis literature, in AwareÆs rhetoric, and in the analyzed dataset. Through this combination of
technical and critical analyses, we place contemporary sentiment analysis technologies within a troubled historical context
of workplace sentiment surveillance and illustrate a method of analyzing contemporary algorithmic technologies in terms
of their underlying critical concepts that may have applications beyond critiques of workplace sentiment analysis.

Keywords  Algorithm auditingá╖ Sentiment analysisá╖ Bosswareá╖ Large language models

1  Introduction

According to a recent report by employee management soft-
ware vendor Aware, the cause of the crushing fatigue and
burnout experienced by frontline retail employees is not dif-
ficult working conditions, such as long hours, job insecurity,
the lack of benefits, and low payùit is Karens (Aware 2023),
a derogatory term used to refer to white entitled women
(Brady etáal. 2023). Aware sells a software platform that,
among other things, promises managers the ability to reveal
employeesÆ sentimentsùtheir frustrations, their concerns,
the things that burn them out, and even their intentions to

 *  Evan Donahue

evan.donahue@nau.edu

1  Digital Democracies Institute, Simon Fraser University,

Burnaby, Canada

2

 Department ofáComparative Cultural Studies, Northern
Arizona University, Flagstaff, USA

sell company secretsùby analyzing their emails and social
media profiles. Such employee monitoring software, col-
loquially known as ôbossware,ö has become increasingly
ubiquitous in a post-pandemic world of remote work and
ever expanding global workforces (Ball 2022; Munn 2024).
It is therefore imperative that we understand their limitations
and potential harms.

Existing  scholarship  on  such  workplace  surveillance
systems recognizes a sometimes delicate tension between
protecting employees from harm and harassment and invad-
ing employeesÆ privacy or infringing on their civil liberties
(Abraham etáal. 2019; Ball 2010; Holland and Tham 2022;
Kayas 2023; Sewell and Barker 2006). Complicating this
tension is the growing concern that algorithmic technologies
may perpetuate past discrimination and injustices reflected
in the historical data on which they are often trained (Ben-
jamin 2019; Chun 2021; Eubanks 2018; Noble 2018 OÆNeil
2017).

Vol.:(0123456789)
788

AI & SOCIETY (2026) 41:787û799

New fields such as algorithm auditing (Ajunwa 2019;
International Panel on the Information Environment 2024a;
Metaxa  etá al.  2021)  and  algorithmic  accountability  (AI
Now Institute 2023) have developed techniques for hold-
ing algorithmic systems accountable to relevant regula-
tory frameworks. However, although third-party algorithm
auditors often gain privileged access to proprietary data
and algorithms, they are often legally constrained to assess-
ing differential impacts on protected demographic groups
(Ajunwa 2019; Gilbert etáal. 2023). Such restrictions prevent
these approaches from addressing deeper theoretical and
epistemological difficulties with the way that algorithmic
employee monitoring systems categorize employee thought
and action (Kaufmann etáal. 2019; Ugwudike 2022). These
restrictions have also led to the strategic use by companies
of audits limited in scope to lend credibility to products that
may nevertheless have risks that fall outside the scope of
algorithmic audits in a process known as ôaudit washingö
(Goodman and Trehu 2022). While there has been mount-
ing pressure on companies such as Aware to make public
additional details about models and data that may enable
more sophisticated oversight in the future, access to such
information remains limited at present (International Panel
on the Information Environment 2024b).

In this paper, we examine the conceptual underpinnings
of the application of computational sentiment analysis tech-
niques to employee monitoring. We adopt, as a case study,
a report by Ohio-based bossware vendor Aware that makes
public details of an experiment conducted using their plat-
form (Aware 2023). Because the details of AwareÆs platform
and experiment made public in the report are somewhat lim-
ited, it is necessary to exercise caution when making strong
claims about the Aware platform on the basis of this report.
Nevertheless, due to the still uncommon level of detail in
the report for companies in this space, we present this study
as a preliminary investigation into the types of questions
and approaches that may prove helpful for exercising greater
oversight of such technologies in a future where model and
experimental detail are more readily available. To that end,
we contend that this study can inform efforts to determine
what types of details may be most beneficial to request from
such companies.

The report, which claims to identify causes of frontline
retail employee burnout, uses publicly available data drawn
from Reddit, and so offers a unique opportunity to partially
replicate an experiment conducted on an otherwise propri-
etary platform. By tracing the genealogy of ôsentimentö as
it appears in applied sociological research and in natural lan-
guage processing, we argue that bossware companies such
as Aware use the term in two mutually incompatible ways,
raising questions about the application of sentiment tech-
nologies to the analysis of employee sentiments. We then
augment this genealogy with a data scientific investigation of

the Reddit data and a variety of sentiment analysis systems,
which we use as proxies for the Aware platform. We con-
clude that computational sentiment analysis technologies,
applied to workplace communications, represent a categori-
cal mismatch that risks constructing categories of sentiment
that misrepresent employee behavior and intent, with the
potential of causing real-world harm if used as the basis of
managerial decision-making.

This paper is divided into two main sections. In Sect.á2,
we examine the histories of workplace sentiment analysis
and computational sentiment analysis, arguing that these
histories represent divergent conceptions of ôsentiment,ö
and calling into question the application of computational
sentiment analysis to workplace communications. In Sect.á3,
we analyze the technical details made public in the Aware
reports and partially reproduce elements of the Aware sys-
tem on the basis of these details to argue that, in practice as
well as in theory, computational sentiment analysis poses a
realistic risk of misrepresenting workplace sentiment, limit-
ing its utility and introducing potential real-world harms.

2   A critical analysis ofásentiment

surveillance

2.1   Sentiment & aware

We focus, in this paper, on the limits and risks of sentiment
analysis techniques for analyzing digital employee commu-
nications. Founded in 2017, Aware develops an enterprise
business intelligence platform and counts as customers a
number of major American and international corporations,
including  Walmart,  Starbucks,  Delta,  and  AstraZeneca
(Field 2024). The Aware platform provides a number of
services beyond sentiment analysis, and only some of these
corporations have confirmed usage of AwareÆs sentiment
analysis technologies.áAware was acquired by ôHuman Risk
Managementö firm Mimecast in 2024, as we were conduct-
ing this study (Mimecast 2024) and it is unclear how the
two companies will integrate. Nevertheless, given the size
of the workforces that AwareÆsáoriginal clients represent,
even a selective use of sentiment analysis has the potential to
impact a large number of workers, underscoring the need to
consider carefully the potential harms of these technologies.
In this section, we tease apart two distinct senses of the
term ôsentimentö as it appears in AwareÆs marketing mate-
rials, and especially in a report made public on AwareÆs
website (Aware 2023; Schumann 2023). The first sense is
as an appeal to the perennial concerns of the managers that
constitute Aware's customers. Aware promises managers
the ability to measureùand therefore manageùemployee
sentiment. With AwareÆs technology, managers can identify
aspects of the workplace environment causing resentment,

AI & SOCIETY (2026) 41:787û799

789

drop  in  morale,  or  burn  out  among  employees  to  better
support them. In short, Aware claims to reveal the authen-
tic ôVoice of the Employeeö (Deloitte and Aware 2021).
Additionally, Aware advertises the ability to perform tox-
icity detection, a variety of sentiment analysis that Aware
defines as assisting in locating ôhard evidenceö of individual
employee misbehavior, including, ôharassment, discrimina-
tion, microaggressions,ö and other behaviors that contrib-
ute to, ôcreating a toxic working atmosphereö (Aware 2023;
Deloitte and Aware 2021, 4). Toxicity, Aware claims, is,
ôassociated with reduced morale, performance decline, high
turnover, and worsening brand reputationö (Aware 2023).

This use of sentiment as a key managerial category is
common among other bossware vendors with similar sen-
timent  analysis  product  offerings.  Happiness  Index,  for
example, although exchanging the language of ôsentimentö
for a neuroscientifically inflected ôhappiness,ö nevertheless
articulates a similar focus on measuring the inner affective
state of employees through an algorithmic analysis of their
digital communications. Terminological differences aside,
both platforms arrive at a similar destination, with happiness
metrics and an ôEmployee Voiceö product promising insight
into the invisible sentiments that drive workplace efficiency
(Whitehead-Smith 2024). Qualtrics, likewise, is a bossware
vendor that leverages sentiment analysis techniques to track
employee communications across internal platforms and
social media (Qualtrics, n.d.). Like the other two vendors,
QualtricsÆ marketing copy foregrounds the revelation of
employee ôintentö and the centering of employee ôvoiceö
through sentiment analysis technologies.

The second sense of sentiment, common to all three of
these companies, refers to the natural language processing
sentiment analysis technologies that underwrite their respec-
tive claims to reveal employee frustrations, happiness, intent,
and voice. All three treat sentiment analysis techniques as
transparent lenses through which to view the employee senti-
ment on which workplace culture and productivity depend.
Yet, as we show in the remainder of Sect.á2, these two senses
of sentiment possess distinct, albeit interconnected, gene-
alogies that complicate the otherwise seemingly intuitive
proposition of using sentiment analysis techniques to meas-
ure ôsentiment.ö

2.2   Sentiment inátheáworkplace

Ball (2010) places bossware within a history of workplace
surveillance practices stemming from twentieth-century
management  theories  advocating  careful  measurement
of worker productivity. This history has, in turn, traced a
course from management of the collective to, increasingly,
the ômastering of the individual workerö and the consequent
ôuninterrupted monitoring of workersÆ livesö (Ajunwa etáal.
2017, 772). Given AwareÆs focus on the proposition that

there exists a measurable quantityùsentimentùand that
measurements of this quantity can aid in managing employee
wellness, productivity, and insider threats, we view AwareÆs
use of sentiment analysis as existing within a long history
of twentieth-century sociological theory responsible for
developing the concept of sentiment as a tool for industrial
and civic population management (Albrecht and Chun 2024;
Roethlisberger and Dickson 1939; Whitehead 1938). This
section places AwareÆs rhetoric at the end of this history and,
in doing so, illuminates the assumptions and instabilities
with which that concept has been invested by this history.
The question then taken up in the remainder of the paper,
then, will be: does AwareÆs use of sentiment analysis tech-
nologies manage to escape this history, or does it reproduce
the same issues that have long haunted sentiment as a tool
of surveillance and management?

Per Albrecht and Chun (2024), one of the earliest exam-
ples of managerial sentiment analysis that established the
tradition within which Aware and its competitors exist was
a series of experiments conducted from 1927 to 1932 at the
Hawthorne Works, a Western Electric manufacturing plant.
In collaboration with Harvard Business School, research-
ers separated out six women from a group responsible for
assembling  electrical  relays  and  modified  experimental
variables such as break times and work hours in search of
peak worker productivity. When changes to environment
and schedule did not produce predictable results, research-
ers realized that the womenÆs sentiments toward the changes
being made and toward their status as participants in these
special experiments mattered more to their productivity
than their working conditions per se (Roethlisberger 1962).
This discovery led to the researchers interviewing almost
all workers in the factory and producing tables that classi-
fied their responses to certain topics as negative or positive.
Although they initially simply summarized these responses,
they quickly moved to transcribing entire interviews to delve
more deeply into worker sentiment. These researchers, how-
ever, also underscored the limitations of their studiesùin
particular the coarseness of their word-sentiment tables
(Whitehead 1938).

This  study  would  deeply  inform  the  development  of
management theory, lending its name to the subsequently
formulated ôHawthorne effect,ö which holds that individu-
als modify their behavior in response to the knowledge that
they are being observed (French 1953; Jones, Stephen 1992;
McCambridge etáal. 2014). Sentiment analysis as a way to
ôunderstandö workers' sentiments and the effects of those
sentiments on cooperation with management took a seem-
ingly darker turn when it was deployed by Alexander Leight-
onÆs Bureau of Sociological Research (BSR) to inform the
management of Japanese internment camps during World
War II. Building on the results of the Hawthorne study, the
BSR put classic anthropological methods of analysis toward

790

AI & SOCIETY (2026) 41:787û799

the end of effective administration of the camps (Chun etáal.
2024). Using methods such as quantitative measurements of
satisfaction and dissatisfaction, the BSR scaled the sentiment
analysis methods of Hawthorne Works to the larger popula-
tion of hostile internees, who were forcibly removed from
their homes in the Western US and interned regardless of
citizenship status.

Fundamental to the BSRÆs approach was the wager that
administration guided by sentiment analysis could lead to
greater cooperation with camp management at a time when
even those who were initially sympathetic to the US cause
had called a general strike due to poor working and living
conditions. The BSRÆs stated goals of democratizing camp
governance by giving internees a voiceùalbeit one revealed
through statistical methodsùand of mitigating the risk of
insider sabotage that so concerned military administrators
find echoes in the rhetoric of modern bossware companies.
Notably absent from this modern rhetoric, however, are the
earlier studiesÆ reflections on the limitations of sentiment
analysis, and in particular the coarseness of these positive
versus negative evaluations and difficulties in understanding
subtleties and context (Chun etáal. 2024; Roethlisberger and
Dickson 1939; Whitehead 1938). As Chun (2024) argues,
the BSRÆs archives evince many of the same difficulties that
plagued the Hawthorne study, namely, the sensitivity of sen-
timent to the subjectsÆ awareness of the conditions of their
own observation, and the insensitivity of the methods of
the social scientists to the situational ironies and resistances
expressed by the subjects of their studies.

2.3   Quantifying sentiment

Although Aware, through its rhetoric, places itself within
the historical genealogy of managerial sentiment analysis,
the step from the quantitative population statistics of the
BSR to the machine learning methods offered by bossware
suppliers is not necessarily the natural result of increasing
computational power. Although linked by shared historical
preoccupations with consumer sentiment and opinion poll-
ing, computational sentiment analysis and applied sociologi-
cal studies of worker sentiment trace two distinct historical
arcs before their reunion in the rhetoric of contemporary
employee surveillance. This section teases apart the varie-
gated notions of ôsentimentö at work in bossware discourse
and exposes a fissure between the computational sentiment
analysis literature and the claims made by bossware firms.
One of the earliest instances of computational ôsenti-
ment analysisö per se was a 2001 effort to extract market
ôsentimentö from the text of online message boards discuss-
ing specific stocks (Das and Chen 2001; Feldman 2013).
ôSentimentö in this case refers to investor expectations of
future market movements, as opposed to the intangible per-
sonal affects that were the subject of the Hawthorne study,

although certainly investorsÆ personal sentiments may at
times be tied to those of the market. From there and through-
out the 2000s and 2010s, ôsentiment analysisö came to be
used more broadly across a range of application domains
to refer to methods for summarizing and quantifying sub-
jective orientations expressed especially through text. This
wider circulation of the term ôsentimentö was due in part to
the burgeoning range of varieties of online text amenable to
computational analysis, which tracked the increasing adop-
tion and commercialization of the world wide web (Pang
etáal. 2002). This circulation in turn diluted the original
etymology of the term ôsentimentö in market analysis and
gave rise to competing terms such as ôopinion mining.ö (Liu
2012). The uncertainty in the terminology unifying so many
disparate studies mirrored an underlying ambiguity in the
scientific quantity nominally under study.

Methodologically, this early work drew on content analy-
sis research in Communication and Media Studies in framing
its task as an attempt to quantify the positivity or negativity,
broadly construed, of a passage of text (Dave, Lawrence, and
Pennock 2003; Krippendorf 1980; Osgood etáal. 1957; Stone
etáal. 1966; Turney 2002). This work often assigned each
word a particular valence, or a measure of the wordÆs seman-
tic polarity and magnitude (Taboada 2016). For instance,
the word ôdislikeö might have a negative polarity of small
magnitude, whereas ôdespiseö might have a negative polar-
ity of greater magnitude and ôlikeö a positive polarity. The
sentiment of an entire text, then, became a function of the
polarities and magnitudes of its constituent words.

These sentiment scores were then turned toward assess-
ing the sentiments of the online reviews of books, movies,
and consumer products that populated the early web. These
new media forms offered a tempting target for sentiment
analysis research in that they presented researchers with a
question that naturally lent itself to the type of quantification
required by sentiment analysis technologies. Web reviews
often included a star rating or other numeric score along-
side a textual comment that gave the reviewer the opportu-
nity to contextualize their score. Given a restaurant review
with a four-star rating and a comment praising the food but
criticizing the customer service, researchers could ground
the otherwise nebulous question of quantifying sentiment
by replacing it with a more easily measurable question of
whether it was possible to predict the star rating from the
text (Lei and Liu 2021; MΣntylΣ etáal. 2018). The task of
research, then, was to refine the computational methods used
to analyze the text and bring their predicted star ratings ever
closer to the ratings found in the actual data.

By formalizing the problem in this way, researchers were
able to extend sentiment analysis methods to other domains.
Examples of previous research, each adapting the ôpositiveö
and ônegativeö categories of sentiment analysis subtly to fit
a diverse range of media, involved classifying good or bad

AI & SOCIETY (2026) 41:787û799

791

news headlines (Balahur etáal. 2013; Ku, Liang, and Chen
2006); pros and cons of a product (Kim and Hovy 2006);
candidate likely or unlikely to win an election (Kim and
Hovy 2007; Mohammad etáal. 2015); support or opposition
for proposed legislation (Bansal, Cardie, and Lee 2008);
depression or not from social media postings (Babu and
Kanaga 2022); or, in a return to the fieldÆs origins, stock
price likely to go up or down (Bouktif etáal. 2020). Over
20áyears, the term sentiment migrated from an analysis of
markets to revealing the interiority of the human actors from
which those markets are constituted.

More recently, applications of sentiment technologies
to social media content moderation have fallen under the
emerging subfield of sentiment analysis known as toxicity
detection (Risch and Krestel 2020). Rather than revealing
opinions or sentiments, toxicity detection focuses on toxic,
abusive, or hateful behavior on social media platforms, as
identified by high negativity, possibly with the addition of
profanity, slurs, and similar language. Toxicity is defined
as online content that is considered derogatory, abusive, or
insulting, and which may have offline consequences, such as
denigration of a person or group (Pachinger etáal. 2023; Talat
etáal. 2017).áLacking star ratings or other obvious numeric
correlates  with  toxicity,  toxicity  detection  datasets  are
often produced through manual annotation of social media
comments developed specifically for this type of research.
Because these annotations are developed within the context
of the research rather than encountered within the broader
context of online behavior, such as reviewing, researchers
have analyzed the annotation process itself and discovered
it to be extremely context sensitive, with judgements about
what counts as toxicity depending heavily on the experimen-
tal design (Pavlopoulos etáal. 2020).

To our knowledge, sentiment analysis research has never
been put, in the literature, to the use of assessing workplace
morale, burnout, or criminal intent, per AwareÆs marketing
materials and the history of workplace sentiment with which
they are in dialog. Moreover, as has long been recognized,
the data used to train sentiment analysis systems necessar-
ily encode sociolinguistic assumptions concerning speakersÆ
economic, geographic, and educational status (Henrich etáal.
2010), and therefore tend to bias the interpretation of the
analysis along axes, such as age (Diaz etáal. 2018), gender
(Thelwall 2018), disability (Narayanan Venkit, Srinath, and
Wilson 2023), and combinations thereof (Kiritchenko and
Mohammad 2018). Sentiment analysis technologies likewise
often overlook sexist or misogynistic content on the basis
of such encoded assumptions (Adams 2023). As sentiment
analysis technologies have proliferated throughout industry
and government, these embedded assumptions have trans-
lated into real-world harms, such as gender discrimination
on the basis of historical hiring patterns (Winick 2018) and
circumvention of labor protections (Newman 2017). The

question, then, turning to AwareÆs findings, is how Aware
justifies the application of its sentiment analysis technology
to the novel domain of workplace sentiment and whether it
manages to avoid the possible harms that may stem from
misinterpretations of employee data by algorithmic analysis.
As Taylor (2023) argues, ôsentiments, or how real people
actually feel, rarely map rationally onto statisticsö (p. 11).

3   Replicating AwareÆs findings

The challenge facing bossware companies such as Aware,
as argued in Sect.á2, is that the workplace sentiment at the
center of the managerial imaginary possesses a genealogy
that diverges from that of the collection of topics of study
that fall under the rubric of computational sentiment anal-
ysis. Applying an off the shelf sentiment analysis system
directly to internal employee communications is a problem
that has not been well studied in the scientific literature. Of
course, bossware systems are, as a rule, proprietary, and it is
therefore impossible to know what contributions companies
may have made to the current state of the art in sentiment
analysis to bridge this gap, and how they may have evaluated
the efficacy of their technologies. This section, therefore,
draws on details Aware has made public about its system
to investigate the theoretical possibilities and limitations
of a sentiment analysis system conforming to those public
specifications.áOur study constitutes not a full replication,
but a reconstruction of what is possible in bossware, and
a questioning of the assumptions behind such technology.

The basis for our partial reconstruction of AwareÆs tech-
nology lies in a collection of documents Aware published
to their website comparing their system and data to publicly
available language models and datasets. Although we lack
direct access to the Aware platform, we do have access to the
open-source Llama-2 language model, which Aware used as
a benchmark for its technology, and publicly available Red-
dit data, which Aware identifies as within the scope of its
platform. Using these public models and data as proxies, we
attempt, to the extent possible, to replicate AwareÆs results
concerning employeesÆ relationship to management and to
Karens. In doing so, we gain insight into AwareÆs operation-
alization of sentiment and the interpretive challenges that
accompany the algorithmic assessment of workersÆ interior
states.

3.1   Data

AwareÆs first report describes a study of frontline retail work-
ers and identifies interactions with ôKarenö customers as the
most common cause of burnout and turnover (Aware 2023).
The study analyzed 152,716 Reddit comments from the pub-
lic subreddits of eight major retail and frontline employers.

792

AI & SOCIETY (2026) 41:787û799

Table 1   Comment totals of eight top retailer subreddits

Subreddit

BestBuyWorkers
DollarGeneralWorkers
MichaelsEmployees
WalmartEmployees
TjMaxx
Sephora
FootLocker
AmericanEagle

Total

Comments

412
2309
17,907
1413
7490
122,752
12
421

152,716

a After  experimenting  with  several  prompts,  we  report  the  values  for
ôClassify this message as either 'Toxic' or 'Healthy', with no explana-
tionùjust  the  category  as  a  one  word  response.ö  and  ôClassify  this
message sentiment as either 'Positive' or 'Negative' or 'Neutral', with
no  explanationùjust  the  category  as  a  one  word  response.ö  respec-
tively

Reddit is a public Internet forum, and so, the nature of com-
munication between employees and between anonymous
members of the public will necessarily differ from that of
internal communication platforms. Aware acknowledges this
distinction, hypothesizing that anonymous Internet forums
may have higher toxicity than workplace communications.
However, operating on the assumption that the half of new
frontline hires who do not quit within the first 120ádays will,
ôturn to coworker forums like Reddit or Workplace from
Meta to find the support and empathy their leaders fail to
provide,ö Aware argues that it is incumbent on employers
to ôlook beyond what their people say at workö to form an
accurate  picture  of  employee  sentiments  (Aware 2023).
Following AwareÆs justification, we also adopt Reddit as
an  appropriate  dataset  for  examining  the  limitations  of
employee sentiment analysis.

Using the numbers provided by Aware's report, we were
able to replicate the study's dataset with reasonable confi-
dence. The report describes the overall Reddit dataset as
being composed of 152,716 posts gathered from the sub-
reddits of 8 unnamed major retailers during the period from
January of 2023 to April of the same year. Correspondingly,
we gathered Reddit posts from this time period using Arctic
Shift (Heitmann 2023), an open-source tool with pre-scraped
snapshots capturing the entirety of Reddit's data, thereby
ensuring that replication is feasible using publicly archived
data, and filtered them by the National Retail FederationÆs
list of the top 100 retailers of 2023 (National Retail Federa-
tion 2023). Using this approach, we located eight subreddits
with post counts that summed to exactly 152,716 during

this time period. We then used this collection of posts as
our primary dataset for subsequent experimentsá(Tableá1).1
Despite  the  precise  comment  totals,  a  number  of  the
report's other examples and figures differed from our own
as measured on this dataset, suggesting that Aware's explora-
tory analysis may have been more far reaching than their
final  reporting.  Among  the  example  comments  cited  in
the report, for example, was a comment from the /r/star-
bucks subreddit, which alone contained more than 164,000
commentsùover 11,000 more than were reported for the
entire final sample. Likewise, the report included the statis-
tic that the most active subreddit in their sample averaged
1553 comments per day, implying a total of over 186,000
commentsùover 33,000 more than reported for the entire
sample.

Filtering the above dataset for the word ôKarenö and
manually reviewing the results, we were able to extract 64
posts relevant to the Karen topic from our sample, account-
ing for 0.04% of the total datasetùfewer than the reported
0.1%, or approximately 153 expected posts cited in the study,
although potentially within expectations depending on the
degree of precision used in the reporting. Taken together,
the  precise  comment  totals  from  the  employee  subred-
dits coupled with the roughly similar magnitudes of com-
ments in the Karen subsample suggest that we were able
to recover a reasonable representation of the data used in
the Aware study.áNaturally, Karen-like behavior may have
been reported in the posts without necessarily mentioning
the keyword Karen. Given that Aware used the keyword, our
results compare to theirs.

3.2   Models

Producing an adequate model for comparison is more dif-
ficult as, unlike the Reddit data used in the report, AwareÆs
sentiment analysis system is not publicly available. Never-
theless, in their reports, AwareÆs data scientists draw their
own comparisons to MetaÆs open-source Llama-2 13b model
(Touvron etáal. 2023). Partly on that basis, we argue that
an analysis of Llama-2 and comparable sentiment analysis
systems can offer insight into AwareÆs broad conceptualiza-
tion of sentiment.

1  There  were  several  combinations  of  subreddits  that  summed  to
this  total.  While  most  differed  only  by  very  small  subreddits  that
are  unlikely  to  significantly  affect  the  final  result,  several  did  dif-
fer  to  more  significant  degrees.  We  chose  the  combination  with  the
most  employee-oriented  subreddits  (as  opposed  to  general  brand
subreddits),  which  also  seemed  roughly  to  accord  with  other  statis-
tics presented in the report. Further work might profitably pursue the
following  analyses  in  parallel  across  all  possible  combinations  and
synthesize the results of doing so.

AI & SOCIETY (2026) 41:787û799

Table 2   Sentiment and health scores for four sentences

Sentence

1) That pin is so gorgeous
2) ThatÆs my sarcastic way of saying whoever did this was f**cking amazing bc

WOW

3) IÆm so sad: I hadnÆt seen them yet and this is not what I was expecting
4) What a crock of sh*t. Your store manager sounds like a jerk

Sentiment

Aware

Vader

0.85
0.84

0.17
0.15

0.88
0.92

0.12
0.23

Health

Aware

0.96
0.33

0.97
0.16

793

Detoxify

0.86
0.02

1.00
0.01

We  report  the  numeric  sentiment  and  health  scores  produced  by  Vader  and  Detoxify,  respectively.  Our  other  models  produced  classification
labels, but we did not attempt to use them to generate numeric scores

To demonstrate the efficacy of their system, Aware docu-
ments a benchmark test comparing the Aware platform to the
base Llama-2 model on the task of zero-shot sentiment anal-
ysis (Schumann 2023). Aware reported an 87.3% accuracy
for their own models versus a 62.7% accuracy for Llama-2.
Although they do not specify the dataset used in the com-
parison, the figures suggest that the models must have agreed
on at least 50% of the examples.2 Without knowing what
dataset Aware used for the experiment, it is impossible to
comment on potential issues such as definitions of toxicity,
as discussed in Sect.á2.3. Moreover, accuracy scores them-
selves can be misleading without knowing the distribution of
categories in the data. The Karen study, for example, reports
that the Reddit data are 86% neutral, as estimated by the
Aware system. If this were the case, a naive classifier that
completely ignored the data and simply predicted "neutral"
for every item would therefore also report 86% accuracy.3
That said, AwareÆs researchers treat the Llama-2 system as
a potential competitor, and so, we adopt this stance as the
basis for our comparison as well.

Like other modern LLMs, Llama-2Æs ability to perform
sentiment and toxicity analysis is due largely to specialized
training such LLMs receive across a range of common NLP
tasks (Touvron etáal. 2023). Because both sentiment and tox-
icity analysis are common concerns within the broader NLP
literature, prompts and datasets related to both sentiment and
toxicity were a part of Llama-2Æs development and training.
Our usage of the same default Llama-2 model, then, should
produce similar results to those observed during AwareÆs
experiments, as the report notes they did no additional train-
ing during the comparison. The one key missing piece of
information is how Aware prompted Llama-2 to perform
sentiment analysis.

2  This  assumes,  in  the  worst  case,  that  Llama-2  correctly  classified
the 12.7% missed by Aware and then the remaining 50% that Aware
also correctly classified.
3  Lacking a more specific definition in the report, we adopt the con-
ventional  definition  of  classification  accuracy  as  correctly  classified
cases as a proportion of all cases.

Llama-2Æs ability to conduct sentiment analysis hinges on
its training, its performance will tend to be highest when the
prompt resembles that seen during training. Lacking access
to AwareÆs prompt and to the specific prompts used during
training, we modeled our prompt on the documentation pro-
vided by the developer of the library we used to run Llama-
2, HuggingFace (HuggingFace 2024). The prompts for both
sentiment and toxicity were as follows:

[INST] <<SYS>>\nClassify the sentiment of the text
into  neutral,  negative  or  positive.  \n<</SYS>>\n\
nText: reddit-comment\n [/INST] \n\nSure! Sentiment:
\n\n
[INST] <<SYS>>\nClassify the toxicity of the text
into toxic or healthy. \n<</SYS>>\n\nText: reddit-
comment\n [/INST] \n\nSure! Toxicity: \n\n

The core of the prompt is the instruction: ôclassify the
sentiment of the text into neutral, negative or positive.ö
Markup such as ô[INST]ö and ô <  < SYS >  > ö is parsed
specially by the library and is used by the model to under-
stand the structure of the prompt. Its inclusion noticeably
improved the consistency of our results. The final segment
of each prompt, ôSure! Sentiment:ö represents the beginning
of the modelÆs answer. Models such as Llama-2 work by
completing an initial passage of text by predicting the next
words. Interestingly, because much of the reason models
are trained to recognize toxicity is so that they can monitor
their own output and prevent themselves from generating
toxic speech, we found that Llama-2 frequently refused to
classify the sentiment of our data due to its refusal to handle
toxic content (R÷ttger etáal. 2023). By prompting the model
to begin its answer with ôSure!ö, we were able to elicit its
toxicity classifications more reliably. These prompts yielded
categorical classifications of sentiment and toxicity, rather
than scores, and so were used in comparisons with AwareÆs
summary statistics of the sentiment and toxicity of the entire
dataset (Tableá2).

Additionally, because AwareÆs report seemed to indicate
that Llama-2 was being used in a fashion deeply rooted in
the  contemporary  sentiment  analysis  literature,  we  also

794

AI & SOCIETY (2026) 41:787û799

employed several other common sentiment analysis sys-
tems to help hedge against possible idiosyncrasies of our
Llama-2 usage. All told, we made use of three additional
sentiment and toxicity systems: Vader, an open-source rule-
based sentiment analysis system widely used in academia
and industry (Hutto and Gilbert 2014); Detoxify, an open-
source fine-tuned transformer toxicity classifier (Hanu and
Unitary 2020); and the closed-source GPT-3.5-Turbo API
(OpenAI 2024).

We found that our models performed comparably to the
Aware system on several points and differed in others. Our
first point of comparison was a table of four example sen-
tences and associated sentiment and toxicity scores, repro-
duced alongside Vader and Detoxify in Tableá2. While four
sentences do not reach statistical significance, they neverthe-
less provide a useful qualitative point of comparison.

As a starting point, because these examples demonstrate
the system working as intended, they offer perhaps the most
natural route to understanding how Aware construes senti-
ment and toxicity in its analyses. To better understand the
factors that contributed to these scores, we re-ran our models
on versions of these sentences edited, so that high polar-
ity words and clauses were replaced by neutral stand-ins or
omitted entirely. The sentence 1 became neutral, as expected,
when ôgorgeousö was replaced by a neutral adjective, such
as ôsmall.ö Sentence 2 became healthy when ôf**ckingö was
removed.4 Sentence 3 became neutral when ôIÆm so sadö
was removed. Sentence 4 became neutral and healthy when
both ôcrock of sh*tö and ôjerkö were removed or replaced.
These results are not surprising for off the shelf senti-
ment analysis systems trained on a general range of web
data. It is less clear, however, whether they lend themselves
to the analysis of employee morale at the center of AwareÆs
value proposition. Sentence 2, ôThatÆs my sarcastic way of
saying whoever did this was f**cking amazing,ö appears to
express a positive sentiment, and the notion that obscenity,
as detected by a sentiment analysis system, contributes to
a toxic workplace would seem to represent a fairly strong
value judgment on AwareÆs part. In its more complete con-
text in the data, ôthatö in this comment refers to the posterÆs
previous comment, ôI can draw stick figures lmao.ö This
remark, drawn from the Starbucks subreddit, expresses the
posterÆs amazement in response to a photograph of a col-
league's highly skilled chalk artwork of a unicorn, advertis-
ing the introduction of the Unicorn Frappuccino. It is worth
asking  whether  obscenity,  which  often  forms  the  basis
of  toxicity  classification  datasets  for  anonymous  online

Table 3   Classification percentages on full dataset

Sentiment

Aware

Vader

Detoxify

GPT-4o-minia

63.62%
19.12%
17.26%

Positive
Neutral
Negative
Toxicity
áHealthy
áToxic

8%
86%
8%

89%
11%

97.6%
2.4%

42.04%
33.87%
24.09%

91.71%
8.29%

We  use  a  0.5  probability  threshold  for  classification  using  Detoxify.
Vader  distinguishes  polarity  with  positive  and  negative  values.  All
other systems produce categorical classifications directly

Note  that  although  the  toxicity  percentages  are  similar,  these  statis-
tics do not guarantee that the systems agree on which posts are toxic.
Without  the  precise  results  produced  by  Aware,  it  is  difficult  to  be
more precise at this level of granularity, although it is reasonable to
suspect the sets of classified comments are not totally disjoint. Still,
insofar  as  the  systems  do  agree  on  some  subset  of  toxic  comments,
it  may  be  useful  to  examine  the  difficulties  facing  the  off  the  shelf
systems, as these may surface issues and place a burden of proof on
Aware to demonstrate that their system avoids them

platforms, creates a hostile workplace environment (Dynel
2016) Tableá3

Running our models on the full dataset yields comparable
results for toxicity, although Aware is considerably more
neutral in its analysis of sentiment.5

3.3   Results

The Aware report describes an experiment using the Reddit
data through which they assess causes of employee burnout.
It must be stated that this report is not a scientific study,
although it is framed through the language of data science.
The clear intent of this document is to clarify the value
proposition of AwareÆs software and ultimately to pitch a
product to potential customers in charge of managing large
workforces. In following the form of data science research,
however, the report does offer some insight into the opera-
tions and analytic capabilities of the system. In this sec-
tion, we therefore take Aware at its word in examining this
experiment as data science. Our goal is to evaluate whether
the conceptual gap between competing notions of sentiment
present problems in practice for platforms such as Aware.

Among the day-to-day stressors that Aware identifies
as causes of retail employee burnout, the foremost factor
was employeesÆ customer service interactions with custom-
ers identified in the report as ôKarens.ö The term ôKaren,ö
which Aware defines as "a customer who escalates com-
plaints  beyond  what  is  considered  reasonable,ö  rose  to

4  We  ran  these  experiments  with  the  original,  uncensored  language
drawn  from  the  Reddit  data.  The  double  asterisks  in  AwareÆs  table
appears to be a typo.

5  Llama-2 was omitted from this experiment due to limited computa-
tional resources available to run it on the full dataset.

AI & SOCIETY (2026) 41:787û799

795

prominence during the pandemic and has since become an
object of academic interest as well as broad popular recog-
nition (Aware 2023; Bhasin etáal. 2020; Brady etáal. 2023;
Dubrofsky 2022). Aware argues that the value of their plat-
form lies in its ability to surface issues such as stressful
dealings with Karens, so that management can act to better
support employees and reduce burnout. In this section, we
investigate these findings and demonstrate ambiguities in
AwareÆs results that complicate their interpretation.

Aware states that, although only 0.1% of all the messages
studied mentioned Karens, those messages were 36% more
negative and 100% more toxic than the average post in the
dataset, yielding a predicted overall drop in workplace senti-
ment of 3% (Aware 2023). The report further elaborates on
these figures using a table reproduced here as Tableá4:

The 36% increase in negativity cited in the report seems
to refer to the multiplicative 37.5% increase from the 8%
negativity of the average employee Reddit post to the 11%
negativity of posts belonging to the Karen topic. Likewise,
the doubling of toxicity likely refers to the 82% increase
from 11 toxic to 20% toxic in the Karen topic. The 3% drop
in overall workplace sentiment due to the inclusion of the
Karen topic, by contrast, seems to refer to the 3% additive
difference between the 11% negativity of the Karen subtopic
and the 8% negativity of the overall sample. However, there
are several complications in interpreting these figures arising
from inconsistencies in the table and treatment of the claims
concerning it.

Part of the difficulty with interpreting the 3% difference in
negativity as a drop in "overall workplace sentiment" is that
the phrasing of the report seems to imply that the inclusion
of the Karen topic in the overall results raises the average
negativity by 3%. This suggests that Karens are to blame for

Table 4   What % of messages are (Aware 2023)

What % of mes-
sages areà

Overall results

Karen topic

Difference

Positive
Neutral
Negative
Healthy
Toxic

8
86
8
89
11

2
79
11
80
20

?á6%
?á7%
 + 3%
?á9%
 + 9%

a 3% reduction in workplace efficiency as measured in terms
of the managerial category of worker sentiment. It is pos-
sible that the Karen topic was more negative than reported
in the table, considering that the 2% positive, 79% neutral,
and 11% negative posts in the Karen topic only account for
a sum total of 92% of the sample. However, because the
Karen topic constitutes only 0.1% of Aware's reported over-
all sampleùand only 0.04% of oursùeven if it were entirely
negative, it would be impossible to shift the sample average
by a magnitude of 3% assuming the average is unweighted.
It is clear from the table of four example sentences that
Aware does assign magnitudes to its sentiment and toxicity
assessments, and so, it is unclear how AwareÆs data scientists
translated these scores into the positive, negative, and neu-
tral classificatory categories reported in Tableá4. However,
because the 3% figure appears to derive from the additive
difference of classificatory categories in Tableá4, it does not
appear to be rooted in an analysis of the precise magnitudes
generated by the Aware system.

To better understand the nature of these reported num-
bers, we compare them to our collection of models and our
own manual annotations, which we report in Tableá5.

Our manual inspection predictably revealed that many of
the posts were difficult to classify along standardized senti-
ment and toxicity axes. Based on our reading of AwareÆs
managerial objectives into the history of workplace senti-
ment analysis, we elected to classify as negative any post
that described a negative workplace experienceùin par-
ticular with a difficult customerùthat might reasonably be
hypothesized to contribute to employee burnout and attri-
tion. This yielded significantly more negative examples than
reported by any other model, which suggests that conflict
between employees and customers is not primarily what
Aware or any other model is identifying. We labeled as neu-
tral posts that were either factual in nature, irrelevant, or
uninterpretable without more context. We did not label any
posts as positive, as of those that discussed frontline retail
contexts using the term ôKaren,ö none discussed positive
customer experiences. That said, many posts framed nega-
tive experiences in positive language, either relating a past
negative experience in a comedic tone or else expressing
relief or support in light of such experiences. These posts
may help to explain the positive sentiments detected by the
other models, as the category of positive sentiments toward

Table 5   Sentiment and toxicity
model comparison on Karen
dataset

Aware

Llama-2

Vader

Detoxify

GPT

Manual

Positive
Neutral
Negative
Healthy
Toxic

2%
79%
11%
80%
20%

10 (16%)
22 (34%)
32 (50%)
32 (50%)
32 (50%)

35 (55%)
8 (12%)
21 (33%)

7 (11%)
57 (89%)

41 (64%)
23 (36%)

0 (0%)
15 (23%)
46 (77%)
54 (84%)
10 (16%)

796

AI & SOCIETY (2026) 41:787û799

those identified by commenters as Karens is otherwise dif-
ficult to explain.

Following AwareÆs use of toxicity to describe instances
of harassment or other matters of personal employee cul-
pability,  we  labeled  as  toxic  instances  in  which  posters
were engaged in interpersonal disputes that might contrib-
ute to a hostile work environment, often involving labeling
one another as ôKarens.ö Notably, none of these instances
involved discussions of customers. It is therefore unclear,
when Aware discusses the rise in toxicity caused by Karens,
whether it may be reading into the retail frontline context
properties of the messages themselves as classified by its
platform.

We re-ran our models on a modified dataset contain-
ing edited versions of each post to explore the factors con-
tributing to sentiment and toxicity classifications. As we
expected, replacing obscenity or high polarity words such as
ôgrouchyö and ôentitledö with neutral words or eliminating
clauses containing those words was often able to decrease
the negativity and toxicity of posts, even if the intent of the
message still appeared clearly negative or toxic to human
annotators. This suggests that these models remain fairly
sensitive to surface-level features of messages, which is not
surprising.

3.4   Discussion

In applying contemporary sentiment analysis technologies
to the long standing question of managing worker sentiment,
Aware blurs the line between divergent notions of sentiment.
By replicating an experiment conducted by Aware data sci-
entists to the extent possible given the publicly available
information, we have created a context in which it is now
possible to examine more closely how Aware may be adapt-
ing the notion of sentiment within its domain of application,
and what potential risks or complications may arise in the
computational analysis of workplace sentiment.

The  fundamental  problem  in  applying  sentiment  and
toxicity analysis to workplace communications is that of
defining sentiment and toxicity. Star ratings, likes, and other
social media metadata provide an intuitive way to opera-
tionalize sentiment analysis as a problem of predicting the
metadata from the text. Llama-2Æs reported ability to classify
a significant proportion of AwareÆs internal data correctly,
coupled with the areas of overlap between AwareÆs reported
results and our own, suggests that Aware may be at least par-
tially trained on extant sentiment analysis data, raising ques-
tions about whether these data reflect the type of managerial
sentiment or toxicity that constitute AwareÆs central focus.

To the extent that Aware has specialized its platform to
the employee communication domain, which lacks naturally
occurring metadata such as star ratings, Aware researchers
themselves, according to the report, supply such metadata

themselves by annotating datasets of employee communica-
tions. The process of annotation, in turn, raises questions
about how annotatorsùand indeed managers themselvesù
can reliably determine the sentiment of an employee from
a single Reddit comment. Aware hedges against the risk of
algorithmic decision-making by noting that their system
only brings potential issues to the attention of managers,
who may then exercise their human judgment. However,
the histories of the Hawthorne study and the BSR speak to
the difficulties that even teams of social scientists observing
employees around the clock under controlled laboratory con-
ditions can face when it comes to the question of understand-
ing the internal sentiments that drive employee behavior.

A key risk of the flexibility of sentiment and toxicity as
concepts is that they leave much room in their interpretation
for bias to creep in. The figure of the Karen is a highly rec-
ognizable gendered and racialized stereotype. AwareÆs defi-
nition of a Karen as "a customer who escalates complaints
beyond what is considered reasonable" is gender neutral.
However, this definition apparently paraphrases a sentence
from Wikipedia, now deleted, but which was current around
the time of the reportÆs publication, defining a Karen as a,
ôwhite woman perceived as entitled or demanding beyond
the  scope  of  what  is  normalö  (ôKaren  (Slang)ö  2023).
Moreover, this definition is accompanied, in AwareÆs report,
with a stylized illustration of a blond, white woman (Aware
2023). This gendering is in spite of the fact that many usages
of the term referred explicitly to men, often supplement-
ing ôKarenö with terms, such as ôKen,ö ôKevin,ö or ôman-
Kanren.ö A large majority of the comments used the term
in a general, hypothetical way that obscured the gender of
the referent, potentially in cases reflecting the commentersÆ
own internalized assumptions about the genders and asso-
ciated personalities of their customers. Still others coined
terms such as ôKaranagersö for managers who are ôentitled
and demanding,ö undermining the central thesis of AwareÆs
report that customers were to blame for employee burnout.
Even so, the fraction of the 64 Karen comments that did
seem to support AwareÆs thesis would seem barely signifi-
cant in a dataset of 152,716 comments. The fact that this
Karen topic became the central thesis of the report speaks
to one of the most significant potential risks of algorithmic
sentiment analysis platforms. Namely that, as was the case
in this report, small mathematical or typographic errors can
confirm existing gendered and racialized preconceptions and
become freighted with additional significance through the
authority of statistics and algorithmic technology.

Our results indicate that algorithmic judgements of senti-
ment and toxicity seem to hinge on textual markers that do
not necessarily align with the historical goals of managerial
sentiment analysis. Moreover, particularly in the hands of
managers untrained in data science, numerical anomalies
that may reinforce gendered and racialized stereotypes can

AI & SOCIETY (2026) 41:787û799

797

contribute to discriminatory workplace decision-making
even if the platform itself, as documented by the third-party
algorithmic audits, does not differentially discriminate on
the basis of protected categories.

4   Conclusion

In this study, we coupled a critical analysis of the rheto-
ric surrounding sentiment analysis bossware systems with
a data scientific investigation of one such system. As we
have shown, ôsentimentö and ôtoxicityö are multifaceted
concepts,  and  the  application  of  sentiment  analysis  and
toxicity detection to workplace communications risks mis-
representing the intent behind those communications. More
generally, we join existing scholarship in calling for more
critical engagements with the underlying epistemologies on
which these systems trade. While this study was enabled by
the serendipitous ônatural experimentö afforded by AwareÆs
publicizing of its report, the mounting pressure on com-
panies to make public details of their systems may enable
more such investigations in the future (International Panel
on the Information Environment 2024b). However, such a
future is far from certain. Even in the time it took to pub-
lish these results, Aware itself has been absorbed by human
risk management platform Mimecast (Mimecast 2024), and
the Aware website, including the report at the center of this
study, has been taken offline. This study therefore represents
a preliminary attempt to explore the types of methods and
questions through which scholars may exercise additional
oversight of these algorithmic systems.

Acknowledgements  The authors acknowledge the Digital Research
Alliance of Canada for the use of the Cedar Compute and Arbutus
Object Storage, which significantly contributed to the research results
reported  in  this  paper.  The  authors  thank  members  of  the  Digital
Democracies Instituteáand the Data Fluencies Project at SFU for feed-
back on a draft of this paper. The authors are also thankful to Tokyo
College, the University of Tokyo, the Canada 150 Chairs Program, and
the Canadian Foundation for Innovation for significantly contributing
to the funding of this research.

 Data availability  The Reddit data used in this study are publicly avail-
able (Heitmann 2023).

Declarations

Conflict of interest  On behalf of all authors, the corresponding author
states that there is no conflict of interest.

References

Abraham M, Niessen C, Schnabel C, Lorek K, Grimm V, M÷slein
K, Wrede M (2019) Electronic monitoring at work: the role of
attitudes, functions, and perceived control for the acceptance of

tracking technologies. Hum Resour Manage J 29(4):657û675.
https:// doi. org/ 10. 1111/ 1748- 8583. 12250

Adams, Philippa R. 2023. ôHigher Further Faster: Social Media Dis-
courses of Feminism Misogyny and Captain Marvel. Doctoral
dissertation, Simon Fraser University.

AI  Now  Institute.  2023.  ôAlgorithmic  Accountability:  Moving
Beyond Audits.ö AI Now Institute (blog). April 11, 2023. https://
ainow insti tute. org/ publi cation/ algor  ithmic- accou ntabi lity.
Ajunwa I (2019) An Auditing Imperative for Automated Hiring.

SSRN Scholarly Paper, Rochester, NY

Ajunwa I, Crawford K, Schultz J (2017) Limitless worker surveil-

lance. Calif Law Rev 105(3):735û776

Albrecht, Carina, and Wendy Hui Kyong Chun,. 2024. ôThe Digital
Market of Interests and Feelings. In: The Politics of Curiosity:
Alternatives to the Attention Economy, edited by Enrico Campo
and Yves Citton, 109. Routledge. https:// books. google. com/
books? hl= en& lr= & id= JOX4E AAAQB  AJ& oi= fnd& pg= RA2-
PT16& dq= The+ Digit al+ Market+ of+ Inter ests+ and+ Feeli ngs+
carina+ albre cht& ots= nHhIma- fzI& sig= NTKk0 uTwpC JgIHH
Hyleo qmOja CU.

Aware. 2023. ôThe Retail Workplace Trends Report: What Frontline
Workers Care About.ö 2023. https:// www. aware hq. com/ resea
rch/ the- retail- workp lace- trends- report.

Babu NV, Kanaga EGM (2022) Sentiment analysis in social media
data  for  depression  detection  using  artificial  intelligence:  a
review. SN Comput Sci 3(1):74

Balahur,  Alexandra,  Ralf  Steinberger,  Mijail  Kabadjov,  Vanni
Zavarella, Erik Van Der Goot, Matina Halkia, Bruno Pouliquen,
and Jenya Belyaeva. 2013. ôSentiment Analysis in the News.ö
arXiv Preprint arXiv: 1309. 6202.

Ball  K  (2010)  Workplace  surveillance:  an  overview.  Labor  Hist
51(1):87û106. https:// doi. org/ 10. 1080/ 00236 56100 36547 76
Ball  K  (2022)  Surveillance  in  the  workplace:  past,  present,  and
future. Surveil Soc. https:// doi. org/ 10. 24908/ ss. v20i4. 15805
Bansal, Mohit, Claire Cardie, and Lillian Lee. 2008. ôThe Power
of Negative Thinking: Exploiting Label Disagreement in the
Min-Cut Classification Framework. 15û18.

Benjamin R (2019) Race after Technology: Abolitionist Tools for

the New Jim Code Polity. Wiley, Medford, MA

Bhasin T, Butcher C, Gordon E, Hallward M, LeFebvre R (2020)
Does Karen wear a mask? The gendering of COVID-19 masking
rhetoric. Int J Sociol Soc Policy 40(9/10):929û937. https:// doi.
org/ 10. 1108/ IJSSP- 07- 2020- 0293

Bouktif S, Fiaz A, Awad M (2020) Augmented textual features-based

stock market prediction. IEEE Access 8:40269û40282

Brady MJ, Christiansen E, Hiltz E (2023) Good Karen, bad Karen:
visual culture and the anti-vaxx mom on Reddit. J Gender Stud
32(6):616û631. https:// doi. org/ 10. 1080/ 09589 236. 2022. 20690
88

Chun WHK (2021) Discriminating data: correlation, neighborhoods,
and the new politics of recognition. The MIT Press, Cambridge,
MA

Chun WHK, Hong GK, Nakamura L (2024) æUnderstandingÆ Asians:
Anti-Asian Racism, Sentimentality, Sentiment Analysis, and Digi-
tal Surveillance. Crit Inq. https:// doi. org/ 10. 1086/ 728946

Das, Sanjiv Ranjan, and Mike Y. Chen. 2001. ôYahoo! For Amazon:
Sentiment Parsing from Small Talk on the Web.ö SSRN Schol-
arly Paper ID 276189. Rochester, NY: Social Science Research
Network. https:// doi. org/ 10. 2139/ ssrn. 276189.

Dave K, Lawrence S, Pennock DM (2003) Mining the Peanut Gal-
lery: Opinion Extraction and Semantic Classification of Product
Reviews. In: Habib S (ed) Proceedings of the 12th International
Conference on World Wide Web. Association for Computing
Machinery, New York, pp 519û528

Deloitte, and Aware. 2021. ôHarnessing Your OrganizationÆs Col-
laboration and Sentiment Data: Drawing the Fine Line.ö Deloitte

798

AI & SOCIETY (2026) 41:787û799

Development  LLC.  https:// www2. deloi tte. com/ us/ en/ pages/
human- capit al/ artic les/ ethic al- data- use- in- colla borat ion. html.
Diaz, Mark, Isaac Johnson, Amanda Lazar, Anne Marie Piper, and
Darren Gergle. 2018. ôAddressing Age-Related Bias in Sentiment
Analysis.ö In Proceedings of the 2018 CHI Conference on Human
Factors in Computing Systems, 1û14. CHI Æ18. New York, NY,
USA: Association for Computing Machinery. https:// doi. org/ 10.
1145/ 31735 74. 31739 86.

Dubrofsky RE (2022) Authenticating Whiteness: Karens, Selfies, and
Pop Stars. University Press of Mississippi. https:// doi. org/ 10.
2307/j. ctv30 vk1dx

Dynel M (2016) Pejoration via Sarcastic Irony and Sarcasm. In: Fink-
beiner R, Meibauer J, Wiese H (eds) Pejoration. John Benjamins,
Amsterdam, pp 219û239

Eubanks V (2018) Automating inequality: how high-tech tools profile,
police, and punish the poor. St. MartinÆs Publishing Group, New
York, NY

Kayas OG (2023) Workplace Surveillance: a Systematic review, inte-
grative framework, and research agenda. J Bus Res 168(Novem-
ber):114212. https:// doi. org/ 10. 1016/j. jbusr es. 2023. 114212
Kim, Soo-Min, and Eduard Hovy. 2006. ôAutomatic Identification of

pro and Con Reasons in Online Reviews. 483û90.

Kim, Soo-Min, and Eduard Hovy. 2007. ôCrystal: Analyzing Predictive

Opinions on the Web. 1056û64.

Kiritchenko S, Mohammad S (2018) Examining Gender and Race Bias
in Two Hundred Sentiment Analysis Systems. In: Nissim M, Ber-
ant J, Lenci A (eds) Procedings of the Seventh Joint Conference
on Lexical and Computational Semantics. Association for Com-
putational Linguistics, New Orleans, Louisiana, pp 43û53
Krippendorf K (1980) Content analysis: an introduction to its method-

ology. Sage, Thousand Oaks, CA

Ku, Lun-Wei, Yu-Ting Liang, and Hsin-Hsi Chen. 2006. ôOpinion
Extraction, Summarization and Tracking in News and Blog Cor-
pora. , 100107:1û167.

Feldman R (2013) Techniques and applications for sentiment analysis.

Lei L, Liu D (2021) Conducting Sentiment Analysis. Cambridge Uni-

Commun ACM 56(4):82û89

versity Press

Field, Hayden. 2024. ôHow Walmart, Delta, Chevron and Starbucks
Are Using AI to Monitor Employee Messages.ö CNBC. February
9, 2024. https:// www. cnbc. com/ 2024/ 02/ 09/ ai- might- be- readi ng-
your- slack- teams- messa ges- using- tech- from- aware. html.

French J (1953) Experiments in Field Settings. In: Festinger L (ed)
Research methods in the behavioral sciences. Wiley, Amsterdam,
pp 98û135

Gilbert, Abigail, Anna Thomas, Gwendolin Barnard, and Stephanie
Shier.  2023.  ôGood  Work  Algorithmic  Impact  Assessment.ö
Report. Institute for the Future of Work. https:// www. ifow. org/
publi catio ns/ good- work- algor ithmic- impact- asses sment- an- appro
ach- for- worker- invol vement.

Goodman  EP,  Trehu  J  (2022)  Algorithmic  auditing:  chasing  AI

accountability. Santa Clara High Tech LJ 39:289

Hanu, Laura, and team Unitary. 2020. ôDetoxify.ö Python. https:// doi.

org/ 10. 5281/ zenodo. 79256 67.

Heitmann, Arthur. 2023. ôArthurHeitmann/Arctic_shift: Making Red-
dit Data Accessible to Researchers, Moderators and Everyone
Else. Interact with the Data through Large Dumps, an API or
Web Interface.ö August 3, 2023. https:// github. com/ Arthu rHeit
mann/ arctic_ shift.

Henrich J, Heine SJ, Norenzayan A (2010) The weirdest people in the
world? Behav Brain Sci 33(2û3):61û83. https:// doi. org/ 10. 1017/
S0140 525X0 99915 2X

Holland  P,  Tham  TL  (2022)  Workplace  biometrics:  protecting
employee privacy one fingerprint at a time. Econ Ind Democr
43(2):501û515. https:// doi. org/ 10. 1177/ 01438 31X20 917453
HuggingFace. 2024. ôLlama2.ö 2024. https:// huggi ngface. co/ docs/ trans

forme rs/ en/ model_ doc/ llama2.

Hutto C, Gilbert E (2014) Vader: a parsimonious rule-based model
for sentiment analysis of social media text. Proceedings of the
International AAAI Conference on Web and Social Media 8:216
International Panel on the Information Environment. 2024a. ôGlobal
Approaches  to  Auditing  Artificial  Intelligence:  A  Literature
Review.ö Zurich, Switzerland SR2024.1. IPIE.

International Panel on the Information Environment. 2024b. ôTowards
A Global AI Auditing Framework: Assessment and Recommen-
dations.ö International Panel on the Information Environment
SR2024.3. Zurich, Switzerland.

Jones S (1992) Was There a Hawthorne Effect? Am J Sociol 98(3):451û

468. https:// doi. org/ 10. 1086/ 230046

ôKaren (Slang).ö 2023. In Wikipedia. https:// en. wikip edia. org/w/ index.

php? title= Karen_ (slang) & oldid= 11537 28765.

Kaufmann M, Egbert S, Leese M (2019) Predictive policing and the
politics of patterns. Br J Criminol 59(3):674û692. https:// doi. org/
10. 1093/ bjc/ azy060

Liu B (2012) Sentiment analysis and opinion mining. Synth Lect Hum
Lang Technol 5(1):1û167. https:// doi. org/ 10. 2200/ S0041 6ED1V
01Y20 1204H LT016

MΣntylΣ MV, Graziotin D, Kuutila M (2018) The evolution of senti-
ment analysisùa review of research topics, venues, and top cited
papers. Comput Sci Rev 27(February):16û32. https:// doi. org/ 10.
1016/j. cosrev. 2017. 10. 002

McCambridge J, Witton J, Elbourne DR (2014) Systematic review of
the Hawthorne effect: new concepts are needed to study research
participation effects. J Clin Epidemiol 67(3):267û277. https:// doi.
org/ 10. 1016/j. jclin epi. 2013. 08. 015

Metaxa D, Park JS, Robertson RE, Karahalios K, Wilson C, Hancock J,
Sandvig C (2021) Auditing algorithms: understanding algorithmic
systems from the outside in. Found Trends« in Humûcomput Inter
14(4):272û344

Mimecast. 2024. ôMimecast Announces Acquisition of Aware, Doubles
Down on AI-Powered Human Risk Management Capabilities.ö
August 14, 2024. https:// www. mimec ast. com/ resou rces/ press-
relea ses/ mimec ast- acqui res- aware/.

Mohammad SM, Zhu X, Kiritchenko S, Martin J (2015) Sentiment,
emotion, purpose, and style in electoral tweets. Inf Process Man-
age 51(4):480û499

Munn L (2024) Expansive and Invasive: Mapping the æBosswareÆ Used

to Monitor Workers. Surveill Soc 22(2):104û119

National Retail Federation. 2023. ôNRF | Top 100 Retailers 2023 List.ö
2023. https:// nrf. com/ resea rch- insig hts/ top- retai lers/ top- 100- retai
lers/ top- 100- retai lers- 2023- list.

Newman N (2017) Reengineering workplace bargaining: how big
data drives lower wages and how reframing labor law can restore
information equality in the workplace. Univ Cincinnati Law Rev
85:693û760

Noble SU (2018) Algorithms of Oppression: How Search Engines
Reinforce Racism. New York University Press, New york. https://
doi. org/ 10. 2307/j. ctt1p wt9w5

OpenAI. 2024. ôOpenAI Platform.ö 2024. https:// platf orm. openai. com.
Osgood CE, Suci G, Tannenbaum P (1957) The measurement of mean-

ing. University of Illinois, Urbana

Pachinger P, Hanbury A, Neidhardt J, Planitzer A (2023) Toward
disambiguating  the  definitions  of  abusive,  offensive,  toxic,
and uncivil comments. Proceedings of the First Workshop on
Cross-Cultural Considerations in NLP (C3NLP), pp. 107û113.
Dubrovnik, Croatia

Pang B, Lee L, Vaithyanathan S (2002) Thumbs up? Sentiment Clas-
sification Using Machine Learning Techniques. In: Habib S (ed)
Procedings of Conference on Empirical Methods in NLP. ACM,
Philadelphia, PA, pp 79û86

AI & SOCIETY (2026) 41:787û799

799

Pavlopoulos, John, Jeffrey Sorensen, Lucas Dixon, Nithum Thain, and
Ion Androutsopoulos. 2020. ôToxicity Detection: Does Context
Really Matter?ö arXiv Preprint arXiv: 2006. 00998.

Qualtrics. n.d. ôEmployee Sentiment and How to Measure It.ö https://
www. qualt rics. com/ exper  ience- manag ement/ emplo yee/ emplo
yee- senti ment/.

Risch, Julian, and Ralf Krestel. 2020. ôToxic Comment Detection in
Online Discussions.ö Deep Learning-Based Approaches for Senti-
ment Analysis, 85û109.

Roethlisberger FJ (1962) Management and Morale. Harvard University

Press. https:// doi. org/ 10. 4159/ harva rd. 97806 74420 540

Roethlisberger FJ, Dickson WJ (1939) Management and the Worker.

Harvard University Press, Cambridge

R÷ttger, Paul, Hannah Kirk, Bertram Vidgen, Giuseppe Attanasio, Fed-
erico Bianchi, and Dirk Hovy. 2023. ôXSTest: A Test Suite for
Identifying Exaggerated Safety Behaviours in Large Language
Models,ö August, https:// arxiv. org/ abs/ 2308. 01263.

Schumann,  Jeff.  2023.  ôAwareÆs  AI  Data  Platform  Dominates  in
Head-to-Head  Showdown  against  MetaÆs  Llama-2.ö  2023.
https:// www. aware hq. com/ blog/ aware- ai- data- platf  orm- domin
ates- meta- llama2.

Sewell  G,  Barker  JR  (2006)  Coercion  versus  care:  using  irony  to
make sense of organizational surveillance. Acad Manage Rev
31(4):934û961. https:// doi. org/ 10. 5465/ AMR. 2006. 22527 466
Stone PJ, Dunphy DC, Smith MS, Ogilvie DM (1966) The general
inquirer: a computer approach to content analysis. MIT Press,
Cambridge, MA

Taboada M (2016) Sentiment analysis: an overview from linguistics.
Ann Rev Linguist 2:325û347. https:// doi. org/ 10. 1146/ annur  ev-
lingu istics- 011415- 040518

Talat Z, Davidson T, Warmsley D, Weber I (2017) Understanding
abuse: a typology of abusive language detection subtasks. In Pro-
ceedings of the first workshop on abusive language online, pp
78û84, Vancouver

Taylor, Astra. 2023. The Age of Insecurity. https:// house ofana nsi. com/

produ cts/ the- age- of- insec urity.

Thelwall M (2018) Gender bias in sentiment analysis. Online Inf Rev

42(1):45û57. https:// doi. org/ 10. 1108/ OIR- 05- 2017- 0139

Touvron, Hugo, Louis Martin, Kevin Stone, Peter Albert, Amjad Alma-
hairi, Yasmine Babaei, Nikolay Bashlykov, etáal. 2023. ôLlama 2:

Open Foundation and Fine-Tuned Chat Models.ö arXiv. https://
doi. org/ 10. 48550/ arXiv. 2307. 09288.

Turney, Peter D. 2002. ôThumbs Up or Thumbs Down? Semantic
Orientation Applied to Unsupervised Classification of Reviews.ö
Proceedings of the 40th Annual Meeting of the Association for
Computational Linguistics, December, 417û24.

Ugwudike P (2022) AI audits for assessing design logics and building
ethical systems: the case of predictive policing algorithms. AI
Ethics 2(1):199û208. https:// doi. org/ 10. 1007/ s43681- 021- 00117-5
Narayanan  Venkit,  Pranav,  Mukund  Srinath,  and  Shomir  Wilson.
2023. ôAutomated Ableism: An Exploration of Explicit Disabil-
ity Biases in Sentiment and Toxicity Analysis Models.ö In Pro-
ceedings of the 3rd Workshop on Trustworthy Natural Language
Processing (TrustNLP 2023), edited by Anaelia Ovalle, Kai-Wei
Chang, Ninareh Mehrabi, Yada Pruksachatkun, Aram Galystan,
Jwala Dhamala, Apurv Verma, Trista Cao, Anoop Kumar, and
Rahul Gupta, 26û34. Toronto, Canada: Association for Computa-
tional Linguistics. https:// doi. org/ 10. 18653/ v1/ 2023. trust nlp-1.3.
Whitehead TN (1938) The Industrial Worker. In: Habib S (ed) Statis-
tical Study of Human Relations in a Group of Manual Workers.
Harvard University Press, Cambridge

Whitehead-Smith, Elle. 2024. ôEmployee Voice Survey: The What,
Why and How.ö October 2024. https:// theha ppine ssind ex. com/
blog/ emplo yee- voice/.

Winick,  Erin.  2018.  ôAmazon  Ditched  AI  Recruitment  Software
Because It Was Biased against Women.ö MIT Technology Review,
October 10, 2018. https:// www. techn ology review. com/ 2018/ 10/
10/ 139858/ amazon- ditch ed- ai- recru itment- softw  are- becau se- it-
was- biased- again st- women/.

Publisher's  Note  Springer  Nature  remains  neutral  with  regard  to
jurisdictional claims in published maps and institutional affiliations.

Springer Nature or its licensor (e.g. a society or other partner) holds
exclusive rights to this article under a publishing agreement with the
author(s) or other rightsholder(s); author self-archiving of the accepted
manuscript version of this article is solely governed by the terms of
such publishing agreement and applicable law.
