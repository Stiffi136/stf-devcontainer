# stf-devcontainer

A lean, reusable base image for Dev Containers built on TypeScript/Node.

## Included Tools

- Base image: `mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm`
- Node.js 22 + TypeScript tooling from the official Dev Container image
- `bun` (installed system-wide)
- `tmux`
- Globally installed Bun CLIs: `@os-eco/mulch-cli`, `@os-eco/seeds-cli`, `@os-eco/canopy-cli`, `@os-eco/overstory-cli`
- Globally installed npm CLI: `@openai/codex`
- Claude Code (via `curl -fsSL https://claude.ai/install.sh | bash`)

## AI Tooling

This image includes AI-focused developer tooling out of the box:
- OpenAI Codex CLI (`@openai/codex`)
- Claude Code

## Build The Image Locally

```bash
docker build -t stf-devcontainer:local .
```

## Use In New Projects

1. Push the image to a registry (for example, GHCR):

```bash
docker tag stf-devcontainer:local ghcr.io/stiffi136/stf-devcontainer:latest
docker push ghcr.io/stiffi136/stf-devcontainer:latest
```

2. Create `.devcontainer/devcontainer.json` in your project.

Use `templates/devcontainer.json` as a starting point and adjust the image name if needed.

## Example

```bash
mkdir -p <project>/.devcontainer
cp templates/devcontainer.json <project>/.devcontainer/devcontainer.json
```

Then open the project in VS Code / Codespaces inside the container.
