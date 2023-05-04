import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/interfaces/health-department.dart';

class HealthServiceItem extends StatelessWidget {
  const HealthServiceItem({
    super.key,
    required this.item,
  });

  final HealthService item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(item.name), Text(item.price)],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(item.rate),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset('assets/images/Next.png'),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
