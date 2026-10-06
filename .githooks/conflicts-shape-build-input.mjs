#!/usr/bin/env node
// Copyright (c) 2026 Jeffrey Snover. All rights reserved.
// Licensed under the MIT License. See LICENSE file in the project root.

// Build-input helper for conflicts-shape-check (t/3953). Reads each staged conflict file's
// content from a temp file and wraps it as { path, content } for conflict-shape-cli.ts. Mirrors
// pov-tags-diff.mjs's role (a small impure-adjacent helper the bash orchestrator shells out to,
// rather than hand-rolling JSON construction in bash).
//
// Usage: node conflicts-shape-build-input.mjs <path1> <contentFile1> [<path2> <contentFile2> ...]
// Prints a JSON array of { path, content } to stdout. A content file that is empty/whitespace
// decodes as `content: null` (conflictFileSchema will reject null, which is correct -- an empty
// staged file is a shape problem, not something to silently skip). Throws (stderr + exit 1) on
// unparseable JSON, which the caller treats as COULD NOT VERIFY, never a pass.

import { readFileSync } from 'node:fs';

const args = process.argv.slice(2);
if (args.length === 0 || args.length % 2 !== 0) {
  process.stderr.write('usage: conflicts-shape-build-input.mjs <path> <contentFile> [...]\n');
  process.exit(2);
}

try {
  const entries = [];
  for (let i = 0; i < args.length; i += 2) {
    const path = args[i];
    const raw = readFileSync(args[i + 1], 'utf8');
    const trimmed = raw.trim();
    let content;
    try {
      content = trimmed === '' ? null : JSON.parse(trimmed);
    } catch (err) {
      throw new Error(`${path}: unparseable JSON: ${err.message}`);
    }
    entries.push({ path, content });
  }
  process.stdout.write(JSON.stringify(entries));
} catch (err) {
  process.stderr.write(`conflicts-shape-build-input: ${err.message}\n`);
  process.exit(1);
}
