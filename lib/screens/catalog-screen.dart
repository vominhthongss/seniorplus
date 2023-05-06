import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/screens/catalog-list-screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.only(top: 40),
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
                        width: 80,
                      ),
                      const Text(
                        'Cẩm nang chăm sóc',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Chọn người được chăm sóc:',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/Avatar.png',
                                width: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Ông - 68 tuổi - Nam'),
                                ],
                              ),
                            ],
                          ),
                          Image.asset('assets/images/Down.png'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 220,
            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3 + 50,
                        height: MediaQuery.of(context).size.width / 3 + 20,
                        child: CardItem(
                            name: 'DINH DƯỠNG',
                            image: 'assets/images/FoodBar.png'),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.width / 3 + 20,
                          width: MediaQuery.of(context).size.width / 3 + 50,
                          child: CardItem(
                              name: 'CHĂM SÓC SỨC KHỎE',
                              image: 'assets/images/HeartHealth.png')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.width / 3 + 20,
                          width: MediaQuery.of(context).size.width / 3 + 50,
                          child: CardItem(
                              name: 'BỆNH & TRIỆU CHỨNG',
                              image: 'assets/images/SupplementBottle.png')),
                      SizedBox(
                          height: MediaQuery.of(context).size.width / 3 + 20,
                          width: MediaQuery.of(context).size.width / 3 + 50,
                          child: CardItem(
                              name: 'HỎI ĐÁP',
                              image: 'assets/images/Question.png')),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  final String image;
  const CardItem({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CatalogListScreen(name: name)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(image),
                    Text(name),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
