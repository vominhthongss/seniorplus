import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/widgets/description.dart';
import 'package:seniorplus/widgets/shader-text.dart';

class TimeLinePanel extends StatelessWidget {
  const TimeLinePanel({
    super.key,
    required this.width,
    required this.text,
    required this.image,
    required this.height,
    required this.address,
    required this.time,
    required this.fullName,
  });

  final double width;
  final String text;
  final String image;
  final String address;
  final double height;
  final String fullName;
  final String time;

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
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(1),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  height: 50,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/WallClock.png',
                      ),
                      Text(time)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text('For '),
                      ShaderText(
                          text: fullName,
                          size: 14,
                          fontBold: true,
                          center: false),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Address.png',
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Địa chỉ khám'),
                          SizedBox(
                            width: width / 2,
                            child: Text(address),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  // add functionality here when the image button is tapped
                },
                child: Image.asset('assets/images/Dots.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
