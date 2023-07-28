import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/auth/bloc/auth_bloc.dart';
import 'package:mrb/auth/bloc/auth_event.dart';
import 'package:mrb/auth/bloc/auth_state.dart';
import 'package:mrb/registor/view/registor_view.dart';

class LoginPage extends StatelessWidget {
  final _email = TextEditingController();
  final _password = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _email,
          ),
          TextField(
            controller: _password,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthLoginEvent(
                    email: _email.text, password: _password.text));
              },
              child: const Text('Login')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegistorPage()));
              },
              child: const Text('Log in'))
        ],
      );
    }));
  }
}
