import 'package:flutter/material.dart';

class SelectDropdown extends StatefulWidget {
  final List<String> items;
  final TextEditingController? controller;
  const SelectDropdown(
      {super.key, required this.items, required this.controller});

  @override
  State<SelectDropdown> createState() => _SelectDropdownState();
}

class _SelectDropdownState extends State<SelectDropdown> {
  late String dropdownvalue = widget.items[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: widget.items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              dropdownvalue = newValue!;
              widget.controller!.text = dropdownvalue;
            });
          },
        ),
      ],
    );
  }
}
