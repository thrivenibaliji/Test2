import 'package:flutter/material.dart';
import 'package:triveni_3399/features/login1/view/sign_screen.dart';
import 'package:triveni_3399/features/signin/view/signup_screen.dart';
import 'package:triveni_3399/features/splash/view/splash_screen.dart';

import 'package:triveni_3399/features/login/view/login_screen.dart'; // Add your login screen import here

void main() {
  runApp(const FitKitApp());
}

class FitKitApp extends StatelessWidget {
  const FitKitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => SplashScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(), 
        '/login1': (context) => SignScreen(), // Add the login route here
        // Define the login route here
      },
    );
  }
}
