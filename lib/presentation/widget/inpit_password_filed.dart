import 'package:flutter/material.dart';
import 'package:you_app_task/presentation/widget/golden_gradient_widget.dart';

Widget InputPasswordField(
    {required TextEditingController controller,
    required String hintText,
    required bool showPassword,
    required void Function() onPressed}) {
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
      obscureText: !showPassword,
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
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            onPressed();
          },
          icon: goldenGradientWidget(
            Icon(
              showPassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
        ),
      ),
    ),
  );
}
