import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String image;
  const SocialButton({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // Do something
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: Image.asset(
                image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
