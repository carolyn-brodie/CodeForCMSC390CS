#!/bin/bash

# Usage:
# ./push_to_github.sh /path/to/git/repo "Commit message" branch_name

set -e

TARGET_REPO="$1"
COMMIT_MESSAGE="$2"
BRANCH_NAME="$3"

if [ -z "$TARGET_REPO" ] || [ -z "$COMMIT_MESSAGE" ] || [ -z "$BRANCH_NAME" ]; then
    echo "Usage: $0 <git_repo_path> <commit_message> <branch_name>"
    exit 1
fi

if [ ! -d "$TARGET_REPO/.git" ]; then
    echo "Target is not a valid git repository."
    exit 1
fi

cd "$TARGET_REPO"

echo "Adding changes..."
git add -A

echo "Committing..."
git commit -m "$COMMIT_MESSAGE" || echo "Nothing to commit."

echo "Pushing to GitHub..."
git push origin "$BRANCH_NAME"

echo "Push complete."
