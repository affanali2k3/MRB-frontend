import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_bloc.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_event.dart';
import 'package:mrb/src/chat_panel_page/view/chat_panel_page.dart';
import 'package:mrb/src/drawer/custom_drawer.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_bloc.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_event.dart';
import 'package:mrb/src/feed_page/view/feed_page_view.dart';
import 'package:mrb/src/feed_page/view/widgets/new_post_widget.dart';
import 'package:mrb/src/forms_main_page/view/forms_main_page_view.dart';
import 'package:mrb/src/main_page/bloc/main_page_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_event.dart';
import 'package:mrb/src/main_page/bloc/main_page_state.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_event_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_page_event.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
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
  MainPage({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        key: _key,
        extendBody: true,
        drawer: CustomDrawer(),
        floatingActionButton:
            BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
          if (state is ReferralCenterPageState ||
              state is FeedPageState ||
              state is MainPageInitialState) {
            return FloatingActionButton(
                elevation: 1000,
                onPressed: () {
                  if (state is FeedPageState) {
                    showModalBottomSheet<dynamic>(
                        backgroundColor: CustomTheme.nightBackgroundColor,
                        context: context,
                        builder: (context) => const FeedPageNewPostWidget());
                  } else if (state is ReferralCenterPageState ||
                      state is MainPageInitialState) {
                    showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        backgroundColor: CustomTheme.nightBackgroundColor,
                        context: context,
                        builder: (context) => const ReferralPostPage());
                  }
                },
                backgroundColor: CustomTheme.primaryColor,
                shape: const RoundedRectangleBorder(
                  // <= Change BeveledRectangleBorder to RoundedRectangularBorder
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ));
          }

          return const SizedBox();
        }),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: CustomTheme.nightBottomAppBarColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          padding: const EdgeInsets.all(10),
          // margin: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // IconButton(
              //     onPressed: () {},
              //     icon: Container(
              //       padding: const EdgeInsets.all(20),
              //       decoration: BoxDecoration(
              //           color: CustomTheme.primaryColor,
              //           borderRadius: BorderRadius.circular(60)),
              //       child: const Icon(
              //         Icons.add,
              //         color: Colors.white,
              //         size: 30,
              //       ),
              //     )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => context.read<MainPageBloc>().add(
                          ChangePageEvent(page: Pages.referralCentrePage.name)),
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/navbar/home.png',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Home',
                            style: TextStyle(
                                color: CustomTheme.nightSecondaryFontColor),
                          ),
                          Container(
                            width: 40,
                            height: 2,
                            color: CustomTheme.primaryColor,
                          )
                        ],
                      )),
                  IconButton(
                    onPressed: () {
                      context
                          .read<AgentFormsReceivedBloc>()
                          .add(AgentFormsReceivedLoadingEvent());
                      context
                          .read<MainPageBloc>()
                          .add(ChangePageEvent(page: Pages.networkPage.name));
                    },
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/navbar/leads.png',
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Dashboard',
                          style: TextStyle(
                              color: CustomTheme.nightSecondaryFontColor),
                        ),
                        Container(
                          width: 40,
                          height: 2,
                          // color: CustomTheme.primaryColor,
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    width: 30,
                  ),

                  IconButton(
                      onPressed: () {
                        context
                            .read<MainPageBloc>()
                            .add(ChangePageEvent(page: Pages.feedPage.name));
                        context.read<FeedPageBloc>().add(FeedPageLoadingEvent(
                            userId: GlobalVariables.user.id, pageNumber: 1));
                      },
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/navbar/feed.png',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Feed',
                            style: TextStyle(
                                color: CustomTheme.nightSecondaryFontColor),
                          ),
                          Container(
                            width: 40,
                            height: 2,
                            // color: CustomTheme.primaryColor,
                          )
                        ],
                      )),

                  // IconButton(
                  //     onPressed: () {
                  // // context.read<AgentOpenFormsSentBloc>().add(
                  // //     AgentOpenFormsSentLoadingEvent(
                  // //         userId: GlobalVariables.user.id));
                  // context.read<ChatPanelBloc>().add(ChatPanelLoadingEvent());
                  // context.read<MainPageBloc>().add(
                  //     ChangePageEvent(page: Pages.notificationPage.name));
                  //     },
                  //     icon: Image.asset('assets/icons/navbar/chat.png')),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<ProfilePageBloc>(context).add(
                            ProfilePageLoadingEvent(
                                userId: GlobalVariables.user.id,
                                associateId: GlobalVariables.user.id));
                        context
                            .read<MainPageBloc>()
                            .add(ChangePageEvent(page: Pages.profilePage.name));

                        context.read<ProfilePostPageBloc>().add(
                            ProfilePostPageLoadingEvent(
                                userId: GlobalVariables.user.id));
                      },
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/navbar/profile.png',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Account',
                            style: TextStyle(
                                color: CustomTheme.nightSecondaryFontColor),
                          ),
                          Container(
                            width: 40,
                            height: 2,
                            // color: CustomTheme.primaryColor,
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
        body:
            BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
          if (state is MainPageInitialState) {
            return ReferralCentrePage(
              mainPageScaffoldKey: _key,
            );
          } else if (state is ProfilePageState) {
            return ProfilePage(
              userId: GlobalVariables.user.id,
            );
          } else if (state is NetworkPageState) {
            return const FormsMainPage();
          } else if (state is NotificationPageState) {
            return ChatPanelPage();
          } else if (state is FeedPageState) {
            return FeedPage(
              userId: GlobalVariables.user.id,
            );
          }

          return ReferralCentrePage(
            mainPageScaffoldKey: _key,
          );
        }));
  }
}
