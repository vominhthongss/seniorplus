import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/widgets/shader-text.dart';

class InputSelect extends StatefulWidget {
  final TextEditingController? controller;
  const InputSelect({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _InputSelectState createState() => _InputSelectState();
}

class _InputSelectState extends State<InputSelect> {
  bool _obscureText = true;

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
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset('assets/images/Name.png'),
              ),
              hintStyle: const TextStyle(
                  color: Color(HINT_TEXT),
                  fontWeight: FontWeight.bold // set the color of the hint text
                  ),
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print('change user');
                      });
                    },
                    child: Image.asset('assets/images/ChangeUser.png'),
                  ),
                ],
              ),
            ),
            controller: widget.controller,
          ),
        )
      ],
    );
  }
}
