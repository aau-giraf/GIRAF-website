# Giraf Wiki

A Jekyll-based documentation wiki for the Giraf project. This site is built locally and the static files are then uploaded to a hosting provider.

## Local Development

To work on the site locally, you'll need Ruby and Bundler installed.

1.  **Install Dependencies:**
    ```bash
    bundle install
    ```

2.  **Run the Development Server:**
    ```bash
    ./wiki-helper.sh serve
    ```
    This will start a local server, usually at `http://127.0.0.1:4000/`. The site will automatically rebuild when you make changes to the files.

## Managing Content

### Blog Posts and News

*   **Location:** All blog posts are located in the `_posts` directory.
*   **Creating a New Post:** To create a new blog post, run the following command:
    ```bash
    ./new-post.sh "Your Post Title"
    ```
*   **News Feed:** The "Recent News" feed on the homepage automatically displays the titles of the most recent posts.

### Featured Posts

To "lock" a post to the main area of the homepage, add `featured: true` to the front matter of the post's file.

**Example (`_posts/your-post-file.md`):**
```markdown
---
layout: post
title: "My Awesome Post"
date: 2025-09-27 00:00:00
image: 'some-image.jpg'
featured: true
---

Your post content here...
```

### Wiki Pages

*   **Location:** All wiki pages are located in the `_wiki` directory.
*   **Creating a New Wiki Page:** To create a new wiki page, run this command:
    ```bash
    ./wiki-helper.sh new "Your Page Title"
    ```

## Building and Deploying

*   **Build the Site:** To generate the static site for production, run:
    ```bash
    ./wiki-helper.sh build
    ```
    The output will be placed in the `_site` directory.

*   **Deploy:** To deploy the site, you can use the provided deployment script, which uses FTP. You will need to configure your credentials in a `.env` file (see `.env.example`).
    ```bash
    ./wiki-helper.sh deploy
    ```
