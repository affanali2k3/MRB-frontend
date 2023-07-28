import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/auth/bloc/auth_bloc.dart';
import 'package:mrb/auth/view/login.dart';
import 'package:mrb/homepage/homepage.dart';
import 'package:mrb/profile/bloc/profile_bloc.dart';
import 'package:mrb/profile/repository/profile_repository.dart';
import 'package:mrb/profile/view/profile_view.dart';
import 'package:mrb/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/profile_page/repository/profile_page_repository.dart';
import 'package:mrb/registor/bloc/registor_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => ProfileRepository()),
          RepositoryProvider(create: (_) => ProfilePageRepository())
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AuthBloc()),
              BlocProvider(
                  create: (_) => ProfileBloc(repository: ProfileRepository())),
              BlocProvider(
                  create: (_) =>
                      ProfilePageBloc(repository: ProfilePageRepository())),
              BlocProvider(create: (_) => RegistorBloc())
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return ProfileEditPage();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return LoginPage();
                    }))));
  }
}
