import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InputChoose extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final String hintText;
  final int maxLines;
  final bool? uploadImage;
  const InputChoose(
      {super.key,
      required this.label,
      this.controller,
      required this.maxLines,
      required this.hintText,
      this.uploadImage});

  @override
  State<InputChoose> createState() => _InputChooseState();
}

class _InputChooseState extends State<InputChoose> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.label,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              if (widget.uploadImage == true)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset('assets/images/Camera.png'),
                )
            ],
          ),
          TextField(
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                  color: Colors.green,
                  width: 1,
                ),
              ),
            ),
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
