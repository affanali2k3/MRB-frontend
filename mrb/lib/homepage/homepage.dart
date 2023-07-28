import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/auth/bloc/auth_bloc.dart';
import 'package:mrb/auth/bloc/auth_event.dart';
import 'package:mrb/auth/bloc/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome'),
          ElevatedButton(
              onPressed: () => context.read<AuthBloc>().add(AuthLogoutEvent()),
              child: Text('Logout'))
        ],
      );
    }));
  }
}
