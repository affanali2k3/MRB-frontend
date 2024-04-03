import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/profile_completion_page/view/profile_completion_view.dart';
import 'package:mrb/src/registor/bloc/registor_bloc.dart';
import 'package:mrb/src/registor/bloc/registor_event.dart';
import 'package:mrb/src/registor/bloc/registor_state.dart';
import 'package:mrb/themes/font_theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool obscurePassowrd = true;
  bool obscureConfirmPassowrd = true;
  String? confirmPasswordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<RegistorBloc, RegistorState>(
            listener: (context, state) {
      if (state is RegistorSuccessState) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileCompletionPage(),
            ));
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset('assets/logo.png'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome to MRB',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Enter email address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  errorText: state is RegistorFailedState ? state.error : null,
                ),
                controller: _email,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          obscurePassowrd = !obscurePassowrd;
                        });
                      },
                    ),
                    hintText: 'Create Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    errorText: confirmPasswordError),
                obscureText: obscurePassowrd,
                controller: _password,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassowrd = !obscureConfirmPassowrd;
                      });
                    },
                  ),
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  helperText: state is RegistorSuccessState
                      ? 'Account Succesfully registered. You may login now.'
                      : null,
                  helperStyle: const TextStyle(color: Colors.green),
                  errorText: state is RegistorFailedState ? state.error : null,
                ),
                obscureText: obscureConfirmPassowrd,
                controller: _confirmPassword,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_password.text != _confirmPassword.text) {
                    setState(() {
                      confirmPasswordError = "Passwords do not match";
                    });

                    return;
                  }

                  confirmPasswordError = null;

                  context.read<RegistorBloc>().add(RegistorSignUpEvent(
                      email: _email.text, password: _password.text));
                },
                child: Container(
                  // width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0xff1868fd),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      Text(
                        ' Sign Up with Email',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              // CustomOutlineButton(
              //     onPressed: () => context.read<RegistorBloc>().add(
              //         RegistorSignUpEvent(
              //             email: _email.text, password: _password.text)),
              //     text: 'Sign Up with Email'),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  // padding: const EdgeInsets.symmetric(horizontal: 80),
                  alignment: Alignment.center,
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
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                  // padding: const EdgeInsets.symmetric(horizontal: 80),
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1c5799),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 30,
                              child: Image(
                                  image: AssetImage('assets/facebook.png')),
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
                    "Already have an account?",
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: CustomTheme.primaryColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }));
  }
}
