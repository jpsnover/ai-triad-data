<!--
  AI Triad Research Project — Document Snapshot
  Title      : A Privacy-First Architecture for Fully Local Retrieval-Augmented Generation in Secure Document Intelligence
  Source     : 
  Type       : pdf
  Captured   : 2026-04-09
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# A Privacy-First Architecture for Fully Local Retrieval-Augmented Generation in Secure Document Intelligence

> **Snapshot captured:** 2026-04-09
> **Source:** 
> **Type:** pdf

---
A Privacy-First Architecture for Fully Local Retrieval-Augmented
Generation in Secure Document Intelligence

Mohit Srivastava1

1Independent Researcher, AI Architect

January 10, 2026

1

.
.
.

b

t
o
n

d

l

u
o
h
s

y
e
h
T

.

d
e
w
e
i
v
e
r

r
e
e
p

t
o
n

e
r
a

t
a
h
t

s
t
r
o
p
e
r

y
r
a
n
i
m

i
l
e
r
p

e
r
a

v
i
x
R
h
c
e
T
n
o

d
e
t
s
o
p

s
t
n
i
r
P
-
e

ù
1
v
/
5
8
5
2
7
9
6
4
.
4
9
8
0
0
8
6
7
1
.
v
i
x
r
h
c
e
t
/
7
2
2
6
3
.
0
1
/
g
r
o
.
i
o
d
/
/
:
s
p
t
t
h
ù

0
.
4
Y
B
C
C
ù

-

6
2
0
2

n
a
J

0
1

n
o

d
e
t
s
o
P

A Privacy-First Architecture for Fully Local Retrieval-Augmented Generation in Secure
Document Intelligence

Mohit Srivastava
Independent Researcher, AI Architect, Greer, SC-29650, mosriva@gmail.com

1.  Abstract

Large Language Models (LLMs) have accelerated the development of retrieval-augmented
generation (RAG) techniques for information access and decision support. However, most
existing RAG implementations rely on cloud-based inference or managed vector stores, limiting
their use in privacy-sensitive or air-gapped environments. This work presents a fully local,
privacy-preserving RAG architecture for document intelligence and question answering, which
we refer to as RAGStack. The framework integrates PyMuPDF, FAISS, SentenceTransformers, and
locally hosted LLMs via Ollama to enable end-to-end retrieval and generation without external
network dependencies. We describe the system architecture, design choices, and operational
trade-offs, and evaluate the framework through internal tests on CPU-only hardware. Results
indicate that the approach delivers consistent retrieval grounding and practical latency for
moderate-scale document corpora. RAGStack demonstrates the feasibility of offline RAG
systems for domains with strict data-governance requirements and provides a reproducible
reference implementation to support further research in private and auditable GenAI
deployment.

2.  Introduction

Rapid LLM adoption has been transforming the way information access and decision support
are done across enterprises. Despite their capabilities, commercial AI services introduce
concerns around data confidentiality, regulatory compliance, governance, and long-term
operational control. Major industries, such as finance, healthcare, government, and legal
services, adopt specific data protection requirements (e.g., GDPR, HIPAA, SOC 2, ISO/IEC 27001)
that, among others, often restrict the transfer of confidential documents outside organizational
boundaries. Consequently, cloud-based GenAI is often incompatible with high-governance
environments.

RAG enhances factual accuracy by retrieving relevant document excerpts and providing them as
context during LLM inference. However, most current implementations rely on services like:

ò  Cloud inference APIs, such as OpenAI GPT, Azure OpenAI, AWS Bedrock
ò  Cloud-managed or proprietary vector stores;
ò  Third-party hosted embedding pipelines.

This brings up an adoption challenge wherein, although GenAI offers improved reasoning
capabilities, deployments are constrained by data sovereignty concerns, including privacy
enforcement and cost control.

2.1 Motivation and Research Gap

Traditional enterprise search tools are based on keyword matching without semantic
understanding, and thus cannot handle complex, context-dependent queries. The latest
generation of RAG frameworks, including LangChain and LlamaIndex, together with some vector
database platforms introduce semantic retrieval; however, most depend on cloud-hosted APIs
or external embedding services. This makes them unfit for use by organizations that need to
operate in compliance-sensitive or air-gapped environments.

This raises a fundamental research question:

How do organizations enable advanced LLM reasoning over internal documents with complete
data sovereignty and zero dependencies on any external services?

Existing research on RAG predominantly emphasizes retrieval accuracy and model quality, but
rarely examines deployability under enterprise governance constraints, offline execution
requirements, or auditabilityùfactors crucial for real-world adoption. To address these gaps,
RAGStack introduces a fully local, API-free RAG architecture designed for compliance-sensitive
environments. The framework emphasizes traceability, inference controllability, and
reproducibility while maintaining strong retrieval performance.

2.2 Contribution of This Work

RAGStack provides the following contributions:

ò  Runs entirely offline, without API calls or cloud services

ò  Generates embeddings and performs vector search locally using FAISS

ò  Executes LLM inference via Ollama-hosted models (Mistral, LLaMA2, Phi) fully on-

premises

ò  Supports auditability and reproducibility via persistent indexing and context traceability,

while remaining modular for enterprise integration

ò  Operates efficiently on CPU-only hardware while optionally supporting GPU acceleration

for large-scale enterprise workloads.

The primary objective of this work is to demonstrate that fully local RAG-based LLM systems are
capable of delivering production-grade performance while preserving data sovereignty,
regulatory compliance, and governance maturity.

3.  Problem Statement

Organizations create and maintain a large number of internal documents as policies, manuals,
guidelines, and more. Finding the right information in these documents is difficult. Keyword
search tools cannot understand meaning or context, and cloud-based LLM solutions often
cannot be used because of privacy rules or high costs.

Because of this, organizations need a secure, offline system that can understand context,
answer questions, and work directly over internal PDF documents using modern GenAI models.
Organizations also need AI systems which are transparent, easy to review, and fully under
control.

Filling this gap is important for developing AI systems that are secure, interpretable, and
practical for real enterprise use.

4.  System Architecture

This section describes the high-level system architecture underlying RAGStack, including
ingestion, vectorization, retrieval, and inference modules. RAGStack is composed of six key
components:

1.  Document Parsing & Chunking: PDF files are parsed using PyMuPDF and segmented into

300-word chunks.

2.  Embedding & Indexing: Chunks are embedded using all-MiniLM-L6-v2 from

SentenceTransformers and stored in a FAISS FlatL2 vector index.

3.  Top-K Retrieval: On user query, the top five semantically closest chunks are retrieved.

4.  Prompt Construction: Retrieved chunks are formatted into a prompt that includes

filename and page number as source metadata.

5.  LLM Inference via Ollama: Models like Mistral, Phi, or LLaMA2 are hosted locally using

Ollama and accessed via HTTP API.

6.  UI Layer: A Streamlit interface supporting document upload, model selection, document

intelligence queries, question answering, and session export.

Figure 1. RAGStack architecture illustrating the offline document ingestion and vectorization
pipeline (left) and the query retrieval and reasoning pipeline (right). Chunks are embedded using
SentenceTransformers and stored in FAISS. At query time, the system embeds the user prompt,
retrieves the top-k matching chunks, constructs a contextual prompt, and generates a grounded
response using a locally hosted LLM via Ollama.

5.   Implementation Details

The current implementation of RAGStack is configured as follows:

ò  Chunk Size: 300 words ù balances context relevance and model token limitations

ò  Embedding Model: all-MiniLM-L6-v2 ù efficient, fast, and robust for semantic similarity

ò  Vector Search: FAISS FlatL2 ù lightweight and high-performing for smaller corpora

ò

LLMs Tested: Mistral (7B), Phi-2, LLaMA2 (7B) ù all run via Ollama on local CPU

ò  Session Handling: Each session tracks Q&A history with export and clear options

All experiments were conducted on a standard CPU-only machine (e.g., 8-core Intel i7, 16GB
RAM) to demonstrate feasibility in resource-constrained enterprise environments.

6.  Representative Use Cases

ò  Compliance Q&A: Retrieve GDPR/HIPAA-relevant clauses across multiple policy

documents.

ò  Policy Retrieval: Trace requirements and responsibilities across multi-document policy

sets.

ò  RFP Analysis: Summarize historical procurement and response documents for faster bid

preparation.

ò  HR/IT Knowledge Assistance: Answer internal FAQ-style questions using employee

handbooks and IT guidelines.

ò  Student & Professional Learning Support: Enable students and working professionals to
ask complex questions over course materials, training manuals, or certification guides,
allowing for secure, contextualized, and personalized learning insights.

For example, a compliance officer in a financial institution can quickly locate the GDPR-relevant
clauses across multiple internal manuals. Likewise, procurement teams can use RAGStack to
search past relevant RFP responses and contractual clauses. Similarly, students enrolled in
professional courses such as cybersecurity, data science, business analysis, or project
managementùcan use RAGStack to extract summaries or explanations directly from their
course PDFs, improving learning efficiency while maintaining full privacy.

7.  Evaluation

While formal benchmarking against open QA datasets remains future work, internal testing
demonstrates the following:

ò  Response times of a few seconds on a corpus of 1,000+ chunks running on CPU

ò  Answers traceable to exact filenames and page numbers in over 90% of cases

ò  Qualitative assessment indicated clear grounding and consistent attribution

These results are preliminary and intended to demonstrate feasibility rather than establish
state-of-the-art performance.

8.  Related Work

Retrieval-Augmented Generation (RAG) has attracted increasing attention recently as a
methodology for improving LLMs' factual accuracy and reducing their hallucinations, as
demonstrated in Lewis et al. [5]. The frameworks LangChain and LlamaIndex offer modular
integrations with retrieval pipelines. However, their dependency on cloud-hosted inference
APIs, such as those from OpenAI GPT, Cohere, and Anthropic severely limits their use in
restricted environments.

Enterprise search platforms including Azure Cognitive Search, AWS Bedrock, and Google Vertex
AI offer increasingly sophisticated RAG capabilities but they require transmitting internal

documents to managed cloud services. As a result, organizations operating under strict data
residency mandates or regulatory frameworks often cannot adopt these solutions.

Several recent works explore retrieval optimization and large-scale RAG system architectures
[6], [7]. Izacard and Grave [6] introduce retrieval-augmented generation strategies for open-
domain question answering, while Gao et al. [7] provide a comprehensive survey covering
indexing strategies, reranking models, retrieval fusion methods, and system design
considerations for large-scale RAG pipelines. However, these approaches generally assume
access to cloud-scale compute or managed infrastructure and do not address deployability in
air-gapped or compliance-sensitive environments.

Fully private, offline RAG implementations remain relatively underexplored in the literature.
Existing open-source demonstrations typically emphasize retrieval accuracy or architectural
modularity but do not incorporate requirements central to enterprise adoption, such as
auditability, persistent indexing, controlled inference environments, or compliance alignment.

RAGStack differentiates itself from these existing approaches by providing a fully local, API-free,
and auditable RAG pipeline intended specifically for high-governance operational contexts.
Table 1 summarizes its contrast with common industry and open-source alternatives.

Existing Approach
Cloud-hosted RAG (OpenAI /
Azure)

LangChain/LlamaIndex

Enterprise search engines

Open-source RAG demos

Limitations
Requires internet & API token
usage
Complex setup and frequent
reliance on external LLM APIs
Keyword-based, lacks
semantic reasoning
Limited security focus, no
persistence

RAGStack Advantage
Fully offline, no external
dependencies

Lightweight, portable

Embedding-based contextual
retrieval
Enterprise-ready, traceable,
and audit-compliant

This work provides publicly documented RAG framework, catering specifically to full local
deployment in enterprise environments, with an emphasis on data privacy, operational
feasibility, and reproducibility under high-compliance constraints.

9.  Design Trade-offs

Decision
Local LLM inference vs
API services

FAISS FlatL2 indexing

Trade-off
Higher latency during
inference
Less efficient beyond ~50k
documents

Rationale
Ensures full data privacy and
eliminates cloud dependency
Provides fast, lightweight retrieval
suitable for local deployments

300-word chunk size

CPU-only deployment

Streamlit interface

May reduce contextual
precision
Slower inference compared to
GPU
Not optimized for production-
scale UI

Improves recall and minimizes
prompt token limit risks
Enables installation on standard
enterprise hardware
Allows rapid prototyping and
transparent user interaction

These trade-offs, in some cases, are intentionally chosen for better operational feasibility and
alignment with compliance in early-stage deployments. Possible future enhancements that may
explore GPU acceleration and dynamic chunking strategies are discussed in Section 10.

10. Limitations & Future Work

10.1 Technical Limitations

While the current implementation of RAGStack shows strong practical utility in secure
document intelligence and question answering, several limitations remain that present
opportunities for future enhancement and optimization.

ò

Inference latency: LLM inference on the local device's CPU leads to longer response
latency than when using GPU-assisted or cloud-hosted models, notably in larger models
or extensive contexts.

ò  Scalability constraints: While FAISS FlatL2 is efficient for moderate sets of documents, it
may degrade the retrieval performance beyond ~100,000 indexed chunks without
further optimization or using an ANN-based indexing strategy.

10.2 Enterprise Roadmap & Implementation Enhancements
Future development will focus on improving accuracy, scalability, and wider applicability
through the following directions:

ò  OCR Integration: Enable support for scanned or image-based PDFs to extend coverage to

legacy and compliance documentation commonly used in enterprises.

ò  Formal Benchmarking: Incorporate evaluation against QA datasets such as HotpotQA or

BioASQ to support quantitative assessment and model comparison.

ò  Domain Adaptation: Fine-tune embedding models and retrieval strategies using

enterprise-specific document corpora to enhance performance in specialized business
contexts.

ò  Hardware Acceleration: Explore GPU and specialized inference infrastructure to reduce
latency and support high-throughput cases in large-scale enterprise deployments.

10.3 Research Directions

While RAGStack delivers an effective reference implementation for private enterprise document
intelligence and question answering, scaling and extending this framework opens multiple
future research opportunities:

Opportunity

Scaling to Larger
Corpora

Domain
Adaptation

Evaluation
Benchmarks

Multimodal
Support

Advanced
Retrieval Fusion
Methods

Explainable RAG

Edge Deployment

Description
Enhance FAISS performance for >100k
docs using ANN strategies or GPU
acceleration
Fine-tune embedding and LLM models
using enterprise historical data or
knowledge graphs
Introduce formal benchmarking (e.g.,
HotpotQA, NarrativeQA) with human-
in-the-loop validation
Expand to scanned docs (OCR) or
structured data (SQL, XML) using
hybrid ingestion

Potential Research Area

Scalable Vector Databases

Retrieval Optimization

Accuracy & Reliability

Multimodal RAG

Combine keyword + embedding
scoring to improve factual retrieval

Hybrid Retrieval

Introduce reasoning chain visibility for
audit readiness in critical sectors
Explore lightweight deployment on
secured government/MoD devices

XAI in LLMs

Edge AI

RAGStack may serve as a foundational architecture for secure enterprise artificial intelligence,
enabling AI-driven insights without compromising operational or regulatory boundaries.

10.4 Ethical and Operational Considerations

RAGStack is designed focusing privacy-first to operate completely offline. There will be no
transmission of user content, embeddings, or inference context outside enterprise
infrastructure, which ensures that the architecture reduces exposure to privacy and compliance
risks according to regulatory frameworks like GDPR, HIPAA, and NIST SP 800-53.

AI-generated outputs, however, remain bound by the quality and completeness of the ingested
document corpus and the interpretation limitations of large language models. For high-risk
domains, which include legal decision-making, regulatory interpretation, or clinical advisory,
critical responses will always need to be vetted through human-in-the-loop review processes to
maintain reliability and avoid over dependence on automated outputs.

Additional features targeting explainability, automated risk scoring of the responses, and policy-
based mechanisms for validation can improve governance maturity even more for enterprise-
wide deployments.

10.4.1 Disclaimer and Responsible Use Statement

RAGStack is presented as a research and educational framework that explores the feasibility of
fully local Retrieval-Augmented Generation under strict privacy and governance requirements.
Although the system enhances transparency through retrieval grounding and audit traces, its
outputs remain subject to the limitations of the underlying document corpus and the local LLM.

The domains which require high assurance (e.g., legal, regulatory, medical, or safety-critical
contexts), model-generated responses should be treated as supportive information rather than
conclusions and should be reviewed by qualified professional. Proper validation and human
oversight remain essential when deploying any AI-assisted system in sensitive environments.

11. Data and Code Availability

The complete source code and documentation for the RAGStack framework are publicly
available to enable replication and further research:

ò  GitHub Repository: https://github.com/mosriva/ragstack

ò  Zenodo Archived Release (Versioned DOI): https://doi.org/10.5281/zenodo.17878948

The repository includes implementation scripts, configuration files, architecture diagrams, and
the Streamlit interface used for all experiments. All evaluations in this work were conducted
using this publicly available codebase. No proprietary or sensitive enterprise data are included.

12. Conclusion

RAGStack shows that a fully local Retrieval-Augmented Generation architecture is technically
feasible and a strategic advantage for organizations under strict privacy, governance, or data
residency mandates. The framework removes any dependence on external cloud APIs and
enables complete data sovereignty while supporting scalable, cost-efficient LLM-driven
knowledge intelligence using open-source components with local compute.

The system's modular design, light resource footprint, and capability for execution offline make
RAGStack deployable across a wide range of enterprise environments. This architecture is well
suited for highly secured air-gapped systems to large-scale corporate data hubs. Initial pilots
indicate reduced time-to-insight for document analysis, improved trust through explicit source
traceability, and readiness for confidential data handling.

RAGStack fills the gap between the state-of-the-art retrieval methodologies of GenAI and real-
world enterprise constraints, offering a practical blueprint for privacy-first AI adoption. By
anchoring its approach in auditability, local autonomy, and explainability, it is well-positioned as
a backbone for enterprise AI systems going forward, especially within highly compliance-
governed sectors.

13. References

[1] J. Johnson, M. Douze, and H. JΘgou, ôBillion-scale similarity search with FAISS,ö Proc. IEEE Int.
Conf. Big Data, 2017. Available: https://arxiv.org/abs/1702.08734

[2] N. Reimers and I. Gurevych, ôSentence-BERT: Sentence embeddings using Siamese BERT
networks,ö Proc. EMNLP, 2019. Available: https://arxiv.org/abs/1908.10084

[3] Ollama, ôOllama: Local LLM runtime for on-device inference,ö 2024. Available:
https://ollama.com/

[4] Streamlit, ôStreamlit: The fastest way to build and share data apps,ö 2024. Available:
https://streamlit.io/

[5] P. Lewis et al., ôRetrieval-Augmented Generation for knowledge-intensive NLP,ö Advances in
Neural Information Processing Systems (NeurIPS), 2020. Available:
https://arxiv.org/abs/2005.11401

[6] G. Izacard and E. Grave, ôLeveraging Passage Retrieval with Generative Models for Open-
Domain Question Answering,ö Proc. EACL, 2021. Available: https://arxiv.org/abs/2007.01282

[7] L. Gao et al., ôRetrieval-Augmented Generation for Large Language Models: A Survey,ö arXiv
preprint arXiv:2312.10997, 2024.

[8] I. Goodfellow, Y. Bengio, and A. Courville, Deep Learning. MIT Press, 2016. Available:
https://www.deeplearningbook.org/

[9] National Institute of Standards and Technology (NIST), ôAI Risk Management Framework (AI
RMF) 1.0,ö U.S. Department of Commerce, 2023. Available: https://www.nist.gov/itl/ai-risk-
management-framework

14. Author Information

Author: Mohit Srivastava
LinkedIn: www.linkedin.com/in/mohit-srivastava-96038033
GitHub: https://github.com/mosriva
Email: mosriva@gmail.com
