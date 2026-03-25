<!--
  AI Triad Research Project — Document Snapshot
  Title      : The State Statutes Project
  Source     : 
  Type       : pdf
  Captured   : 2026-02-23
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# The State Statutes Project

> **Snapshot captured:** 2026-02-23
> **Source:** 
> **Type:** pdf

---

THE STATE STATUTES PROJECT
NEEL GUHA* & DIEGO A. ZAMBRANO**
State statutes are having a moment in national debates. Partly fueled by
polarization, state legislatures have pushed the boundaries on almost every
important national question, from abortion and regulation of social media, all
the way to police lawsuits and drug use. Take, for instance, the by now wellknown example of Texas Senate Bill 8. To avoid Roe v. Wade, the Texas
Legislature enacted a statute that allowed private parties (really, anyone) to
sue abortion providers. The kicker was that the statute prohibited government
enforcement in order to prevent Ex parte Young style challenges in federal
court. Or take Montana’s attempt to ban the use of TikTok within the state.
In Senate Bill 419, the Montana Legislature imposed a penalty of $10,000 for
each discrete violation of the statute, including the continued availability of
TikTok or downloads of the app in the state. In both of these cases, state
legislatures regulated a politically contentious area of law. And this is just the
beginning. In an empirical study of state private enforcement, we found that
states have added private remedies for harms arising from novel digital
technologies, including issues related to privacy, recording devices worn by
police officers, broadband accessibility, electronic communications, and
online criminal activity.
Notwithstanding the importance of these state statutory developments,
scholars have no readily accessible database to conduct empirical research on
state statutes. Current databases do not provide granular data on statutory
provisions, fail to flag trends in the adoption of new statutes across the states,
cannot give fine-grained numbers on how many statutory provisions of a
certain type exist, and are simply not optimized for cross-state statutory
research. For example, current databases are not useful for researching the
number of statutes that provide immunities to local officials, the growth of
private rights of action over time, the differences in language between state
foreign judgment enforcement statutes, or how states adapt model codes.
This Essay sketches out a vision of an in-progress effort to spur
empirical research on state laws. We plan to use large language models
(LLMs) to produce an annotated database of state statutes. This database
would contain an easily accessible version of all state statutes and, within
them, statutory clauses of interest to academics. Each clause would be
annotated according to variables that might help researchers across a range
of disciplines, including law, political science, and economics. These could
include, for instance, whether a clause creates a private right of action,
whether it creates an immunity from lawsuits, whether it is a criminal
provision derived from a model code, and so on. In this Essay, we

*
J.D. and PhD Candidate in Computer Science, Stanford University, 2026.
**
Professor of Law, Stanford Law School. We thank Adam Chilton, Austin
Peters, Nate Atkinson, Christopher Walker, attendees of the 2024 Chicago-Virginia
Foreign Relations Law Roundtable, and attendees of the University of Wisconsin Law
School’s 2024 Public Law in the States Conference for feedback.
https://doi.org/10.59015/wlr.KMEM2466

WISCONSIN LAW REVIEW

demonstrate an early application of the State Statutes Project, focusing on
provisions that, in one way or another, contain foreign relations ingredients.
Our plan is for the Stanford Neukom Rule of Law Center to publish
and host the database with the hope of supporting empirical work on state
law. Such a database would hopefully emulate what similar projects have
done in other areas, including the Comparative Constitutions Project, which
opened up and significantly improved research on constitutional provisions.
This Essay describes the goals of the project, its structure, and progress thus
far.

Introduction ................................................................... 1616
I.
Current Limitations in the Study of State Statutory Text ..... 1620
II.
Our Proposed State Statutes Project .............................. 1622
A. What Will the Database Contain? ........................... 1622
B. What Could It Be Used for? .................................. 1623
C. What Variables Will the Database Contain? ............... 1625
D. New Methods ................................................... 1626
III. Case Study: Foreign Affairs Ingredients in State Law ........ 1627
A. Tracking Common Categories of Foreign Relations
Statutes ........................................................... 1627
1. International Promotion Statutes......................... 1629
2. Anti-Boycott Statutes ...................................... 1630
3. Anti-Foreign Law Statutes................................ 1631
B. Discovering New Foreign Relations Statutes .............. 1631
1. Findings ..................................................... 1632
2. Distribution Across States and Referenced Foreign
Nations ....................................................... 1632
3. Change Over Time......................................... 1634
Conclusion .................................................................... 1634
INTRODUCTION
State statutes are having a moment in national debates. Partly fueled
by polarization, state legislatures have pushed the boundaries on almost
every important national question, including abortion, the regulation of
social media, police lawsuits, and drug use. Take, for instance, the by
now well-known example of Texas Senate Bill 8.1 To avoid Roe v.
Wade,2 the Texas Legislature enacted a statute that allowed private
parties (really, anyone) to sue abortion providers.3 The kicker was that
1.
Texas Heartbeat Act, S. 8, 87th Leg., Reg. Sess. (Tex. 2021).
2.
410 U.S. 113 (1973).
3.
Tex. S. 8, § 3 (amending chapter 171 of Texas’s Heath and Safety Code
to allow “[a]ny person, other than an officer or employee of a state or local governmental
entity in this state, [to] bring a civil action against any person who: (1) performs or

2024:1615

The State Statutes Project

the statute prohibited government enforcement in order to prevent Ex
parte Young4 style challenges in federal court.5 Or take Montana’s
attempt to ban the use of TikTok within the state. In Senate Bill 419, the
Montana Legislature imposed a penalty of $10,000 for each discrete
violation of the statute, including the continued availability of TikTok or
downloads of the app in the state.6 In both of these cases, state legislatures
regulated a politically contentious area of law. But this is just the
beginning. In an empirical study of state private enforcement, we found
that “states have added private remedies for harms arising from novel
digital technologies, including issues related to privacy, recording
devices worn by police officers, broadband accessibility, electronic
communications, and online criminal activity.”7
Notwithstanding the importance of these state statutory
developments, scholars have no readily accessible database to conduct
empirical research on state statutes. Current databases do not provide
granular data on statutory provisions, fail to flag trends in the adoption
of new statutes across the states, cannot give fine-grained numbers on
how many statutory provisions of a certain type exist, and are simply not
optimized for cross-state statutory research.8 For example, current
databases are not useful for researching: the number of statutes that
provide immunities to local officials, the growth of private rights of
action over time, the differences in language between state foreign
judgment enforcement statutes, or how states adopt model codes.9
We plan to use large language models (LLMs) to produce an
annotated database of state statutes. This database would contain an easily
accessible version of all state statutes and, within them, statutory clauses
of interest to academics. Each clause would be annotated according to
variables that might help researchers across a range of disciplines,
including law, political science, and economics. These could include, for
induces an abortion in violation of this subchapter; (2) knowingly engages in conduct that
aids or abets the performance or inducement of an abortion . . . ; or (3) intends to engage
in the conduct described by Subdivision (1) or (2)”).
4.
209 U.S. 123 (1908) (allowing federal courts to hear suits for injunctive
relief against state officers allegedly violating federal law).
5.
Tex. S. 8, § 3 (noting that the requirements imposed by the bill “shall be
enforced exclusively through . . . private civil actions,” and that “[n]o
enforcement . . . may be taken or threatened by this state, a political subdivision, a
district or county attorney, or an executive or administrative officer or employee of this
state or a political subdivision against any person”).
6.
S. 419, 68th Leg., Reg. Sess. § 1(2) (Mont. 2023); Alario v. Knudsen, No.
CV 23-56-M-DWM, 2023 WL 8270811, at *3 (D. Mont. Nov. 30, 2023).
7.
Diego A. Zambrano, Neel Guha, Austin Peters & Jeffrey Xia, Private
Enforcement in the States, 172 U. PA. L. REV. 61, 68 (2023) (footnotes omitted).
8.
See infra Part I.
9.
See infra Part I.

WISCONSIN LAW REVIEW

instance, whether a clause creates a private right of action, whether it
creates an immunity from lawsuits, whether it is a criminal provision
derived from a model code, and so on. Our plan is for the Stanford
Neukom Rule of Law Center to publish and host the database with the
hope of supporting empirical work on state law.10 Such a database would
hopefully emulate what similar projects have done in other areas,
including the Comparative Constitutions Project, which opened up and
significantly improved research on constitutional provisions.11
In this Essay, we demonstrate an early application of the State
Statutes Project, focusing on provisions that, in one way or another,
contain foreign relations ingredients. By statutes with a foreign
ingredient, we mean any statutory text that implicates foreign countries,
foreign individuals, foreign laws, or foreign courts. Scholars have
explored the relationship between state law and foreign countries,
including the possibility of state foreign policy,12 the connection between
federalism and foreign affairs,13 constitutional limits on state
lawmaking,14 procedural doctrines that affect foreign courts,15 and, more
recently, the rise of state laws that target foreign authoritarian countries.16
In all of these areas, scholars had to meticulously survey state statutory
text by hand, painstakingly detailing how state law governs, say, forum
non conveniens or whether Chinese citizens can purchase property.17 Yet,
despite their focus, we have only scratched the surface of foreign
ingredients in state law.
Applying our methodology, we find around 1,800 distinct clauses
with a foreign ingredient across the fifty states. We also find that states
have aggressively adopted statutes in three key areas: international

10.
Diego A. Zambrano, a coauthor of this Essay, is the Faculty Director for
the Stanford Neukom Rule of Law Center.
11.
About
the
CCP,
COMPAR.
CONSTS.
PROJECT,
https://comparativeconstitutionsproject.org/about-ccp/ [https://perma.cc/5R7V-LUJP].
12.
See, e.g., David Freeman Engstrom & Jeremy M. Weinstein, What if
California Had a Foreign Policy? The New Frontier of States’ Rights, WASH. Q., Spring
2018, at 27; Julian G. Ku, Gubernatorial Foreign Policy, 115 YALE L.J. 2380 (2006).
13.
See, e.g., Howard N. Fenton, III, The Fallacy of Federalism in Foreign
Affairs: State and Local Foreign Policy Trade Restrictions, 13 NW. J. INT’L L. & BUS.
563 (1993); John C. Yoo, Foreign Affairs Federalism and the Separation of Powers, 46
VILL. L. REV. 1341 (2001).
14.
See, e.g., Michael D. Ramsey, The Power of the States in Foreign Affairs:
The Original Understanding of Foreign Policy Federalism, 75 NOTRE DAME L. REV. 341
(1999).
15.
William S. Dodge, Maggie Gardner & Christopher A. Whytock, The Many
State Doctrines of Forum Non Conveniens, 72 DUKE L.J. 1163 (2023).
16.
Matthew S. Erie, Property as National Security, 2024 WIS. L. REV. 255.
17.
See Dodge, Gardner & Whytock, supra note 15, at 1174–77; Erie, supra
note 16, at 285–86, 285 n.164.

2024:1615

The State Statutes Project

economic promotion, anti-boycotts of particular nations, and prohibiting
foreign law in state courts. Because of our empirical approach, we can
specifically quantify the prevalence of these statutes. We find 553 distinct
statutory sections across 50 states describing the creation of state offices,
departments, corporations, or entities tasked with promoting the state’s
economic interests abroad. In a more symbolic area of state law, we find
78 distinct enactments (across 36 states) that prevent public entities from
contracting or purchasing services from companies engaged in boycotts
of certain countries, and/or instruct public officials to divest from these
companies. Finally, we find 64 distinct enactments (across 43 states) that
limit a state’s courts from enforcing foreign laws or judgements.
Setting aside these three areas, we also discovered more esoteric
zones of state foreign relations. Take, for instance, the fact that Sudan
appears in more than fifty state statutes, mostly related to divestment
efforts after the war in Darfur.18 Or consider a California statute that
provides:
Upon passage of a federal law . . . imposing sanctions on the
government of Turkey for failure to officially acknowledge its
responsibility for the Armenian Genocide, [a California
pension] board shall not make additional or new investments or
renew existing investments of public employee retirement funds
in any investment vehicle in the government of Turkey . . . .19
Consider this outlandish example: In 2001, Oklahoma adopted the
Compete with Canada Film Act20 to incentivize “those in Hollywood to
create more of their films in Oklahoma” rather than Canada.21 These
examples show how states attempt to intervene in foreign relations in
ways that are unexpected to outside researchers.
In general, our goal is to make state statutory research much easier.
We seek to share our current efforts to use a large language model to fill
the need for more empirical research on state law and outline future
directions for work.
18.
This figure comes from our analysis. These statutes appear to relate to the
humanitarian crisis in Sudan in the early 2000s. See, e.g., Press Release, Rod R.
Blagojevich, Ill. Governor, Gov. Blagojevich Signs Law Prohibiting Illinois Pension
Funds from Investing in Companies that Are Associated with the Republic of
Sudan (Aug. 28, 2007), https://www.illinois.gov/news/press-release.6244.html
[https://perma.cc/C5HH-JPUP] (noting that fifteen states took varying actions to divest
from Sudan).
19.
CAL. GOV’T CODE § 7513.74(b) (West 2024).
20.
OKLA. STAT. ANN. tit. 68, §§ 3621–3626 (West 2024).
21.
See Press Release, Keith Leftwich, Oklahoma State Sen., Film Incentive
Bill Signed into Law (May 24, 2001, 1:23 AM), https://oksenate.gov/press-releases/filmincentive-bill-signed-law [https://perma.cc/9ZCE-KSUY].

WISCONSIN LAW REVIEW

I. CURRENT LIMITATIONS IN THE STUDY OF STATE
STATUTORY TEXT
We begin with an uncontroversial proposition: Legal scholars often
write about the latest developments in state law. Whether it is to explore
tort reform, constitutional protections for education, or civil procedure,
scholars typically make general claims about trends in state law. To do
so, scholars rely on surveys of all state statutes in a particular area or,
unfortunately, must generalize based on a few examples. If a scholar is
lucky, they might draw from a pre-existing fifty-state survey. Perhaps
the most comprehensive database of this kind, Westlaw’s “50 State
Statutory Surveys” categorizes different statutory provisions, including
in areas like Artificial Intelligence, Bankruptcy, Blue Sky Laws, Business
Organizations, and Criminal Laws.22 But if there is no existing fifty-state
survey, then a scholar must start from scratch.
When researchers are forced to conduct a fifty-state survey from
scratch, they face a host of limitations. First, there is no single open
database that contains all state laws in a navigable way. States simply do
not provide easily accessible versions of their state codes. And, even
when they do, they force researchers to use keywords to find specific
provisions in PDF documents. But the problem is that ex ante researchers
often do not know the exact language of the statutory text they are
searching. Take, for instance, our previous effort to study private rights
of action in state law.23 There was no single keyword that we could enter
into Westlaw or Lexis to begin that search. Moreover, when we enter
terms like “private right of action,” current databases often limit results
by showing hits of “10,000+.” That same process applies to researching
almost every area of state law. As we’ve explained in previous work,
Westlaw and Lexis are not optimized for quantitative research on state
statutes:
In particular, the use of [Westlaw and Lexis] creates two
measurement problems due to their lack of transparency. One
is a problem of aggregation. In short, we are not sure what the
unit of analysis is when [researching a particular provision in
state laws]. It’s possible, for instance, that search engines
22.
50 State Statutory Surveys, WESTLAW, https://1.next.westlaw.com/
Browse/Home/SecondarySources/50StateSurveys/50StateStatutorySurveys (from the
Westlaw homepage, follow “Secondary Sources” hyperlink, then follow “50 State
Surveys” hyperlink, then follow “50 State Statutory Surveys” hyperlink).
23.
Zambrano, Guha, Peters & Xia, supra note 7.

2024:1615

The State Statutes Project

intentionally limit the number of results displayed for queries
with numerous results. Additionally, search results will only
return documents that contain language matched by the query.
If a document corresponds to a section of a state code—which
may contain numerous [statutory provisions] spanning different
types of claims—that document will only be counted as a single
[provision]. Second, and most importantly, the number of
results returned by this method is highly dependent on the
actual queries constructed, and we do not know the search
terms used in the query.24
Second, even when a researcher has some idea of the relevant
language in state law, they are forced to parse enormous amounts of text
with the help of research assistants. So, for instance, Matthew Erie
recently wrote about the expansion of state laws that target Chinese
citizens.25 He knew ex ante that state statutes would probably mention
the words “China” or “Chinese,” so he was able to instruct research
assistants to search on Westlaw and catalogue the presence of these words
in proposed state bills.26 He describes his research methods as follows:
Searches were conducted in both Legiscan and Westlaw to
confirm that all known bills were identified. Key terms
consisted of “China,” “Chinese,” “foreign adversary,” and
“restricted foreign entity.” The search is up to date as of
October 14, 2023. While the database captures a snapshot of
legislative activity, due to the quickly evolving nature of the
legislation, the database is inevitably outdated.27
This is the best possible research that one could perform with current
databases. But, as Erie mentions, it is difficult to keep up to date.28 And
such a method does not allow the researcher to discover new ways of
targeting Chinese entities. Suppose that states have figured out that
instead of mentioning “China,” they can refer to foreign state-owned
entities. Erie’s method would fail to capture those bills.

24.
25.
26.
27.
28.

Zambrano, Guha, Peters & Xia, supra note 7, at 143.
Erie, supra note 16.
Id. at 286 n.164.
Id.
Id.

WISCONSIN LAW REVIEW
II. OUR PROPOSED STATE STATUTES PROJECT

We present our proposal for the State Statutes Project—an effort to
encourage greater empirical scholarship on state law by making available
a comprehensive database of state statutes, where statutes are labeled
according to variables of interest to legal scholars. We begin with two
notable aspects of the project: First, we believe that modern machine
learning techniques (namely, large language models) can be used to semiautomate annotation cheaply and accurately. Second, we hope to
incorporate multiple researchers into the process of building this database
and would like to invite other scholars to participate in the project by
identifying variables that the database should include.
A. What Will the Database Contain?
The database will contain the fifty state codes, subdivided into
statutes. (We currently have access to decades of state codes but due to
contractual restrictions cannot yet make them available to other
researchers.) In order to build a more accessible database, we plan to
collect statutory text directly from state legislature websites. The initial
version of the database would contain only the most recent version of
state codes. However, if the project is successful, we hope to augment
the database with historic state codes, thus enabling scholars to study
trends over time.
Statutes in the database would be coded according to variables that
capture legal properties of interest. At a general level, examples include:
•

•

•

Topic variables: Variables that code the domain,
subject matter, or topic of a particular statute. For instance,
whether a statute is about “corporate law,” “housing,”
“energy resources,” or “foreign affairs.” These variables
allow scholars to measure variation in the extent of state
regulation in different domains.
Function variables: Variables that code the function of the
statute. For instance, whether statute bars certain types of
conduct or creates a particular form of disclosure
requirement.
Enforcement variables: Variables that code properties of
the statute’s enforcement process. For instance, whether
the statute relies on private or public enforcement and
whether it expands or contracts damages, such as through
fee shifting provisions, treble damages provisions, or
damages caps. Auxiliary variables could include against

2024:1615

•

The State Statutes Project

whom a statute creates a private right and whether certain
entities or individuals are immunized from suit.
Interaction variables: Variables that code a statute’s
interaction with other sources of law. For instance, whether
a statute includes provisions that are contingent on federal
law (e.g., by relying on a federal definition) or overlap with
model codes or uniform laws.

We will model the database on successful efforts by legal scholars
to create and distribute large-scale legal “datasets,” like the Comparative
Constitutions Project or the U.S. Supreme Court Database.29 The
practical difficulties in collecting and annotating legal texts limits the
types of analyses legal scholars can perform. By shouldering the burden
of data processing and labeling—and distributing the produced datasets
in an open and accessible way—these initiatives have spurred significant
scholarship in their respective fields. It is our hope to follow in their
footsteps.
B. What Could It Be Used for?
An easily accessible database of state laws would provide a wealth
of benefits and open up research in new directions. By way of
comparison, since the Comparative Constitutions Project launched in
2005, it collected and analyzed thousands of constitutional texts and made
that data publicly available.30 We aim to do the same for state statutes.
First, a database would allow readers to evaluate claims in existing
scholarship on state law. As discussed above, law review articles
repeatedly make claims about developments and trends in state statutes.
Without a full accounting of the statutory provisions underlying those
claims, it is difficult to evaluate their veracity. An open database would
therefore make it easier to both research and verify claims about state
law.
Second, providing a complete account of state statutory provisions
allows for broader comparisons between states and empowers both
researchers and legislators. State legislators constantly search for
examples from other states and rarely adopt new statutory language
wholesale. One example of this is the powerful influence of model codes:
“Many state legislators look to model codes as a source of inspiration or
guidance when drafting legislation. By adopting a model code, legislators
can save time and effort in the legislative process and ensure that their
29.
COMPAR. CONSTS. PROJECT, supra note 11; The Supreme Court Database,
WASH. UNIV. L., http://scdb.wustl.edu/ [https://perma.cc/ZEF2-EWXU].
30.
COMPAR. CONSTS. PROJECT, supra note 11.

WISCONSIN LAW REVIEW

laws are based on best practices or established standards.”31 If
researchers can better uncover trends in state statutes, this would
“promote consistency and uniformity in laws across different states,
which can be especially useful in areas where states share common
interests or face similar challenges.”32
Third, the database would create opportunities to test theories about
the development or structure of law via empirical measurement across
the states. For instance, civil procedure scholars have long debated the
prevalence of private enforcement in federal law and sought to test
different theories, including the relationship between the separation of
powers and private rights of action.33 In our recent paper, Private
Enforcement in the States, we pushed these debates forward by mapping
the use of private rights of action in state law.34 Despite the vast
importance of private enforcement at the federal level, scholars had not
been able to measure the prevalence of private rights of action in state
law.35 In that article, we used machine learning to identify privateenforcement provisions across all fifty states’ laws going back to 2003.36
Our results showed that, “[e]ven by conservative estimates, there are
more than 3,500 private-rights-of-action provisions in state law.”37 Most
importantly, once we had data on state laws, we could test existing
theories of private-enforcement adoption:
The most prominent one—the separation-of-powers theory—
posits that Congress enacts private rights of action when the
executive is controlled by another political party. Our empirical
bottom line is that we broadly fail to find evidence in favor of
any of the theories . . . . Regression analyses based on our best
estimates of private-enforcement provisions do not yield a
statistically meaningful relationship between divided
government and private-enforcement adoption. . . . We even
find no correlation between an increased adoption of private
enforcement and legislative control by either Democrats or
Republicans.38
That project served as an example of possible uses of a state statutes
database. Additionally, this database—particularly if extended to
31.
32.
33.
34.
35.
36.
37.
38.

Zambrano, Guha, Peters & Xia, supra note 7, at 129.
Id. at 129–30.
Id. at 78.
Id. at 65.
Id. at 86.
Id. at 67.
Id. at 62.
Id.

2024:1615

The State Statutes Project

encompass historic versions of state codes—would help us better study
how state regulation evolves over time.39
Below, we will provide another example of an open research
question: state laws with foreign ingredients. As we will discuss, this
example shows how the database could enable scholars to track the
frequency and distribution of specific types of foreign relations laws
through variables corresponding to these types. For instance, scholars
could track which states have passed laws regulating anti-national
boycotts (e.g., anti-BDS laws), foreign judgements, or government
procurement. Second, this database would allow scholars to discover new
types of statutes dealing with foreign affairs through the more broadly
coded “foreign affairs” topic variable. Scholars could examine whether,
in aggregate, state involvement in foreign affairs has been increasing,
and at what rate. They could analyze coded statutes to determine whether
states are enacting laws exercising power in new ways or over novel
substantive issues.
C. What Variables Will the Database Contain?
We hope to involve the broader legal academic community in the
construction of this database by structuring the project as an open and
collaborative effort.40 Given the relevance of state statutes to a broad
cross section of scholars, we believe a database will be most useful if it
captures a diverse array of variables reflecting the interests of different
areas of legal study. Concretely, we imagine the collaborative component
of the database’s construction would be structured as follows: First, we
hope to solicit ideas from scholars for different variables that could be
coded. Second, as we apply our methodology to label clauses, we will
work with participating scholars through the various stages of quality
control to ensure that annotations are sufficiently accurate.
The collaborative and open-participation aspects of this project are
inspired by similar efforts both within and outside of law. In the sciences
and engineering, researchers have frequently adopted this model of
collaboration to develop large scale empirical artifacts. We think this
structure has two primary benefits. First, working with the broader legal
academic community to construct this database allows for the integration
of diverse subject-matter expertise. Scholars of different subject
matters—administrative law, criminal law, civil procedure, and more—

39.
See id. at 67.
40.
See, e.g., Neel Guha et al., LegalBench: A Collaboratively Built
Benchmark for Measuring Legal Reasoning in Large Language Models, ARXIV 4 (Aug.
23, 2023), https://www.arxiv.org/pdf/2308.11462 [https://perma.cc/53VZ-X9Q6].

WISCONSIN LAW REVIEW

understand which types of statutory variables would be informative and
how they should be conceptually constructed.
Second, a database produced through a community-driven effort
allows for diverse perspectives regarding how statutory variables should
be defined. It may be that scholars disagree on the definitions of variables
or the boundaries of certain concepts as they manifest in statutes. In these
instances, the database could contain variables corresponding to different
possible definitions, allowing the ultimate users of the database to decide
which they prefer. Ordinarily, such an approach is not possible because
annotating a single variable is so expensive.41 But because large language
models provide a mechanism for cheaply generating annotations, they
allow us to label potentially more variables.42
D. New Methods
The core challenge in producing this type of database is annotating
statutes. Because the aggregate of state law is so voluminous, the
traditional approach of manual annotation is infeasible.43 Thus, we
propose utilizing large language models to significantly automate the
coding process. LLMs—the best-known example of which is OpenAI’s
ChatGPT—are a novel class of language-based artificial intelligence
systems capable of performing complex reasoning over textual inputs.44
We believe LLMs are particularly well suited for our project for two
reasons. First, while traditional machine learning methods require
building “training sets” consisting of hundreds or thousands of labeled
samples, LLMs can be “taught” to label text with only a description of
the variable to be coded and a handful of examples.45 In other words,
LLMs can be configured to perform labeling using precisely the type of
guidance given to a law student research assistant. This makes them
particularly useful for projects like ours, where the objective is to
annotate many different variables with as little manual coding as possible.
Second, our prior work has revealed that modern LLMs are already quite

41.
See id. at 6.
42.
Id.
43.
For reference, our current collection of statutes (across all states) for the
year 2021 contains approximately 21 million sentences, or 440 million words.
44.
See Harry Surden, ChatGPT, AI Large Language Models, and Law, 92
FORDHAM L. REV. 1941, 1942–43 (2024); Guha et al., supra note 40, at 4, 6.
45.
See Guha et al., supra note 40, at 6. Computer science literature refers to
this process as “in-context learning” and to the combined textual description and
demonstrations as a “prompts.” See, e.g., Sang Michael Xie & Sewon Min, How Does
In-Context Learning Work? A Framework for Understanding the Differences from
Traditional Supervised Learning, STAN. AI LAB BLOG (Aug. 1, 2022),
https://ai.stanford.edu/blog/understanding-incontext/ [https://perma.cc/KUS3-8KFT].

2024:1615

The State Statutes Project

capable of annotating legal texts, yielding accuracy rates that are
satisfactory for downstream empirical analysis.46 For instance,
researchers building from our efforts have identified at least twelve
different LLMs capable of classifying private rights of action in statutory
text at an accuracy rate greater than ninety percent.47
III. CASE STUDY: FOREIGN AFFAIRS INGREDIENTS IN STATE LAW
This Part presents a preliminary application of our proposed
methodology by identifying and studying state statutes containing foreign
relations ingredients. In Section III.A, we enumerate several categories
of statutes containing foreign ingredients and track their frequency across
different states. In Section III.B, we explore statutes containing foreign
ingredients more broadly and track the evolution of these statutes over
time.
A. Tracking Common Categories of Foreign Relations Statutes
We focus on three categories of foreign affairs–related statutes:
international promotion statutes, anti-boycott statutes, and anti-foreign
law statutes. These three categories involve the states’ most aggressive
and recent attempts to intervene in foreign affairs. As literature on state
foreign relations details, state governments enter into international
agreements for economic, symbolic, and political reasons.48 In an era of
polarization, many states face pressure from constituents to act on global
issues even when, or because, the federal government is absent.49 We
therefore assembled these categories by seeking specific examples of
economic, symbolic, and political foreign relations statutes that are
referenced in the relevant literatures without any systematic attempt to
quantify their appearance.

46.
47.

See Guha et al., supra note 40, at 13–14.
Neel Guha et al., LegalBench, CTR. FOR RSCH. ON FOUND. MODELS:
HOLISTIC EVALUATION OF LANGUAGE MODELS, https://crfm.stanford.edu/helm/lite/
latest/#/groups/legalbench (last visited Oct. 7, 2024) (click on tab labeled “subset: proa”
to view the performance data of different LLMs for predicting private rights of action;
the column “EM” indicates accuracy).
48.
See Erie, supra note 16, at 286–87.
49.
See id. at 258–59.

WISCONSIN LAW REVIEW

Statute Category

Description

Economic:
International promotion statutes

Statutes that create public offices
or entities to promote the state’s
economic interests abroad.

Symbolic:
Anti-boycott statutes

Statutes that regulate nationalitybased boycotts of goods and
services.

Political:
Anti-foreign law statutes

Statutes that enjoin, limit, or
condition enforcement of foreign
law by state courts or tribunals.

Table 1. Statutory Categories Analyzed 50
These three areas have provoked media attention and challenges on
the propriety of state foreign relations. With regards to economic
international promotion statutes, Texas has been particularly
aggressive—Governor Greg Abbott notoriously visited the United
Kingdom to sign a mutual cooperation agreement.51 (The U.K. is the
largest foreign investor into Texas companies.)52 Similarly, the California
Governor’s Office touts its “international diplomacy” that has produced
dozens of agreements with foreign nations.53 As for symbolic statutes,
states have wrestled with a movement to boycott Israel (BDS). A few
years ago, the Governor of Illinois signed an anti-BDS statute that sought
to “divest . . . from companies that participate in the [BDS] movement
targeting Israel.”54 Finally, in one of the most heated areas of statutory
activity, several states have banned the use of foreign law in state courts
or tribunals. Several states between 2010 and 2012 enacted laws “to

50.
We draw from an article that looked at similar categories. See id. at 258,
265–66, 268, 286.
51.
See Press Release, Greg Abbott, Tex. Governor, Governor Abbott
Strengthens Texas’ Economic Partnership with the United Kingdom (Mar. 15, 2024),
https://www.gov.texas.gov/news/post/governor-abbott-strengthens-texas-economicpartnership-with-the-united-kingdom [https://perma.cc/L9MT-QWCX].
52.
Id.
53.
International Diplomacy, CAL. GOVERNOR’S OFF. BUS. & ECON. DEV.,
https://www.business.ca.gov/advantages/international-trade-and-investment/
international-collaboration/international-diplomacy/ [https://perma.cc/7C6H-JVCC].
54.
Press Release, Bruce Rauner, Ill. Governor, Governor Signs Historic AntiBDS Law in Illinois (July 23, 2015), https://www.illinois.gov/news/pressrelease.13202.html [https://perma.cc/HG74-MJKY].

2024:1615

The State Statutes Project

restrict the circumstances in which state courts can consider foreign or
religious laws in their decisions.”55
Moving away from the anecdotal and into the empirical, we sought
to measure the actual appearance of these laws in state statutes. For each
category, we first devised a set of query keywords designed to capture
statutory clauses belonging to the category. Keywords are intended to be
overinclusive and thus frequently capture statutes unrelated to the
category. After applying keywords to filter down our database of 2021
state laws to a subset of potentially relevant statutes, we applied a large
language model to perform a fine-grained evaluation to determine
whether the statute belonged to the category.56 We caution that our results
are preliminary. As we continue to develop this project, we intend to
both refine the machine learning methods and engage in more rigorous
validation.
1. International Promotion Statutes
States have been both active and creative in promoting their
economic interests around the world. We find 553 distinct statutory
sections describing the creation of state offices, departments,
corporations, or entities tasked with promoting the state’s economic
interests abroad.57 These statutes often promote specific industries or
products, such as wine,58 agriculture,59 and corn.60 They can also entail
developing and maintaining relationships with foreign trading partners61
or even establishing offices abroad.62 For instance, a 2013 Minnesota
statute gives a state officer the power to “establish three new Minnesota
Trade Offices in key foreign markets selected for their potential to
55.
PEW RSCH. CTR., STATE LEGISLATION RESTRICTING USE OF FOREIGN OR
RELIGIOUS LAW, 2010-2012, at 1 (2023), https://www.pewresearch.org/wpcontent/uploads/sites/7/2013/04/state-legislation-restricting-foreign-or-religious-law.pdf
[https://perma.cc/2P3R-NM4W].
56.
We note several limitations of this methodology. First, it is possible that
certain relevant statutes may be missed during keyword filtering because our keywords
are incomplete. We also note that statutes may have unusual constructions which lead our
keywords to miss them. For instance, a statute may not provide the relevant language
explicitly but may instead reference another part of its code. Second, it is possible that
our LLM may produce erroneous classifications because it fails to recognize relevant
elements of the statute or correctly parse the language.
57.
A manual examination of a sample of these statutes suggests that
approximately eighty percent are correctly classified.
58.
N.Y. UNCONSOL. LAW § 72 (McKinney 2024).
59.
WYO. STAT. ANN. § 9-12-109 (2024).
60.
VA. CODE ANN. § 3.2-1411 (2024).
61.
ARK. CODE ANN. § 15-4-210 (2024).
62.
MINN. STAT. § 116J.978(a) (2023).

WISCONSIN LAW REVIEW

increase Minnesota exports and attract foreign direct investment.”63
Minnesota then expanded this to seven offices, “located in Canada,
Mexico, Japan, European Union, United Kingdom, Australia and the
ASEAN region (Indonesia, Thailand, Vietnam, Singapore, Malaysia,
Philippines, Myanmar, Cambodia, Laos, and Brunei).”64 The Governor
of Minnesota has touted these offices as creating “more opportunities for
Minnesota exports across the globe, which already support more than
118,000 jobs in [the] state.”65 Across all states, we find that California,
Washington, and Florida have the most provisions falling under this
category.
2. Anti-Boycott Statutes
As discussed above, states have been active in symbolic foreign
relations—supporting foreign countries via the use of anti-boycott
statutes. We find seventy-eight distinct enactments across thirty-six
states.66 Generally, these statutes prevent public entities from contracting
or purchasing services from companies engaged in boycotts of certain
countries and/or instruct public officials to divest from these companies.
Around thirty-eight enactments explicitly mention Israel and anti-Israeli
boycotts. This is consistent with previous reports that “[t]wenty-seven
states have adopted laws or policies that penalize businesses,
organizations, or individuals that engage in or call for boycotts against
Israel.”67 But our comprehensive empirical approach allows us to go
beyond the particular case of Israel and demonstrate that states have more
general anti-boycott laws. South Carolina divests from any companies
engaged in boycotts of any World Trade Organization member country,
or any country that enjoys open trade with the United States.68 Other
statutes are older and more obscure. For instance, New York bars the
hiring of labor from any entity that participated in an international boycott
in violation of the U.S. Export Administration Act of 1969.69
63.
64.

Id.
Press Release, Minn. Dep’t of Emp. & Econ. Dev., Minnesota
Trade
Office
Expands
International
Representation
(June
7,
2018),
https://content.govdelivery.com/accounts/MNDEED/bulletins/1f599f5
[https://perma.cc/3BBL-DJQ8].
65.
Id.
66.
Our manual validation found that sixty provisions actually regulate
nationality-based boycotts.
67.
US: States Use Anti-Boycott Laws To Punish Responsible Businesses,
HUM. RTS. WATCH (Apr. 23, 2019, 12:00 AM), https://www.hrw.org/news/2019/04/23/
us-states-use-anti-boycott-laws-punish-responsible-businesses [https://perma.cc/C2N3YFJR].
68.
See S.C. CODE ANN. § 11-35-5300 (2023).
69.
See N.Y. LAB. LAW § 220-f (Consol. 2024).

2024:1615

The State Statutes Project

3. Anti-Foreign Law Statutes
We measure sixty-four distinct enactments across forty-three states
and manually validate that fifty-one enactments actually condition or limit
a state’s courts or tribunals from enforcing foreign laws or judgements.
The vast majority of these provisions arise from states adopting the
Uniform Foreign-Country Money Judgements Recognition Act.70
However, a few states have additional laws limiting the reach of foreign
courts. For instance, Idaho law provides that under certain
circumstances, foreign defamation judgements are to be treated as
inconclusive.71
B. Discovering New Foreign Relations Statutes
Next, we use our methodology to discover and analyze foreign
relations statutes beyond the above categories. By way of reminder, we
define foreign ingredients broadly and treat as relevant any statutory text
that implicates or names foreign countries, discusses foreign laws or
foreign courts, or expresses a view on a foreign policy issue. Both our
keywords and the prompt we use for our large language model reflect
this definition. The more expansive definition brings greater risks for
both labeling error and subjectivity. Not all statutes that implicate foreign
countries necessarily contain a “foreign relations ingredient,” and
reasonable readers may disagree as to whether a particular state statute
represents foreign relations activity. As an example, statutes controlling
occupational licensing regimes might traditionally be seen as purely local
regulation but may also be conduits for states to enforce preferences
about immigration by recognizing certain foreign licenses.72 A Louisiana
statute, for instance, empowers the Louisiana State Board of Medical
Examiners to issue temporary permits authorizing the practice of
medicine only to citizens of Canada and the Republic of the Philippines.73

70.
See Foreign-Country Money Judgments Recognition Act, UNIF.
L. COMM’N, https://www.uniformlaws.org/committees/community-home?Community
Key=ae280c30-094a-4d8f-b722-8dcd614a8f3e
[https://perma.cc/9TL9-LUMB]
(indicating that thirty states have enacted this act).
71.
IDAHO CODE § 6-3202 (2024).
72.
See Barriers to Work: Improving Access to Licensed Occupations for
Immigrants with Work Authorization, NAT’L CONF. OF ST. LEGISLATURES (Aug. 7, 2023),
https://www.ncsl.org/labor-and-employment/barriers-to-work-improving-access-tolicensed-occupations-for-immigrants-with-work-authorization [https://perma.cc/FW7LNE2G].
73.
LA. STAT. ANN. § 37:1275.1 (2024).

WISCONSIN LAW REVIEW
1. Findings

For the year 2021, our annotation process cumulatively identified
4,716 distinct clauses across the fifty states, which we estimate
correspond to 3,027 distinct enactments. Extrapolating the accuracy rate
observed during our validation process reduces this to approximately
1,800 distinct enactments with a foreign affairs ingredient, or
approximately 36 per state.74
Beyond the provisions identified in Section III.A, a substantial
number of identified provisions relate to when state courts should
recognize and enforce judgements by foreign courts. Notably, many of
these provisions arise from Uniform Law Commission model acts, like
the Uniform Child-Custody Jurisdiction and Enforcement Act (foreign
child custody determinations),75 the Interstate Family Support Act
(foreign child support determinations),76 and the Uniform ForeignCountry Money Judgments Recognition Act (foreign money
judgements).77
We also discover more esoteric provisions. For instance, a 2012
Louisiana statute initiates a process to create an international language
immersion school at the University of Louisiana at Lafayette.78 The
provision expressly required involvement from a representative to be
appointed by the Consulate General of France in New Orleans.79
2. Distribution Across States and Referenced Foreign Nations
We find considerable variation in the number of relevant provisions
across states. For instance, we measure 178 relevant enactments in
74.
We performed a validation of statutory provisions returned by our pipeline
to assess the percentage that—in our subjective judgement—contained a foreign relations
ingredient. In a sample of one hundred provisions, we found that approximately sixty
percent did. The remaining forty percent of provisions corresponded to statutes about
occupational licensing reciprocity, declarations of holidays pertaining to global events
(e.g., the end of World War II), and incidental references to conduct abroad (e.g.,
reporting requirements for foreign income, regulation of foreign corporations, deaths in
conveyance, import/export rules, and others).
75.
PATRICIA M. HOFF, U.S. DEP’T OF JUST., JUV. JUST. BULL. NCJ 189181,
THE UNIFORM CHILD-CUSTODY JURISDICTION AND ENFORCEMENT ACT 1, 3 (2001),
https://www.ojp.gov/pdffiles1/ojjdp/189181.pdf [https://perma.cc/HC4U-EQL2].
76.
See Interstate Family Support Act, UNIF. L. COMM’N,
https://www.uniformlaws.org/committees/community-home?communitykey=71d40358
-8ec0-49ed-a516-93fc025801fb [https://perma.cc/8FWH-3X26].
77.
See Foreign-Country Money Judgements Recognition Act, UNIF. L.
COMM’N, https://www.uniformlaws.org/committees/community-home?communitykey=
ae280c30-094a-4d8f-b722-8dcd614a8f3e [https://perma.cc/XX5P-FBCV].
78.
See Act No. 851, § 17:1970.32, 2012 La. Acts 3429–30 (repealed 2021).
79.
Id.

2024:1615

The State Statutes Project

California, while only 21 for Utah. We find that states with the greatest
number of enactments tend to be states with larger populations and states
bordering either Canada or Mexico:

Figure 1. Number of Enactments by State
We additionally analyze how often different countries are explicitly
mentioned in state codes. Perhaps unsurprisingly, the two most
frequently mentioned foreign countries are Canada and Mexico.
Mentions of these countries occur in a variety of contexts: We observe
statutes that expressly permit collaboration and coordination between
state and foreign agencies,80 agree to compacts that include both other
U.S. states and provinces of Canada,81 and impose notification
obligations to Mexico.82 In contrast, mentions relating to countries like
Iran and Sudan primarily occur in the context of divestment laws:83

Country

Number of Mentions

Canada
Mexico
Iran

80.
See, e.g., OHIO REV. CODE ANN. § 4141.42 (LexisNexis 2024)
(coordination of employee liability for unemployment compensation).
81.
See, e.g., 2 R.I. GEN. LAWS § 2-13-1 (2024) (ratifying the Northeastern
Interstate Forest Fire Protection Compact).
82.
See, e.g., CAL. HEALTH & SAFETY CODE § 25178.3 (Deering 2024)
(requiring the Director of the Department of Toxic Substances Control to notify when
certain actions are taken with respect to hazardous waste).
83.
See, e.g., FLA. STAT. § 215.473 (2024).

WISCONSIN LAW REVIEW
Israel
Vietnam
Sudan
Germany
Cuba
Afghanistan

Table 2. Foreign Countries Explicitly Mentioned in State Codes
Indeed, references which might seem surprising have explanations.
Sudan, for instance, appears often because of its war crimes during the
war in Darfur.84 In 2007, Illinois enacted a statute requiring state pension
funds to completely divest from any Sudanese companies or government
entities.85 Around that time, numerous other states took similar steps.86
3. Change over Time
Finally, we analyze how the frequency of foreign ingredients
statutes has evolved over time, according to our measurements. For the
2007 versions of state codes, our annotation process cumulatively
identified 3,249 distinct clauses across the fifty states, which we estimate
correspond to 2,479 distinct enactments. Thus, between 2007 and 2021
we estimate a growth of approximately 45% for clauses and 22% for
enactments. These figures provide preliminary empirical support for the
notion that states have expanded their foreign relations activity over the
past seventeen years.
CONCLUSION
State statutes are a potentially valuable source of empirical data for
legal scholars across a broad spectrum of areas. But actually conducting
empirical work on state statutes is difficult, due to challenges with data
accessibility and annotation. To address these difficulties, we lay out our
vision for the “State Statutes Project”—an effort to construct an annotated
database of state statutes in which statutes are coded for variables relevant
to legal scholars. There are two important aspects to our project. First,

84.
See, e.g., id. (defining “complicit” as “taking actions during any preceding
20-month period which have directly supported or promoted the genocidal campaign in
Darfur”).
85.
2007 Ill. Laws 7166–83; see also Press Release, Rod R. Blagojevich, supra
note 18.
86.
Press Release, Rod R. Blagojevich, supra note 18.

2024:1615

The State Statutes Project

we intend to use the latest cutting-edge tools in AI to assist in statute
analysis, which will allow us to code variables while minimizing costs.
Second, we hope to collaborate with the broader legal community to
identify the which variables or features of statutes should be coded. Our
ultimate hope is that the database we build can support greater research
into the states.

*

*

*
