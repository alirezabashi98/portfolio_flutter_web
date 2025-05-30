import 'package:flutter/material.dart';
import 'package:portfolio/style/app_colors.dart';
import 'package:portfolio/style/app_instes.dart';

class AppTheme {
  final String fontFamily;
  AppTheme({required this.fontFamily});

  ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.darkBackground,
      onSurface: AppColors.gray[100]!,
      outline: AppColors.gray[800],
      outlineVariant: AppColors.gray[700],
      tertiary: AppColors.gray[900],
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkBackground,
    elevatedButtonTheme: _darkElevatedButtonTextStyle,
    outlinedButtonTheme: _darkOutlinedButtonTextStyle,
    appBarTheme: AppBarTheme(color: AppColors.gray[900]!.withValues(alpha: .3)),
  );
  ThemeData get light => ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.gray[200]!,
      onSurface: AppColors.gray[700]!,
      outline: AppColors.gray[300],
      outlineVariant: AppColors.gray[600],
      tertiary: AppColors.gray[900],
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.gray[100]!,
    elevatedButtonTheme: _lightElevatedButtonTextStyle,
    outlinedButtonTheme: _lightOutlinedButtonTextStyle,
    appBarTheme: AppBarTheme(color: AppColors.gray[100]!.withValues(alpha: .3)),
  );

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlinedButtonTextStyle,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
  }) => ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
        backgroundColor: _primaryButtonStates,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: Instes.xl, vertical: 10),
        ),
        textStyle: elevatedButtonTextStyle,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
        side: _outlineButtonBorderSide,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: Instes.xl, vertical: 10),
        ),
        textStyle: outlinedButtonTextStyle,
      ),
    ),
  );

  final _primaryButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return const Color(0xff561895).withValues(alpha: .7);
    }
    return AppColors.primary;
  });

  final _outlineButtonBorderSide = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return BorderSide(
        color: const Color(0xff561895).withValues(alpha: .7),
        width: 2,
      );
    }
    return const BorderSide(color: Color(0xff561895), width: 2);
  });

  ElevatedButtonThemeData get _darkElevatedButtonTextStyle =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(const Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Instes.xl, vertical: 10),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              color: AppColors.gray[100],
              fontFamily: fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );

  OutlinedButtonThemeData get _darkOutlinedButtonTextStyle =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(const Size.fromHeight(40)),
          side: _outlineButtonBorderSide,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Instes.xl, vertical: 10),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              color: AppColors.gray[100],
              fontFamily: fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );

  ElevatedButtonThemeData get _lightElevatedButtonTextStyle =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(const Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Instes.xl, vertical: 10),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              color: AppColors.gray[100],
              fontFamily: fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );

  OutlinedButtonThemeData get _lightOutlinedButtonTextStyle =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(const Size.fromHeight(40)),
          side: _outlineButtonBorderSide,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Instes.xl, vertical: 10),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              color: AppColors.gray[100],
              fontFamily: fontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
}
