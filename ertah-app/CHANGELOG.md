# Changelog

Syncs from the Figma file **Ertah app 27** into this repo. Figma stays the source of truth.

## 0.3.0 · 2026-11-18 · English (LTR)

- **Fonts per language.** Figma's Typography collection now has two modes: Arabic = IBM Plex Sans Arabic, English = Inter. `ErtahTypography` adds `fontFamilyArabic`, `fontFamilyEnglish`, `fontFamilyFor(locale)` and `forLocale(style, locale)`. `ErtahTheme.light/dark` take an optional `locale` (default `ar`). In English, Inter falls back to IBM Plex Sans Arabic for Arabic strings that stay Arabic (plates, "العربية", customer message previews).
- **Inter bundled** in `packages/ertah_design_system/fonts/` (OFL 1.1) and registered in the pubspec.
- **English screens indexed.** New page *Mobile App · English* (`189:17631`): 35 `EN · …` sections, one per Arabic section. Added to `figma-manifest.json` › `englishScreenSections`, `figma-index.md` and the new `screens-index.md`.
- **Design System section 13 · English (LTR)** (`192:1716`) added to the manifest and index. `Direction = RTL | LTR` is now on 69 component sets in Figma.
- `figma_export.py screens-en` exports the English screens to `design-system/screens-en/`.
- `design-system/README.md`: new *English / LTR* section (how to switch locale, direction, mirror-vs-keep rules).
- Open question (Figma): plate strings like "2124 أ-ب-أ" in LTR text render with mixed bidi order. Logged under *Known gaps*.

No changes to colors, spacing, radius or shadows.

## 0.2.0 · 2026-11-17

- **Font family:** DIN Next LT Arabic → IBM Plex Sans Arabic (open source, OFL 1.1). The font files are now in the repo and the pubspec `fonts:` block is active; the licensing gap is closed.
- **New Mobile App sections** added to the manifest and indexes: IFP check-in report (`162:14053`), IFP check-out & maintenance report (`176:19426`), Job card check-in/out reports (`164:15458`), E-invoicing B2B customer (`180:15819`), credit note (`181:16208`), phased onboarding update (`182:16614`) and link payment request (`183:17080`).
- **FigJam board** *Ertah App · Service Flows* (15 sections) added to the manifest under `figjamBoards`, with `design-system/flows.md`. The board doesn't cover the 7 new sections yet.
- `figma_export.py flows` exports each board section as PNG to `design-system/flows/`.
- New `design-system/screens-index.md` and this changelog.
- Design System section 10 renamed in Figma to *10 · Web app (desktop & mobile web)*; index updated.

Still open in Figma: `Micro/11 Bold` uses weight 400, `bg-overlay` is opaque, `service-einvoice` / `service-payments` / `service-jobcard` share `#1b68ff`, no dark-mode shadows.

## 0.1.0

- First export: tokens (primitives, semantic light/dark, typography, dimensions, effects), Flutter package `ertah_design_system`, Figma index and `figma_export.py icons|screens`.
