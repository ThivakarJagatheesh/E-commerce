import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,this.maxLines
  });

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(bounds
        //Rect.fromLTWH(0, 0, bounds.width, bounds.height
        //),
      ),
      child: Text(text,maxLines: maxLines??1, style: style ?? TextStyle(fontWeight: FontWeight.bold,)),
    );
  }
}
