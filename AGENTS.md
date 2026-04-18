# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is the **data repository** for the AI Triad Research project. It contains no executable code — only structured JSON data and markdown snapshots. The companion code repository lives at `../ai-triad-research` and contains the PowerShell module and Electron apps that read/write this data.

## Data Architecture

The project models AI discourse through three POV camps — **accelerationist**, **safetyist**, and **skeptic** — plus a **cross-cutting** category for concerns that span camps.

### Taxonomy (`taxonomy/Origin/`)

The knowledge graph backbone. One JSON file per POV camp (`accelerationist.json`, `safetyist.json`, `skeptic.json`, `cross-cutting.json`) to minimize merge conflicts. Each contains a `nodes` array where every node has an `id`, `category`, `label`, `description`, and rich `graph_attributes` (epistemic type, rhetorical strategy, fallacies, policy actions, etc.).

- `edges.json` — Typed relationships between nodes (SUPPORTS, CONTRADICTS, ASSUMES, WEAKENS, TENSION_WITH, CITES, etc.)
- `embeddings.json` — Precomputed vectors (all-MiniLM-L6-v2, 384-dim) for taxonomy nodes and canonical policy actions
- `policy_actions.json` — Canonical policy action registry with unique IDs (`pol-NNN`). Nodes reference policies by `policy_id` with POV-specific `framing`. Policies can be shared across nodes and POVs.

All taxonomy files carry `_schema_version` which must match `TAXONOMY_VERSION` (root). Bumping `TAXONOMY_VERSION` triggers re-summarization of all sources.

### Sources (`sources/<slug>/`)

Ingested documents. Each source directory contains:
- `metadata.json` — ID, title, URL, authors, dates, POV tags, topic tags, summary status
- `snapshot.md` — Captured content (from PDF, web, video transcript)
- `raw/` — Original files when available

### Summaries (`summaries/<slug>.json`)

AI-generated POV-aligned summaries. Each summary maps taxonomy node IDs to key points extracted from a source, grouped by POV camp. Includes `factual_claims` with conflict detection.

### Conflicts (`conflicts/conflict-<truncated-claim>-<source>.json`)

Auto-detected factual tensions across sources. Each has a `claim_id`, `status` (open/resolved), `linked_taxonomy_nodes`, and `instances` array showing which documents support or contradict the claim. `human_notes` array for manual adjudication.

### Debates (`debates/debate-<uuid>.json`)

Structured debate sessions with transcripts. POV characters ("prometheus" = accelerationist, "sentinel" = safetyist, "cassandra" = skeptic) argue positions grounded in taxonomy nodes and source evidence.

### Queue (`.summarise-queue.json`)

Array of source slugs pending summary generation. Consumed by the code repo's summarization pipeline.

## Key Conventions

- **IDs follow a prefix pattern**: `acc-*` (accelerationist), `saf-*` (safetyist), `skp-*` (skeptic), `cc-*` (cross-cutting), `pol-*` (policy actions)
- **Source slugs** are kebab-cased, derived from title, suffixed with year (e.g., `concrete-problems-ai-safety-2026`)
- **Conflict IDs** are `conflict-<truncated-claim>-<truncated-source>`
- **JSON is the canonical format** for all structured data; markdown only for source snapshots
- When editing taxonomy nodes, open a PR and bump `TAXONOMY_VERSION` in the merge commit
