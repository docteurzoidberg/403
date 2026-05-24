#!/usr/bin/env bash
# Installe les git hooks du projet (symlinks vers web/scripts/hooks/).
# Idempotent : peut être ré-exécuté sans risque.
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOKS_SRC="$REPO_ROOT/web/scripts/hooks"
HOOKS_DST="$REPO_ROOT/.git/hooks"

if [[ ! -d "$HOOKS_SRC" ]]; then
  echo "setup-hooks: dossier $HOOKS_SRC introuvable" >&2
  exit 1
fi

if [[ ! -d "$HOOKS_DST" ]]; then
  echo "setup-hooks: $HOOKS_DST introuvable (pas dans un repo git ?)" >&2
  exit 1
fi

for hook in "$HOOKS_SRC"/*; do
  name="$(basename "$hook")"
  target="$HOOKS_DST/$name"
  chmod +x "$hook"
  ln -sfn "$hook" "$target"
  echo "setup-hooks: $name → $target"
done

echo "setup-hooks: terminé."
