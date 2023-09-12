import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileTabsWidget extends StatelessWidget {
  const ProfileTabsWidget({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfilePageBloc, ProfilePageState>(
          builder: (context, state) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    profileTabItem(
                      context,
                      'Network',
                      active: state is ProfilePageNetworkTabState,
                      onTap: () => context
                          .read<ProfilePageBloc>()
                          .add(ProfilePageNetworkTabEvent(userId: userId)),
                    ),
                    profileTabItem(
                      context,
                      'Posts',
                      active: state is ProfilePagePostTabState,
                      onTap: () => context
                          .read<ProfilePageBloc>()
                          .add(ProfilePagePostTabEvent()),
                    ),
                    profileTabItem(
                      context,
                      'Reviews',
                      active: state is ProfilePageReviewsTabState,
                      onTap: () => context
                          .read<ProfilePageBloc>()
                          .add(ProfilePageReviewsTabEvent()),
                    ),
                    profileTabItem(
                      context,
                      'About Us',
                      active: state is ProfilePageAboutTabState,
                      onTap: () => context
                          .read<ProfilePageBloc>()
                          .add(ProfilePageAboutTabEvent()),
                    ),
                  ],
                ),
              ));
}

Widget profileTabItem(BuildContext context, String text,
        {void Function()? onTap, required bool active}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: active ? CustomTheme.primaryColor : null,
            border: Border.all(
                color: active ? CustomTheme.primaryColor : Colors.white),
            borderRadius: BorderRadius.circular(6)),
        child: TextCustom(text),
      ),
    );
