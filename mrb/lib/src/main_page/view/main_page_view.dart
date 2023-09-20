import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/agent_forms_received/view/agent_forms_received_view.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_bloc.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_event.dart';
import 'package:mrb/src/chat_panel_page/view/chat_panel_page.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_bloc.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_event.dart';
import 'package:mrb/src/feed_page/view/feed_page_view.dart';
import 'package:mrb/src/feed_page/view/widgets/new_post_widget.dart';
import 'package:mrb/src/main_page/bloc/main_page_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_event.dart';
import 'package:mrb/src/main_page/bloc/main_page_state.dart';
import 'package:mrb/src/notifications_page/view/notification_view.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/view/referral_centre_view.dart';
import 'package:mrb/src/referral_post/view/referral_post_view.dart';
import 'package:mrb/themes/font_theme.dart';

enum Pages {
  referralCentrePage,
  networkPage,
  feedPage,
  notificationPage,
  profilePage
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        floatingActionButton:
            BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
          if (state is ReferralCenterPageState || state is FeedPageState) {
            return FloatingActionButton(
              elevation: 1000,
              onPressed: () {
                if (state is FeedPageState) {
                  showModalBottomSheet<dynamic>(
                      backgroundColor: CustomTheme.nightBackgroundColor,
                      context: context,
                      builder: (context) => FeedPageNewPostWidget());
                } else if (state is ReferralCenterPageState) {
                  showModalBottomSheet<dynamic>(
                      backgroundColor: CustomTheme.nightBackgroundColor,
                      context: context,
                      builder: (context) => const ReferralPostPage());
                }
              },
              backgroundColor: CustomTheme.primaryColor,
              child: const Icon(
                Icons.add,
              ),
            );
          }

          return const SizedBox();
        }),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: CustomTheme.nightBottomAppBarColor,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => context.read<MainPageBloc>().add(
                      ChangePageEvent(page: Pages.referralCentrePage.name)),
                  icon: Image.asset('assets/icons/navbar/home.png')),
              IconButton(
                onPressed: () {
                  context
                      .read<AgentFormsReceivedBloc>()
                      .add(AgentFormsReceivedLoadingEvent());
                  context
                      .read<MainPageBloc>()
                      .add(ChangePageEvent(page: Pages.networkPage.name));
                },
                icon: Image.asset('assets/icons/navbar/network.png'),
              ),
              IconButton(
                  onPressed: () {
                    context
                        .read<MainPageBloc>()
                        .add(ChangePageEvent(page: Pages.feedPage.name));
                    context.read<FeedPageBloc>().add(FeedPageLoadingEvent(
                        userId: GlobalVariables.user.id, pageNumber: 1));
                  },
                  icon: Image.asset('assets/icons/navbar/feed.png')),
              IconButton(
                  onPressed: () {
                    context.read<ChatPanelBloc>().add(ChatPanelLoadingEvent());
                    context.read<MainPageBloc>().add(
                        ChangePageEvent(page: Pages.notificationPage.name));
                  },
                  icon: Image.asset('assets/icons/navbar/chat.png')),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<ProfilePageBloc>(context).add(
                        ProfilePageLoadingEvent(
                            userId: GlobalVariables.user.id,
                            associateId: GlobalVariables.user.id));
                    context
                        .read<MainPageBloc>()
                        .add(ChangePageEvent(page: Pages.profilePage.name));
                  },
                  icon: Image.asset('assets/icons/navbar/profile.png')),
            ],
          ),
        ),
        body:
            BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
          if (state is MainPageInitialState) {
            return const ReferralCentrePage();
          } else if (state is ProfilePageState) {
            return ProfilePage(
              userId: GlobalVariables.user.id,
            );
          } else if (state is NetworkPageState) {
            return const AgentFormsReceivedPage();
          } else if (state is NotificationPageState) {
            return ChatPanelPage();
          } else if (state is FeedPageState) {
            return FeedPage(
              userId: GlobalVariables.user.id,
            );
          }

          return const ReferralCentrePage();
        }));
  }
}
