#!/usr/bin/env bash
# Install (or uninstall) urutau's global method for Claude Code and Codex.
#   scripts/install.sh            install; safe to run again
#   scripts/install.sh --uninstall
# Claude Code: adds an @import of global/AGENTS.md between markers in ~/.claude/CLAUDE.md
#              (created if missing; nothing else in the file is touched; no symlink).
# Codex:       symlinks $CODEX_HOME/AGENTS.md (default ~/.codex) to global/AGENTS.md if absent;
#              otherwise prints what to do.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
METHOD="$REPO/global/AGENTS.md"
CLAUDE_FILE="$HOME/.claude/CLAUDE.md"
CODEX_DIR="${CODEX_HOME:-$HOME/.codex}"
CODEX_FILE="$CODEX_DIR/AGENTS.md"
BEGIN="<!-- urutau:begin -->"
END="<!-- urutau:end -->"

[ -f "$METHOD" ] || { echo "error: $METHOD not found" >&2; exit 1; }
case "$REPO" in *" "*) echo "error: the repository path contains a space; Claude Code @imports need it escaped. Move the clone." >&2; exit 1;; esac

remove_block() {  # strip the marked block from $1, keep everything else
  [ -f "$1" ] || return 0
  local tmp; tmp="$(mktemp)"
  awk -v b="$BEGIN" -v e="$END" '$0==b{skip=1;next} $0==e{skip=0;next} !skip' "$1" > "$tmp"
  cat "$tmp" > "$1"; rm -f "$tmp"
}

install_claude() {
  mkdir -p "$(dirname "$CLAUDE_FILE")"
  [ -f "$CLAUDE_FILE" ] || : > "$CLAUDE_FILE"
  remove_block "$CLAUDE_FILE"
  if [ -s "$CLAUDE_FILE" ] && [ -n "$(tail -c1 "$CLAUDE_FILE")" ]; then echo >> "$CLAUDE_FILE"; fi
  printf '%s\n@%s\n%s\n' "$BEGIN" "$METHOD" "$END" >> "$CLAUDE_FILE"
  echo "claude: $CLAUDE_FILE imports @$METHOD"
}

install_codex() {
  mkdir -p "$CODEX_DIR"
  if [ -L "$CODEX_FILE" ] && [ "$(readlink "$CODEX_FILE")" = "$METHOD" ]; then
    echo "codex: $CODEX_FILE already links to the method"
  elif [ -e "$CODEX_FILE" ] || [ -L "$CODEX_FILE" ]; then
    echo "codex: $CODEX_FILE exists and was left untouched. To use urutau, either"
    echo "       append the method:   cat '$METHOD' >> '$CODEX_FILE'"
    echo "       or replace the file: ln -sf '$METHOD' '$CODEX_FILE'"
  else
    ln -s "$METHOD" "$CODEX_FILE"
    echo "codex: linked $CODEX_FILE -> $METHOD"
  fi
  if [ -e "$CODEX_DIR/AGENTS.override.md" ]; then
    echo "codex: warning: $CODEX_DIR/AGENTS.override.md exists and hides AGENTS.md"
  fi
}

uninstall() {
  if [ -f "$CLAUDE_FILE" ]; then remove_block "$CLAUDE_FILE"; echo "claude: removed the urutau block from $CLAUDE_FILE"; fi
  if [ -L "$CODEX_FILE" ] && [ "$(readlink "$CODEX_FILE")" = "$METHOD" ]; then
    rm "$CODEX_FILE"; echo "codex: removed link $CODEX_FILE"
  else
    echo "codex: nothing to remove"
  fi
}

case "${1:-}" in
  --uninstall) uninstall ;;
  "") install_claude; install_codex
      echo
      echo "Verify: in Claude Code run /memory or /context and look for global/AGENTS.md;"
      echo "        in Codex run: codex \"Quote rule R1 of your global instructions.\"" ;;
  *) echo "usage: $0 [--uninstall]" >&2; exit 2 ;;
esac
