# Taxonomy Vocabulary Dictionary

Controlled vocabulary for the AI Triad taxonomy. See `docs/taxonomy-vocabulary-system-spec.md` in the code repo for the full specification.

## Structure

- `schema/` — JSON Schema definitions and version tracking
- `standardized/` — One JSON file per standardized term (canonical form as filename)
- `colloquial/` — One JSON file per colloquial term (bare term as filename)
- `sense_embeddings.json` — Pre-computed embeddings for translation pipeline
- `coinage_log.md` — Append-only audit log of coining decisions

## Schema Version

Current: **1.0.0** (see `schema/version.json`)

The dictionary loader validates schema versions at load time. A mismatch produces a clear error with migration instructions.
