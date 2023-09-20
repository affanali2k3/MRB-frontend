import 'package:flutter/material.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.primary = true,
  }) : super(key: key);

  final void Function()? onPressed;
  final bool primary;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) => Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(
            20), // Set the same radius as in the Container's BoxDecoration
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onTap: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20), // Maintain the specified BorderRadius
              color: primary ? CustomTheme.primaryColor : Colors.white,
              border: Border.all(),
            ),
            child: Container(
              height: 50,
              width: width,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(14),
              child: Text(
                text,
                style: TextStyle(color: primary ? Colors.white : Colors.black),
              ),
            ),
          ),
        ),
      );
}
