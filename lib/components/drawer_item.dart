import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget menuContainer({required IconData icon, required String title}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 18,
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    ),
  );
}