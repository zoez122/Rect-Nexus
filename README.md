# Rect Nexus

Cross-Border E-commerce Management System for personal Shopee and TikTok Shop operations.

## Current features

- Multi-store management for Shopee and TikTok Shop
- Orders, GMV, profit, stock and inventory movements
- Day, week, month and custom date filters
- MYR, CNY and USD account views
- CSV order import
- TikTok Shop seller authorization and manual order synchronization
- Cloudflare D1 database with Drizzle migrations
- Private ChatGPT Sites authentication

## Technology

- Next.js 16 + React 19 + TypeScript
- Vinext / Vite
- Cloudflare Workers + D1
- Drizzle ORM
- Recharts

## Main source files

- `app/erp.tsx`: ERP interface and client-side calculations
- `app/globals.css`: visual styles
- `app/api/erp/route.ts`: products, orders, stores and inventory API
- `app/api/tiktok/`: TikTok authorization, token handling and order sync
- `app/api/fx/route.ts`: exchange-rate reference
- `drizzle/`: D1 database migrations
- `db/schema.ts`: database schema

## Local development

Requirements: Node.js 22.13 or later and pnpm 11.

```bash
pnpm install
pnpm dev
```

For local D1 database use, build first and apply the migrations in order as described in `GITHUB_SETUP.md`.

## Production environment variables

Configure these as encrypted secrets in the hosting environment. Never commit their values.

```text
TIKTOK_SHOP_APP_KEY=
TIKTOK_SHOP_APP_SECRET=
```

## Important hosting note

The live version currently runs on ChatGPT Sites and uses platform-provided authentication headers and the `DB` D1 binding. Editing this GitHub repository does not automatically update the live Site. After making changes in GitHub, sync the commit back to the Sites source repository and publish a new Site version.
