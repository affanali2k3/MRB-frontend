import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/login/bloc/login_bloc.dart';
import 'package:mrb/src/login/bloc/login_event.dart';
import 'package:mrb/src/login/bloc/login_state.dart';
import 'package:mrb/src/profile_page/view/profile_page_view.dart';
import 'package:mrb/src/registor/view/registor_view.dart';

class LoginPage extends StatelessWidget {
  final _email = TextEditingController();
  final _password = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login'),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Email',
                  errorText:
                      state is LoginInvalidEmailState ? state.error : null,
                  border: const OutlineInputBorder()),
              controller: _email,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: const OutlineInputBorder(),
                errorText:
                    state is LoginInvalidPasswordState ? state.error : null,
              ),
              obscureText: true,
              controller: _password,
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginLoginEvent(
                        email: _email.text, password: _password.text));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistorPage()));
                  },
                  child: const Text(
                    'Signup',
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      );
    }));
  }
}
