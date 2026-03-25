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

Unsolved Problems in ML Safety | Montreal AI Ethics Institute
    
    

    
    
            

        

            
            

    
    

- Skip to main content
- Skip to secondary menu
- Skip to primary sidebar
- Skip to footer

🔬 Research Summary by **Dan Hendrycks, **received his PhD from UC Berkeley where he was advised by Dawn Song and Jacob Steinhardt. He is now the director of the [Center for AI Safety](https://safe.ai/).

[[Original paper](https://arxiv.org/abs/2109.13916) by Dan Hendrycks, Nicholas Carlini, John Schulman, and Jacob Steinhardt]

---

**Overview**: As ML systems become more capable and integrated into society, the safety of such systems becomes increasingly important. This paper presents four broad areas in ML Safety: Robustness, Monitoring, Alignment, and Systemic Safety. We explore each area’s motivations and provide concrete research directions.

---

## Introduction

Over five months, the Boeing 737 MAX crashed twice, killing 346 people. It was later determined that Boeing had made unsafe design choices and pressured inspectors to bring the plane to market more quickly.

Often, it takes a disaster like this for people to pay attention to safety concerns. As AI systems are rapidly improved and applied to new domains, failures will only become more consequential. It is, therefore, important for the ML research community to proactively design systems with safety in mind. As the adage goes, “An ounce of prevention is worth a pound of cure.”

How can we reduce the probability of high-consequence failures of AI systems? Our goal in writing “Concrete Problems in ML Safety” is to draw attention to this question and list some research directions that address it. We would love to see the [ML Safety community](https://www.mlsafety.org/) grow and hope that our paper can help guide this area of research and document its motivations.

## Key Insights

We describe four research problems:

1. Robustness: how can we make systems reliable in the face of adversaries and highly unusual situations?

1. Monitoring: how can we detect anomalies, malicious uses, and discover unintended model functionality?

1. Alignment: how can we build models that represent and safely optimize difficult-to-specify human values?

1. Systemic Safety: how can we use ML to address broader risks related to how ML systems are handled? Examples include ML for cyber security and improving policy decision-making.

This work is not the first to consider any of these areas. To view related literature, please refer to the [original paper](https://arxiv.org/abs/2109.13916).

### Robustness

**Motivation**

Current machine learning systems are not robust enough to handle real-world complexity and long-tail events. For example, failing to recognize a tilted stop sign, occluded, or represented on a LED matrix could cause loss of life.

Additionally, adversaries can easily manipulate vulnerabilities in ML systems and cause them to make mistakes. For example, adversaries may bypass the neural networks used to detect intruders or malware.  

**Some example directions**

- Create robustness benchmarks that incorporate large distribution shifts and long tail events.

- Prevent competent errors where agents wrongly generalize and execute wrong routines.

- Improve system abilities to adapt and learn from novel scenarios. 

- Explore defenses to adversarial attacks with an unknown specification (beyond the typical ‘lp ball’ setting).

- Develop adversarial defenses that can adapt at test time. 

### Monitoring

**Motivation**

When AI systems are deployed in high-stakes settings, it will be important for human operators to be alerted when there is an anomaly, an attack, or if the model is uncertain so that they can intervene. Also, capabilities have been known to emerge unexpectedly in AI systems. Human operators should understand how models function and what actions they can take to avoid unwanted surprises.

**Some example directions**

- Improve model calibration (the appropriateness of output probabilities) and extend expressions of uncertainty to natural language.

- Train models to more accurately report the knowledge available to them.

- Detect when data has been poisoned, or back doors have been inserted into models.

- Develop a testbed to screen for potentially hazardous capabilities, such as the ability to execute malicious user-supplied code, generate illegal or unethical forms of content, etc.

### Alignment

**Motivation**

While most technologies do not have goals and are simply tools, future machine learning systems may act to optimize objectives. Aligning objective functions with human values requires overcoming societal and technical challenges.

**Some example directions**

- Align specific technologies, such as recommender systems, with well-being rather than engagement.

- Detect when ethical decisions are clear-cut or contentious.

- Train models to learn difficult-to-specify goals in interactive environments.

- Improve the robustness of reward models.

- Design minimally invasive agents that prefer easily reversible to irreversible actions.

- Teach ML systems to abide by rules and constraints specified in natural language.

- Mitigate and detect unintended instrumental goals such as self-preservation or power-seeking.

- Have agents balance and optimize many values since there is no agreement about the best set.

### Systemic Safety

ML systems are more likely to fail or be misdirected if the larger context in which they operate is insecure or turbulent. One research direction that can help combat this is **ML for cyber security**. There may be strong incentives for attackers to steal ML models, which could be used in dangerous ways or inherently dangerous and not fit for proliferation. ML could be used to develop better defensive systems that reduce the risk of attacks.

Another research direction in this category is **ML for informed decision-making**. Even if ML systems are safe in and of themselves, they must still be *used *safely. During the cold war, misunderstanding and political turbulence exposed humanity to several close calls and brought us to the brink of catastrophe, demonstrating that systemic issues can make technologies unsafe. Using ML to help institutions make more informed decisions may help to combat these risks.

## Between the lines

Ultimately, our goal as researchers should not just be to produce interesting work but to help steer the world in a better direction. We hope to highlight some safety problems that may be under-emphasized. This list was far from comprehensive, and we would be enthusiastic about further research into reducing high-consequence risks that may arise in the future.

## Footer
            
---

[Articles](https://montrealethics.ai/blog/)

[Columns](https://montrealethics.ai/category/insights/ai-policy-corner/)

[AI Literacy](https://montrealethics.ai/dictionary/)

[The State of AI Ethics Report](https://montrealethics.ai/state/)

---

 

        
https://www.linkedin.com/company/mtlaiethics/https://twitter.com/mtlaiethicshttps://montrealethics.ai/feed/

### About Us

            
---

Founded in 2018, the Montreal AI Ethics Institute (MAIEI) is an international non-profit organization equipping citizens concerned about artificial intelligence and its impact on society to **take action.**

[Contact](https://montrealethics.ai/contact/)

[Donate](https://montrealethics.ai/donate/)

---

        

https://www.addtoany.com/add_to/twitter?linkurl=https%3A%2F%2Fmontrealethics.ai%2Funsolved-problems-in-ml-safety%2F&linkname=Unsolved%20Problems%20in%20ML%20Safety%20%7C%20Montreal%20AI%20Ethics%20Institutehttps://www.addtoany.com/add_to/linkedin?linkurl=https%3A%2F%2Fmontrealethics.ai%2Funsolved-problems-in-ml-safety%2F&linkname=Unsolved%20Problems%20in%20ML%20Safety%20%7C%20Montreal%20AI%20Ethics%20Institutehttps://www.addtoany.com/share

    

                
                
        
                
            
Save hours of work and stay on top of Responsible AI research and reporting with our bi-weekly email newsletter.
