# frozen_string_literal: true

source "https://rubygems.org"

# Use the latest Jekyll
gem "jekyll", "~> 4.3"

# Use Millennial theme from GitHub for latest version
# gem "millennial", github: "LeNPaul/Millennial"

# Required for Ruby 3.4+ compatibility
gem "csv", "~> 3.0"
gem "base64"
gem "logger"
gem "erb"

# Web server for local development
gem "webrick", "~> 1.8"

# Jekyll plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-paginate", "~> 1.1"
  gem "jekyll-archives", "~> 2.2"
end

# Windows and JRuby compatibility
platforms :windows, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:windows]