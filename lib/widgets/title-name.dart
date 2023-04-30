import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';

class TitleName extends StatelessWidget {
  final String text;
  final double size;
  const TitleName({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(PRIMARY_COLOR),
          fontSize: size),
      textAlign: TextAlign.center,
    );
  }
}
