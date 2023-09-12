import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';
import 'package:mrb/src/profile_page/view/pages/profile_agent_reviews_page.dart';
import 'package:mrb/src/profile_page/view/pages/profile_network_page.dart';
import 'package:mrb/src/profile_page/view/pages/profile_posts_page.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_connect_message.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_cover_name.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_tabs.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userId});

  final int userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1f1f23),
        body: BlocBuilder<ProfilePageBloc, ProfilePageState>(
            builder: (context, state) {
          print(state);
          if (state is ProfilePageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfilePageSuccessState) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    const ProfileCoverNameWidget(),
                    const ProfileBusinessStatsWidget(),
                    const ProfileConnectMessageWidget(),
                    ProfileTabsWidget(
                      userId: userId,
                    ),
                    if (state is ProfilePagePostTabState)
                      const ProfilePostsPage(),
                    if (state is ProfilePageReviewsTabState)
                      const ProfileAgentReviewsPage(),
                    if (state is ProfilePageNetworkTabState)
                      const ProfileNetworkPage(),
                  ],
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        }));
  }
}

Widget associateAction(BuildContext context,
    {required UserAssociationModel? userAssociaation,
    required String profileEmail}) {
  if (userAssociaation == null &&
      profileEmail == FirebaseAuth.instance.currentUser?.email) {
    return const SizedBox();
  } else if (userAssociaation == null) {
    return ElevatedButton(
        onPressed: () => context.read<ProfilePageBloc>().add(
            ProfilePageSendAssociateRequestEvent(
                senderEmail: FirebaseAuth.instance.currentUser!.email!,
                receiverEmail: profileEmail)),
        child: const Text('Send Request'));
  } else if (userAssociaation.senderEmail ==
          FirebaseAuth.instance.currentUser?.email &&
      userAssociaation.status == 'Pending') {
    return const Text('Request already sent');
  } else if (userAssociaation.receiverEmail ==
          FirebaseAuth.instance.currentUser?.email &&
      userAssociaation.status == 'Pending') {
    return ElevatedButton(
        onPressed: () {
          context.read<ProfilePageBloc>().add(
              ProfilePageAcceptAssociateRequestEvent(
                  senderEmail: profileEmail,
                  receiverEmail: FirebaseAuth.instance.currentUser!.email!));
        },
        child: const Text('Accept'));
  } else if (userAssociaation.status == 'Accepted') {
    return const Text('Associates');
  } else {
    return const Text('Error');
  }
}
