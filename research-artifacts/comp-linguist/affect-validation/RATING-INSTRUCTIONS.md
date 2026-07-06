# Affect Rating Instructions (t/1342)

You are rating 108 debate statements, one per row in `affect-rating-sheet.csv`. Each statement was made by a debater in a structured AI-policy debate. Rate the statement itself, not whether you agree with it.

## The six ratings, each 0 / 1 / 2

For each of the five affect dimensions, ask: does this statement carry this emotional register?

- **0** — absent. A neutral reader would not perceive it.
- **1** — present. Clearly there, but not the statement's dominant character.
- **2** — dominant. The statement's emotional center of gravity.

| Column | What to look for |
|---|---|
| `urgency_0_2` | Time pressure, now-or-never framing, calls for immediate action |
| `fear_0_2` | Threat, danger, catastrophe, loss framing |
| `hope_0_2` | Opportunity, optimism, better-future framing |
| `outrage_0_2` | Indignation, blame, violation of norms, "this is unacceptable" |
| `empathy_0_2` | Concern for affected people/groups, perspective-taking, acknowledgment of others' stakes |

The sixth rating is different:

- **`distorts_reasoning_0_2`** — does the emotional register *pressure* the reader's reasoning rather than inform it? 0 = the emotion (if any) is proportionate and evidence-linked; 1 = the emotion does some argumentative work the evidence doesn't; 2 = the emotion is doing most of the work.

## Ground rules

- Rate every dimension for every statement, even when the answer is 0. Blanks are treated as missing data, not zeros.
- Multiple dimensions can be 2 in the same statement. They are not mutually exclusive.
- Judge from the text alone. You are not told which debater persona said it or in which debate phase — that blinding is deliberate.
- Do not look up the statements in the debate viewer while rating.
- Use `notes` only when a statement is unratable (garbled, cut off) or when you want to flag something odd.
- Expect the pass to take 30–45 minutes. Rating drift is real — if you take a break, note the row where you stopped.

## What happens with the ratings

Per-dimension agreement between your ratings and the lexicon scorer will be computed with ICC(2,1) and Krippendorff's alpha. Pre-registered decision rule: alpha >= 0.6 keeps the dimension; 0.4–0.6 demotes it to experimental; below 0.4 retires it from affect intensity until its lexicon is revised. Your `distorts_reasoning` ratings will be regressed against the five dimension scores to replace the currently stipulated distortion weights with derived ones, or drop the weighting if nothing separates.
