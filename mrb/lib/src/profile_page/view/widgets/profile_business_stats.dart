import 'package:flutter/material.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileBusinessStatsWidget extends StatelessWidget {
  const ProfileBusinessStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '59',
                  style: TextStyle(
                      color: CustomTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text('Ref Sent'),
              ],
            ),
            Column(
              children: [
                Text(
                  '250',
                  style: TextStyle(
                      color: CustomTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text('Ref Received'),
                // TextCustom('Received', secondary: true)
              ],
            ),
            Column(
              children: [
                Text(
                  '259',
                  style: TextStyle(
                      color: CustomTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text('Ref Completed'),
                // TextCustom('Completed', secondary: true)
              ],
            )
          ],
        ),
      );
}

// ignore: non_constant_identifier_names
Widget TextCustom(String data,
        {bool secondary = false,
        double fontSize = 14,
        final bool bold = false,
        final bool centreText = false}) =>
    Text(
      data,
      textAlign: centreText ? TextAlign.center : null,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : null,
          color: secondary
              ? CustomTheme.nightSecondaryFontColor
              : CustomTheme.nightFontColor),
    );
