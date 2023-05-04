import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';

class ShaderText extends StatelessWidget {
  final String text;
  final double size;
  final bool fontBold;
  final bool center;
  final bool? italic;
  final bool? underline;
  const ShaderText({
    super.key,
    required this.text,
    required this.size,
    required this.fontBold,
    required this.center,
    this.italic,
    this.underline,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.045, 1.0],
        colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
      ).createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontBold ? FontWeight.bold : null,
          color: Colors.white,
          fontStyle: italic == true ? FontStyle.italic : null,
          decoration: underline == true ? TextDecoration.underline : null,
          // This color will be ignored
        ),
        textAlign: center == true ? TextAlign.center : null,
      ),
    );
  }
}
