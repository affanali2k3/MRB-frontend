import 'package:flutter/material.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_bloc.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_event.dart';
import 'package:mrb/src/chat_panel_page/view/chat_panel_page.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/search_page/view/search_page_view.dart';
import 'package:mrb/themes/font_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      size: 15,
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
                child: GestureDetector(
                    onTap: () {
                      context
                          .read<ChatPanelBloc>()
                          .add(ChatPanelLoadingEvent());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPanelPage(),
                          ));
                    },
                    child: const Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 15,
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
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ],
          )
        ],
      );
}
