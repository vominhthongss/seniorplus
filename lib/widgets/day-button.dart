import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/constants/colors.dart';

class DayButton extends StatefulWidget {
  final List<String> days;
  const DayButton({super.key, required this.days});

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  late List<String> days = widget.days;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mỗi ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                    width: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${days[index]}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            if (index != days.length - 1)
                              const Text(
                                ', ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/CalendarSchedule.png')
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (!days.contains('Mon')) {
                  setState(() {
                    days.add('Mon');
                  });
                } else {
                  setState(() {
                    days.remove('Mon');
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: days.contains('Mon')
                      ? Border.all(
                          color: const Color(PRIMARY_COLOR),
                          width: 4,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'M',
                        style: TextStyle(
                            fontSize: 26,
                            color: days.contains('Mon')
                                ? const Color(PRIMARY_COLOR)
                                : null,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (!days.contains('Tue')) {
                  setState(() {
                    days.add('Tue');
                  });
                } else {
                  setState(() {
                    days.remove('Tue');
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: days.contains('Tue')
                      ? Border.all(
                          color: const Color(PRIMARY_COLOR),
                          width: 4,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'T',
                        style: TextStyle(
                            fontSize: 26,
                            color: days.contains('Tue')
                                ? const Color(PRIMARY_COLOR)
                                : null,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (!days.contains('Wed')) {
                  setState(() {
                    days.add('Wed');
                  });
                } else {
                  setState(() {
                    days.remove('Wed');
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: days.contains('Wed')
                      ? Border.all(
                          color: const Color(PRIMARY_COLOR),
                          width: 4,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'W',
                        style: TextStyle(
                            fontSize: 26,
                            color: days.contains('Wed')
                                ? const Color(PRIMARY_COLOR)
                                : null,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (!days.contains('Thu')) {
                  setState(() {
                    days.add('Thu');
                  });
                } else {
                  setState(() {
                    days.remove('Thu');
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: days.contains('Thu')
                      ? Border.all(
                          color: const Color(PRIMARY_COLOR),
                          width: 4,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'T',
                        style: TextStyle(
                            fontSize: 26,
                            color: days.contains('Thu')
                                ? const Color(PRIMARY_COLOR)
                                : null,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (!days.contains('Fri')) {
                  setState(() {
                    days.add('Fri');
                  });
                } else {
                  setState(() {
                    days.remove('Fri');
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: days.contains('Fri')
                      ? Border.all(
                          color: const Color(PRIMARY_COLOR),
                          width: 4,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'F',
                        style: TextStyle(
                            fontSize: 26,
                            color: days.contains('Fri')
                                ? const Color(PRIMARY_COLOR)
                                : null,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (!days.contains('Sat')) {
                  setState(() {
                    days.add('Sat');
                  });
                } else {
                  setState(() {
                    days.remove('Sat');
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: days.contains('Sat')
                      ? Border.all(
                          color: const Color(PRIMARY_COLOR),
                          width: 4,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'S',
                        style: TextStyle(
                            fontSize: 26,
                            color: days.contains('Sat')
                                ? const Color(PRIMARY_COLOR)
                                : null,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (!days.contains('Sun')) {
                  setState(() {
                    days.add('Sun');
                  });
                } else {
                  setState(() {
                    days.remove('Sun');
                  });
                }
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: days.contains('Sun')
                      ? Border.all(
                          color: const Color(PRIMARY_COLOR),
                          width: 4,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'S',
                        style: TextStyle(
                            fontSize: 26,
                            color: days.contains('Sun')
                                ? const Color(PRIMARY_COLOR)
                                : Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
