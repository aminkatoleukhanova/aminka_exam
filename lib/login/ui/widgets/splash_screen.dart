import 'dart:async';

import 'package:flutter/material.dart';

import '../pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
      });
    });

    Timer(const Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color.fromRGBO(0, 122, 83, 1),
            Color.fromRGBO(0, 122, 83, 0.96),
            Color.fromRGBO(0, 122, 83, 0.92),
            Color.fromRGBO(1, 116, 84, 0.95),
            Color.fromRGBO(3, 107, 86, 1),
            Color.fromRGBO(4, 104, 86, 1),
            Color.fromRGBO(4, 101, 87, 1),
            Color.fromRGBO(6, 93, 88, 1),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: const Center(
          child: Center(child: Image(image: AssetImage("assets/logo.png"))),
        ),
      ),
    );
  }
}
