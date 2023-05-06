import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/colors.dart';

class CatalogDetailScreen extends StatefulWidget {
  final String name;
  const CatalogDetailScreen({super.key, required this.name});

  @override
  State<CatalogDetailScreen> createState() => _CatalogDetailScreenState();
}

class _CatalogDetailScreenState extends State<CatalogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 126,
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
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 126,
            width: MediaQuery.of(context).size.width,
            transform: Matrix4.translationValues(0.0, -10.0, 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'NGƯỜI MẮC BỆNH GÚT NÊN KIÊNG GÌ VÀ ĂN GÌ?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                        'Bệnh gút (hay còn gọi là bệnh gout hoặc thống phong) là một loại bệnh viêm khớp thường gặp, do rối loạn chuyển hóa chất dinh dưỡng trong cơ thể. Bệnh gout xảy ra do tăng sản xuất acid uric nội sinh, giảm đào thải acid uric ở thận, hoặc do ăn quá nhiều thực phẩm chứa nhiều purin như các loại thịt đỏ và hải sản.'),
                    Image.asset('assets/images/Image2.png'),
                    Text(
                        'Dưới đây là những gợi ý về thức ăn tốt cho bệnh nhân gút được chuyên gia dinh dưỡng nghiên cứu, khuyên bạn nên thay đổi trong thực đơn hàng ngày để giúp ngăn ngừa bệnh biến chứng nặng, kiểm soát và làm nhẹ tình trạng bệnh hiện t'),
                    Text(
                        'Bệnh gút (hay còn gọi là bệnh gout hoặc thống phong) là một loại bệnh viêm khớp thường gặp, do rối loạn chuyển hóa chất dinh dưỡng trong cơ thể. Bệnh gout xảy ra do tăng sản xuất acid uric nội sinh, giảm đào thải acid uric ở thận, hoặc do ăn quá nhiều thực phẩm chứa nhiều purin như các loại thịt đỏ và hải sản.'),
                    Image.asset('assets/images/Image2.png'),
                    Text(
                        'Dưới đây là những gợi ý về thức ăn tốt cho bệnh nhân gút được chuyên gia dinh dưỡng nghiên cứu, khuyên bạn nên thay đổi trong thực đơn hàng ngày để giúp ngăn ngừa bệnh biến chứng nặng, kiểm soát và làm nhẹ tình trạng bệnh hiện t'),
                    Text(
                        'Bệnh gút (hay còn gọi là bệnh gout hoặc thống phong) là một loại bệnh viêm khớp thường gặp, do rối loạn chuyển hóa chất dinh dưỡng trong cơ thể. Bệnh gout xảy ra do tăng sản xuất acid uric nội sinh, giảm đào thải acid uric ở thận, hoặc do ăn quá nhiều thực phẩm chứa nhiều purin như các loại thịt đỏ và hải sản.'),
                    Image.asset('assets/images/Image2.png'),
                    Text(
                        'Dưới đây là những gợi ý về thức ăn tốt cho bệnh nhân gút được chuyên gia dinh dưỡng nghiên cứu, khuyên bạn nên thay đổi trong thực đơn hàng ngày để giúp ngăn ngừa bệnh biến chứng nặng, kiểm soát và làm nhẹ tình trạng bệnh hiện t'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
