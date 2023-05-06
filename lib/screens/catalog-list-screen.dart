import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/screens/catalog-detail-screen.dart';

import '../constants/colors.dart';

class CatalogListScreen extends StatefulWidget {
  final String name;
  const CatalogListScreen({super.key, required this.name});

  @override
  State<CatalogListScreen> createState() => _CatalogListScreenState();
}

class _CatalogListScreenState extends State<CatalogListScreen> {
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
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/images/search.png'),
                      hintText: 'Tìm kiếm',
                      contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 220,
            transform: Matrix4.translationValues(0.0, -10.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsItem(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsItem(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsItem(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsItem(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsItem(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsItem(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsItem(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewsItem(),
                      ),
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

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatalogDetailScreen(name: 'DINH DƯỠNG'),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset('assets/images/Image1.png'),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '14 món ăn nhẹ phù hợp với người bệnh đái tháo đường',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
