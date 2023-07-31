import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/login/bloc/login_bloc.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:mrb/src/edit_profile/repository/edit_profile_repository.dart';
import 'package:mrb/src/edit_profile/view/edit_profile_view.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_bloc.dart';
import 'package:mrb/src/profile_page/repository/profile_page_repository.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/registor/bloc/registor_bloc.dart';
import 'package:mrb/src/registor/repository/registor_repository.dart';
import 'package:mrb/src/registor/view/registor_view.dart';

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
              BlocProvider(create: (_) => LoginBloc()),
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
                home: MainPage())));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data != null && !snapshot.data!.emailVerified) {
          print('Sending email verification');
          snapshot.data?.sendEmailVerification();
        }
        if (snapshot.hasData) {
          return ProfileEditPage();
        } else {
          return LoginPage();
        }
      },
    ));
  }
}
