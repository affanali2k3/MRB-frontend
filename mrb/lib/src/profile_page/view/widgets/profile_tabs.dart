import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_network_page_bloc/profile_network_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_network_page_bloc/profile_network_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_event_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_page_event.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfileTabsWidget extends StatelessWidget {
  const ProfileTabsWidget({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ProfilePageBloc, ProfilePageState>(builder: (context, state) {
        final ProfilePageSuccessState successState =
            state as ProfilePageSuccessState;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              profileTabItem(context, 'Network',
                  active: successState.tab == ProfilePageTabs.profileNetworkTab,
                  onTap: () {
                context.read<ProfilePageBloc>().add(ProfilePageChangeTabEvent(
                    profilePageTab: ProfilePageTabs.profileNetworkTab));
                context
                    .read<ProfileNetworkPageBloc>()
                    .add(ProfileNetworkPageLoadingEvent(userId: userId));
              }),
              profileTabItem(context, 'Posts',
                  active: successState.tab == ProfilePageTabs.profilePostsTab,
                  onTap: () {
                context.read<ProfilePageBloc>().add(ProfilePageChangeTabEvent(
                    profilePageTab: ProfilePageTabs.profilePostsTab));
                context
                    .read<ProfilePostPageBloc>()
                    .add(ProfilePostPageLoadingEvent(userId: userId));
              }),
              profileTabItem(context, 'Reviews',
                  active: successState.tab == ProfilePageTabs.profileReviewsTab,
                  onTap: () {
                context.read<ProfilePageBloc>().add(ProfilePageChangeTabEvent(
                    profilePageTab: ProfilePageTabs.profileReviewsTab));
              }),
              profileTabItem(context, 'About Us',
                  active: successState.tab == ProfilePageTabs.profileAboutTab,
                  onTap: () {
                context.read<ProfilePageBloc>().add(ProfilePageChangeTabEvent(
                    profilePageTab: ProfilePageTabs.profileAboutTab));
              }),
            ],
          ),
        );
      });
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
