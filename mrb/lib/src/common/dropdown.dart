import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {super.key,
      required this.defaultSelectedOption,
      this.decoration,
      this.style,
      required this.items,
      required this.onChanged}); // Default selected option

  String defaultSelectedOption;
  final TextStyle? style;
  final InputDecoration? decoration;
  final void Function(String?)? onChanged;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: style,
      menuMaxHeight: 200,
      decoration: decoration,
      focusColor: Colors.white,
      value: defaultSelectedOption,
      onChanged: onChanged,
      items: [
        for (final item in items)
          DropdownMenuItem(value: item, child: Text(item))
      ],
    );
  }
}
