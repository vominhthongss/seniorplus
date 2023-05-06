import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/widgets/border-button.dart';
import 'package:seniorplus/widgets/shader-text.dart';

import '../constants/colors.dart';

class HealthDetailScreen extends StatefulWidget {
  const HealthDetailScreen({super.key});

  @override
  State<HealthDetailScreen> createState() => _HealthDetailScreenState();
}

class _HealthDetailScreenState extends State<HealthDetailScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.045, 1.0],
                colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset('assets/images/BackArrow.png'),
                      ),
                      Container(
                        transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
                        child: Text(
                          'Quản lý hồ sơ sức khoẻ điện tử',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 8, 8),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Avt2.png',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Sex',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '70 tuổi',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -10.0, 0.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                            ? ShaderText(
                                text: 'Tổng quan',
                                size: 16,
                                fontBold: true,
                                underline: true,
                                center: false)
                            : Text(
                                'Tổng quan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: index == 1
                            ? ShaderText(
                                text: 'Chẩn đoán hình ảnh',
                                size: 16,
                                fontBold: true,
                                underline: true,
                                center: false)
                            : Text(
                                'Chẩn đoán hình ảnh',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: index == 2
                            ? ShaderText(
                                text: 'Tiểu sử',
                                size: 16,
                                fontBold: true,
                                underline: true,
                                center: false)
                            : Text(
                                'Tiểu sử',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            index = 3;
                          });
                        },
                        child: index == 3
                            ? const ShaderText(
                                text: 'Đơn thuốc',
                                size: 16,
                                fontBold: true,
                                underline: true,
                                center: false)
                            : const Text(
                                'Đơn thuốc',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: index == 0
                      ? Tab1()
                      : index == 1
                          ? Tab2()
                          : index == 2
                              ? Tab3()
                              : index == 3
                                  ? Tab4()
                                  : null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Tab4 extends StatelessWidget {
  const Tab4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text('Đơn thuốc ngày 23/2/2022'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FileItem(
                title: 'Đơn thuốc.pdf',
                date: '23/5/2022',
                image: 'assets/images/None.png',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FileItem(
                title: 'X-quang phổi.pdf',
                date: '23/5/2022',
                image: 'assets/images/None.png',
              ),
              FileItem(
                title: 'X-quang phổi.pdf',
                date: '23/5/2022',
                image: 'assets/images/None.png',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FileItem extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  const FileItem({
    super.key,
    required this.title,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('    ' + title),
              Image.asset('assets/images/None.png'),
              Text('    ' + 'thêm vào: ' + date),
            ],
          ),
        ));
  }
}

class Tab3 extends StatelessWidget {
  const Tab3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> list1 = ['Dị ứng hải sản', 'Dị ứng phenotamine'];
    final List<String> list2 = ['Co thắt tim', 'Đột quỵ'];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HistoryCare(title: 'Tiền sử dị ứng', dataList: list1),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HistoryCare(title: 'Tiền sử bệnh', dataList: list2),
        ),
      ],
    );
  }
}

class HistoryCare extends StatelessWidget {
  final String title;
  final List<String> dataList;
  const HistoryCare({
    super.key,
    required this.dataList,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final item in dataList)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: (Text(
                          '• ' + item,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 60,
                        height: 30,
                        child: BorderButton(
                            text: '',
                            delete: false,
                            border: false,
                            icon: 'assets/images/Plus.png',
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 255,
      child: Column(
        children: const [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralItem(
              name: 'Huyết áp',
              value: '118/50 mmHG - 10 Frebuary, 12:00',
              image: 'assets/images/DropofBlood.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralItem(
              name: 'Nhịp tim',
              value: '80 nhịp/phút - 10 Frebuary, 12:00',
              image: 'assets/images/HeartwithPulse.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralItem(
              name: 'Cân nặng',
              value: '73 kg - 10 Frebuary, 12:00',
              image: 'assets/images/BMI.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralItem(
              name: 'Đường huyết',
              value: '9 mg/dl - 10 Frebuary, 12:00',
              image: 'assets/images/Diabetes.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralItem(
              name: 'Chiều cao',
              value: '178 cm - 10 Frebuary, 12:00',
              image: 'assets/images/TallPerson.png',
            ),
          ),
        ],
      ),
    );
  }
}

class GeneralItem extends StatelessWidget {
  final String name;
  final String value;
  final String image;
  const GeneralItem({
    super.key,
    required this.name,
    required this.value,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderText(
                        text: name, size: 16, fontBold: true, center: false),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Lần đo gần nhất:',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text('>', style: TextStyle(color: Colors.grey, fontSize: 20)),
          )
        ],
      ),
    );
  }
}
