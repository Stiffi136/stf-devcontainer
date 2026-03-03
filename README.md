# stf-devcontainer

A lean, reusable base image for Dev Containers built on TypeScript/Node.

## Included Tools

- Base image: `mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm`
- Node.js 22 + TypeScript tooling from the official Dev Container image
- `bun` (installed system-wide)
- `tmux`
- Globally installed Bun CLIs: `@os-eco/mulch-cli`, `@os-eco/seeds-cli`, `@os-eco/canopy-cli`, `@os-eco/overstory-cli`
- Globally installed npm CLIs: `@openai/codex`, `eslint`
- Claude Code (via `curl -fsSL https://claude.ai/install.sh | bash`)

## AI Tooling

This image includes AI-focused developer tooling out of the box:
- OpenAI Codex CLI (`@openai/codex`)
- Claude Code

## Use In New Projects

1. Create `.devcontainer/devcontainer.json` in your project.

Use `templates/devcontainer.json` as a starting point and adjust the image name if needed.

2. Rebuild/Reopen the project in the container in VS Code.

## Setup Script

You can bootstrap a project automatically by downloading the templates from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/stiffi136/stf-devcontainer/main/scripts/setup-devcontainer.sh | bash
```

Or run it locally from this repository:

```bash
./scripts/setup-devcontainer.sh --target <project>
```

## ESLint Template

This repository also ships a reusable ESLint config template with a very strict AI-focused baseline.

Copy it into a new project:

```bash
cp templates/eslint.config.mjs <project>/eslint.config.mjs
```

Then run linting inside the container:

```bash
eslint .
```

## Example

```bash
mkdir -p <project>/.devcontainer
cp templates/devcontainer.json <project>/.devcontainer/devcontainer.json
cp templates/eslint.config.mjs <project>/eslint.config.mjs
```

Then open the project in VS Code / Codespaces inside the container.
