import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/view/pages/profile_about_page.dart';
import 'package:mrb/src/profile_page/view/pages/profile_agent_reviews_page.dart';
import 'package:mrb/src/profile_page/view/pages/profile_network_page.dart';
import 'package:mrb/src/profile_page/view/pages/profile_posts_page.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_cover_name.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_tabs.dart';
import 'package:mrb/themes/font_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userId});

  final int userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        body: BlocConsumer<ProfilePageBloc, ProfilePageState>(
            listener: (context, state) {
          if (state is ProfilePageFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Error: ${state.error}")));
          }
        }, builder: (context, state) {
          if (state is ProfilePageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfilePageSuccessState) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    ProfileCoverNameWidget(
                      userId: userId,
                    ),
                    const ProfileBusinessStatsWidget(),
                    ProfileTabsWidget(
                      userId: userId,
                    ),
                    if (state.tab == ProfilePageTabs.profilePostsTab)
                      const ProfilePostsPage(),
                    if (state.tab == ProfilePageTabs.profileReviewsTab)
                      const ProfileAgentReviewsPage(),
                    if (state.tab == ProfilePageTabs.profileNetworkTab)
                      const ProfileNetworkPage(),
                    if (state.tab == ProfilePageTabs.profileAboutTab)
                      const ProfileAboutPage()
                  ],
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        }));
  }
}

// Widget associateAction(BuildContext context,
//     {required UserAssociationModel? userAssociaation,
//     required String profileEmail}) {
//   if (userAssociaation == null &&
//       profileEmail == FirebaseAuth.instance.currentUser?.email) {
//     return const SizedBox();
//   } else if (userAssociaation == null) {
//     return ElevatedButton(
//         onPressed: () => context.read<ProfilePageBloc>().add(
//             ProfilePageSendAssociateRequestEvent(
//                 senderEmail: FirebaseAuth.instance.currentUser!.email!,
//                 receiverEmail: profileEmail)),
//         child: const Text('Send Request'));
//   } else if (userAssociaation.senderEmail ==
//           FirebaseAuth.instance.currentUser?.email &&
//       userAssociaation.status == 'Pending') {
//     return const Text('Request already sent');
//   } else if (userAssociaation.receiverEmail ==
//           FirebaseAuth.instance.currentUser?.email &&
//       userAssociaation.status == 'Pending') {
//     return ElevatedButton(
//         onPressed: () {
//           context.read<ProfilePageBloc>().add(
//               ProfilePageAcceptAssociateRequestEvent(
//                   senderEmail: profileEmail,
//                   receiverEmail: FirebaseAuth.instance.currentUser!.email!));
//         },
//         child: const Text('Accept'));
//   } else if (userAssociaation.status == 'Accepted') {
//     return const Text('Associates');
//   } else {
//     return const Text('Error');
//   }
// }
