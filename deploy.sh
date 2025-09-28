#!/bin/bash

# Deploy script for Giraf Wiki
# Builds Jekyll site locally and uploads to static hosting via FTP
# Usage: ./deploy.sh

echo "🚀 Building and deploying Giraf Wiki..."

# Load FTP credentials from .env file
if [ -f ".env" ]; then
    echo "🔐 Loading credentials from .env..."
    export $(grep -v '^#' .env | xargs)
else
    echo "❌ Error: .env file not found!"
    echo "Copy .env.example to .env and fill in your FTP credentials"
    exit 1
fi

# Check if credentials are set
if [ -z "$FTP_HOST" ] || [ -z "$FTP_USER" ] || [ -z "$FTP_PASS" ]; then
    echo "❌ Error: Missing FTP credentials in .env file"
    echo "Please check your .env file has FTP_HOST, FTP_USER, and FTP_PASS"
    exit 1
fi

# Check if Jekyll is available
if ! command -v bundle &> /dev/null; then
    echo "❌ Error: Bundler not found. Please install Ruby and Bundler first."
    exit 1
fi

# Install dependencies if needed
if [ ! -d "vendor/bundle" ]; then
    echo "📦 Installing dependencies..."
    bundle install --path vendor/bundle
fi

# Build the site
echo "📦 Building Jekyll site..."
JEKYLL_ENV=production bundle exec jekyll build

if [ $? -ne 0 ]; then
    echo "❌ Jekyll build failed!"
    exit 1
fi

# Check if lftp is available
if ! command -v lftp &> /dev/null; then
    echo "❌ Error: lftp not found. Please install lftp for FTP uploads."
    echo "Ubuntu/Debian: sudo apt install lftp"
    echo "macOS: brew install lftp"
    exit 1
fi

# Deploy via FTP
echo "🌐 Uploading to $FTP_HOST..."
lftp -c "
set ftp:ssl-allow no
open -u $FTP_USER,$FTP_PASS ftp://$FTP_HOST
lcd _site
mirror --reverse --delete --verbose --exclude-glob .git*
bye
"

if [ $? -eq 0 ]; then
    echo "✅ Done! Your Giraf Wiki should be live."
else
    echo "❌ Upload failed. Check your FTP credentials and connection."
    exit 1
fi