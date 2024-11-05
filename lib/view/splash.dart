import 'package:new_ela/controllers/user_functions.dart';
import 'package:new_ela/model/user/user.dart';
import 'package:new_ela/view/intro.dart';
import 'package:new_ela/view/widget/notchbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    UserModel? userName = await fetchUserdata();

    Future.delayed(const Duration(seconds: 4), () {
      if (userName!=null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (ctx) => const Notchbar()),
        );
      } else {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const IntroPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                      'assets/images/9f93ae8f39417cd575e735bf5f1b1505.jpg'),
                ),
                const Text(
                  'ELA',
                  style: TextStyle(fontSize: 35),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
