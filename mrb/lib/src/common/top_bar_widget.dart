import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/notifications_page/view/notification_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/view/widgets/search_widget.dart';
import 'package:mrb/src/search_page/view/search_page_view.dart';
import 'package:mrb/src/settings_page/view/settings_view.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomTopBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  CustomTopBarWidget(
      {Key? key, required this.height, required this.mainPageScaffoldKey})
      : super(key: key);

  final mainPageScaffoldKey;

  final double height;
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 40),
        color: CustomTheme.primaryColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  IconButton(
                      onPressed: () {
                        mainPageScaffoldKey.currentState!.openDrawer();
                        // Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      )),
                  const Text('Welcome to MRB',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ]),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: CustomTheme.nightSecondaryColor),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SearchPage(),
                                  ));
                            },
                            child: Image.asset(
                                'assets/icons/referral_centre/notification.png')
                            // size: 30,
                            )),
                    const SizedBox(
                      width: 5,
                    ),

                    Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
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
                                    height: 17,
                                    'assets/icons/referral_centre/chat.png')),
                            // Container(
                            //   padding: const EdgeInsets.symmetric(horizontal: 4),
                            //   decoration: BoxDecoration(
                            //       color: const Color(0xffC82C34),
                            //       borderRadius: BorderRadius.circular(6)),
                            //   child: TextCustom('15', fontSize: 10),
                            // ),
                          ],
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(6),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: CustomTheme.nightSecondaryColor),
                    //   child: GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) => const SettingsPage(),
                    //             ));
                    //       },
                    //       child: const Icon(
                    //         Icons.settings,
                    //         color: Colors.white,
                    //         size: 30,
                    //       )),
                    // ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Referral Centre',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ReferralCentreSearchWidget(),
                ],
              ),
            ),
          ],
        ),
      );
}
