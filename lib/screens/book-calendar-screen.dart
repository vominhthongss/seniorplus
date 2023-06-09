import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/screens/book-screen.dart';
import 'package:seniorplus/screens/catalog-screen.dart';
import 'package:seniorplus/screens/schedule-medication-screen.dart';
import 'package:seniorplus/screens/sign-in-screen.dart';
import 'package:seniorplus/widgets/day.dart';
import 'package:seniorplus/widgets/description.dart';
import 'package:seniorplus/widgets/input.dart';
import 'package:seniorplus/widgets/panel-button.dart';
import 'package:seniorplus/widgets/shader-text.dart';
import 'package:seniorplus/widgets/time-line-panel.dart';

import '../main.dart';
import '../widgets/customize-title.dart';

class BookCalendarScreen extends StatefulWidget {
  const BookCalendarScreen({Key? key}) : super(key: key);

  @override
  State<BookCalendarScreen> createState() => _BookCalendarScreenState();
}

class _BookCalendarScreenState extends State<BookCalendarScreen> {
  final dio = Dio();

  Future<List<Map<String, dynamic>>> fetchBook() async {
    final response = await dio
        .get('https://seniorplus-2ad6e-default-rtdb.firebaseio.com/book.json');
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = response.data;
      List<Map<String, dynamic>> books = [];
      for (String key in myMap.keys) {
        late Map<String, dynamic> book = {
          "hospitalName": myMap[key]['hospitalName'],
          "hospitalAddress": myMap[key]['hospitalAddress'],
          "fullname": myMap[key]['fullname'],
          "dateTime": myMap[key]['dateTime'],
          "service": myMap[key]['service'],
          "symptom": myMap[key]['symptom'],
        };
        books.add(book);
        debugPrint("book : ${book}", wrapWidth: 1024);
      }
      return books;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Image.asset('assets/images/BackArrow.png'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 150, 20),
                          child: ShaderText(
                            text: 'Lịch khám',
                            size: 32,
                            fontBold: true,
                            center: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 130,
              child: Column(
                children: [
                  // //
                  SizedBox(
                    height: 200,
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: fetchBook(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data!;
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 200,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final item = data[index];

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 2, color: Colors.green)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ShaderText(
                                                text: item['fullname'],
                                                size: 14,
                                                fontBold: true,
                                                center: false),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text(
                                              'Bệnh viện khám: ' +
                                                  item['hospitalName'],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text(
                                              'Địa chỉ khám: ' +
                                                  item['hospitalAddress'],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text(
                                              'Thời gian khám: ' +
                                                  item['dateTime'],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text(
                                              'Dịch vụ khám: ' +
                                                  item['service'],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text(
                                              'Triệu chứng: ' + item['symptom'],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child:
                                Text('Failed to load data: ${snapshot.error}'),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  // ////
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
