#!/bin/bash 

# Use echo when debugging!
echo "===================="

# All and all allows the container to use git and upload it to the github branch

# Confirms what actor, and email that is working, and is not general
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
# Then we can add it to "safe directories, so we can run git commands there" 
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "Update Feed"

git push --set-upstream origin main

echo "===================="