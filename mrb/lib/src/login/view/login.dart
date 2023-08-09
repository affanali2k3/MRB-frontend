import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/outline_button.dart';
import 'package:mrb/src/edit_profile/view/edit_profile_view.dart';
import 'package:mrb/src/login/bloc/login_bloc.dart';
import 'package:mrb/src/login/bloc/login_event.dart';
import 'package:mrb/src/login/bloc/login_state.dart';
import 'package:mrb/src/registor/view/registor_view.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
            const Text(
              'Login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20,
            ),
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
            CustomOutlineButton(
                onPressed: () {
                  context.read<LoginBloc>().add(LoginLoginEvent(
                      email: _email.text, password: _password.text));
                  GlobalVariables.socket =
                      IO.io('http://192.168.1.10:8080', <String, dynamic>{
                    'transports': ['websocket']
                  });
                  GlobalVariables.socket.emit('user-connected', _email.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileEditPage()));
                },
                text: 'Login'),
            const SizedBox(
              height: 20,
            ),
            CustomOutlineButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegistorPage())),
              text: 'Sign Up',
              primary: false,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginGoogleLoginEvent());
                    },
                    child: const Row(children: [
                      SizedBox(
                        width: 30,
                        child: Image(image: AssetImage('assets/google.png')),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(fontSize: 21),
                      )
                    ]))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: const Row(children: [
                      SizedBox(
                        width: 30,
                        child: Image(image: AssetImage('assets/facebook.png')),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Facebook Login',
                        style: TextStyle(fontSize: 21),
                      )
                    ]))),
          ],
        ),
      );
    }));
  }
}
