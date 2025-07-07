import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,

    // Text Theme
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white, size: 26),
      actionsIconTheme: const IconThemeData(color: Colors.white, size: 26),
      titleTextStyle: GoogleFonts.lato(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
    ),

    // TextField Theme
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      //constraints:BoxConstraints.expand(height: KSizes.inputFieldRadius),
      labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
      hintStyle: const TextStyle().copyWith(fontSize: 12, color: Colors.grey),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),

      floatingLabelStyle:
          const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),

      border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Colors.grey)),
      enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Colors.grey)),
      focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Colors.white)),
      errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Colors.yellow)),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 2, color: Colors.red)),
    ),
  );
}
