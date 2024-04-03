import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/cubit/login_state.dart';
import 'package:mrb/src/main_page/view/main_page_view.dart';
import 'package:mrb/src/profile_completion_page/view/profile_completion_view.dart';
import 'package:mrb/src/profile_page/view/widgets/profile_business_stats.dart';
import 'package:mrb/src/registor/view/registor_view.dart';
import 'package:mrb/themes/font_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.nightBackgroundColor,
        body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) async {
          print('State = ${state}');
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

            context.read<LoginCubit>().getUserData(
                email: state.type == LoginTypes.email
                    ? _email.text
                    : FirebaseAuth.instance.currentUser!.email!);
          } else if (state is LoginSuccessfullyGotDataState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ));
          } else if (state is LoginFailedGettingDataState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/logo.png"),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Welcome to MRB',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: const Color(0xffFEFEFE),
                        hintText: 'youremail@gmail.com',
                        errorText: state is LoginFailedState &&
                                state.type == LoginPageErrors.invalidEmailFormat
                            ? state.error
                            : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    controller: _email,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: double.infinity,
                      child: TextCustom('Choose a password')),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: const Color(0xffFEFEFE),
                        hintText: '********',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorText: state is LoginFailedState &&
                                state.type == LoginPageErrors.invalidPassword
                            ? state.error
                            : null),
                    obscureText: obscurePassword,
                    controller: _password,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('Forgot Password?')],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      onPressed: () {
                        context.read<LoginCubit>().login(
                            email: _email.text, password: _password.text);
                      },
                      text: 'Login'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have an account?",
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
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 0.5,
                        color: CustomTheme.nightSecondaryColor,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          width: 100,
                          color: CustomTheme.nightBackgroundColor,
                          child: const Text('Sign In with')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/apple.png',
                            width: 50,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/facebook2.png',
                            width: 50,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/linkedin.png',
                            width: 50,
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<LoginCubit>().googleLogin();
                          },
                          icon: Image.asset(
                            'assets/google.png',
                            width: 42,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
