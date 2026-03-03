#!/usr/bin/env bash
set -euo pipefail

OWNER="stiffi136"
REPO="stf-devcontainer"
REF="main"
TARGET_DIR="$(pwd)"
FORCE="false"

usage() {
  cat <<USAGE
Usage: $(basename "$0") [options]

Downloads devcontainer templates from GitHub and installs them into a project.

Options:
  -t, --target <dir>   Target project directory (default: current directory)
  -o, --owner <name>   GitHub owner (default: ${OWNER})
  -r, --repo <name>    GitHub repo (default: ${REPO})
  -b, --ref <ref>      Git ref/branch/tag (default: ${REF})
  -f, --force          Overwrite existing files
  -h, --help           Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -t|--target)
      TARGET_DIR="$2"
      shift 2
      ;;
    -o|--owner)
      OWNER="$2"
      shift 2
      ;;
    -r|--repo)
      REPO="$2"
      shift 2
      ;;
    -b|--ref)
      REF="$2"
      shift 2
      ;;
    -f|--force)
      FORCE="true"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required but not installed." >&2
  exit 1
fi

TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
DEVCONTAINER_DIR="${TARGET_DIR}/.devcontainer"
DEVCONTAINER_FILE="${DEVCONTAINER_DIR}/devcontainer.json"
ESLINT_FILE="${TARGET_DIR}/eslint.config.mjs"
TSCONFIG_FILE="${TARGET_DIR}/tsconfig.json"

mkdir -p "$DEVCONTAINER_DIR"

if [[ "$FORCE" != "true" ]]; then
  if [[ -f "$DEVCONTAINER_FILE" || -f "$ESLINT_FILE" || -f "$TSCONFIG_FILE" ]]; then
    echo "Target files already exist. Use --force to overwrite:" >&2
    [[ -f "$DEVCONTAINER_FILE" ]] && echo "  - $DEVCONTAINER_FILE" >&2
    [[ -f "$ESLINT_FILE" ]] && echo "  - $ESLINT_FILE" >&2
    [[ -f "$TSCONFIG_FILE" ]] && echo "  - $TSCONFIG_FILE" >&2
    exit 1
  fi
fi

BASE_URL="https://raw.githubusercontent.com/${OWNER}/${REPO}/${REF}/templates"

curl -fsSL "${BASE_URL}/devcontainer.json" -o "$DEVCONTAINER_FILE"
curl -fsSL "${BASE_URL}/eslint.config.mjs" -o "$ESLINT_FILE"
curl -fsSL "${BASE_URL}/tsconfig.json" -o "$TSCONFIG_FILE"

echo "Installed:"
echo "- $DEVCONTAINER_FILE"
echo "- $ESLINT_FILE"
echo "- $TSCONFIG_FILE"
echo
echo "Next step: Rebuild/Reopen your project in the Dev Container."
