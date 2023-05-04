import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/widgets/shader-text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final dio = Dio();
  int index = 0;

  Future<List<Map<String, dynamic>>> fetchSchedule() async {
    final response = await dio.get(
        'https://seniorplus-2ad6e-default-rtdb.firebaseio.com/schedule.json');
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = response.data;
      List<Map<String, dynamic>> schedules = [];
      for (String key in myMap.keys) {
        late Map<String, dynamic> schedule = {
          "user": myMap[key]['user'],
          "days": myMap[key]['days'],
          "drugs": myMap[key]['drugs'],
          "times": myMap[key]['times']
        };
        schedules.add(schedule);
      }
      return schedules;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Thông báo',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 36.0,
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
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
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
                                Image.asset(index == 0
                                    ? 'assets/images/DrugScheTabActive.png'
                                    : 'assets/images/DrugScheTab.png'),
                                const SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  child: index == 0
                                      ? const ShaderText(
                                          text: 'Lịch uống thuốc',
                                          size: 16,
                                          fontBold: true,
                                          center: false)
                                      : const Text(
                                          'Lịch uống thuốc',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 36.0,
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
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(index == 1
                                    ? 'assets/images/CalendarScheTabActive.png'
                                    : 'assets/images/CalendarScheTab.png'),
                                const SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  child: index == 1
                                      ? const ShaderText(
                                          text: 'Lịch khám',
                                          size: 16,
                                          fontBold: true,
                                          center: false)
                                      : const Text(
                                          'Lịch khám',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: const [
                Text(
                  'Tuần này',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            child: index == 0
                ? FutureBuilder<List<Map<String, dynamic>>>(
                    future: fetchSchedule(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!;
                        return SingleChildScrollView(
                          child: RefreshIndicator(
                            onRefresh: () async {
                              setState(() {});
                            },
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 301,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final item = data[index];

                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Tên bệnh nhân: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            ShaderText(
                                                text: item['user']['fullName'],
                                                size: 16,
                                                fontBold: true,
                                                center: false),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          for (var day in item['days'])
                                            Column(
                                              children: [
                                                ScheduleItem(
                                                    day: day, item: item),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Failed to load data: ${snapshot.error}'),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatefulWidget {
  const ScheduleItem({
    super.key,
    required this.day,
    required this.item,
  });

  final String day;
  final Map<String, dynamic> item;

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  bool _isVisible = true;
  String getDayOfWeek(String day) {
    switch (day) {
      case 'Mon':
        return 'Thứ 2';
      case 'Tue':
        return 'Thứ 3';
      case 'Wed':
        return 'Thứ 4';
      case 'Thu':
        return 'Thứ 5';
      case 'Fri':
        return 'Thứ 6';
      case 'Sat':
        return 'Thứ 7';
      case 'Sun':
        return 'Chủ nhật';
      default:
        return ''; // Trường hợp không hợp lệ
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Colors.green)),
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Text(
                    getDayOfWeek(widget.day),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    if (!_isVisible)
                      for (var time in widget.item['times'])
                        Row(
                          children: [
                            Image.asset('assets/images/ClockSche.png'),
                            SizedBox(
                              width: 5,
                            ),
                            ShaderText(
                                text: time['time'],
                                size: 16,
                                fontBold: true,
                                center: false),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                  ],
                ),
              ],
            ),
            subtitle: Column(
              children: [
                if (_isVisible)
                  Column(
                    children: [
                      for (var time in widget.item['times'])
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/ClockSche.png'),
                                SizedBox(
                                  width: 5,
                                ),
                                ShaderText(
                                    text: time['time'],
                                    size: 16,
                                    fontBold: true,
                                    center: false),
                              ],
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      child: Center(child: Text('Tên'))),
                                  Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: Colors.white),
                                          left: BorderSide(color: Colors.grey),
                                          right: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      child: SizedBox(
                                          width: 150,
                                          child: Center(
                                              child: Text('Liều lượng')))),
                                  SizedBox(
                                      width: 100,
                                      child: Center(child: Text('Chỉ định'))),
                                ],
                              ),
                            ),
                            for (var drug in widget.item['drugs'])
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child: Center(
                                            child: Text(drug['drugName']))),
                                    Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top:
                                                BorderSide(color: Colors.white),
                                            left:
                                                BorderSide(color: Colors.grey),
                                            right:
                                                BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                        child: SizedBox(
                                            width: 150,
                                            child: Center(
                                                child: Text(
                                                    '${drug['quantity']} viên ${drug['content']} mg')))),
                                    SizedBox(
                                        width: 100,
                                        child:
                                            Center(child: Text('ĐTĐ tuýp 2'))),
                                  ],
                                ),
                              ),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      child: Center(child: Text(''))),
                                  Container(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: Colors.grey),
                                          right: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      child: SizedBox(
                                          width: 150,
                                          child: Center(child: Text('')))),
                                  SizedBox(
                                      width: 100,
                                      child: Center(child: Text(''))),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
              ],
            ),
          ),
          Container(
            child: _isVisible == true
                ? Container(
                    height: 18.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.045, 1.0],
                        colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Hide.png'),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'Thu gọn',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 18.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.045, 1.0],
                        colors: [Color(PRIMARY_COLOR), Color(SECOND_COLOR)],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Show.png'),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Mở rộng',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
