import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/widgets/description.dart';
import 'package:seniorplus/widgets/shader-text.dart';
import 'package:seniorplus/widgets/title-name.dart';

class PanelButton extends StatelessWidget {
  final String text;
  final String image;
  final double width;
  final double height;
  final bool detail;
  final String description;
  const PanelButton({
    super.key,
    required this.image,
    required this.text,
    required this.width,
    required this.height,
    required this.detail,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: detail == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(20),
                            ),
                            child: Image.asset(
                              image,
                              fit: BoxFit.contain,
                              height: 130,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: width / 2,
                                child: ShaderText(
                                  text: text,
                                  size: 18,
                                  fontBold: true,
                                  center: false,
                                ),
                              ),
                              SizedBox(
                                width: width / 2,
                                child: Description(
                                  text: description,
                                  center: false,
                                  primary: false,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        width: width,
                        height: 75,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ShaderText(
                            text: text,
                            size: 15,
                            fontBold: true,
                            center: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(100),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(12),
                            ),
                            child: Image.asset(
                              image,
                              fit: BoxFit.contain,
                              width: width,
                              height: height,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          )),
    );
  }
}
