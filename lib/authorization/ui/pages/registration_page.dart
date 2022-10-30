import 'package:amina_ex/authorization/ui/pages/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:amina_ex/authorization/ui/pages/login_page.dart';

import '../../../translations/locale_keys.g.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 15, 54, 16),
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 8, 60, 39),
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: const Icon(
                                  Icons.add_circle,
                                  color: Color.fromARGB(255, 3, 53, 45),
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 8, 60, 39),
                              ),
                              labelText: LocaleKeys.first.tr(),
                              hintText: LocaleKeys.enterfirst.tr()),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.person_add,
                                color: Color.fromARGB(255, 8, 60, 39),
                              ),
                              labelText: LocaleKeys.last.tr(),
                              hintText: LocaleKeys.enterlast.tr()),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.mail,
                                color: Color.fromARGB(255, 8, 60, 39),
                              ),
                              labelText: LocaleKeys.address.tr(),
                              hintText: LocaleKeys.entermail.tr()),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            // ignore: prefer_is_not_empty
                            if (!(val!.isEmpty) &&
                                !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    .hasMatch(val)) {
                              return LocaleKeys.enteradd.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.phone_rounded,
                                color: Color.fromARGB(255, 8, 60, 39),
                              ),
                              labelText: LocaleKeys.mobile.tr(),
                              hintText: "7(XXX)XXX-XX-XX"),
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            // ignore: prefer_is_not_empty
                            if (!(val!.isEmpty) &&
                                !RegExp(r"^(\d+)*$").hasMatch(val)) {
                              return LocaleKeys.enternum.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 8, 60, 39),
                              ),
                              labelText: LocaleKeys.password.tr(),
                              hintText: LocaleKeys.enterpass.tr()),
                          validator: (val) {
                            // ignore: prefer_is_not_empty
                            if (!(val!.isEmpty) &&
                                !RegExp(r"^[a-zA-AaZz-zA-Z0-9]+$")
                                    .hasMatch(val)) {
                              return LocaleKeys.pleasepass.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text(
                                      LocaleKeys.conditions.tr(),
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 87, 87, 87)),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return LocaleKeys.need.tr();
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 9, 55, 39),
                              onPrimary: const Color.fromARGB(255, 20, 108, 52),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                LocaleKeys.register.tr().toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage()),
                                    (Route<dynamic> route) => false);
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(text: LocaleKeys.member.tr()),
                            TextSpan(
                              text: LocaleKeys.sign.tr(),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 7, 52, 7)),
                            ),
                          ])),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
