#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: git-custom-commit-push <commit-message>"
    exit 1
fi

git add .
git commit -m "$1"
git push origin HEAD

echo "Changes committed and pushed."