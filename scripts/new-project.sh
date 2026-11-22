#!/usr/bin/env bash
# Set up a project with urutau, without overwriting anything:
#   1. scaffold templates/project/{AGENTS.md,CLAUDE.md,sdd/{spec,knowledge,log}.md}
#      (fills {{PROJECT}}, {{DATE}}, {{MODULES}}, {{VERSION}} in the files it creates);
#   2. pin the method into <path>/.urutau/ (install.sh --project);
#   3. Python env with uv: pyproject (if missing), .python-version, .venv, basic libs, uv.lock;
#   4. add .venv/ and caches to .gitignore.
# It does not touch git branches or commit; the urutau-setup skill (or you) does that.
#
#   scripts/new-project.sh <path> [--ml] [--rl] [--python VER] [--with PKG]... [--dev-with PKG]... [--no-uv]
#     --ml / --rl   activate a module (adds scikit-learn / gymnasium to the libs)
#     --python      Python version for the venv (default 3.12)
#     --with        extra runtime library (repeatable); --dev-with: extra dev tool
#     --no-uv       skip step 3
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO/templates/project"
VERSION="v$(cat "$REPO/VERSION")"

DEPS=(numpy pandas matplotlib scipy)
DEV_DEPS=(pytest ruff ipykernel)
IMPORTS=(numpy pandas matplotlib scipy)
PYVER="3.12"
USE_UV=1
MODULES=()

usage() { sed -n '2,15p' "$0" | sed 's/^# \{0,1\}//' >&2; exit 2; }
[ $# -ge 1 ] || usage
DEST="$1"; shift
while [ $# -gt 0 ]; do
  case "$1" in
    --ml) MODULES+=("\`.urutau/modules/ml.md\`"); DEPS+=(scikit-learn); IMPORTS+=(sklearn) ;;
    --rl) MODULES+=("\`.urutau/modules/rl.md\`"); DEPS+=(gymnasium); IMPORTS+=(gymnasium) ;;
    --python) PYVER="${2:?--python needs a version}"; shift ;;
    --with) DEPS+=("${2:?--with needs a package}"); shift ;;
    --dev-with) DEV_DEPS+=("${2:?--dev-with needs a package}"); shift ;;
    --no-uv) USE_UV=0 ;;
    *) echo "unknown option: $1" >&2; usage ;;
  esac
  shift
done
if [ ${#MODULES[@]} -eq 0 ]; then MODLIST="none"; else MODLIST="$(IFS=,; echo "${MODULES[*]}" | sed 's/,/, /g')"; fi

mkdir -p "$DEST"
DEST="$(cd "$DEST" && pwd)"
PROJECT="$(basename "$DEST")"
TODAY="$(date +%Y-%m-%d)"

echo "== 1. project files"
created=0; skipped=0
while IFS= read -r -d '' f; do
  rel="${f#"$SRC"/}"
  target="$DEST/$rel"
  if [ -e "$target" ]; then
    echo "skip    $rel (exists)"; skipped=$((skipped + 1)); continue
  fi
  mkdir -p "$(dirname "$target")"
  PROJECT="$PROJECT" TODAY="$TODAY" MODLIST="$MODLIST" VERSION="$VERSION" python3 -c '
import os, sys
src, dst = sys.argv[1], sys.argv[2]
text = open(src, encoding="utf-8").read()
for k, v in (("{{PROJECT}}", "PROJECT"), ("{{DATE}}", "TODAY"), ("{{MODULES}}", "MODLIST"), ("{{VERSION}}", "VERSION")):
    text = text.replace(k, os.environ[v])
open(dst, "w", encoding="utf-8").write(text)
' "$f" "$target"
  echo "create  $rel"; created=$((created + 1))
done < <(find "$SRC" -type f -print0 | sort -z)
echo "$created created, $skipped skipped"
if [ -e "$DEST/sdd/status.md" ]; then
  echo "note    sdd/status.md is from urutau v0: move its current task into sdd/spec.md and its cemetery into sdd/knowledge.md, then delete it"
fi

echo; echo "== 2. method pin"
"$REPO/scripts/install.sh" --project "$DEST"

echo; echo "== 3. python env (uv)"
if [ "$USE_UV" -eq 0 ]; then
  echo "skipped (--no-uv)"
elif ! command -v uv >/dev/null 2>&1; then
  echo "uv not found: install it (https://docs.astral.sh/uv/) and re-run, or pass --no-uv"
else
  cd "$DEST"
  if [ -f pyproject.toml ]; then
    echo "pyproject.toml exists: syncing only; add libraries with 'uv add <pkg>'"
    uv sync
  else
    name="$(echo "$PROJECT" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9._-]+/-/g; s/^[-._]+//; s/[-._]+$//')"
    uv init --bare --no-workspace --name "${name:-project}" --python "$PYVER"
    [ -f .python-version ] || uv python pin "$PYVER"
    [ -d .venv ] || uv venv --python "$PYVER"
    uv add "${DEPS[@]}"
    uv add --dev "${DEV_DEPS[@]}"
    uv run python -c "import $(IFS=,; echo "${IMPORTS[*]}"); import sys; print('ok: python', sys.version.split()[0], '+ $(IFS=' '; echo "${IMPORTS[*]}")')"
  fi
fi

echo; echo "== 4. .gitignore"
added=()
for entry in ".venv/" "__pycache__/" ".ipynb_checkpoints/" ".pytest_cache/" ".ruff_cache/"; do
  bare="${entry%/}"
  if [ -f "$DEST/.gitignore" ] && grep -qxE "/?${bare//./\\.}/?" "$DEST/.gitignore"; then continue; fi
  added+=("$entry")
done
if [ ${#added[@]} -gt 0 ]; then
  { [ -s "$DEST/.gitignore" ] && echo; echo "# urutau setup"; printf '%s\n' "${added[@]}"; } >> "$DEST/.gitignore"
  echo "added: ${added[*]}"
else
  echo "nothing to add"
fi

echo
echo "Done in $DEST. Next: fill AGENTS.md (purpose, data) and sdd/spec.md (question, acceptance criteria,"
echo "the T-01 task card in detail, later tasks as one generic line each)."
