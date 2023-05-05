import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/interfaces/hospital.dart';
import 'package:seniorplus/screens/facility-detail-screen.dart';

class HospitalItem extends StatelessWidget {
  final Hospital hospital;
  final bool border;
  const HospitalItem({
    super.key,
    required this.hospital,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (border) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FacilityDetailScreen(hospital: hospital),
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: border == true ? Border.all(color: Colors.grey) : null),
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
                      borderRadius: BorderRadius.circular(
                          20), // Set the radius value here
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
                          maxWidth:
                              3 * (MediaQuery.of(context).size.width) / 4 -
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
      ),
    );
  }
}
