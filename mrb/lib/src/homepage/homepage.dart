import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/agent_forms_received/view/agent_forms_received_view.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_bloc.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_event.dart';
import 'package:mrb/src/feed_page/view/feed_page_view.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/cubit/login_state.dart';
import 'package:mrb/src/network_page/bloc/network_page_bloc.dart';
import 'package:mrb/src/network_page/bloc/network_page_event.dart';
import 'package:mrb/src/network_page/view/network_page_view.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_event.dart';
import 'package:mrb/src/referral_centre/view/referral_centre_view.dart';
import 'package:mrb/src/search_page/view/search_page_view.dart';
import 'package:mrb/src/sender_agent_form/view/sender_agent_form_view.dart';
import 'package:mrb/src/sent_client_referrals/bloc/sent_client_referrals_bloc.dart';
import 'package:mrb/src/sent_client_referrals/bloc/sent_client_referrals_event.dart';
import 'package:mrb/src/sent_client_referrals/view/sent_client_referrals_view.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_bloc.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_event.dart';
import 'package:mrb/src/user_timeline/view/user_timeline_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<NetworkPageBloc>(context)
                      .add(NetworkPageGetAssociatesEvent());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NetworkPage()));
                },
                text: 'Your Network'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<NetworkPageBloc>(context)
                      .add(NetworkPageGetAssociatesEvent());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                text: 'Search'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<FeedPageBloc>(context).add(
                      FeedPageLoadingEvent(
                          userEmail: FirebaseAuth.instance.currentUser!.email!,
                          pageNumber: '1'));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FeedPage(
                                userEmail:
                                    FirebaseAuth.instance.currentUser!.email!,
                              )));
                },
                text: 'Feed'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<FeedPageBloc>(context).add(
                      FeedPageLoadingEvent(
                          userEmail: FirebaseAuth.instance.currentUser!.email!,
                          pageNumber: '1'));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const ProfilePage(userId: ,)));
                },
                text: 'Profile Page'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<UserTimelineBloc>(context).add(
                      UserTimelineLoadingEvent(
                          userEmail:
                              FirebaseAuth.instance.currentUser!.email!));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserTimelinePage(
                                userEmail:
                                    FirebaseAuth.instance.currentUser!.email!,
                              )));
                },
                text: 'Timeline'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SenderAgentFormPage()));
                },
                text: 'Sender Agent Form'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<AgentFormsReceivedBloc>(context)
                      .add(AgentFormsReceivedLoadingEvent());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AgentFormsReceivedPage()));
                },
                text: 'Client referrals received'),
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<SentClientReferralsBloc>(context)
                      .add(SentClientReferralsDirectLoadingEvent());
                  BlocProvider.of<SentClientReferralsBloc>(context)
                      .add(SentClientReferralsOpenLoadingEvent());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const ProfilePage()));
                },
                text: 'Client referrals sent'),
            CustomOutlineButton(
                onPressed: () {
                  BlocProvider.of<ReferralCentreBloc>(context).add(
                      ReferralCentreLoadingEvent(
                          state: 'California', city: 'Los Angeles'));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReferralCentrePage()));
                },
                text: 'Referral Centre'),
          ]);
    }));
  }
}
