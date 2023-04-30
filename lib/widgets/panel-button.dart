import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/widgets/title-name.dart';

class PanelButton extends StatelessWidget {
  final String text;
  final String image;
  const PanelButton({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Do something
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TitleName(text: text, size: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width / 2 - 8,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
