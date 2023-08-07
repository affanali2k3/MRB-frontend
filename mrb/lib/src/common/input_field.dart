import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLength = 30,
      this.keyboardInputType = TextInputType.text});
  final TextInputType keyboardInputType;
  final TextEditingController controller;
  final int maxLength;
  final String hintText;
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],
          keyboardType: keyboardInputType,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
          controller: controller,
        ),
      );
}
