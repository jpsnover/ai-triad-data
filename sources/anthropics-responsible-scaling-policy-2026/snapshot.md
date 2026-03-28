<!--
  AI Triad Research Project — Document Snapshot
  Title      : Anthropic's Responsible Scaling Policy
  Source     : https://www.anthropic.com/news/anthropics-responsible-scaling-policy
  Type       : web_article
  Captured   : 2026-02-24
  This file is a Markdown shadow copy for AI summarisation and POViewer display.
  The original file lives in raw/ for fidelity (charts, tables, exact layout).
-->

# Anthropic's Responsible Scaling Policy

> **Snapshot captured:** 2026-02-24
> **Source:** https://www.anthropic.com/news/anthropics-responsible-scaling-policy
> **Type:** web_article

---

Announcements

# Anthropic's Responsible Scaling Policy

Sep 19, 2023

<figure class="ImageWithCaption-module-scss-module__Duq99q__e-imageWithCaption">
<img src="/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F6276c7f8e14b693c66836810242243bd8dfd03ce-2880x1620.png&amp;w=3840&amp;q=75" style="color:transparent" loading="eager" decoding="async" data-nimg="1" srcset="/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F6276c7f8e14b693c66836810242243bd8dfd03ce-2880x1620.png&amp;w=3840&amp;q=75 1x" width="2880" height="1620" />
</figure>

Today, we’re publishing our [Responsible Scaling Policy (RSP)](https://anthropic.com/responsible-scaling-policy) – a series of technical and organizational protocols that we’re adopting to help us manage the risks of developing increasingly capable AI systems.  
  
As AI models become more capable, we believe that they will create major economic and social value, but will also present increasingly severe risks. Our RSP focuses on catastrophic risks – those where an AI model directly causes large scale devastation. Such risks can come from deliberate misuse of models (for example use by terrorists or state actors to create bioweapons) or from models that cause destruction by acting autonomously in ways contrary to the intent of their designers.  

<figure class="ImageWithCaption-module-scss-module__Duq99q__e-imageWithCaption">
<img src="/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fc9812176a54de4258c4969b24bf55dd4dfc1d928-5760x3240.png&amp;w=3840&amp;q=75" style="color:transparent" loading="eager" decoding="async" data-nimg="1" srcset="/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fc9812176a54de4258c4969b24bf55dd4dfc1d928-5760x3240.png&amp;w=3840&amp;q=75 1x" width="5760" height="3240" />
</figure>

  
Our RSP defines a framework called AI Safety Levels (ASL) for addressing catastrophic risks, modeled loosely after the US government’s biosafety level (BSL) standards for handling of dangerous biological materials. The basic idea is to require safety, security, and operational standards appropriate to a model’s potential for catastrophic risk, with higher ASL levels requiring increasingly strict demonstrations of safety.

A very abbreviated summary of the ASL system is as follows:  

- ASL-1 refers to systems which pose no meaningful catastrophic risk, for example a 2018 LLM or an AI system that only plays chess.
- ASL-2 refers to systems that show early signs of dangerous capabilities – for example ability to give instructions on how to build bioweapons – but where the information is not yet useful due to insufficient reliability or not providing information that e.g. a search engine couldn’t. Current LLMs, including Claude, appear to be ASL-2.
- ASL-3 refers to systems that substantially increase the risk of catastrophic misuse compared to non-AI baselines (e.g. search engines or textbooks) OR that show low-level autonomous capabilities.
- ASL-4 and higher (ASL-5+) is not yet defined as it is too far from present systems, but will likely involve qualitative escalations in catastrophic misuse potential and autonomy.

The definition, criteria, and safety measures for each ASL level are described in detail in the main document, but at a high level, ASL-2 measures represent our current safety and security standards and overlap significantly with our recent [White House commitments](https://bidenwhitehouse.archives.gov/briefing-room/statements-releases/2023/07/21/fact-sheet-biden-harris-administration-secures-voluntary-commitments-from-leading-artificial-intelligence-companies-to-manage-the-risks-posed-by-ai/). ASL-3 measures include stricter standards that will require intense research and engineering effort to comply with in time, such as unusually strong security requirements and a commitment not to deploy ASL-3 models if they show any meaningful catastrophic misuse risk under adversarial testing by world-class red-teamers (this is in contrast to merely a commitment to perform red-teaming). Our ASL-4 measures aren’t yet written (our commitment is to write them before we reach ASL-3), but may require methods of assurance that are unsolved research problems today, such as using interpretability methods to demonstrate mechanistically that a model is unlikely to engage in certain catastrophic behaviors.

We have designed the ASL system to strike a balance between effectively targeting catastrophic risk and incentivising beneficial applications and safety progress. On the one hand, the ASL system implicitly requires us to temporarily pause training of more powerful models if our AI scaling outstrips our ability to comply with the necessary safety procedures. But it does so in a way that directly incentivizes us to solve the necessary safety issues as a way to unlock further scaling, and allows us to use the most powerful models from the previous ASL level as a tool for developing safety features for the next level.<sup>1</sup> If adopted as a standard across frontier labs, we hope this might create a “race to the top” dynamic where competitive incentives are directly channeled into solving safety problems.  
  
From a business perspective, we want to be clear that our RSP will not alter current uses of Claude or disrupt availability of our products. Rather, it should be seen as analogous to the pre-market testing and safety feature design conducted in the automotive or aviation industry, where the goal is to rigorously demonstrate the safety of a product before it is released onto the market, which ultimately benefits customers.  
  
Anthropic’s RSP has been formally approved by its board and changes must be approved by the board following consultations with the [Long Term Benefit Trust](/news/the-long-term-benefit-trust). In the full document we describe a number of procedural safeguards to ensure the integrity of the evaluation process.  
  
However, we want to emphasize that these commitments are our current best guess, and an early iteration that we will build on. The fast pace and many uncertainties of AI as a field imply that, unlike the relatively stable BSL system, rapid iteration and course correction will almost certainly be necessary.  
  
The full document can be read [here](https://anthropic.com/responsible-scaling-policy). We hope that it provides useful inspiration to policymakers, third party nonprofit organizations, and other companies facing similar deployment decisions.

*We thank [ARC Evals](https://evals.alignment.org/) for their key insights and expertise supporting the development of our RSP commitments, particularly regarding evaluations for autonomous capabilities. We found their expertise in AI risk assessment to be instrumental as we designed our evaluation procedures. We also recognize ARC Evals' leadership in originating and spearheading the development of their broader ARC Responsible Scaling Policy framework, which inspired our approach.*

**Footnotes**

1.  As a general matter, Anthropic has consistently found that working with frontier AI models is an essential ingredient in developing new methods to mitigate the risk of AI.

<a href="https://twitter.com/intent/tweet?text=https://www.anthropic.com/news/anthropics-responsible-scaling-policy" target="_blank" rel="noopener" aria-label="Share on Twitter"><img src="data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iSWNvbi1tb2R1bGUtc2Nzcy1tb2R1bGVfX2xxYmRIR19faWNvbiIgd2lkdGg9IjMyIiBoZWlnaHQ9IjMyIiB2aWV3Ym94PSIwIDAgMzIgMzIiPjxwYXRoIGQ9Ik0yOCAyOEwxOC42MTQ1IDE0LjAxMjRMMTguNjMwNSAxNC4wMjU1TDI3LjA5MjkgNEgyNC4yNjVMMTcuMzcxMyAxMi4xNkwxMS44OTY4IDRINC40ODAyMUwxMy4yNDI1IDE3LjA1OTNMMTMuMjQxNCAxNy4wNTgyTDQgMjhINi44Mjc5MkwxNC40OTIxIDE4LjkyMTVMMjAuNTgzNCAyOEgyOFpNMTAuNzc2MyA2LjE4MTgyTDIzLjk0NDkgMjUuODE4MkgyMS43MDM5TDguNTI0NjggNi4xODE4MkgxMC43NzYzWiIgZmlsbD0iIzE5MTkxOSIgLz48L3N2Zz4=" class="Icon-module-scss-module__lqbdHG__icon" /></a><a href="https://www.linkedin.com/shareArticle?mini=true&amp;url=https://www.anthropic.com/news/anthropics-responsible-scaling-policy" target="_blank" rel="noopener" aria-label="Share on LinkedIn"><img src="data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iSWNvbi1tb2R1bGUtc2Nzcy1tb2R1bGVfX2xxYmRIR19faWNvbiIgd2lkdGg9IjMyIiBoZWlnaHQ9IjMyIiB2aWV3Ym94PSIwIDAgMzIgMzIiPjxwYXRoIGQ9Ik0yNS44MTgyIDRINi4xODE4MkM0Ljk3NjM2IDQgNCA0Ljk3NjM2IDQgNi4xODE4MlYyNS44MTgyQzQgMjcuMDIzNiA0Ljk3NjM2IDI4IDYuMTgxODIgMjhIMjUuODE4MkMyNy4wMjM2IDI4IDI4IDI3LjAyMzYgMjggMjUuODE4MlY2LjE4MTgyQzI4IDQuOTc2MzYgMjcuMDIzNiA0IDI1LjgxODIgNFpNMTEuNTg2MiAyMy42MzY0SDguMzY4VjEzLjI4MTVIMTEuNTg2MlYyMy42MzY0Wk05Ljk0NDM2IDExLjgwMTFDOC45MDY5MSAxMS44MDExIDguMDY4IDEwLjk2IDguMDY4IDkuOTI0NzNDOC4wNjggOC44ODk0NSA4LjkwOCA4LjA0OTQ1IDkuOTQ0MzYgOC4wNDk0NUMxMC45Nzg1IDguMDQ5NDUgMTEuODE5NiA4Ljg5MDU1IDExLjgxOTYgOS45MjQ3M0MxMS44MTk2IDEwLjk2IDEwLjk3ODUgMTEuODAxMSA5Ljk0NDM2IDExLjgwMTFaTTIzLjY0MDcgMjMuNjM2NEgyMC40MjQ3VjE4LjYwMDdDMjAuNDI0NyAxNy4zOTk2IDIwLjQwMjkgMTUuODU0OSAxOC43NTI0IDE1Ljg1NDlDMTcuMDc3OCAxNS44NTQ5IDE2LjgyMDQgMTcuMTYyOSAxNi44MjA0IDE4LjUxMzVWMjMuNjM2NEgxMy42MDQ0VjEzLjI4MTVIMTYuNjkxNlYxNC42OTY0SDE2LjczNTNDMTcuMTY1MSAxMy44ODI1IDE4LjIxNDUgMTMuMDI0IDE5Ljc4IDEzLjAyNEMyMy4wMzg1IDEzLjAyNCAyMy42NDA3IDE1LjE2ODcgMjMuNjQwNyAxNy45NTcxVjIzLjYzNjRaIiBmaWxsPSIjMTQxNDEzIiAvPjwvc3ZnPg==" class="Icon-module-scss-module__lqbdHG__icon" /></a>

## Related content

### Detecting and preventing distillation attacks

<a href="/news/detecting-and-preventing-distillation-attacks" class="ButtonTextLink-module-scss-module__q8IAwW__textLink LinkGrid-module-scss-module__wTN57W__cta" referrerpolicy="no-referrer-when-downgrade"><span class="body-3">Read more</span><span class="ButtonTextLink-module-scss-module__q8IAwW__icon"><img src="data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iSWNvbi1tb2R1bGUtc2Nzcy1tb2R1bGVfX2xxYmRIR19faWNvbiIgd2lkdGg9IjIwIiBoZWlnaHQ9IjIwIiB2aWV3Ym94PSIwIDAgMjEgMjEiPjxwYXRoIGQ9Ik00LjE0NTg1IDkuODc0OTJMMTQuNDU4NCA5Ljg3NDkyTDkuNjA0MTkgNS4wNDE1OEwxMC41IDQuMTQ1NzVMMTYuODU0MiAxMC40OTk5TDEwLjUgMTYuODU0MUw5LjYwNDE5IDE1Ljk1ODNMMTQuNDU4NCAxMS4xMjQ5TDQuMTQ1ODUgMTEuMTI0OUw0LjE0NTg1IDkuODc0OTJaIiBmaWxsPSJjdXJyZW50Q29sb3IiIC8+PC9zdmc+" class="Icon-module-scss-module__lqbdHG__icon" /></span></a>

### Making frontier cybersecurity capabilities available to defenders

Claude Code Security, a new capability built into Claude Code on the web, is now available in a limited research preview. It scans codebases for security vulnerabilities and suggests targeted software patches for human review, allowing teams to find and fix security issues that traditional methods often miss.

<a href="/news/claude-code-security" class="ButtonTextLink-module-scss-module__q8IAwW__textLink LinkGrid-module-scss-module__wTN57W__cta" referrerpolicy="no-referrer-when-downgrade"><span class="body-3">Read more</span><span class="ButtonTextLink-module-scss-module__q8IAwW__icon"><img src="data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iSWNvbi1tb2R1bGUtc2Nzcy1tb2R1bGVfX2xxYmRIR19faWNvbiIgd2lkdGg9IjIwIiBoZWlnaHQ9IjIwIiB2aWV3Ym94PSIwIDAgMjEgMjEiPjxwYXRoIGQ9Ik00LjE0NTg1IDkuODc0OTJMMTQuNDU4NCA5Ljg3NDkyTDkuNjA0MTkgNS4wNDE1OEwxMC41IDQuMTQ1NzVMMTYuODU0MiAxMC40OTk5TDEwLjUgMTYuODU0MUw5LjYwNDE5IDE1Ljk1ODNMMTQuNDU4NCAxMS4xMjQ5TDQuMTQ1ODUgMTEuMTI0OUw0LjE0NTg1IDkuODc0OTJaIiBmaWxsPSJjdXJyZW50Q29sb3IiIC8+PC9zdmc+" class="Icon-module-scss-module__lqbdHG__icon" /></span></a>

### Anthropic and the Government of Rwanda sign MOU for AI in health and education

<a href="/news/anthropic-rwanda-mou" class="ButtonTextLink-module-scss-module__q8IAwW__textLink LinkGrid-module-scss-module__wTN57W__cta" referrerpolicy="no-referrer-when-downgrade"><span class="body-3">Read more</span><span class="ButtonTextLink-module-scss-module__q8IAwW__icon"><img src="data:image/svg+xml;base64,PHN2ZyBjbGFzcz0iSWNvbi1tb2R1bGUtc2Nzcy1tb2R1bGVfX2xxYmRIR19faWNvbiIgd2lkdGg9IjIwIiBoZWlnaHQ9IjIwIiB2aWV3Ym94PSIwIDAgMjEgMjEiPjxwYXRoIGQ9Ik00LjE0NTg1IDkuODc0OTJMMTQuNDU4NCA5Ljg3NDkyTDkuNjA0MTkgNS4wNDE1OEwxMC41IDQuMTQ1NzVMMTYuODU0MiAxMC40OTk5TDEwLjUgMTYuODU0MUw5LjYwNDE5IDE1Ljk1ODNMMTQuNDU4NCAxMS4xMjQ5TDQuMTQ1ODUgMTEuMTI0OUw0LjE0NTg1IDkuODc0OTJaIiBmaWxsPSJjdXJyZW50Q29sb3IiIC8+PC9zdmc+" class="Icon-module-scss-module__lqbdHG__icon" /></span></a>

