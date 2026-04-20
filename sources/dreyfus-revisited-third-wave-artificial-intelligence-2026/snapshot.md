<!--
  AI Triad Research Project — Document Snapshot
  Title      : Dreyfus Revisited for the Third Wave of Artificial Intelligence
  Source     : 
  Type       : pdf
  Captured   : 2026-04-19
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Dreyfus Revisited for the Third Wave of Artificial Intelligence

> **Snapshot captured:** 2026-04-19
> **Source:** 
> **Type:** pdf

---
AAAISpringSymposiumSeries(SSS-24)
|     |     |     |     | What | Can | Computers |     | Do  | Now? |     |     |     |     |     |     |
| --- | --- | --- | --- | ---- | --- | --------- | --- | --- | ---- | --- | --- | --- | --- | --- | --- |
Dreyfus Revisited for the Third Wave of Artificial Intelligence
BenSchuering1,ThomasSchmid2,3,4
1LeibnizUniversita¿tHannover
2MartinLutherUniversityHalle-Wittenberg
3LancasterUniversityinLeipzig
4LeipzigUniversity
thomas.schmid@medizin.uni-halle.de
Abstract Neither pure logic AI nor hybrid AI have so far reached
|                |        |            |              |          |                 |         | human-like |     | abilities    | and  | common | sense.       | Data-driven |     | AI,    |
| -------------- | ------ | ---------- | ------------ | -------- | --------------- | ------- | ---------- | --- | ------------ | ---- | ------ | ------------ | ----------- | --- | ------ |
| In recent      | years, | artificial | intelligence | (AI)     | has seen        | signif- |            |     |              |      |        |              |             |     |        |
|                |        |            |              |          |                 |         | however,   |     | has recently | seen | major  | advancements |             | due | to the |
| icant advances |        | that have  | in fact      | exceeded | even optimistic |         |            |     |              |      |        |              |             |     |        |
conceptoflargelanguagemodels(LLMs),atsometasksex-
prognoses.Usingdata-drivenAI,namelydeeplearningtech-
ceedingallpreviouslyknownabilities.LLMs,suchasGPT-
niques,ithasbeendemonstratedthatcomputersmaynowbe
equippedwithabilitiesofremarkablescopeandquality,such 4.0 or BERT, have been successfully used to to summarize
as solving image and text processing tasks at human level. orextendtexts,andevenwritereportsandpoems(Minetal.
Large language models, in particular, have sparked debates 2023).MultimodalLLMs,suchasStableDiffusion,areeven
regardingopportunitiesandchallengesofthisrapidlydevel- abletocreateimagesfromtextinput(Zhangetal.2023).At
opingarea.Will remaining fundamentalchallengesofdata- thesametime,theratherunwantedphenomenonofhalluci-
| driven | AI, such | as factual | or logical | mistakes, | be overcome |     |     |     |     |     |     |     |     |     |     |
| ------ | -------- | ---------- | ---------- | --------- | ----------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
nationhasgainedsignificantinterest(Tonmoyetal.2024).It
forgoodifcomplementedandhybridizedwithsymbolicAI
illustratesnotonlythelimitationsofLLMsandtheirstatis-
techniques,suchasknowledgerepresentationandreasoning?
ticalnature(Lakeetal.2017),buthasalsosparkedinterest
| Will systems | of  | artificial | general | intelligence | (AGI) | emerge |     |            |             |     |              |     |         |     |          |
| ------------ | --- | ---------- | ------- | ------------ | ----- | ------ | --- | ---------- | ----------- | --- | ------------ | --- | ------- | --- | -------- |
|              |     |            |         |              |       |        | in  | overcoming | limitations |     | by combining |     | machine |     | learning |
fromthis,possessingcommonsenseandinfactcompleting
|                 |     |           |         |           |           |        | with | knowledge |     | engineering | techniques |     | (Colon-Hernandez |     |     |
| --------------- | --- | --------- | ------- | --------- | --------- | ------ | ---- | --------- | --- | ----------- | ---------- | --- | ---------------- | --- | --- |
| the decades-old |     | quest for | AI that | motivated | the raise | of the |      |           |     |             |            |     |                  |     |     |
fieldinthe1950s?Inthelightofthesequestions,wereview et al. 2021). With deep learning and LLMs having already
thelikewise,decades-oldphilosophicaldebateaboutcapabil- reached capabilities at an unprecedented quality, such fur-
itiesandlimitationsofcomputersfromahybridAIpointof therimprovementsraisethequestionofhowclosethenext
view.Here,wediscusshowhybridAIiscomingclosertodis- generation of AI will actually come to a so-called artifi-
proving Hubert DreyfusÆ famous statements regarding what cialgeneralintelligence(AGI)withhuman-likeabilitiesand
computerscannotdo.Atthesametime,weshedlightona common sense. Not few in the field assume that the third
lesserdiscussedchallengeforhybridAI:thepossibilitythat
|     |     |     |     |     |     |     | wave | of  | AI will | push the | limits | of what | computers |     | can do |
| --- | --- | --- | --- | --- | --- | --- | ---- | --- | ------- | -------- | ------ | ------- | --------- | --- | ------ |
itsdevelopersmightbeitsbiggestlimiters.
|     |     |     |     |     |     |     | significantly, |     | and | may | even overcome |     | the longest |     | standing |
| --- | --- | --- | --- | --- | --- | --- | -------------- | --- | --- | --- | ------------- | --- | ----------- | --- | -------- |
barriersseparatingmanandmachine.
Introduction
WhatCanComputersNotDo?
| Since its | very early      | days, | the    | field of artificial | intelligence |           |     |     |     |     |     |     |     |     |     |
| --------- | --------------- | ----- | ------ | ------------------- | ------------ | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| (AI) has  | been fascinated |       | by the | idea of creating    |              | computers |     |     |     |     |     |     |     |     |     |
Asmotivatingthevisionofmachineswithhuman-likeabil-
withhuman-likecognitiveabilities.Greatexpectationscame
|     |     |     |     |     |     |     | ities | and | common | sense | may | have been | for | early | AI re- |
| --- | --- | --- | --- | --- | --- | --- | ----- | --- | ------ | ----- | --- | --------- | --- | ----- | ------ |
withsuccessesofearlysearchandplanningstrategiesinthe
searchers,itturnedouttobenotonlyambitious,butinfact
1950s,duetowhichsomeresearchersanticipatedmachines
itshardestchallengeever.Moreover,thisidealprovidedan
withhuman-likecapabilitieswithinthenextdecadealready.
|            |        |        |        |             |          |      | easy | target | for critics. |     | Philosopher | Hubert |     | L. Dreyfus, | in  |
| ---------- | ------ | ------ | ------ | ----------- | -------- | ---- | ---- | ------ | ------------ | --- | ----------- | ------ | --- | ----------- | --- |
| While this | turned | out to | be too | optimistic, | new hope | grew |      |        |              |     |             |        |     |             |     |
particular,becamefamousforhisfundamentalcriticismon
| with more | advanced | logic | AI  | called expert | systems | intro- |     |     |     |     |     |     |     |     |     |
| --------- | -------- | ----- | --- | ------------- | ------- | ------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
AIformulatedinseveralpublications(Dreyfus1965,1972;
ducedinthe1970s,andevenmoresowiththeraiseofneural
DreyfusandDreyfus1986;Dreyfus1992).Condensedinthe
networksinthe1980s.Bothparadigms,however,comewith
titleofhisseminalbookWhatComputerscanÆtdo(Dreyfus
| particular | challenges. | Data-driven |     | AI, such | as neural | net- |     |     |     |     |     |     |     |     |     |
| ---------- | ----------- | ----------- | --- | -------- | --------- | ---- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
1972),DreyfushasbeenarguingthatAIwillfundamentally
works,istraditionallynotparticularlygoodatworkingwith neverabletodelivercommonsense,moralandethicalrea-
logicconcepts.LogicAI,ontheotherhand,canusuallynot
soning,contextualawareness,andemotions.
beautomaticallyadaptedtodynamicchanges.Therefore,AI
BythetimeDreyfusinitiallypublishedthesethoughts,AI
| researchers | have      | been striving |       | to complement   | the | strengths |     |           |     |              |     |           |            |     |      |
| ----------- | --------- | ------------- | ----- | --------------- | --- | --------- | --- | --------- | --- | ------------ | --- | --------- | ---------- | --- | ---- |
|             |           |               |       |                 |     |           | was | dominated | by  | mathematical |     | and logic | approaches |     | that |
| of these    | first two | waves         | of AI | in a third wave | or  | paradigm, |     |           |     |              |     |           |            |     |      |
werebuilttodealwithsymbolsandrepresentations.Against
typicallyreferredtoashybridizationorhybridAI. this background, he emphasized that human cognitive ca-
Copyright⌐2024,AssociationfortheAdvancementofArtificial pacities rely strongly on unconscious processes and extend
Intelligence(www.aaai.org).Allrightsreserved. beyond explicit articulation (Dreyfus 1965, 1972). In the
248

lightoffurtherdevelopmentsinthisdirectionintheareaof IstheHybridWholeMoreThan
neuralnetworks,Dreyfusrenewedhiscriticismtwodecades
TheSumOfItsAIParts?
| later with | his | follow-up | book | What | Computers | Still | CanÆt |          |        |        |            |          |           |        |
| ---------- | --- | --------- | ---- | ---- | --------- | ----- | ----- | -------- | ------ | ------ | ---------- | -------- | --------- | ------ |
|            |     |           |      |      |           |       |       | Over the | course | of the | last three | decades, | a variety | of ap- |
Doûthendissectingthepredictivenatureofdata-drivenAI,
|     |     |     |     |     |     |     |     | proaches | to create | hybrid | AI  | systems have | emerged, | such |
| --- | --- | --- | --- | --- | --- | --- | --- | -------- | --------- | ------ | --- | ------------ | -------- | ---- |
whichreliesonemulationratherthangenuineunderstanding
|     |     |     |     |     |     |     |     | as genetic | programming |     | of neural | networks, | logic | spiking |
| --- | --- | --- | --- | --- | --- | --- | --- | ---------- | ----------- | --- | --------- | --------- | ----- | ------- |
(Dreyfus1992).
neuralnetworks,hybridexpertsystemsorknowledge-based
| A core   | target   | of DreyfusÆ |        | critique | on AI    | was the | goal of |                  |     |           |           |        |               |     |
| -------- | -------- | ----------- | ------ | -------- | -------- | ------- | ------- | ---------------- | --- | --------- | --------- | ------ | ------------- | --- |
|          |          |             |        |          |          |         |         | neural networks. |     | A popular | classical | scheme | discriminates |     |
| creating | machines | with        | common | sense    | (Dreyfus | and     | Drey-   |                  |     |           |           |        |               |     |
betweenthreetypesofhybridAI:unified,transformational,
| fus 1986). | Shaped | by  | diverse | factors, | such | as upbringing |     |     |     |     |     |     |     |     |
| ---------- | ------ | --- | ------- | -------- | ---- | ------------- | --- | --- | --- | --- | --- | --- | --- | --- |
andmodularhybridsystems(McGarry,Wermter,andMac-
andsocialinteractions,individualsdevelopnuancedethical
Intyre1999).Whilemodulardesignofhybridsystemsisstill
| and moral | reasoning |     | approaches, | often | grounded |     | in shared |     |     |     |     |     |     |     |
| --------- | --------- | --- | ----------- | ----- | -------- | --- | --------- | --- | --- | --- | --- | --- | --- | --- |
relevanttoday(Schmid2023),theothertwoparadigmshave
| understandings |     | û such | as the | unwritten |       | rule of   | refraining |                     |     |     |             |          |           |     |
| -------------- | --- | ------ | ------ | --------- | ----- | --------- | ---------- | ------------------- | --- | --- | ----------- | -------- | --------- | --- |
|                |     |        |        |           |       |           |            | been differentiated |     | in  | more recent | schemes, | following | the |
| from checking  |     | oneÆs  | phone  | during    | a job | interview | û com-     |                     |     |     |             |          |           |     |
ideaofdesignpatternspopularizedbymodernsoftwareen-
| monly recognized |     | as  | common | sense. | Dreyfus | argued | that |     |     |     |     |     |     |     |
| ---------------- | --- | --- | ------ | ------ | ------- | ------ | ---- | --- | --- | --- | --- | --- | --- | --- |
gineering(vanBekkumetal.2021;Witscheletal.2021).
| these intricate |     | reasoning | approaches, |     | deeply | embedded | in  |     |     |     |     |     |     |     |
| --------------- | --- | --------- | ----------- | --- | ------ | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
Usually,thejustificationforanyhybridAIapproachesis
| human experience, |     | pose | significant |     | challenges | for | AI sys- |     |     |     |     |     |     |     |
| ----------------- | --- | ---- | ----------- | --- | ---------- | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
theassumptionthatbycombiningtwooppositeapproaches,
| tems attempting |     | to replicate |     | them | successfully |     | (Dreyfus |     |     |     |     |     |     |     |
| --------------- | --- | ------------ | --- | ---- | ------------ | --- | -------- | --- | --- | --- | --- | --- | --- | --- |
eachindividualdrawbackwillbalanceouteachother.Orin
1972;Descartes1996).
|                 |     |           |     |              |     |          |        | other words: | that | the individual |     | strengths   | will complement |       |
| --------------- | --- | --------- | --- | ------------ | --- | -------- | ------ | ------------ | ---- | -------------- | --- | ----------- | --------------- | ----- |
| Not surprising, |     | DreyfusÆs |     | propositions |     | provoked | prompt |              |      |                |     |             |                 |       |
|                 |     |           |     |              |     |          |        | each other.  | In   | fact, however, |     | this is not | guaranteed.     | What, |
andreactionsfromtheAIcommunityinthefollowingyears.
forexample,iftheweaknessesofoppositeapproachescom-
Papert,forexample,reactedalreadyin1968withaharshre-
|             |      |           |         |     |                |     |         | plement | each other | - instead |     | of the strengths? | We  | will dis- |
| ----------- | ---- | --------- | ------- | --- | -------------- | --- | ------- | ------- | ---------- | --------- | --- | ----------------- | --- | --------- |
| buttal, not | only | basically | denying |     | most arguments |     | brought |         |            |           |     |                   |     |           |
cussthisinthefollowingforcommonsenseandcontextual
| forward | by Dreyfus | but | even | questioning |     | the legitimacy | of  |     |     |     |     |     |     |     |
| ------- | ---------- | --- | ---- | ----------- | --- | -------------- | --- | --- | --- | --- | --- | --- | --- | --- |
awareness,ethicalreasoning,andmoralreasoning.
| doing so | (Papert | 1968). | In  | the year | of publication, |     | com- |     |     |     |     |     |     |     |
| -------- | ------- | ------ | --- | -------- | --------------- | --- | ---- | --- | --- | --- | --- | --- | --- | --- |
puterscientistBruceG.BuchananreviewedWhatComput- ò Common Sense and Contextual Awareness A field
ersCanÆtDocritically(Buchanan1972),encouragingread- that has also received great advancements based on hy-
erstoadoptacontemporaryviewofhumanityandtheworld, brid AI, is the world of personal assistants such as Siri
distinctfromtraditionalscientificviewpoints.Wastheover- or Alexa, and virtual chat assistants. Often, they use a
|              |             |     |     |          |            |     |         | combination |     | of different | AI  | paradigms, | such | as natural |
| ------------ | ----------- | --- | --- | -------- | ---------- | --- | ------- | ----------- | --- | ------------ | --- | ---------- | ---- | ---------- |
| all approach | misaligned? |     | As  | Crossman | elaborates |     | in ôThe |             |     |              |     |            |      |            |
Kiss and the Promiseö, DreyfusÆs work falls short in shed- language processing (NLP), machine learning, text-to-
ding light on the meaning or understanding of AI, instead speech(TTS),knowledgegraphsandforthevirtualchat
focusing on the societal misuse of computers, particularly assistants the chatbot framework. Concepts, such as a
the potential replacement of human emotional interactions knowledgegraph,allowthesystemtohaveanunderlying
graphmodellingtheconnectionandrelationshipbetween
withmachine-humaninterchange(Crossman1985).
Critics argue that the mistakes lie not in what comput- differententities.Thisallowsthesystemtoprocessanin-
ers can not do, but rather in what they can do and how putandprovidetherelevantoutput.Overall,thisinfunc-
they achieve it (Collins 1996). Further, debates surround- tion with ML algorithms allows the system to function
ing DreyfusÆs work delve into the dichotomy of ôBody properly.NLPisthebasisforthecomputertounderstand
whattheuserisinputting.
| and Worldö. | Scholars |     | like Hubert | Haugeland |     | argue | that in- |     |     |     |     |     |     |     |
| ----------- | -------- | --- | ----------- | --------- | --- | ----- | -------- | --- | --- | --- | --- | --- | --- | --- |
telligent bodies are fundamentally situated, with relevance Apossibleinterpretationofsomeofthesesystemsisthat
contingent on the essentially human situation. Intelligence theyindeedshowcasetheabilitytohavecommonsense
wouldthenresidebodilyintheworld,implicatingnotonly andcontextualawareness(Vardeetal.2015).Questions,
information processing but also neurobiology and anthro- such as ôWhat is the traffic looking like?ö, showcase
| pology (Haugeland |     | and | Dreyfus | 1996). | Moreover, |     | Dreyfus |             |     |                |     |            |       |            |
| ----------------- | --- | --- | ------- | ------ | --------- | --- | ------- | ----------- | --- | -------------- | --- | ---------- | ----- | ---------- |
|                   |     |     |         |        |           |     |         | the ability | to  | use contextual |     | awareness. | Given | that Siri, |
focuses excessively on the detailed architecture and physi- for example, would respond based on live data of sur-
cal form of computers (Collins 1996), neglecting real-time rounding traffic and the location. This creates a seem-
interactionsandsocialdimensionsshapingAIcapabilities. inglyaccurateresponse,includingcasessuchasweather
KeepingupwithDreyfusÆtradition,TimothyKoschmann requests.Asthisadaptsbasedonvariousfactorsthatsur-
exploredthesymbolicgroundingissuefurtherandextended
roundtheuser,contextualawarenessmaybedetermined
the critique to the inadequacy of specifying all exception inthiscase,atleasttoacertaindegree(Signorelli2018).
clausesandtheconjecturalnatureofarguments(Koschmann Commonsenselacksanofficialdefinition,makingitex-
1996).HeemphasizedthenecessityforAItoemploymul- tremelydifficulttoargueifithasbeencompleted(Varde
| tiple strategies |     | and approaches, |     | contributing |     | to the | broader |        |       |          |        |                 |     |          |
| ---------------- | --- | --------------- | --- | ------------ | --- | ------ | ------- | ------ | ----- | -------- | ------ | --------------- | --- | -------- |
|                  |     |                 |     |              |     |        |         | et al. | 2015; | Shanahan | et al. | 2020). However, |     | examples |
non-formalist,anti-representationalistdebatewithinthesit-
|     |     |     |     |     |     |     |     | from | virtual | assistants | that | learn and | better during | their |
| --- | --- | --- | --- | --- | --- | --- | --- | ---- | ------- | ---------- | ---- | --------- | ------------- | ----- |
uated cognition controversy (Koschmann 1996). This is usage, allow a certain amount of common sense to be
largelythecaseforallofDreyfusÆwork,ashewasoneofthe includedintheresponsesgiven,whichcreatestheargu-
main followers of this philosophy, and is further supported ment on the possibility of systems being able to have
| by other | prevalent | reviewers |     | and | philosophers | (Buchanan |     |        |        |     |          |           |      |             |
| -------- | --------- | --------- | --- | --- | ------------ | --------- | --- | ------ | ------ | --- | -------- | --------- | ---- | ----------- |
|          |           |           |     |     |              |           |     | common | sense. | For | example, | if a user | asks | the virtual |
1972;Koschmann1987;Papert1968).
|     |     |     |     |     |     |     |     | personal | assistant |     | to book | a flight, | the system | uses its |
| --- | --- | --- | --- | --- | --- | --- | --- | -------- | --------- | --- | ------- | --------- | ---------- | -------- |
249

commonsensecapabilitiestounderstandtheuserÆsinten- reasoning through the human input (Kulikowski 1980).
tion and provide relevant information and options, such Itcanbearguedthatthesystemisnotactuallyreasoning
astheavailableflights,schedules,andprices.Thiscom- morally,insteadremaininglogical.Intheory,itstillonly
monsense decision making process enables the virtual follows if-then statements, as it does not understand the
personal assistant to provide a more human-like and in- moralaspect.Instead,itusesitslogicalreasoningbased
tuitive experience for the user, which can help to build ontheinputsprovidedbythemedicalexperttodetermine
trustandsatisfactioninthetechnology. what the best solution could be, further proving an in-
completeshowcaseofmoralreasoning(Montani2008).
ò EthicalReasoning.Forillustration,wewillinherecon-
sideraspectsfromthefieldofautonomousdriving,which
WhatAreTheMajorBottlenecksfor
is today heavily dependent on various AI technologies.
theThirdWaveofAI?
From a technical standpoint, autonomous vehicles are
relevant because they have to scale to big levels on a Whiletheassumptionofcomplementarystrengthsmakesit
relatively simple premise. Hybrid AI systems in use on tempting to assume unlimited opportunities for hybrid AI,
autonomous vehicles rely on computer vision, control onemaystillwellconsiderseveralrelevantbottleneckseven
systems,machinelearning,anddeeplearning(Kisac?anin wherecomplementationworksgenerallyoutwell.Wecon-
2017).BothlogicAIanddata-drivenAIhavebeencriti- siderinparticularthesepotentialmajorbottlenecks:
cizedbyDreyfusfornotbeingabletomakeethicaldeci-
ò Data. One of the major challenges in data-driven AI is
sions.CanhybridAIsystemsovercomethis?Regarding
the factor of training data, in particular the labeling of
control systems and machine learning algorithms of ve-
such (Roh, Heo, and Whang 2021). Data selection and
hicles, this can not really be confirmed (Fridman et al.
qualityhasdirectinfluenceonthequalityoftheresulting
2017). Control systems, as the name suggests, are re-
model,andwiththeincreaseinavailabledataintodayÆs
sponsibleforthevehicleÆscontrols.Thismeanstheyde-
world, one would expect the possibilities of a modelÆs
terminethevehiclesÆpath,speed,andtrajectorybasedon
capabilitiestoincrease.However,thisistruetoacertain
thesensorÆsinputsandotheralgorithmsatwork.
extent as many practitioners will be able to tell. Differ-
Highlighting,thefactthatifthevehiclehadtochoosebe- ent developers and stakeholders have diverse criteria of
tween taking a humanÆs life and hitting a pole, it would selection,quality,andsuccess.Similarissuearisearound
inmostcaseshitthepole.Therefore,seeminglydemon- thelabellingofdata,whichevenif(orpotentiallydueto)
strating ethical reasoning (Gerdes and Thornton 2015). being carried out by humans may sometimes be faulty,
Dreyfus, however, would contradict. Due to the nature biased,orinsufficientinamount(Roh,Heo,andWhang
ofhisstatementsandthedefinitionofethicalreasoning, 2021).ThesecritiquepointshadbeenraisedbyDreyfusÆ
hybridAIisnotabletomakeanethicaldecisioninaspe- laterwork(Dreyfus1992).
cificcase:Eventhoughitseemstodoso,itcanonlybe
Is hybrid AI free from these issue of data-driven AI?
madeifitishardcoded(Bonnemains,Saurel,andTessier
Although the functionality of hybrid AI systems do not
2018).Thecontrolsystemsinthiscasearelogicallydeci-
solely rely on training data like data-driven AI, due to
pheringwhattodo,notreasoningbythemselves.Overall,
their hybrid nature they remain based at least in part on
thiswouldmeanthatalthoughitcanmirrortheeffectof
trainingdatainputtedbythehuman.Thehypothesisthat
ethicalreasoning,itisnotengaginginitfully.
theprocessofsystemdesigndoesnotleadtohuman-like
ò Moral Reasoning. Both logic AI and data-driven AI abilities seems to remain true as the problem can stem
have been criticized by Dreyfus for not being able to fromevenbeforethemodeliscreated,hence,evenifthe
achieve moral reasoning. This concept itself is hard to modelsbecomebettertheissuesremainandDreyfusre-
define, as many different interpretations exist of what it mainscorrect(Dreyfus1992).
encompasses.Yet,hybridAIhasseenadvancementsand ò Predictions. An interesting approach to the argument
successesregardingthistopic.Inmedicalrecommenda- of what hybrid AI can or cannot do is looking at other
tion and diagnosis systems (Kulikowski 1980), for ex- description used for the overarching AI systems. One
ample, a machine learning component may be trained of these alternative names is ôprediction machinesö,
on data related to medical ethics, such as best practices used for example in economics or businesses contexts
for informed consent and respect for patient autonomy. (Agrawal,Gans,andGoldfarb2018),butalsosupported
Thecorrespondingexpertsystemcomponentprovidesa by findings of psychological research (Schrimpf et al.
human-like understanding of moral considerations and 2021). This perspective highlights some further reasons
valuesandcanmakeinformedmoraldecisions.Inasit- why it is so difficult to argue against statements made
uation where the system is faced with a decision about by Dreyfus: The argument is the fact that machines do
whether to recommend a risky medical procedure, the notactuallyôknowöwhattheyaredoing,butratherpre-
system would then imply its moral reasoning capabili- dictwhattheyshouldbedoing,basedontheinputgiven.
tiestomakeadecisionthatalignswithmoralprinciples ThisissupportedbythestatementmadebyDreyfusthat
andvalues,suchasthepatientÆsautonomyandinformed itÆs incredibly hard to separate the knowledge from the
consent (Montani 2008). Similar to the argument about knower (Dreyfus 1992). Famously, humans often know
ethicalreasoning,however,moralreasoningremainsin- morethantheycanputintowords,letaloneputintocon-
complete.Ittrainsondifferentdata,andcreatesthemoral textualstatementsbasedonif-thenrules.
250

With this idea, it becomes apparent why the work of Conclusions
| Dreyfus      | with | its astonishing |         | polarizing |     | attack     | on AI as |          |                 |     |          |        |        |             |      |
| ------------ | ---- | --------------- | ------- | ---------- | --- | ---------- | -------- | -------- | --------------- | --- | -------- | ------ | ------ | ----------- | ---- |
|              |      |                 |         |            |     |            |          | Over the | last decades,   |     | DreyfusÆ | ideas  | and    | views have  | been |
| such remains |      | studied.        | TodayÆs | hybrid     |     | AI systems | are      |          |                 |     |          |        |        |             |      |
|              |      |                 |         |            |     |            |          | shaping  | both scientific |     | and      | public | debate | about goals | and  |
closetodemonstratingallthefeaturesshownbyDreyfus,
|     |     |     |     |     |     |     |     | challenges | of AI. | Although |     | not particularly |     | welcomed | by  |
| --- | --- | --- | --- | --- | --- | --- | --- | ---------- | ------ | -------- | --- | ---------------- | --- | -------- | --- |
butdosoinanalmostimposter-typeway(Bonnemains,
|              |             |        |           |         |                |            |         | everyone           | in the | AI community, |          | Dreyfus |          | has made    | signif- |
| ------------ | ----------- | ------ | --------- | ------- | -------------- | ---------- | ------- | ------------------ | ------ | ------------- | -------- | ------- | -------- | ----------- | ------- |
| Saurel,      | and Tessier |        | 2018).    | Ethical | and moral      | reasoning, |         |                    |        |               |          |         |          |             |         |
|              |             |        |           |         |                |            |         | icant intellectual |        | contributions |          | to the  | field.   | The variety | of      |
| for example, |             | can be | displayed | in      | these systems, |            | even to |                    |        |               |          |         |          |             |         |
|              |             |        |           |         |                |            |         | responses          | to the | existing      | problems |         | analyzed | by          | Dreyfus |
greatsuccess,asshownintheworldofautonomousvehi-
|     |     |     |     |     |     |     |     | have been | prompting |     | scholars, | researchers, |     | and developers |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | --------- | --- | --------- | ------------ | --- | -------------- | --- |
clesandmedicalsystems;however,theyarenotactually
tocontinuallyreassessandrefinetheirunderstandingofthe
| reasoning | in  | this way, | instead | logically |     | reasoning | based |     |     |     |     |     |     |     |     |
| --------- | --- | --------- | ------- | --------- | --- | --------- | ----- | --- | --- | --- | --- | --- | --- | --- | --- |
capabilitiesofAI(Schmidetal.2021).
onrulesprovidedbytheexpert.Interestingly,somepsy-
chologists argue that humans follow the same pattern, Whilebothdata-drivenandhybridAIsystemshaveseen
significantprogressinmanyareas,theystillhavelimitations
| as in  | some cases | it  | is unclear | if         | it is logical |     | reasoning |         |             |     |       |             |       |              |     |
| ------ | ---------- | --- | ---------- | ---------- | ------------- | --- | --------- | ------- | ----------- | --- | ----- | ----------- | ----- | ------------ | --- |
|        |            |     |            |            |               |     |           | and are | not capable | of  | fully | replicating | human | intelligence |     |
| taught | as ethical | or  | moral      | reasoning, | compared      |     | to actu-  |         |             |     |       |             |       |              |     |
andexperience.Majorbottlenecksforfuturesystemswillbe
| ally reasoning |     | morally | or  | ethically | (Kulikowski |     | 1980). |     |     |     |     |     |     |     |     |
| -------------- | --- | ------- | --- | --------- | ----------- | --- | ------ | --- | --- | --- | --- | --- | --- | --- | --- |
data,thepredictivenatureofsuchsystems,butalsothehu-
| Instead, | the | difference | seems | to  | be that | we understand |     |                 |     |       |          |        |     |        |         |
| -------- | --- | ---------- | ----- | --- | ------- | ------------- | --- | --------------- | --- | ----- | -------- | ------ | --- | ------ | ------- |
|          |     |            |       |     |         |               |     | mans developing |     | these | systems. | Hybrid | AI  | may be | able to |
andcancreatenewandadaptiveinterpretationsofthese
rules, especially to previously unknown challenges. To- makedecisionsbasedonpre-definedprinciplesandvalues,
performnaturallanguageprocessingandrecognizepatterns
| gether | with | the fact | that | these systems |     | rely heavily | on  |     |     |     |     |     |     |     |     |
| ------ | ---- | -------- | ---- | ------------- | --- | ------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- |
indata,butnottoreplicatehumanemotions,empathy,cre-
predictions,itmakessenseastowhytheyareincomplete
ativity,andintuition.
(Agrawal,Gans,andGoldfarb2018).
Tothisend,theadvancementsinhybridAIhavenotcom-
|           |     |          |      |             |            |             |           | pletely disproven |                 | DreyfusÆ  | statements |              | on  | the limitations | of  |
| --------- | --- | -------- | ---- | ----------- | ---------- | ----------- | --------- | ----------------- | --------------- | --------- | ---------- | ------------ | --- | --------------- | --- |
| ò Humans. | Let | us take  | on   | yet another |            | perspective | and       |                   |                 |           |            |              |     |                 |     |
|           |     |          |      |             |            |             |           | AI. Remember,     |                 | he argued | that       | AI systems   |     | would never     | be  |
| assume    | for | a moment | that | we          | as a human |             | developer |                   |                 |           |            |              |     |                 |     |
|           |     |          |      |             |            |             |           | able to           | fully replicate |           | human      | intelligence |     | and experience, |     |
wouldaimtocreateahybridAIsystemwithoneofhu-
|     |     |     |     |     |     |     |     | due to their | lack | of understanding. |     |     | While | hybrid | AI sys- |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------ | ---- | ----------------- | --- | --- | ----- | ------ | ------- |
mankindÆsmostimportantabilities:creativity.Wouldwe
in this respect self-limit our capability to produce cre- temshavecomeclosertodisprovingthestatementsregard-
ingcommonsenseorethicalreasoningsincethe1960s,they
| ative, | intelligent | machines? |     | In line | with | the | statement |     |     |     |     |     |     |     |     |
| ------ | ----------- | --------- | --- | ------- | ---- | --- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
stilllacktheconclusiontodoûorareonlycreatingasuper-
madeaboveandsupportedbyDreyfus:Yes,becausewe
ficialdisapprovaldoingthissuperficially.
cannotactuallyputintowordshowtoachievethisgoal,
andhencecannotcreatethesystemsneeded. So are DreyfusÆ work and arguments still relevant in
|     |     |     |     |     |     |     |     | times of | the third | wave | of AI? | They | are. | This is not | solely |
| --- | --- | --- | --- | --- | --- | --- | --- | -------- | --------- | ---- | ------ | ---- | ---- | ----------- | ------ |
Contrarily,consideringthatdatamakethesystemsfunc- due to the philosophical nature of his statements, and its
tion,therealizationhastobemade,thattheissuesstem interpretability range being so large. There is little indi-
fromamuchdeeperproblem.Therefore,itmightevenbe cation, for example, that actual moral and ethical reason-
accuratetosay,thatmodelsandsystemsarenotthesole ing can be carried out and communicated in a reliable and
problem,northetechniquescurrentlyinuse.Rather,hu-
human-understandablefashionbytodayÆsAIsystems.Cer-
mandeveloperspreparingandemployingthedataremain tified safety criteria, for example, will therefore have to be
one of the primary blocking factors of advancements. decidedbylaw(YuandAl`?2019).
Whileoveralldataavailabilityisincreasing,theproblems
facedincreaseinthesamemanner,suchasthedifficulty
References
ofproperlymanagingallofthisdata,orlabellingitcor-
rectly.Thisinfluencesthetrainingofthemodelsandalso Agrawal, A.; Gans, J.; and Goldfarb, A. 2018. Prediction
itsresults(Roh,Heo,andWhang2021).Hence,returning machines: the simple economics of artificial intelligence.
tothestatementthattheproblemofDreyfusÆsstatements HarvardBusinessPress.
isnotentirelyrelatedtothetechnologyitself,butlargely
Bonnemains,V.;Saurel,C.;andTessier,C.2018.Embedded
thehumandefinitionsofcertainaspects.Further,Dreyfus
|     |     |     |     |     |     |     |     | ethics: some | technical |     | and ethical |     | challenges. | Ethics | and |
| --- | --- | --- | --- | --- | --- | --- | --- | ------------ | --------- | --- | ----------- | --- | ----------- | ------ | --- |
statementsremainsoopen-ended,andhumandefinitions
InformationTechnology,20:41û58.
soprecise,yetunexplainable(Dreyfus1992).
|     |     |     |     |     |     |     |     | Buchanan, | B.  | G. 1972. |     | Review | of  | Hubert | DreyfusÆ |
| --- | --- | --- | --- | --- | --- | --- | --- | --------- | --- | -------- | --- | ------ | --- | ------ | -------- |
Evenifthiscanchange,inhybridAIdevelopmentthere What Computers CanÆt Do: A Critique of Artificial Rea-
| are always | experts, |     | designing | the | models | and | creating |     |     |     |     |     |     |     |     |
| ---------- | -------- | --- | --------- | --- | ------ | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
son:(Harper&Row,NewYork,1972).
| them.    | These | limitations | can | be considered |      | vital, | due to |                                            |       |       |          |     |           |            |        |
| -------- | ----- | ----------- | --- | ------------- | ---- | ------ | ------ | ------------------------------------------ | ----- | ----- | -------- | --- | --------- | ---------- | ------ |
|          |       |             |     |               |      |        |        | Collins,                                   | H. M. | 1996. | Embedded | or  | embodied? | A          | review |
| the size | of AI | systems,    | as  | the ôblack    | boxö | within | these  |                                            |       |       |          |     |           |            |        |
|          |       |             |     |               |      |        |        | ofHubertDreyfusÆwhatcomputersstillcanÆtdo. |       |       |          |     |           | Artificial |        |
becomesincreasinglycomplicated(YuandAl`?2019).In
Intelligence,80(1):99û118.
| many | systems, | not | only in | LLMs | but also | hybrid | sys- |     |     |     |     |     |     |     |     |
| ---- | -------- | --- | ------- | ---- | -------- | ------ | ---- | --- | --- | --- | --- | --- | --- | --- | --- |
tems,itisactuallyhardtotellcomprehensivelyonwhich Colon-Hernandez, P.; Havasi, C.; Alonso, J.; Huggins,
groundsindividualdecisionsaremade.Tosomeextend, M.; and Breazeal, C. 2021. Combining pre-trained lan-
this may be reduced by approaches such as rule extrac- guage models and structured knowledge. arXiv preprint
| tionfromneuralnetworks(Jacobsson2005). |     |     |     |     |     |     |     | arXiv:2101.12294. |     |     |     |     |     |     |     |
| -------------------------------------- | --- | --- | --- | --- | --- | --- | --- | ----------------- | --- | --- | --- | --- | --- | --- | --- |
251

Crossman,E.K.1985. Thekissandthepromise:Areview Montani,S.2008. Exploringnewrolesforcase-basedrea-
ofHubertL.DreyfusÆWhatComputersCanÆtDo:TheLim- soning in heterogeneous AI systems for medical decision
its of Artificial Intelligence. Journal of the Experimental support. AppliedIntelligence,28:275û285.
AnalysisofBehavior,44(2):271. Papert, S. A. 1968. The artificial intelligence of Hubert L.
Descartes, R. 1996. Meditations on First Philosophy with Dreyfus:Abudgetoffallacies.
SelectionsfromtheObjectionsandReplies/trans.andedited Roh, Y.; Heo, G.; and Whang, S. E. 2021. A Survey on
byJohnCottingham. DataCollectionforMachineLearning:ABigData-AIIn-
| Dreyfus,H.;andDreyfus,S.E.1986. |     |     |     |     | Mindovermachine. |     |     |     |     |     |     |     |     |     |
| ------------------------------- | --- | --- | --- | --- | ---------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
tegrationPerspective.IEEETransactionsonKnowledgeand
| SimonandSchuster. |     |     |     |     |     |     |     | DataEngineering,33(4):1328û1347. |     |     |     |     |     |     |
| ----------------- | --- | --- | --- | --- | --- | --- | --- | -------------------------------- | --- | --- | --- | --- | --- | --- |
Dreyfus,H.L.1965. Alchemyandartificialintelligence. Schmid, T. 2023. A Systematic and Efficient Approach to
Dreyfus, H. L. 1972. What computers canÆt do: The limits the Design of Modular Hybrid AI Systems. In Martin, A.;
ofartificialintelligence. Hinkelmann, K.; Fill, H.-G.; Gerber, A.; Lenat, D.; Stolle,
|                   |     |     |                                 |     |     |     |     | R.; and | van Harmelen, |     | F., eds., | Proceedings | of  | the AAAI |
| ----------------- | --- | --- | ------------------------------- | --- | --- | --- | --- | ------- | ------------- | --- | --------- | ----------- | --- | -------- |
| Dreyfus,H.L.1992. |     |     | WhatcomputersstillcanÆtdo:Acri- |     |     |     |     |         |               |     |           |             |     |          |
2023SpringSymposiumonChallengesRequiringtheCom-
| tiqueofartificialreason. |     |     | MITpress. |     |     |     |     |     |     |     |     |     |     |     |
| ------------------------ | --- | --- | --------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
binationofMachineLearningandKnowledgeEngineering
Fridman,L.;Brown,D.E.;Glazer,M.;Angell,W.;Dodd,S.;
(AAAI-MAKE2023).
| Jenik, B.; | Terwilliger, |     | J.; Kindelsberger, |     | J.; | Ding, | L.; Sea- |     |     |     |     |     |     |     |
| ---------- | ------------ | --- | ------------------ | --- | --- | ----- | -------- | --- | --- | --- | --- | --- | --- | --- |
Schmid,T.;Hildesheim,W.;Holoyad,T.;andSchumacher,
| man, S.; | et al. | 2017. | MIT autonomous |     | vehicle | technology |     |     |     |     |     |     |     |     |
| -------- | ------ | ----- | -------------- | --- | ------- | ---------- | --- | --- | --- | --- | --- | --- | --- | --- |
K.2021. TheAIMethods,CapabilitiesandCriticalityGrid.
| study: Large-scale |     | deep | learning | based | analysis |     | of driver |     |     |     |     |     |     |     |
| ------------------ | --- | ---- | -------- | ----- | -------- | --- | --------- | --- | --- | --- | --- | --- | --- | --- |
behavior and interaction with automation. arXiv preprint KI-Ku¿nstlicheIntelligenz,35(0):425û440.
arXiv:1711.06976,1. Schrimpf,M.;Blank,I.A.;Tuckute,G.;Kauf,C.;Hosseini,
Gerdes, J. C.; and Thornton, S. M. 2015. Implementable E.A.;Kanwisher,N.;Tenenbaum,J.B.;andFedorenko,E.
Ethics for Autonomous Vehicles, 87û102. Berlin, Heidel- 2021. Theneuralarchitectureoflanguage:Integrativemod-
elingconvergesonpredictiveprocessing.Proceedingsofthe
| berg:SpringerBerlinHeidelberg. |     |     |     | ISBN978-3-662-45854- |     |     |     |     |     |     |     |     |     |     |
| ------------------------------ | --- | --- | --- | -------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
NationalAcademyofSciences,118(45):e2105646118.
9.
Haugeland, J.; and Dreyfus, H. L. 1996. Body and world: Shanahan,M.;Crosby,M.;Beyret,B.;andCheke,L.2020.
|          |         |           |     |             |     |            |     | Artificial | Intelligence |     | and the | Common Sense | of  | Animals. |
| -------- | ------- | --------- | --- | ----------- | --- | ---------- | --- | ---------- | ------------ | --- | ------- | ------------ | --- | -------- |
| a review | of What | Computers |     | Still CanÆt | Do: | A Critique | of  |            |              |     |         |              |     |          |
TrendsinCognitiveSciences,24(11):862û872.
| ArtifcialReason. |     | Artificialintelligence,80(1):119û128. |     |     |     |     |     |     |     |     |     |     |     |     |
| ---------------- | --- | ------------------------------------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
Jacobsson, H. 2005. Rule extraction from recurrent neu- Signorelli,C.M.2018. CanComputersBecomeConscious
|                                 |     |     |     |     |                    |     |     | and Overcome |     | Humans? | Frontiers | in Robotics |     | and AI, 5: |
| ------------------------------- | --- | --- | --- | --- | ------------------ | --- | --- | ------------ | --- | ------- | --------- | ----------- | --- | ---------- |
| ralnetworks:Ataxonomyandreview. |     |     |     |     | NeuralComputation, |     |     |              |     |         |           |             |     |            |
121.
17(6):1223û1263.
Kisac?anin, B. 2017. Deep Learning for Autonomous Ve- Tonmoy, S.; Zaman, S.; Jain, V.; Rani, A.; Rawte, V.;
|         |         |      |      |               |     |           |     | Chadha,          | A.; and | Das,       | A. 2024.   | A Comprehensive |       | Survey   |
| ------- | ------- | ---- | ---- | ------------- | --- | --------- | --- | ---------------- | ------- | ---------- | ---------- | --------------- | ----- | -------- |
| hicles. | In 2017 | IEEE | 47th | International |     | Symposium | on  |                  |         |            |            |                 |       |          |
|         |         |      |      |               |     |           |     | of Hallucination |         | Mitigation | Techniques | in              | Large | Language |
Multiple-ValuedLogic(ISMVL),142û142.
arXivpreprintarXiv:2401.01313.
| Koschmann,    | T.     | 1996.       | Of Hubert | Dreyfus        | and      | dead  | horses: | Models.                                              |     |                                      |           |                          |     |            |
| ------------- | ------ | ----------- | --------- | -------------- | -------- | ----- | ------- | ---------------------------------------------------- | --- | ------------------------------------ | --------- | ------------------------ | --- | ---------- |
|               |        |             |           |                |          |       |         | van Bekkum,                                          | M.; | de                                   | Boer, M.; | van Harmelen,            |     | F.; Meyer- |
| some thoughts |        | on DreyfusÆ |           | What Computers |          | Still | CanÆt   |                                                      |     |                                      |           |                          |     |            |
|               |        |             |           |                |          |       |         | Vitali,A.;andTeije,A.t.2021.                         |     |                                      |           | Modulardesignpatternsfor |     |            |
| Do:(MIT       | Press, | Cambridge,  |           | MA, 1992);     | liii+    | 354   | pages,  |                                                      |     |                                      |           |                          |     |            |
| 13.95.        |        |             |           |                |          |       |         | hybridlearningandreasoningsystems:ataxonomy,patterns |     |                                      |           |                          |     |            |
|               |        |             |           |                |          |       |         | andusecases.                                         |     | AppliedIntelligence,51(9):6528û6546. |           |                          |     |            |
| Koschmann,    | T.     | D. 1987.    | Mind      | over           | machine: | The   | power   |                                                      |     |                                      |           |                          |     |            |
Varde,A.;Tandon,N.;Chowdhury,S.N.;andWeikum,G.
ofhumanintuitionandexpertiseintheeraofthecomputer:
Hubert L. Dreyfus and Stuart E. Dreyfus (Basil Blackwell, 2015. Commonsenseknowledgeindomain-specificknowl-
Oxford,1986);223pages,ú15.00. edge bases. Tech Rep, Max-Planck-Institut fur Informatik
(Saarbru¿cken,Germany).
| Kulikowski, | C.  | A. 1980. | Artificial |     | intelligence |     | methods |     |     |     |     |     |     |     |
| ----------- | --- | -------- | ---------- | --- | ------------ | --- | ------- | --- | --- | --- | --- | --- | --- | --- |
and systems for medical consultation. IEEE Transactions Witschel, H. F.; Pande, C.; Martin, A.; Laurenzi, E.; and
on Pattern Analysis and Machine Intelligence, PAMI-2(5): Hinkelmann,K.2021. VisualizationofPatternsforHybrid
| 464û476. |     |     |     |     |     |     |     | LearningandReasoningwithHumanInvolvement.InDorn- |     |     |     |     |     |     |
| -------- | --- | --- | --- | --- | --- | --- | --- | ------------------------------------------------ | --- | --- | --- | --- | --- | --- |
berger,R.,ed.,NewTrendsinBusinessInformationSystems
| Lake, B.      | M.; Ullman, |                                       | T. D.; Tenenbaum, |     | J.  | B.; and | Gersh- |                 |     |         |            |     |         |          |
| ------------- | ----------- | ------------------------------------- | ----------------- | --- | --- | ------- | ------ | --------------- | --- | ------- | ---------- | --- | ------- | -------- |
|               |             |                                       |                   |     |     |         |        | and Technology: |     | Digital | Innovation | and | Digital | Business |
| man,S.J.2017. |             | Buildingmachinesthatlearnandthinklike |                   |     |     |         |        |                 |     |         |            |     |         |          |
people. Behavioralandbrainsciences,40:e253. Transformation,193û204.Cham:Springer.
Yu,R.;andAl`?,G.S.2019.WhatÆsInsidetheBlackBox?AI
| McGarry, | K.; Wermter, |     | S.; and | MacIntyre, |     | J. 1999. | Hy- |     |     |     |     |     |     |     |
| -------- | ------------ | --- | ------- | ---------- | --- | -------- | --- | --- | --- | --- | --- | --- | --- | --- |
bridneuralsystems:fromsimplecouplingtofullyintegrated ChallengesforLawyersandResearchers.LegalInformation
neuralnetworks. NeuralComputingSurveys,2(1):62û93. Management,19(1):2û13.
|          |       |            |     |         |     |        |         | Zhang, C.; | Zhang, | C.; | Zhang, | M.; and Kweon, | I.  | S. 2023. |
| -------- | ----- | ---------- | --- | ------- | --- | ------ | ------- | ---------- | ------ | --- | ------ | -------------- | --- | -------- |
| Min, B.; | Ross, | H.; Sulem, | E.; | Veyseh, | A.  | P. B.; | Nguyen, |            |        |     |        |                |     |          |
T. H.; Sainz, O.; Agirre, E.; Heintz, I.; and Roth, D. 2023. Text-to-image diffusion model in generative ai: A survey.
Recent advances in natural language processing via large arXivpreprintarXiv:2303.07909.
| pre-trained | language |     | models: | A survey. | ACM | Computing |     |     |     |     |     |     |     |     |
| ----------- | -------- | --- | ------- | --------- | --- | --------- | --- | --- | --- | --- | --- | --- | --- | --- |
Surveys,56(2):1û40.
252
