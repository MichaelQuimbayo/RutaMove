import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- 1. Definición de Colores Base ---
const Color _primaryColor = Color(0xFF0047AB);
const Color _secondaryColor = Color(0xFFFFFDDE); // Corregido ligeramente para no ser tan brillante
const Color _tertiaryColor = Color(0xFF8B2E01);

// Colores de superficie para cada tema
const Color _lightSurface = Color(0xFFFFFEF2);
const Color _darkSurface = Color(0xFF1A1C1E); // Un gris oscuro azulado

// --- 2. Creación de ColorScheme (Claro y Oscuro) ---

// ColorScheme para el Tema Claro
final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
  seedColor: _primaryColor,
  brightness: Brightness.light,
  primary: _primaryColor,
  secondary: _secondaryColor,
  tertiary: _tertiaryColor,
  surface: _lightSurface,
  onSurface: const Color(0xFF1A1C1E), // Color de texto oscuro para fondo claro
);

// ColorScheme para el Tema Oscuro
final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
  seedColor: _primaryColor,
  brightness: Brightness.dark,
  primary: _primaryColor,
  secondary: _secondaryColor,
  tertiary: _tertiaryColor,
  surface: _darkSurface,
  onSurface: const Color(0xFFE2E2E6), // Color de texto claro para fondo oscuro
);

// --- 3. Creación de TextTheme (Claro y Oscuro) ---

// TextTheme para el Tema Claro
final TextTheme _lightTextTheme = TextTheme(
  headlineLarge: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
  headlineMedium: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
  headlineSmall: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
  bodyLarge: GoogleFonts.inter(),
  bodyMedium: GoogleFonts.inter(),
  labelLarge: GoogleFonts.inter(fontWeight: FontWeight.w500),
).apply(
  bodyColor: _lightColorScheme.onSurface,
  displayColor: _lightColorScheme.onSurface,
);

// TextTheme para el Tema Oscuro
final TextTheme _darkTextTheme = TextTheme(
  headlineLarge: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
  headlineMedium: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
  headlineSmall: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
  bodyLarge: GoogleFonts.inter(),
  bodyMedium: GoogleFonts.inter(),
  labelLarge: GoogleFonts.inter(fontWeight: FontWeight.w500),
).apply(
  bodyColor: _darkColorScheme.onSurface,
  displayColor: _darkColorScheme.onSurface,
);


// --- 4. Clase Principal del Tema ---

class AppTheme {
  // --- TEMA CLARO ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    textTheme: _lightTextTheme,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: _lightColorScheme.surface,
      foregroundColor: _lightColorScheme.onSurface,
    ),
    inputDecorationTheme: _inputDecorationTheme(isDark: false),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
    ),
  );

  // --- TEMA OSCURO ---
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    textTheme: _darkTextTheme,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: _darkColorScheme.surface,
      foregroundColor: _darkColorScheme.onSurface,
    ),
    inputDecorationTheme: _inputDecorationTheme(isDark: true),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: _darkColorScheme.outlineVariant.withOpacity(0.5)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _darkColorScheme.primary,
        foregroundColor: _darkColorScheme.onPrimary,
      ),
    ),
  );

  static InputDecorationTheme _inputDecorationTheme({required bool isDark}) {
    final colorScheme = isDark ? _darkColorScheme : _lightColorScheme;
    
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: colorScheme.outlineVariant, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: colorScheme.error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: colorScheme.error, width: 2.0),
      ),
    );
  }
}
