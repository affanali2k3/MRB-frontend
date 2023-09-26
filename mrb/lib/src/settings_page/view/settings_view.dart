import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/themes/font_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.nightBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<LoginCubit>().logout();
                  },
                  text: 'Logout')
            ],
          ),
        ),
      ),
    );
  }
}
