import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/interfaces/schedule-medication-drug.dart';
import 'package:seniorplus/interfaces/schedule-medication-time.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/input-select.dart';
import 'package:seniorplus/widgets/input.dart';
import 'package:seniorplus/widgets/select-dropdown.dart';

class ScheduleMedicationScreen extends StatefulWidget {
  const ScheduleMedicationScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleMedicationScreen> createState() =>
      _ScheduleMedicationScreenState();
}

class _ScheduleMedicationScreenState extends State<ScheduleMedicationScreen> {
  final List<IScheduleMedicationDrug> drugs = <IScheduleMedicationDrug>[
    IScheduleMedicationDrug(
        id: '1', drugName: 'Drug 1', content: 'Content 1', quantity: '1'),
    IScheduleMedicationDrug(
        id: '2', drugName: 'Drug 2', content: 'Content 2', quantity: '2'),
  ];
  final List<IScheduleMedicationTime> times = <IScheduleMedicationTime>[
    IScheduleMedicationTime(id: '1', time: '07:40'),
    IScheduleMedicationTime(id: '2', time: '16:40'),
  ];

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                    child: InputSelect(controller: null),
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
                    padding: const EdgeInsets.only(top: 10),
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
                        height: 100,
                        child: ListView.builder(
                          itemCount: drugs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Text(
                                    '${drugs[index].id} | ${drugs[index].drugName} | ${drugs[index].content} | ${drugs[index].quantity}'),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          TextEditingController
                                              _drugNameController =
                                              TextEditingController(
                                                  text: drugs[index].drugName);
                                          TextEditingController
                                              _contentController =
                                              TextEditingController(
                                                  text: drugs[index].content);
                                          TextEditingController
                                              _quantityController =
                                              TextEditingController(
                                                  text: drugs[index].quantity);
                                          return AlertDialog(
                                            title: Text('Chỉnh sửa thuốc'),
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
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 80,
                                                    child: Button(
                                                      text: 'Đóng',
                                                      onPressed: () {
                                                        Navigator.of(context)
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
                                                            if (element.id ==
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
                                                          Navigator.of(context)
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
                                  child: Image.asset('assets/images/Edit.png'),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Text('Thêm thuốc cần uống'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(20.0),
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
                        height: 100,
                        child: ListView.builder(
                          itemCount: times.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Text(
                                    '${times[index].id} | ${times[index].time}'),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        TextEditingController _timeController =
                                            TextEditingController(
                                                text: times[index].time);
                                        return AlertDialog(
                                          title: Text(
                                              'Chỉnh sửa lần uống cho lần ${times[index].id}'),
                                          content: SizedBox(
                                            height: 90,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  child: Button(
                                                    text: 'Đóng',
                                                    onPressed: () {
                                                      Navigator.of(context)
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
                                                        times
                                                            .forEach((element) {
                                                          if (element.id ==
                                                              times[index].id) {
                                                            element.time =
                                                                _timeController
                                                                    .text;
                                                          }
                                                        });
                                                        _timeController.clear();
                                                        Navigator.of(context)
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
                                  child: Image.asset('assets/images/Edit.png'),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                      time:
                                                          _timeController.text);
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
                        child: Text('Thêm lần uống'),
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
