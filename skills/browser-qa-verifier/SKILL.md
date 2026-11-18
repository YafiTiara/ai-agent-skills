---
name: browser-qa-verifier
description: >-
  End-to-end browser QA and UI verification workflow combining Playwright CLI,
  Chrome DevTools MCP inspection, and Artemis-style live testing. Use automatically
  after building or editing web frontend features, forms, or interactive UIs.
---

# Browser QA & Verification Workflow

## 1. Never Rely on Build/Compile Alone
- Passing `tsc`, `vite build`, or unit tests does not prove the UI works in a real browser.
- Whenever a web app or local dev server is running, verify the actual rendered pages.

## 2. Verification Checklist
1. **Console & Network**: check for uncaught runtime errors, React hydration warnings, and failed (`4xx`/`5xx`) network requests (use Chrome DevTools MCP or Playwright).
2. **Interactive Flows**: test primary user journeys (navigation, form submission, auth/state changes, error states) via Playwright CLI (`npx playwright`) or browser automation.
3. **Visual & Responsive**: inspect desktop (`1280x800`) and mobile (`375x812`) layouts for clipped text, overlapping elements, or horizontal overflow.
4. **Fix & Re-verify**: if any check fails, fix the root cause and re-run the browser check before reporting completion.
