import 'package:flutter/material.dart';

void main() {
  runApp(const WelcomePage());
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text('Welcome'),
    );
  }
}
