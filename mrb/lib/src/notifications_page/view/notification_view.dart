import 'package:flutter/material.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/common/top_bar_secondary_widget.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.nightBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTopBarSecondaryWidget(title: 'Notifications'),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: CustomTheme.nightTertiaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  const CustomProfilePhoto(),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom('New Lead'),
                      TextCustom('New lead posted in your area check it out')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
