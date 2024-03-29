import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secondone/firebase_options.dart';
import 'package:secondone/views/screens/splash_screen.dart';

// Entry Point Of Dart program
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Entry point of Flutter Application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Creativa App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
