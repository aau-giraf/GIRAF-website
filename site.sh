#!/bin/bash

# GIRAF website helper - shortcuts for common tasks
# Usage: ./site.sh [command]

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

show_help() {
    echo -e "${BLUE}GIRAF website helper${NC}"
    echo ""
    echo "Content:"
    echo "  ./site.sh post [title]  - Create a new blog post in _posts/"
    echo "  ./site.sh draft [title] - Create a draft post in _drafts/"
    echo ""
    echo "Development:"
    echo "  ./site.sh serve         - Start dev server (http://127.0.0.1:4000)"
    echo "  ./site.sh drafts        - Dev server including drafts + livereload"
    echo "  ./site.sh build         - Production build into _site/"
    echo ""
    echo "Publishing:"
    echo "  ./site.sh deploy        - Build and rsync _site/ to the Hetzner box over SSH"
    echo ""
    echo "Utilities:"
    echo "  ./site.sh status        - Show post counts and build status"
    echo "  ./site.sh clean         - Remove build artifacts"
}

case "$1" in
    "post")
        ./new-post.sh "$2"
        ;;
    "draft")
        ./new-post.sh "$2" --draft
        ;;
    "serve")
        echo -e "${BLUE}Starting dev server...${NC}"
        bundle exec jekyll serve
        ;;
    "drafts")
        echo -e "${BLUE}Starting dev server with drafts...${NC}"
        bundle exec jekyll serve --drafts --livereload
        ;;
    "build")
        echo -e "${BLUE}Building site...${NC}"
        JEKYLL_ENV=production bundle exec jekyll build
        ;;
    "deploy")
        ./deploy.sh
        ;;
    "status")
        echo -e "${BLUE}Site status${NC}"
        echo "Blog posts:  $(ls -1 _posts/*.md 2>/dev/null | grep -v '0000-00-00' | wc -l)"
        echo "Draft posts: $(ls -1 _drafts/*.md 2>/dev/null | wc -l)"
        if [ -d "_site" ]; then
            echo -e "${GREEN}Site built${NC} ($(du -sh _site | cut -f1))"
        else
            echo -e "${YELLOW}Site not built${NC}"
        fi
        ;;
    "clean")
        echo -e "${YELLOW}Cleaning build artifacts...${NC}"
        rm -rf _site .sass-cache .jekyll-cache .jekyll-metadata
        echo -e "${GREEN}Done${NC}"
        ;;
    *)
        show_help
        ;;
esac
