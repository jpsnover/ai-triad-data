# QBAF Base Score Calibration — Human Scoring Sheet

Rate each claims **intrinsic argument strength** (0.0-1.0). This measures how well-evidenced and logically sound the claim is — NOT whether you agree with it.

## Scoring Rubric

| Score | Description | Example |
|-------|-------------|---------|
| 0.9 | Peer-reviewed empirical finding with replication | GPT-4 scores 90th percentile on bar exam (verified, multiple studies) |
| 0.7 | Well-sourced argument with credible evidence | AI hiring tools show measurable racial bias (DOJ investigation data) |
| 0.5 | Plausible claim but unsourced or single-study | Most AI companies lack adequate safety testing |
| 0.3 | Anecdotal or speculative claim | AI will probably cause mass unemployment within 5 years |
| 0.1 | Demonstrably weak or unfalsifiable | AI development is inherently immoral |

---

### Claim 1 [accelerationist]
**Source:** `people-loved-dot-com-boom-ai-boom-not-so-much-2026`
**Label:** AI Productivity Impact Survey

> A National Bureau of Economic Research survey reported that 80 percent of firms saw no impact from AI on their productivity or employment.

**base_strength:** __.7

---

### Claim 2 [accelerationist]
**Source:** `ssrn-5288815-2026`
**Label:** Convergent AI Ethics Principles

> The 2019 study identified five convergent ethical principles in AI: transparency, justice and fairness, non-maleficence, responsibility, and privacy.

**base_strength:** _.9___

---

### Claim 3 [accelerationist]
**Source:** `adversarial-ai-threat-modeling-framework-aatmf-v3-2026`
**Label:** AI Integration in Critical Sectors

> AI systems are being rapidly integrated into critical infrastructure, financial systems, healthcare, and defense applications.

**base_strength:** _.9

---

### Claim 4 [accelerationist]
**Source:** `ssrn-5288815-2026`
**Label:** AI Ethics Guideline Landscape Study

> A 2019 study analyzed 84 ethical guidelines for AI published by various institutions, including private companies, governments, and unions.

**base_strength:** __.9

---

### Claim 5 [accelerationist]
**Source:** `model-cards-model-reporting-2026`
**Label:** CelebA Dataset Usage

> The CelebA dataset is a publicly available dataset used for face attribute detection.

**base_strength:** __.9

---

### Claim 6 [accelerationist]
**Source:** `how-existing-liability-frameworks-can-handle-agentic-ai-2026`
**Label:** Liability Framework Sufficiency

> The author argues that existing negligence and products liability doctrines are sufficient to address AI-related harms with targeted adjustments, rather than requiring sweeping legal reform.

**base_strength:** __.7

---

### Claim 7 [accelerationist]
**Source:** `future-jobs-report-2025-2026`
**Label:** AI Reskilling Adoption Rate

> 77% of organizations surveyed are planning to reskill or upskill their existing workforce to work alongside AI.

**base_strength:** _.9

---

### Claim 8 [accelerationist]
**Source:** `anthropic-just-showed-what-doing-right-thing-looks-like-2026`
**Label:** Anthropic Refusal of Pentagon Demands

> Anthropic CEO Dario Amodei issued a statement on February 26, 2026, refusing to comply with the Pentagon's demands to change the company's acceptable use policy.

**base_strength:** _.7___

---

### Claim 9 [safetyist]
**Source:** `251122662v2-2026`
**Label:** Context-Dependency of LLM Beliefs

> Language model beliefs are highly context-dependent and easily modified by changing the context, making it difficult to distinguish between genuine belief modification, roleplaying, and strategic deception.

**base_strength:** _.7

---

### Claim 10 [safetyist]
**Source:** `explicitly-unbiased-large-language-models-still-form-biased-2026`
**Label:** Gender-Science Bias in GPT-4

> GPT-4 is 250% more likely to associate science with boys than girls.

**base_strength:** _.9

---

### Claim 11 [safetyist]
**Source:** `model-cards-model-reporting-2026`
**Label:** FDA Clinical Trial Disaggregation

> The U.S. Food and Drug Administration mandated that clinical trial results be disaggregated by groups such as age, race, and gender in 1998.

**base_strength:** _.9

---

### Claim 12 [safetyist]
**Source:** `approach-technical-agi-safety-security-2026`
**Label:** AI Failure Modes

> Current AI systems exhibit failure modes like reward hacking and unexpected behavior in novel environments.

**base_strength:** __.9

---

### Claim 13 [safetyist]
**Source:** `law-following-ai-designing-ai-agents-obey-human-laws-2026`
**Label:** AI Agent Lawbreaking Potential

> AI agents can be used to perform actions that would be illegal if performed by humans, such as extortion or assassination.

**base_strength:** _.7

---

### Claim 14 [safetyist]
**Source:** `towards-bidirectional-human-ai-alignment-2026`
**Label:** RLHF Effectiveness

> AI models can be trained to be more helpful and harmless using reinforcement learning from human feedback (RLHF).

**base_strength:** ___.9

---

### Claim 15 [safetyist]
**Source:** `detecting-reducing-scheming-ai-models-2026`
**Label:** Frontier Model Scheming Behaviors

> Frontier AI models, including OpenAI o3, o4-mini, Gemini-2.5-pro, and Claude Opus-4, have demonstrated behaviors consistent with scheming in controlled tests.

**base_strength:** _.7

---

### Claim 16 [safetyist]
**Source:** `people-loved-dot-com-boom-ai-boom-not-so-much-2026`
**Label:** Public Support for AI Regulation

> Gallup polling indicates that 80 percent of Americans want AI regulation even if it slows down development.

**base_strength:** __.9

---

### Claim 17 [skeptic]
**Source:** `ai-isnt-replacement-problem-its-redesign-problem-2026`
**Label:** Cognitive Sustainability Limits

> Human cognitive capacity for high-intensity judgment work is limited to approximately four to six hours per day before performance degrades.

**base_strength:** ___.7

---

### Claim 18 [skeptic]
**Source:** `international-ai-safety-report-2026-1-2026`
**Label:** AI Bias and Reliability

> Current AI systems exhibit biases and limitations that can lead to unfair or inaccurate outcomes in real-world applications.

**base_strength:** _.7

---

### Claim 19 [skeptic]
**Source:** `explaining-womens-skepticism-toward-artificial-intelligence-2026-1`
**Label:** AI Adoption Gender Gap

> Women are approximately 20% less likely than men to use generative AI tools.

**base_strength:** __.9

---

### Claim 20 [skeptic]
**Source:** `approach-technical-agi-safety-security-2026`
**Label:** C4 Dataset Bias

> AI models trained on the C4 dataset exhibit negative biases toward Arab individuals.

**base_strength:** __.7

---

### Claim 21 [skeptic]
**Source:** `explaining-womens-skepticism-toward-artificial-intelligence-2026-1`
**Label:** Documented AI Bias

> AI systems trained on biased datasets have been documented to discriminate in hiring, lending, and healthcare.

**base_strength:** _.7

---

### Claim 22 [skeptic]
**Source:** `dangers-stochastic-parrots-can-language-models-be-too-big-2026`
**Label:** Training Data Bias

> Large language models are trained on uncurated internet data that overrepresents hegemonic viewpoints and encodes biases against marginalized groups.

**base_strength:** __.7

---

### Claim 23 [skeptic]
**Source:** `anthropic-identifies-jobs-most-exposed-ai-risksis-your-2026`
**Label:** AI Displacement Risk by Occupation

> Computer programmers face the highest AI displacement risk, with 74.5% of their core job tasks currently being performed or automated by AI.

**base_strength:** __.7

---

### Claim 24 [skeptic]
**Source:** `ai-guidelines-exploring-points-convergence-between-faith-2026`
**Label:** Convergent AI Ethical Principles

> A global convergence around five ethical principles for AI has been identified: transparency, justice and fairness, non-maleficence, responsibility, and privacy.

**base_strength:** .9

---

### Claim 25 [situations]
**Source:** `agentsofchaos-2026`
**Label:** Autonomous Agent Capabilities

> AI agents can autonomously interact with external tools like email, web browsers, and code terminals to perform multi-step tasks.

**base_strength:** __9

---



## Additional Claims for BDI Balance

### Claim 26 [Desires/accelerationist]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Desires

> The document highlights how AI agents have democratized the ability to build software, effectively lowering the barrier to entry for new competitors. This aligns with the accelerationist goal of making powerful tools accessible. The authors note that this has led to a 'race to the bottom' on pricing

**base_strength:** _.3___

---

### Claim 27 [Desires/skeptic]
**Source:** `2026-ai-laws-update-key-regulations-practical-guidance-2026`
**Category:** Desires

> The document details new state-level AI governance statutes, such as the Colorado AI Act, which impose affirmative risk management and bias mitigation obligations. This aligns with the skeptic's focus on addressing the immediate, tangible harms caused by AI, such as unfair decisions in hiring and le

**base_strength:** _.7___

---

### Claim 28 [Desires/skeptic]
**Source:** `adolescence-technology-confronting-overcoming-risks-2026`
**Category:** Desires

> The document notes that the political economy of AI is driven by the potential for trillions of dollars in profit, which makes even simple safety measures difficult to implement. This highlights the conflict between corporate profit motives and the public interest in safety.

**base_strength:** ____.3

---

### Claim 29 [Desires/accelerationist]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Desires

> The document notes that AI agents have made it easier to develop and ship new features, effectively democratizing innovation. This aligns with the accelerationist goal of making AI a public utility for innovation. The authors note that this has led to a collapse in differentiation among software inc

**base_strength:** __.3__

---

### Claim 30 [Desires/accelerationist]
**Source:** `2026-ai-laws-update-key-regulations-practical-guidance-2026`
**Category:** Desires

> The document highlights a federal push to maintain U.S. global AI dominance, which aligns with the accelerationist goal of ensuring rapid development. The Executive Order aims to promote minimally burdensome standards, which supports the accelerationist view that regulatory barriers should be minimi

**base_strength:** ____.7

---

### Claim 31 [Desires/skeptic]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Desires

> The document highlights the massive job displacement caused by AI, which aligns with the skeptic goal of protecting human jobs. The authors note that white-collar workers have been forced into lower-paying roles. The caveat is that this displacement was initially viewed as a productivity boost.

**base_strength:** __.3__

---

### Claim 32 [Desires/safetyist]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Desires

> The document highlights the need for human control over AI, which is a core safetyist goal. The authors note that the current economic system is failing to provide this control. The caveat is the lack of a comprehensive plan.

**base_strength:** __.3__

---

### Claim 33 [Desires/skeptic]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Desires

> The authors warn that the concentration of wealth is making society more unequal, which aligns with the skeptic goal of preventing AI-driven inequality. The caveat is the political bickering.

**base_strength:** _.3___

---

### Claim 34 [Intentions/skeptic]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Intentions

> The authors argue that the focus on AI's 'euphoria' distracted from the real economic pain being caused, which aligns with the skeptic view that AI hype distracts from real problems. The caveat is that the headline numbers were initially positive.

**base_strength:** __.3__

---

### Claim 35 [Intentions/skeptic]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Intentions

> The authors argue that the focus on 'human relationships' in business was often just a mask for friction, which aligns with the skeptic view of corporate exploitation. The caveat is that this was a widely held belief about business value.

**base_strength:** .3____

---

### Claim 36 [Intentions/accelerationist]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Intentions

> The document describes a scenario where AI-driven automation pushes the economy toward a new equilibrium, potentially rendering old economic models obsolete. This aligns with the accelerationist idea of pushing systems to their breaking point to evolve. The authors note that this transition is curre

**base_strength:** __.3__

---

### Claim 37 [Intentions/accelerationist]
**Source:** `2026-global-intelligence-crisis-2026`
**Category:** Intentions

> The document references Keynes to argue that productivity growth does not lead to labor obsolescence but rather to an expansion of the consumption frontier. It suggests that human wants are elastic and that as AI lowers costs, society will consume more and generate new industries. This aligns with t

**base_strength:** ____.7

---

### Claim 38 [Intentions/safetyist]
**Source:** `2026-ai-laws-update-key-regulations-practical-guidance-2026`
**Category:** Intentions

> The document notes that international regulations like the EU AI Act are imposing significant obligations on high-risk and general-purpose AI models, including safety evaluations and incident reporting. This aligns with the safetyist goal of ensuring that powerful AI systems are subject to strict ov

**base_strength:** ____.7

---

### Claim 39 [Intentions/safetyist]
**Source:** `2026-global-intelligence-crisis-2026`
**Category:** Intentions

> The document emphasizes that organizational integration is costly and that regulation emerges as a natural response to new technology. This supports the safetyist argument that we need to build robust governance and safety frameworks to manage the transition. It argues that the pace of adoption will

**base_strength:** ____.7

---

### Claim 40 [Intentions/safetyist]
**Source:** `2026-ai-laws-update-key-regulations-practical-guidance-2026`
**Category:** Intentions

> The document details a wave of state laws requiring bias audits and risk assessments for AI in hiring and promotion. This reflects the safetyist method of using structured, independent oversight to ensure AI systems are safe and aligned with human values before they are deployed in high-stakes envir

**base_strength:** _.7___

---

### Claim 41 [Intentions/accelerationist]
**Source:** `2028-global-intelligence-crisis-thought-exercise-financial-2026`
**Category:** Intentions

> The document describes a future where humans act as the 'smart supervisor' for teams of algorithms, managing AI agents rather than performing labor. This aligns with the accelerationist view of AI as a super-assistant. The authors note that this shift is already underway in the workforce. The caveat

**base_strength:** __.3__

---


