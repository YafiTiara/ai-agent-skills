---
name: project-memory-mapper
description: >-
  Long-term project memory and codebase mapping workflow combining ai-memory
  markdown wiki patterns, repo structure mapping (laravel-brain / graphify style),
  and Context7 version-accurate doc lookup. Use automatically on large codebases,
  multi-session projects, or when using fast-changing frameworks.
---

# Project Memory & Codebase Mapper

## 1. Map Before Editing Large Codebases
- Before modifying unfamiliar multi-module repos, map entry points, routes/controllers, data models, and shared utilities so changes align with existing architecture.
- Search with targeted grep/ripgrep before reading full files.

## 2. Persistent Local Memory (`ai-memory` Pattern)
- For multi-session projects, maintain a concise local markdown log (e.g., `docs/ARCHITECTURE.md` or `.agents/memory.md`) recording:
  - Core architectural decisions & *why* they were made
  - Repo conventions (naming, state management, test commands)
  - Known gotchas or environment constraints

## 3. Version-Accurate Docs (Context7 SOP)
- For fast-moving frameworks (Next.js, Tailwind CSS v4, Supabase, Drizzle, etc.), query up-to-date official documentation via **Context7** (when available) instead of relying on stale training-cutoff APIs.
