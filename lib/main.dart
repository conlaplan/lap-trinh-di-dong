import 'package:flutter/material.dart';
import 'package:my_app/screens/forgotpassword_sheet.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/signup_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Huit Care',
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgot-password': (context) => ForgotPasswordSheet(),
        '/home': (context) => HomeScreen(),
        '/finddoctor': (context) => HomeScreen(),
      },
    );
  }
}
