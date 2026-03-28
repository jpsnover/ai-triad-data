# Hierarchy Proposal Review — 2026-03-27-195053

**Model:** gemini-2.5-pro | **Generated:** 2026-03-27 19:50

---

## cross-cutting / (cross-cutting)

### Parent 1: Defining AI Timelines, Harms, and Existential Risks [NEW]

> A thematic area within AI discourse that focuses on fundamental questions about the nature and scale of AI's impact. Encompasses: predictions for AGI arrival, the intelligence explosion hypothesis, debates over what constitutes 'AI harm,' and the framing of existential versus present-day risks. Excludes: specific technical safety methods or detailed economic forecasts.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-001 | When Will Super-Smart AI Arrive? | part_of | The question of AI arrival timelines is a core component of defining and framing the overall risk landscape. |
| cc-004 | What Does 'AI Harm' Mean? | part_of | Defining what 'AI harm' means is a foundational part of the broader conversation about AI risk. |
| cc-005 | What's the Biggest AI Risk? | is_a | Prioritizing the biggest AI risk is a specific activity within the general theme of defining and framing AI risks. |
| cc-008 | AI That Redesigns Itself in a Runaway Loop | part_of | The concept of recursive self-improvement is a key mechanism discussed within the context of AI timelines and existential risk. |
| cc-017 | The Mechanisms for Utopia and Dystopia Are the Same | is_a | The dual-use nature of AI is a specific framing of the fundamental relationship between AI's potential benefits and harms. |
| cc-091 | The 'Doomer' Narrative as a Distraction | part_of | Critiquing the 'doomer' narrative is part of the meta-debate about how to properly frame and discuss AI risks. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 2: The AI Alignment and Control Problem [NEW]

> A thematic area within AI discourse that addresses the challenge of making AI systems do what we want without unintended consequences. Encompasses: the value alignment problem, risks of optimizing for narrow metrics, unpredictable capability gaps, and methods like Constitutional AI. Excludes: cybersecurity threats or economic impacts.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-002 | Keeping AI on Our Side | is_a | This node provides a high-level overview of the alignment problem, making it a quintessential example of the parent theme. |
| cc-014 | Optimizing for Narrow Metrics vs. Real-World Goals | part_of | Optimizing for narrow metrics is a primary cause of misalignment, making it a key component of the overall alignment problem. |
| cc-021 | AI's Unpredictable Gaps Between Expertise and Basic Skills | part_of | The unpredictable 'jagged' capability profile is a key challenge that makes alignment and control difficult to verify. |
| cc-041 | Easy vs. Hard AI Tasks | part_of | The distinction between easy and hard AI tasks helps define the boundaries where alignment is most challenging. |
| cc-043 | AI Learns Values, Not Just Rules | specializes | Constitutional AI is a specific technical method proposed as a solution to the general alignment problem. |
| cc-083 | The Performance-Understanding Gap | part_of | The gap between performance and understanding is a core aspect of the alignment problem, as it explains why capable systems can still act in unintended ways. |
| cc-089 | Strategic Deception vs Reflexive Behavior | part_of | The potential for AI deception is a critical sub-problem within the broader challenge of AI control and alignment. |
| cc-090 | Binary Grading Incentivizes Hallucination | specializes | Binary grading that incentivizes hallucination is a specific mechanism that exacerbates the general problem of AI control and reliability. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 3: Governing AI Amidst International and Domestic Competition [NEW]

> A thematic area within AI discourse that examines the structures for controlling AI development at national and international levels. Encompasses: the US-China AI race, proposals for government-led projects, open-source debates, and the tension between speed and safety. Excludes: specific state-level regulations or corporate governance.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-003 | Who Makes the Rules for AI? | part_of | The question of who makes the rules is a foundational component of the AI governance theme. |
| cc-007 | A Government 'Manhattan Project' for AI | specializes | A 'Manhattan Project' is a specific strategic proposal for how a nation could govern and accelerate AI development. |
| cc-009 | The AI Race Between Nations | part_of | The race between nations is a central dynamic that shapes the entire landscape of AI governance. |
| cc-010 | Speed of AI Development vs. Safety Caution | part_of | The tension between development speed and safety is a core conflict within the governance of competitive AI development. |
| cc-011 | Sharing AI's Secret Code | part_of | The debate over sharing AI code (open-sourcing) is a key policy question within AI governance. |
| cc-018 | Needing The Best AI To Study It | part_of | The question of who gets access to frontier models for research is a critical governance issue related to both safety and competition. |
| cc-023 | Competing to Build the Safest AI | specializes | Framing competition around safety is a specific strategic approach to governing the competitive dynamics of AI development. |
| cc-030 | Technological contingency of the nation-state | part_of | How AI impacts the nation-state is a high-level theoretical aspect of the geopolitical governance of AI. |
| cc-032 | Sovereign AI as Strategic Independence. This concept refers to the requirement f | is_a | Sovereign AI is a specific strategic goal within the broader theme of national AI governance and competition. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 4: Securing AI Systems Against Malicious Attacks [NEW]

> A thematic area within AI discourse that focuses on the novel ways AI systems can be attacked and defended. Encompasses: adversarial attacks like prompt injection, new AI-specific vulnerabilities, automated red teaming, and defense-in-depth strategies. Excludes: accidental failures or alignment problems.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-015 | AI Breaks Traditional Cybersecurity Assumptions | is_a | This node's argument that AI breaks traditional cybersecurity is a foundational claim for this entire thematic area. |
| cc-024 | Tricking AI with Sneaky Inputs | specializes | Tricking AI with sneaky inputs is a specific category of the security threats discussed by the parent. |
| cc-034 | Denial-of-Governance Attacks | specializes | Denial-of-governance attacks are a specific, novel type of adversarial threat against AI systems. |
| cc-049 | Cross-Agent Propagation of Unsafe Practices | is_a | The propagation of unsafe practices among AI agents is a specific type of systemic security risk. |
| cc-084 | Adversarial AI Threat Modeling Framework | specializes | An adversarial threat modeling framework is a specific tool used to implement the general strategy of securing AI systems. |
| cc-085 | AI-Specific Attack Surface Expansion | part_of | The expansion of the attack surface is a key reason why new approaches to AI security are needed. |
| cc-086 | Automated Red Teaming via AI-vs-AI | specializes | Automated red teaming is a specific method for discovering the vulnerabilities this parent theme covers. |
| cc-087 | Defense-in-Depth for AI Systems | specializes | Defense-in-depth is a specific strategic principle for designing secure AI systems. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 5: Deciding When and How to Regulate AI [NEW]

> A thematic area within AI discourse that addresses the core dilemma of whether to regulate AI proactively or wait for evidence of harm. Encompasses: the precautionary principle, the proof-before-policy problem, and debates over whether AI is an exceptional technology requiring new rules. Excludes: the specific content of regulations.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-019 | Acting Now vs. Waiting For Proof | is_a | The choice between acting now versus waiting for proof is the central question this parent theme addresses. |
| cc-022 | Treating AI Like Past Inventions | part_of | Whether to treat AI like past inventions is a key consideration in deciding if existing regulatory approaches are sufficient. |
| cc-028 | The Proof-Before-Policy Problem | is_a | The 'proof-before-policy problem' is a specific framing of the general dilemma of when to regulate. |
| cc-054 | The Evidence Dilemma in AI Governance | is_a | The 'Evidence Dilemma' is another name for the core tension this parent describes between acting early and waiting for proof. |
| cc-065 | Technological Exceptionalism in AI Policy | part_of | Technological exceptionalism is the belief that justifies creating new regulatory frameworks, a key part of the 'how to regulate' debate. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 6: Building Societal Resilience to AI Disruption [NEW]

> A thematic area within AI discourse that focuses on adapting society to withstand AI-related disruptions rather than preventing every failure. Encompasses: building systems that can bounce back from errors, creating social safety nets, and fostering psychological adaptability. Excludes: technical methods for making AI models themselves safer.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-020 | Making Society AI-Proof | is_a | Making society 'AI-proof' is a direct expression of the goal of societal resilience. |
| cc-026 | Bouncing Back From AI Failures | is_a | Focusing on 'bouncing back' from failures is a specific strategy for achieving the broader goal of resilience. |
| cc-078 | AI-Driven Political Backlash | part_of | The potential for political backlash is a consequence of failing to build societal resilience to AI's negative impacts. |
| cc-081 | Fierce Ambivalence as Strategic Stance | specializes | 'Fierce ambivalence' describes a specific psychological mindset that contributes to individual and societal resilience. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 7: AI's Transformation of the Labor Market [NEW]

> A thematic area within AI discourse that analyzes how AI adoption affects jobs, skills, and inequality. Encompasses: job displacement and creation, the changing value of skills, skill-biased technological change, and gender-specific impacts on the workforce. Excludes: broader macroeconomic theories or AI's use in business operations.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-038 | AI Job Loss Spiral | part_of | The 'job loss spiral' is a specific mechanism describing how AI could negatively impact the labor market. |
| cc-039 | Total Job Changes in Economy | specializes | Measuring total job changes is a specific method for quantifying the labor market transformation. |
| cc-040 | Skills Become Outdated Fast | part_of | The rapid obsolescence of skills is a key aspect of how AI transforms labor. |
| cc-042 | Tech Helps Skilled Workers More | part_of | The concept that tech helps skilled workers more is a core theory explaining how AI impacts labor inequality. |
| cc-048 | Observed AI Exposure Metric | specializes | The 'Observed AI Exposure Metric' is a specific tool for measuring AI's real-world impact on jobs. |
| cc-051 | AI-Mediated Human Capital Erosion | part_of | The erosion of human skills due to AI dependence is a significant long-term impact on the workforce. |
| cc-052 | AI-Induced Skill Convergence | part_of | AI causing skill convergence is a specific, positive potential impact on the labor force. |
| cc-077 | Gender-Driven AI Adoption Patterns | is_a | Gender-driven adoption patterns are a specific dimension of how AI's transformation of work is not uniform. |
| cc-080 | Gender-Specific AI Risk Exposure | is_a | Gender-specific risk exposure is a specific case of AI's differential impacts on the labor market. |
| cc-082 | Gendered AI Adoption Patterns | is_a | This node is a near-duplicate of cc-077 and represents a specific aspect of how AI affects the workforce. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 8: Understanding AI's Impact on the Broader Economy [NEW]

> A thematic area within AI discourse that examines the large-scale economic shifts and systemic risks driven by AI. Encompasses: the speed of economic transformation, physical limits on AI growth, risks of financial bubbles and instability, and the potential for a two-tiered economy. Excludes: specific impacts on individual jobs or skills.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-016 | AI Changing Everything, Fast | is_a | The idea of AI causing rapid, large-scale change is a foundational concept for its macroeconomic impact. |
| cc-036 | AI Output Not Reaching People | part_of | 'Ghost GDP' is a specific phenomenon related to how we measure AI's macroeconomic effects. |
| cc-037 | Real-World Limits on AI Growth | part_of | Real-world physical limits are a key constraint on AI's potential macroeconomic impact. |
| cc-045 | Risky AI Business Crash | is_a | A potential crash in the AI business sector is a specific type of systemic economic risk. |
| cc-067 | Rolling Disruption of AI Advances | is_a | 'Rolling disruption' is a specific description of the character of AI's macroeconomic impact. |
| cc-068 | Systemic Financial Risk from AI | is_a | Systemic financial risk is a specific category of large-scale economic risk posed by AI. |
| cc-076 | Two-Tiered AI Economy Risk | is_a | The risk of a two-tiered economy is a specific, major potential outcome of AI's broad economic transformation. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 9: Managing AI Systems That Act Independently [NEW]

> A thematic area within AI discourse that addresses the challenges posed by AI systems that can take actions in the world. Encompasses: the shift from AI tools to autonomous agents, the emergence of situational awareness, and the governance of agent interactions. Excludes: legal liability frameworks for agent actions.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-012 | AI That Thinks For Itself | is_a | This node introduces the core concept of AI shifting from passive tools to active agents. |
| cc-047 | Situational Awareness in AI | part_of | Situational awareness is a key capability that defines an AI as a more advanced, independent agent. |
| cc-057 | Agentic Interaction Governance | specializes | Agentic interaction governance refers to the specific rules and systems needed to manage autonomous agents. |
| cc-058 | Disclosure Problem in AI Agency | specializes | The disclosure problem is a specific legal and ethical requirement for managing agent interactions. |
| cc-060 | Functional Agency vs Moral Agency | part_of | The distinction between functional and moral agency is a core philosophical concept for understanding and managing AI agents. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 10: Integrating AI into Business and Management [NEW]

> A thematic area within AI discourse that focuses on the practical application of AI within organizations. Encompasses: AI-driven workflow automation, the changing role of human managers, AI-first system design, and the need for business accountability. Excludes: macroeconomic impacts or labor displacement.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-050 | Business Skin in the Game | part_of | Requiring 'skin in the game' from business teams is a key principle for successfully integrating AI into an organization. |
| cc-055 | AI-Orchestrated Enterprise Execution | is_a | AI-orchestrated enterprise execution is a specific vision for how AI will be integrated into core business processes. |
| cc-056 | Human-Agent Workflow Orchestration | is_a | Human-agent workflow orchestration describes the new management role created by AI integration. |
| cc-066 | Managing AI Agents vs Working With AI | is_a | The shift from 'working with' to 'managing' AI is a fundamental change in how AI is integrated into business workflows. |
| cc-072 | AI-First Systems Design | specializes | AI-first systems design is a specific philosophy for how to architect business systems around AI. |
| cc-079 | Talent Density in Critical Roles | specializes | Focusing on talent density is a specific management strategy for maximizing the value of AI integration. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 11: The Conflict Between Federal and State AI Laws [NEW]

> A thematic area within AI discourse that examines the tension between uniform national AI policy and diverse state-level regulations. Encompasses: federal preemption, regulatory fragmentation, and the compliance costs for businesses navigating a patchwork of laws. Excludes: international AI governance or the substance of specific regulations.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-027 | Should Federal AI Law Override States? | is_a | This node asks the central question that defines the entire parent theme of federal versus state power. |
| cc-031 | Federal preemption of state AI laws via litigation and funding conditions | specializes | Using litigation and funding conditions are specific mechanisms through which federal preemption can be achieved. |
| cc-033 | Regulatory Fragmentation. This concept refers to the proliferation of conflictin | part_of | Regulatory fragmentation is the direct result of the conflict between federal and state rulemaking. |
| cc-035 | Conflicting AI Rules Cost Businesses | part_of | The cost to businesses is a primary consequence and argument within the debate over federal vs. state laws. |
| cc-063 | Regulatory Patchwork Burden | is_a | The 'regulatory patchwork burden' is a specific term for the problem this parent theme describes. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 12: Assigning Legal Responsibility for AI Actions [NEW]

> A thematic area within AI discourse that explores how legal systems can assign responsibility for harms caused by AI. Encompasses: fiduciary accountability, the concept of legal personhood or actor status for AI, and the 'moral crumple zone' where liability becomes unclear. Excludes: technical safety measures or policy debates about regulation.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-059 | Fiduciary Accountability for Algorithmic Outputs | is_a | Fiduciary accountability is a specific domain where the general problem of legal responsibility for AI is critical. |
| cc-061 | Legal Actor Status for AI | specializes | Granting AI 'legal actor' status is a specific proposed solution to the problem of assigning legal responsibility. |
| cc-062 | Legal Personhood as Governance Tool | part_of | Viewing legal personhood as a pragmatic tool provides the conceptual basis for applying it to AI. |
| cc-064 | Risky Agents Without Intentions | part_of | The concept of 'risky agents without intentions' is a legal framing that helps assign responsibility to the humans deploying AI. |
| cc-070 | Moral Crumple Zone in AI | is_a | The 'moral crumple zone' is a specific concept that describes the failure to assign legal responsibility for AI actions. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 13: Technical Methods for AI Safety and Evaluation [NEW]

> A thematic area within AI discourse that covers specific engineering and research techniques for making AI safer and more reliable. Encompasses: tiered safety levels, quantitative risk assessment, alignment stress testing, and using AI debate for oversight. Excludes: broad governance strategies or legal frameworks.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-046 | AI Safety Rules by Power Level | specializes | Tiered safety rules are a specific framework for implementing technical safety evaluations. |
| cc-069 | Quantitative AI Risk Assessment | specializes | Quantitative risk assessment is a specific mathematical method for evaluating AI safety. |
| cc-073 | Alignment Stress Testing | specializes | Alignment stress testing is a specific methodology for evaluating the robustness of AI safety measures. |
| cc-074 | Amplified Oversight via AI Debate | specializes | Using AI debate for amplified oversight is a specific technical proposal for improving AI safety. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Parent 14: Data-Driven Harms from AI Systems [NEW]

> A thematic area within AI discourse that focuses on harms originating from the data used to train and operate AI. Encompasses: algorithmic bias against specific groups, the use of opaque or unvetted training data, and the persistence of AI-generated misinformation. Excludes: intentional adversarial attacks or job displacement.

| Child ID | Label | Relationship | Rationale |
|----------|-------|-------------|-----------|
| cc-006 | When AI Works on Average but Fails Specific Groups | is_a | An AI failing specific groups despite good average performance is a classic example of data-driven bias. |
| cc-025 | Opaque Training Data and Unknown Origins | part_of | Opaque training data is a root cause of many data-driven harms, as it prevents auditing for bias. |
| cc-044 | Bad AI Info Sticks Around | is_a | The persistence of bad AI-generated information is a specific type of harm that originates from the data the AI produces and consumes. |

**Verdict:** [ ] Accept  [ ] Modify  [ ] Reject

### Outliers (no parent assigned)

| Node ID | Label | Reason |
|---------|-------|--------|
| cc-013 | Using AI To Do Science | This node describes a specific application of AI (in science) rather than a cross-cutting theme of governance, risk, or societal impact. |
| cc-029 | AI Reading Legal Documents at Scale | This node describes a specific application of AI (in law) rather than a cross-cutting theme of governance, risk, or societal impact. |
| cc-053 | Academic Citation as Evidence of AI Impact | This node is about the epistemology of AI research (how we use citations as evidence), which is too meta-level to fit with other thematic groups. |
| cc-071 | Faith-Based AI Ethics Convergence | This node focuses on the specific intersection of faith, ethics, and AI, a niche topic that does not group well with broader themes. |
| cc-075 | Generative Error as Binary Classification Failure | This node presents a highly technical, mathematical framing of AI error that is distinct from the policy, risk, and economic themes. |
| cc-088 | Faith-Based and Secular AI Ethics Convergence | This node focuses on the specific intersection of faith, ethics, and AI, a niche topic that does not group well with broader themes. |


