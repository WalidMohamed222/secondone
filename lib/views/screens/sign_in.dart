import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:secondone/app_settings.dart';
import 'package:secondone/views/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                width: 200,
                height: 180,
                child: Image.asset("assets/coffee1.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value!.length > 8 && value.length < 12) {
                      return null;
                    } else {
                      return "Invalid Phone number";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "Invalid Password";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print("Logged in");
                    }
                    final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    await prefs.setString(
                      AppSettings.emailSharedPrefsKey,
                      phoneNumberController.text,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );

                    passwordController.clear();
                  }
                },
                child: const Text("Log in"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  // Implement Forgot Password functionality
                  if (kDebugMode) {
                    print("Forgot Password");
                  }
                },
                child: const Text("Forgot Password?. Tap me"),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement Sign Up functionality
                  if (kDebugMode) {
                    print("Sign up");
                  }
                },
                child: const Text("No account, sign up"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}