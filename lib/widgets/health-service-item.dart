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
              borderRadius: BorderRadius.circular(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/AveragePrice.png'),
                        Text(item.price),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffFFB800),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                          child: Row(
                            children: [
                              Text(item.rate),
                              const SizedBox(
                                width: 8,
                              ),
                              Image.asset('assets/images/SmallStar.png')
                            ],
                          ),
                        )),
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
