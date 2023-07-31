import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/registor/bloc/registor_bloc.dart';
import 'package:mrb/src/registor/bloc/registor_event.dart';
import 'package:mrb/src/registor/bloc/registor_state.dart';

class RegistorPage extends StatelessWidget {
  final _email = TextEditingController();
  final _password = TextEditingController();

  RegistorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<RegistorBloc, RegistorState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: const OutlineInputBorder(),
                errorText:
                    state is RegistorWrongEmailState ? state.error : null,
              ),
              controller: _email,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: const OutlineInputBorder(),
                helperText: state is RegistorSuccessState
                    ? 'Account Succesfully registered. You may login now.'
                    : null,
                helperStyle: const TextStyle(color: Colors.green),
                errorText:
                    state is RegistorWrongPasswordState ? state.error : null,
              ),
              obscureText: true,
              controller: _password,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<RegistorBloc>().add(RegistorSignUpEvent(
                        email: _email.text, password: _password.text));
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      );
    }));
  }
}
