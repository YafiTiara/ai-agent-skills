---
name: surgical-dev-workflow
description: >-
  Disciplined software engineering workflow combining Karpathy surgical coding,
  Grilling (clarify requirements one question at a time), Ponytail (prefer native/minimal
  solutions before over-engineering), and Teach (explain architecture concisely).
  Use automatically whenever building new features, refactoring, or debugging code.
---

# Surgical Dev Workflow

## 1. Clarify Before Coding (Grilling)
- If requirements are ambiguous or have major design trade-offs, ask concise, targeted questions one at a time (or via `ask_question`) until the plan is clear.
- State key assumptions explicitly before writing code.

## 2. Prefer Native & Minimal Solutions (Ponytail)
- Check whether the platform, HTML/CSS, standard library, or existing repo helpers already solve the problem before writing custom abstractions or adding dependencies.
- Example: prefer native `<input type="date" />`, CSS Grid/Flexbox, or existing repo utilities over 200-line custom reimplementations.

## 3. Surgical Execution (Karpathy Guidelines)
- **Simplicity first**: write the minimum clean code that solves the exact problem; avoid speculative flexibility, single-use wrappers, and dead code.
- **Surgical changes**: touch only the lines/files required by the task. Preserve unrelated comments, docstrings, and formatting.
- **No duplication**: extract a shared helper when two blocks share non-trivial logic.
- **Goal-driven verification**: define concrete checks (tests, lint, typecheck, or runtime output) and run them after your final edit.

## 4. Teach Concisely (Teach)
- After implementing non-trivial changes, briefly explain the *why* behind the architecture, key trade-offs, and how the pieces fit together so the developer stays in full control of the codebase.
