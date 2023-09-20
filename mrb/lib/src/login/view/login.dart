import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/cubit/login_state.dart';
import 'package:mrb/src/main_page/view/main_page_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_bloc.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_event.dart';
import 'package:mrb/themes/font_theme.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class LoginPage extends StatelessWidget {
  final _email = TextEditingController();
  final _password = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        body: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: double.infinity,
                    child: TextCustom('Your email address')),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffFEFEFE),
                      hintText: 'youremail@gmail.com',
                      errorText:
                          state is LoginInvalidEmailState ? state.error : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  controller: _email,
                ),
                const SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    child: TextCustom('Choose a password')),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffFEFEFE),
                    hintText: '********',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    errorText:
                        state is LoginInvalidPasswordState ? state.error : null,
                  ),
                  obscureText: true,
                  controller: _password,
                ),
                const SizedBox(height: 20),
                CustomButton(
                    onPressed: () {
                      context
                          .read<LoginCubit>()
                          .login(email: _email.text, password: _password.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage()));

                        context.read<ReferralCentreBloc>().add(
                            ReferralCentreLoadingEvent(
                                city: 'New York', state: 'California'));
                      }).onError((error, stackTrace) {
                        print(error);
                      });

                      GlobalVariables.socket =
                          IO.io('http://192.168.1.10:8080', <String, dynamic>{
                        'transports': ['websocket']
                      });
                      GlobalVariables.socket
                          .emit('user-connected', _email.text);
                    },
                    text: 'Continue'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: CustomTheme.nightSecondaryColor,
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    margin: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          context.read<LoginCubit>().googleLogin();
                        },
                        child: const Row(children: [
                          SizedBox(
                            width: 30,
                            child:
                                Image(image: AssetImage('assets/google.png')),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(fontSize: 16),
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
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {},
                        child: const Row(children: [
                          SizedBox(
                            width: 30,
                            child:
                                Image(image: AssetImage('assets/facebook.png')),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Sign in with Facebook',
                            style: TextStyle(fontSize: 16),
                          )
                        ]))),
              ],
            ),
          );
        }));
  }
}
