import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/interfaces/hospital.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/hospital-item.dart';
import 'package:seniorplus/widgets/shader-text.dart';

import '../constants/colors.dart';

class FacilityDetailScreen extends StatefulWidget {
  final Hospital hospital;
  const FacilityDetailScreen({super.key, required this.hospital});

  @override
  State<FacilityDetailScreen> createState() => _FacilityDetailScreenState();
}

class _FacilityDetailScreenState extends State<FacilityDetailScreen> {
  int index = 0;
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
                        'Thông tin cơ sở y tế',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: index == 0
                          ? const ShaderText(
                              text: 'Giới thiệu',
                              size: 16,
                              fontBold: true,
                              center: false,
                              underline: true,
                            )
                          : const Text(
                              'Giới thiệu',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5C5C5C)),
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: index == 1
                          ? const ShaderText(
                              text: 'Dịch vụ',
                              size: 16,
                              fontBold: true,
                              center: false,
                              underline: true,
                            )
                          : const Text(
                              'Dịch vụ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5C5C5C)),
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: index == 2
                          ? const ShaderText(
                              text: 'Bác sĩ, chuyên gia',
                              size: 16,
                              fontBold: true,
                              center: false,
                              underline: true,
                            )
                          : const Text(
                              'Bác sĩ, chuyên gia',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5C5C5C)),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: index == 0
                  ? Tab1(
                      hospital: widget.hospital,
                    )
                  : index == 1
                      ? Tab2()
                      : index == 2
                          ? Tab3()
                          : null,
            ),
          ],
        ),
      ),
    );
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('c');
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('b');
  }
}

class Tab1 extends StatelessWidget {
  final Hospital hospital;
  const Tab1({
    super.key,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HospitalItem(hospital: hospital, border: false),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 150,
                height: 32,
                child: Button(text: 'Đặt lịch khám', onPressed: () {}))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Center(
                          child: Column(
                        children: [Text('Lượt đặt khám'), Text('123 lượt')],
                      ))),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.grey),
                        left: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Center(
                        child: Column(
                      children: [Text('Lượt tư vấn'), Text('23 lượt')],
                    )),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Center(
                          child: Column(
                        children: [
                          Text('Đánh giá'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('5'),
                              SizedBox(
                                width: 4,
                              ),
                              Image.asset('assets/images/star.png')
                            ],
                          )
                        ],
                      ))),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Giới thiệu',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                child: Text(
                  hospital.description!,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
