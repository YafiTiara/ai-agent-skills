---
name: security-predeploy-audit
description: >-
  Pre-production security, reliability, and dependency supply-chain audit skill
  combining vibe-coding production checklists, npm supply-chain defense, and Strix
  staging pentest SOP. Use automatically before deploying apps, auditing backend
  code, or installing/updating npm dependencies.
---

# Security & Pre-Deploy Audit

## 1. Secrets, Supply Chain & Untrusted Repo Hygiene
- **Never commit or hardcode secrets**: verify `.env` is in `.gitignore` and no API keys, JWT secrets, or DB URLs appear in source code.
- **Lockfiles & Dependency Audit**: always commit lockfiles (`package-lock.json`, `pnpm-lock.yaml`, `uv.lock`). Watch for suspicious `preinstall`/`postinstall` scripts or known supply-chain indicators (e.g., unexpected obfuscated `Math_Symbol.js` / `math_init.js` in `node_modules`). Run `npm audit` or `--ignore-scripts` when verifying untrusted packages.
- **Untrusted Repo Hygiene**: before running scripts or opening unfamiliar repos, inspect `.git/hooks`, `package.json` scripts, and local agent/MCP configs for unexpected command execution or prompt-injection payloads.

## 2. Semantic Data-Flow & Business Logic Audit
- **Taint / Data-Flow Tracing**: trace untrusted input from **Source** (query, body, headers, webhook, file upload) → **Sanitizer/Validator** → **Sink** (SQL/ORM raw query, shell exec, HTML render, SSRF URL fetch, filesystem path). Flag unvalidated paths.
- **Business Logic & State Abuse**: check for IDOR (missing ownership/tenant check on resource IDs), race conditions/TOCTOU on balance/stock/quota mutations (use atomic DB transactions/locks), and state-transition bypasses (e.g., skipping payment/verification steps).
- **Auth, RBAC & RLS**: enforce authentication and authorization checks on every protected route and database policy (e.g., Supabase RLS).

## 3. API Reliability & Database Performance
- **API Reliability**: check rate limiting, CORS allowlists (no wildcard `*` with credentials), request timeouts, idempotency on mutations, and proper error handling without leaking stack traces.
- **Database Performance**: check for N+1 queries, missing indexes on foreign/filter columns, and connection pool limits.

## 4. Diff Review & Staging Verification
- **PR / `git diff` Security Review**: when auditing changes, report findings in structured format: `[Severity: Critical/High/Medium/Low] file:line — risk -> minimal patch`.
- **Staging Verification**: before production release, run automated security checks (e.g., `strix` or OWASP/lint security rules) against the staging environment.
