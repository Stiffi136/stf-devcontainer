FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm

USER root

ENV BUN_INSTALL=/usr/local/bun

RUN apt-get update \
    && apt-get install -y --no-install-recommends tmux \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://bun.sh/install | bash \
    && ln -s /usr/local/bun/bin/bun /usr/local/bin/bun \
    && bun --version

RUN bun install -g \
    @os-eco/mulch-cli \
    @os-eco/seeds-cli \
    @os-eco/canopy-cli \
    @os-eco/overstory-cli

RUN npm i -g @openai/codex

RUN curl -fsSL https://claude.ai/install.sh | bash

USER node
