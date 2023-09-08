import 'package:flutter/material.dart';

class CustomProfilePhoto extends StatelessWidget {
  const CustomProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
      );
}
