import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/widgets/input.dart';
import 'package:seniorplus/widgets/panel-button.dart';
import 'package:seniorplus/widgets/shader-text.dart';

import '../main.dart';
import '../widgets/customize-title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              height: MediaQuery.of(context).size.height,
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
                          description:
                              'Cẩm nang hướng dẫn chăm sóc người cao tuổi tại nhà',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
