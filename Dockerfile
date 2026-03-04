FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends tmux \
    && rm -rf /var/lib/apt/lists/*

USER node

ENV BUN_INSTALL=/home/node/.bun
ENV PATH="${BUN_INSTALL}/bin:/home/node/.local/bin:${PATH}"

RUN curl -fsSL https://bun.sh/install | bash \
    && bun --version

RUN bun install -g \
    @os-eco/mulch-cli \
    @os-eco/seeds-cli \
    @os-eco/canopy-cli \
    @os-eco/overstory-cli

RUN npm i -g @openai/codex eslint

RUN curl -fsSL https://claude.ai/install.sh | bash
