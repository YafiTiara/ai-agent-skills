# AI Agent Skills

A curated collection of reusable `SKILL.md` workflows for AI coding agents (**Claude Code**, **Antigravity**, **Cursor**, **Codex**, and any agent supporting the open `SKILL.md` standard).

Each skill bundles practical engineering checklists, guardrails, and step-by-step workflows so your agent follows consistent habits instead of improvising from scratch.

## Included Skills

| Skill | Focus | When to Use |
| :--- | :--- | :--- |
| [`surgical-dev-workflow`](skills/surgical-dev-workflow/SKILL.md) | Engineering discipline | Clarifying ambiguous requirements, keeping diffs minimal, and avoiding over-engineering. |
| [`ui-craft-antislop`](skills/ui-craft-antislop/SKILL.md) | Frontend & UI design | Building or restyling web apps and dashboards with cohesive design tokens (`DESIGN.md` / `PRODUCT.md`). |
| [`browser-qa-verifier`](skills/browser-qa-verifier/SKILL.md) | End-to-end UI testing | Verifying rendered pages, forms, console errors, and layout in a real browser after frontend edits. |
| [`security-predeploy-audit`](skills/security-predeploy-audit/SKILL.md) | Security & supply chain | Auditing secrets, npm/package lockfiles, auth/API boundaries, and pre-deploy readiness. |
| [`project-memory-mapper`](skills/project-memory-mapper/SKILL.md) | Codebase mapping | Navigating large multi-module repos (with Graphify when present), keeping markdown memory notes, and checking framework docs. |
| [`replica-mvp-architect`](skills/replica-mvp-architect/SKILL.md) | Rapid MVP scoping | Breaking down reference products (Recon -> Architect -> Build) and stress-testing technical plans. |
| [`clean-prose-humanizer`](skills/clean-prose-humanizer/SKILL.md) | Technical & UX writing | Editing READMEs, docs, PRDs, and microcopy so text sounds direct and free of stock AI clichés. |
| [`content-motion-studio`](skills/content-motion-studio/SKILL.md) | Short-form & motion | Scripting short-form developer content and building programmatic motion graphics with Remotion. |
| [`caveman-mode`](skills/caveman-mode/SKILL.md) | Token compression | Opt-in ultra-concise telegraphic mode for rapid debugging, short commits, PR reviews, and memory compression. |

## Installation

### Option 1: Installer Script

**Windows (PowerShell):**
```powershell
git clone https://github.com/YafiTiara/ai-agent-skills.git
cd ai-agent-skills
.\install.ps1 -Target claude      # or: antigravity, cursor, agents, all
```

**macOS / Linux (Bash):**
```bash
git clone https://github.com/YafiTiara/ai-agent-skills.git
cd ai-agent-skills
chmod +x install.sh
./install.sh --target claude     # or: antigravity, cursor, agents, all
```

### Option 2: Manual Copy

Copy any folder from `skills/` (or all of them) into your agent's skills directory:

- **Claude Code:** `~/.claude/skills/`
- **Antigravity:** `~/.gemini/config/skills/`
- **Cursor:** `~/.cursor/skills/`
- **Generic / Project-local:** `<your-project>/.agents/skills/`

## Structure

Each skill lives in its own directory with a `SKILL.md` file containing YAML frontmatter (`name`, `description`) and markdown instructions:

```text
skills/
├── browser-qa-verifier/SKILL.md
├── caveman-mode/SKILL.md
├── clean-prose-humanizer/SKILL.md
├── content-motion-studio/SKILL.md
├── project-memory-mapper/SKILL.md
├── replica-mvp-architect/SKILL.md
├── security-predeploy-audit/SKILL.md
├── surgical-dev-workflow/SKILL.md
└── ui-craft-antislop/SKILL.md
```

## Contributing & Credits

These skills synthesize and adapt practical workflows shared across the developer community (including surgical coding practices, design-token-first UI systems, supply-chain security checklists, and browser QA patterns).

Pull requests and improvements to existing skills are welcome.

## License

[MIT](LICENSE)
