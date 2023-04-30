import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';

class Description extends StatelessWidget {
  final String text;
  final bool center;
  final bool primary;
  const Description({
    super.key,
    required this.text,
    required this.center,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: primary == true ? Color(PRIMARY_COLOR) : Color(0xffB7B7B7),
        fontSize: 16,
      ),
      textAlign: center == true ? TextAlign.center : TextAlign.start,
    );
  }
}
