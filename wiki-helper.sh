#!/bin/bash

# Wiki helper script - quick commands for common tasks
# Usage: ./wiki-helper.sh [command]

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

show_help() {
    echo -e "${BLUE}📚 Giraf Wiki Helper Commands${NC}"
    echo ""
    echo "Content Creation:"
    echo "  ./wiki-helper.sh new         - Create new wiki page"
    echo "  ./wiki-helper.sh post        - Create new blog post"
    echo "  ./wiki-helper.sh draft       - Create draft post"
    echo ""
    echo "Development:"
    echo "  ./wiki-helper.sh serve       - Start development server"
    echo "  ./wiki-helper.sh drafts      - Serve with drafts"
    echo "  ./wiki-helper.sh build       - Build site"
    echo ""
    echo "Publishing:"
    echo "  ./wiki-helper.sh deploy      - Deploy to production"
    echo ""
    echo "Utilities:"
    echo "  ./wiki-helper.sh status      - Show wiki status"
    echo "  ./wiki-helper.sh clean       - Clean build files"
    echo "  ./wiki-helper.sh setup       - Initial setup"
}

case "$1" in
    "new")
        if [ -z "$2" ]; then
            read -p "Enter wiki page title: " title
        else
            title="$2"
        fi
        slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')

        mkdir -p _wiki
        cat > "_wiki/${slug}.md" << EOF
---
layout: page
title: "$title"
permalink: /wiki/${slug}/
---

# $title

Brief description of this wiki page.

## Overview

Content goes here.

## Details

More detailed information.

## See Also

- [Documentation Index](/wiki/)
- [About Giraf](/about)
EOF
        echo -e "${GREEN}✅ Created: _wiki/${slug}.md${NC}"
        ;;
    "post")
        ./new-post.sh "$2"
        ;;
    "draft")
        ./new-post.sh "$2" --draft
        ;;
    "serve")
        echo -e "${BLUE}🚀 Starting development server...${NC}"
        bundle exec jekyll serve
        ;;
    "drafts")
        echo -e "${BLUE}🚀 Starting server with drafts...${NC}"
        bundle exec jekyll serve --drafts --livereload
        ;;
    "build")
        echo -e "${BLUE}📦 Building site...${NC}"
        JEKYLL_ENV=production bundle exec jekyll build
        ;;
    "deploy")
        ./deploy.sh
        ;;
    "status")
        echo -e "${BLUE}📊 Wiki Status${NC}"
        echo ""
        echo "Wiki pages: $(ls -1 _wiki/*.md 2>/dev/null | wc -l)"
        echo "Blog posts: $(ls -1 _posts/*.md 2>/dev/null | wc -l)"
        echo "Draft posts: $(ls -1 _drafts/*.md 2>/dev/null | wc -l)"
        echo ""
        if [ -d "_site" ]; then
            echo -e "${GREEN}✅ Site built${NC}"
            echo "Build size: $(du -sh _site | cut -f1)"
        else
            echo -e "${YELLOW}⚠️  Site not built${NC}"
        fi
        ;;
    "clean")
        echo -e "${YELLOW}🧹 Cleaning build files...${NC}"
        rm -rf _site .sass-cache .jekyll-cache .jekyll-metadata
        echo -e "${GREEN}✅ Clean complete${NC}"
        ;;
    "setup")
        echo -e "${BLUE}🔧 Setting up Giraf Wiki...${NC}"

        # Install dependencies
        if [ ! -f "Gemfile.lock" ]; then
            echo "📦 Installing Ruby dependencies..."
            bundle install
        fi

        # Create directories
        mkdir -p _wiki _posts _drafts

        # Copy .env template
        if [ ! -f ".env" ]; then
            cp .env.example .env
            echo "📝 Created .env file from template - please edit with your FTP credentials"
        fi

        echo -e "${GREEN}✅ Setup complete!${NC}"
        echo "Next steps:"
        echo "1. Edit .env with your FTP credentials"
        echo "2. Run: ./wiki-helper.sh serve"
        ;;
    *)
        show_help
        ;;
esac