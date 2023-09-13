import 'package:flutter/material.dart';

class CustomProfilePhoto extends StatelessWidget {
  const CustomProfilePhoto({Key? key, this.size = 40}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
      );
}
