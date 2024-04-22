import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textStyleSmall = GoogleFonts.roboto(
  fontSize: 13,
);

final textStyleBold = GoogleFonts.roboto(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

getStyle(
    {required Color color,
    required double fontSize,
    required bool isBold,
    required bool isItalic}) {
  return GoogleFonts.roboto(
    fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    fontSize: fontSize,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    color: color,
  );
}

const primaryColor = Color.fromARGB(255, 27, 5, 124);
