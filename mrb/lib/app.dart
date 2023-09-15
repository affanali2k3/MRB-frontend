import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_bloc.dart';
import 'package:mrb/src/chat_panel_page/repository/chat_panel_repository.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_forms_received/repository/agent_forms_received_repository.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_bloc.dart';
import 'package:mrb/src/agent_open_forms_sent/repository/agent_forms_received_repository.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_bloc.dart';
import 'package:mrb/src/chat_page/repository/chat_page_repository.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_bloc.dart';
import 'package:mrb/src/feed_page/repository/feed_page_repository.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:mrb/src/edit_profile/repository/edit_profile_repository.dart';
import 'package:mrb/src/login/repository/login_repository.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/main_page/bloc/main_page_bloc.dart';
import 'package:mrb/src/network_page/bloc/network_page_bloc.dart';
import 'package:mrb/src/network_page/repository/network_page_repository.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_bloc.dart';
import 'package:mrb/src/post_comments/repository/post_comments_repository.dart';
import 'package:mrb/src/post_page/bloc/post_page_bloc.dart';
import 'package:mrb/src/post_page/repository/post_page_repository.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/repository/profile_page_repository.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/repository/referral_centre_repository.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_bloc.dart';
import 'package:mrb/src/registor/bloc/registor_bloc.dart';
import 'package:mrb/src/registor/repository/registor_repository.dart';
import 'package:mrb/src/search_page/bloc/search_page_bloc.dart';
import 'package:mrb/src/search_page/repository/search_page_repository.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_bloc.dart';
import 'package:mrb/src/sender_agent_form/repository/sender_agent_form_repository.dart';
import 'package:mrb/src/sent_client_referrals/bloc/sent_client_referrals_bloc.dart';
import 'package:mrb/src/sent_client_referrals/repository/sent_client_referrals_repository.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_bloc.dart';
import 'package:mrb/src/user_timeline/repository/user_timeline_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => ProfileRepository()),
          RepositoryProvider(create: (_) => ProfilePageRepository()),
          RepositoryProvider(create: (_) => LoginRepository()),
          RepositoryProvider(create: (_) => NetworkPageRepository()),
          RepositoryProvider(create: (_) => SearchPageRepository()),
          RepositoryProvider(create: (_) => ChatPageRepository()),
          RepositoryProvider(create: (_) => PostPageRepository()),
          RepositoryProvider(create: (_) => UserTimelineRepository()),
          RepositoryProvider(create: (_) => PostCommentsRepository()),
          RepositoryProvider(create: (_) => FeedPageRepository()),
          RepositoryProvider(create: (_) => SenderAgentFormRepository()),
          RepositoryProvider(create: (_) => ReferralCentreRepository()),
          RepositoryProvider(create: (_) => SentClientReferralsRepository()),
          RepositoryProvider(create: (_) => ChatPanelRepository()),
          RepositoryProvider(create: (_) => AgentFormsReceivedRepository()),
          RepositoryProvider(create: (_) => AgentOpenFormsSentRepository()),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => LoginCubit(repository: LoginRepository())),
              BlocProvider(create: (_) => ReferralPostBloc()),
              BlocProvider(
                  create: (_) =>
                      ChatPanelBloc(repository: ChatPanelRepository())),
              BlocProvider(
                  create: (_) => ReferralCentreBloc(
                      repository: ReferralCentreRepository())),
              BlocProvider(
                  create: (_) => SentClientReferralsBloc(
                      repository: SentClientReferralsRepository())),
              BlocProvider(
                  create: (_) => AgentOpenFormsSentBloc(
                      repository: AgentOpenFormsSentRepository())),
              BlocProvider(
                  create: (_) => AgentFormsReceivedBloc(
                      repository: AgentFormsReceivedRepository())),
              BlocProvider(
                  create: (_) => SenderAgentFormBloc(
                      repository: SenderAgentFormRepository())),
              BlocProvider(
                  create: (_) =>
                      PostCommentsBloc(repository: PostCommentsRepository())),
              BlocProvider(
                  create: (_) =>
                      UserTimelineBloc(repository: UserTimelineRepository())),
              BlocProvider(
                  create: (_) =>
                      PostPageBloc(repository: PostPageRepository())),
              BlocProvider(
                  create: (_) =>
                      FeedPageBloc(repository: FeedPageRepository())),
              BlocProvider(
                  create: (_) =>
                      ChatPageBloc(repository: ChatPageRepository())),
              BlocProvider(
                  create: (_) =>
                      NetworkPageBloc(repository: NetworkPageRepository())),
              BlocProvider(
                  create: (_) =>
                      SearchPageBloc(repository: SearchPageRepository())),
              BlocProvider(create: (_) => MainPageBloc()),
              BlocProvider(
                  create: (_) => ProfileBloc(repository: ProfileRepository())),
              BlocProvider(
                  create: (_) =>
                      ProfilePageBloc(repository: ProfilePageRepository())),
              BlocProvider(
                  create: (_) => RegistorBloc(repository: RegistorRepository()))
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  textTheme: GoogleFonts.poppinsTextTheme(),
                  primarySwatch: Colors.blue,
                ),
                home: LoginPage())));
    // home: StreamBuilder<User?>(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshot) {
    //       return LoginPage();
    //     }))));
  }
}
