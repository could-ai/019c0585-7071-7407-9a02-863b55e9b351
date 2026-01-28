import 'package:flutter/material.dart';

class AppColors {
  // Base Palette (Slate/Zinc approximation for Shadcn)
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  
  static const Color slate50 = Color(0xFFF8FAFC);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);
  static const Color slate950 = Color(0xFF020617);

  static const Color red500 = Color(0xFFEF4444);
  static const Color red600 = Color(0xFFDC2626);

  // Semantic Colors (Matching tailwind.config.ts)
  static const Color background = white;
  static const Color foreground = slate950;
  
  static const Color card = white;
  static const Color cardForeground = slate950;
  
  static const Color popover = white;
  static const Color popoverForeground = slate950;
  
  static const Color primary = slate900;
  static const Color primaryForeground = slate50;
  
  static const Color secondary = slate100;
  static const Color secondaryForeground = slate900;
  
  static const Color muted = slate100;
  static const Color mutedForeground = slate500;
  
  static const Color accent = slate100;
  static const Color accentForeground = slate900;
  
  static const Color destructive = red500;
  static const Color destructiveForeground = slate50;
  
  static const Color border = slate200;
  static const Color input = slate200;
  static const Color ring = slate900;

  // Sidebar Specific (from tailwind.config.ts)
  static const Color sidebarBackground = slate50; // Often slightly different
  static const Color sidebarForeground = slate700;
  static const Color sidebarPrimary = slate900;
  static const Color sidebarPrimaryForeground = white;
  static const Color sidebarAccent = slate200;
  static const Color sidebarAccentForeground = slate900;
  static const Color sidebarBorder = slate200;
  static const Color sidebarRing = slate300;
}
