import 'package:flutter/material.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileBusinessStatsWidget extends StatelessWidget {
  const ProfileBusinessStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                TextCustom('204'),
                TextCustom('Referrals Sent', secondary: true)
              ],
            ),
            Column(
              children: [
                TextCustom('204'),
                TextCustom('Referrals Received', secondary: true)
              ],
            ),
            Column(
              children: [
                TextCustom('204'),
                TextCustom('Deals Completed', secondary: true)
              ],
            )
          ],
        ),
      );
}

// ignore: non_constant_identifier_names
Widget TextCustom(String data,
        {bool secondary = false, double fontSize = 14}) =>
    Text(
      data,
      style: TextStyle(
          fontSize: fontSize,
          color: secondary
              ? CustomTheme.nightSecondaryFontColor
              : CustomTheme.nightFontColor),
    );
