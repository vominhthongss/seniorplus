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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 150, 20),
              child: ShaderText(
                text: 'Chào mừng đến Care Plus!',
                size: 32,
                fontBold: true,
                center: false,
              ),
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PanelButton(
                        text: '+Đặt lịch khám',
                        image: 'assets/images/Order.png',
                        width: widthScreen / 2 - 40,
                        height: 100,
                        detail: false,
                        description: '',
                        navigateScreen: BookScreen(),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      PanelButton(
                        text: '+ Đặt lịch uống thuốc',
                        image: 'assets/images/DrinkDrug.png',
                        width: widthScreen / 2 - 40,
                        height: 100,
                        detail: false,
                        description: '',
                        navigateScreen: ScheduleMedicationScreen(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PanelButton(
                        text: 'Cẩm nang chăm sóc người cao tuổi',
                        image: 'assets/images/Book.png',
                        height: 150,
                        width: widthScreen - 55,
                        detail: true,
                        navigateScreen: CatalogScreen(),
                        description:
                            'Cẩm nang hướng dẫn chăm sóc người cao tuổi tại nhà',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Row(
                    children: const [
                      ShaderText(
                          text: 'Lịch trình sắp đến',
                          size: 16,
                          fontBold: true,
                          center: false),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    children: const [
                      Description(
                        text: 'Tháng 2',
                        center: false,
                        primary: false,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Day(
                        day: 'Mon',
                        date: '17',
                        onPressed: () {},
                        today: true,
                        width: widthScreen / 10,
                      ),
                      Day(
                        day: 'Mon',
                        date: '17',
                        onPressed: () {},
                        today: false,
                        width: widthScreen / 10,
                      ),
                      Day(
                        day: 'Tue',
                        date: '18',
                        onPressed: () {},
                        today: false,
                        width: widthScreen / 10,
                      ),
                      Day(
                        day: 'Wes',
                        date: '19',
                        onPressed: () {},
                        today: false,
                        width: widthScreen / 10,
                      ),
                      Day(
                        day: 'Thu',
                        date: '20',
                        onPressed: () {},
                        today: false,
                        width: widthScreen / 10,
                      ),
                      Day(
                        day: 'Fri',
                        date: '21',
                        onPressed: () {},
                        today: false,
                        width: widthScreen / 10,
                      ),
                      Day(
                        day: 'Sat',
                        date: '22',
                        onPressed: () {},
                        today: false,
                        width: widthScreen / 10,
                      ),
                      Day(
                        day: 'Sun',
                        date: '23',
                        onPressed: () {},
                        today: false,
                        width: widthScreen / 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                        child: Image.asset('assets/images/TimeLine.png'),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 3 * widthScreen / 4 - 10,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: TimeLinePanel(
                                width: widthScreen,
                                text: 'Kiểm tra huyết áp',
                                image: 'assets/images/Survey.png',
                                fullName: 'Tran Thanh Bach',
                                height: 70,
                                time: '10:30',
                                address:
                                    '01 Trần Khánh Dư, Bạch Đằng, Hai Bà Trưng, Hà Nội',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            width: 3 * widthScreen / 4 - 10,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: TimeLinePanel(
                                width: widthScreen,
                                text: 'Kiểm tra sức khoẻ',
                                image: 'assets/images/Calendar.png',
                                fullName: 'Tran Thanh Bach',
                                height: 70,
                                time: '10:30',
                                address:
                                    '01 Trần Khánh Dư, Bạch Đằng, Hai Bà Trưng, Hà Nội',
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
