import 'package:flutter/cupertino.dart';

class Description extends StatelessWidget {
  final String text;
  const Description({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF5CB270),
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    );
  }
}
