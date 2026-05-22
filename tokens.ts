// Canonical brand tokens for Stacy's Digital Playground apps.
// Source of truth. Mirrored from the marketing site's app/lib/brand.ts.
// When tokens change, update here first then propagate via `git pull` in each consuming app.

export const C = {
  bg: "#08080f",
  bgAlt: "#0f0f1a",
  cardBg: "#0d0d18",
  cardBgRaised: "#11111e",
  rose: "#89335C",
  pink: "#F7B5D6",
  pinkBright: "#FFB8D9",
  neonPurple: "#D4A0FF",
  green: "#5AEAA0",
  red: "#FF8A8A",
  white: "#FFFFFF",
  text: "#EDE8F0",
  textLight: "#A599AE",
  textMuted: "#6E6279",
  border: "rgba(247,181,214,0.08)",
  borderActive: "rgba(247,181,214,0.25)",
  pinkGlow: "rgba(247,181,214,0.12)",
} as const;

export const FONT = {
  body: '"Nunito", system-ui, -apple-system, sans-serif',
} as const;

export const COMPANY = {
  legalName: "Reel Influence Media, LLC",
  brandName: "Stacy's Digital Playground",
  founder: "Stacy",
  location: "Bakersfield, CA",
  state: "California",
  domain: "stacysdigitalplayground.com",
  contactEmail: "stacy@stacysdigitalplayground.com",
  marketingUrl: "https://www.stacysdigitalplayground.com",
} as const;

export const SOCIAL = {
  instagram: "https://www.instagram.com/stacysdigitalplayground",
  tiktok: "https://www.tiktok.com/@stacysdigitalplayground",
  email: "stacy@stacysdigitalplayground.com",
} as const;

export const pageBackground = `linear-gradient(180deg, ${C.bg} 0%, ${C.bgAlt} 40%, ${C.bg} 100%)`;
