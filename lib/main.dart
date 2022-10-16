import 'package:flutter/material.dart';

import 'login/ui/widgets/splash_screen.dart';

void main() {
  runApp(const LoginUiApp());
}

class LoginUiApp extends StatelessWidget {
  const LoginUiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: const SplashScreen(title: 'Flutter Login UI'),
    );
  }
}
