import 'dart:async';

import 'package:category/features/auth/view/auth_register_screen.dart';
import 'package:category/features/auth/view/login_screen.dart';
import 'package:category/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginScreen()), // Replace with your main screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/previews/025/894/618/original/cute-word-hello-cartoon-style-illustration-vector.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              const SpinKitThreeBounce(
                color: Colors.indigo,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
