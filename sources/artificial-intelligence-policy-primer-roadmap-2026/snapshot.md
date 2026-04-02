<!--
  AI Triad Research Project — Document Snapshot
  Title      : Artificial Intelligence Policy: A Primer and Roadmap
  Source     : 
  Type       : pdf
  Captured   : 2026-03-31
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Artificial Intelligence Policy: A Primer and Roadmap

> **Snapshot captured:** 2026-03-31
> **Source:** 
> **Type:** pdf

---
University of Washington School of Law

UW Law Digital Commons
Articles

Faculty Publications

Artificial Intelligence Policy: A Primer and Roadmap
Ryan Calo
University of Washington

Follow this and additional works at: https://digitalcommons.law.uw.edu/faculty-articles
Part of the Science and Technology Law Commons

Recommended Citation
Ryan Calo, Artificial Intelligence Policy: A Primer and Roadmap, 51 U.C.D. L. REV. 399 (2017),
https://digitalcommons.law.uw.edu/faculty-articles/640

This Article is brought to you for free and open access by the Faculty Publications at UW Law Digital Commons. It
has been accepted for inclusion in Articles by an authorized administrator of UW Law Digital Commons. For more
information, please contact lawref@uw.edu.

Artificial Intelligence Policy:
A Primer and Roadmap
Ryan Calo*
TABLE OF CONTENTS

1. BACKGROUND

A.
B.
C.

What Is AI?
Where Is AI Developed and Deployed? .....
Why AI "Policy"?

II. KEY QUESTIONS FOR Al POLICY ........................

..... 404

....... 404
..... 407

Justice and Equity
.............. 411
1. Inequality in Application............
............... 413
2. Consequential Decision-Making
..... 415
B. Use of Force
C. Safety and Certification
1. Setting and Validating Safety Thresholds................... 417
2. Certification
............ 419
3. Cybersecurity
....... 420
D. Privacy and Power.
........ 420
1. The Problem of Pattern Recognition .....
...... 424
2. The Data Parity Problem................
of
Labor
E. Taxation and Displacement
F. Cross-CuttingQuestions (Selected)
Expertise.................
and
1. Institutional Configuration
................... 429
2. Investment and Procurement

A.

Copyright @ 2017 Ryan Calo. Lane Powell and D. Wayne Gittinger Associate
Professor, University of Washington School of Law. The author would like to thank a
variety of individuals within industry, government, and academia who have shared
their thoughts, including Miles Brundage, Anupam Chander, Rebecca Crootof, Oren
Etzioni, Ryan Hagemann, Woodrow Hartzog, Alex Kozak, Amanda Levendowski,
Mark MacCarthy, Patrick Moore, Julia Powles, Helen Toner, and Eduard Fosch
Villaronga. Thanks also to Madeline Lamo for excellent research assistance and to the
editors of the UC Davis Law Review for excellent suggestions. The author is codirector of an interdisciplinary lab that receives funding to study emerging
technology, including from the Microsoft Corporation, the William and Flora Hewlett
Foundation, and the John D. and Catherine T. MacArthur Foundation.

University of California, Davis

[Vol. 51:399

3. Removing Hurdles to Accountability......................... 430
4. Mental Models of Al................
............ 430
Ill. ON THE Al APOCALYPSE
....... 431
CONCLUSION.
........ 435

2017]1

Artificial Intelligence Policy

The year is 2017 and talk of artificial intelligence is everywhere.
People marvel at the capacity of machines to translate any language
and master any game.' Others condemn the use of secret algorithms to
sentence criminal defendants 2 or recoil at the prospect of machines
gunning for blue, pink, and white-collar jobs.3 Some worry aloud that
artificial intelligence ("Al") will be humankind's "final invention." 4
The attention we pay to Al today is hardly new: looking back
twenty, forty, or even a hundred years, one encounters similar hopes
and concerns around Al systems and the robots they inhabit. Batya
Friedman and Helen Nissenbaum wrote Bias in Computer Systems, a
framework for evaluating and responding to machines that
discriminate unfairly, in 1996.5 The 1980 New York Times headline
"A Robot Is After Your Job" could as easily appear in September 2017.6
The field of artificial intelligence itself dates back at least to the
1950s, when John McCarthy and others coined the term one summer
at Dartmouth College, and the concepts underlying Al go back
generations earlier to the ideas of Charles Babbage, Ada Lovelace, and
Alan Turing. 7 Although there have been significant developments and
I See, e.g., Cade Metz, In a Huge Breakthrough, Google's AI Beats a Top Player at
the Game of Go, WIRED (Jan. 27, 2016), https://www.wired.com/2016/0l/in-a-huge(reporting how after
breakthrough-googles-ai-beats-a-top-player-at-the-game-of-go
decades of work, Google's Al finally beat the top human player in the game of Go, a
2,500-year-old game of strategy and intuition exponentially more complex than
chess).
2 See, e.g., CATHY O'NEIL, WEAPONS OF MATH DESTRUCTION: How BIG DATA INCREASES
INEQUALITY AND THREATENS DEMOCRACY 27 (2016) (comparing such algorithms to
weapons of mass destruction for contributing to and sustaining toxic recidivism cycles);
Julia Angwin et al., Machine Bias, PROPUBLICA (May 23, 2016), https://www.
propublica.org/article/machine-bias-risk-assessments-in-criminal-sentencing (discussing
errors algorithms make when generating risk-assessment scores).
3 See, e.g., MARTIN FORD, RISE OF THE ROBOTS: TECHNOLOGY AND THE THREAT OF A
JOBLESS FUTURE xvi (2015) (predicting that machines' role will evolve from that of the
worker's tool to the worker itself).

See generally JAMES BARRAT, OUR FINAL INVENTION: ARTIFICIAL INTELLIGENCE AND

THE END OF THE HUMAN ERA 5 (2013) ("Our species is going to mortally struggle with
this problem.").
5 Batya Friedman & Helen Nissenbaum, Bias in Computer Systems, 14 ACM
TRANSACTIONS ON INFO. SYS. 330 (1996).

6 Harley Shaiken, A Robot Is After Your Job: New Technology Isn't a Panacea, N.Y.
TIMES, Sept. 3, 1980, at A19. For an excellent timeline of coverage of robots displacing
labor, see Louis Anslow, Robots Have Been About to Take All the Jobsfor More than 200
Years, TIMELINE (May 16, 2016), https://timeline.com/robots-have-been-about-to-takeall-the-jobs-for-more-than-200-years-5c9cO8a2f41d.
7 See Selmer Bringsjord et al., Creativity, the Turing Test, and the (Better) Lovelace
Test, 11 MINDS & MACHINES 3, 5 (2001); PETER STONE ET AL., STANFORD UNIV.,
ARTIFICIAL INTELLIGENCE AND LIFE IN 2030: REPORT OF THE 2015 STUDY PANEL 50 (2016),

University of California,Davis

[Vol. 51:399

refinements, nearly every technique we use today - including the
biologically-inspired neural nets at the core of the practical Al
breakthroughs currently making headlines - was developed decades
ago by researchers in the United States, Canada, and elsewhere.8
If the terminology, constituent techniques, and hopes and fears
around artificial intelligence are not new, what exactly is? At least two
differences characterize the present climate. First, as is widely
remarked, a vast increase in computational power and access to
training data has led to practical breakthroughs in machine learning, a
singularly important branch of AI. 9 These breakthroughs underpin
recent successes across a variety of applied domains, from diagnosing
precancerous moles to driving a vehicle, and dramatize the potential of
Al for both good and ill.
Second, policymakers are finally paying close attention. In 1960,
when John F. Kennedy was elected, there were calls for him to hold a
conference around robots and labor. 10 He declined." Later there were
calls to form a Federal Automation Commission.' 2 None was formed.
A search revealed no hearings on artificial intelligence in the House or
Senate until, within months of one another in 2016, the House Energy
and Commerce Committee held a hearing on Advanced Robotics
(robots with AI) and the Senate Joint Economic Committee held the
"first ever hearing focused solely on artificial intelligence."1 3 That
same year, the Obama White House held several workshops on Al and
published three official reports detailing its findings.14 Formal
policymaking around Al abroad is, if anything, more advanced: the
https://ailOO.stanford.edu/sites/default/files/ai_100_report_.0831fnl.pdf.
8 See STONE ET AL., supra note 7, at 50-51; Will Knight, Facebook Heads to Canada
for the Next Big Al Breakthrough, MIT TECH. REv. (Sept. 15, 2017),
https://www.technologyreview.com/s/608858/facebook-heads-to-canada-for-the-nextbig-ai-breakthrough (discussing leading figures and breakthroughs with connections
to Canada).
9 See, e.g., STONE ET AL., supra note 7, at 14; see also NAT'L SC. & TECH. COUNCIL,
EXEC. OFFICE OF THE PRESIDENT, PREPARING FOR THE FUTURE OF ARTIFICIAL INTELLIGENCE

6 (2016).
10 See Anslow, supra note 6.
11 He did, however, give a speech on the necessity of "effective and vigorous
government leadership" to help solve the "problems of automation." Senator John F.
Kennedy, Remarks at the AFL-CIO Convention (June 7, 1960).
12 See Anslow, supra note 6.
13 Press Release, Sen. Ted Cruz, Sen. Cruz Chairs First Congressional Hearing on
Artificial Intelligence (Nov. 30, 2016), https://www.cruz.senate.gov/?p=pressrelease&id=2902; The Transformative Impact of Robots and Automation: Hearing Before
the]. Econ. Comm., 114th Cong. (2016).
14 E.g., NAT'L Sa. & TECH. COUNCIL, supra note 9, at 12.

Artificial Intelligence Policy

2017]1

governments of Japan and the European Union have proposed or
formed official commissions around robots and Al in recent years.15
This Essay, prepared in connection with the UC Davis Law Review's
Fiftieth Anniversary symposium, Future-ProofingLaw: From rDNA to
Robots, is my attempt at introducing the Al policy debate to recent
audiences, as well as offering a conceptual organization for existing
participants. The Essay is designed to help policymakers, investors,
scholars, and students understand the contemporary policy
environment around artificial intelligence and the key challenges it
presents. These include:
*
*
*
*
*

justice and equity;
use of force;
safety and certification;
privacy and power; and
taxation and displacement of labor.

In addition to these topics, the Essay will touch briefly on a selection
of broader systemic questions:
*
*
*
*

institutional configuration and expertise;
investment and procurement;
removing hurdles to accountability; and
correcting flawed mental models of Al.

In each instance, the Essay endeavors to give sufficient detail to
describe the challenge without prejudging the policy outcome. This
Essay is meant to be a roadmap, not the road itself. Its primary goal is
to point the new entrant toward a wider debate and equip them with
the context for further exploration and research.
I am a law professor with no formal training in Al. But my
longstanding engagement with Al has provided me with a front row
seat to many of the recent efforts to assess and channel the impact of
Al on society.1 6 I am familiar with the burgeoning literature and
See lina Lietzen, Robots: Legal Affairs Committee Calls for EU-Wide Rules,
PARLIAMENT NEws (Jan. 12, 2017, 12:27 PM), http://www.europarl.
europa.eu/news/en/news-roon2017O101PR57613/robots-legal-affairs-committee-callsfor-eu-wide-rules; Press Release, Japan Ministry of Econ., Trade & Indus., Robotics
Policy Office Is to Be Established in METI (July 1, 2015), http.//www.meti.go.jp/english/
press/2015/0701_Ol.html.
16 For example, I hosted the first White House workshop on artificial intelligence
policy, participated as an expert in the inaugural panel of the Stanford Al 100 study,
organized Al workshops for the National Science Foundation, the Department of

EUROPEAN

University of California,Davis

[Vol. 51:399

commentary on this topic and have reached out to individuals in the
field to get their sense of what is important. That said, I certainly
would not suggest that the inventory of policy questions I identify
here is somehow a matter of consensus. I do not speak for the Al
policy community as a whole. Rather, the views that follow are
idiosyncratic and reflect, in the end, one scholar's interpretation of a
complex landscape. 17
The remainder of the Essay proceeds as follows. Part I offers a short
background on artificial intelligence and defends the terminology of
policy over comparable terms such as ethics and governance. Part II
lays out the key policy concerns of Al as of this writing. Part III
addresses the oddly tenacious and prevalent fear that Al poses an
existential threat to humanity - a concern that, if true, would seem to
dwarf all other policy concerns. A final section concludes.
1.

BACKGROUND

A.

What Is AI?

There is no straightforward, consensus definition of artificial
intelligence. Al is best understood as a set of techniques aimed at
approximating some aspect of human or animal cognition using
machines. Early theorists conceived of symbolic systems - the
organization of abstract symbols using logical rules - as the most
fruitful path toward computers that can "think."18 But the approach of
building a reasoning machine upon which to scaffold all other
cognitive tasks, as originally envisioned by Turing and others, did not
deliver upon initial expectations. What seems possible in theory has
yet to yield many viable applications in practice. 19
Some blame an over-commitment to symbolic systems relative to
other available techniques (e.g., reinforcement learning) for the
dwindling of research funding in the late 1980s known as the "Al
Homeland Security, and the National Academy of Sciences, advised Al Now and
FAT*, and co-founded the We Robot conference.
17 Earlier Al pioneer Herbert Simon argues that it is the duty of people who study
a new technology to offer their interpretations regarding its likely effects on society.
HERBERT SIMON, THE SHAPE OF AUTOMATION FOR MEN AND MANAGEMENT vii (1965). But:
"Such interpretations should be, of course, the beginning and not the end of public
discussion." Id. I vehemently agree. For another interpretation, focusing on careers in
Al policy, see Miles Brundage, Guide to Working in Al Policy and Strategy, 80,000
HouRs (2017), https://80000hours.org/articles/ai-policy-guide.
18 See STONE ETAL., supra note 7, at 51.
19 See id.

2017]1

Artificial Intelligence Policy

Winter." 20 Regardless, as limitations to the capacity of "good old
fashioned Al" to deliver practical applications became apparent,
researchers pursued a variety of other approaches to approximating
cognition grounded in the analysis and manipulation of real world
data.21 An important consequence of the shift was that researchers
began to try to solve specific problems or master particular "domains,"
such as converting speech to text or playing chess, instead of pursuing
a holistic intelligence capable of performing every cognitive task
within one system. 22
All manner of Al techniques see study and use today. Much of the
contemporary excitement around Al, however, flows from the
enormous promise of a particular set of techniques known collectively
as machine learning.23 Machine learning ("ML") refers to the capacity
of a system to improve its performance at a task over time.2 4 Often this
task involves recognizing patterns in datasets, although ML outputs
can include everything from translating languages and diagnosing
precancerous moles to grasping objects or helping to drive a car. As
alluded to above, most every technique that underpins ML has been
around for decades. The recent explosion of efficacy comes from a
combination of much faster computers and much more data. 25
In other words, Al is an umbrella term, comprised by many different
techniques. Today's cutting-edge practitioners tend to emphasize
approaches such as deep learning within ML that leverage manylayered structures to extract features from enormous data sets in
service of practical tasks requiring pattern recognition, or use other
techniques to similar effect. 26 As we will see, these general features of

the shift toward practical applications, for
contemporary Al example, and the reliance on data - also inform our policy questions.

20 See id.; see also NAT'L SCI. & TECH. COUNCIL, supra note 9, at 25.
21 STONE ETAL., supra note 7, at 51.
22 See id. at 6-9. Originally the community drew a distinction between "weak" or
"narrow" Al, designed to solve a single problem like chess, and "strong" AI with
human-like capabilities across the boards. Today the term strong Al has given way to
terms like artificial general intelligence ("AGI"), which refer to systems that can
accomplish tasks in more than one domain without necessarily mastering all cognitive
tasks.
23 See NAT'L SCI. & TECH. COUNCIL, supra note 9, at 8.
24 Harry Surden, Machine Learning and Law, 89 WASH. L. REv. 87, 88 (2014).

See STONE ET AL., supra note 7, at 51.
See id. at 14-15; see also NAT'L SC. AND TECH. COUNCIL, supra note 9, at 9-10.

University of California, Davis

B.

[Vol. 51:399

Where Is AI Developed and Deployed?

Development of Al is most advanced within industry, academia, and
the military.27 Industry in particular is taking the lead on Al, with tech
companies hiring away top scientists from universities and leveraging
unparalleled
access to enormous computational power and
voluminous, timely data.28 This was not always the case: as with many
technologies, Al had its origins in academic research catalyzed by
considerable military funding. 29 But industry has long held a
significant role. The Al Winter gave way to the present Al Spring in
part thanks to the continued efforts of researchers who once worked at
Xerox Park and Bell Labs. Even today, much of the Al research
occurring at firms is happening in research departments structurally
insulated, to some degree, from the demands of the company's bottom
line. Still, it is worth noting that as few as seven for profit institutions
- Google, Facebook, IBM, Amazon, Microsoft, Apple, and Baidu in
China - seemingly hold Al capabilities that vastly outstrip all other
institutions as of this writing. 30
Al is deployed across a wide variety of devices and settings. How
wide depends on whom you ask. Some would characterize spam filters
that leverage ML or simple chat bots on social media - programmed
to, for instance, reply to posts about climate change by denying its
basis in science - as AI. 3 1 Others would limit the term to highly

27 There are other private organizations and public labs with considerable acumen
in artificial intelligence, including the Allen Institute for Al and the Stanford Research
Institute ("SRI").
28 See Jordan Pearson, Uber's Al Hub in Pittsburgh Gutted a University Lab - Now
It's in Toronto, VICE MOTHERBOARD (May 9, 2017, 8:42 AM), https://motherboard.vice.
com/enus/article/3dxkej/ubers-ai-hub-in-pittsburgh-gutted-a-university-lab-now-itsin-toronto (reporting concerns over whether Uber will become a "parasite draining
brainpower (and taxpayer-funded research) from public institutions").
29 See JOSEPH WEIZENBAUM, COMPUTER POWER AND HUMAN REASON: FROM JUDGMENT

TO CALCULATION 271-72 (1976) (discussing funding sources for Al research).
30 Cf. Vinod lyengar, Why AI Consolidation Will Create the Worst Monopoly in U.S.
History, TECHCRUNCH (Aug. 24, 2016), https://techcrunch.com/2016/08/24/why-aiconsolidation-will-create-the-worst-monopoly-in-us-history
(explaining how these
major technology companies have made a practice of acquiring most every promising
Al startup); Quora, What Companies Are Winning the Race for Artificial Intelligence?,
FORBES
(Feb. 24, 2017),
https://www.forbes.com/sites/quora/2017/02/24/whatcompanies-are-winning-the-race-for-artificial-intelligence/#2af852e6f5cd. There have
been efforts to democratize Al, including the heavily funded but non-profit OpenAl.
See OPENAI, https://openai.com/about (last visited Oct. 18, 2017).
31 See Clay Dillow, Tired of Repetitive Arguing About Climate Change, Scientist Makes a
Bot to Argue for Him, POPULAR Sc. (Nov. 3, 2010), httpi/www.popsci.com/science/
article/2010-11/twitter-chatbot-trolls-web-tweeting-science-climate-change-deniers.

2017]1

Artificial Intelligence Policy

complex instantiations such as the Defense Advanced Research Project
Agency's ("DARPA's") Cognitive Assistant that Learns and Organizes
("CALO") 32 or the guidance software of a fully driverless car. We
might also draw a distinction between disembodied Al, which
acquires, processes, and outputs information as data, and robotics or
other cyber-physical systems, which leverage Al to act physically upon
the world. Indeed, there is reason to believe the law will treat these
two categories differently.3 3
Regardless, many of the devices and services we access today
from iPhone autocorrect to Google Images - leverage trained pattern
recognition systems or complex algorithms that a generous definition
of Al might encompass.34 The discussion that follows does not assume
a minimal threshold of Al complexity but focuses instead on what is
different about contemporary Al from previous or constituent
technologies such as computers and the Internet.
C.

Why AI "Policy"?

That artificial intelligence lacks a stable, consensus definition or
instantiation complicates efforts to develop an appropriate policy
infrastructure. We might question the very utility of the word "policy"
in describing societal efforts to channel Al in the public interest. There
are other terms in circulation. A new initiative anchored by MIT's
Media Lab and Harvard University's Berkman Klein Center for Internet
and Society, for instance, refers to itself as the "Ethics and Governance
of Artificial Intelligence Fund."35 Perhaps these are better words. Or
perhaps it makes no difference, in the end, what labels we use as long
as the task is to explore and channel Al's social impacts and our work
is nuanced and rigorous.
This Essay uses the term policy deliberately for several reasons.
First, there are issues with the alternatives. The study and practice of
ethics is of vital importance, of course, and Al presents unique and
important ethical questions. Several efforts are underway, within
industry, academia, and other organizations, to sort out the ethics of

32 See
Cognitive Assistant that Learns and Organizes, SRI INT'L,
http://www.ai.sri.com/project/CALO (last visited Oct. 18, 2017). No relation.
33 See Ryan Calo, Robotics and the Lessons of Cyberlaw, 103 CALIF. L. REV. 513, 532
(2015) [hereinafter Calo, Robotics].
34 See Matthew Hutson, Our Bots, Ourselves, ATLANTIC, Mar. 2017, at 28, 28-29.
35 See Ethics and Governance of Artificial Intelligence, MASS. INST. OF TECH. SCH. OF
ARCHITECTURE & PLANNING, httpsI//www.media.mit.edulgroups/ethics-and-governance/
overview (last visited Oct. 15, 2017).

University of California, Davis

[Vol. 51:399

AI. 36 But these efforts likely cannot substitute for policymaking. Ethics
as a construct is notoriously malleable and contested: both Kant and
Bentham get to say "should."3 7 Policy - in the sense of official policy,
at least - has a degree of finality once promulgated.38 Moreover, even
assuming moral consensus, ethics lacks a hard enforcement
mechanism. A handful of companies dominate the emerging Al
industry. 39 They are going to prefer ethical standards over binding
rules for the obvious reason that no tangible penalties attach to
changing or disregarding ethics should the necessity arise.
Indeed, the unfolding development of a professional ethics of Al,
while at one level welcome and even necessary, merits ongoing
attention. 0 History is replete with examples of new industries forming
ethical codes of conduct, only to have those codes invalidated by the
federal government (the Department of Justice or Federal Trade
Commission) as a restraint on trade. The National Society of
Professional Engineers ("NSPE") alone has been the subject of
litigation across several decades. In the 1970s, the DOJ sued the NSPE
for establishing a "canon of ethics" that prohibited certain bidding
practices; in the 1990s, the FTC sued the NSPE for restricting
advertising practices.4" The ethical codes of structural engineers have
also been the subject of complaints, as have the codes of numerous
other industries. 42 Will Al engineers fare differently? This is not to say

36 See, e.g., IEEE, ETHICALLY ALIGNED DESIGN: A VISION FOR PRIORITIZING HUMAN
WELLBEING WITH ARTIFICIAL INTELLIGENCE AND AUTONOMOUS SYSTEMS 2 (Dec. 13, 2016),

http://standards.ieee.org/develop/indconn/ec/ead-v1.pdf. I participated in this effort as
a member of the Law Committee. Id. at 125.
37 See Jose de Sousa e Brito, Right, Duty, and Utility: From Bentham to Kant and
from Mill to Aristotle, XVII/2 REVISTA IBEROAMERICANA DE ESTUDIOS UTILITARISTAS 91,
91-92 (2010).
38 Law has, in H.L.A. Hart's terminology, a "rule of recognition." H.L.A. HART, THE
CONCEPT OF LAw 100 (Joseph Raz et al. eds., Oxford 3d ed. 2012).
39 See Hutson, supranote 34.
' See Romain Dillet, Apple Joins Amazon, Facebook, Google, IBM and Microsoft in Al
Initiative, TECHCRUNCH (Jan. 27, 2017), https://techcrunch.com/2017/01/27/apple-joinsamazon-facebook-google-ibm-and-microsoft-in-ai-initiative.
My own interactions with
the Partnership on Al, which has a diverse board of industry and civil society, suggests
that participants are genuinely interested in channeling Al toward the social good.
41 See Nat'l Soc'y of Profl Eng'rs v. United States, 435 U.S. 679 (1978); In re Nat'l
Soc'y of Profll Eng'rs, 116 F.T.C. 787 (1993), 1993 WL 13009653.
42 See In re Structural Eng'rs Ass'n of N. Cal., 112 F.T.C. 530 (1989), 1989 WL
1126789, at *1 (invalidating code of ethics); see, e.g., In re Conn. Chiropractic Ass'n,
114 F.T.C. 708, 712 (1991) (invalidating the ethical code of chiropractors); In re Am.
Med. Ass'n, 94 F.T.C. 701 (1979), 1979 WL 199033, at *6 (invalidating the ethical
guidelines of doctors), amended by In re Am. Med. Ass'n, 114 F.T.C. 575 (1991).

2017]

Artificial Intelligence Policy

companies or groups should avoid ethical principles, only that we
should pay attention to the composition and motivation of the authors
of such principles, as well as their likely effects on markets and on
society.
The term "governance" has its attractions. Like policy, governance is
a flexible term that can accommodate many modalities and structures.
Perhaps too flexible: it is not entirely clear what is being governed and
by whom. Regardless, governance carries its own intellectual baggage
- baggage that, like "ethics," is complicated by industry's dominance
of Al development and application. Setting aside the specific
associations with "corporate

governance,"4 3 much contemporary

governance literature embeds the claim that authority will or should
devolve to actors other than the state.44 While it is true that invoking
the term governance can help insulate technologies from overt
government interference - as in the case of Internet governance
through non-governmental bodies such as the Internet Corporation
for Assigned Names and Numbers ("ICANN") and the Internet
Engineering Task Force ("IETF")45 - the governance model also
resists official policy by tacitly devolving responsibility to industry
from the state. 46
Meanwhile, several aspects of policy recommend it. Policy admits of
the possibility of new laws, but does not require them. It may not be
wise or even feasible to pass general laws about artificial intelligence at
this early stage, whereas it is very likely wise and timely to plan for
Al's effects on society - including through the development of
expertise, the investigation of Al's current and likely social impacts,
and perhaps smaller changes to appropriate doctrines and laws in
response to Al's positive and negative affordances.4 7 Industry may seek

43 Brian R.

Cheffins, The History of Corporate Governance, in THE OXFORD

HANDBOOK OF CORPORATE GOVERNANCE 46 (Douglas Michael Wright et al. eds., 2013).

See R.A.W. Rhodes, The New Governance: Governing Without Government, 44

POL. STUD. 652, 657 (1996); see also WENDY BROWN, UNDOING THE DEMOS:
NEOLIBERALISM'S STEALTH REVOLUTION 122-23 (2015) (noting that "almost all scholars

and definitions converge on the idea that governance" involves "networked,
integrated, cooperative, partnered, disseminated, and at least partly self-organized"
control).
45 The United States government stood up both ICANN and IETF, but today they
run largely interdependent of state control as non-profits.
46 See supra note 44 and accompanying text.
7 See, e.g., Rebecca Wexler, Life, Liberty, and Trade Secrets: Intellectual Property in
the Criminaljustice System, 70 STAN. L. REV. (forthcoming 2018) (arguing inter alia for
a clarification that companies may not invoke trade secret law to avoid scrutiny of
their Al or algorithmic systems by criminal defendants).

University of California, Davis

[Vol. 51:399

to influence public policy, but it is not its role ultimately to set it.
Policy conveys the necessity of exploration and planning, the finality
of law, and the primacy of public interest without definitely endorsing
or rejecting regulatory intervention. For these reasons, I have
consciously chosen it as my frame.
II.

KEY QUESTIONS FOR Al POLICY

This Part turns to the main goal of the Essay: a roadmap to the
various challenges that Al poses for policymakers. It starts with
discrete challenges, in the sense of specific domains where attention is
warranted, and then discusses some general questions that tend to cut
across domains. For the most part, the Essay avoids getting into detail
about specific laws or doctrines that require reexamination and
instead emphasize questions of overall strategy and planning.
The primary purpose of this Part is to give newer entrants to the Al
policy world - whether from government, industry, media, academia,
or otherwise a general sense of what kinds of questions the
community is asking and why. A secondary purpose is to help bring
cohesion to this multifaceted and growing field. The inventory hopes
to provide a roadmap for individuals and institutions to the various
policy questions that arguably require their attention. The Essay tees
up questions; it does not purport to answer them.
A limitation of virtually any taxonomic approach is the need to
articulate criteria for inclusion - why are some questions on this list
and not others?4 8 Experts may vary on the stops they would include in
a roadmap of key policy issues, and I welcome critique. There are
several places where I draw distinctions or parallels that are not
represented elsewhere in the literature, with which others may
disagree. Ultimately this represents but one informed scholar's take on
a complex and dynamic area of study.

48 Cf. Ryan Calo, The Boundaries of Privacy Harm, 86 IND. L.J. 1132, 1139-42
(2011) (critiquing Daniel Solove's taxonomy of privacy). If I have an articulable
criterion for inclusion, it is sustained attention by academics and policymakers. Some
version of the questions in this Part appear in the social scientific literature, in the
White House reports on Al, in the Stanford Al 100 report, in the latest U.S. Robotics
Roadmap, in the Senate hearing on Al, in the research wish list of the Partnership on
Al, and in the various important public and private workshops such as Al Now,
FAT/ML, and We Robot.

2017]

Artificial Intelligence Policy
A.

Justice and Equity

Perhaps the most visible and developed area of Al policy to date
involves the capacity of algorithms or trained systems to reflect human
values such as fairness, accountability, and transparency ("FAT").4 9
This topic is the subject of considerable study, including an
established but accelerating literature on technological due process
and at least one annual conference on the design of FAT systems.50
The topic is also potentially quite broad, encompassing both the
prospect of bias in Al-enabled features or products as well as the use
of Al in making material decisions regarding financial, health, and
even liberty outcomes. In service of teasing out specific policy issues,
the Essay separates "applied inequality" from "consequential decisionmaking" while acknowledging the considerable overlap.
1.

Inequality in Application

By inequality in application, I mean to refer to a particular set of
problems involving the design and deployment of Al that works well
for everyone. The examples here include everything from a camera
that cautions against taking a Taiwanese-American blogger's picture
because the software believes she is blinking,5 1 to an image recognition
system that characterizes an African American couple as gorillas,52 to a
translation engine that associates the role of engineer with being male
and the role of nurse with being female.53 These scenarios can be
policy relevant in their own right, as when African Americans fail to
see opportunities on Facebook due to the platform's (now
discontinued) discriminatory allowances, 54 or when Asian Americans
49 See, e.g., KATE CRAWFORD ET AL., THE Al Now REPORT: THE SOCIAL AND EcoNOMIC
IMPLICATIONS OF ARTIFICIAL INTELLIGENCE TECHNOLOGIES IN THE NEAR TERM 6-8 (July 7,

2016), https://artificialintelligencenow.com/media/documents/AlNowSummaryReport
3_RpmwKHu.pdf; Thematic Pillars, PARTNERSHIP ON Al, https://www.partnershiponai.
org/thematic-pillars (last visited Oct. 14, 2017).
50 Fairness, Accountability, and Transparency in Machine Learning, FAT/ML,
http://www.fatml.org (last visited Oct. 14, 2017). See also infra, note 63 (discussing
the term "technological due process").
51 See Adam Rose, Are Face-Detection Cameras Racist?, TIME (Jan. 22, 2010),
http://content.time.com/time/business/article/0,8599,1954643,00.html.
52 See Jessica Guynn, Google Photos Labeled Black People "Gorillas," USA TODAY
(July 1, 2015, 2:10 PM), https://www.usatoday.com/story/tech/2015/07/01/googleapologizes-after-photos-identify-black-people-as-gorillas/29567465.
53 Aylin Caliskan et al., Semantics Derived Automatically from Language Corpora
Contain Human-Like Biases, 356 SCIENCE 183, 183-84 (2017).
54 See Julia Angwin & Terry Parris, Jr., Facebook Lets Advertisers Exclude Users by
Race, PROPUBLICA (Oct. 28, 2016, 1:00 PM), https://www.propublica.org/article/

University of California,Davis

[Vol. 51:399

pay more for test preparation due to a price discriminatory
algorithm.55 They can also hold downstream policy ramifications, as
when a person of Taiwanese descent has trouble renewing a
passport, 56 or a young woman in Turkey researching international
opportunities in higher education finds only references to nursing.5 7
There are a variety of reasons why Al systems might not work well
for certain populations. For example, the designs may be using models
trained on data where a particular demographic is underrepresented
and hence not well reflected. More white faces in the training set of an
image recognition Al means the system performs best for
Caucasians.5 8 There are also systems that are selectively applied to the
marginalized populations. To illustrate, police use "heat maps" that
purport to predict areas of future criminal activity to determine where
to patrol but in fact lead to disproportionate harassment of African
Americans. 59 Yet police do not routinely turn such techniques inward
to predict which officers are likely to engage in excessive force. 60 Nor
do investment firms initiate transactions on the basis of machine
learning that they cannot explain to wealthy, sophisticated investors. 61
The policy questions here are at least twofold. First, what
constitutes best practice in minimizing discriminatory bias and by
facebook-lets-advertisers-exclude-users-by-race.
55 Julia Angwin & Jeff Larson, The Tiger Mom Tax: Asians Are Nearly Twice as
Likely to Get a Higher Pricefrom Princeton Review, PROPUBLICA (Sept. 1, 2015, 10:00
AM),
https://www.propublica.org/article/asians-nearly-twice-as-likely-to-get-higherprice-from-princeton-review.
56 See Selina Cheng, An Algorithm Rejected an Asian Man's Passport Photo for
Having "Closed Eyes," QUARTZ (Dec. 7, 2016), https://qz.com/857122/an-algorithmrejected-an-asian-mans-passport-photo-for-having-closed-eyes.
57 See Adam Hadhazy, Biased Bots: Artificial-Intelligence Systems Echo Human
Prejudices, PRINCETON UNIV. (Apr. 18, 2017), https://www.princeton.edulnews/2017/
04/18/biased-bots-artificial-intelligence-systems-echo-human-prejudices
("Turkish uses
a gender-neutral, third person pronoun, 'o.' Plugged into the online translation service
Google Translate, however, the Turkish sentences 'o bir doktor' and 'o bir hempire' are
translated into English as 'he is a doctor' and 'she is a nurse."'). See generally Caliskan et
al., supra note 53 (discussing gender bias within certain computer systems occupations).
58 See Rose, supra note 51 (discussing performance and race in the context of
camera software).
59 See Jessica Saunders et al., Predictions Put into Practice: A Quasi Experimental

Evaluation of Chicago's PredictivePolicing Pilot, 12 J. EXPERIMENTAL CRIMINOLOGY 347,
350-51 (2016).
60 See Kate Crawford & Ryan Calo, There Is a Blind Spot in AI Research, 538
NATURE 311, 311-12 (2016).
61 See id.; see also Will Knight, The FinancialWorld Wants to Open AI's
Black Boxes,
MIT TECH. REv. (Apr. 13, 2017), https://www.technologyreview.com/s/604122/thefinancial-world-wants-to-open-ais-black-boxes.

2017]1

Artificial Intelligence Policy

what mechanism (antidiscrimination laws, consumer protection,
industry standards) does society incentivize development and
adoption of best practice? 62 And second, how do we ensure that the
risks and benefits of artificial intelligence are evenly distributed across
society? Each set of questions is already occupying considerable
resources and attention, including within the industries that build AI
into their products, and yet few would dispute we have a long way to
go before resolving them.
2.

Consequential Decision-Making

Closely related, but distinct in my view, is the question of how to
design systems that make or help make consequential decisions about
people. The question is distinct from unequal application in general in
that consequential decision-making, especially by government, often
takes place against a backdrop of procedural rules or other guarantees
of process. 63 For example, in the United States, the Constitution
guarantees due process and equal protection by the government,64 and
European Union citizens have the right to request that consequential
decisions by private firms involve a human (current) as well as a right
of explanation for adverse decisions by a machine (pending). 65 Despite
these representations, participants in the criminal justice system are
already using algorithms to determine whom to police, whom to
parole, and how long a defendant should stay in prison. 66
There are three distinct facets to a thorough exploration of the role
of Al in consequential decision-making. The first involves cataloguing
62 See, e.g., Solon Barocas & Andrew D. Selbst, Big Data's Disparate Impact, 104
CALIF. L. REV. 671, 730-32 (2016) (discussing the strengths and weaknesses of
employing antidiscrimination laws in the context of data mining).
63 See generally Danielle Keats Citron, Technological Due Process, 85 WASH. U. L.
REV. 1249 (2008) (arguing that Al decision-making jeopardizes constitutional
procedural due process guarantees and advocating instead for a new "technological
due process").
64 See Kate Crawford & Jason Schultz, Big Data and Due Process: Toward a
Framework to Redress PredictivePrivacy Harms, 55 B.C. L. REV. 93, 110 (2014); see also
Barocas & Selbst, supra note 62.
65 See Bryce Goodman & Seth Flaxman, European Union Regulations on Algorithmic
Decision-Making and a "Right to Explanation," ARXIV (Aug. 31, 2016),
https://arxiv.org/pdf/1606.08813.pdf.
66 See Saunders et al., supra note 59 (discussing heat zones in predictive policing);
Angwin et al., supra note 2 (discussing the use of algorithmically-generated risk scores
in criminal sentencing); Joseph Walker, State Parole Boards Use Software to Decide
Which Inmates to Release, WALL ST. J. (Oct. 11, 2013), https://www.wsj.con/articles/
state-parole-boards-use-software-to-decide-which-inmates-to-release-1381542427.

University of California, Davis

[Vol. 51:399

the objectives and values that procedure and process are trying to
advance in a particular context. Without a thorough understanding of
what it is that laws, norms, and other safeguards are trying to achieve,
we cannot assess whether existing systems are adequate let alone
design new systems that are. 67 This task is further complicated by the
tradeoffs and tensions inherent in such safeguards, as when the
Federal Rules of Civil Procedure call simultaneously for a "just,
speedy, and inexpensive" proceeding 68 or where the Sixth Amendment
lays out labor-intensive conditions for a fair criminal trial that also has
to occur quickly. 69
The second facet involves determining which of these objectives and
values can and should be imported into the context of machines. Deep
learning, as a technique, may be effective in establishing correlation
but unable to yield or articulate a causal mechanism. 70 Al here can say
what will happen but not why. If so, the outputs of multi-layer neural
nets may be inappropriate affiants for warrants, bad witnesses in court,
or poor bases for judicial determinations of fact.71 Notions such as
prosecutorial discretion, the rule of lenity,72 and executive pardon may
not admit of mechanization at all. Certain decisions, such as the
decision to take an individual off of life support, raise fundamental
concerns over human dignity and thus perhaps cannot be made even
by objectively well-designed machines.7 3
67 See generally Citron, supra note 63 (discussing the goals of technological due
process); Crawford & Schultz, supra note 64 (discussing due process and Big Data);
Joshua A. Kroll et al., Accountable Algorithms, 165 U. PA. L. REV. 633 (2017) (arguing
that current decision-making processes have not kept up with technology).
68 FED. R. Civ. P. 1. I owe this point to my colleague Elizabeth Porter.
69 U.S. CONST. amend. VI (requiring that a defendant be allowed to be presented
with nature and cause of the accusations, to be confronted with the witnesses against
him, to compel favorable witnesses, and to have the assistance of counsel, all as part of
a speedy and public trial).
70 See Jason Millar & Ian Kerr, Delegation, Relinquishment, and Responsibility: The
Prospect of Expert Robots, in ROBOT LAW 102, 126 (Ryan Calo et al. eds., 2015).
71 See id.; Michael L. Rich, Machine Learning, Automated Suspicion Algorithms, and
the Fourth Amendment, 164 U. PA. L. REV. 871, 877-79 (2016) (discussing emerging
technologies' interactions with current Fourth Amendment jurisprudence). See
generally Andrea Roth, Machine Testimony, 126 YALE L.J. 1972 (2017) (discussing
machines as witnesses).
72 The rule of lenity requires courts to construe criminal statutes narrowly, even
where legislative intent appears to militate toward a broader reading. E.g., McBoyle v.
United States, 283 U.S. 25, 26-27 (1931) (declining to extend a stolen vehicle statute
to stolen airplanes). For an example of a discussion of the limits of translating laws
into machine code, see Harry Surden & Mary-Anne Williams, Technological Opacity,
Predictability, and Self-Driving Cars, 38 CARDOzo L. REV. 121, 162-63 (2016).
73 See James H. Moor, Are There Decisions Computers Should Never Make?, in 1

2017]

Artificial Intelligence Policy

A third facet involves the design and vetting of consequential
decision-making systems in practice. There is widespread consensus
that such systems should be fair, accountable, and transparent.74
However, other values -

such as efficiency -

are less well developed.

The overall efficiency of an Al-enabled justice system, as distinct from
its fairness or accuracy in the individual case, constitutes an important
omission. As the saying goes, "justice delayed is justice denied": we
should not aim as a society to hold a perfectly fair, accountable, and
transparent process for only a handful of people a year.
Interestingly, the value tensions inherent in processual guarantees
seem to find analogs, if imperfect ones, in the machine learning
literature around performance tradeoffs. 7 5 Several researchers have
measured how making a system more transparent or less biased can
decrease its accuracy overall.7 6 More obviously than efficiency,
accuracy is an important dimension of fairness: we would not think of
rolling a die to determine sentence length as fair, even if it is
transparent to participants and unbiased as to demographics. The
policy challenge involves how to manage these tradeoffs, either by
designing techno-social systems that somehow maximize for all
values, or by embracing a particular tradeoff in a way society is
prepared to recognize as valid. The end game of designing systems that
reflect justice and equity will involve very considerable,
interdisciplinary efforts and is likely to prove a defining policy issue of
our time.
B.

Use of Force

A special case of Al-enabled decision-making involves the decision
to use force. As alluded to above, there are decisions - particularly
involving the deliberate taking of life - that policymakers may decide
never to commit exclusively to machines. Such is the gist of many
debates regarding the development and deployment of autonomous
weapons.77 International consensus holds that people should never
NATURE & SYSTEM 217, 226 (1979). This concern is also reflected infra in Part IL.B
concerning the use of force.
74 See supra notes 49-50 and accompanying text.
7 See Jon Kleinberg et al., Inherent Trade-Offs in the Fair Determination of Risk
Scores, 2017 PROC. INNOVATIONS THEORETICAL COMPUTER Sci. 2, https://arxiv.org/abs/
1609.05807.

See id. at 1.

Note that force is deployed in more contexts than military conflict. We might
also ask after the propriety of the domestic use of force by border patrols, police, or
even private security guards. For a discussion of these issues, see Elizabeth E. Joh,

University of California, Davis

[Vol. 51:399

give up "meaningful human control" over a kill decision. 78 Yet debate
lingers as to the meaning and scope of meaningful human control. Is
monitoring enough? Target selection? And does the prescription
extend to defensive systems as well, or only to offensive tactics and
weapons? None of these important questions appear settled.70
There is also the question of who bears responsibility for the choices
of machines. The automation of weapons may seem desirable in some
circumstances or even inevitable.8 0 It seems unlikely, for example, that
the United States military would permit its military rivals to have
faster or more flexible response capabilities than its own whatever
their control mechanism.81 Regardless, establishing a consensus
around meaningful human control would not obviate all inquiry into
responsibility in the event of mistake or war crime. Some uses of Al
presuppose human decision but nevertheless implicate deep questions
of policy and ethics - as when the intelligence community leverages
algorithms to select targets for remotely operated drone strikes. 82 And
there are concerns that soldiers will be placed into the loop for the
sole purpose of absorbing liability for wrongdoing, as anthropologist
Madeline Clare Elish argues.83 Thus, policymakers must work toward

PolicingPolice Robots, 64 UCLA L. REv. DISCOURSE 516, 530-42 (2016).
78 See HEATHER M.
ARTIFICIAL

RoFF &

INTELLIGENCE

AND

RICHARD MOYES, MEANINGFUL
AUTONOMOUS
WEAPONS

HUMAN CONTROL,
(Apr.
2016),

&

http://www.article36.org/wp-content/uploads/2016/04/MHC-Al-and-AWS-FINAL.pdf.
79 See, e.g., Rebecca Crootof, A Meaningful Floorfor "Meaningful Human Control,"
30 TEMP. INT'L & COMP. L.J. 53, 54 (2016) ("[Tlhere is no consensus as to what
meaningful human control' actually requires.").
80 Kenneth Anderson and Matthew Waxman in particular have made important
contributions to the realpolitik of Al weapons. See, e.g., Kenneth Anderson
Matthew Waxman, Law and Ethics for Autonomous Weapon Systems: Why a Ban Won't
Work and How the Laws of War Can, HOOVER INST. (Apr. 9, 2013),
http://www.hoover.org/research/aw-and-ethics-autonomous-weapon-systems-whyban-wont-work-and-how-laws-war-can (arguing that automated weapons are both
desirable and inevitable).

See id.

See generally John Naughton, Death by Drone Strike, Dished Out by Algorithm,
(Feb. 21, 2016, 3:59 AM), https://www.theguardian.com/commentisfree/
2016/feb/21/death-from-above-nia-csa-skynet-algorithm-drones-pakistan
("General
Michael Hayden, a former director of both the CIA and the NSA, said this: 'We kill
people based on metadata."').
83 M.C. Elish, Moral Crumple Zones: Cautionary Tales in Human-Robot Interaction 1
(Mar. 20, 2016) (COLUMBIA UNIV. & DATA & Soc'Y INST., We Robot 2016 Working
Paper),
https://papers.ssm.com/sol3/papers.cfm?abstract id=2757236;
see
also
Madeleine Clare Elish & Tim Hwang, When Your Self-Driving Car Crashes, You Could
Still Be the One Who Gets Sued, QUARTZ (July 25, 2015), https://qz.com/461905/whenyour-self-driving-car-crashes-you-could-still-be-the-one-who-gets-sued (applying this

GUARDIAN

Artificial Intelligence Policy

20171

a framework for responsibility around Al and force that is fair and
satisfactory to all stakeholders.
C.

Safety and Certification

As the preceding section demonstrates, Al systems do more than
process information and assist officials to make decisions of
consequence. Many systems - such as the software that controls an
airplane on autopilot or a fully driverless car - exert direct and
physical control over objects in the human environment. Others
provide sensitive services that, when performed by people, require
training and certification. These applications raise additional questions
concerning the standards to which Al systems are held and the
procedures and techniques available to ensure those standards are

being met.

1.

Setting and Validating Safety Thresholds

Robots and other cyber-physical systems have to be safe. The
question is how safe, and how do we know. In a wide variety of
contexts, from commercial aviation to food safety, regulatory agencies
set specific safety standards and lay out requirements for how those
standards must be met. Such requirements do not exist for many
robots.
Members of Congress and others have argued that we should
embrace, for instance, driverless cars, to the extent that robots are or
become safer drivers than humans.8 5 But "safer than humans" seems
like an inadequate standard by which to vet any given autonomous
system. Must the system be safer than humans unaided or humans
assisted by cutting-edge safety features? Must the system be safer than
humans overall or across all driving conditions? And just how much
safer must driverless cars be than people before we tolerate or
incentivize them? These are ultimately difficult questions not of
technology but of policy.
same reasoning to drivers of automatic cars).
84 See HENRIK 1. CHRISTENSEN ET AL., FROM INTERNET TO ROBOTICS: A ROADMAP FOR

US ROBOTICS 105-09 (Nov. 7, 2016), http://jacobsschool.ucsd.edu/contextualrobotics/
docs/rm3-final-rs.pdf; STONE ET AL., supra note 7, at 42.
85 See, e.g., Self-Driving Vehicle Legislation: HearingBefore the Subcomm. on Digital
Commerce & Consumer Prot. of the H. Comm. on Energy & Commerce, 115th Cong.
(2017) (providing the opening statement of Rep. Greg Walden, Chairman, Subcomm.
on Digital Commerce and Consumer Protection).

See generally GUIDO CALABRESI, THE COSTS OF ACCIDENTS: A LEGAL AND ECONOMIC

University of California,Davis

[Vol. 51:399

'

Even assuming policymakers set satisfactory safety thresholds for
driverless cars, drone delivery, and other instantiations of Al, we need
to determine a proper and acceptable means of verifying that these
standards are met. This process has an institutional or "who"
component, as in, who does the testing (e.g., government testing,
third-party independent certification, and self-certification by
industry). It also has a technical or "how" component, as in, what are
the testing methods (e.g., unit testing, fault-injection, virtualization,
and supervision). 8 7 Local and international standards can be a starting
point, but considerable work remains - especially as new potential
applications and settings arise. For example, we might resolve safety
thresholds for drone delivery or warehouse retrieval only to revisit the
question anew for sidewalk delivery and fast food preparation.
There are further complications still. Some systems, such as high
speed trading algorithms that can destabilize the stock market or
cognitive radio systems that can interfere with emergency
communications, may hold the potential, alone or in combination, to
cause serious indirect harm.88 Others may engage in harmful acts such
as disinformation that simultaneously implicate free speech
concerns. 89 Policymakers must determine what kinds of non-physical
or indirect harms rise to the level that regulatory standards are
required. Courts have a role in setting safety policy in the United
States though the imposition of liability. It turns out that Al
especially Al that displays emergent properties - may pose challenges
for civil liability. 90 Courts or regulators must address this
misalignment. And markets also have a role, for instance, through the
availability and conditions of insurance. 9

ANALYSIS

(1970) (discussing different policies of adjudicating accident law).

Cf. Bryant Walker Smith, How Governments Can Promote Automated Driving, 47
N.M. L. REV. 99, 101 (2017) (discussing different avenues through which government
can promote automated driving and prepare community conditions to facilitate
seamless integration of driverless cars once they become road-worthy).

88 See RYAN CALO, BROOKINGS CTR. FOR TECH. INNOVATION, THE CASE FOR A FEDERAL
ROBOTICS COMMISSION 9-10 (2014), https://www.brookings.edu/research/the-case-fora-federal-robotics-commission/ [hereinafter CALO, COMMISSION].
89 E.g., BENCE KOLLANYI ET AL., BOTS AND AUTOMATION OVER TWITTER DURING THE
U.S.
SECOND
PRESIDENTIAL
DEBATE
(2016),
http://comprop.oii.ox.ac.uk/wpcontent/uploads/sites/89/2016/10/Data-Memo-Second-Presidential-Debate.pdf.
90 See Calo, Robotics, supra note 33, at 538-45.
91 For an overview, see Andrea Bertolini et al., On Robots and Insurance, 8 INT'LJ.
Soc. ROBOTICS 381, 381 (2016) (discussing the need for adaptations in the insurance
industry to respond to robotics).

Artificial Intelligence Policy

20171
2.

Certification

A closely related policy question arises where Al performs a task
that, when done by a human, requires evidence of specialized skill or
training. 92 In some contexts, society has seemed comfortable thus far
dispensing with the formal requirement of certification when
technology can be shown to be capable through supervised use. This is
true of the autopilot modes of airplanes, which do not have to attend
flight school. The question is open with respect to vehicles. 93 But what
of technology under development today, such as autonomous surgical
robots, the very value of which turns on bringing skills into an
environment where no one has them? And how do we think about
systems that purport to dispense legal, health, or financial advice,
which requires adherence to complex fiduciary and other duties
pegged to human judgment? Surgeons and lawyers must complete
medical or law school and pass boards or bars. This approach may or
may not serve an environment rich in Al, a dynamic that is already
unfolding as the Food and Drug Administration works to classify
downloadable mobile apps as medical devices 94 and other apps to
dispute parking tickets. 95
3.

Cybersecurity

Finally, it is becoming increasingly clear that Al complicates an
already intractable cybersecurity landscape. 96 First, as alluded to
above, Al increasingly acts directly and even physically on the world.
When a malicious party gains access to a cyber-physical system,

92 CHRISTENSEN ET AL., supra note 84, at 105.

93 See Mark Harris, Will You Need a New License to Operate a Self-Driving Car?,
IEEE SPECTRUM (Mar. 2, 2015, 3:00 PM), https://spectrum.ieee.org/cars-that-think/
transportation/human-factors/will-you-need-a-new-license-to-operate-a-selfdriving-car
(discussing the current unsettled state of licensing schemes for "passengers" of
driverless cars).
94 See Megan Molteni, Wellness Apps Evade the FDA, Only to Land in Court, WIRED
(Apr. 3, 2017, 7:00 AM), https://www.wired.com/2017/04/wellness-apps-evade-fdaland-court.
95 See Arezou Rezvani, 'Robot Lawyer' Makes the Case Against ParkingTickets, NPR
(Jan. 16, 2017, 3:24 PM), http://www.npr.org/2017/01/16/510096767/robot-lawyermakes-the-case-against-parking-tickets.
96 See generally GREG ALLEN & TANIEL CHAN, BELFER CTR. FOR SCI. & INT'L AFFAIRS,
ARTIFICIAL INTELLIGENCE AND NATIONAL SECURITY (2017) (discussing ways of advancing

policy on Al and national security).
97 See supra Part II.B.

University of California, Davis

[Vol. 51:399

suddenly bones instead of bits are on the line. 98 Second, ML and other
Al techniques have the potential to alter both the offensive and
defensive capabilities around cybersecurity, as dramatized by a recent
competition held by DARPA where Al agents attacked and defended a
network autonomously.99 Al itself creates a new attack surface in the
sense that ML and other techniques can be coopted purposefully to
trick the system - an area known as adversarial machine learning.
New threat models, standards, and techniques must be developed to
address the new challenges of securing information and physical
infrastructures.
D.

Privacy and Power

Over the past decade, the discourse around privacy has shifted
perceptibly.oo What started out as a conversation about individual
control over personal information has evolved into a conversation
around the power of information more generally (i.e., the control
institutions have over consumers and citizens by virtue of possessing
so much information about them).101 The acceleration of artificial
intelligence, which is intimately tied to the availability of data, will
play a significant role in this evolving conversation in at least two
ways: (1) the problem of pattern recognition and (2) the problem of
data parity. Note that unlike some of the policy questions discussed
above, which envision the consequential deployment of imperfect Al,
the privacy questions that follow assume Al that is performing its
assigned tasks only too well.
1.

The Problem of Pattern Recognition

The capacity of Al to recognize patterns people cannot themselves
detect threatens to eviscerate the already unstable boundary between

98 See M. Ryan Calo, Open Robotics, 70 MD. L. REV. 571, 593-601 (2011)
(discussing how robots have the ability to cause physical damage and injury).
99 See Cyber Grand Challenge, DEF CON 24, https://www.defcon.org/html/defcon24/dc-24-cgc.html (last visited Sept. 18, 2017); see also "Mayhem" Declared
Preliminary Winner of Historic Cyber Grand Challenge, DEF. ADVANCED RES. PROJECTS

AGENCY (Aug. 4, 2016), https://www.darpa.mil/news-events/2016-08-04.
100 The flagship privacy law workshop - Privacy Law Scholars Conference

recently celebrated its tenth anniversary, although of course privacy discourse goes
back much further.

See, e.g., Neil M. Richards, The Dangers of Surveillance, 126 HARV. L. REv. 1934,

1952-58 (2013) (providing examples of how institutions have used surveillance to
blackmail, persuade, and sort people into categories).

2017]1

Artificial Intelligence Policy

what is public and what is private. 102 Artificial intelligence is
increasingly able to derive the intimate from the available. This means
that freely shared information of seeming innocence - where you ate
lunch, for example, or what you bought at the grocery store - can
lead to insights of a deeply sensitive nature. With enough data about
you and the population at large, firms, governments, and other
institutions with access to Al will one day make guesses about you
that you cannot imagine - what you like, whom you love, what you
have done. 0 3
Several serious policy challenges follow. The first set of challenges
involves the acceleration of an existing trend around information
extraction. Consumers will have next to no ability to appreciate the
consequences of sharing information. This is a well-understood
problem in privacy scholarship.104 The community has addressed these
challenges to privacy management under several labels, from databases
to big data. 0 5 In that the entire purpose of Al is to spot patterns people
cannot, however, the issue is rapidly coming to a head. Perhaps the
mainstreaming of Al technology will increase the pressure on
policymakers to step in and protect consumers. Perhaps not.
Researchers are, at any rate, already exploring various alternatives to
the status quo: fighting fire with fire by putting Al in the hands of
consumers, for example, or abandoning notice and choice altogether
in favor of rules and standards. 0 6 Whatever path we take should bear

102 Cf. Margot E. Kaminski et al., Security and Privacy in the Digital Age: Averting
Robot Eyes, 76 MD. L. REV. 983 (2017) (explaining the sensory capabilities of robots
with limited artificial intelligence).
103 See e.g., Kashmir Hill, How Target FiguredOut A Teen Girl Was Pregnant Before
Her Father Did, FORBES (Feb. 16, 2012), https://www.forbes.com/sites/kashmirhill/
2012/02/16/how-target-figured-out-a-teen-girl-was-pregnant-before-her-father-did/
#546582fa6668. Tal Z. Zarsky has been a particularly close student of this
phenomenon. See generally Tal Zarsky, Transparent Predictions, 2013 U. ILL. L. REV.
1503 (describing the types of trends and behaviors governments strive to predict with
collected data).
104 See Daniel J. Solove, Privacy Self-Management and the Consent Dilemma, 126
HARV. L. REv. 1880, 1889-93 (2013).
105 See Daniel J. Solove, Privacy and Power: Computer Databases and Metaphors for
Information Privacy, 53 STAN. L. REV. 1393, 1424-28 (2000); Tal Z. Zarsky,
Incompatible: The GDPR in the Age of Big Data, 47 SETON HALL L. REV. 995, 1003-09
(2017).
106 For example, Decide.com was an artificially intelligent tool to help consumers
decide when to purchase products and services. Decide.com was eventually acquired
by eBay. John Cook, eBay Acquires Decide.com, Shopping Research Site Will Shut Down
Sept. 30, GEEKWIRE (Sept. 6, 2013, 9:09 AM), https://www.geekwire.com/2013/ebayacquires-decidecom-shopping-research-site-shut-sept-30.

University of California,Davis

[Vol. 51:399

in mind the many ways powerful firms can subvert and end run
consumer interventions and the unlikelihood that consumers will
keep up in a technological arms race.
Consumer privacy is under siege. Citizens, meanwhile, will have
next to no ability to resist or reform surveillance.107 Two doctrines in
particular interact poorly with the new affordances of artificial
intelligence, both related to the reasonable expectation of privacy
standard embedded in American constitutional law. First, the
interpretation of the Fourth Amendment by the courts that citizens
enjoy no reasonable expectation of privacy in public or from a public
vantage does not seem long for this world. 08 If everyone in public can
be identified through facial recognition, and if the "public" habits of
individuals or groups permit Al to derive private facts, then citizens
will have little choice but to convey information to a government bent
on public surveillance. Second, and related, the interpretation by the
courts that individuals have no reasonable expectation of privacy in
(non-content) information they convey to a third party, such as the
telephone company, will continue to come under strain. 109
Here is an area where grappling with legal doctrine seems inevitable.
Courts are policymakers of a kind and the judiciary is already
responding to these new realities by requiring warrants or probable
cause in contexts involving public movements or third party
information. For example, in United States v. Jones, the Supreme Court
required a warrant for officers to affix a GPS to a defendant's vehicle
for the purpose of continuous monitoring. Five Justices in Jones
articulated a concern over law enforcement's ability to derive intimate
information from public travel over time. 110 There is a case before the
Court as of this writing concerning the ability of police to demand
historic location data about citizens from their mobile phone
provider."'

107 See generally Ryan Calo, Can Americans Resist Surveillance?, 83 U. CHI. L. REV.
23 (2016) (analyzing the different methods American citizens can take to reform
government surveillance and the associated challenges).
10 See Joel Reidenberg, Privacy in Public, 69 U. MIAMI L. REv. 141, 143-47 (2014).
109 Courts and statutes tend to recognize that the content of a message such as an
email deserves greater protection than the non-content that accompanies the message,
that is, where it is going, whether it is encrypted, whether it contains attachments, and
so on. Cf. Riley v. California, 134 S. Ct. 2473 (2014) (invalidating the warrantless
search and seizure of a mobile phone incident to arrest).
110 See United States v. Jones, 565 U.S. 400, 415-17, 428-31 (2012).
1ii Carpenter v. United States, 819 F.3d 880, 886 (6th Cir. 2016), cert. granted, 137
S. Ct. 2211 (2017) (No. 16-402).

2017]1

Artificial Intelligence Policy

On the other hand, in the dog-sniffing case Florida v. Jardines, the
Court also reaffirmed the principle that individuals have no reasonable
expectation of privacy in contraband such as illegal drugs.11 2 Thus, in
theory, even if the courts resolve to recognize a reasonable expectation
of privacy in public and in information conveyed to a third party,
courts might still permit the government to leverage Al to search
exclusively for illegal activity. Indeed, some argue that Al is not a
search at all given that no human need to access the data unless or
until the Al identifies something unlawful.113 Even assuming away the
likely false positives, a reasonable question for law and policy is
whether we want to live in a society with perfect enforcement.1 14
The second set of policy challenges involves not what information
states and firms collect but the way highly granular information gets
deployed. Again, the privacy conversation has evolved to focus not on
the capacity of the individual to protect their data, but on the power
over an individual or group that comes from knowing so much about
them. For example, firms can manipulate other market participants
through a fine-tuned understanding of the individual and collective
cognitive limitations of consumers.11 5 Bots can gain our confidences to
extract personal information.11 6 Politicians and political operatives can
micro-target messages, including misleading ones, in an effort to sway
aggregate public attention.117 All of these capacities are dramatically
enhanced by the ability of Al to detect patterns in a complex world.
Thus, a distinct area of study is the best law and policy infrastructure
for a world of such exquisite and hyper-targeted control.

See Florida v. Jardines, 569 U.S. 1, 8-9 (2013).
See, e.g., Orin S. Kerr, Searches and Seizures in a Digital World, 119 HARV. L.
REV. 531, 551 (2005) (arguing that a search does not occur until information is
presented on a screen for a human to see, as opposed to simply being processed by the
computer or transferred to a hard drive).
114 See Christina M. Mulligan, Perfect Enforcement of Law: When to Limit and When
to Use Technology, 14 RICH.J.L. & TECH., no. 13, 2008, at 78-102.
115 See Ryan Calo, Digital Market Manipulation, 82 GEO. WASH. L. REV. 995, 100102 (2014) [hereinafter Calo, Digital Market Manipulation].
16 See Ian R. Kerr, Bots, Babes, and the Californicationof Commerce, 1 U. OTTAWA L.
& TECH. J. 285, 312-17 (2004) (presciently describing the role of chat bots in online
commerce).
117 Ira S. Rubenstein, Voter Privacy in the Age of Big Data, 2014 Wis. L. REV. 861,
866-67 (2014).

University of California,Davis

2.

[Vol. 51:399

The Data Parity Problem

The data-intensive nature of machine learning, the technique
yielding the most powerful applications of Al at the moment, has
ramifications that are distinct from the pattern recognition problem.
Simply put, the greater access to data a firm has, the better positioned
it is to solve difficult problems with ML. As Amanda Levendowski
explores, ML practitioners have essentially three options in securing
sufficient data.1 18 They can build the databases themselves, they can
buy the data, or they can use "low friction" alternatives such as
content in the public domain.11 9 The last option carries perils for bias
discussed above. The first two are avenues largely available to big
firms or institutions such as Facebook or the military.
The reality that a handful of large entities (literally, fewer than a
human has fingers) possesses orders of magnitude more data than
anyone else leads to a policy question around data parity. Smaller
firms will have trouble entering and competing in the marketplace.1 20
Industry research labs will come to outstrip public labs or universities,
to the extent they do not already. Accordingly, cutting-edge Al
practitioners will face even greater incentives to enter the private
sphere, and ML applications will bend systematically toward the goals
of profit-driven companies and not society at large. Companies will
possess not only more and better information but a monopoly on its
serious analysis.
Why label the question of asymmetric access to data a "privacy"
question? I do so because privacy ultimately governs the set of
responsible policy outcomes that arise in response to the data parity
problem. Firms will, and already do, invoke consumer privacy as a
rationale for not permitting access to their data. This is partly why the
Al policy community must maintain a healthy dose of skepticism
toward "ethical codes of conduct" developed by industry.121 Such
codes are likely to contain a principle of privacy that, unless carefully
crafted, operates to help shield the company from an obligation to
share training data with other stakeholders.
A related question involves access to citizen data held by the
government.
Governments possess an immense amount of
118 See Amanda Levendowski, How Copyright Law Can Fix Artificial Intelligence's
Implicit Bias Problem, 93 WASH. L. REV. (forthcoming 2018) (manuscript at 23, 27-32),
https://papers.ssrn.com/sol3/papers.cfm?abstract-id=3024938.
119 See id.
120 See id. at 26 (attributing this in part to the fact that larger firms have access to
much more data).

See supra Part I.

Artificial Intelligence Policy

2017]1

information; data that citizens are obligated to provide to the state
forms the backbone of the contemporary data broker industry.1 22
Firms big and small, as well as university and other researchers, may
be able to access government data on comparable terms. But there are
policy challenges here as well. Governments can and sometimes
should place limits and conditions around sharing data. 123 In the
United States at least, this means carefully crafting policies to avoid
constitutional scrutiny as infringements on speech. The government
cannot pick and choose with impunity the sorts of uses to which
private actors place data released by the state.1 24 At the same time,
governments may be able to put sensible restrictions in place before
compelling citizens to release private data.
To be clear: I do not think society should run roughshod over
privacy in its pursuit of data parity. Indeed, I present this issue as a
key policy challenge precisely because I believe we need mechanisms
by which to achieve a greater measure of data parity without
sacrificing personal or collective privacy. Some within academia and
industry are already working on methods - including differential
privacy and federated training - that seek to minimize the privacy
impact of granting broader access to data-intensive systems.1 25 The
hard policy question is how to incentivize technical, legal, social, and
other interventions that safeguard privacy even as Al is democratized.
E.

Taxation and Displacement of Labor

A common concern, especially in public discourse, is that Al will
displace jobs by mastering tasks currently performed by people. 126 The
classic example is the truck driver: many have observed that self122 See Jan Whittington et al., Push, Pull, and Spill: A TransdisciplinaryCase Study in
Municipal Open Government, 30 BERKELEY TEcH. L.J. 1899, 1904 (2015).
123 Cf. Julia Powles & Hat Hodson, Google DeepMind and Healthcarein An Age of
Algorithms, HEALTH TECH. (Mar. 16, 2017), https://link.springer.com/article/
10.1007%2Fsl2553-017-0179-1 (outlining an incident where Google Deepmind
accessed sensitive patient information, and what the British government could do to
minimize that access).
124 See Sorrell v. IMS Health Inc., 564 U.S. 552, 579-80 (2011).
125 See James Vincent, Google Is Testing a New Way of Trainingits Al Algorithms Directly
on Your Phone, VERGE (Apr. 10, 2017), https://www.theverge.com/2017/4/10/
15241492/google-ai-user-data-federated-learning; see also Cynthia Dwork, Differential
Privacy, in AUTOMATA, LANGUAGES AND PROGRAMMING 1, 2-3 (Michele Bughesi et al. eds.,
[https//doi.org/
2007), https/link.springer.com/content/pdf/10.1007%2F11787006.pdf
10.1007/11787006-1].
126 See, e.g., FORD, supra note 3 ("[Mlachines themselves are turning into
workers. . . .").

University of California, Davis

[Vol. 51:399

driving vehicles could obviate, or at least radically transform, this very
common role. Machines have been replacing people since the
Industrial Revolution (which posed its own challenges for society).
The difference, many suppose, is twofold: first, the process of
automation will be much faster, and second, very few sectors will
remain untouched by Al's contemporary and anticipated
capabilities. 127 This would widen the populations that could feel Al's
impact and limit the efficacy of temporary unemployment benefits or
retraining.
In its exploration of Al's impact on America, the Obama White
House specifically inquired into the impact of Al on the job force and
issued a report recommending a thicker social safety net to manage the
upcoming disruption.1 28 Some predict that new jobs will arise even as
old ones fall away, or that Al will often improve the day to day of
workers by permitting them to focus on more rewarding tasks
involving judgment and creativity with which Al struggles.1 29 Others
explore the eventual need for a universal basic income, presumably
underwritten by gains in productivity for automation, so that even
those displaced entirely by Al have access to resources. 130 Still others
wisely call for more and better information specific to automation so
as to be able to better predict and scope the effects of AI.131
In addition to assessing impact and addressing displacement,
policymakers will have to think through the effects of Al on the public
fisc. Taxation is a highly complex policy domain that touches upon
virtually all aspects of society; Al is no exception. Robots do not pay
taxes, as the IRS once remarked in letter.132 Bill Gates, Jr. thinks they
should.1 33 Others warn that a tax on automation amounts to a tax on
127 See ERIK BRYNJOLFSSON & ANDREW McAFEE, THE SECOND MACHINE AGE:
WORK,
PROGRESS, AND PROSPERITY IN A TIME OF BRILLIANT TECHNOLOGIES 126-28 (2014).
128 See EXEC. OFFICE OF THE PRESIDENT, ARTIFICIAL INTELLIGENCE, AUTOMATION, AND
THE ECONOMY

35-42 (2016), https://obamawhitehouse.archives.gov/sites/whitehouse.
gov/files/documents/Artificial-Intelligence-Automation-Economy.PDF.

See BRYNJOLFSSON & MCAFEE, supra note 127, at 134-38.

130 Queena Kim, As Our Jobs Are Automated, Some Say We'll Need a Guaranteed
Basic Income,
NPR
WEEKEND
EDITION
(Sept.
24,
2016,
5:53
AM),

http://www.npr.org/2016/09/24/495186758/as-our-jobs-are-automated-some-say-wellneed-a-guaranteed-basic-income.
131 I am thinking particularly of the ongoing work of Robert Seamans at NYU
Stem. E.g., Robert Seamans, We Won't Even Know If a Robot Takes Your Job, FORBES
(Jan. 11, 2017, 8:10 AM), https://www.forbes.com/sites/washingtonbytes/2017/01/11/
we-wont-even-know-if-a-robot-takes-your-job/#36c2a0894bc5.
132 Treasury Responds to Suggestion that Robots Pay Income Tax, 25 TAX NOTES 20
(1984) (" [11nanimate objects are not required to file income tax returns.").
133 See Kevin J. Delaney, The Robot that Takes Your Job Should Pay Taxes, Says Bill

Artificial Intelligence Policy

2017]1

innovation and progress. 134 Ultimately, federal and state policymakers
will have to figure out how to keep the lights on in the absence of, for
instance, the bulk of today's income taxes.
F.

Cross-CuttingQuestions (Selected)

The preceding list of questions is scarcely exhaustive as to
consequences of artificial intelligence for law and policy. Notably
missing is any systemic review of the ways Al challenges existing legal
doctrines. For example, that Al is capable of generating spontaneous
speech or content raises doctrinal questions around the limits of the
First Amendment as well as the contours of intellectual property.1 35
Below, this Essay discusses the prospect that Al will wake up and kill
us, which, if true, would seem to render every other policy context
moot.1 36 But the preceding inventory does cover most of the common

big picture policy questions that tend to dominant serious discourse
around artificial intelligence.
In addition to these specific policy contexts such as privacy, labor,
or the use of force, recurrent issues arise that cut across domains. I
have selected a few here that deserve greater attention: determining
the best institutional configuration for governing Al, investing
collective resources in Al that benefit individuals and society,
addressing hurdles to Al accountability, and addressing our tendency
to anthropomorphize technologies such as Al. I will discuss each of
these systemic questions briefly in turn.
1.

Institutional Configuration and Expertise

The prospect that Al presents individual or systemic risk, while
simultaneously promising enormous potential benefits to people and
society if responsibly deployed, presents policymakers with an acute
challenge around the best institutional configuration for channeling
Al. Today Al policy is done, if at all, by piecemeal approach; federal
agencies, states, cities, and other government units tackle issues that
Gates, QUARTZ (Feb. 17, 2017), https://qz.com/911968/bill-gates-the-robot-that-takesyour-job-'should-pay-taxes.

Steve Cousins, Is a "Robot Tax" Really an "Innovation Penalty"?, TECHCRUNCH

(Apr. 22, 2017), https://techcrunch.com/2017/04/22/save-the-robots-from-taxes.
135 RONALD COLLINS

& DAVID SKOVER, RoOTICA: SPEECH RIGHTS AND ARTIFICIAL

INTELLIGENCE (forthcoming 2018); see Annemarie Bridy, Coding Creativity: Copyright
and the Artificially Intelligent Author, 2012 STAN. TECH. L. REv. 5, 21-27; James

Grimmelmann, Copyrightfor Literate Robots, 101 IowAL. REv. 657, 670 (2016).
136 See infra Part III.

University of California,Davis

[Vol. 51:399

most relate to them in isolation. There are advantages to this approach
similar to the advantages of experimentation inherent in federalism
the approach is sensitive to differences across contexts and preserves
room for experimentation. 137 But some see the piecemeal approach as
problematic, calling, for instance, for a kind of FDA for algorithms to
vet every system with a serious potential to cause harm. 138
Al prefigures into a common, but I think misguided, observation
about the relationship between law and technology. The public sees
law as too slow to catch up to technologic innovation. Sometimes it is
true that particular laws or regulations become long outdated as
technology moves beyond where it was when the law was passed. For
example, the Electronic Communications Privacy Act ("ECPA"),
passed in 1986, interacts poorly with a post Internet environment in
part because of ECPA's assumptions about how electronic
communications would work.1 39 But this is hardly inevitable, and
often political. The Federal Trade Commission has continued in its
mission of protecting markets and consumers unabated, in part
because it enforces a standard - that of unfair and deceptive practice
- that is largely neutral as to technology.14 0 In other contexts,
agencies have passed new rules or interpreted rules differently to
address new techniques and practices.
The better-grounded observation is that government lacks the
requisite expertise to manage society in such a deeply technicallymediated world. 141 Government bodies are slow to hire up and face
steep competition from industry. When the state does not have its
own experts, it must either rely on the self-interested word of private
firms (or their proxies) or experience a paralysis of decision and
action that ill-serves innovation. 142 Thus, one overarching policy
challenge is how best to introduce expertise about Al and robotics into
all branches and levels of government so they can make better
decisions with greater confidence.
137 New State Ice Co. v. Liebmann, 285 U.S. 262, 311 (1932) (Brandeis, J.,
dissenting) (articulating the classic concept that states serve as laboratories of
democracy).
138 E.g., Andrew Tutt, An FDA for Algorithms, 69 ADMIN. L. REV. 83, 91, 104-06
(2017).
139 See Orin S. Kerr, The Next GenerationCommunications Privacy Act, 162 U. PA. L.
REV. 373, 375, 390 (2014).
14 See Woodrow Hartzog, Unfair and Deceptive Robots, 74 MD. L. REV. 785, 812-14
(2015).
141 See CALO, COMMISSION, supra note 88, at 4.
142 See id. at 2, 6-10 (listing examples of scenarios where a state or federal
government had difficulty with new technologies when it lacked expertise).

2017]1

Artificial Intelligence Policy

The solution could involve new advisory bodies, such as an official
Federal Advisory Committee on Artificial Intelligence with an existing
department or even a standalone Federal Robotics Commission. 143 Or
it could involve resuscitating the Office of Technology Assessment,
building out the Congressional Research Service, or growing the Office
of Science and Technology Policy. Yet another approach involves each
branch hiring its own technical staff at every level. The technical
knowledge and affordances of the government - from the ability to
test claims in a laboratory to a working understanding of Al in
lawmakers and the judiciary - will ultimately affect the government's
capacity to generate wise Al policy.
2.

Investment and Procurement

The government possesses a wide variety of means by which to
channel Al in the public good. As recognized by the Obama White
House, which published a separate report on the topic, one way to
shape Al is by investing in it.144 Investment opportunities include not
only basic Al research, which advance the state of computer science
and help ensure the United States remains globally competitive, but
also support of social scientific research into Al's impacts on society.
Policymakers can be strategic about where funds are committed and
emphasize, for example, projects with an interdisciplinary research
agenda and a vision for the public good.
In addition, and sometimes less well-recognized, the government
can influence policy through what it decides to purchase. 145 States are
capable of exerting considerable market pressures. Thus, policymakers
at all levels ought to be thinking about the qualities and characteristics
of the Al-enabled products government will purchase and the
companies that create them. Policymakers can also use contract to
help ensure best practice around privacy, security, and other values.
This can in turn move the entire market toward more responsible
practice and benefit society overall.
143 Id. at 3; Tom Krazit, Updated Washington's Sen. Cantwell Prepping Bill Calling
for AI Committee, GEEKWIRE (July 10, 2017, 9:51 AM), https://www.geekwire.com/
2017/washingtons-sen-cantwell-reportedly-prepping-bill-calling-ai-committee.
144 NETWORKING & INFO. TECH. RES. & DEv. SUBcoMM., NAT'L SCI. & TECH. COUNCIL,
THE NATIONAL ARTIFICIAL INTELLIGENCE RESEARCH AND DEVELOPMENT STRATEGIC PLAN 15-22
(Oct. 2016), httpsJ/obamawhitehouse.archives.gov/sites/default/files/whitehousefiles/
microsites/ostp/NSTC/national ai rd strategic..plan.pdf.
145 See, e.g., Smith, supra note 87, at 118-19 (discussing procurement in connection
with driverless cars); Whittington et al., supra note 122, at 1908-09 (discussing
procurement in connection with open municipal data).

3.

University of California, Davis

[Vol. 51:399

Removing Hurdles to Accountability

Many Al systems in use or development today are proprietary, and
owners of Al systems have inadequate incentives to open them up to
scrutiny. In many contexts, outside analysis is necessary for
accountability. For example, in the context of justice and equity,
defendants may seek to challenge adverse risk scores. 146 Or, in the
context of safety and certification, third parties seek to verify claims of
safety or to evidence a lack of compliance. Several reports, briefs, and
research papers have called upon policymakers to remove actual or
perceived barriers to accountability, including: (1) trade secret law;147
(2) the Computer Fraud and Abuse Act; 148 and (3) the anticircumvention provision of the Digital Millennium Copyright Act. 149
This has led a number of experts to recommend the formal policy step
of planning to remove such barriers in order to foster greater
accountability for Al.
4.

Mental Models of Al

The next and final Part is devoted to a discussion of whether Al is
likely to end humanity, itself partly a reflection of the special set of
fears that tend to accompany anthropomorphic technology such as
A1.15 0 Policymakers arguably owe it to their constituents to hold a
clear and accurate mental model of Al themselves and may have a role
in educating citizens about the technology and its potential effects.
Here they face an uphill battle, at least in the United States, due to
decades of books, films, television shows, and even plays that depict
Al as a threatening substitute for people.151 That the task is difficult,
however, does not discharge policymakers from their responsibilities.

146 See, e.g., Loomis v. State, 881 N.W.2d 749, 759 (Wis. 2016) (explaining that
although a defendant may not challenge the algorithms themselves, he or she may still
review and challenge the resulting scores).
147 E.g., Rebecca Wexler, When a Computer Program Keeps You in Jail, N.Y. TIMES
(June 13, 2017), https://www.nytimes.com/2017/06/13/opinion/how-computers-areharming-criminal-justice.html.
148 E.g., CRAWFORD ET AL., supra note 49; STONE ET AL., supra note 7.
149 E.g., CRAWFORD ET AL., supra note 49; STONE ET AL., supra note 7.
150 See infra Part Ill.
151 There are examples dating back to the origin of the word robot. See Danny
Lewis, 78 Years Ago Today, BBC Aired the First Science Fiction Television Program,
SMITHSONIAN (Feb. 11, 2016), https://www.smithsonianmag.com/smart-news/78-yearsago-today-bbc-aired-first-science-fiction-television-program-180958126.
There are
also examples from the heyday of German silent film, METROPOLIS (Universum Film
1927), and contemporary American cinema, Ex MACHINA (Universal Pictures

Artificial Intelligence Policy

2017]1

At a more granular level, the fact that instantiations of Al - such as
Alexa (Echo), Siri, and Cortana, not to mention countless chat bots on
a variety of social media platforms - take the form of social agents
presents special challenges for policy driven by our hardwired
responses to social technology as though it were human.15 2 These
challenges include the potential to influence children and other
vulnerable groups in commercial settings and the prospect of
disrupting civic or political discourse153 or the further diminution of
possibilities for solitude through a constant sense of being in the
presence of another. 5 4 Others are concerned about the prospect of
intimacy, including sexual, between people and machines.1 55
Whatever the particulars, that even the simplest Al can trigger social
and emotional responses in people requires much more study and
thought.
III.

ON THE Al APOCALYPSE

Some set of readers may feel I have left out a key question: does
artificial intelligence present an existential threat to humanity? If so,
perhaps all other discussions constitute the policy equivalent of
rearranging deck chairs on the Titanic. Why fix the human world if Al
is going to end it?
My own view is that Al does not present an existential threat to
humanity, at least not in anything like the foreseeable future. Further,
devoting disproportionate attention and resources to the Al
apocalypse has the potential to distract policymakers from addressing
Al's more immediate harms and challenges and could discourage
investment in research on Al's present social impacts.1 56 How much
International 2014). But the robot-as-villain narrative is not ubiquitous. Adults in
Japan, for instance, grew up reading Astro Boy, a Manga or comic in which the robot

is

a

hero.

Astro

Boy

[Mighty

Atom]

(Manga),

TEZUKA

IN

ENGLISH,

http://tezukainenglish.com/wp/?page-id=138 (last visited Oct. 18, 2017).
152 See generally Kate Darling, "Who's Johnny?": Anthropomorphic Framing in
Human-Robot Interaction, Integration, and Policy, in ROBOT ETHICS 2.0 (Patrick Lin et al.
eds., forthcoming 2017) (discussing the effects of anthropomorphizing robots).
153 See Calo, Digital Market Manipulation, supra note 115; Kerr, supra note 116;
Mulligan, supra note 114, at P101.
154 See Ryan Calo, People Can Be So Fake: A New Dimension to Privacy and
Technology Scholarship, 114 PA. ST. L. REV. 809, 843-46 (2009).
155 E.g., NOEL SHARKEY ET AL., OUR SEXUAL FUTURE WITH ROBOTS: A FOUNDATION FOR
RESPONSIBLE ROBOTICS CONSULTATION REPORT 1 (2017), http://responsiblerobotics.org/

wp-content/uploads/2017/07/FRR-Consultation-Report-Our-Sexual-Future-with-robots
Final.pdf.
156 See generally Crawford & Calo, supra note 60 ("Fears about the future impacts

University of California, Davis

[Vol. 51:399

attention to pay to a remote but dire threat is itself a difficult question
of policy. If there is any risk to humanity then it follows that some
thought and debate is worthwhile. But too much attention has realworld consequences.
Entrepreneur Elon Musk, physicist Stephen Hawking, and other
famous individuals apparently believe Al represents civilization's
greatest threat to date. 157 The most common citation for this
proposition is the work of a British speculative philosopher named
Nick Bostrom. In Superintelligence, Bostrom purports to demonstrate
that we are on a path toward developing Al that is both enormously
superior to human intelligence and presents a significant danger of
turning on its creators. 158 Bostrom, it should be said, does not see a
malignant superintelligence as inevitable. But he presents the danger as
acute enough to merit serious consideration.
A number of prominent voices in artificial intelligence have
convincingly challenged Superintelligence's thesis along several lines.1 59
First, they argue that there is simply no path toward machine
intelligence that rivals our own across all contexts or domains. Yes, a
machine specifically designed to do so can beat any human at chess.
But nothing in the current literature around ML, search, reinforcement
learning, or any other aspect of Al points the way toward modeling
even the intelligence of a lower mammal in full, let alone human
intelligence.160 Some say this explains why claims of a pending Al
of artificial intelligence are distracting researchers from the real risks of deployed
systems....").
157 Cf Sonali Kohli, Bill Gates Joins Elon Musk and Stephen Hawking in Saying
Artificial Intelligence Is Scary, QUARTZ (Jan. 29, 2015), https://qz.com/335768/billgates-joins-elon-musk-and-stephen-hawking-in-saying-artificial-intelligence-is-scary
(discussing how many industry juggernauts believe Al poses a threat to mankind).
158 See generally NICK BOSTROM, SUPERINTELLIGENCE: PATHS, DANGERS, STRATEGIES
(2014) (exploring the "most daunting challenge humanity has ever faced" and
assessing how we might best respond).
159 See Raffi Khatchadourian, The Doomsday Invention, NEW YORKER (Nov. 23, 2015),
https//www.newyorker.com/magazine/2015/11/23/doomsday-invention-artificialintelligence-nick-bostrom. In other work, Bostrom argues that we are likely all living in a
computer simulation created by our distant descendants. Nick Bostrom, Are You Living
in A Simulation?, 53 PHIL. Q. 211, 211 (2003). This prior claim raises an interesting
paradox: if Al kills everyone in the future, then we cannot be living in a computer
simulation created by our decedents. And if we are living in a computer simulation
created by our decedents, then Al did not kill everyone. I think it a fair deduction that
Professor Bostrom is wrong about something.
160 See Erik Sofge, Why Artificial Intelligence Will Not Obliterate Humanity, POPULAR
Sa. (Mar. 19, 2015), http://www.popsci.com/why-artificial-intelligence-will-notobliterate-humanity. Australian computer scientist Mary Anne Williams once
remarked to me, "We have been doing artificial intelligence since that term was

2017]1

Artificial Intelligence Policy

apocalypse come almost exclusively from the ranks of individuals such
as Musk, Hawking, and Bostrom who lack work experience in the
field. 161 Second, critics of the Al apocalypse argue that even if we were
able eventually to create a superintelligence, there is no reason to
believe it would be bent on world domination, unless this were for
some reason programmed into the system. As Yann LeCun, deep
learning pioneer and head of Al at Facebook colorfully puts it:
computers do not have testosterone.1 62
Note that the threat to humanity could come in several forms. The
first is that Al wakes up and purposefully kills everyone out of animus
or to make more room for itself. This is the stuff of Hollywood movies
and books by Daniel Wilson and finds next to no support in the
computer science literature (which is why we call it science fiction).1 63

The second is that Al accidentally kills everyone in the blind pursuit
of some arbitrary goal - for example, an irresistibly powerful Al
charged with making paperclips destroys the Earth in the process of
mining for materials.1 64 Fantasy is replete with examples of this
scenario as well, from The Sorcerer's Apprentice in Disney's Fantasia
to the ill-fated King Midas who demands the wrong blessing.1 65 A third
is that a very bad individual or group uses Al as part of an attempt to
end human life.
Even if you believe the mainstream Al community that we are
hundreds of years away from understanding how to create machines

coined in the 1950s, and today robots are about as smart as insects."
161 See Connie Loizos, This Famous Roboticist Doesn't Think Elon Musk Understands
Al, TECHCRUNCH (July 19, 2017), https://techcrunch.com/2017/07/19/this-famousroboticist-doesnt-think-elon-musk-understands-ai (quoting Rodney Brooks as noting
that Al alarmists "share a common thread, in that: they don't work in Al themselves").
162 Dave Blanchard, Musk's Warning Sparks Call for Regulating Artificial Intelligence,
NPR (July 19, 2017), http://www.npr.org/sections/alltechconsidered/2017/07/19/
537961841/musks-warning-sparks-call-for-regulating-artificial-intelligence (citing an
observation by Yan LeCun that the desire to dominate is not necessarily correlated
with intelligence).
163 See DANIEL WILSON, ROBOPOCALYPSE: A NOVEL (2011). Wilson's book is thrilling
in part because Wilson has training in robotics and selectively adds accurate details to
lend verisimilitude.
164 E.g., BOSTROM, supra note 158, at 123.
165 ARISTOTLE, POLITICS 17 (B. Jowett trans., Oxford, Clarendon Press 1885)
(describing Midas' uncontrollable power to turn everything he touched into gold);
FANTASIA (Walt Disney Productions 1940) (where an army of magically enchanted
brooms ceaselessly fill a cauldron with water and almost drown Mickey Mouse). I owe
the analogy to King Midas to Stuart Russell, a prominent computer scientist at
UC Berkeley who is among the handful of Al experts to join Musk and others in
worrying aloud about AI's capacity to threaten humanity.

University of California, Davis

[Vol. 51:399

capable of formulating an intent to harm, and would not do so
anyway, you might be worried about the second and third scenarios.
The second argument has its attractions: people can set goals for Al
that lead to unintended consequences. Computers do what you tell
them to do, as the saying goes, not what you want them to do. But it is
also important to consider the characteristics of the system Al
doomsayers envision. This system is simultaneously so primitive as to
perceive a singular goal, such as making paperclips, arbitrarily
assigned by a person, and yet so advanced as to be capable of
outwitting and overpowering the sum total of humanity in pursuit of
this goal. I find this combination of qualities unlikely, perhaps on par
with the likelihood of a malicious Al bent on purposive world
domination.
Perhaps more worrying is the potential that a person or group might
use Al in some way to threaten all of society. This is the vision of, for
example, Daniel Suarez in his book Daemon166 and has been explored
by workshops such as Bad Actors in AI at Oxford University.1 67 We can
imagine, for example, a malicious actor leveraging Al to compromise
nuclear security, using trading algorithms to destabilize the market, or
spreading misinformation through Al-enabled micro-targeting to
incite violence. The path from malicious activity to existential threat,
however, is narrow, and for now the stuff of graphic novels. 168
Only time can tell us for certain who is wrong and who is right.
Although it may not be the mainstream view among Al researcher and
practitioners, I have attended several events where established
computer scientists and other smart people reflected some version of
the doomsday scenario.1 69 If there is even a remote chance that Al will
wake up and kill us (i.e., if the Al apocalypse is a low probability, high
loss problem), then perhaps we should pay some attention to the
issue.

166 DANIEL SUAREZ, DAEMON (2009).
167 See Bad Actors and Artificial Intelligence Workshop, THE FUTURE OF HUMANITY

INST. (Feb. 24, 2017), https://www.fhi.ox.ac.uk/bad-actors-and-artificial-intelligenceworkshop.

See e.g., ALAN MOORE, DAVE GIBBONS & JOHN HIGGINS, WATCHMEN 382-90 (1995)

(graphically portraying the chaos that ensues after a villain engineers a giant monster
cloned from a human brain to destroy New York).
169 See, e.g., Past Events, THE FUTURE OF LIFE INST., https://futureoflife.org/

past events (last visited Oct. 18, 2017) (cataloguing past events hosted by the Future
of Life Institute, an organization that is devoted to "safeguarding life and developing
optimistic visions of the future, including positive ways for humanity to steer its own
course considering new technologies and challenges").

2017]

Artificial Intelligence Policy

The strongest argument against focusing overly on Skynet or HAL in
2017 is the opportunity cost. Al presents numerous pressing
challenges to individuals and society in the very short term. The
problem is not that artificial intelligence "will get too smart and take
over the world," computer scientist Pedro Domingos writes, "the real
problem is that [it's] too stupid and [has] already."17o By focusing so
much energy on a quixotic existential threat, we risk, in information
scientist Solon Barocas' words, an Al Policy Winter.
CONCLUSION

This Essay had two goals. First, it sought to provide a brief primer
on artificial intelligence by defining Al in relation to previous and
constituent technologies and by noting the ways the contemporary
conversation around Al may be unique. One of the most obvious
breaks with the past is the extent and sophistication of the policy
response to Al in the United States and around the world. Thus the
Essay sought, second, to provide an inventory or roadmap of the
serious policy questions that have arisen to date. The purpose of this
inventory is to inform Al policymaking, broadly understood, by
identifying the issues and developing the questions to the point that
readers can initiate their own investigation. The roadmap is
idiosyncratic to the author but informed by longstanding participation
in Al policy.
Al is remaking aspects of society today and likely to shepherd in
much greater changes in the coming years. As this Essay emphasized,
the process of societal transformation carries with it many distinct and
difficult questions of policy. Even so, there is reason for hope. We
have certain advantages over our predecessors. The previous industrial
revolutions had their lessons and we have access today to many more
policymaking bodies and tools. We have also made interdisciplinary
collaboration much more of a standard practice. But perhaps the
greatest advantage is timing: Al has managed to capture policymakers'
imaginations early enough in its life-cycle that there is hope we can yet
channel it toward the public interest. I hope this Essay contributes in
some small way to this process.

PEDRO DOMINGOS, THE MASTER ALGORITHM: HOW THE QUEST FOR THE ULTIMATE

LEARNING MACHINE WILL REMAKE OUR WORLD 286 (2015).
