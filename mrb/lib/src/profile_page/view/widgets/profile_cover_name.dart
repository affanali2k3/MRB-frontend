import 'package:flutter/material.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileCoverNameWidget extends StatelessWidget {
  const ProfileCoverNameWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 200,
        width: double.infinity,
        color: CustomTheme.nightSecondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
                radius: 48,
                backgroundImage:
                    AssetImage('assets/default_profile_photo.jpeg')),
            const SizedBox(
              height: 10,
            ),
            TextCustom('Ali Makhdoom'),
            TextCustom('@ali_Mak', secondary: true)
          ],
        ),
      );
}
