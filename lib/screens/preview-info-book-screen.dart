import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/interfaces/info-book.dart';
import 'package:seniorplus/screens/home-screen.dart';
import 'package:seniorplus/screens/main-screen.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/select-choose.dart';
import 'package:seniorplus/widgets/shader-text.dart';

class PreviewInfoBookScreen extends StatefulWidget {
  final InfoBook infoBook;
  const PreviewInfoBookScreen({super.key, required this.infoBook});

  @override
  State<PreviewInfoBookScreen> createState() => _PreviewInfoBookScreenState();
}

class _PreviewInfoBookScreenState extends State<PreviewInfoBookScreen> {
  int select = 0;
  bool isPreview = false;
  void preview() {
    setState(() {
      isPreview = !isPreview;
    });
  }

  final dio = Dio();
  void saveBook(items) async {
    try {
      print(items);
      final response = await dio.post(
        'https://seniorplus-2ad6e-default-rtdb.firebaseio.com/book.json',
        data: items,
      );
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                content: Container(
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.045, 1.0],
                            colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/done.png'),
                      ),
                      Text(
                        'Chúc mừng bạn đã lưu thành công',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            });

        print('Data posted successfully');
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print('Error posting data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                if (!isPreview)
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset('assets/images/BackArrow.png'),
                  ),
                if (!isPreview)
                  Container(
                    width: MediaQuery.of(context).size.width - 47,
                    transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                    child: const Center(
                      child: Text(
                        'Thông tin lịch đặt khám',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                if (isPreview)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                    child: const Center(
                      child: Text(
                        'Hoàn thành đặt khám',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  )
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
                    text: 'Cơ sở y tế: ' + widget.infoBook.hospitalName,
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
            height: MediaQuery.of(context).size.height - 170,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (isPreview == true) Image.asset('assets/images/QR.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InfoItem(
                      type: 'Bệnh nhân',
                      info: widget.infoBook.fullname,
                      image: 'assets/images/Avatar.png',
                    ),
                  ),
                  if (isPreview == true)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InfoItem(
                        type: 'Cơ sở khám',
                        info: widget.infoBook.hospitalName,
                        image: 'assets/images/Hospital.png',
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InfoItem(
                      type: 'Địa chỉ',
                      info: widget.infoBook.hospitalAddress,
                      image: 'assets/images/Address.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InfoItem(
                      type: 'Dịch vụ',
                      info: widget.infoBook.service,
                      image: 'assets/images/Treatment.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InfoItem(
                      type: 'Thời gian khám',
                      info: widget.infoBook.dateTime,
                      image: 'assets/images/WallClock2.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InfoItem(
                      type: 'Triệu chứng',
                      info: widget.infoBook.symptom,
                      image: 'assets/images/SystemDiagnostic.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: Image.asset(
                                    'assets/images/MagneticCard.png'),
                              ),
                              Text('Phương thức thanh toán'),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Thanh toán sau'),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        select = 0;
                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        gradient: select == 0
                                            ? const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                stops: [0.045, 1.0],
                                                colors: [
                                                  Color(PRIMARY_COLOR),
                                                  Color(SECOND_COLOR)
                                                ],
                                              )
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 1,
                                            color: select != 0
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                      child: Center(
                                          child: Image.asset(
                                              'assets/images/Check.png')),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Chuyển khoản'),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        select = 1;
                                      });
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        gradient: select == 1
                                            ? const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                stops: [0.045, 1.0],
                                                colors: [
                                                  Color(PRIMARY_COLOR),
                                                  Color(SECOND_COLOR)
                                                ],
                                              )
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 1,
                                            color: select != 1
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                      child: Center(
                                          child: Image.asset(
                                              'assets/images/Check.png')),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Thanh toán qua ví điện tử'),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      select = 2;
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      gradient: select == 2
                                          ? const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              stops: [0.045, 1.0],
                                              colors: [
                                                Color(PRIMARY_COLOR),
                                                Color(SECOND_COLOR)
                                              ],
                                            )
                                          : null,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 1,
                                          color: select != 2
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                            'assets/images/Check.png')),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (isPreview)
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Button(
                        text: 'Kết thúc',
                        onPressed: () {
                          final item = {
                            "fullname": widget.infoBook.fullname,
                            "hospitalName": widget.infoBook.hospitalName,
                            "hospitalAddress": widget.infoBook.hospitalAddress,
                            "service": widget.infoBook.service,
                            "dateTime": widget.infoBook.dateTime,
                            "symptom": widget.infoBook.symptom,
                          };
                          Timer(const Duration(seconds: 3), () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          });
                          saveBook(item);
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const MainScreen()),
                          // );
                        },
                      ),
                    ),
                  if (!isPreview)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CancelButton(),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3 + 20,
                          child: Button(
                            text: 'Xác nhận',
                            onPressed: preview,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String type;
  final String image;
  final String info;
  const InfoItem({
    super.key,
    required this.info,
    required this.image,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
            child: Row(
              children: [
                SizedBox(width: 50, child: Image.asset(image)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(type),
                    Text(info),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width / 3 + 20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.045, 1.0],
          colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ShaderText(
                        text: 'Huỷ bỏ',
                        size: 16,
                        fontBold: true,
                        center: false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
