import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/login/bloc/login_bloc.dart';
import 'package:mrb/src/login/bloc/login_event.dart';
import 'package:mrb/src/login/bloc/login_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome'),
          ElevatedButton(
              onPressed: () =>
                  context.read<LoginBloc>().add(LoginLogoutEvent()),
              child: Text('Logout'))
        ],
      );
    }));
  }
}
