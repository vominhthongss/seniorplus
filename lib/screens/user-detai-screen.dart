import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/widgets/input-choose.dart';
import 'package:seniorplus/widgets/select-choose.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.045, 1.0],
                colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset('assets/images/BackArrow.png'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 47,
                  transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                  child: const Center(
                    child: Text(
                      'Hồ sơ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 150,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Profile.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                        dataList: [], controller: controller, label: 'Họ tên'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                        dataList: [],
                        controller: controller,
                        label: 'Ngày tháng năm sinh'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Text('Nam')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Text('Nữ')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Text('Khác')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChoose(
                        label: 'Email đăng ký',
                        maxLines: 1,
                        hintText: 'Email đăng ký'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChoose(
                        label: 'Số điện thoại',
                        maxLines: 1,
                        hintText: 'Số điện thoại'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChoose(
                        label: 'Số hộ chiếu/CMND/CCCD',
                        maxLines: 1,
                        hintText: 'Số hộ chiếu/CMND/CCCD'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                        dataList: [],
                        controller: controller,
                        label: 'Tỉnh/Thành Phố'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                        dataList: [],
                        controller: controller,
                        label: 'Quận/Huyện'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                        dataList: [],
                        controller: controller,
                        label: 'Phường/Xã'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
