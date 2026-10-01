#!/usr/bin/env node
// t/3790 pilot resume — debates p06-p10 (p01-p05 already completed)
// model: gemini-3.5-flash-lite | protocol: structured | pacing: moderate | audience: policymakers | 3 POVs
// Run from any terminal: node <this-file>

import { execSync } from 'child_process';
import { writeFileSync } from 'fs';
import { join } from 'path';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const repoRoot = 'C:/Users/jsnov/repos/ai-triad-research';
const outputDir = 'C:/Users/jsnov/repos/ai-triad-data/debates/t3790-pilot';

const TOPICS = [
  'The risks and benefits of releasing powerful AI model weights publicly',
  'AI systems in high-stakes decisions: healthcare triage and criminal justice',
  'Alignment research priorities: interpretability versus capability scaling',
  'Economic displacement from AI automation: labor policy responses',
  'Autonomous weapons systems and the future of warfare under international law',
];

const BASE_CONFIG = {
  model: 'gemini-3.5-flash-lite',
  protocolId: 'structured',
  pacing: 'moderate',
  audience: 'policymakers',
  activePovers: ['accelerationist', 'safetyist', 'skeptic'],
  outputDir,
};

for (let i = 0; i < TOPICS.length; i++) {
  const debateNum = i + 6; // resume from debate 6
  const topic = TOPICS[i];
  const slug = `t3790p${String(debateNum).padStart(2, '0')}`;
  const config = { ...BASE_CONFIG, topic, slug };
  const configPath = join(__dirname, `pilot-config-${debateNum}.json`);
  writeFileSync(configPath, JSON.stringify(config, null, 2));

  console.log(`\n=== Debate ${debateNum}/10: ${topic} ===`);
  try {
    execSync(
      `npx tsx lib/debate/cli.ts --config "${configPath}"`,
      { cwd: repoRoot, stdio: 'inherit' }
    );
    console.log(`Debate ${debateNum} complete.`);
  } catch (err) {
    console.error(`Debate ${debateNum} FAILED: ${err.message}`);
    process.exit(1);
  }
}

console.log(`\nResume complete. All 10 pilot debates now at: ${outputDir}`);
