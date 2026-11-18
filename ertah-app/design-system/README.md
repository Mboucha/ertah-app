# Ertah design system

Generated from the variables and styles in Figma **Ertah app 27** (page *Design System*, section *1 · Foundations*).

## Tokens

| File | Contents |
|---|---|
| `tokens/color.primitives.json` | 97 primitive colors: navy, blue, purple, cyan, green, amber, orange, red, crimson, base, dark, extended, illustration |
| `tokens/color.semantic.light.json` | 56 semantic roles (text, bg, border, brand, action, status, icon, service, accent), aliased to primitives |
| `tokens/color.semantic.dark.json` | Same 56 roles, dark mode |
| `tokens/typography.json` | IBM Plex Sans Arabic (Arabic mode) / Inter (English mode); 18 text styles from Display 34 to Micro 11 |
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
// English (LTR): ErtahTheme.light(locale: const Locale('en')) — see "English / LTR" below.


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

## English / LTR

Figma has an English version of every screen (page *Mobile App · English*) and a `Direction = RTL | LTR` variant property on 69 component sets. The Typography collection has two modes: **Arabic** (IBM Plex Sans Arabic) and **English** (Inter). Sizes, weights and line heights are identical.

In Flutter:

```dart
MaterialApp(
  locale: locale,                                   // Locale('ar') or Locale('en')
  supportedLocales: const [Locale('ar'), Locale('en')],
  localizationsDelegates: GlobalMaterialLocalizations.delegates, // from flutter_localizations
  theme: ErtahTheme.light(locale: locale),          // picks IBM Plex Sans Arabic or Inter
  darkTheme: ErtahTheme.dark(locale: locale),
);
```

- **Direction:** MaterialApp sets RTL for `ar` and LTR for `en` from the locale once the `flutter_localizations` delegates are registered. That is an app-level dependency (part of the Flutter SDK), so it's not added to this package. Use `EdgeInsetsDirectional`, `AlignmentDirectional` and `start`/`end` instead of `left`/`right` so layouts mirror on their own.
- **Fonts:** text styles from the theme switch automatically. If you use an `ErtahTypography` constant directly, wrap it: `ErtahTypography.forLocale(ErtahTypography.h3, Localizations.localeOf(context))`.
- **Keep, don't mirror** (same rules as Figma section *13 · English (LTR)*): Plate, Plate input, Amount, OTP input, logos, flags, warning-light glyphs, Service icon, QR, Avatar, Empty state, phone/currency prefix rows, and the car top-view diagram (physical left/right).
- **Stays Arabic on English screens:** Ertah wordmark, elm logo text, "العربية" in the language picker, plate glyphs, customer WhatsApp message previews. In English, Inter falls back to IBM Plex Sans Arabic for these strings.

## Assets and screen references

Run `python3 tool/figma_export.py all` with `FIGMA_TOKEN` set. It exports:

- Icons (UI 24px, service and navigation 22px, dashboard warning lights 28px, service icons) as SVG into `packages/ertah_design_system/assets/icons/`
- Car logos as SVG into `packages/ertah_design_system/assets/logos/`
- Every screen in the Mobile App page as PNG @2x into `design-system/screens/<flow>/`
- Every screen in the Mobile App · English page as PNG @2x into `design-system/screens-en/<flow>/`
- Each section of the FigJam board *Ertah App · Service Flows* as PNG into `design-system/flows/service-flows/`

Single parts: `icons`, `screens`, `screens-en`, `flows`. Indexes: [`screens-index.md`](screens-index.md), [`flows.md`](flows.md).

Then register the folders under `flutter: assets:` in the package pubspec and add `flutter_svg` to render the SVGs.

## Components

Components (Button, Input, Card, Bottom navigation, the Ertah domain patterns, and so on) live in Figma and are indexed in [`figma-index.md`](figma-index.md). This package ships tokens and the theme only. Flutter widgets for each component get added here as they're built, mapped one-to-one to the Figma components.

## Known gaps and proposals

These are inconsistencies found while extracting tokens. Fix them in Figma first, then regenerate.

1. **Plates in English text.** Plate strings such as "2124 أ-ب-أ" mix Arabic letters into LTR text, so the bidi order can look scrambled. Proposal: use the Plate component in English contexts, or a Latin form ("2124 A-B-A"). Open question in Figma.
2. **`Micro/11 Bold` is not bold.** The style uses weight 400 (Regular). Either rename it to `Micro/11 Regular` or set it to weight 700. The token is exported as `micro11` with weight 400, matching Figma as it stands.
3. **`bg-overlay` has no opacity.** It equals `navy-900` in light mode and black in dark mode, fully opaque. A scrim needs alpha, so the proposal is to add `bg-overlay` at around 48% opacity in both modes.
4. **Service colors overlap.** `service-einvoice`, `service-payments` and `service-jobcard` are all the same blue (`#1b68ff`). If these services should be visually distinct on the home grid, they need their own hues.
5. **No dark values for shadows.** Shadows use one value in both modes. A light-tinted card shadow (`#e2e8f0` at 60%) won't read on the dark canvas, so the proposal is a dark-mode shadow variable.
