import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/interfaces/hospital.dart';
import 'package:seniorplus/widgets/shader-text.dart';

import '../constants/colors.dart';

class InfoBookScreen extends StatefulWidget {
  final Hospital hospital;
  const InfoBookScreen({super.key, required this.hospital});

  @override
  State<InfoBookScreen> createState() => _InfoBookScreenState();
}

class _InfoBookScreenState extends State<InfoBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.045, 1.0],
                  colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/images/BackArrow.png'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 47,
                    transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                    child: const Center(
                      child: Text(
                        'Thông tin đặt khám',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xff373232),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              width: MediaQuery.of(context).size.width,
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    ShaderText(
                      text: 'Cơ sở y tế: ' + widget.hospital.name,
                      size: 16,
                      fontBold: true,
                      center: false,
                      underline: false,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
