#!/usr/bin/env node
// Copyright (c) 2026 Jeffrey Snover. All rights reserved.
// Licensed under the MIT License. See LICENSE file in the project root.

// Pure diff half of pov-tags-check (t/3970): which nodes' `pov_tags` changed vs HEAD, plus
// newly-added nodes that carry the field. Changed-only (t/3970#1 point 2) -- an existing bad
// node must not block an unrelated commit once this is promoted to blocking.
//
// Usage: node pov-tags-diff.mjs <base1.json> <cand1.json> [<base2.json> <cand2.json> ...]
// One (baseline, candidate) pair per watched taxonomy file; a missing/empty baseline file
// (first commit, or the hook writes an empty placeholder) means "no prior nodes".
// Prints one JSON array (merged across all pairs) of { id, pov_tags } to stdout.
// Throws (non-zero exit, message on stderr) on unparseable JSON or an unexpected shape --
// the caller treats that as COULD NOT VERIFY, never a pass.

import { readFileSync } from 'node:fs';

function nodesOf(raw) {
  const trimmed = raw.trim();
  if (trimmed === '') return [];
  let doc;
  try {
    doc = JSON.parse(trimmed);
  } catch (err) {
    throw new Error(`unparseable JSON: ${err.message}`);
  }
  if (Array.isArray(doc)) return doc;
  if (doc && typeof doc === 'object' && Array.isArray(doc.nodes)) return doc.nodes;
  throw new Error('expected {nodes: [...]} or a top-level array');
}

function changedTaggedNodes(baselineRaw, candidateRaw) {
  const baseById = new Map();
  for (const n of nodesOf(baselineRaw)) {
    if (n && typeof n.id === 'string') baseById.set(n.id, n);
  }
  const changed = [];
  for (const n of nodesOf(candidateRaw)) {
    if (!n || typeof n.id !== 'string') continue;
    if (!Object.prototype.hasOwnProperty.call(n, 'pov_tags')) continue; // nothing to validate
    const prev = baseById.get(n.id);
    const prevTags = prev ? prev.pov_tags : undefined;
    const isNew = !prev;
    const tagsChanged = JSON.stringify(prevTags) !== JSON.stringify(n.pov_tags);
    if (isNew || tagsChanged) changed.push({ id: n.id, pov_tags: n.pov_tags });
  }
  return changed;
}

const args = process.argv.slice(2);
if (args.length === 0 || args.length % 2 !== 0) {
  process.stderr.write('usage: pov-tags-diff.mjs <base.json> <cand.json> [...]\n');
  process.exit(2);
}

try {
  const all = [];
  for (let i = 0; i < args.length; i += 2) {
    const baseRaw = readFileSync(args[i], 'utf8');
    const candRaw = readFileSync(args[i + 1], 'utf8');
    all.push(...changedTaggedNodes(baseRaw, candRaw));
  }
  process.stdout.write(JSON.stringify(all));
} catch (err) {
  process.stderr.write(`pov-tags-diff: ${err.message}\n`);
  process.exit(1);
}
