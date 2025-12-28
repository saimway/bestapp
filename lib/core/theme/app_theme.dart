import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Glassmorphism Extension
@immutable
class GlassmorphismTheme extends ThemeExtension<GlassmorphismTheme> {
  final double blurStrength;
  final double opacity;

  const GlassmorphismTheme({
    required this.blurStrength,
    required this.opacity,
  });

  @override
  GlassmorphismTheme copyWith({double? blurStrength, double? opacity}) {
    return GlassmorphismTheme(
      blurStrength: blurStrength ?? this.blurStrength,
      opacity: opacity ?? this.opacity,
    );
  }

  @override
  GlassmorphismTheme lerp(ThemeExtension<GlassmorphismTheme>? other, double t) {
    if (other is! GlassmorphismTheme) {
      return this;
    }
    return GlassmorphismTheme(
      blurStrength: other.blurStrength, // No lerp needed typically, but could implement
      opacity: other.opacity,
    );
  }
}

class AppTheme {
  // Colors
  static const Color kMidnightBlue = Color(0xFF0F172A);
  static const Color kElectricViolet = Color(0xFF7C3AED);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kMidnightBlue,
      primaryColor: kElectricViolet,
      colorScheme: const ColorScheme.dark(
        primary: kElectricViolet,
        surface: kMidnightBlue,
        background: kMidnightBlue,
        onSurface: Colors.white,
      ),

      // Typography
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.dark().textTheme,
      ),

      // Shapes
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),

      // Extensions
      extensions: const <ThemeExtension<dynamic>>[
        GlassmorphismTheme(blurStrength: 15.0, opacity: 0.1),
      ],
    );
  }
}
