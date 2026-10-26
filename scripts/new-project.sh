#!/usr/bin/env bash
# Scaffold urutau project files without overwriting anything.
#   scripts/new-project.sh <path> [--ml] [--rl]
# Copies templates/project/{AGENTS.md,CLAUDE.md,sdd/*} into <path>, fills
# {{PROJECT}}, {{DATE}} and {{MODULES}} in the files it creates, and lists
# files it skipped because they already exist.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO/templates/project"

[ $# -ge 1 ] || { echo "usage: $0 <path> [--ml] [--rl]" >&2; exit 2; }
DEST="$1"; shift
MODULES=()
for arg in "$@"; do
  case "$arg" in
    --ml) MODULES+=("\`$REPO/modules/ml.md\`") ;;
    --rl) MODULES+=("\`$REPO/modules/rl.md\`") ;;
    *) echo "unknown option: $arg" >&2; exit 2 ;;
  esac
done
if [ ${#MODULES[@]} -eq 0 ]; then MODLIST="none"; else MODLIST="$(IFS=,; echo "${MODULES[*]}" | sed 's/,/, /g')"; fi

mkdir -p "$DEST"
DEST="$(cd "$DEST" && pwd)"
PROJECT="$(basename "$DEST")"
TODAY="$(date +%Y-%m-%d)"

created=0; skipped=0
while IFS= read -r -d '' f; do
  rel="${f#"$SRC"/}"
  target="$DEST/$rel"
  if [ -e "$target" ]; then
    echo "skip    $rel (exists)"; skipped=$((skipped + 1)); continue
  fi
  mkdir -p "$(dirname "$target")"
  PROJECT="$PROJECT" TODAY="$TODAY" MODLIST="$MODLIST" python3 -c '
import os, sys
src, dst = sys.argv[1], sys.argv[2]
text = open(src, encoding="utf-8").read()
for k, v in (("{{PROJECT}}", os.environ["PROJECT"]), ("{{DATE}}", os.environ["TODAY"]), ("{{MODULES}}", os.environ["MODLIST"])):
    text = text.replace(k, v)
open(dst, "w", encoding="utf-8").write(text)
' "$f" "$target"
  echo "create  $rel"; created=$((created + 1))
done < <(find "$SRC" -type f -print0 | sort -z)

echo
echo "$created created, $skipped skipped in $DEST"
echo "Next: fill sdd/spec.md (question, goal type, acceptance criteria) and the project AGENTS.md."
