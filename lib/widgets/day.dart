import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';

class Day extends StatelessWidget {
  final String day;
  final String date;
  final bool today;
  final double width;
  final VoidCallback onPressed;
  const Day({
    super.key,
    required this.onPressed,
    required this.day,
    required this.date,
    required this.today,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        gradient: today == true
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.045, 1.0],
                colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
              )
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.045, 1.0],
                colors: [Colors.white, Colors.white],
              ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    day,
                    style: TextStyle(
                        color: today == false ? Colors.black : null,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    height: 6,
                    width: 6,
                    transform: Matrix4.translationValues(-3.0, -7.0, 0.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red),
                    child: null,
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    date,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
