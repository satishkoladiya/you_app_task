import 'package:flutter/material.dart';
import 'package:you_app_task/presentation/widget/golden_gradient_widget.dart';

Widget goldenText(String text, TextStyle style) {
  return goldenGradientWidget(
    Text(
      text,
      style: style,
    ),
  );
}
