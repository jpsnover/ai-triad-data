<!--
  AI Triad Research Project — Document Snapshot
  Title      : The Chinese Room Argument
  Source     : 
  Type       : pdf
  Captured   : 2026-04-19
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# The Chinese Room Argument

> **Snapshot captured:** 2026-04-19
> **Source:** 
> **Type:** pdf

---
4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Stanford Encyclopedia of Philosophy

The Chinese Room Argument

First published Fri Mar 19, 2004; substantive revision Wed Oct 23, 2024

The argument and thought-experiment now generally known as the Chinese Room Argument was first published
in a 1980 article by American philosopher John Searle (1932û ). It has become one of the best-known arguments
in recent philosophy. Searle imagines himself alone in a room following a computer program for responding to
Chinese characters slipped under the door. Searle understands nothing of Chinese, and yet, by following the
program for manipulating symbols and numerals just as a computer does, he sends appropriate strings of Chinese
characters back out under the door, and this leads those outside to mistakenly suppose there is a Chinese speaker
in the room.

The narrow conclusion Searle draws from the argument is that programming a digital computer may make it
appear to understand language but could not produce real understanding. Hence the ôTuring Testö is inadequate.
Searle argues that the thought experiment underscores the fact that computers merely use syntactic rules to
manipulate symbol strings, but have no understanding of meaning or semantics. The broader conclusion of the
argument is that the theory that human minds are computer-like computational or information processing
systems is refuted. Instead minds must result from biological processes; computers can at best simulate these
biological processes. Thus the argument has large implications for semantics, philosophy of language and mind,
theories of consciousness, computer science, and cognitive science generally. As a result, there have been many
critical replies to the argument.

1. Overview
2. Historical Background

2.1 LeibnizÆ Mill
2.2 TuringÆs Paper Machine
2.3 The Chinese Nation

3. The Chinese Room Argument
4. Replies to the Chinese Room Argument

4.1 The Systems Reply
4.2 The Robot Reply
4.3 The Brain Simulator Reply
4.4 The Other Minds Reply
4.5 The Intuition Reply
4.6 Advances in Artificial intelligence

5. The Larger Philosophical Issues

5.1 Syntax and Semantics
5.2 Intentionality
5.3 Mind and Body
5.4 Simulation, duplication and evolution

Conclusion
Bibliography
Academic Tools
Other Internet Resources
Related Entries

1. Overview

https://plato.stanford.edu/entries/chinese-room/

1/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Work in Artificial Intelligence (AI) has produced computer programs that can beat the world chess champion,
control autonomous vehicles, and defeat the best human players on the television quiz show Jeopardy. By 2022
AI had evolved from personal digital assistants (Alexa, Siri, Google Assistant) translating and answering
questions to using Large Language Models (LLMs) that could write poems, college level essays, and computer
programs, and could pass exams designed to screen the entrants into graduate schools, the study and practice of
Law, and other ôlearned professionsö. Our experience shows that playing chess or Jeopardy, writing essays,
passing difficult exams, and carrying on a conversation, are activities that require understanding and intelligence.
Does computer prowess at conversation, writing essays, and passing difficult examinations then show that
computers can understand language and be intelligent? Will further development result in digital computers that
fully match or even exceed human intelligence?

Alan Turing (1950), one of the pioneer theoreticians of computing, believed the answer to these questions was
ôyesö. Turing proposed what is now known as æThe Turing TestÆ: if a computer can pass for human in online
chat, we should grant that it is intelligent. By the late 1970s some AI researchers claimed that computers already
understood at least some natural language. In 1980 U.C. Berkeley philosopher John Searle introduced a short
and widely-discussed argument intended to show conclusively that it is impossible for digital computers to
understand language or think, now or in the future

Searle argues that a good way to test a theory of mind, say a theory that holds that understanding can be created
by doing such and such, is to imagine what it would be like to actually do what the theory says will create
understanding. Searle (1999) summarized his Chinese Room Argument (hereinafter, CRA) concisely:

Imagine a native English speaker who knows no Chinese locked in a room full of boxes of Chinese
symbols (a data base) together with a book of instructions for manipulating the symbols (the
program). Imagine that people outside the room send in other Chinese symbols which, unknown to
the person in the room, are questions in Chinese (the input). And imagine that by following the
instructions in the program the man in the room is able to pass out Chinese symbols which are
correct answers to the questions (the output). The program enables the person in the room to pass
the Turing Test for understanding Chinese but he does not understand a word of Chinese.

Searle goes on to say, ôThe point of the argument is this: if the man in the room does not understand Chinese on
the basis of implementing the appropriate program for understanding Chinese then neither does any other digital
computer solely on that basis because no computer, qua computer, has anything the man does not have.ö

Thirty years after introducing the CRA Searle 2010 describes the conclusion in terms of consciousness and
intentionality:

I demonstrated years ago with the so-called Chinese Room Argument that the implementation of the
computer program is not by itself sufficient for consciousness or intentionality (Searle 1980).
Computation is defined purely formally or syntactically, whereas minds have actual mental or
semantic contents, and we cannot get from syntactical to the semantic just by having the syntactical
operations and nothing else. To put this point slightly more technically, the notion ôsame
implemented programö defines an equivalence class that is specified independently of any specific
physical realization. But such a specification necessarily leaves out the biologically specific powers
of the brain to cause cognitive processes. A system, me, for example, would not acquire an
understanding of Chinese just by going through the steps of a computer program that simulated the
behavior of a Chinese speaker (p.17).

ôIntentionalityö is a technical term for a feature of mental and certain other things, namely being about
something. Thus a desire for a piece of chocolate as well as thoughts about real-world Manhattan or fictional
Harry Potter all display intentionality, as will be discussed in more detail in section 5.2 below.

SearleÆs shift from machine understanding to consciousness and intentionality is not directly supported by the
original 1980 argument. However the re-description of the conclusion indicates the close connection between
understanding and consciousness in SearleÆs later accounts of meaning and intentionality. Those who donÆt

https://plato.stanford.edu/entries/chinese-room/

2/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

accept SearleÆs linking of understanding and consciousness might hold that running a program can create
understanding without necessarily creating consciousness, and conversely a fancy robot might have dog level
consciousness, desires, and beliefs, without necessarily understanding natural language.

In moving to discussion of intentionality Searle seeks to develop the broader implications of his argument. It
aims to refute the functionalist approach to understanding minds, that is, the approach that holds that mental
states are defined by their causal roles, not by the stuff (neurons, transistors) that plays those roles. The argument
counts especially against that form of functionalism known as the Computational Theory of Mind that treats
minds as information processing systems. As a result of its scope, as well as SearleÆs clear and forceful writing
style, the Chinese Room argument has probably been the most widely discussed philosophical argument in
cognitive science to appear since the Turing Test. By 1991 computer scientist Pat Hayes had defined Cognitive
Science as the ongoing research project of refuting SearleÆs argument. Cognitive psychologist Steven Pinker
(1997) pointed out that by the mid-1990s well over 100 articles had been published on SearleÆs thought
experiment û and that discussion of it was so pervasive on the Internet that Pinker found it a compelling reason
to remove his name from all Internet discussion lists.

This interest has not subsided, and the range of connections with the argument has broadened. A search on
Google Scholar for ôChinese Room Argumentö produces thousands of results, including papers making
connections between the argument and topics ranging from embodied cognition to theater to talk psychotherapy
to postmodern views of truth and ôour post-human futureö û as well as discussions of group or collective minds,
and discussions of the role of intuitions in philosophy. In 2007 a UK game company took the name ôThe
Chinese Roomö in joking honor of ô...SearleÆs critique of AI û that you could create a system that gave the
impression of intelligence without any actual internal smarts.ö This wide-range of discussion and implications is
a tribute to the argumentÆs simple clarity and centrality.

2. Historical Background

2.1 LeibnizÆ Mill

SearleÆs argument has four important antecedents. The first of these is an argument set out by the philosopher
and mathematician Gottfried Leibniz (1646û1716). This argument, often known as ôLeibnizÆ Millö, appears as
section 17 of LeibnizÆ Monadology. Like SearleÆs argument, LeibnizÆ argument takes the form of a thought
experiment. Leibniz asks us to imagine a physical system, a machine, that behaves in such a way that it
supposedly thinks and has experiences (ôperceptionö).

17. Moreover, it must be confessed that perception and that which depends upon it are inexplicable
on mechanical grounds, that is to say, by means of figures and motions. And supposing there were a
machine, so constructed as to think, feel, and have perception, it might be conceived as increased in
size, while keeping the same proportions, so that one might go into it as into a mill. That being so,
we should, on examining its interior, find only parts which work one upon another, and never
anything by which to explain a perception. Thus it is in a simple substance, and not in a compound
or in a machine, that perception must be sought for. [Robert Latta translation]

Notice that LeibnizÆs strategy here is to contrast the overt behavior of the machine, which might appear to be the
product of conscious thought, with the way the machine operates internally. He points out that these internal
mechanical operations are just parts moving from point to point, hence there is nothing that is conscious or that
can explain thinking, feeling or perceiving. For Leibniz physical states are not sufficient for, nor constitutive of,
mental states.

To this day the mystery of consciousness remains; one can still follow LeibnizÆ suggestion and imagine a brain
made so huge that one could walk between the neurons, and all one would see is, at best, squirts of
neurotransmitters, and nothing to explain conscious experience, including the experience of understanding
language. LeibnizÆ argument, that no matter what a physical system does, there would be no consciousness (and

https://plato.stanford.edu/entries/chinese-room/

3/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

so materialism is refuted), is parallel to SearleÆs claim that no matter what syntactic processing there is, there
would be no understanding of meaning (and so strong AI claims are refuted).

2.2 TuringÆs Paper Machine

A second antecedent to the Chinese Room argument is the idea of a paper machine, a computer implemented by
a human. This idea is found in the work of Alan Turing, for example in ôIntelligent Machineryö (1948). Turing
writes there that he wrote a program for a ôpaper machineö to play chess. A paper machine is a kind of program,
a series of simple steps like a computer program, but written in natural language (e.g., English), and
implemented by a human. The human operator of the paper chess-playing machine need not (otherwise) know
how to play chess. All the operator does is follow the instructions for generating moves on the chess board. In
fact, the operator need not even know that he or she is involved in playing chess û the input and output strings,
such as ôNûQB7ö need mean nothing to the operator of the paper machine.

As part of the WWII project to decipher German military encryption, Turing had written English-language
programs for human ôcomputersö, as these specialized workers were then known, and these human computers
did not need to know what the programs that they implemented were doing.

One reason the idea of a human-plus-paper machine is important is that it already raises questions about agency
and understanding similar to those in the CRA. Suppose I am alone in a closed room and follow an instruction
book for manipulating strings of symbols. I thereby implement a paper machine that generates symbol strings
such as ôN-KB3ö that I write on pieces of paper and slip under the door to someone ouside the room. Suppose
further that prior to going into the room I donÆt know how to play chess, or even that there is such a game.
However, unbeknownst to me, in the room I am running TuringÆs chess program and the symbol strings I
generate are chess notation and are taken as chess moves by those outside the room. They reply by sliding the
symbols for their own moves back under the door into the room. If all you see is the resulting sequence of moves
displayed on a chess board outside the room, you might think that someone in the room knows how to play chess
very well. Do I now know how to play chess? Or is it the system (consisting of me, the manuals, and the paper
on which I manipulate strings of symbols) that is playing chess? If I memorize the program and do the symbol
manipulations inside my head, do I then know how to play chess, albeit with an odd phenomenology? Do
someoneÆs conscious states matter for whether or not they know how to play chess? If a digital computer
implements the same program, does the computer (or program or computer plus program) then play chess, or
merely simulate this?

By mid-century Turing was optimistic that the newly developed electronic computers themselves would soon be
able to exhibit apparently intelligent behavior, answering questions posed in English and carrying on
conversations. Turing (1950) proposed what is now known as the Turing Test: if a computer could pass for
human in on-line chat, it should be counted as intelligent.

A third antecedent of SearleÆs argument was the work of SearleÆs colleague at Berkeley, Hubert Dreyfus. Dreyfus
was an early critic of the optimistic claims made by AI researchers. In 1965, when Dreyfus was at MIT, he
published a circa hundred page report titled ôAlchemy and Artificial Intelligenceö. Dreyfus argued that key
features of human mental life could not be captured by formal rules for manipulating symbols. Dreyfus moved to
Berkeley in 1968 and in 1972 published his extended critique, ôWhat Computers CanÆt Doö. DreyfusÆ primary
research interests were in Continental philosophy, with its focus on consciousness, intentionality, and the role of
intuition and the inarticulated background in shaping our understandings. Dreyfus identified several problematic
assumptions in AI, including the view that brains are like digital computers, and, again, the assumption that
understanding can be codified as explicit rules.

However by the late 1970s, as computers became faster and less expensive, some in the burgeoning AI
community started to claim that their programs could understand English sentences, using a database of
background information. The work of one of these, Yale researcher Roger Schank (Schank & Abelson 1977)
came to SearleÆs attention. SchankÆs team developed a technique called ôconceptual representationö that used
ôscriptsö to represent conceptual relations (related to Conceptual Role Semantics). SearleÆs argument was

https://plato.stanford.edu/entries/chinese-room/

4/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

originally presented in 1980 specifically as a response to the claim that AI programs such as SchankÆs literally
understand the sentences that they respond to.

2.3 The Chinese Nation

A fourth antecedent to the Chinese Room argument are thought experiments involving myriad humans acting as
a computer. In 1961 Anatoly Mickevich (pseudonym A. Dneprov) published ôThe Gameö, a story in which a
stadium full of 1400 math students are arranged to function as a digital computer (see Dneprov 1961 and the
English translation listed at Mickevich 1961, Other Internet Resources). For 4 hours each student repeatedly
does a bit of calculation on binary numbers received from someone near them, then passes the binary result onto
someone nearby. They learn the next day that they collectively translated a sentence from Portuguese into their
native Russian. MickevichÆs protagonist concludes ôWeÆve proven that even the most perfect simulation of
machine thinking is not the thinking process itself, which is a higher form of motion of living matter.ö

Apparently independently, a similar consideration emerged in early discussion of functionalist theories of minds
and cognition (see further discussion in section 5.3 below). Functionalists hold that mental states are defined by
the causal role they play in a system (just as being a door stop is defined by what it does, not by what it is made
out of). Critics of functionalism were quick to turn its proclaimed virtue of multiple realizability against it.

By emphasizing causal or information processing roles as the essence of mental states, functionalism allowed us
to understand creatures with different physiology, for example extraterrestrials, to have the same types of mental
states as humans û pains, for example. But it was pointed out that if extraterrestrial aliens, with some other
complex system in place of brains, could realize the functional properties that constituted mental states, then,
presumably so could systems even less like human brains. The computational form of functionalism, which
holds that the defining role of each mental state is its role in information processing or computation, is
particularly vulnerable to this maneuver, since a wide variety of systems with simple components are
computationally equivalent (see e.g., Maudlin 1989 for discussion of a computer built from buckets of water).
Critics asked if it was really plausible that these inorganic systems could have mental states or feel pain.

Daniel Dennett (1978) reports that in 1974 Lawrence Davis gave a colloquium at MIT in which he presented one
such unorthodox implementation. Dennett summarizes DavisÆ thought experiment as follows:

Let a functionalist theory of pain (whatever its details) be instantiated by a system the subassemblies
of which are not such things as C-fibers and reticular systems but telephone lines and offices staffed
by people. Perhaps it is a giant robot controlled by an army of human beings that inhabit it. When
the theoryÆs functionally characterized conditions for pain are now met we must say, if the theory is
true, that the robot is in pain. That is, real pain, as real as our own, would exist in virtue of the
perhaps disinterested and businesslike activities of these bureaucratic teams, executing their proper
functions.

In ôTroubles with Functionalismö, also published in 1978, Ned Block envisions the entire population of China
implementing the functions of neurons in the brain. This scenario has subsequently been called ôThe Chinese
Nationö or ôThe Chinese Gymö. We can suppose that every Chinese citizen would be given a call-list of phone
numbers, and at a preset time on implementation day, designated ôinputö citizens would initiate the process by
calling those on their call-list. When any citizenÆs phone rang, he or she would then phone those on his or her
list, who would in turn contact yet others. No phone message need be exchanged; all that is required is the
pattern of calling. The call-lists would be constructed in such a way that the patterns of calls implemented the
same patterns of activation that occur between neurons in someoneÆs brain when that person is in a mental state û
pain, for example. The phone calls play the same functional role as neurons causing one another to fire. Block
was primarily interested in qualia, and in particular, whether it is plausible to hold that the population of China
might collectively be in pain, while no individual member of the population experienced any pain, but the
thought experiment applies to any mental states and operations, including understanding language.

https://plato.stanford.edu/entries/chinese-room/

5/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Thus BlockÆs thought experiment, as with those of Davis and Dennett, is a system of many humans rather than
one. The focus is on consciousness, but to the extent that SearleÆs argument also involves consciousness, the
thought experiment is closely related to SearleÆs. Cole (1984) tries to pump intuitions in the reverse direction by
setting out a thought experiment in which each of his neurons is itself conscious, and fully aware of its actions
including being doused with neurotransmitters, undergoing action potentials, and squirting neurotransmitters at
its neighbors. Cole argues that his conscious neurons would find it implausible that their collective activity
produced a consciousness and other cognitive competences, including understanding English, that the neurons
lack. That is, the mental states achieved by the activity of my neurons are my mental states, not those of any of
my neurons û so if my neurons thought in Chinese (only), that would not show that they donÆt collectively
produce someone ûmeû who understands English but not Chinese.) Cole suggests that the intuitions of
implementing systems are not to be trusted.

3. The Chinese Room Argument

In 1980 John Searle published ôMinds, Brains and Programsö in the journal The Behavioral and Brain Sciences.
In this article, Searle sets out the argument, and then replies to the half-dozen main objections that had been
raised during his earlier presentations at various university campuses (see next section). In addition, SearleÆs
article in BBS was published along with comments and criticisms by 27 cognitive science researchers. These 27
comments were followed by SearleÆs replies to his critics.

In the decades following its publication, the Chinese Room argument was the subject of very many discussions.
By 1984, Searle presented the Chinese Room argument in a book, Minds, Brains and Science. In January 1990,
the popular periodical Scientific American took the debate to a general scientific audience. Searle included the
Chinese Room Argument in his contribution, ôIs the BrainÆs Mind a Computer Program?ö, and SearleÆs piece
was followed by a responding article, ôCould a Machine Think?ö, written by philosophers Paul and Patricia
Churchland. Soon thereafter Searle had a published exchange about the Chinese Room with another leading
philosopher, Jerry Fodor (in Rosenthal (ed.) 1991).

The heart of the argument is Searle imagining himself following a symbol-processing program written in English
(which is what Turing called ôa paper machineö). The English speaker (Searle) sitting in the room follows
English instructions for manipulating Chinese symbols, whereas a computer ôfollowsö (in some sense) a
program written in a computing language. The human produces the appearance of understanding Chinese by
following the symbol manipulating instructions, but does not thereby come to understand Chinese. Since a
computer just does what the human does û manipulate symbols on the basis of their syntax alone û no computer,
merely by following a program, comes to genuinely understand Chinese.

This narrow argument, based closely on the Chinese Room scenario, is specifically directed at a position Searle
calls ôStrong AIö. Strong AI is the view that suitably programmed computers (or the programs themselves) can
understand natural language and actually have other mental capabilities similar to the humans whose behavior
they mimic. According to Strong AI, these computers really play chess intelligently, make clever moves, or
understand language. By contrast, ôweak AIö is the much more modest claim that computers are merely useful in
psychology, linguistics, and other areas, in part because they can simulate mental abilities. But weak AI makes
no claim that computers actually understand or are intelligent. The Chinese Room argument is not directed at
weak AI, nor does it purport to show that no machine can think û Searle says that brains are machines, and brains
think. The argument is directed at the view that formal computations on symbols can produce thought.

We might summarize the narrow argument as a reductio ad absurdum against Strong AI as follows. Let L be a
natural language, and let us say that a ôprogram for Lö is a program for conversing fluently in L. A computing
system is any system, human or otherwise, that can run a program.

1. If Strong AI is true, then there is a program for Chinese, C, such that if any computing system runs C, that

system thereby comes to understand Chinese.

2. I could run C without thereby coming to understand Chinese.
3. Therefore Strong AI is false.

https://plato.stanford.edu/entries/chinese-room/

6/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

The first premise elucidates the claim of Strong AI. The second premise is supported by the Chinese Room
thought experiment. The conclusion of this narrow argument is that running a program cannot endow the system
with language understanding. (There are other ways of understanding the structure of the argument. It may be
relevant to understand some of the claims as counterfactual: e.g. ôthere is a programö in premise 1 as meaning
there could be a program, etc. On this construal the argument involves modal logic, the logic of possibility and
necessity (see Damper 2006 for the CRA reconstructed as a modal 5 step reductio and Shaffer 2009 in
response)).

It is also worth noting that the claim made by Strong AI in the first premise above attributes understanding to
ôthe systemö. Exactly what Strong-AI supposes will acquire understanding when the program runs is crucial to
the success or failure of the CRA. Schank 1978 has a title that claims their groupÆs computer, a physical device,
understands, but in the body of the paper he claims that the program [ôSAMö] is doing the understanding: SAM,
Schank says ô...understands stories about domains about which it has knowledgeö (p. 133). As we will see in the
next section (4), these issues about the identity of the understander (the cpu? the program? the system?
something else?) quickly came to the fore for critics of the CRA. SearleÆs wider argument includes the claim that
the thought experiment shows more generally that one cannot get semantics (meaning) from syntax (formal
symbol manipulation). That larger claim and related issues are discussed in section 5: The Larger Philosophical
Issues.

4. Replies to the Chinese Room Argument

Criticisms of the narrow Chinese Room argument against Strong AI have often followed three main lines, which
can be distinguished by how much they concede:

(1) Some critics concede that the man in the room doesnÆt understand Chinese, but hold that nevertheless
running the program may create comprehension of Chinese by something other than the room operator. These
critics object to the inference from the claim that the man in the room does not understand Chinese to the
conclusion that no understanding has been created. There might be understanding by a larger, smaller, or
different, entity than the man rustling papers in the room. This is the strategy of The Systems Reply and the
Virtual Mind Reply. These replies hold that the output of the room might reflect real understanding of Chinese,
but the understanding would not be that of the room operator. Thus SearleÆs claim that he doesnÆt understand
Chinese while running the room is conceded, but his claim that there is no understanding of the questions in
Chinese, and that computationalism is false, is denied.

(2) Other critics concede SearleÆs claim that just running a natural language processing program as described in
the CR scenario does not create any understanding, whether by a human or a computer system. But these critics
hold that a variation on the computer system could understand. The variant might be a computer embedded in a
robotic body, having interaction with the physical world via sensors and motors (ôThe Robot Replyö), or it might
be a system that simulated the detailed operation of an entire human brain, neuron by neuron (ôthe Brain
Simulator Replyö).

(3) Finally, some critics do not concede even the narrow point against AI. These critics hold that the man in the
original Chinese Room scenario might understand Chinese, despite SearleÆs denials, or that the scenario is
impossible. For example, critics have argued that our intuitions in such cases are unreliable. Other critics have
held that it all depends on what one means by ôunderstandö û points discussed in the section on The Intuition
Reply. Others (e.g. Sprevak 2007) object to the assumption that any system (e.g. Searle in the room) can run any
computer program. And finally some have argued that if it is not reasonable to attribute understanding on the
basis of the behavior exhibited by the Chinese Room, then it would not be reasonable to attribute understanding
to humans on the basis of similar behavioral evidence (Searle calls this last the ôOther Minds Replyö). This
objection to the CRA is that we should be willing to attribute understanding in the Chinese Room on the basis of
the overt behavior, just as we do with other humans (and some animals), and as we would do with extra-
terrestrial aliens (or burning bushes or angels) that spoke our language. This position is close to TuringÆs own,
when he proposed his behavioral test for machine intelligence.

https://plato.stanford.edu/entries/chinese-room/

7/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

In addition to these responses specifically to the Chinese Room scenario and the narrow argument to be
discussed in this section, some critics also independently argue against SearleÆs larger claim, and hold that one
can get semantics (that is, meaning) from syntactic symbol manipulation, including the sort that takes place
inside a digital computer, a question discussed in the section below on Syntax and Semantics.

4.1 The Systems Reply

In the original BBS article, Searle identified and discussed several responses to the argument that he had come
across in giving the argument in talks at various places. As a result, these early responses have received the most
attention in subsequent discussion. What Searle 1980 calls ôperhaps the most common replyö is the Systems
Reply.

The Systems Reply (which Searle says was originally associated with Yale, the home of SchankÆs AI work)
concedes that the man in the room does not understand Chinese. But, the reply continues, the man is but a part, a
central processing unit (CPU), in a larger system. The larger system includes the huge database, the memory
(scratchpads) containing intermediate states, and the instructions û the complete system that is required for
answering the Chinese questions. So the Systems Reply is that while the man running the program does not
understand Chinese, the system as a whole does.

Ned Block was one of the first to press the Systems Reply, along with many others including Jack Copeland,
Daniel Dennett, Douglas Hofstadter, Jerry Fodor, John Haugeland, Ray Kurzweil and Georges Rey. Rey (1986)
says the person in the room is just the CPU of the system. Kurzweil (2002) says that the human being is just an
implementer and of no significance (presumably meaning that the properties of the implementer are not
necessarily those of the system). Kurzweil hews to the spirit of the Turing Test and holds that if the system
displays the apparent capacity to understand Chinese ôit would have to, indeed, understand Chineseö û Searle is
contradicting himself in saying in effect, ôthe machine speaks Chinese but doesnÆt understand Chineseö.

Margaret Boden (1988) raises levels considerations. ôComputational psychology does not credit the brain with
seeing bean-sprouts or understanding English: intentional states such as these are properties of people, not of
brainsö (244) û a person is an agent that is not identical with a brain or a body. ôIn short, SearleÆs description of
the robotÆs pseudo-brain (that is, of Searle-in-the-robot) as understanding English involves a category-mistake
comparable to treating the brain as the bearer, as opposed to the causal basis, of intelligenceö. Boden (1988)
points out that the room operator is a conscious agent, while the CPU in a computer is not û the Chinese Room
scenario asks us to take the perspective of the implementer, and not surprisingly fails to see the larger picture.

SearleÆs response to the Systems Reply is simple: in principle, he could internalize the entire system,
memorizing all the instructions and the database, and doing all the calculations in his head. He could then leave
the room and wander outdoors, perhaps even conversing in Chinese. But he still would have no way to attach
ôany meaning to the formal symbolsö. The man would now be the entire system, yet he still would not
understand Chinese. For example, he would not know the meaning of the Chinese word for hamburger. He still
cannot get semantics from syntax.

In some ways SearleÆs response here anticipates later extended mind views (e.g. Clark and Chalmers 1998): if
Otto, who suffers loss of memory, can regain those recall abilities by externalizing some of the information to his
notebooks, then Searle arguably can do the reverse: by internalizing the instructions and notebooks he should
acquire any abilities had by the extended system. And so Searle in effect concludes that since he doesnÆt acquire
understanding of Chinese by internalizing the external components of the entire system (e.g. he still doesnÆt
know what the Chinese word for hamburger means), understanding was never there in the partially externalized
system of the original Chinese Room.

In his 2002 paper ôThe Chinese Room from a Logical Point of Viewö, Jack Copeland considers SearleÆs
response to the Systems Reply and argues that a homunculus inside SearleÆs head might understand even though
the room operator himself does not, just as modules in our brains solve tensor equations that enable us to catch
cricket balls. Copeland then turns to consider the Chinese Gym, and again appears to endorse the Systems Reply:

https://plato.stanford.edu/entries/chinese-room/

8/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

ôàthe individual players [do not] understand Chinese. But there is no entailment from this to the claim that the
simulation as a whole does not come to understand Chinese. The fallacy involved in moving from part to whole
is even more glaring here than in the original version of the Chinese Room Argumentö. Copeland denies that
connectionism implies that a room of people can simulate the brain.

Shaffer 2009 examines modal aspects of the logic of the CRA and argues that familiar versions of the System
Reply are question-begging. But, Shaffer claims, a modalized version of the System Reply succeeds because
there are possible worlds in which understanding is an emergent property of complex syntax manipulation. Nute
2011 is a reply to Shaffer.

Stevan Harnad has defended SearleÆs argument against Systems Reply critics in two papers. In his 1989 paper,
Harnad writes ôSearle formulates the problem as follows: Is the mind a computer program? Or, more
specifically, if a computer program simulates or imitates activities of ours that seem to require understanding
(such as communicating in language), can the program itself be said to understand in so doing?ö (Note the
specific claim: the issue is taken to be whether the program itself understands.) Harnad concludes: ôOn the face
of it, [the CR argument] looks valid. It certainly works against the most common rejoinder, the æSystems
ReplyÆà.ö Harnad appears to follow Searle in linking understanding and states of consciousness: Harnad 2012
(Other Internet Resources) argues that Searle shows that the core problem of conscious ôfeelingö requires
sensory connections to the real world. (See sections below ôThe Robot Replyö and ôIntentionalityö for
discussion.)

Finally some have argued that even if the room operator memorizes the rules and does all the operations inside
his head, the room operator does not become the system. Cole (1984) and Block (1998) both argue that the result
would not be identity of Searle with the system but much more like a case of multiple personality û distinct
persons in a single head. The Chinese responding system would not be Searle, but a sub-part of him. In the CR
case, one person (Searle) is an English monoglot and the other is a Chinese monoglot. The English-speaking
personÆs total unawareness of the meaning of the Chinese responses does not show that they are not understood.
This line, of distinct persons, leads to the Virtual Mind Reply.

4.1.1 The Virtual Mind Reply

The Virtual Mind reply concedes, as does the System Reply, that the operator of the Chinese Room does not
understand Chinese merely by running the paper machine. However the Virtual Mind reply holds that what is
important is whether understanding is created, not whether the Room operator is the agent that understands.
Unlike the Systems Reply, the Virtual Mind reply (VMR) holds that a running system may create new, virtual,
entities that are distinct from both the system as a whole, as well as from the sub-systems such as the CPU or
operator. In particular, a running system might create a distinct agent that understands Chinese. This virtual agent
would be distinct from both the room operator and the entire system. The psychological traits, including
linguistic abilities, of any mind created by artificial intelligence will depend entirely upon the program and the
Chinese database, and will not be identical with the psychological traits and abilities of a CPU or the operator of
a paper machine, such as Searle in the Chinese Room scenario. According to the VMR the mistake in the
Chinese Room Argument is to make the claim of strong AI to be ôthe computer understands Chineseö or ôthe
System understands Chineseö. The claim at issue for AI should simply be whether ôthe running computer creates
understanding of Chineseö.

For example, John Haugeland writes (2002) that SearleÆs response to the Systems Reply is flawed: ôàwhat he
now asks is what it would be like if he, in his own mind, were consciously to implement the underlying formal
structures and operations that the theory says are sufficient to implement another mindö. According to
Haugeland, his failure to understand Chinese is irrelevant: he is just the implementer. The implemented mind
would understand û there is a level-of-description fallacy.

A familiar model of virtual agents are characters in computer or video games, as well as generative AIs such as
ChatGPT. Characters in video games have various abilities and personalities, and the characters are not identical
with the system hardware or program that creates them. A single running system might control two distinct

https://plato.stanford.edu/entries/chinese-room/

9/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

virtual agents, or physical robots, simultaneously, one of which converses only in Chinese and one of which can
converse only in English, and which otherwise manifest very different personalities, memories, and cognitive
abilities. For the Systems Reply, the system understands, whereas for the VM reply, the running system creates a
new, virtual, mind that is not identical with the system or the physical implementation. Thus the VM reply asks
us to distinguish between minds and their realizing systems.

Minsky (1980) and Sloman and Croucher (1980) suggested a Virtual Mind reply when the Chinese Room
argument first appeared. In his widely-read 1989 paper ôComputation and Consciousnessö, Tim Maudlin
considers minimal physical systems that might implement a computational system running a program. His
discussion revolves around his imaginary Olympia machine, a system of buckets that transfer water,
implementing a Turing machine. MaudlinÆs main target is the computationalistsÆ claim that such a machine could
have phenomenal consciousness. However in the course of his discussion, Maudlin considers the Chinese Room
argument. Maudlin (citing Minsky, and Sloman and Croucher) points out a Virtual Mind reply that the agent that
understands could be distinct from the physical system (414). Thus ôSearle has done nothing to discount the
possibility of simultaneously existing disjoint mentalitiesö (414û5).

Perlis (1992), Chalmers (1996) and Block (2002) have apparently endorsed versions of a Virtual Mind reply as
well, as has Richard Hanley in The Metaphysics of Star Trek (1997). Penrose (2002) is a critic of this strategy,
and Stevan Harnad scornfully dismisses such heroic resorts to metaphysics. Harnad defended SearleÆs position in
a ôVirtual Symposium on Virtual Mindsö (1992) against Patrick Hayes and Don Perlis. Perlis pressed a virtual
minds argument derived, he says, from Maudlin. Chalmers (1996) notes that the room operator is just a causal
facilitator, a ôdemonö, so that his states of consciousness are irrelevant to the properties of the system as a whole.
Like Maudlin, Chalmers raises issues of personal identity û we might regard the Chinese Room as ôtwo mental
systems realized within the same physical space. The organization that gives rise to the Chinese experiences is
quite distinct from the organization that gives rise to the demonÆs [= room operatorÆs] experiencesö(326).

Cole (1991, 1994) develops the reply and argues as follows: SearleÆs argument requires that the agent of
understanding be the computer itself or, in the Chinese Room parallel, the person in the room. However SearleÆs
failure to understand Chinese in the room does not show that there is no understanding being created. One of the
key considerations is that in SearleÆs discussion the actual conversation with the Chinese Room is always
seriously under specified. Searle was considering SchankÆs programs, which can only respond to a few questions
about what happened in a restaurant, all in third person. But Searle wishes his conclusions to apply to any AI-
produced responses, including those that would pass the toughest unrestricted Turing Test, i.e. they would be just
the sort of conversations real people have with each other. If we flesh out the conversation in the original CR
scenario to include questions in Chinese such as ôHow tall are you?ö, ôWhere do you live?ö, ôWhat did you have
for breakfast?ö, ôWhat is your attitude toward Mao?ö, and so forth, it immediately becomes clear that the
answers in Chinese are not SearleÆs answers. Searle is not the author of the answers, and his beliefs and desires,
memories and personality traits (apart from his industriousness!) are not reflected in the answers and in general
SearleÆs traits are causally inert in producing the answers to the Chinese questions. This suggests the following
conditional is true: if there is understanding of Chinese created by running the program, the mind understanding
the Chinese would not be the computer, whether the computer is human or electronic. The person understanding
the Chinese would be a distinct person from the room operator, with beliefs and desires bestowed by the program
and its database. Hence SearleÆs failure to understand Chinese while operating the room does not show that
understanding is not being created.

Cole (1991) offers an additional argument that the mind doing the understanding is neither the mind of the room
operator nor the system consisting of the operator and the program: running a suitably structured computer
program might produce answers submitted in Chinese and also answers to questions submitted in Korean. Yet
the Chinese answers might apparently display completely different knowledge and memories, beliefs and desires
than the answers to the Korean questions û along with a denial that the Chinese answerer knows any Korean, and
vice versa. Thus the behavioral evidence would be that there were two non-identical minds (one understanding
Chinese only, and one understanding Korean only). Since these might have mutually exclusive properties, they
cannot be identical, and ipso facto, cannot be identical with the mind of the implementer in the room.
Alternatively, we can flesh out SearleÆs scenario by supposing those outside the room not only submit questions

https://plato.stanford.edu/entries/chinese-room/

10/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

in Chinese, but also in English. The result would appear to be that there are two individuals in the Room û Searle
answering questions about himself and what he believes to be the case, and a Chinese speaker with a different
personal history and knowledge of the world. Analogously, a video game might include a (virtual) character with
one set of cognitive abilities (smart, understands Chinese) as well as another virtual character with an
incompatible set (stupid, English monoglot). These inconsistent cognitive traits cannot be traits of the XBOX
system that realizes them. Cole argues that the implication is that minds and persons generally are more abstract
than the physical systems that realize them (see Mind and Body in the Larger Philosophical Issues section).

In short, the Virtual Mind argument is that since the evidence that Searle provides that there is no understanding
of Chinese was that he wouldnÆt understand Chinese in the room, the Chinese Room Argument cannot refute a
differently formulated equally strong AI claim, asserting the possibility of using a programmed digital computer
to create a distinct mind that understands a natural language. Maudlin (1989) says that Searle has not adequately
responded to this criticism.

Others however have replied to the VMR, including Stevan Harnad and mathematical physicist Roger Penrose.
Penrose is generally sympathetic to the points Searle raises with the Chinese Room argument, and has argued
against the Virtual Mind reply. Penrose does not believe that computational processes can account for
consciousness, both on Chinese Room grounds, as well as because of limitations on formal systems revealed by
Kurt G÷delÆs incompleteness proof. (Penrose has two books on mind and consciousness; Chalmers and others
have responded to PenroseÆs appeals to G÷del.) In his 2002 article ôConsciousness, Computation, and the
Chinese Roomö that specifically addresses the Chinese Room argument, Penrose argues that the Chinese Gym
variation û with a room expanded to the size of India, with Indians doing the processing û shows it is very
implausible to hold there is ôsome kind of disembodied æunderstandingÆ associated with the personÆs carrying out
of that algorithm, and whose presence does not impinge in any way upon his own consciousnessö (230û1).
Penrose concludes the Chinese Room argument refutes Strong AI. Christian Kaernbach (2005) reports that he
subjected the virtual mind theory to an empirical test, with negative results.

4.2 The Robot Reply

The Robot Reply concedes Searle is right about the Chinese Room scenario: it shows that a computer trapped in
a computer room cannot understand language, or know what words mean. The Robot reply is responsive to the
problem of knowing the meaning of the Chinese word for hamburger û SearleÆs example of something the room
operator would not know. It seems reasonable to hold that most of us know what a hamburger is because we
have seen one, and perhaps even made one, or tasted one, or at least heard people talk about hamburgers and
understood what they are by relating them to things we do know by seeing, making, and tasting. Given this is
how one might come to know what hamburgers are, the Robot Reply suggests that we put a digital computer in a
robot body, with sensors, such as video cameras and microphones, and add effectors, such as wheels to move
around with, and arms with which to manipulate things in the world. Such a robot û a computer with a body û
might do what a child does, learn by seeing and doing. The Robot Reply holds that such a digital computer in a
robot body, freed from the room, could attach meanings to symbols and actually understand natural language.
Margaret Boden, Tim Crane, Daniel Dennett, Jerry Fodor, Stevan Harnad, Hans Moravec and Georges Rey are
among those who have endorsed versions of this reply at one time or another. The Robot Reply in effect appeals
to ôwide contentö or ôexternalist semanticsö. This can agree with Searle that syntax and internal connections in
isolation from the world are insufficient for semantics, while holding that suitable causal connections with the
world can provide content to the internal symbols.

About the time Searle was pressing the CRA, many in philosophy of language and mind were recognizing the
importance of causal connections to the world as the source of meaning or reference for words and concepts.
Hilary Putnam 1981 argued that a Brain in a Vat, isolated from the world but with neurons connected to a
computer that generated a virtual world, might speak or think in a language that sounded like English, but it
would not be English û hence a brain in a vat could not wonder if it was a brain in a vat (because of its sensory
isolation, its words ôbrainö and ôvatö do not refer to brains or vats). The view that meaning was determined by
connections with the world became widespread. Searle however resisted this turn outward and continued to think
of meaning as subjective and connected with consciousness.

https://plato.stanford.edu/entries/chinese-room/

11/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

A related view that minds are best understood as embodied or embedded in the world has gained many
supporters since the 1990s, contra Cartesian solipsistic intuitions. Organisms rely on environmental features for
the success of their behavior. So whether one takes a mind to be a symbol processing system, with the symbols
getting their content from sensory connections with the world, or a non-symbolic system that succeeds by being
embedded in a particular environment, the importance of things outside the head have come to the fore. Hence
many are sympathetic to some form of the Robot Reply: a computational system might understand, provided it is
acting in the world. For example, Carter 2007 in a textbook on philosophy and AI concludes ôThe lesson to draw
from the Chinese Room thought experiment is that embodied experience is necessary for the development of
semantics.ö

However Searle does not think that the Robot Reply to the Chinese Room argument is any stronger than the
Systems Reply. All the sensors can do is provide additional input to the computer û and it will be just syntactic
input. We can see this by making a parallel change to the Chinese Room scenario. Suppose the man in the
Chinese Room receives, in addition to the Chinese characters slipped under the door, a stream of binary digits
that appear, say, on a ticker tape in a corner of the room. The instruction books are augmented to use the
numerals from the tape as input, along with the Chinese characters. Unbeknownst to the man in the room, the
symbols on the tape are the digitized output of a video camera (and possibly other sensors). Searle argues that
additional syntactic inputs will do nothing to allow the man to associate meanings with the Chinese characters. It
is just more work for the man in the room.

Jerry Fodor, Hilary Putnam, and David Lewis, were principal architects of the computational theory of mind that
SearleÆs wider argument attacks. In his original 1980 reply to Searle, Fodor allows Searle is certainly right that
ôinstantiating the same program as the brain does is not, in and of itself, sufficient for having those propositional
attitudes, e.g. beliefs, characteristic of the organism that has the brain.ö But Fodor holds that Searle is wrong
about the robot reply. A computer might have beliefs about, and knowledge of, the world if it has the right causal
connections to the world û but those are not ones mediated by a man sitting in the head of the robot. We donÆt
know what the right causal connections are. Searle commits the fallacy of inferring from ôthe little man is not
the right causal connectionö to conclude that no causal linkage would succeed. There is considerable empirical
evidence that mental processes involve ômanipulation of symbolsö; Searle gives us no alternative explanation
(this is sometimes called FodorÆs ôOnly Game in Townö argument for computational approaches). In the 1980s
and 1990s Fodor wrote extensively on what the connections must be between a brain state and the world for the
state to have intentional (representational) properties, while coming to emphasize that computationalism has
limits because the computations are intrinsically local and so cannot account for abductive reasoning, that is
inference to the best explanation.

In a later piece, ôYin and Yang in the Chinese Roomö (in Rosenthal 1991 pp.524û525), Fodor substantially
revises his 1980 view. He distances himself from his earlier version of the robot reply, and holds instead that
ôinstantiationö should be defined in such a way that the symbol must be the proximate cause of the effect û no
intervening guys in a room. So Searle in the room is not an instantiation of a Turing Machine, and ôSearleÆs
setup does not instantiate the machine that the brain instantiates.ö He concludes: ôàSearleÆs setup is irrelevant
to the claim that strong equivalence to a Chinese speakerÆs brain is ipso facto sufficient for speaking Chinese.ö
Searle says of FodorÆs move, ôOf all the zillions of criticisms of the Chinese Room argument, FodorÆs is perhaps
the most desperate. He claims that precisely because the man in the Chinese room sets out to implement the
steps in the computer program, he is not implementing the steps in the computer program. He offers no argument
for this extraordinary claim.ö (in Rosenthal 1991, p. 525)

In a 1986 paper, Georges Rey advocated a combination of the system and robot reply, after noting that the
original Turing Test is insufficient as a test of intelligence and understanding, and that the isolated system Searle
describes in the room is certainly not functionally equivalent to a real Chinese speaker sensing and acting in the
world. In a 2002 second look, ôSearleÆs Misunderstandings of Functionalism and Strong AIö, Rey again defends
functionalism against Searle, and in the particular form Rey calls the ôcomputational-representational theory of
thought û CRTTö. CRTT is not committed to attributing thought to just any system that passes the Turing Test
(like the Chinese Room). Nor is it committed to a conversation manual model of understanding natural language.
Rather, CRTT is concerned with intentionality, natural and artificial (the representations in the system are

https://plato.stanford.edu/entries/chinese-room/

12/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

semantically evaluable û they are true or false, hence have aboutness). Searle saddles functionalism with the
ôblackboxö character of behaviorism, but functionalism cares how things are done. Rey sketches ôa modest
mindö û a CRTT system that has perception, can make deductive and inductive inferences, makes decisions on
basis of goals and representations of how the world is, and can process natural language by converting to and
from its native representations. To explain the behavior of such a system we would need to use the same
attributions needed to explain the behavior of a normal Chinese speaker.

If we flesh out the Chinese conversation in the context of the Robot Reply, just as with the Virtual Mind Reply,
we may again see evidence that the entity that understands is not the operator inside the room. Suppose we ask
the robot system using the Chinese translation of ôwhat do you see?ö, we might get the answer ôMy old friend
Shakeyö, or ôI see you!ö. Whereas if we phone Searle in the room and ask the same questions in English we
might get ôThese same four wallsö or ôthese damn endless instruction books and notebooks.ö Again this is
evidence that we have distinct responders here, an English speaker and a Chinese speaker, who see and do quite
different things. If the giant robot goes on a rampage and smashes much of Tokyo, and all the while oblivious
Searle is just following the program in his notebooks in the room, Searle is not guilty of homicide and mayhem,
because he is not the agent committing the acts.

Tim Crane discusses the Chinese Room argument in his 1991 book, The Mechanical Mind. He cites the
ChurchlandsÆ 1990 luminous room analogy, but then goes on to argue that in the course of operating the room,
Searle would learn the meaning of the Chinese: ôàif Searle had not just memorized the rules and the data, but
also started acting in the world of Chinese people, then it is plausible that he would before too long come to
realize what these symbols mean.ö(127). (Rapaport 2006 presses an analogy between Helen Keller and the
Chinese Room.) Crane appears to end with a version of the Robot Reply: ôSearleÆs argument itself begs the
question by (in effect) just denying the central thesis of AI û that thinking is formal symbol manipulation. But
SearleÆs assumption, none the less, seems to me correct à the proper response to SearleÆs argument is: sure,
Searle-in-the-room, or the room alone, cannot understand Chinese. But if you let the outside world have some
impact on the room, meaning or æsemanticsÆ might begin to get a foothold. But of course, this concedes that
thinking cannot be simply symbol manipulation.ö (129) The idea that learning grounds understanding has led to
work in developmental robotics (a.k.a. epigenetic robotics). This AI research area seeks to replicate key human
learning abilities, such as robots that are shown an object from several angles while being told in natural
language the name of the object.

Margaret Boden 1988 also argues that Searle mistakenly supposes programs are pure syntax. But programs bring
about the activity of certain machines: ôThe inherent procedural consequences of any computer program give it a
toehold in semantics, where the semantics in question is not denotational, but causal.ö (250) Thus a robot might
have causal powers that enable it to refer to a hamburger.

Stevan Harnad also finds our sensory and motor capabilities to be important: ôWho is to say that the Turing Test,
whether conducted in Chinese or in any other language, could be successfully passed without operations that
draw on our sensory, motor, and other higher cognitive capacities as well? Where does the capacity to
comprehend Chinese begin and the rest of our mental competence leave off?ö Harnad believes that symbolic
functions must be grounded in ôroboticö functions that connect a system with the world. And he thinks this
counts against symbolic accounts of mentality, such as Jerry FodorÆs, and, one suspects, the approach of Roger
Schank that was SearleÆs original target. Harnad 2012 (Other Internet Resources) argues that the CRA shows that
even with a robot with symbols grounded in the external world, there is still something missing: feeling, such as
the feeling of understanding.

However Ziemke 2016 argues a robotic embodiment with layered systems of bodily regulation may ground
emotion and meaning, and Seligman 2019 argues that ôperceptually groundedö approaches to natural language
processing (NLP) have the ôpotential to display intentionality, and thus after all to foster a truly meaningful
semantics that, in the view of Searle and other skeptics, is intrinsically beyond computersÆ capacity.ö

4.3 The Brain Simulator Reply

https://plato.stanford.edu/entries/chinese-room/

13/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Consider a computer that operates in quite a different manner than an AI program with scripts and operations on
sentence-like strings of symbols. The Brain Simulator reply asks us to suppose instead the program parallels the
actual sequence of nerve firings that occur in the brain of a native Chinese language speaker when that person
understands Chinese û every nerve, every firing. Since the computer then works the very same way as the brain
of a native Chinese speaker, processing information in just the same way, it will understand Chinese. Paul and
Patricia Churchland have set out a reply along these lines, discussed below.

In response to this, Searle argues that it makes no difference. He suggests a variation on the brain simulator
scenario: suppose that in the room the man has a huge set of valves and water pipes, in the same arrangement as
the neurons in a native Chinese speakerÆs brain. The program now tells the man which valves to open in
response to input. Searle claims that it is obvious that there would be no understanding of Chinese. (Note
however that the basis for this claim is no longer simply that Searle himself wouldnÆt understand Chinese û it
seems clear that now he is just facilitating the causal operation of the system and so we rely on our Leibnizian
intuition that water-works donÆt understand (see also Maudlin 1989).) Searle concludes that a simulation of brain
activity is not the real thing.

However, following Pylyshyn 1980, Cole and Foelber 1984, and Chalmers 1996, we might wonder about
gradually transitioning cyborg systems. Pylyshyn writes:

If more and more of the cells in your brain were to be replaced by integrated circuit chips,
programmed in such a way as to keep the input-output function each unit identical to that of the unit
being replaced, you would in all likelihood just keep right on speaking exactly as you are doing now
except that you would eventually stop meaning anything by it. What we outside observers might
take to be words would become for you just certain noises that circuits caused you to make.

These cyborgization thought experiments can be linked to the Chinese Room. Suppose Otto has a neural disease
that causes one of the neurons in his brain to fail, but surgeons install a tiny remotely controlled artificial neuron,
a synron, alongside his disabled neuron. The control of OttoÆs artificial neuron is by John Searle in the Chinese
Room, unbeknownst to both Searle and Otto. Tiny wires connect the artificial neuron to the synapses on the cell-
body of his disabled neuron. When his artificial neuron is stimulated by neurons that synapse on his disabled
neuron, a light goes on in the Chinese Room. Searle then manipulates some valves and switches in accord with a
program. That, via the radio link, causes OttoÆs artificial neuron to release neuro-transmitters from its tiny
artificial vesicles. If SearleÆs programmed activity causes OttoÆs artificial neuron to behave just as his disabled
natural neuron once did, the behavior of the rest of his nervous system will be unchanged. Alas, OttoÆs disease
progresses; more neurons are replaced by synrons controlled by Searle. Ex hypothesi the rest of the world will
not notice the difference; will Otto? If so, when? And why?

Under the rubric ôThe Combination Replyö, Searle also considers a system with the features of all three of the
preceding: a robot with a digital brain simulating computer in its aluminum cranium, such that the system as a
whole behaves indistinguishably from a human. Since the normal input to the brain is from sense organs, it is
natural to suppose that most advocates of the Brain Simulator Reply have in mind such a combination of brain
simulation, Robot, and Systems or Virtual Mind Reply. Some (e.g. Rey 1986) argue it is reasonable to attribute
intentionality to such a system as a whole. Searle agrees that it would indeed be reasonable to attribute
understanding to such an android system û but only as long as you donÆt know how it works. As soon as you
know the truth û it is a computer, uncomprehendingly manipulating symbols on the basis of syntax, not meaning
û you would cease to attribute intentionality to it.

(One assumes this would be true even if it were oneÆs spouse, with whom one had built a life-long relationship,
that was revealed to hide a silicon secret. Science fiction stories, including episodes of Rod SerlingÆs television
series The Twilight Zone, have been based on such possibilities (the face of the beloved peels away to reveal the
awful android truth); however, Steven Pinker (1997) mentions one episode in which the androidÆs secret was
known from the start, but the protagonist still developed a romantic relationship with the android.)

On its tenth anniversary the Chinese Room argument was featured in the general science periodical Scientific
American. Leading the opposition to SearleÆs lead article in that issue were philosophers Paul and Patricia

https://plato.stanford.edu/entries/chinese-room/

14/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Churchland. The Churchlands agree with Searle that the Chinese Room does not understand Chinese, but hold
that the argument itself exploits our ignorance of cognitive and semantic phenomena. They raise a parallel case
of ôThe Luminous Roomö where someone waves a magnet and argues that the absence of resulting visible light
shows that MaxwellÆs electromagnetic theory is false. The Churchlands advocate a view of the brain as a
connectionist system, a vector transformer, not a system manipulating symbols according to syntax-sensitive
rules. The system in the Chinese Room uses the wrong computational strategies. Thus they agree with Searle
against traditional AI, but they presumably would endorse what Searle calls ôthe Brain Simulator Replyö,
arguing that, as with the Luminous Room, our intuitions fail us when considering such a complex system, and it
is a fallacy to move from part to whole: ôà no neuron in my brain understands English, although my whole
brain does.ö

In his 1991 book, Microcognition. Andy Clark holds that Searle is right that a computer running SchankÆs
program does not know anything about restaurants, ôat least if by æknowÆ we mean anything like æunderstandÆö.
But Searle thinks that this would apply to any computational model, while Clark, like the Churchlands, holds
that Searle is wrong about connectionist models. ClarkÆs interest is thus in the brain-simulator reply. The brain
thinks in virtue of its physical properties. What physical properties of the brain are important? Clark answers that
what is important about brains are ôvariable and flexible substructuresö which syntactic, rule-based systems like
SchankÆs (æGOFAIÆ, or Good Old-Fashioned AI) lack. But that doesnÆt mean computationalism or functionalism
is false. It depends on what level you take the functional units to be. Clark defends ômicrofunctionalismö û one
should look to a fine-grained functional description, e.g. neural net level. Clark cites William Lycan approvingly
contra BlockÆs absent qualia objection û yes, there can be absent qualia, if the functional units are made large.
But that does not constitute a refutation of functionalism generally. So ClarkÆs views are not unlike the
ChurchlandsÆ, conceding that Searle is right about Schank and symbolic-level processing systems, but holding
that he is mistaken about connectionist systems.

Similarly Ray Kurzweil (2002) argues that SearleÆs argument could be turned around to show that human brains
cannot understand û the brain succeeds by manipulating neurotransmitter concentrations and other mechanisms
that are in themselves meaningless. In criticism of SearleÆs response to the Brain Simulator Reply, Kurzweil
says: ôSo if we scale up SearleÆs Chinese Room to be the rather massive æroomÆ it needs to be, whoÆs to say that
the entire system of a hundred trillion people simulating a Chinese Brain that knows Chinese isnÆt conscious?
Certainly, it would be correct to say that such a system knows Chinese. And we canÆt say that it is not conscious
anymore than we can say that about any other process. We canÆt know the subjective experience of another
entityà.ö

4.4 The Other Minds Reply

Related to the preceding is The Other Minds Reply: ôHow do you know that other people understand Chinese or
anything else? Only by their behavior. Now the computer can pass the behavioral tests as well as they can (in
principle), so if you are going to attribute cognition to other people you must in principle also attribute it to
computers.ö

SearleÆs (1980) reply to this is very short:

The problem in this discussion is not about how I know that other people have cognitive states, but
rather what it is that I am attributing to them when I attribute cognitive states to them. The thrust of
the argument is that it couldnÆt be just computational processes and their output because the
computational processes and their output can exist without the cognitive state. It is no answer to this
argument to feign anesthesia. In æcognitive sciencesÆ one presupposes the reality and knowability of
the mental in the same way that in physical sciences one has to presuppose the reality and
knowability of physical objects.

Critics of SearleÆs claim here argue that if the evidence we have that humans understand is the same as the
evidence we might have that a visiting extra-terrestrial alien understands, which is the same as the evidence that
a robot understands, the presuppositions we may make in the case of our own species are not relevant, for

https://plato.stanford.edu/entries/chinese-room/

15/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

presuppositions are sometimes false. For similar reasons, Turing, in proposing the Turing Test, is specifically
worried about our presuppositions and chauvinism. If the reasons for the presuppositions regarding humans are
pragmatic, in that they enable us to predict the behavior of humans and to interact effectively with them, perhaps
the presupposition could apply equally to computers (similar considerations are pressed by Dennett, in his
discussions of what he calls the Intentional Stance).

Searle raises the question of just what we are attributing in attributing understanding to other minds, saying that
it is more than complex behavioral dispositions. For Searle, understanding appears to involve states of
consciousness, as is seen in his 2010 summary of the CRA conclusions. Terry Horgan (2013) endorses this
claim: ôthe real moral of SearleÆs Chinese room thought experiment is that genuine original intentionality
requires the presence of internal states with intrinsic phenomenal character that is inherently intentionalàö But
this tying of understanding to phenomenal consciousness raises a host of issues.

We attribute limited understanding of language to toddlers, dogs, and other animals, but it is not clear that we are
ipso facto attributing unseen states of subjective consciousness û what do we know of the hidden states of exotic
creatures? Ludwig Wittgenstein (the Private Language Argument) and his followers pressed similar points.
Altered qualia possibilities, analogous to the inverted spectrum, arise: suppose I ask ôwhatÆs the sum of 5 and 7ö
and you respond ôthe sum of 5 and 7 is 12ö, but as you heard my question you had the conscious experience of
hearing and understanding ôwhat is the sum of 10 and 14ö, though you were in the computational states
appropriate for producing the correct sum and so said ô12ö. Are there certain conscious states that are ôcorrectö
for certain functional states? WittgensteinÆs considerations appear to be that the subjective state is irrelevant, at
best epiphenomenal, if a language user displays appropriate linguistic behavior. Afterall, we are taught language
on the basis of our overt responses, not our qualia or states of consciousness. The mathematical savant Daniel
Tammet reports that when he generates the decimal expansion of pi to thousands of digits he experiences colors
that reveal the next digit, but even here it may be that TennantÆs performance is likely not produced by the colors
he experiences, but rather by unconscious neural computation that produces both the correct answer and the
color he experiences. The possible importance of subjective states is further considered in the section on
Intentionality, below.

Since the CRA there has been philosophical interest in another other-minds problem, namely the possibility of
zombies û creatures that look like and behave just as normal humans, including linguistic behavior, yet have no
subjective consciousness. A difficulty for claiming that subjective states of consciousness are crucial for
understanding meaning will arise in these cases of absent qualia: we canÆt tell the difference between zombies
and non-zombies, and so on SearleÆs account we canÆt tell the difference between those that really understand
English and those that donÆt. And if you and I canÆt tell the difference between those who understand language
and Zombies who behave like they do but donÆt really, than neither can any selection factor in the history of
human evolution û for predators, mates, fellow tribe members, zombies and true understanders, with the ôrightö
conscious experience, have been indistinguishable. But then there appears to be a distinction without a
difference. In any case, SearleÆs short reply to the Other Minds Reply may be too short.

Descartes famously argued that speech was sufficient for attributing minds and consciousness to others, and
infamously argued that it was necessary. Turing was in effect endorsing DescartesÆ sufficiency condition, at least
for intelligence, while substituting written for oral linguistic behavior. Since most of us use dialog as a sufficient
condition for attributing understanding, SearleÆs argument, which holds that speech is a sufficient condition for
attributing understanding to humans but not for anything that doesnÆt share our biology, an account would appear
to be required of what additionally is being attributed, and what can justify the additional attribution. Further, if
being con-specific is key on SearleÆs account, a natural question arises as to what circumstances would justify us
in attributing understanding (or consciousness) to extra-terrestrial aliens who do not share our biology?
Offending ETÆs by withholding attributions of understanding until after doing a brain scan or post-mortem may
be risky.

Hans Moravec, director of the Robotics laboratory at Carnegie Mellon University, and author of Robot: Mere
Machine to Transcendent Mind, argues that SearleÆs position merely reflects intuitions from traditional
philosophy of mind that are out of step with the new cognitive science. Moravec endorses a version of the Other
Minds reply. It makes sense to attribute intentionality to machines for the same reasons it makes sense to

https://plato.stanford.edu/entries/chinese-room/

16/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

attribute them to humans; his ôinterpretative positionö is similar to DennettÆs view. Moravec goes on to note that
one of the things we attribute to others is the ability to make attributions of intentionality, and then we make such
attributions to ourselves. He holds that such self-representation is at the heart of consciousness. These capacities
appear to be implementation independent, and hence possible for aliens and suitably programmed computers.

As we have seen, the reason that Searle thinks we can disregard the behavioral evidence in the case of robots and
computers is that we know that their processing is syntactic, and this fact trumps all other considerations. Indeed,
Searle believes this is the larger point that the Chinese Room merely illustrates. This larger point is addressed in
the Syntax and Semantics section below.

4.5 The Intuition Reply

Many responses to the Chinese Room argument have noted that, as with LeibnizÆ Mill, the argument appears to
be based on intuition: the intuition that a computer (or the man in the room) cannot think or have understanding.
For example, Ned Block (1980) in his original BBS commentary says ôSearleÆs argument depends for its force
on intuitions that certain entities do not think.ö But, Block argues, (1) intuitions sometimes can and should be
trumped and (2) perhaps we need to bring our concept of understanding in line with a reality in which certain
computer robots belong to the same natural kind as humans. Similarly Margaret Boden (1988) points out that we
canÆt trust our untutored intuitions about how mind depends on matter; developments in science may change our
intuitions. Indeed, elimination of bias in our intuitions was precisely what motivated Turing (1950) to propose
the Turing Test, a test that was blind to the physical character of the system replying to questions. Some of
SearleÆs critics in effect argue that he has merely pushed the reliance on intuition back, into the room.

For example, one can hold that despite SearleÆs intuition that he would not understand Chinese while in the
room, perhaps he is mistaken and does, albeit unconsciously. Hauser (2002) accuses Searle of Cartesian bias in
his inference from ôit seems to me quite obvious that I understand nothingö to the conclusion that I really
understand nothing. (From ôI can really clearly imagine myself existing without my bodyö, Descartes unsoundly
inferred ôI can exist without my body.ö) Normally, if one understands English or Chinese, one knows that one
does û but not necessarily. The man in the Chinese Room might lack the normal introspective awareness of
understanding û but this, while abnormal, does not support the conclusion that he does not understand.

Critics of the CRA note that our intuitions about intelligence, understanding and meaning may all be unreliable.
With regard to meaning, Wakefield 2003, following Block 1998, defends what Wakefield calls ôthe essentialist
objectionö to the CRA, namely that a computational account of meaning is not analysis of ordinary concepts and
their related intuitions. Rather we are building a scientific theory of meaning that may require revising our
intuitions. As a theory, it gets its evidence from its explanatory power, not its accord with pre-theoretic intuitions
(however Wakefield himself argues that computational accounts of meaning are afflicted by a pernicious
indeterminacy (pp. 308ff)).

Other critics focusing on the role of intuitions in the CRA argue that our intuitions regarding both intelligence
and understanding may also be unreliable, and perhaps incompatible even with current science. With regard to
understanding, Steven Pinker, in How the Mind Works (1997), holds that ôà Searle is merely exploring facts
about the English word understandà. People are reluctant to use the word unless certain stereotypical
conditions applyàö But, Pinker claims, nothing scientifically speaking is at stake. Pinker objects to SearleÆs
appeal to the ôcausal powers of the brainö by noting that the apparent locus of the causal powers is the ôpatterns
of interconnectivity that carry out the right information processingö. Pinker ends his discussion by citing a
science fiction story in which Aliens, anatomically quite unlike humans, cannot believe that humans can really
think once they discover that our heads are filled with meat. The AliensÆ intuitions are unreliable û presumably
ours may be so as well.

Clearly the CRA turns on what is required to understand language. Schank 1978 clarifies his claim about what he
thinks his programs can do: ôBy æunderstandÆ, we mean SAM [one of his programs] can create a linked causal
chain of conceptualizations that represent what took place in each story.ö This is a nuanced understanding of
ôunderstandingö, whereas the Chinese Room thought experiment does not turn on a technical understanding of

https://plato.stanford.edu/entries/chinese-room/

17/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

ôunderstandingö, but rather intuitions about our ordinary competence when we understand a word like
ôhamburgerö. Indeed by 2015 Schank distances himself from weak senses of ôunderstandö, holding that no
computer can ôunderstand when you tell it somethingö, and that IBMÆs WATSON ôdoesnÆt know what it is
sayingö. SchankÆs program may get links right, but arguably does not know what the linked entities are. Whether
it does or not depends on what concepts are, see section 5.1. Furthermore it is possible that when it comes to
attributing understanding of language we have different standards for different things û more relaxed for dogs
and toddlers. Some things understand a language ôun pocoö. Searle (1980)concedes that there are degrees of
understanding, but says that all that matters that there are clear cases of no understanding, and AI programs are
an example: ôThe computer understanding is not just (like my understanding of German) partial or incomplete; it
is zero.ö

Some defenders of AI are also concerned with how our understanding of understanding bears on the Chinese
Room argument. In their paper ôA Chinese Room that Understandsö AI researchers Simon and Eisenstadt (2002)
argue that whereas Searle refutes ôlogical strong AIö, the thesis that a program that passes the Turing Test will
necessarily understand, SearleÆs argument does not impugn ôEmpirical Strong AIö û the thesis that it is possible
to program a computer that convincingly satisfies ordinary criteria of understanding. They hold however that it is
impossible to settle these questions ôwithout employing a definition of the term æunderstandÆ that can provide a
test for judging whether the hypothesis is true or falseö. They cite W.V.O. QuineÆs Word and Object as showing
that there is always empirical uncertainty in attributing understanding to humans. The Chinese Room is a Clever
Hans trick (Clever Hans was a horse who appeared to clomp out the answers to simple arithmetic questions, but
it was discovered that Hans could detect unconscious cues from his trainer). Similarly, the man in the room
doesnÆt understand Chinese, and could be exposed by watching him closely. (Simon and Eisenstadt do not
explain just how this would be done, or how it would affect the argument.) Citing the work of Rudolf Carnap,
Simon and Eisenstadt argue that to understand is not just to exhibit certain behavior, but to use ôintensionsö that
determine extensions, and that one can see in actual programs that they do use appropriate intensions. They
discuss three actual AI programs, and defend various attributions of mentality to them, including understanding,
and conclude that computers understand; they learn ôintensions by associating words and other linguistic
structure with their denotations, as detected through sensory stimuliö. And since we can see exactly how the
machines work, ôit is, in fact, easier to establish that a machine exhibits understanding that to establish that a
human exhibits understandingà.ö Thus, they conclude, the evidence for empirical strong AI is overwhelming.

Similarly, Daniel Dennett in his original 1980 response to SearleÆs argument called it ôan intuition pumpö, a term
he came up with in discussing the CRA with Douglas Hofstader. Sharvy 1983 echoes the complaint. DennettÆs
considered view (2013) is that the CRA is ôclearly a fallacious and misleading argument à.ö (p. 320). Paul
Thagard (2013) proposes that for every thought experiment in philosophy there is an equal and opposite thought
experiment. Thagard holds that intuitions are unreliable, and the CRA is an example (and that in fact the CRA
has now been refuted by the technology of autonomous robotic cars). Dennett has elaborated on concerns about
our intuitions regarding intelligence. Dennett 1987 (ôFast Thinkingö) expressed concerns about the slow speed at
which the Chinese Room would operate, and he has been joined by several other commentators, including Tim
Maudlin, David Chalmers, and Steven Pinker. The operator of the Chinese Room may eventually produce
appropriate answers to Chinese questions. But slow thinkers are stupid, not intelligent û and in the wild, they
may well end up dead. Dennett argues that ôspeed à is æof the essenceÆ for intelligence. If you canÆt figure out
the relevant portions of the changing environment fast enough to fend for yourself, you are not practically
intelligent, however complex you areö (326). Thus Dennett relativizes intelligence to processing speed relative to
current environment.

Tim Maudlin (1989) disagrees. Maudlin considers the time-scale problem pointed to by other writers, and
concludes, contra Dennett, that the extreme slowness of a computational system does not violate any necessary
conditions on thinking or consciousness. Furthermore, SearleÆs main claim is about understanding, not
intelligence or being quick-witted. If we were to encounter extra-terrestrials that could process information a
thousand times more quickly than we do, it seems that would show nothing about our own slow-poke ability to
understand the languages we speak.

https://plato.stanford.edu/entries/chinese-room/

18/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Steven Pinker (1997) also holds that Searle relies on untutored intuitions. Pinker endorses the ChurchlandsÆ
(1990) counterexample of an analogous thought experiment of waving a magnet and not generating light, noting
that this outcome would not disprove MaxwellÆs theory that light consists of electromagnetic waves. Pinker
holds that the key issue is speed: ôThe thought experiment slows down the waves to a range to which we humans
no longer see them as light. By trusting our intuitions in the thought experiment, we falsely conclude that rapid
waves cannot be light either. Similarly, Searle has slowed down the mental computations to a range in which we
humans no longer think of it as understanding (since understanding is ordinarily much faster)ö (94û95). Howard
Gardiner, a supporter of SearleÆs conclusions regarding the room, makes a similar point about understanding.
Gardiner addresses the Chinese Room argument in his book The MindÆs New Science (1985, 171û177). Gardiner
considers all the standard replies to the Chinese Room argument and concludes that Searle is correct about the
room: ôàthe word understand has been unduly stretched in the case of the Chinese room à.ö (175).

Thus several in this group of critics argue that speed affects our willingness to attribute intelligence and
understanding to a slow system, such as that in the Chinese Room. The result may simply be that our intuitions
regarding the Chinese Room are unreliable, and thus the man in the room, in implementing the program, may
understand Chinese despite intuitions to the contrary (Maudlin and Pinker). Or it may be that the slowness marks
a crucial difference between the simulation in the room and what a fast computer does, such that the man is not
intelligent while the computer system is (Dennett).

4.6 Advances in Artificial Intelligence

Even as late as 2001, Robert Damper [2001, Other Internet Resources) dismissed the CRA as useless, and
possibly harmful, because ôWhat Searle and others seem ready blithely to assume û the existence of a Chinese
æunderstandingÆ program able to pass the Turing test à û is so far beyond the current capabilities of AI and
computer technology as to amount to science fiction. What could we possibly learn from such a fanciful
conception? There is no realistic way of resolving any paradoxes which arise, save appeals to common sense,
and we know from the example of quantum mechanics how fallible this is.ö And in 2015 Steven Pinker
remarked ôHuman-level AI is still the standard 15-to-25 years away, just as it always has beenà.ö

SearleÆs argument was developed in the late 1970s, little more than 20 years after transistorized computers were
introduced, as well as the first AI conference (1956). In the many decades since then, there have been enormous
advances in areas relevant to the CRA and many of the replies: computing speed and power, robotics, artificial
intelligence, neural networks, and to the point, natural language processing.

In late 2022, AI systems based on large language models (LLMs) received wide attention, from academics to
their essay-writing students, as well as many other professions in which language proficiency was important.
Whereas ShankÆs program and database were hand-built, so that, (once debugged!) their highly limited output of
a sentence or two about restaurants could rarely, if ever, surprise the programmers, LLM systems crawl the
world wide web and can generate paragraph after paragraph that may be all news to their coders.

Does this make any difference to the CRA and its replies? Sabine Hossenfelder (2023) argues that these chatbots
understand some of what they say, namely they understand in the same sense that humans understand quantum
mechanics. We can understand the equations well enough to make predictions, but we do not have a deep
understanding of why the equations are what they are. Jensen Huang (2024 [Other Internet Resources]), CEO of
AI chip maker Nvidia, see no such limits: ôGenerative AI is the most impactful invention of our time, and as
with electricity and the internet, it impacts everyone and every industry. à LLMs, learned to understand human
language, prior knowledge, and even some common sense from massive amounts of text.ö

There is no doubt that AI agents now have a way with words, and can present useful information. If those
models can diagnose disease better than diagnosticians, write essays better than essayists, argue law better than
lawyers, and answer questions better than teachers, then it appears to be sad sour grapes to say ôbut they donÆt
understand anythingö. So has AI progress refuted Searle? Asked in 2024 ôDo you understand English wordsö,
ChatGPT itself responds ôYes, I understand English words and can process and respond to them. If you have any
questions or need help with something specific, just let me know!ö It is loquacious if asked what a hamburger is,

https://plato.stanford.edu/entries/chinese-room/

19/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

SearleÆs example of something a natural language program cannot understand. It readily explains the difference
between a hamburger and the word ôhamburgerö. But when pressed, and asked HOW it understands English,
ChatGPT responds ôI understand English semantics through a combination of patterns and context.ö When asked
directly, ôJohn Searle argues you cannot get semantics from syntax û is he correct?ö the response is ôSearleÆs
argument highlights a crucial limitation: syntax alone is insufficient for fully capturing semantics. While
syntactic rules provide a framework for constructing sentences, understanding meaning involves additional
layers of context, interpretation, and often real-world knowledge.ö And to ôDoesnÆt SearleÆs argument apply to
ChatGPT?ö we get ôYes, John SearleÆs argument does apply to systems like ChatGPT. à ChatGPT uses patterns
and rules from the vast amounts of text it has been trained on to generate responses. It operates based on
statistical correlations between words and phrases, mimicking syntactic structures. à ChatGPT doesnÆt truly
understand meaning in the human sense. It generates text that appears to be meaningful based on the patterns it
has learned, but it lacks genuine comprehension of the content or context beyond what it has been trained to
predict.ö

So, paradoxically, the system appears to understand that it doesnÆt understand. However it fails to notice that
these claims are inconsistent with its output made just minutes before. So we are not there yet. A system that
answers questions with carefully argued denials that it can understand anything is not going to pass the Turing
Test. However this may get fixed in the future, such that LLM systems will avoid what has been called
ôlocutionary suicideö (e.g. ôHereÆs the answer to your question, but I donÆt understand your questionö). The
consequence may be that if systems that use language just as proficiently as humans in all contexts are argued by
a thought experiment to not really understand, then we canÆt test for ôrealö understanding, and it adds nothing to
the purposes for which we use language. ôReallyö understanding becomes epiphenomenal: undetectable,
causally inert, and irrelevant.

5. The Larger Philosophical Issues

5.1 Syntax and Semantics

Searle believes the Chinese Room thought experiment supports a larger point, which explains the failure of the
Chinese Room to produce understanding. Searle argued that programs implemented by computers are just
syntactical. Computer operations are ôformalö in that they respond only to the physical form of the strings of
symbols, not to the meaning of the symbols. Minds on the other hand have states with meaning, mental contents.
We associate meanings with the words or signs in language. We respond to signs because of their meaning, not
just their physical appearance. In short, we understand. But, and according to Searle this is the key point,
ôSyntax is not by itself sufficient for, nor constitutive of, semantics.ö So although computers may be able to
manipulate syntax to produce appropriate responses to natural language input, they do not understand the
sentences they receive or output, for they cannot associate meanings with the words.

Searle (1984) presents a three premise argument that because syntax is not sufficient for semantics, programs
cannot produce minds.

1. Programs are purely formal (syntactic).
2. Human minds have mental contents (semantics).
3. Syntax by itself is neither constitutive of, nor sufficient for, semantic content.
4. Therefore, programs by themselves are not constitutive of nor sufficient for minds.

The Chinese Room thought experiment itself is the support for the third premise. The claim that syntactic
manipulation is not sufficient for meaning or thought is a significant issue, with wider implications than AI, or
attributions of understanding. Prominent theories of mind hold that human cognition generally is computational.
In one form, it is held that thought involves operations on symbols in virtue of their physical properties. On an
alternative connectionist account, the computations are on ôsubsymbolicö states. If Searle is right, not only
Strong AI but also these main approaches to understanding human cognition are misguided.

https://plato.stanford.edu/entries/chinese-room/

20/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

As we have seen, Searle holds that the Chinese Room scenario shows that one cannot get semantics from syntax
alone. In a symbolic logic system, a kind of artificial language, rules are given for syntax. A semantics, if any,
comes later. The logician first specifies the basic symbol set and some rules for manipulating strings to produce
new ones (ôwell-formed fomulasö). These rules are purely syntactic û they are applied to strings of symbols
solely in virtue of their syntax or form. A semantics, if any, for the symbol system must be provided separately.
And if one wishes to show that interesting additional relationships hold between the syntactic operations and
semantics, such as that the symbol manipulations preserve truth, one must provide somewhat complex meta-
proofs to show this. So on the face of it, semantics is quite independent of syntax for artificial languages, and
one cannot get semantics from syntax alone. ôFormal symbols by themselves can never be enough for mental
contents, because the symbols, by definition, have no meaning (or interpretation, or semantics) except insofar as
someone outside the system gives it to themö (Searle 1989, 45).

SearleÆs identification of meaning with interpretation in this passage is important. SearleÆs point is clearly true of
the causally inert formal systems of logicians. A semantic interpretation has to be given to those symbols by a
logician. When we move from formal systems to computational systems, the situation is more complex. As many
of SearleÆs critics (e.g. Cole 1984, Dennett 1987, Boden 1988, and Chalmers 1996) have noted, a computer
running a program is not the same as ôsyntax aloneö. A computer is an enormously complex electronic causal
system (some now have transistor counts that are comparable to the number of neurons in a human brain). State
changes in the system are physical. One can interpret the physical states, e.g. voltages, as syntactic 1Æs and 0Æs,
but the intrinsic reality is electronic and syntax is ôderivedö, a product of someone elseÆs interpretation. The
states are syntactically specified by programmers, but when implemented in a running machine they are
electronic states of a complex causal system directly or indirectly embedded in the real world. This is quite
different from the abstract formal systems that logicians study. Dennett notes that no ôcomputer program by
itselfö (SearleÆs language) û e.g. a program lying on a shelf û can cause anything, even simple addition, let alone
mental states. The program must be running. Chalmers (1996) offers a parody in which it is reasoned that recipes
are syntactic, syntax is not sufficient for crumbliness, cakes are crumbly, so implementation of a recipe is not
sufficient for making a cake. Implementation makes all the difference; an abstract entity (recipe, program)
determines the causal powers of a physical system embedded in the larger causal nexus of the world.

Dennett (1987) sums up the issue: ôSearleÆs view, then, comes to this: take a material object (any material object)
that does not have the power of causing mental phenomena; you cannot turn it in to an object that does have the
power of producing mental phenomena simply by programming it û reorganizing the conditional dependencies
of transitions between its states.ö DennettÆs view is the opposite: programming ôis precisely what could give
something a mindö. But Dennett claims that in fact it is ôempirically unlikely that the right sorts of programs can
be run on anything but organic, human brainsö (325û6).

A computer does not recognize that its binary data strings have a certain form, and thus that certain syntactic
rules may be applied to them, unlike the man inside the Chinese Room. Inside a computer, there is nothing that
literally reads input data, or that ôknowsö what symbols are. Instead, there are millions of transistors that change
states. A sequence of voltages causes operations to be performed. We humans may choose to interpret these
voltages as binary numerals and the voltage changes as syntactic operations, but a computer does not interpret its
operations as syntactic or any other way. So perhaps a computer does not need to make the move from syntax to
semantics that Searle objects to; it needs to move from complex causal connections to semantics. Furthermore,
perhaps any causal system is describable as performing syntactic operations û if we interpret a light square as
logical ô0ö and a dark square as logical ô1ö, then a kitchen toaster may be described as a device that rewrites
logical ô0ös as logical ô1ös. But there is no philosophical problem about getting from syntax to breakfast.

In the 1990s, Searle began to use considerations related to these to argue that computational views are not just
false, but lack a clear sense. Computation, or syntax, is ôobserver-relativeö, not an intrinsic feature of reality: ôà
you can assign a computational interpretation to anythingö (Searle 2002b, p. 17), even the molecules in the paint
on the wall. Since nothing is intrinsically computational, one cannot have a scientific theory that reduces the
mental, which is not observer-relative, to computation, which is. ôComputation exists only relative to some agent
or observer who imposes a computational interpretation on some phenomenon. This is an obvious point. I should
have seen it ten years ago, but I did not.ö (Searle 2002b, p.17, originally published 1993).

https://plato.stanford.edu/entries/chinese-room/

21/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Critics note that walls are not computers; unlike a wall, a computer goes through state-transitions that are
counterfactually described by a program (Chalmers 1996, Block 2002, Haugeland 2002). In his 2002 paper,
Block addresses the question of whether a wall is a computer (in reply to SearleÆs charge that anything that maps
onto a formal system is a formal system, whereas minds are quite different). Block denies that whether or not
something is a computer depends entirely on our interpretation. Block notes that Searle ignores the
counterfactuals that must be true of an implementing system. Haugeland (2002) makes the similar point that an
implementation will be a causal process that reliably carries out the operations û and they must be the right
causal powers. Block concludes that SearleÆs arguments fail, but he concedes that they ôdo succeed in sharpening
our understanding of the nature of intentionality and its relation to computation and representationö (78).

Rey (2002) also addresses SearleÆs arguments that syntax and symbols are observer-relative properties, not
physical. Searle infers this from the fact that syntactic properties (e.g. being a logical ô1ö) are not defined in
physics; however Rey holds that it does not follow that they are observer-relative. Rey argues that Searle also
misunderstands what it is to realize a program. Rey endorses ChalmersÆ reply to Putnam: a realization is not just
a structural mapping, but involves causation, supporting counterfactuals. ôThis point is missed so often, it bears
repeating: the syntactically specifiable objects over which computations are defined can and standardly do
possess a semantics; itÆs just that the semantics is not involved in the specification.ö States of a person have their
semantics in virtue of computational organization and their causal relations to the world. Rey concludes: Searle
ôsimply does not consider the substantial resources of functionalism and Strong AI.ö (222) A plausibly detailed
story would defuse negative conclusions drawn from the superficial sketch of the system in the Chinese Room.

John Haugeland (2002) argues that there is a sense in which a processor must intrinsically understand the
commands in the programs it runs: it executes them in accord with the specifications. ôThe only way that we can
make sense of a computer as executing a program is by understanding its processor as responding to the program
prescriptions as meaningfulö (385). Thus operation symbols have meaning to a system. Haugeland goes on to
draw a distinction between narrow and wide system. He argues that data can have semantics in the wide system
that includes representations of external objects produced by transducers. In passing, Haugeland makes the
unusual claim, argued for elsewhere, that genuine intelligence and semantics presuppose ôthe capacity for a kind
of commitment in how one livesö which is non-propositional û that is, love (compare Steven SpielbergÆs 2001
film Artificial Intelligence: AI).

To SearleÆs claim that syntax is observer-relative, that the molecules in a wall might be interpreted as
implementing the Wordstar program (an early word processing program) because ôthere is some pattern in the
molecule movements which is isomorphic with the formal structure of Wordstarö (Searle 1990b, p. 27),
Haugeland counters that ôthe very idea of a complex syntactical token à presupposes specified processes of
writing and readingà.ö The tokens must be systematically producible and retrievable. So no random
isomorphism or pattern somewhere (e.g. on some wall) is going to count, and hence syntax is not observer-
relative.

With regard to the question of whether one can get semantics from syntax, William Rapaport has for many years
argued for ôsyntactic semanticsö, a view in which understanding is a special form of syntactic structure in which
symbols (such as Chinese words) are linked to concepts, themselves represented syntactically. Others believe we
are not there yet. AI futurist (The Age of Spiritual Machines) Ray Kurzweil holds in a 2002 follow-up book that
it is red herring to focus on traditional symbol-manipulating computers. Kurzweil agrees with Searle that
existent computers do not understand language û as evidenced by the fact that they canÆt engage in convincing
dialog. But that failure does not bear on the capacity of future computers based on different technology.
Kurzweil claims that Searle fails to understand that future machines will use ôchaotic emergent methods that are
massively parallelö. This claim appears to be similar to that of connectionists, such as Andy Clark, and the
position taken by the Churchlands in their 1990 Scientific American article.

Apart from HaugelandÆs claim that processors understand program instructions, SearleÆs critics can agree that
computers no more understand syntax than they understand semantics, although, like all causal engines, a
computer has syntactic descriptions. And while it is often useful to programmers to treat the machine as if it
performed syntactic operations, it is not always so: sometimes the characters programmers use are just switches
that make the machine do something, for example, make a given pixel on the computer display turn red, or make

https://plato.stanford.edu/entries/chinese-room/

22/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

a car transmission shift gears. Thus it is not clear that Searle is correct when he says a digital computer is just ôa
device which manipulates symbolsö. Computers are complex causal engines, and syntactic descriptions are
useful in order to structure the causal interconnections in the machine. AI programmers face many tough
problems, but one can hold that they do not have to get semantics from syntax. If they are to get semantics, they
must get it from causality.

Two main approaches have developed that explain meaning in terms of causal connections. The internalist
approaches, such as SchankÆs and RapaportÆs conceptual representation approaches, and also Conceptual Role
Semantics, hold that a state of a physical system gets its semantics from causal connections to other states of the
same system. Thus a state of a computer might represent ôkiwiö because it is connected to ôbirdö and ôflightlessö
nodes, and perhaps also to images of prototypical kiwis. The state that represents the property of being
ôflightlessö might get its content from a Negation-operator modifying a representation of ôcapable of airborne
self-propulsionö, and so forth, to form a vast connected conceptual network, a kind of mental dictionary.

Externalist approaches developed by Dennis Stampe, Fred Dretske, Hilary Putnam, Jerry Fodor, Ruth Millikan,
and others, hold that states of a physical system get their content through causal connections to the external
reality they represent. Thus, roughly, a system with a KIWI concept is a system that has a state it uses to
represent the presence of kiwis in the external environment. This kiwi-representing state will be a state that is
appropriately causally connected to the presence of kiwis. Depending on the system, the kiwi representing state
could be a state of a brain, or of an electrical device such as a computer, or even of a hydraulic system. The
internal representing state can in turn play a causal role in determining the behavior of the system. For example,
Rey (1986) endorses an indicator semantics along the lines of the work of Dennis Stampe (1977) and FodorÆs
Psychosemantics. These semantic theories that locate content or meaning in appropriate causal relations to the
world fit well with the Robot Reply. A computer in a robot body might have just the causal connections that
could allow its inner syntactic states to have the semantic property of representing states of things in its
environment.

Thus there are at least two families of theories (and marriages of the two, as in Block 1986) about how semantics
might depend upon causal connections. Both of these attempt to provide accounts that are implementation
neutral: states of suitably organized causal systems can have content, no matter what the systems are made of.
On these theories a computer could have states that have meaning. It is not necessary that the computer be aware
of its own states and know that they have meaning, nor that any outsider appreciate the meaning of the states. On
either of these accounts meaning depends upon the (possibly complex) causal connections, and digital computers
are systems designed to have states that have just such complex causal dependencies. It should be noted that
Searle does not subscribe to these theories of semantics. Instead, SearleÆs discussions of linguistic meaning have
often centered on the notion of intentionality.

5.2 Intentionality

Intentionality is the property of being about something, having content. In the 19th Century, psychologist Franz
Brentano re-introduced this term from Medieval philosophy and held that intentionality was the ômark of the
mentalö. Beliefs and desires are intentional states: they have propositional content (a person never just believes
or desires, they believe that p, or desire that p, where sentences or clauses that represent propositions substitute
for ôpö). SearleÆs views regarding intentionality are complex; of relevance here is that he makes a distinction
between the original or intrinsic intentionality of genuine mental states, and the derived intentionality of
language. A written or spoken sentence only has intentionality, namely derived intentionality, insofar as it is
interpreted by someone. It appears that on SearleÆs view, original intentionality must at least potentially be
conscious. Searle then argues that the distinction between original and derived intentionality applies to
computers. We can interpret the states of a computer as having content, but the states themselves do not have
original intentionality. Many philosophers endorse this intentionality dualism, including Sayre (1986) and even
Fodor (2009), despite FodorÆs many differences with Searle.

In a section of her 1988 book, Computer Models of the Mind, Margaret Boden notes that intentionality is not
well-understood û reason to not put too much weight on arguments that turn on intentionality. Furthermore,

https://plato.stanford.edu/entries/chinese-room/

23/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

insofar as we understand the brain, we focus on informational functions, not unspecified causal powers of the
brain: ôàfrom the psychological point of view, it is not the biochemistry as such which matters but the
information-bearing functions grounded in it.ö (241) Searle sees intentionality as a causal power of the brain,
uniquely produced by biological processes. Dale Jacquette 1989 argues against a reduction of intentionality û
intentionality, he says, is an ôineliminable, irreducible primitive concept.ö However, most AI sympathizers have
seen intentionality, aboutness, as bound up with information, and non-biological states can carry information just
as well as can brain states. Hence many responders to Searle have argued that he displays substance chauvinism,
in holding that brains understand but systems made of silicon with comparable information processing
capabilities cannot, even in principle. Papers on both sides of the issue appeared, such as J. MaloneyÆs 1987
paper ôThe Right Stuffö, defending Searle, and R. SharvyÆs 1983 critique, ôIt AinÆt the Meat, itÆs the Motionö. AI
proponents such as Kurzweil (1999, see also Richards 2002) have continued to hold that AI systems can
potentially have such mental properties as understanding, intelligence, consciousness and intentionality, and will
exceed human abilities in these areas.

Other critics of SearleÆs position take intentionality more seriously than Boden does, but deny his dualistic
distinction between original and derived intentionality. Dennett (1987, e.g.) argues that all intentionality is
derived, in that attributions of intentionality û to animals, other people, and even ourselves û are purely
instrumental and allow us to predict behavior, but they are not descriptions of intrinsic properties. As we have
seen, Dennett is concerned about the slow speed of things in the Chinese Room, but he argues that once a system
is working up to speed, it has all that is needed for a mind with derived intentionality û and derived intentionality
is the only kind that there is, according to Dennett. A machine can be an intentional system because intentional
explanations work in predicting the machineÆs behavior. Dennett also suggests that Searle conflates intentionality
with awareness of intentionality. In his syntax-semantic arguments, ôSearle has apparently confused a claim
about the underivability of semantics from syntax with a claim about the underivability of the consciousness of
semantics from syntaxö (336). The emphasis on consciousness forces us to think about things from a first-person
point of view, but Dennett 2017 continues to press the claim that this is a fundamental mistake if we want to
understand the mental.

We might also worry that Searle conflates meaning and interpretation, and that SearleÆs original or underived
intentionality is just second-order intentionality, a representation of what an intentional object represents or
means. Dretske and others have seen intentionality as information-based. One state of the world, including a
state in a computer, may carry information about other states in the world, and this informational aboutness is a
mind-independent feature of states. Hence it is a mistake to hold that conscious attributions of meaning are the
source of intentionality.

Others have noted that SearleÆs discussion has shown a shift over time from issues of intentionality and
understanding to issues of consciousness. Searle links intentionality to awareness of intentionality, in holding
that intentional states are at least potentially conscious. In his 1996 book, The Conscious Mind, David Chalmers
notes that although Searle originally directs his argument against machine intentionality, it is clear from later
writings that the real issue is consciousness, which Searle holds is a necessary condition of intentionality. It is
consciousness that is lacking in digital computers. Chalmers uses thought experiments to argue that it is
implausible that one system has some basic mental property (such as having qualia) that another system lacks, if
it is possible to imagine transforming one system into the other, either gradually (as replacing neurons one at a
time by digital circuits), or all at once, switching back and forth between flesh and silicon (see the brief
discussion of cyborgization in section 4.3 above).

A second strategy regarding the attribution of intentionality is taken by critics who in effect argue that
intentionality is an intrinsic feature of states of physical systems that are causally connected with the world in the
right way, independently of interpretation (see the preceding Syntax and Semantics section). For example, a
photo of Turing has intentionality: it has content about something, namely Turing. This form of intentionality is
independent of interpretation û someone can look at a photo of Turing and think it is a photo of someone else.
The same would presumably be the case with a sentence generated by a robot such as ôI am now in the clock-
roomö. That sentence is about a specific robot in virtue of causal connection between the generation of the
sentence and the location of the robot. When the robot generates that sentence, it means that the robot is in a

https://plato.stanford.edu/entries/chinese-room/

24/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

room it calls ôclock-roomö. But someone might interpret and assign the wrong intentionality to it (e.g. they
might think it is about some other robot than it actually is about). On this way of thinking about it, intentionality
is one thing, and interpretation is something else, namely interpretation is a theory or hypothesis about
somethingÆs intentionality. The intentionality of the sentence or photo is its relation to the world; the
interpretation of a sentence is second-order intentionality, namely it is about the sentence and its intentionality.

FodorÆs semantic externalism is influenced by Fred Dretske, but they come to different conclusions with regard
to the semantics of states of computers. Over a period of years, Dretske developed an historical account of
meaning or mental content that would preclude attributing beliefs and understanding to most machines. Dretske
(1985) agrees with Searle that adding machines donÆt literally add; we do the adding, using the machines.
Dretske emphasizes the crucial role of natural selection and learning in producing states that have genuine
content. Human built systems will be, at best, like Swampmen (beings that result from a lightning strike in a
swamp and by chance happen to be a molecule by molecule copy of some human being, say, you) û they appear
to have intentionality or mental states, but do not, because such states require the right history. AI states will
generally be counterfeits of real mental states; like counterfeit money, they may appear perfectly identical but
lack the right pedigree. But DretskeÆs account of belief appears to make it distinct from conscious awareness of
the belief or intentional state (if that is taken to require a higher order thought), and so would apparently allow
attribution of intentionality to artificial systems that can get the right history by learning.

Howard Gardiner endorses Zenon PylyshynÆs criticisms of SearleÆs view of the relation of brain and
intentionality, as supposing that intentionality is somehow a stuff ôsecreted by the brainö, and PylyshynÆs own
counter-thought experiment in which oneÆs neurons are replaced one by one with integrated circuit workalikes
(see also Cole and Foelber (1984) and Chalmers (1996) for exploration of neuron replacement scenarios).
Gardiner holds that Searle owes us a more precise account of intentionality than Searle has given so far, and until
then it is an open question whether AI can produce it, or whether it is beyond its scope. Gardiner concludes with
the possibility that the dispute between Searle and his critics is not scientific, but (quasi?) religious.

5.3 Mind and Body

Several critics have noted that there are metaphysical issues at stake in the original argument. The Systems
Reply draws attention to the metaphysical problem of the relation of mind to body. It does this in holding that
understanding is a property of the system as a whole, not the physical implementer. The Virtual Mind Reply
holds that minds or persons û the entities that understand and are conscious û are more abstract than any physical
system, and that there could be a many-to-one relation between minds and physical systems. (Even if everything
is physical, in principle a single body could be shared by multiple minds, and a single mind could have a
sequence of bodies over time.) Thus larger issues about personal identity and the relation of mind and body are
in play in the debate between Searle and some of his critics.

SearleÆs view is that the problem of the relation of mind and body ôhas a rather simple solution. Here it is:
Conscious states are caused by lower level neurobiological processes in the brain and are themselves higher
level features of the brainö (Searle 2002b, p. 9). In his early discussion of the CRA, Searle spoke of the causal
powers of the brain. Thus his view appears to be that brain states cause consciousness and understanding, and
ôconsciousness is just a feature of the brainö (ibid). However, as we have seen, even if this is true it begs the
question of just whose consciousness a brain creates. Roger SperryÆs split-brain experiments suggest that perhaps
there can be two centers of consciousness, and so in that sense two minds, implemented by a single brain. While
both display at least some language comprehension, only one (typically created by the left hemisphere) controls
language production. Thus many current approaches to understanding the relation of brain and consciousness
emphasize connectedness and information flow (see e.g. Dehaene 2014).

Consciousness and understanding are features of persons, so it appears that Searle accepts a metaphysics in
which I, my conscious self, am identical with my brain û a form of mind-brain identity theory. This very
concrete metaphysics is reflected in SearleÆs original presentation of the CR argument, in which Strong AI was
described by him as the claim that ôthe appropriately programmed computer really is a mindö (Searle 1980).
This is an identity claim, and has odd consequences. If A and B are identical, any property of A is a property of

https://plato.stanford.edu/entries/chinese-room/

25/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

B. Computers are physical objects. Some computers weigh 6 lbs and have stereo speakers. So the claim that
Searle called Strong AI would entail that some minds weigh 6 lbs and have stereo speakers. However it seems to
be clear that while humans may weigh 150 pounds; human minds do not weigh 150 pounds. This suggests that
neither bodies nor machines can literally be minds. Such considerations support the view that minds are more
abstract than brains, and if so that at least one version of the claim that Searle calls Strong AI, the version that
says that computers literally are minds, is metaphysically untenable on the face of it, apart from any thought-
experiments.

If minds are not physical objects this inability of a computer to be a mind does not show that running an AI
program cannot produce understanding of natural language, by something other than the computer (See section
4.1 above.)

Functionalism is a theory of the relation of minds to bodies that was developed in the two decades prior to
SearleÆs CRA. Functionalism is an alternative to the identity theory that is implicit in much of SearleÆs
discussion, as well as to the dominant behaviorism of the mid-twentieth Century. If functionalism is correct,
there appears to be no intrinsic reason why a computer couldnÆt have mental states. Hence the CRAÆs conclusion
that a computer is intrinsically incapable of mental states is an important consideration against functionalism.
Julian Baggini (2009, 37) writes that Searle ôcame up with perhaps the most famous counter-example in history
û the Chinese room argument û and in one intellectual punch inflicted so much damage on the then dominant
theory of functionalism that many would argue it has never recovered.ö

Functionalists hold that a mental state is what a mental state does û the causal (or ôfunctionalö) role that the state
plays determines what state it is. A functionalist might hold that pain, for example, is a state that is typically
caused by damage to the body, is located in a body-image, and is aversive. Functionalists distance themselves
both from behaviorists and identity theorists. In contrast with the former, functionalists hold that the internal
causal processes are important for the possession of mental states. Thus functionalists may agree with Searle in
rejecting the Turing Test as too behavioristic. In contrast with identity theorists (who might e.g. hold ôpain is
identical with C-fiber firingö), functionalists hold that mental states might be had by a variety of physical
systems (or non-physical, as in Cole and Foelber 1984, in which a mind changes from a material to an
immaterial implementation, neuron by neuron). Thus while an identity theorist will identify pain with certain
neuron firings, a functionalist will identify pain with something more abstract and higher level, a functional role
that might be had by many different types of underlying system.

Functionalists accuse identity theorists of substance chauvinism. However, functionalism remains controversial:
functionalism is vulnerable to the Chinese Nation type objections discussed above, and functionalists notoriously
have trouble explaining qualia, a problem highlighted by the apparent possibility of an inverted spectrum, where
qualitatively different states might have the same functional role (e.g. Block 1978, Maudlin 1989, Cole 1990).

Computationalism is the sub-species of functionalism that holds that the important causal role of brain processes
is information processing. Milkowski 2017 notes that computational approaches have been fruitful in cognitive
science; he surveys objections to computationalism and concludes that the majority target a strawman version.
However Jerry Fodor, an early proponent of computational approaches, argues in Fodor 2005 that key mental
processes, such as inference to the best explanation, which depend on non-local properties of representations,
cannot be explained by computational modules in the brain. If Fodor is right, understanding language and
interpretation appear to involve global considerations such as linguistic and non-linguistic context and theory of
mind and so might resist computational explanation. If so, we reach SearleÆs conclusion on the basis of different
considerations.

SearleÆs 2010 statement of the conclusion of the CRA has it showing that computational accounts cannot explain
consciousness. There has been considerable interest in the decades since 1980 in determining what does explain
consciousness, and this has been an extremely active research area across disciplines. One interest has been in
the neural correlates of consciousness. This bears directly on SearleÆs claim that consciousness is intrinsically
biological and not computational or information processing. There is no definitive answer yet, though some
recent work on anesthesia suggests that consciousness is lost when cortical (and cortico-thalamic) connections
and information flow are disrupted (e.g., Hudetz 2012, a review article).

https://plato.stanford.edu/entries/chinese-room/

26/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

In general, if the basis of consciousness is confirmed to be at the relatively abstract level of information flow
through neural networks, it will be friendly to functionalism, and if it is turns out to be lower and more
biological (or sub-neuronal), it will be friendly to SearleÆs account.

5.4 Simulation, duplication and evolution

In discussing the CRA, Searle argues that there is an important distinction between simulation and duplication.
No one would mistake a computer simulation of the weather for weather, or a computer simulation of digestion
for real digestion. Searle concludes that it is just as serious a mistake to confuse a computer simulation of
understanding with understanding.

On the face of it, there is generally an important distinction between a simulation and the real thing. But two
problems emerge. It is not clear that the distinction can always be made. Hearts are biological if anything is. Are
artificial hearts simulations of hearts? Or are they functional duplicates of hearts, hearts made from different
materials? Walking is normally a biological phenomenon performed using limbs. Do those with artificial limbs
walk? Or do they simulate walking? Do robots walk? If the properties that are needed to be a certain kind of
thing are high-level properties, anything sharing those properties will be a thing of that kind, even if it differs in
its lower level properties. Chalmers (1996) offers a principle governing when simulation is replication. Chalmers
suggests that, contra Searle and Harnad (1989), a simulation of X can be an X, namely when the property of
being an X is an organizational invariant, a property that depends only on the functional organization of the
underlying system, and not on any other details.

Copeland (2002) argues that the Church-Turing thesis does not entail that the brain (or every machine) can be
simulated by a universal Turing machine, for the brain (or other machine) might have primitive operations that
are not simple clerical routines that can be carried out by hand. (An example might be that human brains likely
display genuine low-level randomness, whereas computers are carefully designed not to do that, and so
computers resort to pseudo-random numbers when apparent randomness is needed.) Sprevak 2007 raises a
related point. TuringÆs 1938 Princeton thesis described such machines (ôO-machinesö). O-machines are
machines that include functions of natural numbers that are not Turing-machine computable. If the brain is such
a machine, then, says Sprevak,: ôThere is no possibility of SearleÆs Chinese Room Argument being successfully
deployed against the functionalist hypothesis that the brain instantiates an O-machineà.ö (120).

Copeland discusses the simulation / duplication distinction in connection with the Brain Simulator Reply. He
argues that Searle correctly notes that one cannot infer from X simulates Y, and Y has property P, to the
conclusion that therefore X has YÆs property P for arbitrary P. But Copeland claims that Searle himself commits
the simulation fallacy in extending the CR argument from traditional AI to apply against computationalism. The
contrapositive of the inference is logically equivalent û X simulates Y, X does not have P therefore Y does not û
where P equals: understands Chinese. The faulty step is: the CR operator S simulates a neural net N, it is not the
case that S understands Chinese, therefore it is not the case that N understands Chinese. Copeland also notes
results by Siegelmann and Sontag (1994) showing that some connectionist networks cannot be simulated by a
universal Turing Machine (in particular, where connection weights are real numbers).

There is another problem with the simulation-duplication distinction, arising from the process of evolution.
Searle wishes to see original intentionality and genuine understanding as properties only of certain biological
systems, presumably the product of evolution. Computers merely simulate these properties. At the same time, in
the Chinese Room scenario, Searle maintains that a system can exhibit behavior just as complex as human
behavior, simulating any degree of intelligence and language comprehension that one can imagine, and
simulating any ability to deal with the world, yet not understand a thing. He also says that such behaviorally
complex systems might be implemented with very ordinary materials, for example with tubes of water and
valves.

This creates a biological problem, beyond the Other Minds problem noted by early critics of the CR argument.
While we may presuppose that others have minds, evolution makes no such presuppositions. The selection forces
that drive biological evolution select on the basis of behavior. Evolution can select for the ability to use

https://plato.stanford.edu/entries/chinese-room/

27/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

information about the environment creatively and intelligently, as long as this is manifest in the behavior of the
organism. If there is no overt difference in behavior in any set of circumstances between a system that
understands and one that does not, evolution cannot select for genuine understanding. And so it seems that on
SearleÆs account, minds that genuinely understand meaning have no advantage over creatures that merely
process information, using purely computational processes. Thus a position that implies that simulations of
understanding can be just as biologically adaptive as the real thing, leaves us with a puzzle about how and why
systems with ôgenuineö understanding could evolve. Original intentionality and genuine understanding become
epiphenomenal:

Man to robot companion: ôIt is sad that you understand nothingö.

Robot companion: ôI know, I know. An American philosopher proved ages ago that I never will, so
nothing can be done about that. But letÆs set that sad thought aside and return to our discussion of
the unreliable narrator in BronteÆs works that we were having, and your own trip to the Yorkshire
moors. There are some lovely areas there, as I can see using my remote cam. I havenÆt read all her
novels, but am familiar with àö.

Conclusion

As we have seen, since its appearance in 1980 the Chinese Room argument has sparked discussion across
disciplines. Despite the extensive discussion there is still no consensus as to whether the argument is sound. At
one end we have Julian BagginiÆs (2009) assessment that Searle ôcame up with perhaps the most famous
counter-example in history û the Chinese room argument û and in one intellectual punch inflicted so much
damage on the then dominant theory of functionalism that many would argue it has never recovered.ö Whereas
philosopher Daniel Dennett (2013, p. 320) concludes that the Chinese Room argument is ôclearly a fallacious
and misleading argumentö. Hence there is no consensus as to whether the argument is a proof that limits the
aspirations of Artificial Intelligence or computational accounts of mind.

Meanwhile work in artificial intelligence and natural language processing has continued. The CRA led Stevan
Harnad and others on a quest for ôsymbol groundingö in AI. Many in philosophy (Dretske, Fodor, Millikan)
worked on naturalistic theories of mental content. Speculation about the nature of consciousness continues in
many disciplines. And computers have moved from the lab to the pocket and the wrist.

At the time of SearleÆs construction of the argument, personal computers were very limited hobbyist devices.
WeizenbaumÆs æElizaÆ and a few text æadventureÆ games were played on DEC computers; these included limited
parsers. More advanced parsing of language was limited to computer researchers such as Schank. Much changed
in the next quarter century; billions now use natural language to interrogate and command virtual agents via
computers they carry in their pockets. Has the Chinese Room argument moderated claims by those who produce
AI and natural language systems? Some manufacturers linking devices to the ôinternet of thingsö make modest
claims: appliance manufacturer LG says the second decade of the 21st century brings the ôexperience of
conversingö with major appliances. That may or may not be the same as conversing. Apple is less cautious than
LG in describing the capabilities of its ôvirtual personal assistantö application called æSiriÆ: Apple says of Siri
that ôIt understands what you say. It knows what you mean.ö IBM is quick to claim its much larger æWatsonÆ
system is superior in language abilities to Siri. In 2011 Watson beat human champions on the television game
show æJeopardyÆ, a feat that relies heavily on language abilities and inference. IBM goes on to claim that what
distinguishes Watson is that it ôknows what it knows, and knows what it does not know.ö This appears to be
claiming a form of reflexive self-awareness or consciousness for the Watson computer system. Thus the claims
of strong AI now are hardly chastened, and if anything some are stronger and more exuberant. At the same time,
as we have seen, many others believe that the Chinese Room Argument showed once and for all that at best
computers can simulate human cognition.

Though separated by three centuries, Leibniz and Searle had similar intuitions about the systems they consider in
their respective thought experiments, LeibnizÆ Mill and the Chinese Room. In both cases they consider a
complex system composed of relatively simple operations, and note that it is impossible to see how

https://plato.stanford.edu/entries/chinese-room/

28/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

understanding or consciousness could result. These simple arguments do us the service of highlighting the
serious problems we face in understanding meaning and minds. The many issues raised by the Chinese Room
argument may not be settled until there is a consensus about the nature of meaning, its relation to syntax, and
about the biological basis of consciousness. There continues to be significant disagreement about what processes
create meaning, understanding, and consciousness, as well as what can be proven a priori by thought
experiments.

Bibliography

Apple Inc., 2014, æIOS 7 SiriÆ, accessed 1/10/2014.
Baggini, J., 2009, æPainting the bigger pictureÆ, The PhilosopherÆs Magazine, 8: 37û39.
Block, N., 1978, æTroubles with FunctionalismÆ, in C. W. Savage (ed.), Perception and Cognition: Issues in the
Foundations of Psychology, Minneapolis: University of Minnesota Press. (Reprinted in many anthologies
on philosophy of mind and psychology.)

ûûû, 1986, æAdvertisement for a Semantics for PsychologyÆ, Midwest Studies in Philosophy (Volume X), P.A.

French, et al. (eds.), Minneapolis: University of Minnesota Press, 615û678.

ûûû, 2002, æSearleÆs Arguments Against Cognitive ScienceÆ, in Preston and Bishop (eds.) 2002.
Boden, M., 1988, Computer Models of the Mind, Cambridge: Cambridge University Press; pp. 238û251 were

excerpted and published as æEscaping from the Chinese RoomÆ, in The Philosophy of Artificial Intelligence,
ed M. A. Boden, New York: Oxford University Press, 1990.

Brockman, J. (ed.), 2015, What To Think About Machines That Think, New York, Harper Collins. [Brockman

2015 available online (retitled æWhat Do You Think About Machines That Think?Æ)]

Cam, P., 1990, æSearle on Strong AIÆ, Australasian Journal of Philosophy, 68: 103û8.
Cantwell Smith, B., 2019, The Promise of Artificial Intelligence, Cambridge, MA: MIT Press.
Chalmers, D., 1992, æSubsymbolic Computation and the Chinese RoomÆ, in J. Dinsmore (ed.), The Symbolic and

Connectionist Paradigms: Closing the Gap, Hillsdale, NJ: Lawrence Erlbaum.

ûûû, 1996, The Conscious Mind, Oxford: Oxford University Press.
ûûû, 1996a, æDoes a Rock Implement Every Finite-State AutomatonÆ, Synthese 108: 309û33.
ûûû, 1996b, æMinds, machines, and mathematicsÆ, Psyche, 2: 11û20.
Churchland, P., 1985, æReductionism, Qualia, and the Direct Introspection of Brain StatesÆ, The Journal of

Philosophy, LXXXII: 8û28.

Churchland, P. and Churchland, P., 1990, æCould a machine think?Æ, Scientific American, 262(1): 32û37.
Clark, A., 1991, Microcognition: Philosophy, Cognitive Science, and Parallel Distributed Processing,

Cambridge, MA: MIT Press.

Cole, D., 1984, æThought and Thought ExperimentsÆ, Philosophical Studies, 45: 431û44.
ûûû, 1990, æFunctionalism and Inverted SpectraÆ, Synthese, 82: 202û222.
ûûû, 1991a, æArtificial Intelligence and Personal IdentityÆ, Synthese, 88: 399û417.
ûûû, 1991b, æArtificial Minds: Cam on SearleÆ, Australasian Journal of Philosophy, 69: 329û33.
ûûû, 1994, æThe Causal Powers of CPUsÆ, in E. Dietrich (ed.), Thinking Computers and Virtual Persons, New

York: Academic Press

Cole, D. and Foelber, R., 1984, Contingent MaterialismÆ, Pacific Philosophical Quarterly, 65(1): 74û85.
Copeland, J., 2002, æThe Chinese Room from a Logical Point of ViewÆ, in Preston and Bishop (eds.) 2002, 104û

122.

Crane, Tim., 1996, The Mechanical Mind: A Philosophical Introduction to Minds, Machines and Mental

Representation, London: Penguin.

Damper, R., 2006, æThe logic of SearleÆs Chinese room argumentÆ, Minds and Machines, 16(2): 164û183
Davis, Lawrence, 2001, æFunctionalism, the Brain, and Personal IdentityÆ, Philosophical Studies, 102(3): 259û

279.

Dehaene, S., 2014, Consciousness and the Brain: Deciphering How the Brain Codes Our Thoughts, New York:

Viking Penguin.

Dennett, D., 1978, æToward a Cognitive Theory of ConsciousnessÆ, in Brainstorms: Philosophical Essays on

Mind and Psychology, Cambridge, MA: MIT Press.

https://plato.stanford.edu/entries/chinese-room/

29/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

ûûû, 1981, æWhere am I?Æ in Brainstorms: Philosophical Essays on Mind and Psychology, Cambridge, MA: MIT

Press, pp. 310û323.

ûûû, 1987, æFast ThinkingÆ, in The Intentional Stance, Cambridge, MA: MIT Press, 324û337.
ûûû, 1997, æConsciousness in Humans and Robot Minds,Æ in M. Ito, Y. Miyashita and E.T. Rolls (eds.),
Cognition, computation, and consciousness, New York: Oxford University Press, pp. 17û29.

ûûû, 2013, Intuition Pumps and Other Tools for Thinking, New York: W.W. Norton and Co.
Dneprov, A., 1961, æ????Æ (æThe GameÆ), ??????-???? (Knowledge is Power), 5: 39û42; for a link to the

translation, see Mickevich 1961, Other Internet Resources.

Double, R., 1983, æSearle, Programs and FunctionalismÆ, Nature and System, 5: 107û14.
Dretske, F. 1985, æPresidential AddressÆ (Central Division Meetings of the American Philosophical Association),

Proceedings and Addresses of the American Philosophical Association, 59(1): 23û33.

Dreyfus, H. 1965, æAlchemy and Artificial IntelligenceÆ, Boston, MA: Rand Corporation.
ûûû, 1972, What Computers CanÆt Do, New York: Harper & Row.
Fetzer, J. (ed.), 1988 Aspects of Artificial Intelligence (Studies in Cognitive Systems), New York: Springer.
Fodor, J., 1987, Psychosemantics, Cambridge, MA: MIT Press.
ûûû, 1991, æYin and Yang in the Chinese RoomÆ, in D. Rosenthal (ed.), The Nature of Mind, New York: Oxford

University Press.

ûûû, 1992, A Theory of Content and other essays, Cambridge, MA: MIT Press.
ûûû, 2009, æWhere is my Mind?Æ, London Review of Books, (31)3: 13û15.
Ford, J., 2011, æHelen Keller was never in a Chinese RoomÆ, Minds and Machines, 21(1): 57û72.
Gardiner, H., 1987, The MindÆs New Science: A History of the Cognitive Revolution, New York: Basic Books.
Hanley, R., 1997, The Metaphysics of Star Trek, New York: Basic Books.
Harnad, S., 1989, æMinds, Machines and SearleÆ, Journal of Experimental and Theoretical Artificial Intelligence,

1: 5û25.

ûûû, 2002, æMinds, Machines, and Searle2: WhatÆs Right and Wrong about the Chinese Room ArgumentÆ, in

Preston and Bishop (eds.) 2002, 294û307.

Haugeland, J., 2002, æSyntax, Semantics, PhysicsÆ, in Preston and Bishop (eds.) 2002, 379û392.
Hauser, L., 1997, æSearleÆs Chinese Box: Debunking the Chinese Room ArgumentÆ, Minds and Machines, 7:

199û226.

ûûû, 2002, æNixinÆ Goes to ChinaÆ, in Preston and Bishop (eds.) 2002, 123û143.
Hayes, P., Harnad, S., Perlis, D. & Block, N., 1992, æVirtual Symposium on Virtual MindÆ, Minds and Machines,

2(3): 217û238.

Hofstadter, D., 1981, æReflections on SearleÆ, in Hofstadter and Dennett (eds.), The MindÆs I, New York: Basic

Books, pp. 373û382.

Horgan, T., 2013, æOriginal Intentionality is Phenomenal IntentionalityÆ, The Monist 96: 232û251.
Hudetz, A., 2012, æGeneral Anesthesia and Human Brain ConnectivityÆ, Brain Connect, 2(6): 291û302.
Jackson, F., 1986, æWhat Mary DidnÆt KnowÆ, Journal of Philosophy, LXXXIII: 291û5.
Kaernbach, C., 2005, æNo Virtual Mind in the Chinese RoomÆ, Journal of Consciousness Studies, 12(11): 31û42.
Kim, J., 2010, The Philosophy of Mind, (3rd edition), Boulder, CO: Westview Press.
Kurzweil, R., 2000, The Age of Spiritual Machines: When Computers Exceed Human Intelligence, New York:

Penguin.

ûûû, 2002, æLocked in his Chinese RoomÆ, in Richards 2002, 128û171.
Maloney, J., 1987, æThe Right StuffÆ, Synthese, 70: 349û72.
Maudlin, T., 1989, æComputation and ConsciousnessÆ, Journal of Philosophy, LXXXVI: 407û432.
Milkowski, M. 2017, æWhy think that the brain is not a computer?Æ, APA Newsletter on Philosophy and

Computers, 16(2), 22û28.

Millikan, R., 1984, Language, Thought, and other Biological Categories, Cambridge, MA: MIT Press.
Moor, J., 1988 æThe Pseudorealization Fallacy and the Chinese Room ArgumentÆ, in James Fetzer (ed.) Aspects

of Artificial Intelligence, New York: Springer: 35û53

Moravec, H., 1999, Robot: Mere Machine to Transcendent Mind, New York: Oxford University Press.
Nute, D., 2011, æA Logical Hole the Chinese Room AvoidsÆ, Minds and Machines, 21: 431û3; this is a reply to

Shaffer 2009.

Penrose, R., 2002, æConsciousness, Computation, and the Chinese RoomÆ in Preston and Bishop (eds.) 2002,

226û249.

https://plato.stanford.edu/entries/chinese-room/

30/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Pinker, S., 1997, How the Mind Works, New York: Norton.
ûûû, 2015, æThinking does not imply subjugatingÆ in Brockman 2015. [Pinker 2015 available online]
Preston, J. and M. Bishop (eds.), 2002, Views into the Chinese Room: New Essays on Searle and Artificial

Intelligence, New York: Oxford University Press.

Pylyshyn, Z., 1980, Reply to Searle,Behavioral and Brain Sciences, 3.
Rapaport, W., 1984, æSearleÆs Experiments with ThoughtÆ, Philosophy of Science, 53: 271û9.
ûûû 2006, æHow Helen Keller Used Syntactic Semantics to Escape from a Chinese RoomÆ, Minds and Machines,

16(4): 381û436.

Rey, G., 1986, æWhatÆs Really Going on in SearleÆs ôChinese Roomö?Æ, Philosophical Studies, 50: 169û85.
ûûû, 2002, æSearleÆs Misunderstandings of Functionalism and Strong AIÆ, in Preston and Bishop (eds.) 2002,

201û225.

Richards, J. W. (ed.), 2002, Are We Spiritual Machines: Ray Kurzweil vs. the Critics of Strong AI, Seattle:

Discovery Institute.

Rosenthal, D. (ed.), 1991, The Nature of Mind, Oxford and NY: Oxford University Press.
Schank, R., 2015, æMachines that Think are in the MoviesÆ, in Brockman, J. (ed.), What to Think About

Machines that Think, New York: Harper Collins.

Schank, R. and Abelson, R., 1977, Scripts, Plans, Goals, and Understanding, Hillsdale, NJ: Lawrence Erlbaum.
Schank, R. and P. Childers, 1985, The Cognitive Computer: On Language, Learning, and Artificial Intelligence,

New York: Addison-Wesley.

Schweizer, P., 2012, æThe Externalist Foundations of a Truly Total Turing TestÆ, Minds and Machines, 22: 191û

212.

Searle, J., 1980, æMinds, Brains and ProgramsÆ, Behavioral and Brain Sciences, 3: 417û57 [Preprint available

online]

ûûû, 1984, Minds, Brains and Science, Cambridge, MA: Harvard University Press.
ûûû, 1989, æArtificial Intelligence and the Chinese Room: An ExchangeÆ, New York Review of Books, 36: 2

(February 16, 1989).

ûûû, 1990a, æIs the BrainÆs Mind a Computer Program?Æ, Scientific American, 262(1): 26û31.
ûûû, 1990b, æPresidential AddressÆ, Proceedings and Addresses of the American Philosophical Association, 64:

21û37.

ûûû, 1998, æDo We Understand Consciousness?Æ (Interview with Walter Freeman), Journal of Consciousness

Studies, 6: 5û6.

ûûû, 1999, æThe Chinese RoomÆ, in R.A. Wilson and F. Keil (eds.), The MIT Encyclopedia of the Cognitive

Sciences, Cambridge, MA: MIT Press.

ûûû, 2002a, æTwenty-one Years in the Chinese RoomÆ, in Preston and Bishop (eds.) 2002, 51û69.
ûûû, 2002b, æThe Problem of ConsciousnessÆ, in Consciousness and Language, Cambridge: Cambridge

University Press, 7û17.

ûûû, 2004, Mind: a Brief Introduction, Oxford: Oxford University Press.
ûûû, 2009, æSearleÆs Chinese RoomÆ in Scholarpedia, 4(8): 3100, revision #66188. [Searle 2009 available online]
ûûû, 2010, æWhy Dualism (and Materialism) Fail to Account for ConsciousnessÆ, in Richard E. Lee (ed.),

Questioning Nineteenth Century Assumptions about Knowledge (III: Dualism), New York: SUNY Press.
Seligman, M., 2019, æThe Evolving Treatment of Semantics in Machine TranslationÆ, in M. Ji and M. Oakes
(eds.), Advances in Empirical Translation Studies: Developing Translation Resources and Technologies,
Cambridge: Cambridge University Press.

Shaffer, M., 2009, æA Logical Hole in the Chinese RoomÆ, Minds and Machines, 19(2): 229û235.
Sharvy, R., 1983, æIt AinÆt the Meat ItÆs the MotionÆ, Inquiry, 26: 125û134.
Simon, H. and Eisenstadt, S., 2002, æA Chinese Room that UnderstandsÆ, in Preston and Bishop (eds.) 2002, 95û

108.

Sloman, A. and Croucher, M., 1980, æHow to turn an information processor into an understandingÆ, Brain and

Behavioral Sciences, 3: 447û8.

Sprevak, M., 2007, æChinese Rooms and Program PortabilityÆ, British Journal for the Philosophy of Science,

58(4): 755û776.

Stampe, Dennis, 1977, æTowards a Causal Theory of Linguistic RepresentationÆ, in P. French, T. Uehling, H.
Wettstein, (eds.) Contemporary Perspectives in the Philosophy of Language, (Midwest Studies in
Philosophy, Volume 2), Minneapolis: University of Minnesota Press, pp. 42û63.

https://plato.stanford.edu/entries/chinese-room/

31/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

Thagard, P., 1986, æThe Emergence of Meaning: An Escape from SearleÆs Chinese RoomÆ, Behaviorism, 14:

139û46.

ûûû, 2013, æThought Experiments Considered HarmfulÆ, Perspectives on Science, 21: 122û139.
Turing, A., 1948, æIntelligent Machinery: A ReportÆ, London: National Physical Laboratory.
ûûû, 1950, æComputing Machinery and IntelligenceÆ, Mind, 59: 433û460.
Weiss, T., 1990, æClosing the Chinese RoomÆ, Ratio, 3: 165û81.
Ziemke, T., 2016, æThe Body of Knowledge: on the role of the living body in grounding embodied cognitionÆ,

Biosystems, 148: 4û11.

Academic Tools

How to cite this entry.
Preview the PDF version of this entry at the Friends of the SEP Society.

Look up topics and thinkers related to this entry at the Internet Philosophy Ontology Project
(InPhO).
Enhanced bibliography for this entry at PhilPapers, with links to its database.

Other Internet Resources

Damper, R., 2001, æThought Experiments can be HarmfulÆ, abstract of a talk presented at the conference
Model-Based Reasoning: Scientific Discovery, Technological Innovation, Values (MBRÆ01), Pavia, Italy,
2001.
Hossenfelder, S., 2023, æI believe chatbots understand part of what they say. Let me explain.Æ, available on
YouTube.
The Open University, 2012, æThe Chinese Room û 60 second adventures in ThoughtÆ, available on
YouTube.
Harnad, S., 2012, æAlan Turing and the ôHardö and ôEasyö Problem of Cognition: Doing and FeelingÆ,
Turing100: Essays in Honour of Centenary Turing Year 2012, available online.
Huang, Jensen, 2024, æNvidia Proxy StatementÆ, available online.
Mickevich, A., 1961, æThe GameÆ, translation of Dneprov 1961, at Center for Consciousness Studies
(Philosophy Department, Moscow State University).
Searle, J., æFailures of ComputationalismÆ (SearleÆs reply to Harnad, and HarnadÆs response).
Papers on the Chinese Room Argument, at PhilPapers.org.
Annotated Chinese Room Bibliography, by L. Hauser.

Related Entries

computation: in physical systems | consciousness: and intentionality | consciousness: representational theories of
| emergent properties | epiphenomenalism | externalism about the mind | functionalism | information: biological |
information: semantic conceptions of | intentionality | meaning, theories of | mental content: causal theories of |
mental content: teleological theories of | mental representation | mind: computational theory of | multiple
realizability | neuroscience, philosophy of | other minds | personal identity | thought experiments | Turing, Alan |
Turing test | zombies

Copyright ⌐ 2024 by
David Cole <dcole@d.umn.edu>

Open access to the SEP is made possible by a world-wide funding initiative.
Please Read How You Can Help Support the Growth and Development of the Encyclopedia

https://plato.stanford.edu/entries/chinese-room/

32/33

4/19/26, 8:33 AM

The Chinese Room Argument (Stanford Encyclopedia of Philosophy)

The Stanford Encyclopedia of Philosophy is copyright ⌐ 2026 by The Metaphysics Research Lab, Department
of Philosophy, Stanford University

Library of Congress Catalog Data: ISSN 1095-5054

https://plato.stanford.edu/entries/chinese-room/

33/33
