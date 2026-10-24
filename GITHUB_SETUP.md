# GitHub editing and deployment notes

## Upload to GitHub

Create an empty private repository, then run from this project folder:

```bash
git init
git add .
git commit -m "Initial Rect Nexus source"
git branch -M main
git remote add origin https://github.com/YOUR_ACCOUNT/YOUR_REPOSITORY.git
git push -u origin main
```

## Install and check

```bash
corepack enable
pnpm install
pnpm exec tsc --noEmit
pnpm build
```

## Local database

The application expects a Cloudflare D1 binding named `DB`. After building, apply the SQL files in `drizzle/` in numeric order to the local D1 database. Do not apply the same migration twice.

## Authentication

Production uses these request headers supplied by ChatGPT Sites:

- `oai-authenticated-user-id`
- `oai-authenticated-user-email`

The local development helper can simulate a user session. See the starter documentation and `app/chatgpt-auth.ts`.

## Secrets

Set the TikTok Shop credentials in the deployment environment. Never place real values in source files, commits, screenshots, issues or pull requests.

## Syncing changes back to the live Site

The live Site is connected to a separate Sites Git repository. GitHub changes must be copied or cherry-picked into that repository, built, saved as a Site version and deployed. A GitHub push alone will not change the production website.
