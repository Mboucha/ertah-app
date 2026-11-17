# Ertah design system

Generated from the variables and styles in Figma **Ertah app 27** (page *Design System*, section *1 · Foundations*).

## Tokens

| File | Contents |
|---|---|
| `tokens/color.primitives.json` | 97 primitive colors: navy, blue, purple, cyan, green, amber, orange, red, crimson, base, dark, extended, illustration |
| `tokens/color.semantic.light.json` | 56 semantic roles (text, bg, border, brand, action, status, icon, service, accent), aliased to primitives |
| `tokens/color.semantic.dark.json` | Same 56 roles, dark mode |
| `tokens/typography.json` | DIN Next LT Arabic; 18 text styles from Display 34 to Micro 11 |
| `tokens/dimension.json` | Spacing 0–64 and radius none → full (999) |
| `tokens/effect.json` | Shadows: card, popover, modal, focus ring |

Each semantic token's `$value` references its primitive (for example `{color.navy.900}`), and `$extensions["ertah.resolved"]` holds the resolved hex. The format works with Style Dictionary and Tokens Studio.

## Flutter

```yaml
# app pubspec.yaml
dependencies:
  ertah_design_system:
    path: packages/ertah_design_system
```

```dart
import 'package:ertah_design_system/ertah_design_system.dart';

MaterialApp(
  theme: ErtahTheme.light(),
  darkTheme: ErtahTheme.dark(),
  locale: const Locale('ar'), // the designs are RTL-first
);

// In a widget
final c = context.ertahColors;
Text('تقاريري', style: ErtahTypography.h3.copyWith(color: c.textPrimary));
Container(
  padding: const EdgeInsets.all(ErtahSpacing.s16),
  decoration: BoxDecoration(
    color: c.bgSurface,
    borderRadius: BorderRadius.circular(ErtahRadius.xxl),
    boxShadow: ErtahShadows.card,
  ),
);
```

Radius names map like this: `2xl → xxl`, `3xl → xxxl`, `4xl → xxxxl`, because Dart identifiers can't start with a digit.

## Assets and screen references

Run `python3 tool/figma_export.py all` with `FIGMA_TOKEN` set. It exports:

- Icons (UI 24px, service and navigation 22px, dashboard warning lights 28px, service icons) as SVG into `packages/ertah_design_system/assets/icons/`
- Car logos as SVG into `packages/ertah_design_system/assets/logos/`
- Every screen in the Mobile App page as PNG @2x into `design-system/screens/<flow>/`

Then register the folders under `flutter: assets:` in the package pubspec and add `flutter_svg` to render the SVGs.

## Components

Components (Button, Input, Card, Bottom navigation, the Ertah domain patterns, and so on) live in Figma and are indexed in [`figma-index.md`](figma-index.md). This package ships tokens and the theme only. Flutter widgets for each component get added here as they're built, mapped one-to-one to the Figma components.

## Known gaps and proposals

These are inconsistencies found while extracting tokens. Fix them in Figma first, then regenerate.

1. **Font licence.** DIN Next LT Arabic is a commercial font, so it isn't in this repo. Add the licensed `.ttf` files to `packages/ertah_design_system/fonts/` and uncomment the `fonts:` block in its pubspec. `.gitignore` keeps them out of a public repo.
2. **`Micro/11 Bold` is not bold.** The style uses weight 400 (Regular). Either rename it to `Micro/11 Regular` or set it to weight 700. The token is exported as `micro11` with weight 400, matching Figma as it stands.
3. **`bg-overlay` has no opacity.** It equals `navy-900` in light mode and black in dark mode, fully opaque. A scrim needs alpha, so the proposal is to add `bg-overlay` at around 48% opacity in both modes.
4. **Service colors overlap.** `service-einvoice`, `service-payments` and `service-jobcard` are all the same blue (`#1b68ff`). If these services should be visually distinct on the home grid, they need their own hues.
5. **No dark values for shadows.** Shadows use one value in both modes. A light-tinted card shadow (`#e2e8f0` at 60%) won't read on the dark canvas, so the proposal is a dark-mode shadow variable.
