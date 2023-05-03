import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      print(schedules);
      return schedules;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Text('Lịch uống thuốc')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Text('Lịch khám')),
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
                        return RefreshIndicator(
                          onRefresh: () async {
                            setState(() {});
                          },
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 144,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final item = data[index];

                                  return Column(
                                    children: [
                                      Text(item['user']['fullName']),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          for (var day in item['days'])
                                            ListTile(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(day),
                                                  Row(
                                                    children: [
                                                      for (var time
                                                          in item['times'])
                                                        Row(
                                                          children: [
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            (Text(
                                                                time['time'])),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  for (var time
                                                      in item['times'])
                                                    Column(
                                                      children: [
                                                        Text(time['time']),
                                                        for (var drug
                                                            in item['drugs'])
                                                          Text(
                                                              '${drug['drugName']} | ${drug['content']} | ${drug['quantity']}')
                                                      ],
                                                    ),
                                                ],
                                              ),
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
