import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/widgets/input.dart';
import 'package:seniorplus/widgets/panel-button.dart';

import '../main.dart';
import '../widgets/customize-title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  'Chào mừng đến Care Plus!',
                  style: TextStyle(
                      color: Color(PRIMARY_COLOR),
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
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
                  Row(
                    children: const [
                      PanelButton(
                          text: '+Đặt lịch khám',
                          image: 'assets/images/Order.png')
                    ],
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
