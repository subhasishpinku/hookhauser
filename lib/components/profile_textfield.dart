import 'package:flutter/material.dart';

Widget info(
    {String? type,
    IconData? icon,
    String? data,
    TextEditingController? controller, validator, TextInputType? keyboardType,}) {
  return Column(
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: const Color(
              0xFF020D4D,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            type!,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        padding: const EdgeInsets.only(left: 20),
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.centerLeft,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: data!,
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}
