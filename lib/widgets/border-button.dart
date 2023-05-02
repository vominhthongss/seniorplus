import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final String? icon;
  final bool delete;
  final VoidCallback onPressed;
  const BorderButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: delete == false
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.045, 1.0],
                colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
              )
            : const LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [0.045, 1.0],
                colors: [Color(0xffF90707), Color(0xffED850A)],
              ),
        border: Border.all(
          color: Colors.white,
          width: 3.0,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: icon != null
              ? [
                  Image.asset(icon!),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ]
              : [
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
        ),
      ),
    );
  }
}
