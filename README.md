# sdp-brand-assets

Canonical brand assets for every Stacy's Digital Playground app — owned by Reel Influence Media, LLC.

This repo is the single source of truth for:
- **Logo** (`logo.svg`)
- **Favicons** (`favicons/` — full set: 16/32/180/192/512 PNGs, ICO, maskable)
- **Color tokens** (`tokens.ts` and `tokens.json`)
- **Company info** (legal name, location, contact email, marketing URL)

When any of these change, update here first, commit, push, then `sync.sh` in each consuming app to propagate.

## How apps consume this

Clone this repo to `~/sdp-brand-assets` on every dev machine:

```bash
cd ~
git clone git@github.com:StacyHawley/sdp-brand-assets.git
```

Then in each consuming app's repo root:

```bash
bash ~/sdp-brand-assets/sync.sh
```

This copies `logo.svg` and favicons into `public/`, and writes `tokens.ts` to `app/lib/brand.ts`.

To pull updates:

```bash
cd ~/sdp-brand-assets && git pull
# then in each consuming app:
bash ~/sdp-brand-assets/sync.sh
```

## Updating the logo

1. Replace `logo.svg` (and regenerate favicons in `favicons/` using https://realfavicongenerator.net).
2. Commit and push.
3. Re-run `sync.sh` in each consuming app and redeploy.

## Updating tokens

Edit `tokens.ts` and `tokens.json` together (keep them in sync). Commit, push, re-sync in apps.

## Why a separate repo?

- Logos and colors change rarely but apply everywhere. Centralizing avoids drift between apps.
- Apps shouldn't depend on the marketing site repo just to get brand assets.
- A small dedicated repo is faster to clone and easier to audit than pulling assets from a larger one.

## License

UNLICENSED. Property of Reel Influence Media, LLC. Internal use only.
