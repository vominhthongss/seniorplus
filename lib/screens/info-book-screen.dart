import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:seniorplus/interfaces/health-department.dart';
import 'package:seniorplus/interfaces/hospital.dart';
import 'package:seniorplus/interfaces/info-book.dart';
import 'package:seniorplus/interfaces/user.dart';
import 'package:seniorplus/screens/preview-info-book-screen.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/input-choose.dart';
import 'package:seniorplus/widgets/select-choose.dart';
import 'package:seniorplus/widgets/shader-text.dart';

import '../constants/colors.dart';

class InfoBookScreen extends StatefulWidget {
  final Hospital hospital;
  const InfoBookScreen({super.key, required this.hospital});

  @override
  State<InfoBookScreen> createState() => _InfoBookScreenState();
}

class _InfoBookScreenState extends State<InfoBookScreen> {
  final List<IUser> users = [
    IUser(fullName: 'Trần Thanh Bách', sex: 'Nam', age: '51'),
    IUser(fullName: 'Nguyễn Đăng Khoa', sex: 'Nam', age: '67'),
    IUser(fullName: 'Lý Văn Toàn', sex: 'Nam', age: '96'),
    IUser(fullName: 'Võ Anh Thư', sex: 'Nữ', age: '71')
  ];
  final TextEditingController usersController = new TextEditingController();
  final List<String> departments = [
    'Chuyên khoa I',
    'Chuyên khoa II',
    'Chuyên khoa III',
  ];
  final TextEditingController departmentsController =
      new TextEditingController();
  final List<HealthService> services = [
    const HealthService('Khám Nội Khoa (Lão Khoa)', '50.000 VND', '5'),
    const HealthService('Khám Ngoại Khoa (Lão Khoa)', '50.000 VND', '5'),
  ];
  final TextEditingController servicesController = new TextEditingController();
  final List<String> dates = [
    '01/01/2023',
    '02/01/2023',
  ];
  final TextEditingController datesController = new TextEditingController();
  final List<String> times = [
    '7:00 AM',
    '8:00 AM',
  ];
  final TextEditingController timesController = new TextEditingController();
  final TextEditingController symptomController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();
  final List<String> placeRegisters = [
    'Bệnh viện Bạch Mai',
    'Bệnh viện Hữu Nghị Việt Xô',
  ];
  final TextEditingController placeRegistersController =
      new TextEditingController();
  final List<String> cardFromDates = [
    '01/01/2023',
    '02/01/2023',
  ];
  final TextEditingController cardFromDatesController =
      new TextEditingController();

  final List<String> cardToDates = [
    '01/01/2023',
    '02/01/2023',
  ];
  final TextEditingController cardToDatesController =
      new TextEditingController();

  void confirm() {
    final InfoBook infoBook = InfoBook(
        fullname: usersController.text,
        hospitalName: widget.hospital.name,
        hospitalAddress: widget.hospital.address,
        service: servicesController.text,
        dateTime: datesController.text + ' ' + timesController.text,
        symptom: symptomController.text);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PreviewInfoBookScreen(infoBook: infoBook)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
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
                      'Thông tin đặt khám',
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
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xff373232),
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            width: MediaQuery.of(context).size.width,
            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  ShaderText(
                    text: 'Cơ sở y tế: ' + widget.hospital.name,
                    size: 16,
                    fontBold: true,
                    center: false,
                    underline: false,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 170,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 66,
                          child: SelectChoose(
                            label: 'Họ tên',
                            dataList: users,
                            controller: usersController,
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(00.0, 10.0, 0.0),
                          child: SizedBox(
                            width: 50,
                            height: 44,
                            child: Image.asset(
                                'assets/images/AddAdministrator.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                      label: 'Chuyên khoa',
                      dataList: departments,
                      controller: departmentsController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                      label: 'Dịch vụ',
                      dataList: services,
                      controller: servicesController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                      label: 'Ngày khám',
                      dataList: dates,
                      controller: datesController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                      label: 'Giờ khám',
                      dataList: times,
                      controller: timesController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChoose(
                      uploadImage: true,
                      label: 'Triệu chứng',
                      controller: symptomController,
                      maxLines: 8,
                      hintText:
                          'Vui lòng mô tả triệu chứng trước sẽ giúp bạn được phục vụ tốt hơn',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
                      child: CheckboxListTile(
                        activeColor: Colors.green,
                        title: Container(
                            transform:
                                Matrix4.translationValues(-20.0, 0.0, 0.0),
                            child: Text("Có BHYT")),
                        value: true,
                        onChanged: (newValue) {},
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChoose(
                      label: 'Số BHYT',
                      controller: numberController,
                      maxLines: 1,
                      hintText: 'Nhập nội dung',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectChoose(
                      label: 'Nơi đăng ký KCB ban đầu',
                      dataList: placeRegisters,
                      controller: placeRegistersController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3 + 30,
                          child: SelectChoose(
                            label: 'Thời hạn thẻ',
                            dataList: cardFromDates,
                            controller: cardFromDatesController,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Image.asset('assets/images/Line.png')),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3 + 30,
                          child: SelectChoose(
                            label: '',
                            dataList: cardToDates,
                            controller: cardToDatesController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CancelButton(),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3 + 20,
                        child: Button(
                          text: 'Xác nhận',
                          onPressed: () {
                            confirm();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width / 3 + 20,
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
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ShaderText(
                        text: 'Huỷ bỏ',
                        size: 16,
                        fontBold: true,
                        center: false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
