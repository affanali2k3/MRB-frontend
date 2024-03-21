import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/common/button.dart';
import 'package:mrb/src/login/cubit/login_cubit.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/themes/font_theme.dart';

class SplashScreenSecondPage extends StatelessWidget {
  const SplashScreenSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('Skip')]),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'List Your Referral!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Get verified buyers of your property with an easy to manage dashboard',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.blue,
                  width: 10,
                  height: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
            Expanded(
                child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  "assets/default_profile_photo.jpeg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text('Get Started'),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
