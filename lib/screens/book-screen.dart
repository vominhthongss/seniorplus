import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/interfaces/hospital.dart';

import '../widgets/hospital-item.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final List<Hospital> hospitals = [
    Hospital(
        'Bệnh viện Hữu Nghị Việt Xô',
        '01 Trần Khánh Dư, Bạch Đằng, Hai Bà Trưng, Hà Nội',
        'https://suchcare.com/wp-content/uploads/2022/08/benh-vien-huu-nghi-viet-xo.jpg'),
    Hospital(
        'Bệnh viện Bạch Mai',
        'số 78 đường Giải Phóng, phường Phương Mai, quận Đống Đa, Hà Nội',
        'https://cdnimg.vietnamplus.vn/uploaded/lepz/2022_01_01/benh_vien_bach_mai.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
                    'Đặt lịch khám',
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
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          transform: Matrix4.translationValues(0.0, -20.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Image.asset('assets/images/search.png'),
                        hintText: 'Tìm kiếm',
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        suffixIcon: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(color: Colors.black))),
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Image.asset('assets/images/map-pin.png'),
                                SizedBox(
                                  width: 3,
                                ),
                                Text('Hà Nội'),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        'Danh sách cơ sở y tế: 2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       for (var hospital in hospitals)
                //         Padding(
                //           padding: EdgeInsets.only(bottom: 20),
                //           child: (HospitalItem(
                //             hospital: hospital,
                //           )),
                //         ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 224,
                    child: ListView.builder(
                      itemCount: hospitals.length,
                      itemBuilder: (context, index) {
                        final hospital = hospitals[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: HospitalItem(
                            hospital: hospital,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
