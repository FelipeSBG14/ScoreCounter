import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static primaryFont(size) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static secundaryFont(size) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  static pointsFont(size) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}
