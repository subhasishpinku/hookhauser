import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget primaryButton(BuildContext context,
    {String? label, Function()? onPressed}) {
  return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            right: 30,
            left: 30,
            top: 1,
            bottom: 1,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label!,
        style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500),
      ));
}
