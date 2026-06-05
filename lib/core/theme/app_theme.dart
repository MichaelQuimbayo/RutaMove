import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _primaryColor = Color(0xFF0047AB);
//const Color _secondaryColor = Color(0xFFFFFDD0);

final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
  seedColor: _primaryColor,
  brightness: Brightness.light,
  primary: _primaryColor,
  surface: const Color(0xFFFFFDD0),
);

final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
  seedColor: _primaryColor,
  brightness: Brightness.dark,
  primary: _primaryColor,
  surface: const Color(0xFF1A1C1E),
);

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: GoogleFonts.interTextTheme(),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    textTheme: GoogleFonts.interTextTheme(),
  );
}
