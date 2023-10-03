import 'package:flutter/material.dart';
import 'package:mrb/global_variables.dart';

class CustomProfilePhoto extends StatelessWidget {
  const CustomProfilePhoto({
    Key? key,
    this.photo,
    this.userId,
    this.radius = 20,
  }) : super(key: key);

  final double radius;
  final int? userId;
  final String? photo;

  @override
  Widget build(BuildContext context) => photo == null
      ? CircleAvatar(
          radius: radius,
          backgroundImage:
              const AssetImage('assets/default_profile_photo.jpeg'))
      : CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(
              '${GlobalVariables.url}/user/avatar?userId=$userId&avatarName=$photo'));
}
