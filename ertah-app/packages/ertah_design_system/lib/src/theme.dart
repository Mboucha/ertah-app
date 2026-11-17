// GENERATED from Figma "Ertah app 27" variables — do not edit by hand.
// Source: https://www.figma.com/design/oIMhGYwGltjjk0Kz6p8ZnL/Ertah-app-27
// Regenerate: see design-system/README.md

import 'package:flutter/material.dart';

import 'tokens/colors.dart';
import 'tokens/dimensions.dart';
import 'tokens/typography.dart';

/// Builds Material [ThemeData] from Ertah tokens. Ertah-specific roles that
/// Material has no slot for (service colors, status subtle/border, etc.)
/// live in the [ErtahColors] extension.
abstract final class ErtahTheme {
  static ThemeData light() => _build(Brightness.light, ErtahColors.light);
  static ThemeData dark() => _build(Brightness.dark, ErtahColors.dark);

  static ThemeData _build(Brightness b, ErtahColors c) {
    final scheme = ColorScheme(
      brightness: b,
      primary: c.actionPrimary,
      onPrimary: c.textInverse,
      primaryContainer: c.actionPrimarySubtle,
      onPrimaryContainer: c.textLink,
      secondary: c.brandPrimary,
      onSecondary: c.textInverse,
      secondaryContainer: c.brandPrimarySubtle,
      onSecondaryContainer: c.textBrand,
      tertiary: c.accentCyan,
      onTertiary: c.textInverse,
      error: c.statusDanger,
      onError: c.textInverse,
      errorContainer: c.statusDangerSubtle,
      onErrorContainer: c.textDanger,
      surface: c.bgSurface,
      onSurface: c.textPrimary,
      onSurfaceVariant: c.textSecondary,
      surfaceContainerLowest: c.bgSurface,
      surfaceContainerLow: c.bgSubtle,
      surfaceContainer: c.bgCanvas,
      surfaceContainerHigh: c.bgMuted,
      outline: c.borderDefault,
      outlineVariant: c.borderSubtle,
      inverseSurface: c.bgInverse,
      onInverseSurface: c.textInverse,
      scrim: c.bgOverlay,
      shadow: c.bgOverlay,
    );

    TextStyle t(TextStyle s, Color col) => s.copyWith(color: col);
    final text = TextTheme(
      displayLarge: t(ErtahTypography.display, c.textPrimary),
      headlineLarge: t(ErtahTypography.h1, c.textPrimary),
      headlineMedium: t(ErtahTypography.h2, c.textPrimary),
      headlineSmall: t(ErtahTypography.h3, c.textPrimary),
      titleLarge: t(ErtahTypography.title16Bold, c.textPrimary),
      titleMedium: t(ErtahTypography.body15Bold, c.textPrimary),
      titleSmall: t(ErtahTypography.body14Bold, c.textPrimary),
      bodyLarge: t(ErtahTypography.body15Regular, c.textPrimary),
      bodyMedium: t(ErtahTypography.body14Regular, c.textPrimary),
      bodySmall: t(ErtahTypography.body13Regular, c.textSecondary),
      labelLarge: t(ErtahTypography.body14Medium, c.textPrimary),
      labelMedium: t(ErtahTypography.caption12Medium, c.textSecondary),
      labelSmall: t(ErtahTypography.micro11, c.textTertiary),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: b,
      colorScheme: scheme,
      fontFamily: ErtahTypography.fontFamily,
      textTheme: text,
      scaffoldBackgroundColor: c.bgCanvas,
      dividerColor: c.borderSubtle,
      iconTheme: IconThemeData(color: c.iconDefault, size: 24),
      extensions: <ThemeExtension<dynamic>>[c],
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.bgSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ErtahRadius.lg),
          borderSide: BorderSide(color: c.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ErtahRadius.lg),
          borderSide: BorderSide(color: c.borderDefault),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ErtahRadius.lg),
          borderSide: BorderSide(color: c.borderFocus, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ErtahRadius.lg),
          borderSide: BorderSide(color: c.statusDanger),
        ),
        hintStyle: ErtahTypography.body14Regular.copyWith(color: c.textTertiary),
      ),
    );
  }
}

/// `context.ertahColors.textPrimary` etc.
extension ErtahThemeContext on BuildContext {
  ErtahColors get ertahColors => Theme.of(this).extension<ErtahColors>()!;
}
