#!/usr/bin/env bash
# Install urutau's two layers. urutau is the single source of both:
#   global  — generic working rules (global/AGENTS.md) + skills, for every session on this machine;
#             linked to this clone, so `git pull` here updates them.
#   project — the full method applied to one project (method/AGENTS.md + modules/), copied into
#             <path>/.urutau/ with a version stamp; re-run to update the pin.
#
#   scripts/install.sh                     global install; safe to run again
#   scripts/install.sh --uninstall         undo the global install
#   scripts/install.sh --project <path>    pin the current method into <path>/.urutau/ (re-run to update)
#   scripts/install.sh --project <path> --uninstall
#   scripts/install.sh --status [<path>]   show what is installed and which version
#
# Global  — Claude Code: @import of global/AGENTS.md between markers in ~/.claude/CLAUDE.md
#            (created if missing; nothing else in the file is touched), and each skills/<name>/
#            symlinked into ~/.claude/skills/ if that name is free.
#          Codex: symlinks $CODEX_HOME/AGENTS.md (default ~/.codex) to global/AGENTS.md if absent.
# Project — copies method/AGENTS.md and modules/ into <path>/.urutau/ with a version stamp; the
#           project AGENTS.md loads it with `@.urutau/AGENTS.md` (templates/project/AGENTS.md).
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
METHOD="$REPO/global/AGENTS.md"
PROJECT_METHOD="$REPO/method/AGENTS.md"
VERSION="$(cat "$REPO/VERSION")"
COMMIT="$(git -C "$REPO" rev-parse --short HEAD 2>/dev/null || echo unknown)"
DIRTY="$(git -C "$REPO" status --porcelain -- method modules 2>/dev/null | head -1)"
CLAUDE_FILE="$HOME/.claude/CLAUDE.md"
SKILLS_DIR="$HOME/.claude/skills"
CODEX_DIR="${CODEX_HOME:-$HOME/.codex}"
CODEX_FILE="$CODEX_DIR/AGENTS.md"
BEGIN="<!-- urutau:begin -->"
END="<!-- urutau:end -->"

[ -f "$METHOD" ] || { echo "error: $METHOD not found" >&2; exit 1; }

remove_block() {  # strip the marked block from $1, keep everything else
  [ -f "$1" ] || return 0
  local tmp; tmp="$(mktemp)"
  awk -v b="$BEGIN" -v e="$END" '$0==b{skip=1;next} $0==e{skip=0;next} !skip' "$1" > "$tmp"
  cat "$tmp" > "$1"; rm -f "$tmp"
}

install_claude() {
  case "$REPO" in *" "*) echo "error: the repository path contains a space; Claude Code @imports need it escaped. Move the clone." >&2; exit 1;; esac
  mkdir -p "$(dirname "$CLAUDE_FILE")"
  [ -f "$CLAUDE_FILE" ] || : > "$CLAUDE_FILE"
  remove_block "$CLAUDE_FILE"
  if [ -s "$CLAUDE_FILE" ] && [ -n "$(tail -c1 "$CLAUDE_FILE")" ]; then echo >> "$CLAUDE_FILE"; fi
  printf '%s\n@%s\n%s\n' "$BEGIN" "$METHOD" "$END" >> "$CLAUDE_FILE"
  echo "claude: $CLAUDE_FILE imports @$METHOD"
}

install_skills() {
  mkdir -p "$SKILLS_DIR"
  for dir in "$REPO"/skills/*/; do
    [ -f "$dir/SKILL.md" ] || continue
    dir="${dir%/}"; local name link; name="$(basename "$dir")"; link="$SKILLS_DIR/$name"
    if [ -L "$link" ] && [ "$(readlink "$link")" = "$dir" ]; then
      echo "skill:  $name already linked"
    elif [ -e "$link" ] || [ -L "$link" ]; then
      echo "skill:  $link exists and was left untouched (remove it to let urutau link its $name skill)"
    else
      ln -s "$dir" "$link"; echo "skill:  linked $link -> $dir"
    fi
  done
}

install_codex() {
  mkdir -p "$CODEX_DIR"
  if [ -L "$CODEX_FILE" ] && [ "$(readlink "$CODEX_FILE")" = "$METHOD" ]; then
    echo "codex:  $CODEX_FILE already links to the method"
  elif [ -e "$CODEX_FILE" ] || [ -L "$CODEX_FILE" ]; then
    echo "codex:  $CODEX_FILE exists and was left untouched. To use urutau, either"
    echo "        append the method:   cat '$METHOD' >> '$CODEX_FILE'"
    echo "        or replace the file: ln -sf '$METHOD' '$CODEX_FILE'"
  else
    ln -s "$METHOD" "$CODEX_FILE"
    echo "codex:  linked $CODEX_FILE -> $METHOD"
  fi
  if [ -e "$CODEX_DIR/AGENTS.override.md" ]; then
    echo "codex:  warning: $CODEX_DIR/AGENTS.override.md exists and hides AGENTS.md"
  fi
}

uninstall_global() {
  if [ -f "$CLAUDE_FILE" ]; then remove_block "$CLAUDE_FILE"; echo "claude: removed the urutau block from $CLAUDE_FILE"; fi
  for link in "$SKILLS_DIR"/*; do
    if [ -L "$link" ] && [[ "$(readlink "$link")" == "$REPO/skills/"* ]]; then rm "$link"; echo "skill:  removed link $link"; fi
  done
  if [ -L "$CODEX_FILE" ] && [ "$(readlink "$CODEX_FILE")" = "$METHOD" ]; then
    rm "$CODEX_FILE"; echo "codex:  removed link $CODEX_FILE"
  else
    echo "codex:  nothing to remove"
  fi
}

install_project() {
  local dest="$1/.urutau" old="none"
  [ -d "$1" ] || { echo "error: $1 is not a directory" >&2; exit 1; }
  [ -f "$dest/VERSION" ] && old="$(head -1 "$dest/VERSION")"
  [ -n "$DIRTY" ] && echo "warning: urutau has uncommitted changes in method/ or modules/; the pin records commit $COMMIT+dirty"
  mkdir -p "$dest/modules"
  {
    echo "<!-- urutau v$VERSION ($COMMIT${DIRTY:++dirty}) — pinned copy; do not edit here. Update: <urutau>/scripts/install.sh --project . -->"
    cat "$PROJECT_METHOD"
  } > "$dest/AGENTS.md"
  rm -f "$dest"/modules/*.md
  cp "$REPO"/modules/*.md "$dest/modules/"
  printf 'v%s (%s%s) pinned %s from %s\n' "$VERSION" "$COMMIT" "${DIRTY:++dirty}" "$(date +%Y-%m-%d)" "$REPO" > "$dest/VERSION"
  echo "project: $dest pinned at v$VERSION ($COMMIT${DIRTY:++dirty}); before: $old"
  if [ -f "$1/AGENTS.md" ] && ! grep -qF "@.urutau/AGENTS.md" "$1/AGENTS.md"; then
    echo "project: note — $1/AGENTS.md does not load the pin yet; add this line under '## Method':"
    echo "         - The method, urutau applied to this project (pinned copy; read it first): @.urutau/AGENTS.md"
  fi
}

status() {
  echo "urutau v$VERSION ($COMMIT${DIRTY:+, uncommitted changes}) at $REPO"
  if [ -f "$CLAUDE_FILE" ] && grep -qF "$BEGIN" "$CLAUDE_FILE"; then echo "claude: global layer installed"; else echo "claude: global layer NOT installed"; fi
  for dir in "$REPO"/skills/*/; do
    [ -f "$dir/SKILL.md" ] || continue
    dir="${dir%/}"; local name; name="$(basename "$dir")"
    if [ -L "$SKILLS_DIR/$name" ] && [ "$(readlink "$SKILLS_DIR/$name")" = "$dir" ]; then echo "skill:  $name installed"; else echo "skill:  $name NOT installed"; fi
  done
  if [ -L "$CODEX_FILE" ] && [ "$(readlink "$CODEX_FILE")" = "$METHOD" ]; then echo "codex:  installed"; else echo "codex:  not linked"; fi
  if [ -n "${1:-}" ]; then
    if [ -f "$1/.urutau/VERSION" ]; then echo "project: $1 — $(cat "$1/.urutau/VERSION")"; else echo "project: $1 has no pin (run --project to add one)"; fi
  fi
}

case "${1:-}" in
  "") install_claude; install_skills; install_codex
      echo
      echo "Verify: in Claude Code run /memory or /context and look for global/AGENTS.md;"
      echo "        in Codex run: codex \"Quote rule R1 of your global instructions.\"" ;;
  --uninstall) uninstall_global ;;
  --project)
      [ $# -ge 2 ] || { echo "usage: $0 --project <path> [--uninstall]" >&2; exit 2; }
      path="$(cd "$2" && pwd)"
      if [ "${3:-}" = "--uninstall" ]; then rm -rf "$path/.urutau"; echo "project: removed $path/.urutau"
      else install_project "$path"; fi ;;
  --status) status "${2:+$(cd "$2" && pwd)}" ;;
  *) echo "usage: $0 [--uninstall | --project <path> [--uninstall] | --status [<path>]]" >&2; exit 2 ;;
esac
