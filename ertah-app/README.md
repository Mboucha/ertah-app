# Ertah

Design system and design references for the Ertah app.

**Source of truth:** Figma file [Ertah app 27](https://www.figma.com/design/oIMhGYwGltjjk0Kz6p8ZnL/Ertah-app-27). Colors, typography, spacing, radii, elevation, components, icons and layout patterns come from that file. If something isn't in it, propose an addition to the Figma file first, then regenerate here.

| Path | What it is |
|---|---|
| `design-system/tokens/` | Design tokens in the W3C Design Tokens (DTCG) format: primitives, semantic light/dark, typography, dimensions, effects |
| `design-system/figma-index.md` | Linked index of every design-system section and every app flow in Figma |
| `design-system/screens-index.md` | Every screen section, Arabic (RTL) next to its English (LTR) twin, with frame counts |
| `design-system/flows.md` | Sections of the FigJam board *Ertah App · Service Flows*, mapped to screen sections |
| `design-system/figma-manifest.json` | Machine-readable node IDs used by the export script |
| `design-system/screens/`, `screens-en/`, `flows/` | PNG references (created by `tool/figma_export.py screens`, `screens-en`, `flows`) |
| `packages/ertah_design_system/` | Flutter package: `ErtahColors` (light/dark `ThemeExtension`), `ErtahTypography`, `ErtahSpacing`, `ErtahRadius`, `ErtahShadows`, `ErtahTheme`; bundles IBM Plex Sans Arabic and Inter |
| `tool/figma_export.py` | Pulls icons, car logos, screen PNGs and FigJam flow PNGs from Figma with your token |
| `CHANGELOG.md` | What changed in each sync from Figma |

See [`design-system/README.md`](design-system/README.md) for usage and known gaps.
