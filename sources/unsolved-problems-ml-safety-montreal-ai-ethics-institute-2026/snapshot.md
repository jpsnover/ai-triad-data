<!--
  AI Triad Research Project — Document Snapshot
  Title      : Unsolved Problems in ML Safety | Montreal AI Ethics Institute
  Source     : https://montrealethics.ai/unsolved-problems-in-ml-safety/
  Type       : web_article
  Captured   : 2026-02-24
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Unsolved Problems in ML Safety | Montreal AI Ethics Institute

> **Snapshot captured:** 2026-02-24
> **Source:** https://montrealethics.ai/unsolved-problems-in-ml-safety/
> **Type:** web_article

---

# Unsolved Problems in ML Safety

May 28, 2023

<img src="https://montrealethics.ai/wp-content/uploads/2023/05/DALL·E-2023-05-28-19.15.23-an-abstract-depiction-of-safety-with-computers-in-the-background-in-a-sterile-environment-digital-art.png" class="singular-image entry-image" itemprop="image" decoding="async" srcset="https://montrealethics.ai/wp-content/uploads/2023/05/DALL·E-2023-05-28-19.15.23-an-abstract-depiction-of-safety-with-computers-in-the-background-in-a-sterile-environment-digital-art.png 1024w, https://montrealethics.ai/wp-content/uploads/2023/05/DALL·E-2023-05-28-19.15.23-an-abstract-depiction-of-safety-with-computers-in-the-background-in-a-sterile-environment-digital-art-300x300.png 300w, https://montrealethics.ai/wp-content/uploads/2023/05/DALL·E-2023-05-28-19.15.23-an-abstract-depiction-of-safety-with-computers-in-the-background-in-a-sterile-environment-digital-art-150x150.png 150w, https://montrealethics.ai/wp-content/uploads/2023/05/DALL·E-2023-05-28-19.15.23-an-abstract-depiction-of-safety-with-computers-in-the-background-in-a-sterile-environment-digital-art-768x768.png 768w, https://montrealethics.ai/wp-content/uploads/2023/05/DALL·E-2023-05-28-19.15.23-an-abstract-depiction-of-safety-with-computers-in-the-background-in-a-sterile-environment-digital-art-100x100.png 100w, https://montrealethics.ai/wp-content/uploads/2023/05/DALL·E-2023-05-28-19.15.23-an-abstract-depiction-of-safety-with-computers-in-the-background-in-a-sterile-environment-digital-art-500x500.png 500w" sizes="(max-width: 420px) 100vw, 420px" width="420" height="420" />

<figure class="wp-block-media-text__media">
<img src="https://montrealethics.ai/wp-content/uploads/2023/05/dan-hendrycks-1024x826.jpeg" class="wp-image-4483 size-full" decoding="async" srcset="https://montrealethics.ai/wp-content/uploads/2023/05/dan-hendrycks-1024x826.jpeg 1024w, https://montrealethics.ai/wp-content/uploads/2023/05/dan-hendrycks-300x242.jpeg 300w, https://montrealethics.ai/wp-content/uploads/2023/05/dan-hendrycks-768x619.jpeg 768w, https://montrealethics.ai/wp-content/uploads/2023/05/dan-hendrycks-1536x1239.jpeg 1536w, https://montrealethics.ai/wp-content/uploads/2023/05/dan-hendrycks-2048x1651.jpeg 2048w" sizes="(max-width: 1024px) 100vw, 1024px" width="1024" height="826" />
</figure>

🔬 Research Summary by **Dan Hendrycks,** received his PhD from UC Berkeley where he was advised by Dawn Song and Jacob Steinhardt. He is now the director of the <a href="https://safe.ai/" rel="noreferrer noopener" target="_blank">Center for AI Safety</a>.

\[[Original paper](https://arxiv.org/abs/2109.13916) by Dan Hendrycks, Nicholas Carlini, John Schulman, and Jacob Steinhardt\]

------------------------------------------------------------------------

**Overview**: As ML systems become more capable and integrated into society, the safety of such systems becomes increasingly important. This paper presents four broad areas in ML Safety: Robustness, Monitoring, Alignment, and Systemic Safety. We explore each area’s motivations and provide concrete research directions.

------------------------------------------------------------------------

## **Introduction**

Over five months, the Boeing 737 MAX crashed twice, killing 346 people. It was later determined that Boeing had made unsafe design choices and pressured inspectors to bring the plane to market more quickly.

Often, it takes a disaster like this for people to pay attention to safety concerns. As AI systems are rapidly improved and applied to new domains, failures will only become more consequential. It is, therefore, important for the ML research community to proactively design systems with safety in mind. As the adage goes, “An ounce of prevention is worth a pound of cure.”

How can we reduce the probability of high-consequence failures of AI systems? Our goal in writing “Concrete Problems in ML Safety” is to draw attention to this question and list some research directions that address it. We would love to see the [ML Safety community](https://www.mlsafety.org/) grow and hope that our paper can help guide this area of research and document its motivations.

## **Key Insights**

We describe four research problems:

1.  **Robustness**: how can we make systems reliable in the face of adversaries and highly unusual situations?
2.  **Monitoring**: how can we detect anomalies, malicious uses, and discover unintended model functionality?
3.  **Alignment**: how can we build models that represent and safely optimize difficult-to-specify human values?
4.  **Systemic Safety**: how can we use ML to address broader risks related to how ML systems are handled? Examples include ML for cyber security and improving policy decision-making.

This work is not the first to consider any of these areas. To view related literature, please refer to the [original paper](https://arxiv.org/abs/2109.13916).

### Robustness

**Motivation**

Current machine learning systems are not robust enough to handle real-world complexity and long-tail events. For example, failing to recognize a tilted stop sign, occluded, or represented on a LED matrix could cause loss of life.

<figure class="wp-block-image size-large">
<img src="https://montrealethics.ai/wp-content/uploads/2023/05/image-23-1024x575.png" class="wp-image-4485" loading="lazy" decoding="async" srcset="https://montrealethics.ai/wp-content/uploads/2023/05/image-23-1024x575.png 1024w, https://montrealethics.ai/wp-content/uploads/2023/05/image-23-300x169.png 300w, https://montrealethics.ai/wp-content/uploads/2023/05/image-23-768x431.png 768w, https://montrealethics.ai/wp-content/uploads/2023/05/image-23-1280x720.png 1280w, https://montrealethics.ai/wp-content/uploads/2023/05/image-23-1536x863.png 1536w, https://montrealethics.ai/wp-content/uploads/2023/05/image-23.png 1748w" sizes="(max-width: 1024px) 100vw, 1024px" width="1024" height="575" />
</figure>

Additionally, adversaries can easily manipulate vulnerabilities in ML systems and cause them to make mistakes. For example, adversaries may bypass the neural networks used to detect intruders or malware.  

**Some example directions**

- Create robustness benchmarks that incorporate large distribution shifts and long tail events.
- Prevent *competent errors* where agents wrongly generalize and execute wrong routines.
- Improve system abilities to adapt and learn from novel scenarios. 
- Explore defenses to adversarial attacks with an unknown specification (beyond the typical ‘lp ball’ setting).
- Develop adversarial defenses that can adapt at test time. 

### Monitoring

**Motivation**

When AI systems are deployed in high-stakes settings, it will be important for human operators to be alerted when there is an anomaly, an attack, or if the model is uncertain so that they can intervene. Also, capabilities have been known to emerge unexpectedly in AI systems. Human operators should understand how models function and what actions they can take to avoid unwanted surprises.

<figure class="wp-block-image size-large">
<img src="https://montrealethics.ai/wp-content/uploads/2023/05/image-24-1024x450.png" class="wp-image-4486" loading="lazy" decoding="async" srcset="https://montrealethics.ai/wp-content/uploads/2023/05/image-24-1024x450.png 1024w, https://montrealethics.ai/wp-content/uploads/2023/05/image-24-300x132.png 300w, https://montrealethics.ai/wp-content/uploads/2023/05/image-24-768x337.png 768w, https://montrealethics.ai/wp-content/uploads/2023/05/image-24-1536x674.png 1536w, https://montrealethics.ai/wp-content/uploads/2023/05/image-24.png 1754w" sizes="(max-width: 1024px) 100vw, 1024px" width="1024" height="450" />
</figure>

**Some example directions**

- Improve model calibration (the appropriateness of output probabilities) and extend expressions of uncertainty to natural language.
- Train models to more accurately report the knowledge available to them.
- Detect when data has been poisoned, or back doors have been inserted into models.
- Develop a testbed to screen for potentially hazardous capabilities, such as the ability to execute malicious user-supplied code, generate illegal or unethical forms of content, etc.

### Alignment

**Motivation**

While most technologies do not have goals and are simply tools, future machine learning systems may act to optimize objectives. Aligning objective functions with human values requires overcoming societal and technical challenges.

<figure class="wp-block-image size-large">
<img src="https://montrealethics.ai/wp-content/uploads/2023/05/image-22-1024x333.png" class="wp-image-4484" loading="lazy" decoding="async" srcset="https://montrealethics.ai/wp-content/uploads/2023/05/image-22-1024x333.png 1024w, https://montrealethics.ai/wp-content/uploads/2023/05/image-22-300x98.png 300w, https://montrealethics.ai/wp-content/uploads/2023/05/image-22-768x250.png 768w, https://montrealethics.ai/wp-content/uploads/2023/05/image-22-1536x500.png 1536w, https://montrealethics.ai/wp-content/uploads/2023/05/image-22.png 1752w" sizes="(max-width: 1024px) 100vw, 1024px" width="1024" height="333" />
</figure>

**Some example directions**

- Align specific technologies, such as recommender systems, with well-being rather than engagement.
- Detect when ethical decisions are clear-cut or contentious.
- Train models to learn difficult-to-specify goals in interactive environments.
- Improve the robustness of reward models.
- Design minimally invasive agents that prefer easily reversible to irreversible actions.
- Teach ML systems to abide by rules and constraints specified in natural language.
- Mitigate and detect unintended instrumental goals such as [self-preservation](https://arxiv.org/abs/1611.08219) or [power-seeking](https://arxiv.org/abs/1912.01683).
- Have agents balance and optimize many values since there is no agreement about the best set.

### Systemic Safety

ML systems are more likely to fail or be misdirected if the larger context in which they operate is insecure or turbulent. One research direction that can help combat this is **ML for cyber security**. There may be strong incentives for attackers to steal ML models, which could be used in dangerous ways or inherently dangerous and not fit for proliferation. ML could be used to develop better defensive systems that reduce the risk of attacks.

Another research direction in this category is **ML for informed decision-making**. Even if ML systems are safe in and of themselves, they must still be *used* safely. During the cold war, misunderstanding and political turbulence exposed humanity to several close calls and brought us to the brink of catastrophe, demonstrating that systemic issues can make technologies unsafe. Using ML to help institutions make more informed decisions may help to combat these risks.

## **Between the lines**

Ultimately, our goal as researchers should not just be to produce interesting work but to help steer the world in a better direction. We hope to highlight some safety problems that may be under-emphasized. This list was far from comprehensive, and we would be enthusiastic about further research into reducing high-consequence risks that may arise in the future.

**Want quick summaries of the latest research & reporting in AI ethics delivered to your inbox? Subscribe to the AI Ethics Brief. We publish bi-weekly.**  

<a href="https://brief.montrealethics.ai/" target="_blank"><img src="https://substackcdn.com/image/fetch/$s_!nnck!,w_170,c_limit,f_auto,q_auto:best,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc9b90258-7c55-43c3-804f-2f1634d3f18c_800x800.png" class="publication-logo" alt="Logo" /></a>

# <a href="https://brief.montrealethics.ai/" target="_blank"><span data-testid="balanced-text" style="text-wrap:balance;">The AI Ethics Brief</span></a>

<span testid="balanced-text" style="text-wrap:balance;">Democratizing AI Ethics Literacy.</span>

<span testid="balanced-text" style="text-wrap:balance;">Over 20,000 subscribers</span>

<span class="button-text">Subscribe</span>

By subscribing you agree to <a href="https://brief.montrealethics.ai/tos?utm_source=embed_publication" class="tos-text" target="_blank" rel="noopener">Substack's Terms of Use</a>, <a href="https://brief.montrealethics.ai/privacy?utm_source=embed_publication" class="tos-text" target="_blank" rel="noopener">our Privacy Policy</a> and <a href="https://substack.com/ccpa?utm_source=embed_publication#personal-data-collected" class="tos-text" target="_blank" rel="noopener">our Information collection notice</a>

<a href="https://substack.com/?utm_source=embed&amp;utm_content=aiethics" target="_blank"><img src="https://substackcdn.com/image/fetch/$s_!R0u0!,w_200,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack.com%2Fimg%2Fsubstack_wordmark.black.png" class="substack-watermark" alt="Substack" /></a>

<style>
        #nojs-banner {
            position: fixed;
            bottom: 0;
            left: 0;
            padding: 16px 16px 16px 32px;
            width: 100%;
            box-sizing: border-box;
            background: red;
            color: white;
            font-family: -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            font-size: 13px;
            line-height: 13px;
        }
        #nojs-banner a {
            color: inherit;
            text-decoration: underline;
        }
    </style>

This site requires JavaScript to run correctly. Please <a href="https://enable-javascript.com/" target="_blank">turn on JavaScript</a> or unblock scripts

