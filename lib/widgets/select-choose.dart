import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/interfaces/health-department.dart';
import 'package:seniorplus/interfaces/user.dart';

class SelectChoose extends StatefulWidget {
  final String label;
  final List<dynamic> dataList;
  final TextEditingController controller;
  const SelectChoose({
    super.key,
    required this.dataList,
    required this.controller,
    required this.label,
  });

  @override
  State<SelectChoose> createState() => _SelectChooseState();
}

class _SelectChooseState extends State<SelectChoose> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                widget.label,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Chọn danh sách'),
                  content: SizedBox(
                    height: 200,
                    width: 100,
                    child: ListView.builder(
                      itemCount: widget.dataList.length,
                      itemBuilder: (context, index) {
                        final item = widget.dataList[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              widget.controller.text = item is IUser
                                  ? item.fullName
                                  : item is HealthService
                                      ? item.name
                                      : item;
                            });
                            Navigator.of(context).pop();
                          },
                          child: item is IUser
                              ? Text(item.fullName)
                              : item is HealthService
                                  ? Text(item.name)
                                  : Text(item),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.controller.text != ''
                        ? widget.controller.text
                        : '-Chọn-',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Image.asset('assets/images/DownArrow.png')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
