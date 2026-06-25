import 'package:flutter/material.dart';

class VoxAiTheme {
  static const Color background = Color(0xFF030712);
  static const Color surface = Color(0xFF111827);
  static const Color surfaceElevated = Color(0xFF1F2937);
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF3B82F6);
  static const Color accent = Color(0xFFC084FC);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color border = Color(0x1AFFFFFF);
  static const Color glowPurple = Color(0xFF8B5CF6);
  static const Color glowBlue = Color(0xFF60A5FA);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: surface,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: textPrimary,
        fontSize: 34,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
        height: 1.05,
      ),
      bodyLarge: TextStyle(
        color: textSecondary,
        fontSize: 16,
        height: 1.5,
      ),
    ),
  );
}
