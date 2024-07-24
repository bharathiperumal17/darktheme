import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final LinearGradient gradient;
  final TextStyle textStyle;

  GradientText({
    required this.text,
    required this.gradient,
    this.textStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Text(
        text,
        style: textStyle.copyWith(color: Colors.white), // Ensure text color is white for the gradient effect
      ),
    );
  }
}
