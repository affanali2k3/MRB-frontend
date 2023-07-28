import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/auth/view/login.dart';
import 'package:mrb/registor/bloc/registor_bloc.dart';
import 'package:mrb/registor/bloc/registor_event.dart';
import 'package:mrb/registor/bloc/registor_state.dart';

class RegistorPage extends StatelessWidget {
  final _email = TextEditingController();
  final _password = TextEditingController();

  RegistorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<RegistorBloc, RegistorState>(builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _email,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<RegistorBloc>().add(RegistorSignUpEvent(
                    email: _email.text, password: _password.text));
              },
              child: const Text('Sign In')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text('Log in'))
        ],
      );
    }));
  }
}
