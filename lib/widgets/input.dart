import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';

class Input extends StatefulWidget {
  final String icon;
  final String hintText;
  final String label;
  final String type;
  final TextEditingController? controller;
  const Input({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.type,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    String type = widget.type;
    String label = widget.label;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                label,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(color: Color(PRIMARY_COLOR), fontSize: 16),
              )
            ],
          ),
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
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Image.asset(widget.icon),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  color: Color(HINT_TEXT),
                  fontWeight: FontWeight.bold // set the color of the hint text
                  ),
              suffixIcon: type == 'password'
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        semanticLabel:
                            _obscureText ? 'show password' : 'hide password',
                        color: const Color(PRIMARY_COLOR),
                      ),
                    )
                  : null,
            ),
            obscureText: type == 'password' ? _obscureText : false,
            controller: widget.controller,
          ),
        )
      ],
    );
  }
}
