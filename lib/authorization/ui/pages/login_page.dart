import 'package:amina_ex/authorization/ui/pages/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../translations/locale_keys.g.dart';
import '../../bloc/auth_bloc_bloc.dart';
import 'registration_page.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final barcodeContoller = TextEditingController();
  final passwordContoller = TextEditingController();
  final Key _formKey = GlobalKey<FormState>();
  late AuthBlocBloc authBloc;

  @override
  void initState() {
    authBloc = AuthBlocBloc();
    super.initState();
  }

  void dispose() {
    barcodeContoller.dispose();
    passwordContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Center(
                child: Lottie.asset("assets/animation/loading.json",
                    width: 1000, height: 350),
              ),
              buildAuthBlocListener(),
              const SizedBox(height: 30),
              buildTextFormFiled(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAuthBlocListener() {
    return BlocConsumer(
      bloc: authBloc,
      listener: (context, state) {
        if (state is LoadedAuthState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfilePage()));
        }
        if (state is FailureLoginState) {
          showError(context);
        }
      },
      builder: (context, state) {
        if (state is LoadingAuthState) {
          return Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              color: Colors.white.withOpacity(0.2),
              child: const Center(
                child: LinearProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Color.fromARGB(255, 5, 55, 7),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildTextFormFiled() {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          children: [
            Text(
              LocaleKeys.welcome.tr(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              LocaleKeys.sign.tr(),
              style: const TextStyle(color: Color.fromARGB(255, 46, 45, 45)),
            ),
            const SizedBox(height: 15.0),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: barcodeContoller,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.barcode.tr(),
                        hintText: LocaleKeys.enterbar.tr(),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 12, 86, 50),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 22, 34, 102))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 76, 43))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: const BorderSide(color: Colors.red)),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: passwordContoller,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 12, 86, 50),
                        ),
                        labelText: LocaleKeys.password.tr(),
                        hintText: LocaleKeys.enterpass.tr(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 22, 102, 51))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 76, 43))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: const BorderSide(color: Colors.red)),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 20, 108, 52),
                        backgroundColor: const Color.fromARGB(255, 9, 55, 39),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(55, 15, 55, 15),
                        child: Text(
                          LocaleKeys.sign.tr().toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        String username = barcodeContoller.text;
                        String password = passwordContoller.text;

                        authBloc.add(GetAuthEvent(username, password));
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
        ));
  }

  Future<void> showError(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Error"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            OutlinedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
