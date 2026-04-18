<!--
  AI Triad Research Project — Document Snapshot
  Title      : Data Quality Over Model Complexity: Rethinking the AI Performance Paradigm
  Source     : 
  Type       : pdf
  Captured   : 2026-04-11
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Data Quality Over Model Complexity: Rethinking the AI Performance Paradigm

> **Snapshot captured:** 2026-04-11
> **Source:** 
> **Type:** pdf

---
Data  Quality  Over  Model  Complexity:  Rethinking  the  AI  Performance
Paradigm

Author: Michael Adelusola

Date: December 2025

Abstract

The  rapid  advancement  of  artificial  intelligence  has  fueled  a  global  race  toward  building
increasingly large and complex models, often under the assumption that scale alone guarantees
superior performance. Yet across industries, AI systems continue to failùnot because models are
too small, but because the data feeding them is noisy, incomplete, biased, or inconsistently labeled.
This  paper  challenges  the  prevailing  model-centric  mindset  by  arguing  that  high-quality,  well-
curated data is a far more powerful driver of AI success than incremental increases in model size.
Drawing on evidence from machine learning, data engineering, applied analytics, and real-world
deployments, the paper demonstrates how clean and reliable data dramatically improves accuracy,
robustness, interpretability, and downstream decision quality. It further examines how poor data
hygiene  undermines  even  state-of-the-art  architectures,  leading  to  hallucinations,  instability,
biased predictions, and operational failures. The paper advocates for a shift toward data-centric AI
practices, highlighting emerging methods in automated data cleaning, anomaly detection, human-
in-the-loop workflows, and governance frameworks that systematically elevate data quality. By
rethinking the AI performance paradigm, this work underscores that the most transformative gains
in AI do not come from building bigger models, but from building better data.

2. Introduction

Over the past decade, artificial intelligence has experienced explosive growth, driven largely by
increasingly large and complex model architectures. Organizations across industries now invest
heavily in scaling model parameters, expanding compute clusters, and training ever-deeper neural
networks in pursuit of higher accuracy and competitive advantage. Yet, despite these escalating
efforts, many AI systems continue to deliver inconsistent, unreliable, or even misleading outputs.
This performance gap reveals an uncomfortable truth: most AI failures are not caused by model
limitations  but  by  poor-quality  data. As Abbas  and  Hussain  (2025)  argue,  clean,  reliable  data
remains the real foundation of successful AI, even though it is frequently overshadowed by the
pursuit of larger models.

Low-quality data introduces noise, bias, incompleteness, and inconsistencies that fundamentally
distort  the  learning  process.  Models  trained  on  incorrect,  missing,  or  unrepresentative  samples
inevitably  internalize  flawed  assumptions,  leading  to  hallucinations,  weak  generalization,  and
brittle performance. This issue is amplified in relational datasets, where overlooked dependencies
or missing attribute values undermine even sophisticated modeling pipelines (Zhu et al., 2025).

Likewise, research in applied data analytics shows that poor data hygiene compromises insights in
business intelligence, educational analytics, and institutional decision-making (Esomonu, 2025;
Pathak, 2025). Across domains such as healthcare, environmental modeling, manufacturing, and
cybersecurity, studies consistently reveal that AI systems fail not because models are too shallow
but because the data beneath them is incomplete or polluted (Fairfield, 2025; Ahangar et al., 2025;
Machireddy, 2025; Chowdhury et al., 2025).

Despite  this  evidence,  organizations  often  default  to  scaling  models  rather  than  addressing
foundational data issues. Pagliaro (2025) notes that modern AI culture has normalized the belief
that more data and larger architectures inherently improve performance, leading to a ôbigger is
betterö mentality that overlooks critical data quality challenges. Yet, automated cleaning and AI-
driven  preprocessing  pipelines  have  already  demonstrated  their  ability  to  dramatically  enhance
dataset reliability and downstream model performance (Kilani et al., 2025). Similarly, advances in
anomaly  detection,  automated  annotation,  and  human-in-the-loop  validation  show  that  data
refinementùrather than model expansionùis often the key differentiator between successful and
failed AI deployments (Ahi et al., 2025; Karim et al., 2025).

The growing body of work around data-centric AI reinforces this shift, emphasizing that the most
impactful performance gains often stem from improving data completeness, consistency, validity,
and semantic clarity rather than increasing model size (Veluru et al., 2025). Industry research also
highlights  significant  economic  incentives  for  prioritizing  data  quality:  organizations  that
effectively harness clean data outperform competitors, reduce operational waste, and deploy more
trustworthy AI  solutions  (Islam,  2025).  Even  in  complex  scientific  and  engineering  contextsù
such  as  off-grid  energy  forecasting,  climate  modeling,  and  IoT  network  securityùmodels
consistently succeed when the underlying data is curated, structured, and validated (Rayhan, 2025;
Sham et al., 2025; Sood et al., 2025).

This paper argues for a paradigm shift away from model-centric thinking and toward a data-first
AI strategy. It synthesizes contemporary research, examines the shortcomings of model-scaling
approaches,  and  proposes  a  structured  framework  for  organizations  seeking  to  maximize  AI
performance through systematic data quality improvement. By re-centering data as the primary
determinant of AI success, this work challenges the dominant narrative within the AI community
and  encourages  a  more  effective,  sustainable,  and  scientifically  grounded  approach  to  building
intelligent systems.

3. Background and Problem Context

The  AI  community  has  long  celebrated  breakthroughs  driven  by  increasingly  large  model
architectures,  from  deep  neural  networks  to  massive  transformer-based  systems.  This  model-
centric paradigm emphasizes algorithmic sophistication, architectural scaling, and computational
power as the primary levers for improving performance. However, as emerging research indicates,

scaling  alone  cannot  compensate  for  low-quality  data.  Without  clean,  consistent,  and
representative datasets, even the most advanced models will encode distorted patterns, propagate
bias, and generate unreliable predictions (Abbas & Hussain, 2025).

3.1 Rise of Model-Centric AI Development

The push toward bigger models is partly cultural and partly commercial. Pagliaro (2025) argues
that  the  AI  ecosystem  has  normalized  a  belief  in  scale  as  a  dominant  performance  driverù
assuming that larger datasets, broader feature spaces, and deeper architectures inherently guarantee
better predictions. This mindset aligns with high-profile successes in natural language processing
and  computer  vision  but  overlooks  a  key  reality:  many  business  and  scientific  datasets  do  not
follow  the  properties  of  those  large  benchmark  corpora. As  a  result,  scaling  models  in  these
environments  often  leads  to  diminishing  returns  or  complete  performance  collapse  when  data
irregularities dominate the learning process.

Furthermore, relational and structured datasets present unique challenges. Zhu et al. (2025) note
that missing attributes, relational inconsistencies, and unresolved entity-linking problems severely
undermine downstream learning, regardless of the model used. This illustrates a crucial limitation
of model-centric strategiesùthey assume data completeness, accuracy, and consistency as default
conditions, when in practice, most real-world systems violate these assumptions.

3.2 Challenges of Low-Quality Data in AI Systems

AI  systems  trained  on  poor-quality  data  routinely  fail  in  ways  that  are  subtle,  harmful,  and
expensive to detect. In applied business analytics, Pathak (2025) highlights that organizations often
underestimate the importance of data validity and consistency, resulting in misleading insights and
inaccurate  forecasts.  In  scientific  domains,  low-quality  measurements  lead  to  incorrect
interpretations,  model  drift,  and  faulty  predictions,  which  Fairfield  (2025)  characterizes  as
ôinvisible pollutionö that quietly degrades AI reliability.

The  consequences  are  especially  severe  in  fields  where  data  incompleteness  or  noise  directly
affects human outcomes. Healthcare studies show that missing or mislabeled clinical data causes
predictive  models  to  miss  early  indicators  of  disease  or  misclassify  treatment  pathways
(Machireddy, 2025; Arzikulov & Komiljonov, 2025). Similarly, in industrial engineering contexts,
poor-quality  sensor  data  makes  anomaly  detection  and  forecasting  models  significantly  less
effective  (Chowdhury  et  al.,  2025).  These  failures  reinforce  the  fundamental  premise  that AI
accuracy is bounded more by data fidelity than by model complexity.

Kilani et al. (2025) add that increased data volume often amplifies existing problems rather than
solving them. Scaling dirty datasets leads to larger, more complex errors, making models harder
to interpret and harder to correct.

3.3 Why Bigger Models Cannot Fix Bad Data

The  misconception  that  larger  models  can  ôlearn  aroundö  flawed  data  persists,  but  empirical
evidence consistently shows otherwise. Ongoing work in education analytics, energy systems, and
IoT security underscores that models can only extract meaningful patterns if the underlying data
reflects real-world behavior accurately (Esomonu, 2025; Rayhan, 2025; Sood et al., 2025). When
data is inconsistent or sparse, increasing model size merely increases the likelihood of overfitting,
hallucination, instability, and misclassification.

Moreover,  operational  AI  environments  introduce  additional  complexities  that  scaling  cannot
resolve:

ò  Bias amplification caused by unrepresentative or skewed datasets

ò  Signal loss due to noisy, redundant, or inaccurately annotated samples

ò  Poor  generalization  when  rare  but  important  features  are  overlooked  (Ahangar  et  al.,

2025)

ò  Model fragility when environmental factors shift slightly

As Veluru et al. (2025) argue, the central flaw in the model-centric approach is its false assumption
that architecture alone drives AI performance. In reality, the quality of the underlying dataùnot
its quantity or the modelÆs sizeùsets the upper bound for what AI systems can achieve.

4. Data-Centric AI: Foundations and Principles

Data-centric AI represents a paradigm shift away from the traditional focus on expanding model
complexity and toward systematically improving the quality, consistency, and relevance of the data
powering  those  models.  Unlike  model-centric  developmentùwhich  assumes  data  is  a  static
resource  to  be  consumedùdata-centric AI  views  data  as  the  primary  lever  for  improving AI
performance. This approach argues that more reliable, structured, and representative datasets lead
not only to higher accuracy but also to safer, more interpretable, and more trustworthy AI systems
(Veluru et al., 2025).

4.1 What Is Data-Centric AI?

Data-centric AI emphasizes refining datasets rather than inflating model parameters. Veluru et al.
(2025)  describe  it  as  a  rebalancing  of  priorities:  instead  of  optimizing  architecture  first,
practitioners first optimize the data pipelineùcleaning, validating, labeling, and structuring data
so that models have high-quality signals to learn from.

This shift acknowledges several realities:

ò  Noise and missing values degrade learning more than architectural limitations.

ò  Structured, curated datasets reduce overfitting and improve generalization.

ò  High-quality labels outperform added model layers in many supervised tasks.

In other words, data qualityùnot model sizeùdetermines the ceiling of AI performance.

4.2 Data Quality Dimensions

Pathak (2025) outlines several key attributes that define high-quality datasets:

ò  Accuracy û Data reflects real-world conditions faithfully.

ò  Completeness û Missing values, gaps, and absent attributes are minimized.

ò  Consistency û Formats, schemas, and semantics are uniform across sources.

ò  Validity û Data adheres to defined rules, units, and constraints.

ò  Timeliness û Up-to-date records reduce prediction errors.

ò  Lineage and Trustworthiness û Transparent data provenance supports governance.

These dimensions provide a systematic foundation for evaluating and improving the datasets that
drive AI models.

4.3 Automated Data Cleaning Techniques

Recent  research  highlights  significant  advances  in  automated  data  cleaning  driven  by AI  and
machine  learning.  Kilani  et  al.  (2025)  report  that  ML-based  cleaning  methodsùsuch  as
imputation,  anomaly  remediation,  deduplication,  entity  resolution,  and  automated  constraint
inferenceùsignificantly  improve  data  reliability,  particularly  for  high-volume  or  complex
systems.

AI-powered cleaning methods provide four major advantages:

1.  Scalability û Capable of handling large datasets at speeds impossible for manual review.

2.  Adaptiveness û Models learn domain-specific cleaning rules over time.

3.  Consistency û Automated processes reduce human error and subjective judgment.

4.  Precision û Deep-learning methods can detect subtle relational inconsistencies and missing

patterns.

These findings support the growing  consensus that robust cleaning pipelines often yield higher
performance improvements than adding extra model layers.

4.4 Human-in-the-Loop Data Validation

While automated tools enhance scalability and precision, human expertise remains essential for
resolving ambiguous or context-sensitive issues. Ahi et al. (2025) demonstrate how human-in-the-
loop  (HITL)  systems  dramatically  boost  data  qualityùachieving  over  80%  gains  in  reviewer

productivity  when  assisted  by AI-driven  anomaly  detection  and  refinement  tools.  These  HITL
pipelines allow humans to validate nuanced cases, correct model mistakes, and enforce domain-
specific guidelines that automated systems might overlook.

Similarly, Karim et al. (2025) emphasize that AI agents can accelerate annotation, reasoning, and
data refinement,  but  hybrid humanûAI systems  remain the most effective solution  for ensuring
semantic accuracy.

Together, automated cleaning and supervised validation form the backbone of robust data-centric
AI practices.

6. Proposed Framework: Data-First Pipeline for Reliable AI Performance

The empirical evidence presented across multiple domains demonstrates that AI systems perform
best when built on clean, well-curated, and contextually meaningful data. To operationalize this
insight, this section introduces a Data-First AI Pipelineùa structured framework that prioritizes
data  quality  at  every  stage  of  the  machine  learning  lifecycle.  The  framework  incorporates
automated  validation  techniques,  intelligent  cleaning  mechanisms,  human  oversight,  and
continuous monitoring to ensure that data remains trustworthy, consistent, and aligned with real-
world conditions.

6.1 Data Validation Layer

The first layer of the framework focuses on detecting missing values, inconsistencies, structural
violations, and anomalies within raw datasets. Automated validation techniques identify:

ò

incomplete attributes,

ò  duplicate records,

ò  out-of-range values,

ò

ò

structural misalignments (e.g., schema drift),

logical inconsistencies.

These problems are prevalent across domains and frequently go undetected in traditional pipelines,
as highlighted in relational data cleaning research (Zhu et al., 2025). Sood et al. (2025) further
demonstrate that missing data is especially harmful in IoT and cybersecurity contexts, where even
small gaps can compromise anomaly detection and degrade robustness. By integrating validation
early, organizations prevent flawed data from propagating downstream into training and inference
phases.

6.2 Automated Anomaly Detection and Cleaning

Once validation surfaces inconsistencies, the next step is automated cleaning powered by AI and
machine learning. Kilani et al. (2025) outline several ML-driven cleaning strategiesùimputation,
inference,  semantic  normalization,  and  relational  consistency
deduplication,  constraint
enforcementùthat dramatically enhance data reliability.

Key advantages of automated cleaning in this framework include:

ò  Speed and scalability: Automation handles large datasets impossible to review manually.

ò  Precision: ML models detect subtle irregularities, such as relational mismatches or soft

anomalies.

ò  Domain adaptiveness: Over time, models learn how to clean data within specific domains

more effectively.

These automated approaches align with industrial findings showing that poor-quality data causes
failures that larger models cannot compensate for (Chowdhury et al., 2025; Rayhan, 2025).

6.3 Continuous Feedback Loop for Data Integrity

A robust AI system cannot depend on a one-time cleaning process. New patterns, environmental
changes, and domain-specific drift require continuous monitoring. Esomonu (2025) stresses that
ongoing data assurance practices are essential, especially in dynamic institutional or organizational
environments where data quality affects long-term outcomes.

The continuous feedback loop in this framework includes:

ò  Drift detection: Identifying when new data deviates from historical norms.

ò  Adaptive cleaning: Automatically updating cleaning rules as distributions shift.

ò  Performance-based  monitoring:  Using  model  errors  as  indicators  of  upstream  data

issues.

ò  Periodic  retraining:  Ensuring  models  are  aligned  with  current,  not  historical,  data

landscapes.

Such  iterative  refinement  prevents  gradual  model  degradation,  a  common  problem  when
organizations focus solely on model expansion.

6.4 Governance and Documentation Requirements

To ensure transparency, accountability, and reproducibility, the framework incorporates strong data
governance  principles.  Islam  (2025)  notes  that  organizations  that  systematically  harness  and
document their data pipelines outperform those that treat data as an afterthought. Likewise, Xu et
al. (2025) highlight that trustworthy AI systems must maintain verifiable data lineage, consistent
metadata standards, and fully documented transformations.

This governance layer includes:

ò  Version-controlled data repositories,

ò  Lineage tracking,

ò  Documentation of cleaning rules,

ò  Validation logs,

ò  Clear definitions of quality thresholds,

ò  Policy enforcement mechanisms.

Together, these elements strengthen compliance, auditability, and long-term integrityùcritical for
AI deployed in regulated industries like healthcare, finance, or manufacturing.

7. Discussion

The findings and framework presented in this paper highlight a fundamental shift needed within
the AI  ecosystem:  organizations  must  rethink  their  reliance  on  model-centric  development  and
prioritize  systematic  improvements  in  data  quality.  Despite  overwhelming  evidence  that  clean,
reliable data produces stronger, more trustworthy AI outcomes, many institutions remain fixated
on scaling models, adopting larger architectures, or purchasing additional compute resources. This
section  examines  why  the  misconception  persists,  identifies  the  true  bottlenecks  limiting  AI
performance, and outlines practical strategies for operationalizing a data-centric mindset.

7.1 Why Organizations Keep Chasing Bigger Models

The  global AI  landscape  has  glamorized  large-scale  model  architectures,  positioning  them  as
symbols  of technological  superiority and competitive advantage. Pagliaro (2025) attributes this
trend  to  the  success  of  models  in  big  data  domains  like  NLP  and  vision,  which  has  created  a
misconception that scale universally translates to better performance. This illusion persists because
organizations often overlook the hidden costs of dirty data. As Abbas and Hussain (2025) describe,
many failures attributed to ômodel limitationsö are actually rooted in upstream data noise, missing
values, or structural inconsistencies.

Additionally, organizations may prioritize model expansion because:

ò  Computational investments are more visible than data quality improvements.

ò  Data issues are harder to diagnose, especially when buried in complex pipelines.

ò  Vendors and research narratives overemphasize model scaling rather than provenance

and curation.

ò  Teams often assume data is ôgood enoughö, even when evidence suggests otherwise (Zhu

et al., 2025).

This creates a cycle in which flawed models are continuously retrained, expanded, or refactored,
while the underlying data issues remain unresolved.

7.2 The Real Technical Bottleneck: Data, Not Models

Studies across engineering, healthcare, cybersecurity, and scientific modeling repeatedly show that
dataùnot  modelsùis  the  primary  determinant  of  AI  performance.  In  healthcare,  low-quality
clinical data leads directly to missed diagnoses or inaccurate predictions, regardless of model size
(Machireddy,  2025; Arzikulov  &  Komiljonov,  2025).  In  manufacturing  and  anomaly  detection
contexts, incomplete datasets cause AI systems to overlook rare but critical events (Ahangar et al.,
2025). Even environmental and climate models collapse when trained on inconsistent ecological
datasets (Fairfield, 2025; Sham et al., 2025).

Kilani et al. (2025) further illustrate that automated cleaning pipelines significantly outperform
attempts  to  compensate  for  noise  by  increasing  model  depth.  Moreover,  incomplete  or  sparse
datasetsùcommon in IoT and cybersecurityùcause instability that scaling cannot fix (Sood et al.,
2025).  These  findings  confirm  that  data  quality  sets  the  upper  bound  for  performance;  model
complexity only fine-tunes the final curve.

7.3 Strategies to Shift to a Data-Centric Mindset

To  move  beyond  a  model-centric  culture,  organizations  must  adopt  structural,  cultural,  and
technological changes:

7.3.1 Leadership and Organizational Culture

Executives must recognize that data quality is not a ôbackend detailö but a primary AI investment.
Islam (2025) shows that organizations leveraging data governance systematically achieve better
business outcomes than those that prioritize only model engineering.

7.3.2 Tooling and Automation

Integrating data validators, anomaly detectors, and automated cleaning tools into pipelines ensures
high-quality input at scale. Kilani et al. (2025) demonstrate that these systems outperform manual
cleaning and lower operational costs.

7.3.3 Human-in-the-Loop Oversight

Ahi et al. (2025) and Karim et al. (2025) highlight that hybrid workflows significantly enhance
accuracy and accelerate annotation by letting experts resolve edge cases AI cannot yet interpret.

7.3.4 Continuous Monitoring and Drift Detection

Esomonu  (2025)  emphasizes  that  maintaining  data  quality  requires  ongoing  surveillance,  not  a
one-time  cleaning  event.  Drift  detection,  lineage  tracking,  and  periodic  audits  must  become
standard practice.

7.3.5 Redesigning Evaluation Metrics

Model performance should be evaluated not only by accuracy but also by:

ò

input quality scores,

ò  data completeness indices,

ò  metadata consistency,

ò

annotation reliability metrics.

This reframes success around data stewardship rather than model scale.

8. Conclusion and Future Directions

This paper has argued that the dominant model-centric narrative in artificial intelligence overlooks
a far more fundamental driver of performance: data quality. While organizations continue to invest
in  larger  architectures,  deeper  networks,  and  increased  computational  capacity,  the  evidence  is
overwhelmingly clear that clean, consistent, and reliable data has a far greater impact on accuracy,
robustness,  interpretability,  and  long-term  system  success.  As  Abbas  and  Hussain  (2025)
emphasize, dataùnot model complexityùis the true foundation of AI reliability. Across scientific,
industrial,  business,  and  governmental  domains,  the  failures  and  instabilities  observed  in  AI
deployments  repeatedly  stem  from  upstream  data  issues  rather  than  algorithmic  limitations
(Fairfield, 2025; Pathak, 2025; Machireddy, 2025; Chowdhury et al., 2025).

By reviewing contemporary research, this paper has shown that relational inconsistencies (Zhu et
al., 2025), incomplete or sparse measurements (Sood et al., 2025), poor annotations (Karim et al.,
2025), and systematic noise (Sham et al., 2025) undermine even the most advanced architectures.
Automated cleaning pipelines (Kilani et al., 2025), hybrid humanûAI validation workflows (Ahi
et  al.,  2025),  and  well-governed  data  practices  (Islam,  2025)  produce  far  more  meaningful

improvements  than  simply  scaling  models.  The  proposed  Data-First  AI  Pipeline  integrates
validation, cleaning, feedback loops, and governance principles to offer a practical blueprint for
organizations seeking to redirect their AI strategy toward data-centric excellence.

8.1 Future Research Directions

While  the  shift  toward  data-centric  AI  is  gaining  momentum,  several  important  research
opportunities remain:

8.1.1 Autonomous Data Cleaning and Integrity Agents

Future systems may employ autonomous AI agents capable of detecting, repairing, and enriching
data  streams  in  real  time.  Karim  et  al.  (2025)  illustrate  early  progress  in AI-driven  annotation,
hinting at the potential for fully automated, context-aware data governance.

8.1.2 Explainable Data Quality Metrics

There is a growing need for interpretable data quality scores that quantify the reliability of training
and inference datasets in a standardized way. Such metrics would support regulatory frameworks,
model auditing, and organizational transparency.

8.1.3 Domain-Specific Data Quality Frameworks

Sectors  like  healthcare,  climate  modeling,  and  cybersecurity  require  specialized  cleaning  and
validation approaches tailored to their data ecosystems (Arzikulov & Komiljonov, 2025; Xu et al.,
2025; Rayhan, 2025). Developing domain-targeted frameworks will be critical for achieving safe
and reliable AI outcomes.

8.1.4 Integrating Data-Centric and Model-Centric Paradigms

While  this  paper  argues  strongly  for  data-first  methods,  future  research  should  explore  hybrid
strategies  that  integrate  robust  data  curation  with  scalable  architectures  to  maximize  both
efficiency and performance.

8.1.5 Ethical and Governance Implications of Data Quality

As  AI  systems  become  more  embedded  in  society,  poor  data  stewardship  can  lead  to
discrimination, exclusion, and systemic harm. Future work must examine the ethical, social, and
policy dimensions of data-centric AI to ensure equitable outcomes.

8.2 Final Perspective

The next wave of AI progress will not be defined by bigger models, but by better data. Clean,
reliable,  well-governed  datasets  amplify  model  performance,  reduce  operational  risks,  enhance

trustworthiness, and ensure more stable deployment across real-world conditions. By embracing
data-centric AI, organizations can build systems that are not only more accurate, but also safer,
fairer, and more aligned with human and institutional needs. As the evidence throughout this paper
shows, high-quality data is not simply a technical requirementùit is the cornerstone of sustainable
AI success.

References

1.  Syed Abbas, Ali Azghar Hussain. (2025). The Overlooked Key to AI Success: Why Clean,
Reliable  Data  Outperforms  Bigger  Models.  International  Journal  For  Multidisciplinary
Research. 7. 10.36948/ijfmr.2025.v07i06.61533.

2.  Ahangar,  M.  N.,  Farhat,  Z.  A.,  &  Sivanathan,  A.  (2025).  AI  trustworthiness  in
Industry  5.0.  Sensors.

toolkits,  and

the  path

to

manufacturing:  Challenges,
https://www.mdpi.com/

3.  Ahi, K., Wu, S., Fenger, G., & Mansour, S. (2025). Human-in-the-loop system boosting
reviewer productivity by 80%+ and accelerating decision-making via real-time anomaly
detection and data refinement. Metrology and Inspection. https://spiedigitallibrary.org/
4.  Arzikulov, F., & Komiljonov, A. (2025). The role of artificial intelligence in personalized
oncology:  Predictive  models  and  treatment  optimization. Academic  Journal  of  Science.
integrumpublication.org

5.  Chowdhury, S., Ghosh, A., Acharya, S., & others. (2025). Transforming chemical process
engineering:  The  role  of AI  and  machine  learning  in  revolutionizing  process  systems.
Canadian Journal of Chemical Engineering. Wiley.

6.  Esomonu, N. P. M. (2025). Utilizing AI and big data for predictive insights on institutional
performance and student success: A data-driven approach to quality assurance. In AI and
Ethics, Academic Integrity and the Future of Education. ResearchGate.

7.  Fairfield,  J.  (2025).  Clean  data:  Recursion  as  pollution  in  environmental  AI.  Oxford

Intersections: AI in Society. scholarlycommons.law.wlu.edu

8.  Islam,  M.  R.  (2025).  AI  and  analytics  for  entrepreneurs:  A  practical  guide  to  smarter

business growth. Google Books.

9.  Karim, M. M., Khan, S., Van, D. H., Liu, X., Wang, C., & Qu, Q. (2025). Transforming
data  annotation  with AI  agents: A  review  of  architectures,  reasoning,  applications,  and
impact. Future Internet. MDPI.

10. Kilani, S. O., Amao, I. K., Ojo, N. A., & Samson, P. A. (2025). AI and machine learning-

powered automated data cleaning methods: Improving data quality. ijarpr.com

11. Machireddy, J. (2025). Harnessing AI and data analytics for smarter healthcare solutions.

SSRN.

12. Pagliaro, A. (2025). Artificial intelligence vs. efficient markets: A critical reassessment of

predictive models in the big data era. Electronics. MDPI.

13. Pathak, A. (2025). Leveraging AI for better data quality and insights. Journal of Computer

Science and Technology Studies. al-kindipublishers.org

14. Rayhan,  F.  (2025). AI-enabled  energy  forecasting  and  fault  detection  in  off-grid  solar

networks for rural electrification. Authorea Preprints. techrxiv.org

15. Sham, F. A. F., El-Shafie, A., Jaafar, W. Z. W., & Sherif, M. (2025). Advances in AI-based
rainfall forecasting: A comprehensive review of past, present, and future directions with
intelligent data fusion and climate change models. Results in Engineering. Elsevier.

16. Sood,  K.,  Liu,  S.,  Nguyen,  D.  D.  N.,  &  Kumar,  N.  (2025). Alleviating  data  sparsity  to
enhance AI  modelsÆ  robustness  in  IoT  network  security  context.  IEEE  Transactions  on
Network Science and Engineering.

17. Sourav,  M.  S. A., Asha,  N.  B.,  &  Reza,  J.  (2025).  Generative AI  in  business  analytics:
Opportunities and risks for national economic growth. Journal of Computer Science and
Technology Studies. al-kindipublishers.org

18. Veluru, S. R., Erukude, S. T., & Marella, V. C. (2025). Data-centric AI: A systematic review
of methods, challenges, and future directions. International Journal of à papers.ssrn.com
19. Xu,  D.,  Gondal,  I.,  Yi,  X.,  Susnjak,  T.,  Watters,  P.,  &  others.  (2025).  The  erosion  of
cybersecurity  zero-trust  principles  through  generative AI: A  survey  on  challenges  and
future directions. Journal of Cybersecurity and Privacy. MDPI.

20. Zhu,  J.,  Zhao,  X.,  Sun, Y.,  Song,  S.,  &  others.  (2025).  Relational  data  cleaning  meets

artificial intelligence: A survey. Data Science & Engineering. EBSCOhost.
