import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/widgets/input-select.dart';

class ScheduleMedicationScreen extends StatefulWidget {
  const ScheduleMedicationScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleMedicationScreen> createState() =>
      _ScheduleMedicationScreenState();
}

class _ScheduleMedicationScreenState extends State<ScheduleMedicationScreen> {
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
