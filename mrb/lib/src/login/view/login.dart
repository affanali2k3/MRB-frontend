import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/cubit/login_state.dart';
import 'package:mrb/src/main_page/view/main_page_view.dart';
import 'package:mrb/src/profile_completion_page/view/profile_completion_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/referral_centre/view/referral_centre_view.dart';
import 'package:mrb/src/registor/view/registor_view.dart';
import 'package:mrb/src/splash_screen/view/splash_screen_view.dart';
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
        body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) async {
          if (state is LoginUserNotExistState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileCompletionPage(),
                ));
          }
          if (state is LoginSuccessState) {
            GlobalVariables.authorization =
                await FirebaseAuth.instance.currentUser!.getIdToken() as String;

            if (!context.mounted) return;

            context.read<LoginCubit>().getUserData(email: _email.text);
          } else if (state is LoginSuccessfullyGotDataState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileCompletionPage(),
                ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("State is $state")));
          }
        }, builder: (context, state) {
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
                          .login(email: _email.text, password: _password.text);
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dont have an account?",
                      style: TextStyle(color: CustomTheme.nightFontColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: CustomTheme.primaryColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }));
  }
}
