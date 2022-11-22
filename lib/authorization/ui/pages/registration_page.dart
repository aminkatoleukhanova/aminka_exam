import 'dart:convert';
import 'dart:developer';
import 'package:amina_ex/authorization/ui/pages/prof_page.dart';
import 'package:http/http.dart' as http;
import 'package:amina_ex/authorization/ui/widgets/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import '../../../translations/locale_keys.g.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final List<String> _countries = [
    LocaleKeys.kz.tr(),
    LocaleKeys.uk.tr(),
    LocaleKeys.ru.tr(),
    LocaleKeys.kg.tr(),
  ];
  String _selectedCountry = LocaleKeys.kz.tr();

  final List<String> _gender = [
    LocaleKeys.males.tr(),
    LocaleKeys.females.tr(),
    LocaleKeys.others.tr()
  ];
  String _selectedGender = LocaleKeys.males.tr();

  final List<String> _speciality = [
    LocaleKeys.information.tr(),
    LocaleKeys.business.tr(),
    LocaleKeys.marketing.tr(),
    LocaleKeys.economic.tr(),
  ];
  String _selectedSpeciality = LocaleKeys.information.tr();

  final _nameFocus = FocusNode();
  final _mailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(
          child: Text(
            LocaleKeys.register.tr(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // ignore: prefer_const_literals_to_create_immutables
                  colors: <Color>[
                Color.fromARGB(255, 9, 75, 53),
                Color.fromARGB(255, 6, 42, 13),
              ])),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              child: Lottie.asset("assets/animation/hat.json", width: 200),
            ),
            TextFormField(
              focusNode: _nameFocus,
              autofocus: false,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _mailFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: LocaleKeys.fullname.tr(),
                hintText: LocaleKeys.name2.tr(),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 12, 86, 50),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.orange,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 22, 102, 51), width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 38, 178, 155), width: 1.0),
                ),
              ),
              validator: validateName,
              onSaved: (value) => newUser.name = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _mailFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _mailFocus, _phoneFocus);
              },
              controller: _emailController,
              decoration: InputDecoration(
                labelText: LocaleKeys.address.tr(),
                hintText: LocaleKeys.entermail.tr(),
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Color.fromARGB(255, 12, 86, 50),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _emailController.clear();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.orange,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 38, 178, 155), width: 1.0),
                ),
              ),
              validator: validateEmail,
              onSaved: (value) => newUser.email = value!,
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passFocus);
              },
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: LocaleKeys.mobile.tr(),
                hintText: '8(7хх)-ххх-хххх',
                prefixIcon: const Icon(
                  Icons.call,
                  color: Color.fromARGB(255, 12, 86, 50),
                ),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    _phoneController.clear();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.orange,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 38, 178, 155), width: 1.0),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'^[8()\d -]{1,15}$'),
                    allow: true),
              ],
              validator: (value) =>
                  validatePhoneNumber(value!) ? null : LocaleKeys.enternum.tr(),
              onSaved: (value) => newUser.phone = value!,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(
                  Icons.map,
                  color: Color.fromARGB(255, 12, 86, 50),
                ),
                labelText: LocaleKeys.country.tr(),
              ),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (country) {
                setState(() {
                  _selectedCountry = country as String;
                  newUser.country = country;
                });
              },
              value: _selectedCountry,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(Icons.grade,
                    color: Color.fromARGB(255, 12, 86, 50)),
                labelText: LocaleKeys.gender.tr(),
              ),
              items: _gender.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (gender) {
                setState(() {
                  _selectedGender = gender as String;
                  newUser.gender = gender;
                });
              },
              value: _selectedGender,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                icon: const Icon(
                  Icons.grading,
                  color: Color.fromARGB(255, 12, 86, 50),
                ),
                labelText: LocaleKeys.speciality.tr(),
              ),
              items: _speciality.map((speciality) {
                return DropdownMenuItem(
                  value: speciality,
                  child: Text(speciality),
                );
              }).toList(),
              onChanged: (speciality) {
                setState(() {
                  _selectedSpeciality = speciality as String;
                  newUser.speciality = speciality;
                });
              },
              value: _selectedSpeciality,
            ),
            const SizedBox(height: 20),
            TextFormField(
              focusNode: _passFocus,
              controller: _passController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: LocaleKeys.password.tr(),
                hintText: LocaleKeys.enterpass.tr(),
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                icon: const Icon(
                  Icons.security,
                  color: Color.fromARGB(255, 12, 86, 50),
                ),
              ),
              validator: _validatePassword,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _confirmPassController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: LocaleKeys.confirmpass.tr(),
                hintText: LocaleKeys.confirmpass1.tr(),
                icon: const Icon(
                  Icons.border_color,
                  color: Color.fromARGB(255, 12, 86, 50),
                ),
              ),
              validator: _validatePassword,
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                    ]),
              ),
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 20, 108, 52),
                  backgroundColor: const Color.fromARGB(255, 9, 55, 39),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Text(
                    LocaleKeys.register.tr().toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    //color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _showDialog(name: _nameController.text);
      log('Name: ${_nameController.text}');
      log('Phone: ${_phoneController.text}');
      log('Email: ${_emailController.text}');
      log('Country: $_selectedCountry');
      log('Gender: $_selectedGender');
      log('Speciality: $_selectedSpeciality');
    } else {
      _showMessage(message: 'Form is not valid! Please review and correct');
    }
  }

  String? validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return LocaleKeys.enterfull.tr();
    } else if (!nameExp.hasMatch(value)) {
      return LocaleKeys.fullname.tr();
    } else {
      return null;
    }
  }

  bool validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^8\d\d\d\d\d\d\d\d\d\d$');
    return phoneExp.hasMatch(input);
  }

  String? validateEmail(String? value) {
    if (value == null) {
      return LocaleKeys.entermail.tr();
    } else if (!_emailController.text.contains('@')) {
      return LocaleKeys.enteradd.tr();
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passController.text.length != 8) {
      return LocaleKeys.pleasepass.tr();
    } else if (_confirmPassController.text != _passController.text) {
      return LocaleKeys.enterpass.tr();
    } else {
      return null;
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Registration successful',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          content: Text(
            '$name is now a verified register form',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(
                      userInfo: newUser,
                    ),
                  ),
                );
              },
              child: const Text(
                'Verified',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
