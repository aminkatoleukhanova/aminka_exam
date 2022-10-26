import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../translations/locale_keys.g.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: const Center(
                  child: Image(image: AssetImage("assets/images/123.png"))),
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.welcome.tr(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        LocaleKeys.sign.tr(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 46, 45, 45)),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: LocaleKeys.barcode.tr(),
                                  hintText: LocaleKeys.enterbar.tr(),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 12, 86, 50),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 22, 34, 102))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 8, 76, 43))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Color.fromARGB(255, 12, 86, 50),
                                  ),
                                  labelText: LocaleKeys.password.tr(),
                                  hintText: LocaleKeys.enterpass.tr(),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 22, 102, 51))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 8, 76, 43))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    LocaleKeys.forgot.tr(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: const Offset(2, 4),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ],
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromARGB(255, 9, 55, 39),
                                          Color.fromARGB(255, 20, 108, 52)
                                        ])),
                                child: Text(
                                  LocaleKeys.sign.tr().toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: LocaleKeys.account.tr(),
                                  ),
                                  TextSpan(
                                    text: LocaleKeys.create.tr(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistrationPage()));
                                      },
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 7, 52, 7)),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
