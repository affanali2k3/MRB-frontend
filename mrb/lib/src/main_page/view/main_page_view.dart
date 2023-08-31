import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/feed_page/view/feed_page_view.dart';
import 'package:mrb/src/main_page/bloc/main_page_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_event.dart';
import 'package:mrb/src/main_page/bloc/main_page_state.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/referral_centre/view/referral_centre_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => context
                      .read<MainPageBloc>()
                      .add(ChangePageEvent(page: 1)),
                  icon: Image.asset('assets/icons/navbar/home.png')),
              IconButton(
                  onPressed: () => context
                      .read<MainPageBloc>()
                      .add(ChangePageEvent(page: 2)),
                  icon: Image.asset('assets/icons/navbar/network.png')),
              IconButton(
                  onPressed: () => context
                      .read<MainPageBloc>()
                      .add(ChangePageEvent(page: 3)),
                  icon: Image.asset('assets/icons/navbar/feed.png')),
              IconButton(
                  onPressed: () => context
                      .read<MainPageBloc>()
                      .add(ChangePageEvent(page: 4)),
                  icon: Image.asset('assets/icons/navbar/notification.png')),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<ProfilePageBloc>(context).add(
                        ProfilePageLoadingEvent(
                            userEmail: GlobalVariables.user.email,
                            associateEmail: GlobalVariables.user.email));
                    context.read<MainPageBloc>().add(ChangePageEvent(page: 5));
                  },
                  icon: Image.asset('assets/icons/navbar/profile.png')),
            ],
          ),
        ),
        body:
            BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
          if (state is MainPageInitialState) {
            return ReferralCentrePage();
          } else if (state is ProfilePageState) {
            return const ProfilePage();
          } else if (state is FeedPageState) {
            return FeedPage(
              userEmail: GlobalVariables.url,
            );
          }

          return ReferralCentrePage();
        }));
  }
}
