import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_bloc.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_event.dart';
import 'package:mrb/src/chat_panel_page/view/chat_panel_page.dart';
import 'package:mrb/src/common/profile_photo.dart';
import 'package:mrb/src/edit_profile/view/edit_profile_view.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/notifications_page/view/notification_view.dart';
import 'package:mrb/src/settings_page/view/settings_view.dart';
import 'package:mrb/themes/font_theme.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff378AD6), Color(0xff1B5697)])),
      width: 300,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Row(
            children: [
              CustomProfilePhoto(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(children: [
            Text(
              'Alex Stack',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ]),
          const Row(
            children: [
              Text(
                'Buyer',
                style: TextStyle(
                    color: CustomTheme.nightTertiaryFontColor, fontSize: 16),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/drawer/edit.png", width: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileEditPage(),
                          ));
                    },
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                // color: Colors.black,
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromARGB(0, 69, 67, 160),
                  Color.fromARGB(255, 69, 67, 160),
                ])),
            height: 1.2,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ));
            },
            child: Row(
              children: [
                Image.asset("assets/drawer/notification.png", width: 30),
                const SizedBox(width: 15),
                const Text(
                  'Notifications',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                context.read<ChatPanelBloc>().add(ChatPanelLoadingEvent());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPanelPage(),
                    ));
              },
              child: Row(
                children: [
                  Image.asset("assets/drawer/message.png", width: 30),
                  const SizedBox(width: 15),
                  const Text(
                    'Messages',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                // color: Colors.black,
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromARGB(0, 69, 67, 160),
                  Color.fromARGB(255, 69, 67, 160),
                ])),
            height: 1.2,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Image.asset("assets/drawer/referral.png", width: 30),
                const SizedBox(width: 15),
                const Text(
                  'Referral Link',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Image.asset("assets/drawer/about.png", width: 30),
                  const SizedBox(width: 15),
                  const Text(
                    'About MRB',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              },
              child: Row(
                children: [
                  Image.asset("assets/drawer/settings.png", width: 30),
                  const SizedBox(width: 15),
                  const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Image.asset("assets/drawer/support.png", width: 30),
                  const SizedBox(width: 15),
                  const Text(
                    'Contact Support',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                // color: Colors.black,
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromARGB(0, 69, 67, 160),
                  Color.fromARGB(255, 69, 67, 160),
                ])),
            height: 1.2,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                context.read<LoginCubit>().logout();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
              child: Row(
                children: [
                  Image.asset("assets/drawer/logout.png", width: 30),
                  const SizedBox(width: 15),
                  const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
