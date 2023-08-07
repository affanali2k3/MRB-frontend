import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/edit_profile/view/edit_profile_view.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/main_page/bloc/main_page_bloc.dart';
import 'package:mrb/src/main_page/bloc/main_page_state.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/registor/view/registor_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
      if (state is LoginPageState) {
        return LoginPage();
      } else if (state is RegistorPageState) {
        return RegistorPage();
      } else if (state is ProfilePageState) {
        return ProfilePage();
      } else if (state is ProfileEditPageState) {
        return ProfileEditPage();
      }

      return LoginPage();
    }));
  }
}
