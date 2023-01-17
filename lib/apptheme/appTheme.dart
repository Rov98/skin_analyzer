
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_tone_scanner/constant/constant.dart';

class AppTheme {
  ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.transparent,
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.montserrat(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.montserrat(
        color: mainAppColor,
        fontWeight: FontWeight.w300,
      )
    )
  );
}