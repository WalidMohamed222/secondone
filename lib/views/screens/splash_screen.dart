import 'package:flutter/material.dart';
import 'package:secondone/app_settings.dart';
import 'package:secondone/views/screens/home_page.dart';
import 'package:secondone/views/screens/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleLogin();
  }

  Future<void> handleLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userPhoneNumber =
    prefs.getString(AppSettings.emailSharedPrefsKey);
    Future.delayed(const Duration(seconds: 2), () {
      if (userPhoneNumber == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             FlutterLogo(
              size: 150,
            ),
            SizedBox(height: 20),
            Text(
              "TanTawy",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}