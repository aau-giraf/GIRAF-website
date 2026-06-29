#!/bin/bash

# New blog post creation script for the GIRAF website
# Usage: ./new-post.sh "Post Title" [--draft]

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Default values
TITLE=""
IS_DRAFT=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --draft)
            IS_DRAFT=true
            shift
            ;;
        *)
            if [ -z "$TITLE" ]; then
                TITLE="$1"
            fi
            shift
            ;;
    esac
done

# Check if title is provided
if [ -z "$TITLE" ]; then
    echo -e "${YELLOW}📝 Creating a new blog post${NC}"
    read -p "Enter post title: " TITLE
fi

# Generate filename-safe slug
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')

# Set directory and filename
if [ "$IS_DRAFT" = true ]; then
    DIR="_drafts"
    FILENAME="${SLUG}.md"
else
    DIR="_posts"
    DATE=$(date +%Y-%m-%d)
    FILENAME="${DATE}-${SLUG}.md"
fi

# Create directories if they don't exist
mkdir -p "$DIR"

FILEPATH="${DIR}/${FILENAME}"

# Check if file already exists
if [ -f "$FILEPATH" ]; then
    echo -e "${YELLOW}⚠️  File already exists: $FILEPATH${NC}"
    read -p "Overwrite? (y/N): " confirm
    if [[ ! $confirm =~ ^[Yy]$ ]]; then
        echo "Cancelled."
        exit 1
    fi
fi

# Create the post content
if [ "$IS_DRAFT" = true ]; then
    CONTENT="---
layout: post
title: \"$TITLE\"
tags: [giraf]
---

Write your post content here.
"
else
    CONTENT="---
layout: post
title: \"$TITLE\"
date: $(date +%Y-%m-%d)
tags: [giraf]
---

Write your post content here.
"
fi

# Create the file
echo "$CONTENT" > "$FILEPATH"

echo -e "${GREEN}✅ Created: $FILEPATH${NC}"

# Offer to open in editor
if command -v code &> /dev/null; then
    read -p "Open in VS Code? (Y/n): " open_editor
    if [[ ! $open_editor =~ ^[Nn]$ ]]; then
        code "$FILEPATH"
    fi
elif command -v nano &> /dev/null; then
    read -p "Open in nano? (Y/n): " open_editor
    if [[ ! $open_editor =~ ^[Nn]$ ]]; then
        nano "$FILEPATH"
    fi
fi

echo -e "${BLUE}Tips:${NC}"
if [ "$IS_DRAFT" = true ]; then
    echo "  - Preview drafts: ./site.sh drafts"
    echo "  - Publish later: move from _drafts to _posts with a date prefix"
else
    echo "  - Preview: ./site.sh serve"
    echo "  - Deploy:  ./site.sh deploy"
fi