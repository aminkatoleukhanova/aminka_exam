import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:amina_ex/components/style.dart';
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
      backgroundColor: const Color.fromARGB(255, 134, 190, 136),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: const Center(
                  child: Image(image: AssetImage("assets/uib2.png"))),
              height: _headerHeight,
            ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome,dear!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Sign in',
                        style:
                            TextStyle(color: Color.fromARGB(255, 46, 45, 45)),
                      ),
                      const SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Barcode', 'Enter your Barcode'),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      'Sign In'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Don't have an account? "),
                                  TextSpan(
                                    text: 'Create',
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
