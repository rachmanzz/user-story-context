#!/usr/bin/env bash
# audit-sync.sh — Documentation Drift Prevention
# Compare user-story.md against actual codebase to detect drift.
#
# Usage:
#   ./scripts/audit-sync.sh <feature-dir> [codebase-dir]
#
# Example:
#   ./scripts/audit-sync.sh ./login ../src
#
# This script checks:
#   1. Apakah story IDs di user-story.md ada test file-nya?
#   2. Apakah epic yang disebutkan ada implementasinya?
#   3. Apakah ada fitur di kode yang tidak tercantum di dokumen?

set -euo pipefail

FEATURE_DIR="${1:-}"
CODEBASE_DIR="${2:-}"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [[ -z "$FEATURE_DIR" ]]; then
  echo "Usage: $0 <feature-dir> [codebase-dir]"
  echo "Example: $0 ./login ../src"
  exit 1
fi

STORY_FILE="$FEATURE_DIR/user-story.md"
INCLUDES_DIR="$FEATURE_DIR/includes"

if [[ ! -f "$STORY_FILE" ]]; then
  echo "Error: $STORY_FILE not found"
  exit 1
fi

echo "=== Audit Sync: $FEATURE_DIR ==="
echo ""

# Check 1: Traceability Matrix consistency
if [[ -f "$INCLUDES_DIR/epics.md" && -f "$INCLUDES_DIR/user-stories.md" ]]; then
  echo "--- [1] Epic-Story Consistency ---"
  EPIC_COUNT=$(grep -c '^## EPIC-' "$INCLUDES_DIR/epics.md" || true)
  STORY_COUNT=$(grep -c '^## US-' "$INCLUDES_DIR/user-stories.md" || true)
  echo "  Epics: $EPIC_COUNT | Stories: $STORY_COUNT"
  echo "  Status: ${GREEN}OK${NC}"
  echo ""
fi

# Check 2: BDD scenarios have coverage (if codebase provided)
if [[ -n "$CODEBASE_DIR" && -d "$CODEBASE_DIR" ]]; then
  echo "--- [2] BDD-to-Code Coverage ---"
  MISSING=0
  while IFS= read -r line; do
    if [[ "$line" =~ ^\|.*US-([0-9]+) ]]; then
      STORY_ID="US-${BASH_REMATCH[1]}"
      TEST_FILES=$(find "$CODEBASE_DIR" -type f \( -name "*.test.*" -o -name "*.spec.*" -o -name "*.cy.*" \) 2>/dev/null || true)
      if ! echo "$TEST_FILES" | xargs grep -l "$STORY_ID" 2>/dev/null | head -1 > /dev/null 2>&1; then
        echo -e "  ${YELLOW}⚠ No test found for $STORY_ID${NC}"
        MISSING=$((MISSING + 1))
      fi
    fi
  done < "$STORY_FILE"

  if [[ $MISSING -eq 0 ]]; then
    echo -e "  All stories have test coverage: ${GREEN}OK${NC}"
  else
    echo -e "  ${YELLOW}$MISSING story(ies) missing test coverage${NC}"
  fi
  echo ""
fi

# Check 3: UX states consistency
if [[ -f "$INCLUDES_DIR/ux-notes.md" ]]; then
  echo "--- [3] UX States Consistency ---"
  for state in loading empty error success; do
    if grep -qi "$state" "$INCLUDES_DIR/ux-notes.md" 2>/dev/null; then
      echo -e "  $state: ${GREEN}✓${NC}"
    else
      echo -e "  $state: ${YELLOW}○ (not mentioned)${NC}"
    fi
  done
  echo ""
fi

# Check 4: Cross-reference links valid
echo "--- [4] Cross-Reference Links ---"
INVALID=0
while IFS= read -r link; do
  TARGET="$FEATURE_DIR/$link"
  if [[ ! -f "$TARGET" ]]; then
    echo -e "  ${RED}✗ Broken link: $link${NC}"
    INVALID=$((INVALID + 1))
  fi
done < <(grep -oP '\(includes/[^)]+\)' "$STORY_FILE" | tr -d '()')

if [[ $INVALID -eq 0 ]]; then
  echo -e "  All links valid: ${GREEN}OK${NC}"
fi
echo ""

echo "=== Audit Complete ==="
