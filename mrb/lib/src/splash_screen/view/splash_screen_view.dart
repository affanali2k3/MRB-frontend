import 'package:flutter/material.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/registor/view/registor_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenPage> {
  String heading = "Exclusive Real Estate Leads Await";
  String text =
      "Embark on your journey to find the perfect home with our comprehensive real estate leads service";
  String image = "assets/default_profile_photo.jpeg";
  int page = 1;
  late bool showSplashScreen;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      showSplashScreen = prefs.getBool("splash_screen") ?? true;

      if (!showSplashScreen) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      }
    });
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
                Text(
                  heading,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  text,
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
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                InkWell(
                  onTap: () async {
                    if (page == 2) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool("splash_screen", false);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    } else {
                      setState(() {
                        heading = "List your referral";
                        text =
                            "Get verified buyers of your referral with an easy to manage dashboard";
                        image = "assets/facebook.png";
                        page = 2;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 10),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text('Get Started'),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
