#!/bin/sh

if [ -f /slidev/slides.md ]; then
    if [ -d /slidev/node_modules ]; then
        npm update
    else
        npm install
    fi
    echo "Build slidev..."
    npx slidev build
    echo "Start slidev..."
    npx slidev --remote
else
    echo "slides.md not found in the bind mount to /slidev"
    npm install @slidev/cli @slidev/theme-default @slidev/theme-seriph
    npm i -D playwright-chromium
    npx playwright install
    cp -f /slidev/node_modules/@slidev/cli/template.md /slidev/slides.md
    echo "Build slidev..."
    npx slidev build
    echo "Start slidev..."
    npx slidev --remote
fi