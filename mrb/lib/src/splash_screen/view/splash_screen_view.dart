import 'package:flutter/material.dart';
import 'package:mrb/src/login/view/login.dart';
import 'package:mrb/src/registor/view/registor_view.dart';
import 'package:mrb/themes/font_theme.dart';
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
  String image = "assets/splash-screen-2.png";
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
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        )),
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ]),
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                        color:
                            page == 1 ? CustomTheme.primaryColor : Colors.grey,
                        borderRadius: BorderRadius.circular(4)),
                    width: page == 1 ? 20 : 5,
                    height: 4,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color:
                            page == 1 ? Colors.grey : CustomTheme.primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                    width: page == 1 ? 5 : 20,
                    height: 4,
                  )
                ]),
                const SizedBox(
                  height: 20,
                ),
              ]),
            ),
            Expanded(
                child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
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
                        image = "assets/splash-screen-1.png";
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
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
