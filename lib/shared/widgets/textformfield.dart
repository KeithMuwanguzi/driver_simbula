import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  // ignore: prefer_typing_uninitialized_variables
  final validate;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validate,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontStyle: FontStyle.italic,
          fontSize: 13,
        ),
      ),
    );
  }
}
