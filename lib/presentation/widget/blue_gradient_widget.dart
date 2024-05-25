import 'package:flutter/material.dart';

class blueGradientWidget extends StatelessWidget {
  blueGradientWidget(this.child);

  final Widget child;
  final Gradient gradient = LinearGradient(
    colors: [
      Color(0xFFABFFFD),
      Color(0xFF4599DB),
      Color(0xFFAADAFF),
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
