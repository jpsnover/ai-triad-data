# AI Triad Research — Data Repository

This repository contains the research data for the [AI Triad Research](https://github.com/jpsnover/ai-triad-research) project. It is separated from the code repository to keep the tools lightweight and allow independent versioning of code and data.

## Structure

```
taxonomy/Origin/          Authoritative taxonomy JSON files, edges, embeddings
sources/                  Ingested source documents (PDFs, HTML, snapshots)
summaries/                AI-generated POV summaries
conflicts/                Auto-detected factual conflicts across sources
debates/                  Structured debate session recordings
.summarise-queue.json     Queue of documents pending summary generation
TAXONOMY_VERSION          Schema version (triggers re-summarization on bump)
```

## Setup

Clone this repo as a sibling to the code repo:

```bash
cd ~/source/repos
git clone https://github.com/jpsnover/ai-triad-data.git
git clone https://github.com/jpsnover/ai-triad-research.git
```

The code repo's `.aitriad.json` points to `../ai-triad-data` for all data paths.

## Requirements

- The code repo ([ai-triad-research](https://github.com/jpsnover/ai-triad-research)) contains the PowerShell module and Electron apps
- PowerShell 7.0+ for the CLI tools
- Node.js 18+ for the Taxonomy Editor
