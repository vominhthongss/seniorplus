import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/interfaces/schedule-medication-drug.dart';
import 'package:seniorplus/interfaces/schedule-medication-time.dart';
import 'package:seniorplus/interfaces/test.dart';
import 'package:seniorplus/interfaces/user.dart';
import 'package:seniorplus/widgets/border-button.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/day-button.dart';
import 'package:seniorplus/widgets/input-select.dart';
import 'package:seniorplus/widgets/input.dart';
import 'package:seniorplus/widgets/select-dropdown.dart';
import 'package:seniorplus/widgets/shader-text.dart';

class ScheduleMedicationScreen extends StatefulWidget {
  const ScheduleMedicationScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleMedicationScreen> createState() =>
      _ScheduleMedicationScreenState();
}

class _ScheduleMedicationScreenState extends State<ScheduleMedicationScreen> {
  final List<IUser> users = [
    IUser(fullName: 'Trần Thanh Bách', sex: 'Nam', age: '51'),
    IUser(fullName: 'Nguyễn Đăng Khoa', sex: 'Nam', age: '67'),
    IUser(fullName: 'Lý Văn Toàn', sex: 'Nam', age: '96'),
    IUser(fullName: 'Võ Anh Thư', sex: 'Nữ', age: '71')
  ];
  late List<IUser> user = [users[0]];

  final List<IScheduleMedicationDrug> drugs = <IScheduleMedicationDrug>[
    IScheduleMedicationDrug(
        id: '1', drugName: 'Panadol', content: '20', quantity: '1'),
    IScheduleMedicationDrug(
        id: '2', drugName: 'Panadol', content: '20', quantity: '2'),
  ];
  final List<IScheduleMedicationTime> times = <IScheduleMedicationTime>[
    IScheduleMedicationTime(id: '1', time: '07:40'),
    IScheduleMedicationTime(id: '2', time: '16:40'),
  ];
  final List<String> days = [];

  final _controller = TextEditingController();

  final dio = Dio();

  // Future<List<Test>> fetchData() async {
  //   final response = await dio
  //       .get('https://seniorplus-2ad6e-default-rtdb.firebaseio.com/test.json');
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = response.data;
  //     return data.map((item) => Test.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // void postData() async {
  //   try {
  //     final response = await dio.post(
  //       'https://seniorplus-2ad6e-default-rtdb.firebaseio.com/test.json',
  //       data: {
  //         "2": {"key": "value 3"}
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       print(response);
  //       print('Data posted successfully');
  //     } else {
  //       throw Exception('Failed to post data');
  //     }
  //   } catch (e) {
  //     print('Error posting data: $e');
  //   }
  // }

  void saveSchedule(items) async {
    try {
      final response = await dio.post(
        'https://seniorplus-2ad6e-default-rtdb.firebaseio.com/schedule.json',
        data: items,
      );
      if (response.statusCode == 200) {
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
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // FutureBuilder<List<Test>>(
            //   future: fetchData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       // If the data is available, build the ListView.
            //       final data = snapshot.data!;
            //       return SizedBox(
            //         height: 100,
            //         child: ListView.builder(
            //           itemCount: data.length,
            //           itemBuilder: (context, index) {
            //             // Build a ListTile for each item in the list.
            //             final item = data[index];
            //             return Text(item.key);
            //           },
            //         ),
            //       );
            //     } else if (snapshot.hasError) {
            //       // If there's an error, display an error message.
            //       return Center(
            //         child: Text('Failed to load data: ${snapshot.error}'),
            //       );
            //     } else {
            //       // If the data is not yet available, display a loading spinner.
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
            Container(
              height: 220,
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
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: InkWell(
                            child: Image.asset('assets/images/BackArrow.png'),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Đặt thời gian uống thuốc định kì',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                    child: InputSelect(user: user, users: users),
                  )
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -22.0, 0.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Thuốc cần uống',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            (drugs.length + 2),
                        child: ListView.builder(
                          itemCount: drugs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                                'assets/images/HandPill.png'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ShaderText(
                                                    text: drugs[index]
                                                            .drugName +
                                                        ' (${drugs[index].content} mg)',
                                                    size: 16,
                                                    fontBold: true,
                                                    center: false),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                ShaderText(
                                                    text:
                                                        drugs[index].quantity +
                                                            ' viên',
                                                    size: 16,
                                                    fontBold: true,
                                                    center: false),
                                              ],
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  TextEditingController
                                                      _drugNameController =
                                                      TextEditingController(
                                                          text: drugs[index]
                                                              .drugName);
                                                  TextEditingController
                                                      _contentController =
                                                      TextEditingController(
                                                          text: drugs[index]
                                                              .content);
                                                  TextEditingController
                                                      _quantityController =
                                                      TextEditingController(
                                                          text: drugs[index]
                                                              .quantity);
                                                  return AlertDialog(
                                                    title:
                                                        Text('Chỉnh sửa thuốc'),
                                                    content: SizedBox(
                                                      height: 300,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Input(
                                                              label: '',
                                                              controller:
                                                                  _drugNameController,
                                                              icon: null,
                                                              type: 'text',
                                                              hintText:
                                                                  'Nhập tên thuốc'),
                                                          Input(
                                                              label: '',
                                                              controller:
                                                                  _contentController,
                                                              icon: null,
                                                              type: 'text',
                                                              hintText:
                                                                  'Nhập hàm lượng'),
                                                          Input(
                                                              label: '',
                                                              controller:
                                                                  _quantityController,
                                                              icon: null,
                                                              type: 'text',
                                                              hintText:
                                                                  'Nhập số lượng'),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(
                                                            width: 80,
                                                            child: Button(
                                                              text: 'Đóng',
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          SizedBox(
                                                            width: 80,
                                                            child: Button(
                                                              text: 'Sửa',
                                                              onPressed: () {
                                                                setState(() {
                                                                  drugs.forEach(
                                                                      (element) {
                                                                    if (element
                                                                            .id ==
                                                                        drugs[index]
                                                                            .id) {
                                                                      element.drugName =
                                                                          _drugNameController
                                                                              .text;
                                                                      element.content =
                                                                          _contentController
                                                                              .text;
                                                                      element.quantity =
                                                                          _quantityController
                                                                              .text;
                                                                    }
                                                                  });
                                                                  _drugNameController
                                                                      .clear();
                                                                  _contentController
                                                                      .clear();
                                                                  _quantityController
                                                                      .clear();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Image.asset(
                                              'assets/images/Edit.png'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 + 20,
                        child: BorderButton(
                          text: 'Thêm thuốc cần uống',
                          delete: false,
                          icon: 'assets/images/Plus.png',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                TextEditingController _drugNameController =
                                    TextEditingController();
                                TextEditingController _contentController =
                                    TextEditingController();
                                TextEditingController _quantityController =
                                    TextEditingController();
                                return AlertDialog(
                                  title: Text('Thêm thuốc'),
                                  content: SizedBox(
                                    height: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Input(
                                            label: '',
                                            controller: _drugNameController,
                                            icon: null,
                                            type: 'text',
                                            hintText: 'Nhập tên thuốc'),
                                        Input(
                                            label: '',
                                            controller: _contentController,
                                            icon: null,
                                            type: 'text',
                                            hintText: 'Nhập hàm lượng'),
                                        Input(
                                            label: '',
                                            controller: _quantityController,
                                            icon: null,
                                            type: 'text',
                                            hintText: 'Nhập số lượng'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Button(
                                            text: 'Đóng',
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Button(
                                            text: 'Thêm',
                                            onPressed: () {
                                              setState(() {
                                                final newItem =
                                                    IScheduleMedicationDrug(
                                                        drugName:
                                                            _drugNameController
                                                                .text,
                                                        content:
                                                            _contentController
                                                                .text,
                                                        quantity:
                                                            _quantityController
                                                                .text);
                                                drugs.add(newItem);
                                                print(newItem);
                                                _drugNameController.clear();
                                                _contentController.clear();
                                                _quantityController.clear();
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Số lần uống',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height /
                            (times.length + 5),
                        child: ListView.builder(
                          itemCount: times.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ShaderText(
                                            text: 'Lần ${times[index].id}:',
                                            size: 18,
                                            fontBold: true,
                                            center: false),
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/TimeSpan.png'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              times[index].time,
                                              style: const TextStyle(
                                                  color: Color(0xff0D2475),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                TextEditingController
                                                    _timeController =
                                                    TextEditingController(
                                                        text:
                                                            times[index].time);
                                                return AlertDialog(
                                                  title: Text(
                                                      'Chỉnh sửa lần uống cho lần ${times[index].id}'),
                                                  content: SizedBox(
                                                    height: 90,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Input(
                                                            label: '',
                                                            controller:
                                                                _timeController,
                                                            icon: null,
                                                            type: 'text',
                                                            hintText:
                                                                'Nhập thời gian'),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        SizedBox(
                                                          width: 80,
                                                          child: Button(
                                                            text: 'Đóng',
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                          width: 80,
                                                          child: Button(
                                                            text: 'Sửa',
                                                            onPressed: () {
                                                              setState(() {
                                                                times.forEach(
                                                                    (element) {
                                                                  if (element
                                                                          .id ==
                                                                      times[index]
                                                                          .id) {
                                                                    element.time =
                                                                        _timeController
                                                                            .text;
                                                                  }
                                                                });
                                                                _timeController
                                                                    .clear();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Image.asset(
                                              'assets/images/Edit.png'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 + 20,
                        child: BorderButton(
                          text: 'Thêm lần uống',
                          delete: false,
                          icon: 'assets/images/Plus.png',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                TextEditingController _idController =
                                    TextEditingController();
                                TextEditingController _timeController =
                                    TextEditingController();
                                return AlertDialog(
                                  title: Text('Thêm lần uống'),
                                  content: SizedBox(
                                    height: 180,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Input(
                                            label: '',
                                            controller: _idController,
                                            icon: null,
                                            type: 'text',
                                            hintText: 'Nhập lần'),
                                        Input(
                                            label: '',
                                            controller: _timeController,
                                            icon: null,
                                            type: 'text',
                                            hintText: 'Nhập thời gian'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Button(
                                            text: 'Đóng',
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 80,
                                          child: Button(
                                            text: 'Thêm',
                                            onPressed: () {
                                              setState(() {
                                                final newItem =
                                                    IScheduleMedicationTime(
                                                        id: _idController.text,
                                                        time: _timeController
                                                            .text);
                                                times.add(newItem);
                                                print(newItem);
                                                _idController.clear();
                                                _timeController.clear();
                                                Navigator.of(context).pop();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DayButton(
                          days: days,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: BorderButton(
                          text: 'Bỏ lưu',
                          delete: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: BorderButton(
                          text: 'Lưu',
                          delete: false,
                          onPressed: () {
                            print(user[0]);
                            String jsonDrugs = jsonEncode(
                                drugs.map((d) => d.toJson()).toList());
                            print(jsonDrugs);
                            String jsonTimes = jsonEncode(
                                times.map((t) => t.toJson()).toList());
                            print(jsonTimes);
                            print(jsonEncode(days));
                            final items = {
                              "user": user[0],
                              "drugs": drugs.map((d) => d.toJson()).toList(),
                              "times": times.map((t) => t.toJson()).toList(),
                              "days": days,
                            };
                            saveSchedule(items);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
