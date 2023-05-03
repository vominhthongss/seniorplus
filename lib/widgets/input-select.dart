import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/interfaces/user.dart';
import 'package:seniorplus/widgets/shader-text.dart';

class InputSelect extends StatefulWidget {
  final List<IUser> user;
  final List<IUser> users;
  const InputSelect({
    Key? key,
    required this.user,
    required this.users,
  }) : super(key: key);

  @override
  _InputSelectState createState() => _InputSelectState();
}

class _InputSelectState extends State<InputSelect> {
  // bool _obscureText = true;
  late List<IUser> users = widget.users;
  late List<IUser> user = widget.user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/Name.png'),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderText(
                              text: user[0].fullName,
                              size: 16,
                              fontBold: true,
                              center: false),
                          ShaderText(
                              text: user[0].sex + ' - ' + user[0].age + ' tuổi',
                              size: 16,
                              fontBold: true,
                              center: false),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Image.asset('assets/images/ChangeUser.png'),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Chọn bệnh nhân'),
                                content: Container(
                                  height: 150,
                                  child: SingleChildScrollView(
                                    child: SizedBox(
                                      height: 150,
                                      width: 500,
                                      child: ListView.builder(
                                        itemCount: users.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                user[0] = users[index];
                                                print(user[0]);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                users[index].fullName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // child: TextField(
          //   decoration: InputDecoration(
          //     filled: true,
          //     fillColor: Colors.white,
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(20),
          //       borderSide: BorderSide.none,
          //     ),
          //     prefixIcon: Padding(
          //       padding: const EdgeInsets.all(5.0),
          //       child: Image.asset('assets/images/Name.png'),
          //     ),
          //     hintStyle: const TextStyle(
          //         color: Color(HINT_TEXT),
          //         fontWeight: FontWeight.bold // set the color of the hint text
          //         ),
          //     suffixIcon: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               print('change user');
          //             });
          //           },
          //           child: Image.asset('assets/images/ChangeUser.png'),
          //         ),
          //       ],
          //     ),
          //   ),
          //   controller: widget.controller,
          // ),
        )
      ],
    );
  }
}
