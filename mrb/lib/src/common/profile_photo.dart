import 'package:flutter/material.dart';

class CustomProfilePhoto extends StatelessWidget {
  const CustomProfilePhoto({
    Key? key,
    this.radius = 20,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('assets/default_profile_photo.jpeg'),
      );
}
