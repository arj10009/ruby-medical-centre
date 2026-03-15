#!/bin/bash
# Deploy Ruby Medical Centre to GitHub Pages — fully automated

TOKEN="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"
REPO="ruby-medical-centre"
USER="arj10009"

echo "Step 1: Creating GitHub repository..."
curl -s -H "Authorization: token $TOKEN" \
     -d "{\"name\":\"$REPO\",\"public\":true}" \
     https://api.github.com/user/repos > /dev/null

echo "Step 2: Setting up git remote..."
cd "$(dirname "$0")"
git remote remove origin 2>/dev/null
git remote add origin "https://${USER}:${TOKEN}@github.com/${USER}/${REPO}.git"

echo "Step 3: Pushing to GitHub..."
git push -u origin main

echo "Step 4: Enabling GitHub Pages..."
curl -s -H "Authorization: token $TOKEN" \
     -H "Accept: application/vnd.github+json" \
     -X POST \
     -d '{"source":{"branch":"main","path":"/"}}' \
     "https://api.github.com/repos/${USER}/${REPO}/pages" > /dev/null

echo ""
echo "Done! Your site will be live in about 30 seconds at:"
echo "https://${USER}.github.io/${REPO}/"
