---
name: project-memory-mapper
description: >-
  Long-term project memory and codebase mapping workflow combining Graphify
  knowledge-graph queries (when `graphify-out/graph.json` exists), ai-memory
  markdown wiki patterns, and Context7 version-accurate doc lookup. Use
  automatically on large codebases, multi-session projects, or when using
  fast-changing frameworks.
---

# Project Memory & Codebase Mapper

## 1. Map Before Editing Large Codebases
- **Graphify First (when `graphify-out/graph.json` exists)**: query the existing knowledge graph before grepping raw files (`graphify query "<question>"`, `graphify path "A" "B"`, `graphify explain "X"`, or `graphify affected "X"`). Run `graphify update .` (AST-only, no LLM needed) after major code changes.
- **No Graph Yet**: for small/medium repos or single targeted lookups, use `grep`/`ripgrep` before reading full files. For large, unfamiliar, or cross-module repos, use or suggest `/graphify` (see the `graphify` skill) to build the AST/knowledge graph first.

## 2. Persistent Local Memory (`ai-memory` Pattern)
- For multi-session projects, maintain a concise local markdown log (e.g., `docs/ARCHITECTURE.md` or `.agents/memory.md`) recording:
  - Core architectural decisions & *why* they were made
  - Repo conventions (naming, state management, test commands)
  - Known gotchas or environment constraints

## 3. Version-Accurate Docs (Context7 SOP)
- For fast-moving frameworks (Next.js, Tailwind CSS v4, Supabase, Drizzle, etc.), query up-to-date official documentation via **Context7** (when available) instead of relying on stale training-cutoff APIs.
