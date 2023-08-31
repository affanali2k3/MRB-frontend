import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width = double.infinity,
      this.primary = true});

  final void Function()? onPressed;
  final bool primary;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: primary ? Colors.blue : Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            text,
            style: TextStyle(color: primary ? Colors.white : Colors.black),
          ),
        ),
      );
}
