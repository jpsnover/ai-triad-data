# Taxonomy Vocabulary Dictionary

Controlled vocabulary for the AI Triad taxonomy. Resolves cross-camp semantic ambiguity by replacing bare colloquial terms (e.g., "alignment", "safety", "fairness") with standardized canonical forms that make the intended sense explicit.

## Why This Exists

AI policy discourse uses a small set of high-stakes terms — alignment, safety, risk, fairness, accountability — that mean different things depending on the speaker's camp. When an accelerationist says "safety," they typically mean empirical output verification. When a safetyist says "safety," they mean existential risk prevention. Using the bare term in cross-camp analysis silently takes sides.

This dictionary forces the ambiguity into the open. Every colloquial term maps to 2-3 standardized senses, each with characteristic phrases that distinguish it. The translation pipeline disambiguates automatically where possible and flags genuine ambiguity rather than hiding it.

## Structure

```
dictionary/
  schema/
    standardized_term.schema.json   # JSON Schema for standardized terms
    colloquial_term.schema.json     # JSON Schema for colloquial terms
    version.json                    # Current schema version (1.0.0)
  standardized/
    safety_alignment.json           # One file per standardized term
    commercial_alignment.json
    ...
  colloquial/
    alignment.json                  # One file per colloquial term family
    safety.json
    ...
  sense_embeddings.json             # Pre-computed 384-dim embeddings (all-MiniLM-L6-v2)
  coinage_log.md                    # Append-only audit log of coining decisions
  review_queue.json                 # Output of detect_term_ambiguity.py
  validation_set.json               # Hand-labeled occurrences for calibration
```

## Schema Version

Current: **1.0.0** (see `schema/version.json`)

The dictionary loader validates schema versions at load time. A mismatch produces a clear error with migration instructions.

## Standardized Terms

Each standardized term has a canonical form (used internally, e.g., `safety_alignment`) and a display form (shown to readers, e.g., "alignment (safety)"). A standardized term entry includes:

| Field | Purpose |
|-------|---------|
| `canonical_form` | Machine identifier, used in all internal representations |
| `display_form` | Human-readable label for output rendering |
| `definition` | Precise definition of this specific sense |
| `primary_camp_origin` | Which camp coined or primarily uses this sense |
| `characteristic_phrases` | Phrases that signal this sense in context |
| `translates_from_colloquial` | Which bare terms this sense disambiguates |
| `see_also` | Related standardized terms |
| `do_not_confuse_with` | Commonly confused terms with explanations |
| `contested_aspects` | What camps disagree about regarding this term |
| `coinage_status` | `accepted`, `provisional`, `contested`, or `deprecated` |
| `used_by_nodes` | Taxonomy node IDs that use this term |
| `coinage_log_ref` | Pointer to the coinage log entry |

## Colloquial Terms

Each colloquial term file maps a bare term to its possible standardized senses:

| Field | Purpose |
|-------|---------|
| `colloquial_term` | The bare term (e.g., "alignment") |
| `status` | `do_not_use_bare` or `use_with_care` |
| `resolves_to` | Array of possible standardized terms with conditions |
| `translation_ambiguous_when` | Conditions where disambiguation fails |

Each resolution entry includes `when` (disambiguation condition), `default_for_camp` (which camp typically means this sense), and `confidence_typical` (how reliably context disambiguates).

## Translation Pipeline

The translation pipeline converts documents from bare colloquial terms to standardized canonical forms. It runs in five stages:

### Stage 1: Locate Occurrences
Scans input text for bare colloquial terms. Skips terms inside quotation markers, code blocks, and inline code. Sorts terms longest-first to prevent substring conflicts.

### Stage 2: Local Ensemble Resolution
For each occurrence, computes a combined score from:
- **Embedding similarity** (weight `w_e`, default 0.85): cosine similarity between the occurrence's context embedding and each candidate sense's pre-computed embedding
- **Phrase signal** (weight `w_p`, default 0.15): fuzzy match of surrounding context against each sense's characteristic phrases, using token-sort-ratio

If the top score exceeds `top_score_threshold` (default 0.55) AND the margin between top and runner-up exceeds `margin_threshold` (default 0.10), the pipeline commits to the local resolution. Otherwise, routes to Stage 3.

### Stage 3: LLM Fallback
Constructs a disambiguation prompt with the occurrence context and top-k candidate senses. An LLM selects the best sense and provides a rationale. This stage can be disabled for batch runs where cost is a concern — unresolved occurrences are marked `confidence: ambiguous`.

### Stage 4: Node Mapping
Maps resolved terms to taxonomy nodes using the `used_by_nodes` field.

### Stage 5: Output
Produces a `TranslationResult` with per-occurrence records including confidence level, method used, all candidate scores, and rationale.

### Translation Confidence Levels
- **high**: Local ensemble resolved with strong margin (top_score >= 0.55, margin >= 0.10)
- **medium**: LLM fallback selected a sense
- **ambiguous**: Neither local nor LLM could confidently disambiguate

## Rendering and Quotation

### Display-Form Rendering (Section 4.8 of spec)
Canonical forms are used internally; display forms appear in all user-facing output. The renderer replaces canonical forms with their display forms while tracking context to avoid mangling coincidental string matches in code samples, URLs, or user content.

### Quotation Bypass (Section 4.9 of spec)
When an author deliberately uses a bare colloquial term (e.g., quoting a source), the quotation marker `<q canonical-bypass>term</q>` preserves the original form. Lint constraint C10 validates that quotation markers are well-formed. The rendering pass respects these markers and does not substitute display forms within them.

## Calibration

The translation pipeline is calibrated against a hand-labeled validation set (`validation_set.json`) using five dimensions:

1. **Per-term precision and recall** — flags terms below P<0.85 or R<0.70
2. **Per-camp confusion matrix** — catches systematic cross-camp misresolution
3. **Ambiguity rate** — target band 5-15%; below suggests false confidence, above suggests weak phrases
4. **Fallback accuracy** — spot-check of LLM-assisted translations
5. **Downstream impact** — side-by-side comparison of pre/post-vocabulary document analysis

Run calibration: `python scripts/calibrate_translation.py`

## Coinage Process

New terms are coined through a structured review process:

1. **Detection**: `detect_term_ambiguity.py` scans the taxonomy for terms used across 2+ camps with high Shannon entropy and embedding spread
2. **Review**: Candidates in `review_queue.json` are evaluated for analytically meaningful variation
3. **Coining**: Accepted terms get a standardized entry, colloquial mapping, and coinage log entry
4. **Embedding**: `build_sense_embeddings.py` computes embeddings for the new term
5. **Calibration**: Pipeline is re-calibrated against the validation set

### Quarterly Detection Cadence
Detection scripts should be re-run each quarter (or on each taxonomy version bump) to identify new ambiguities introduced by taxonomy growth. The review queue accumulates candidates; most will be dismissed. Only terms with genuine cross-camp semantic divergence should be coined.

## Scripts

| Script | Purpose |
|--------|---------|
| `scripts/detect_term_ambiguity.py` | Scan taxonomy for cross-camp ambiguous terms |
| `scripts/coin_initial_vocabulary.py` | Phase 2: initial 21 standardized terms |
| `scripts/coin_second_batch.py` | Phase 4: additional 11 terms (autonomy, accountability, bias, fairness) |
| `scripts/build_sense_embeddings.py` | Compute/update sense embeddings |
| `scripts/calibrate_translation.py` | Five-dimensional pipeline calibration |
| `scripts/audit_debate_quality.py` | Compare pre/post-vocabulary debate quality |

## Current Vocabulary

**32 standardized terms** across **14 colloquial families**:

| Family | Senses | Primary Camps |
|--------|--------|---------------|
| alignment | safety, commercial, compliance | saf, acc, skp |
| safety | existential, empirical | saf, acc |
| governance | oversight, adaptive | saf, acc |
| risk | existential, innovation | saf, acc |
| capabilities | scaling, hazard | acc, saf |
| harm | documented present, speculative future | skp, saf |
| oversight | human control, audit | saf, acc |
| control | human agency, optimization | saf, acc |
| transparency | accountability, verification | saf, acc |
| regulation | precautionary, adaptive | saf, acc |
| autonomy | machine, human, individual | acc, saf, skp |
| accountability | market, institutional, algorithmic | acc, saf, skp |
| bias | technical, systemic | acc, skp |
| fairness | individual, group, procedural | acc, saf, skp |

## Limitations

- The dictionary reflects the project's three-camp taxonomy (accelerationist, safetyist, skeptic). Terms used outside these camps may not be captured.
- Embedding-based resolution depends on context quality — very short snippets may lack sufficient signal.
- The LLM fallback introduces a dependency on an external API and may produce inconsistent results across different models.
- The validation set is small (100 occurrences) and hand-labeled by a single reviewer. Calibration results should be interpreted with appropriate uncertainty.
- Colloquial terms that appear in compound phrases (e.g., "AI safety alignment") may trigger multiple overlapping matches.

## License

Part of the AI Triad Research project. See LICENSE in the code repository root.
