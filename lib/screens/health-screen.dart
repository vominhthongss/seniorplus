import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/screens/health-detail-screen.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/select-choose.dart';

import '../widgets/input-choose.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  final TextEditingController testController = new TextEditingController();
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
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 50),
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
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            transform: Matrix4.translationValues(0.0, -10.0, 0.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -80.0, 0.0),
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
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Có thể thêm thông tin người thân vào',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 150,
                                child: Button(
                                  text: 'Thêm người thân',
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Chọn người thân'),
                                          content: Container(
                                            height: 400,
                                            child: Column(
                                              children: [
                                                InputChoose(
                                                  label: 'Họ tên',
                                                  controller: testController,
                                                  maxLines: 1,
                                                  hintText: 'Họ tên',
                                                ),
                                                SelectChoose(
                                                  label: 'Mối quan hệ',
                                                  dataList: [],
                                                  controller: testController,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          Text('Nam')
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          Text('Nữ')
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .black),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                          ),
                                                          Text('Khác')
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                InputChoose(
                                                  label: 'Số điện thoại',
                                                  controller: testController,
                                                  maxLines: 1,
                                                  hintText: 'Số điện thoại',
                                                ),
                                                SelectChoose(
                                                  label:
                                                      'Chọn ngày tháng năm sinh',
                                                  dataList: [],
                                                  controller: testController,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                    ;
                                  },
                                ),
                              )
                            ],
                          ),
                          Image.asset('assets/images/Account.png'),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  height: 376,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HealthItem(),
                                HealthItem(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HealthItem extends StatelessWidget {
  const HealthItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HealthDetailScreen()),
        );
      },
      child: Container(
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
            Radius.circular(5),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.045, 1.0],
            colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
          ),
          border: Border.all(
            color: Colors.white,
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/Avt.png'),
                Text(
                  'Name',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Age',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Sex',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
