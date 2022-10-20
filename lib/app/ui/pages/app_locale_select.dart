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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                await context.setLocale(const Locale('kk'));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 50.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "KZ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              //color: Colors.green,
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                await context.setLocale(Locale('en'));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 50.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "EN",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              //color: Colors.green,
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                await context.setLocale(const Locale('ru'));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 50.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "RU",
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
