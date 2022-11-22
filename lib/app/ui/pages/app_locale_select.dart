import 'package:amina_ex/authorization/ui/pages/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocalePage extends StatefulWidget {
  const AppLocalePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppLocalePageState();
  }
}

class _AppLocalePageState extends State<AppLocalePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
    );
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: style,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                await context.setLocale(const Locale('kk'));
              },

              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 42, 13),
                        Color.fromARGB(255, 17, 105, 76)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "🇰🇿 ҚАЗАҚША",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              //color: Colors.green,
            ),
            const SizedBox(height: 3),
            ElevatedButton(
              style: style,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                await context.setLocale(const Locale('en'));
              },
              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 42, 13),
                        Color.fromARGB(255, 17, 105, 76)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "🇬🇧 ENGLISH",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            ElevatedButton(
              style: style,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                await context.setLocale(const Locale('ru'));
              },

              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 42, 13),
                        Color.fromARGB(255, 17, 105, 76)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "🇷🇺 РУССКИЙ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              //color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
