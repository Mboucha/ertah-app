# Ertah

Design system and design references for the Ertah app.

**Source of truth:** Figma file [Ertah app 27](https://www.figma.com/design/oIMhGYwGltjjk0Kz6p8ZnL/Ertah-app-27). Colors, typography, spacing, radii, elevation, components, icons and layout patterns come from that file. If something isn't in it, propose an addition to the Figma file first, then regenerate here.

| Path | What it is |
|---|---|
| `design-system/tokens/` | Design tokens in the W3C Design Tokens (DTCG) format: primitives, semantic light/dark, typography, dimensions, effects |
| `design-system/figma-index.md` | Linked index of every design-system section and every app flow in Figma |
| `design-system/figma-manifest.json` | Machine-readable node IDs used by the export script |
| `design-system/screens/` | PNG references of every screen (created by `tool/figma_export.py screens`) |
| `packages/ertah_design_system/` | Flutter package: `ErtahColors` (light/dark `ThemeExtension`), `ErtahTypography`, `ErtahSpacing`, `ErtahRadius`, `ErtahShadows`, `ErtahTheme` |
| `tool/figma_export.py` | Pulls icons, car logos and screen PNGs from Figma with your token |

See [`design-system/README.md`](design-system/README.md) for usage and known gaps.
