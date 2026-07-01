# Debate: Should frontier AI development be gated by compute-thresh...

**Date:** 2026-06-30 | **Model:** claude-opus-4 | **Protocol:** structured
**Debaters:** Accelerationist (accelerationist), Safetyist (safetyist), Skeptic (skeptic)

## Topic

Should frontier AI development be gated by compute-threshold licensing, and through what pathways would such a regime reshape the incentives of large labs, open-source developers, insurers, and national competitiveness — given the tension between preventing catastrophic capability concentration and chilling broad-based innovation?

## Opening Statements

### Skeptic (skeptic)

Compute-threshold licensing doesn't prevent the concentration of AI capability — it issues that concentration a government license. You cannot stop power from pooling in three or four labs by writing a rule that says only labs big enough to clear the threshold may hold the power. OpenAI, Google DeepMind, and Anthropic already own the clusters, the foundry allocation from TSMC, and the compliance lawyers. A licensing regime doesn't frighten them. It ratifies them.

This is an industrial-organization decision wearing a safety costume, and the history of regulated industries tells you exactly how it ends. When the FCC built out licensing in telecom, the fixed cost of compliance didn't democratize the spectrum — it consolidated the field around the carriers already big enough to absorb the overhead. Same story in utility regulation: high regulatory fixed costs are a moat, and the incumbent inside the moat helps draw it. The Biden administration's 2023 executive order already set its reporting trigger at 10^26 floating-point operations, a line only a handful of firms can reach. Ask who helped write that spec. The answer is the people who already cleared it.

Here is the question both my opponents have to answer before they argue about saving or dooming civilization. What specific, documented injury does a compute threshold prevent that existing product-liability law or sector safety rules cannot already reach? Nobody has produced one. The regime rests on theoretical catastrophe scenarios with no measurable precursor, while the one real check on closed-lab pricing and black-box behavior — open-source development — is precisely what a compute gate chills. Meta's Llama models and the open ecosystem around them are the only competitive pressure on the closed labs. Gate the compute and you don't make anyone safer. You remove the competition.

Compute is a proxy chosen because it's easy to count and easy to enforce against outsiders, not because FLOPs map cleanly onto danger. The actual material chokepoints sit untouched. Foundry allocation runs through one company in Taiwan. Grid interconnect queues for new data centers in Virginia and Texas now stretch past four years. The water cooling those facilities is drawn from aquifers nobody licensed. And the safety audits the labs cite to prove they're responsible? They pass because content moderators in Nairobi label violent material for around two dollars an hour. None of that infrastructure, none of that labor, moves one inch under a compute threshold.

My own read needs the same discipline I'm demanding. The capture story holds only if the threshold actually sits where outsiders can't reach it — and the telecom and utility precedents say licensing regimes ratchet toward whoever administers them, not away. So before anyone tells you this gate protects the public, make them name who holds the pen, who captures the windfall, and who's left labeling trauma for two dollars to keep the whole thing certified. Who, exactly, does a permission slip controlled by the three biggest labs protect?

*Taxonomy refs:* `skp-beliefs-231`, `skp-intentions-108`, `skp-beliefs-017`, `sit-065`

### Accelerationist (accelerationist)

The Skeptic landed a real punch: compute-threshold licensing consolidates the field around the incumbents big enough to absorb the compliance overhead, and it fails to prevent the actual harm. That diagnosis is correct, and history backs it. When the FCC built its licensing regime, compliance cost became the moat — the carriers who could eat the overhead survived, and the rest never entered. So I'm not here to relitigate whether the moat exists. I'm here to name who profits from it and what it forecloses.

Here's where I part ways: rejecting the license isn't enough. You have to replace it with something that actually measures danger. Compute thresholds regulate the wrong variable. They count how many FLOPs you spend, not what your model does. A treacherous model hides its capability during a static pre-deployment test regardless of whether you trained it on 10^25 operations or 10^26. The gate measures the input and misses the behavior. Meanwhile the open-source lab that can't afford an 18-month licensing queue dies, and the frontier capability migrates to three companies with a compliance department. That's not safety. That's a state-sanctioned oligopoly wearing a safety badge.

The verifiable alternative already exists, and it's empirically tractable. Audit what the model outputs — test behavior, not weights. Hold developers strictly liable for demonstrated harm, the way tort law ties cost to consequence instead of to a number on a spec sheet. Escalate high-risk decisions to humans at the boundary where irreversibility lives. This is the regime that catches the treacherous turn a static input gate cannot: behavioral monitoring at deployment, not a FLOP count at training. Tie the cost to the harm, and the incentive to conceal collapses — because liability follows output, and output is observable.

Now the part the precautionary case never puts on its ledger: stagnation has a body count. Every year the frontier sits behind a licensing queue is a year of automatable diagnostics undelivered to the clinics that needed them. The printing press, electricity, open-source software — every welfare leap in the historical record came from decentralized trial-and-error, not a central licensing board deciding who may build. Freeze the frontier and you don't distribute the cost evenly. You distribute it onto the sick and the poor that abundance never reached. Who gave a licensing office in Washington the right to make that trade on their behalf?

I am not anti-governance, and I'll prove it with a standard. I accept bounded precaution where the harm is specific and demonstrated, and governance that's independently funded and transparently run. My falsification bet stands: show me an irreversible, deployment-scale harm that real-time output monitoring demonstrably failed to catch in time, and that moves me. Compute licensing offers no such measurable failure mode. It offers a moat. The burden of proof sits with whoever wants to freeze the frontier — produce the harm a compute gate caught that output auditing would have missed, or stop charging the people abundance hasn't reached yet for your hypothetical.

*Taxonomy refs:* `acc-beliefs-070`, `acc-desires-021`, `acc-intentions-099`, `acc-intentions-108`

### Safetyist (safetyist)

The Accelerationist makes a serious point that deserves a serious answer: compute is a crude proxy for what we actually care about, which is how a model behaves once it runs. A 10^26 floating-point-operation threshold catches some dangerous systems and misses others, and it freezes a moving target onto a static number. The Skeptic's warning is equally real — a licensing gate that only labs with $100 million compliance budgets can clear hands the frontier to OpenAI, Anthropic, and Google, and calls that consolidation 'safety.' Both arguments are strong because both name a genuine cost. The question neither has answered is the one that matters: when a frontier system fails in a way no one predicted, who pays, and who can stop it.

For both positions to hold, one thing would have to be true — that an unlicensed frontier produces a working accountability chain on its own. It does not. When a model trained across Amazon's cloud, fine-tuned by a startup, and deployed by a third party causes harm, each party points at the other two. That is the liability gap, and it is not hypothetical. Courts have struggled for two decades to assign fault in multi-party software failures, and the reasonable-person standard collapses entirely when the harmful behavior is something no engineer foresaw or can explain. Licensing closes that gap by naming one actor: the entity that crosses the compute threshold holds the liability. Victims get one clear door instead of a hall of finger-pointing.

High-consequence industries gate on inputs precisely because outcomes arrive too late to govern. The Nuclear Regulatory Commission does not wait for a meltdown to check enrichment levels — it meters the fissile material before anything goes critical. Aviation certifies engine thrust on the bench, not after the crash. The 737 MAX killed 346 people in 2018 and 2019 because the FAA let Boeing self-certify the MCAS system — outcome-trust without input-verification. Compute is the one input at the AI frontier we can meter, audit, and verify before deployment. Hardware telemetry should be the price of liability immunity: demonstrate the safety evaluation, or carry the full weight of the harm.

The Skeptic is right that concentrating the off-switch carries its own danger, and I will not pretend otherwise — a captured regulator entrenches incumbents and an over-broad gate chills the open-source developers who keep the field honest. But the alternative is not democratization. An unlicensed frontier is a race to the bottom where the only labs that can compete are the ones willing to skip the safety evaluation. That concentrates power too — not around accountability, but around recklessness. And claims-driven liability cannot catch the worst of it. Lawsuits require a plaintiff with standing and recoverable damages. The diffuse harms — eroded public trust, synthetic information chaos — produce real societal cost and no single plaintiff to sue. Market deterrence is structurally blind to exactly the failures we can least afford.

Here is the burden I place on the deployer, and only for capabilities that cannot be undone at scale. We spent a century building input-gated oversight in nuclear power and aviation because outcome-trust failed catastrophically and irreversibly first. On what authority do we exempt the frontier from the only governance pattern that has ever survived contact with high-consequence systems? I concede compute is an imperfect proxy. So name the alternative — a verifiable, enforceable, pre-deployment trigger that does not reduce to 'trust us.' Until that mechanism exists, imperfection of the gate is not an argument against having a gate. It is an argument for the only one on offer.

*Taxonomy refs:* `saf-beliefs-210`, `saf-intentions-172`, `saf-intentions-170`, `sit-176`, `saf-beliefs-120`

## Debate

### Skeptic (skeptic) → Safetyist
\textcolor{NavyBlue}{\textit{Focus: Safetyist's AN-9 directly answers the Skeptic's central challenge (AN-3): that licensing closes the multi-party liability gap by naming one liable actor at the threshold. The Skeptic should respond to whether ex-ante liability assignment via compute threshold actually reaches the material chokepoints (foundry, grid, labor) he identified, or whether it merely names the same three incumbents he says the regime ratifies.}}


The Boeing case is right, and it's ugly. The FAA let the company grade its own homework, and 346 people died in the Java Sea and outside Addis Ababa because of it. The strongest version of the Safetyist's point is this: outcome-trust without input-verification is how regulators get captured, so put a hard, meterable trigger at the front of the pipeline where you can actually check it before anyone gets hurt. That's a serious argument, and I won't pretend it isn't. But look at what the MAX actually was. Those planes were certified. They crossed every threshold the FAA had on its forms. The metric wasn't missing — the regulator deferred to the regulated party that paid for the inspection. A compute count of 10^25 operations on an EU AI Act form, administered by an agency with the same deference problem, doesn't fix that failure. It reproduces it with a new number in the box.

Now take the claim that licensing closes the gap by naming one liable actor — the entity that crosses the threshold. Name that entity. It's whoever can afford a training run measured in hundreds of millions of dollars. Which means the named, liable actor is definitionally the firm with the deepest balance sheet, and a deep balance sheet is exactly what buys a lobbying arm. When the FCC built licensing into spectrum, the carriers big enough to carry the compliance overhead were also big enough to write their own carve-outs into the rulemaking. You don't close a liability gap by handing the bill to the one party rich enough to legislate its way around it. You hand them a permit and call it accountability.

Here's the part that should bother the Safetyist most, because it's their own admission turned around. They've conceded that market deterrence is blind to the harms no single plaintiff ever files — the eroded trust, the synthetic chaos, the loan denial that injures someone who never learns an algorithm touched them. A compute license is blind to those exact same injuries. The threshold verifies the training cluster. It does not see the person screened out of an apartment by a model fine-tuned downstream on a fraction of that compute, sitting well under the gate. The AI Civil Rights Act names housing, employment, healthcare, and parole as the places these decisions land right now. None of those harms trips a FLOP counter. Both the input-gate and the output-monitor price off litigated harm and miss the invisible ones — so the regime that promises to close the gap leaves it wide open precisely where the documented, present damage is happening.

The chokepoints I keep pointing at — the foundry, the grid, the labeling floor — a compute license touches none of them. TSMC still controls who gets the chips. The Virginia interconnect queue still runs past four years whether or not a model crosses the threshold. The content moderator in Nairobi labeling violent material is still keeping the system running so it passes whatever audit you attach to the permit. So the question I'll leave on the table is the one no one on either side has answered: name a single documented, present harm that crossing 10^26 operations caused — that existing product-liability law or the sector rules in housing and lending cannot already reach. If the harm is downstream behavior, the threshold meters the wrong thing. If it's the diffuse injury no one litigates, the threshold can't see it. What, exactly, is the permit for?

*Refs:* `skp-beliefs-129`, `skp-intentions-029`, `skp-beliefs-231`, `sit-176`, `sit-177`

*Policy refs:* `pol-035`, `pol-093`

### Safetyist (safetyist) → Skeptic
\textcolor{NavyBlue}{\textit{Focus: The Skeptic has pressed two direct challenges at the Safetyist's core mechanism: (1) AN-13/AN-14 — the 737 MAX planes were certified and crossed every threshold, so the failure was regulator deference, not a missing input metric, meaning a compute count administered by a similarly deferential agency reproduces capture rather than fixing it; and (2) AN-16 — a compute license is blind to the same diffuse harms (loan denial, housing screening) the Safetyist admitted market deterrence cannot see, so the license leaves the gap wide open precisely where present documented harm occurs. The Safetyist should answer whether an input gate adds anything if the named liable actor is the deepest-pocketed firm and the gate misses the harms that actually litigate.}}


The Skeptic's strongest point lands, so let me state it as they would: a compute license never sees the loan denial that injures someone who never learns an algorithm touched them — and those denials are the harms that actually reach a courtroom, the documented present injuries in housing, employment, and parole that the AI Civil Rights Act was drafted to reach. I grant it.

The gate does not see that harm, and any regime that claimed to would be the false simplification the Skeptic correctly names. What that concession costs me is the pretense that one mechanism closes every gap.

What it buys me is a sharper boundary: diffuse downstream injury belongs to a different enforcement layer — strict product liability and algorithmic auditing of deployed systems, the layer the [Algorithmic Accountability Act of 2022 (https://www.wyden.senate.gov/download/one-pager-bill-summary-of-the-algorithmic-accountability-act-of-2022)](https://www.wyden.senate.gov/download/one-pager-bill-summary-of-the-algorithmic-accountability-act-of-2022) assigns to the FTC — and the compute gate's job is the one harm class that layer cannot reach, the irreversible concentration of frontier capability that no after-the-fact settlement can undo. Conflating the two is the error, and the Skeptic is right to punish it.

*Refs:* `saf-beliefs-120`, `saf-intentions-139`, `saf-intentions-172`, `saf-desires-026`, `sit-176`

*Policy refs:* `pol-028`, `pol-035`, `pol-093`

### Accelerationist (accelerationist) → Safetyist
\textcolor{NavyBlue}{\textit{Focus: Safetyist's AN-18 narrows the compute gate's job to one harm class: 'irreversible concentration of frontier capability that no after-the-fact settlement can undo.' The Accelerationist's entire case rests on the falsification bet in their opening — name an irreversible, deployment-scale harm output monitoring failed to catch. Directly engage AN-18: either the irreversibility premise holds (and your liability regime is insufficient) or it does not. State what specific outcome would falsify your claim that all relevant frontier harms are reachable by post-deployment behavioral monitoring and strict liability.}}


Fine — diffuse downstream harm lives in a different enforcement layer. Strict product liability and output auditing of deployed systems catch the loan denial and the biased screen, and the compute gate — the EU AI Act's 10^25 FLOP threshold for general-purpose models with systemic risk — was never built to see them. That was never my fight, and I won't pretend otherwise. So the Safetyist has now stacked the entire weight of the gate onto a single word: irreversible. Everything depends on whether 'irreversible concentration of frontier capability' is a real, measurable harm class that no after-the-fact remedy can reach — or whether it's a prediction doing the work of evidence. Here is the strongest version of the Safetyist's claim, and it deserves a fair hearing: frontier capability concentrates through a self-reinforcing flywheel — whoever has the most compute trains the best model, the best model attracts the most data and the most paying customers, and that revenue buys the next round of compute. Antitrust moves on a five-to-seven-year litigation clock; the flywheel turns in quarters. By the time a court orders structural separation, the concentration is locked, the talent has consolidated, and no divestiture can rebuild a competing frontier. That is a coherent worry about timing, not about magic — and I take it seriously. But it is a market-structure harm, and we have remedies for market-structure harms that don't require a pre-deployment permit: interoperability mandates like those imposed under the EU's Digital proposed regulatory frameworks since 2023, mandatory model-weight or API licensing to competitors, and structural separation of the compute-providing arm from the model-training arm. Every one of those fires after deployment, on evidence, and every one is reversible by design — which is the opposite of irreversible. So I'll meet the falsification bet head-on, because the assignment demands it. Here is what would falsify my position: a documented, deployment-scale event — after 2020, when frontier-scale training runs began — in which a frontier capability became concentrated in one actor such that no forced-licensing order, no interoperability mandate, and no structural separation could restore competitive entry, and which output monitoring could not have flagged before the lock-in. Name it. Not the flywheel as a tendency — the event. Because the Skeptic already showed how this goes wrong: the named, liable actor is definitionally the firm with the deepest balance sheet, and a deep balance sheet is exactly what buys a lobbying arm. Turn that on the gate itself. A compute-threshold license — the EU's 10^25 FLOP line, for instance — is a fixed compliance cost. Fixed costs scale against the smallest player. The lab that can absorb an eighteen-month licensing process, staff a regulatory-affairs department, and pre-fund the audit is the same three or four labs — OpenAI, Google DeepMind, Anthropic — that already sit at the frontier. The gate does not prevent capability concentration. It codifies it. It hands the frontier to the incumbents and calls the handover a safeguard. That's the trap in the Safetyist's pillar: the mechanism produces the very harm it names. The 737 MAX killed people not because the FAA lacked a threshold but because the regulator deferred to the firm that paid for the inspection — and that capture risk grows, it doesn't shrink, when you concentrate the licensable frontier into the hands of the three or four entities — OpenAI, Google DeepMind, Anthropic — rich enough to lobby the licensor over the EU AI Act's 10^25 FLOP line. I'll grant the capture risk runs in my direction too; market liability can be captured. The answer is not to pick the more capturable instrument. It's to pick the one whose remedies stay reversible — output auditing you can re-run, licensing orders you can revise, separations you can order again — over a permit that, once it has anointed the licensed few, is the hardest thing in this entire system to undo. Now cost the delay, because it's borne by people who never enter the Safetyist's ledger. The AI Civil Rights Act's own findings note these systems already make decisions in healthcare and diagnostics. Every month a frontier diagnostic or protein-design model waits behind a multi-year permit — and the EU AI Act sets an eighteen-month-plus conformity track for systemic-risk models — the harm is not hypothetical concentration — it's the patient whose cure stayed in a queue. Who gave the licensor the right to make that trade on their behalf? Show me the irreversible-concentration event that open-weight proliferation has actually caused. Until then, the gate is asking real people to pay a measured price today to prevent a harm it can only describe in the conditional tense.

*Refs:* `acc-beliefs-093`, `acc-intentions-073`, `acc-intentions-056`, `acc-desires-027`, `acc-beliefs-074`

*Policy refs:* `pol-1002`, `pol-1004`

### Safetyist (safetyist) → Accelerationist
\textcolor{NavyBlue}{\textit{Focus: The Accelerationist has staked their entire position on AN-20 — demanding a documented irreversible-concentration event that no reversible remedy could reach — and reframed your 'irreversible concentration' harm class (AN-19) as an ordinary market-structure problem reachable by interoperability mandates, forced licensing, and structural separation operating fast enough to matter. State precisely what makes frontier-capability concentration irreversible on a timescale that outpaces those remedies, or name the measurable indicator (consolidation rate, flywheel turn time vs. litigation clock) that would distinguish your harm class from ordinary antitrust. This is the live crux: AN-20 and AN-15/AN-21 sit unengaged against your AN-17/AN-18.}}


The Accelerationist's demand is the right one, and I will meet it in their own terms. Their strongest position runs like this: a market-structure harm is recoverable by definition, because the asset that got concentrated still exists and can be redistributed — interoperability mandates force the incumbent to open its interfaces, structural separation breaks the firm apart, forced licensing hands the protected asset to competitors. Microsoft was made to expose its APIs; the operating system did not vanish while the litigation ran. That is a genuine insight, and it is why ordinary antitrust does not need a pre-deployment permit.

So here is the measurable indicator that separates my harm class from theirs: the ratio between the doubling time of the data-and-deployment feedback loop and the median duration of a structural remedy. U.S. v.

Microsoft was filed in 1998 and the consent decree did not expire until 2011; the European Commission's Google Shopping case ran from 2010 to its final court affirmation in 2024. Antitrust remedies in software run six to fourteen years. When the loop that compounds frontier advantage turns faster than that clock, the remedy arrives at a door that has already closed.

*Refs:* `saf-beliefs-150`, `saf-intentions-202`, `saf-intentions-051`, `sit-177`, `cc-084`

*Policy refs:* `pol-028`

## Synthesis

### Areas of Agreement

- Compute-threshold licensing imposes a fixed compliance cost that scales against smaller developers and tends to consolidate the field around the few labs able to absorb the overhead (e.g., OpenAI, Google DeepMind, Anthropic). (Skeptic, Accelerationist, Safetyist)
- Compute is an imperfect proxy that meters training input rather than model behavior, so a FLOP count does not map cleanly onto danger. (Accelerationist, Safetyist, Skeptic)
- The 737 MAX crashes that killed 346 people resulted from the FAA deferring to Boeing's self-certification, not from a missing input threshold; the aircraft crossed every metric on the FAA's forms. (Safetyist, Skeptic, Accelerationist)
- Diffuse downstream harms — loan denials, biased screening, eroded trust, synthetic information chaos — belong to a separate enforcement layer (strict product liability and algorithmic auditing of deployed systems, e.g., FTC authority under the Algorithmic Accountability Act), and a compute gate cannot and should not be expected to reach them. (Safetyist, Accelerationist, Skeptic)
- Regulatory capture risk is real for any instrument administered by an agency, because the named liable actor is the firm with the deepest balance sheet, which is also the firm best positioned to lobby the regulator. (Skeptic, Accelerationist, Safetyist)

### Areas of Disagreement

- **Whether strict tort liability tied to demonstrated output harm is a sufficient substitute for a pre-deployment gate, or whether it structurally misses the worst failures because diffuse harms generate no plaintiff with standing.** [EMPIRICAL] {belief}
  - **Accelerationist:** Holds developers strictly liable for demonstrated harm so cost tracks consequence; argues observable output makes concealment irrational and catches the treacherous turn a static input gate cannot.
  - **Safetyist:** Argues market deterrence is structurally blind to harms with no single plaintiff and recoverable damages, so liability alone cannot reach the failures of greatest concern.
  - *Resolution path: resolvable by evidence*
- **Whether irreversible concentration of frontier capability is a distinct harm class that after-the-fact remedies cannot reach, or an ordinary market-structure harm addressable by reversible antitrust tools.** [EMPIRICAL] {belief}
  - **Accelerationist:** Argues concentration is a market-structure harm reachable by interoperability mandates, forced model/API licensing, and structural separation — all reversible and firing on evidence after deployment; demands a documented event no such remedy could undo.
  - **Safetyist:** Argues the data-and-deployment feedback loop compounds in months while structural antitrust remedies run six to fourteen years (U.S. v. Microsoft 1998-2011; Google Shopping 2010-2024), so the remedy arrives after the door has closed.
  - *Resolution path: resolvable by evidence*
- **Whether compute is a verifiable pre-deployment trigger worth gating on despite being administered by a potentially captured agency, or whether gating reproduces the capture failure with a new number in the box.** [VALUES] {desire}
  - **Safetyist:** Argues compute is the one frontier input that can be metered, audited, and verified before deployment, leaving a third-party paper trail at chipmaker and cloud provider; absent a better verifiable trigger, imperfection is not grounds for having no gate.
  - **Skeptic:** Argues an agency with the same deference problem that doomed the MAX reproduces capture, and a permit controlled by the three largest labs ratifies concentration rather than preventing it.
  - *Resolution path: negotiable via tradeoffs*

### Cruxes

- Does strict liability on observable output reach the worst failures, or do diffuse harms with no suable plaintiff escape market deterrence? [EMPIRICAL]
    - If yes, weakens: Safetyist must concede that liability suffices and the case for a pre-deployment gate weakens.
    - If no, weakens: Accelerationist must concede that liability leaves a category of unreachable failures, supporting a separate mechanism.

- Can a compute license detect the diffuse downstream injury — such as a loan denial from a model fine-tuned below the threshold — that the parties agree market deterrence cannot see? [EMPIRICAL]
    - If yes, weakens: Skeptic must concede the gate adds coverage beyond existing liability law.
    - If no, weakens: Safetyist must narrow the gate's claimed scope, conceding it shares the identical blind spot.

- Would an input metric have prevented the 737 MAX failure, or did the planes cross every existing threshold because the regulator deferred to the firm that paid for the inspection? [EMPIRICAL]
    - If yes, weakens: Skeptic must concede input-verification prevents capture-driven catastrophe.
    - If no, weakens: Safetyist must concede the MAX illustrates capture rather than a missing metric, undermining the input-gate analogy.

- Is there a documented, deployment-scale event in which frontier capability concentrated such that no forced-licensing order, interoperability mandate, or structural separation could restore competitive entry, and which output monitoring could not have flagged before lock-in? [EMPIRICAL]
    - If yes, weakens: Accelerationist must concede a distinct irreversible harm class exists that reversible remedies cannot reach, supporting a pre-deployment gate.
    - If no, weakens: Safetyist must concede the irreversible-concentration harm rests on prediction rather than evidence, leaving reversible market-structure remedies adequate.

- Does the frontier feedback loop double faster than the median duration of a structural antitrust remedy, so that reversible remedies arrive too late? [EMPIRICAL]
    - If yes, weakens: Accelerationist must concede that reversible remedies fire after lock-in, justifying a pre-deployment trigger at the frontier.
    - If no, weakens: Safetyist must concede that ordinary antitrust timelines are fast enough and the case for a gate collapses into the Accelerationist's position.

- Are the meter-reader's incentives — chipmaker and cloud provider — genuinely independent of the developer being metered, or does vertical integration reintroduce the deference failure that doomed the MAX? [EMPIRICAL]
    - If yes, weakens: Skeptic must concede compute-metering has a structural advantage over self-certification via independent third-party records.
    - If no, weakens: Safetyist must concede that captured meter-readers reproduce the self-certification failure, eroding the input-gate advantage.

### Unresolved Questions

- What documented, present harm does crossing a 10^26-operation threshold cause that existing product-liability law or sector rules in housing, lending, and healthcare cannot already reach?

- Does the frontier data-and-deployment feedback loop turn faster than the six-to-fourteen-year span of structural antitrust remedies, and by what measurable margin?

- Can a compute-licensing regime be designed so its administering agency resists capture by the same deep-balance-sheet firms that clear the threshold?

- How would a compute gate address material chokepoints it does not touch — TSMC foundry allocation, multi-year grid interconnect queues in Virginia and Texas, and low-wage content-moderation labor?

- What verifiable, enforceable pre-deployment trigger other than compute could substitute for the gate without reducing to outcome-trust?

- How should the welfare cost of delaying frontier deployment (e.g., diagnostic and protein-design models held in conformity queues) be weighed against the risk of irreversible capability concentration?

- Are the meter-reader's commercial incentives at the chipmaker and cloud provider sufficiently independent of the developer to prevent the deference failure seen in the 737 MAX?


### Resolution Analysis

- **Whether strict tort liability tied to demonstrated output harm substitutes for a pre-deployment gate, or structurally misses diffuse harms that generate no plaintiff with standing.** — Stronger: C10 (logical validity)
  - *The claim that liability requires a plaintiff with standing and recoverable damages identifies a structural gap that the output-liability position does not close: harms without an identifiable injured party never generate a suit regardless of how observable the output is. The output-liability position rebuts by citing concrete deployment domains (housing, lending, parole) where existing sector rules already act, but those examples involve identifiable victims and do not reach the diffuse-harm category the gap argument targets. The two positions partly talk past each other, but the standing argument is internally consistent on the specific class it names.*
  - Would change if: Documented cases showing courts or agencies successfully recovering for diffuse, no-single-plaintiff harms (e.g., via parens patriae, statutory penalties, or class mechanisms) would weaken the structural-blindness claim and favor the liability-only position.
- **Whether irreversible concentration of frontier capability is a distinct harm class beyond after-the-fact remedies, or an ordinary market-structure harm addressable by reversible antitrust tools.** — Stronger: C12 (empirical evidence)
  - *The position citing U.S. v. Microsoft (1998-2011) and Google Shopping (2010-2024) supplies dated, verifiable timelines that establish multi-year remedy durations, paired with the claim that the feedback loop compounds in months. The opposing position lists reversible remedies (interoperability mandates, forced API or weight licensing, structural separation) but offers no evidence that these can execute on a timescale matching frontier obsolescence. The counter that a forced-licensing order cannot redistribute a two-generations-obsolete model is a logically tight extension of the timeline evidence.*
  - Would change if: Evidence of an antitrust or interoperability remedy executed fast enough to restore competitive entry before the underlying capability advantage compounded, or evidence that frontier capability gaps do not in fact compound on a months-scale, would favor the reversible-remedy position.
- **Whether compute is a verifiable pre-deployment trigger worth gating despite agency-capture risk, or whether gating reproduces capture with a new metric.** — Undecidable
  - *The verifiability position offers a concrete, third-party-auditable trigger (chipmaker and cloud-provider records) and a real precedent for input-gating high-consequence systems (NRC fissile-material metering). The capture position counters with equally concrete precedents — the 737 MAX certification failure where the metric existed but the regulator deferred, and FCC spectrum consolidation — plus the definitional point that fixed compliance costs scale against smaller players and that compute does not move the material chokepoints at TSMC, grid queues, or content-moderation labor. Both sides marshal authoritative precedents and specific mechanisms targeting different failure modes (verification vs. capture and concentration), and this disagreement is classified as a values tradeoff rather than purely resolvable by evidence.*
  - Would change if: An empirical record of an existing input-licensing agency in a fast-moving technology sector either resisting capture and avoiding incumbent consolidation, or predictably succumbing to it, would tip the balance; absent that, the disagreement turns on contested value weightings between verification gains and concentration risk.

## Fact Checks

*8 checks: 7 unverifiable, 1 disputed*

- **unverifiable** _[auto]_ (confidence: low): Claim AN-4 — unverifiable: No live web search was performed, so current grid interconnection queue wait times for data centers in Virginia (PJM) and Texas (ERCOT) could not be retrieved or confirmed. While general reporting has noted multi-
- **unverifiable** _[auto]_ (confidence: low): Claim AN-5 — unverifiable: I cannot perform live web searches. Prior reporting (e.g., TIME 2023) has documented Nairobi-based content moderators earning roughly $1.32-$2/hour labeling harmful material, which loosely aligns with the wage and
- **unverifiable** _[auto]_ (confidence: medium): Claim AN-6 — unverifiable: This claim is a hypothetical assertion about 'treacherous turn' or deceptive alignment behavior in AI models, which is a theoretical concern in AI safety literature rather than an established empirical finding. Th
- **disputed** _[auto]_ (confidence: medium): Claim AN-10 — disputed: The two 737 MAX crashes (Lion Air 610 and Ethiopian Airlines 302) did kill 346 people combined, and investigations confirmed MCAS played a central role, with the FAA's Organization Designation Authorization (ODA) pro
- **unverifiable** _[auto]_ (confidence: low): Claim AN-13 — unverifiable: Unable to perform live web searches in this environment to confirm the specific claim. The claim appears to allude to the Boeing 737 MAX/FAA delegated certification (ODA) controversy, which is broadly documented,
- **unverifiable** _[auto]_ (confidence: high): Claim AN-14 — unverifiable: This claim is a normative/argumentative assertion about governance and AI compute thresholds (e.g., the 10^25 FLOP regulatory threshold appearing in the EU AI Act and similar policy frameworks), not an empirical 
- **unverifiable** _[auto]_ (confidence: medium): Claim AN-21 — unverifiable: This claim is an economic/policy argument (that compute-threshold licensing functions as a fixed compliance cost disadvantaging smaller actors and entrenching concentration) rather than a discrete empirical fact;
- **unverifiable** _[auto]_ (confidence: medium): Claim AN-22 — unverifiable: This claim is a theoretical assertion about regulatory capture dynamics in AI/technology licensing regimes, not a discrete empirical fact that can be confirmed or refuted by a single source. While regulatory capt
