---
name: security-predeploy-audit
description: >-
  Pre-production security, reliability, and dependency supply-chain audit skill
  combining vibe-coding production checklists, npm supply-chain defense, and Strix
  staging pentest SOP. Use automatically before deploying apps, auditing backend
  code, or installing/updating npm dependencies.
---

# Security & Pre-Deploy Audit

## 1. Secrets & Supply Chain Defense
- **Never commit or hardcode secrets**: verify `.env` is in `.gitignore` and no API keys, JWT secrets, or DB URLs appear in source code.
- **Lockfiles & Dependency Audit**: always commit lockfiles (`package-lock.json`, `pnpm-lock.yaml`, `uv.lock`). Watch for suspicious `preinstall`/`postinstall` scripts or known supply-chain indicators (e.g., unexpected obfuscated `Math_Symbol.js` / `math_init.js` in `node_modules`). Run `npm audit` or `--ignore-scripts` when verifying untrusted packages.

## 2. Backend, Auth & Database Checklist
- **Input Validation & Injection**: validate/sanitize all request inputs; use parameterized queries/ORM bindings (no raw string SQL interpolation).
- **Auth, RBAC & RLS**: enforce authentication and authorization checks on every protected route and database policy (e.g., Supabase RLS).
- **API Reliability**: check rate limiting, CORS allowlists (no wildcard `*` with credentials), request timeouts, idempotency on mutations, and proper error handling without leaking stack traces.
- **Database Performance**: check for N+1 queries, missing indexes on foreign/filter columns, and connection pool limits.

## 3. Staging Verification
- Before production release, run automated security checks (e.g., `strix` or OWASP/lint security rules) against the staging environment.
