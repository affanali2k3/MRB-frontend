import 'package:flutter/material.dart';
import 'package:mrb/src/notifications_page/view/notification_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/search_page/view/search_page_view.dart';
import 'package:mrb/src/settings_page/view/settings_view.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomTopBarWidget extends StatelessWidget {
  const CustomTopBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              height: 30,
              width: 30,
              color: const Color(0xffD9D9D9),
            ),
            const SizedBox(
              width: 20,
            ),
            TextCustom('MRB', fontSize: 24),
          ]),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomTheme.nightSecondaryColor),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ));
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomTheme.nightSecondaryColor),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationPage(),
                                ));
                          },
                          child: Image.asset(
                              'assets/icons/navbar/notification.png')),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            color: const Color(0xffC82C34),
                            borderRadius: BorderRadius.circular(6)),
                        child: TextCustom('15', fontSize: 10),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomTheme.nightSecondaryColor),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ));
                    },
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ],
          )
        ],
      );
}
