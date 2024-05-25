import 'package:flutter/material.dart';

class goldenGradientWidget extends StatelessWidget {
  goldenGradientWidget(this.child);

  final Widget child;
  final Gradient gradient = LinearGradient(
    colors: [
      Color(0xFF94783E),
      Color(0xFFF3EDA6),
      Color(0xFFF8FAE5),
      Color(0xFFFFE2BE),
      Color(0xFFD5BE88),
      Color(0xFFF8FAE5),
      Color(0xFFD5BE88),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
