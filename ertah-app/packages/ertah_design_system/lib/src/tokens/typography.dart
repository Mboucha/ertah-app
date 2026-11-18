// GENERATED from Figma "Ertah app 27" variables — do not edit by hand.
// Source: https://www.figma.com/design/oIMhGYwGltjjk0Kz6p8ZnL/Ertah-app-27
// Regenerate: see design-system/README.md

import 'dart:ui' show Locale;

import 'package:flutter/painting.dart';

/// Text styles (Figma: 1 · Foundations › Typography). Colorless by design —
/// apply a color from [ErtahColors], e.g. `ErtahTypography.body15Regular.copyWith(color: c.textPrimary)`.
///
/// Figma variable `font-family/primary` has two modes:
/// **Arabic** = IBM Plex Sans Arabic, **English** = Inter. Sizes, weights and
/// line heights are the same in both modes. The constants below use the Arabic
/// family; for English, use [ErtahTheme.light]/[ErtahTheme.dark] with
/// `locale: Locale('en')` (the theme's text styles switch to Inter), or call
/// [forLocale] on a style you use directly.
abstract final class ErtahTypography {
  /// Figma: font-family/primary · mode Arabic
  static const fontFamilyArabic = 'IBM Plex Sans Arabic';

  /// Figma: font-family/primary · mode English
  static const fontFamilyEnglish = 'Inter';

  /// Default (RTL-first) family, used by the constants below.
  static const fontFamily = fontFamilyArabic;

  /// Inter has no Arabic glyphs, so English text falls back to IBM Plex Sans
  /// Arabic for Arabic strings that stay Arabic on English screens
  /// (plates, "العربية", customer message previews).
  static const fontFamilyFallbackEnglish = <String>[fontFamilyArabic];

  /// Family for a locale: Inter for `en`, IBM Plex Sans Arabic otherwise.
  static String fontFamilyFor(Locale locale) =>
      locale.languageCode == 'en' ? fontFamilyEnglish : fontFamilyArabic;

  /// Returns [style] with the family for [locale] (and the Arabic fallback in English).
  static TextStyle forLocale(TextStyle style, Locale locale) =>
      locale.languageCode == 'en'
          ? style.copyWith(
              fontFamily: fontFamilyEnglish,
              fontFamilyFallback: fontFamilyFallbackEnglish,
            )
          : style.copyWith(fontFamily: fontFamilyArabic);

  /// Figma: Display/34 Bold
  static const display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Figma: Heading/H1 · 26 Bold
  static const h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Figma: Heading/H2 · 22 Bold
  static const h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Figma: Heading/H3 · 18 Bold
  static const h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: 0,
  );

  /// Figma: Title/16 Bold
  static const title16Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Body/15 Regular
  static const body15Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Figma: Body/15 Medium
  static const body15Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Figma: Body/15 Bold
  static const body15Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: 0,
  );

  /// Figma: Body/14 Regular
  static const body14Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Body/14 Medium
  static const body14Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Body/14 Bold
  static const body14Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Body/13 Regular
  static const body13Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Body/13 Medium
  static const body13Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Body/13 Bold
  static const body13Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Caption/12 Regular
  static const caption12Regular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Caption/12 Medium
  static const caption12Medium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Caption/12 Bold
  static const caption12Bold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );

  /// Figma: Micro/11 Bold
  static const micro11 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 0,
  );
}
