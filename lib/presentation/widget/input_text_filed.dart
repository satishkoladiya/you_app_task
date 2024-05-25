import 'package:flutter/material.dart';

Widget InputTextFieLd(
    {required TextEditingController controller, required String hintText}) {
  return SizedBox(
    width: 327.0,
    height: 51.0,
    child: TextField(
      controller: controller,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter'),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.06),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.40),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter'),
      ),
    ),
  );
}
