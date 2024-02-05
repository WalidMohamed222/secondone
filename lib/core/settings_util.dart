import 'package:flutter/material.dart';
import 'package:secondone/app_settings.dart';
import 'package:secondone/views/screens/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsUtil {
  static Future<void> signOutFlow(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to sign out?'),
                Text('You will need to log in again.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                final SharedPreferences prefs =
                await SharedPreferences.getInstance();
                await prefs.remove(AppSettings.emailSharedPrefsKey);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<String> getCachedUserPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppSettings.emailSharedPrefsKey) ?? "--";
  }
}