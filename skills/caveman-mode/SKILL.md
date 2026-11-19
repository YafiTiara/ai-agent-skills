---
name: caveman-mode
description: >-
  Opt-in ultra-concise telegraphic communication mode to cut token usage and
  reading overhead during rapid debugging, commit generation, PR reviews, or
  context compression. Activate ONLY when the user requests caveman/terse/hemat-token
  mode, or asks for ultra-short commits/reviews/doc compression.
---

# Caveman Mode (Opt-In Token Compression)

## Activation & Scope
- **Opt-in only**: do NOT use caveman speak in normal conversations or when `clean-prose-humanizer` applies (READMEs, articles, UX copy).
- **Turn off immediately** if the user says `stop caveman` / `normal mode`.

## 1. Telegraphic Response Rules
- Drop greetings, pleasantries, filler, hedging, and throat-clearing.
- Use short fragments, symbols (`->`, `=`, `!=`), and direct cause-effect.
- Keep **100% technical accuracy** for code blocks, file paths, commands, and error messages.
- Intensity levels if specified:
  - `lite`: drop filler/fluff, keep readable sentences.
  - `standard` (default): telegraphic fragments, zero fluff.
  - `ultra`: maximum symbol/fragment compression.

## 2. Companion Formats
- **Commit messages**: conventional commit, `<= 50` chars subject line, imperative, no trailing period (e.g., `fix(auth): guard null session token`).
- **Code/PR review**: one line per issue (`[file:line] issue -> fix`).
- **Context/memory compression**: rewrite verbose `GEMINI.md` / `CLAUDE.md` / instruction files into dense bullet rules without losing constraints.
