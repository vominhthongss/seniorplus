import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/interfaces/doctor.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
    required this.item,
  });

  final Doctor item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/images/Avatar.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  item.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(item.job),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/SystemDiagnostic.png'),
                    Text(item.department),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/HospitalLocation.png'),
                    Text(item.hospital),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
