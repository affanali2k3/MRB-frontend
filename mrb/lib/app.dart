import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_bloc.dart';
import 'package:mrb/src/chat_page/repository/chat_page_repository.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_bloc.dart';
import 'package:mrb/src/login/bloc/login_bloc.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:mrb/src/edit_profile/repository/edit_profile_repository.dart';
import 'package:mrb/src/login/bloc/login_event.dart';
import 'package:mrb/src/login/repository/login_repository.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/main_page/bloc/main_page_bloc.dart';
import 'package:mrb/src/network_page/bloc/network_page_bloc.dart';
import 'package:mrb/src/network_page/repository/network_page_repository.dart';
import 'package:mrb/src/post_page/bloc/post_page_bloc.dart';
import 'package:mrb/src/post_page/repository/post_page_repository.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/repository/profile_page_repository.dart';
import 'package:mrb/src/registor/bloc/registor_bloc.dart';
import 'package:mrb/src/registor/repository/registor_repository.dart';
import 'package:mrb/src/search_page/bloc/search_page_bloc.dart';
import 'package:mrb/src/search_page/repository/search_page_repository.dart';
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
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => LoginBloc(repository: LoginRepository())),
              BlocProvider(
                  create: (_) =>
                      UserTimelineBloc(repository: UserTimelineRepository())),
              BlocProvider(
                  create: (_) =>
                      PostPageBloc(repository: PostPageRepository())),
              BlocProvider(create: (_) => FeedPageBloc()),
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
                  primarySwatch: Colors.blue,
                ),
                home: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        BlocProvider.of<LoginBloc>(context)
                            .add(ChangeLoginEvent());
                      } else {
                        BlocProvider.of<LoginBloc>(context)
                            .add(ChangeLogoutEvent());
                      }
                      return LoginPage();
                    }))));
  }
}
