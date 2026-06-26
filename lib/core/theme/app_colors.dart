import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF030712);
  static const Color surface = Color(0xFF111827);
  static const Color surfaceElevated = Color(0xFF1F2937);
  
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF3B82F6);
  static const Color accent = Color(0xFFC084FC);
  
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textMuted = Color(0xFF6B7280);
  
  static const Color border = Color(0x1AFFFFFF);
  static const Color error = Color(0xFFEF4444);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
