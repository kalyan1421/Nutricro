import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes{
  static final light= ThemeData(
      primaryColor: Colors.blue,
      brightness: Brightness.light
  );
}
TextStyle get subHeadingStyle{
  return GoogleFonts.oswald(
      textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.normal
      )
  );
}
TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.normal
      )
  );
}