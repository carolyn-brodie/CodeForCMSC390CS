#!/bin/bash

# Usage:
# ./commit_to_git.sh /path/to/git/repo "Commit message"

set -e

TARGET_REPO="$1"
COMMIT_MESSAGE="$2"

if [ -z "$TARGET_REPO" ] || [ -z "$COMMIT_MESSAGE" ]; then
    echo "Usage: $0 <git_repo_path> <commit_message>"
    exit 1
fi

if [ ! -d "$TARGET_REPO/.git" ]; then
    echo "Target is not a valid git repository."
    exit 1
fi

cd "$TARGET_REPO"

echo "Adding changes to git..."
git add -A

echo "Committing..."
git commit -m "$COMMIT_MESSAGE"

echo "Done."
