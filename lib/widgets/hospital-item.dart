import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/interfaces/hospital.dart';

class HospitalItem extends StatelessWidget {
  final Hospital hospital;
  const HospitalItem({
    super.key,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 4,
                      maxHeight: MediaQuery.of(context).size.width / 4),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20), // Set the radius value here
                    child: Image.network(
                      hospital.image,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: 3 * (MediaQuery.of(context).size.width) / 4 -
                            76, // Set the maximum width here
                      ),
                      child: Text(
                        hospital.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/map-pin-black.png'),
                        const SizedBox(
                          width: 3,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth:
                                3 * (MediaQuery.of(context).size.width) / 4 -
                                    84,
                          ),
                          child: Text(
                            hospital.address,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
