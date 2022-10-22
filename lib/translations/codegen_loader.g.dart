// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "welcome": "Welcome!",
    "barcode": "Barcode",
    "password": "Password",
    "sign": "Sign in",
    "forgot": "Forgot your password? ",
    "account": "Don't have an account? ",
    "create": "Create",
    "enterbar": "Enter your barcode",
    "enterpass": "Enter your password",
    "first": "First name",
    "last": "Last name",
    "address": "E-mail address",
    "mobile": "Mobile number",
    "conditions": "I accept all terms and conditions",
    "register": "Register",
    "member": "Already A Member? ",
    "need": "You need to accept terms and conditions",
    "pleasepass":
        "The password must consist of at least 1 capital letter and a number, contain at least 3 characters",
    "enternum": "Enter a valid phone number",
    "enteradd": "Enter a valid email address",
    "entermail": "Enter your email",
    "enterlast": "Enter your last name",
    "enterfirst": "Enter your first name"
  };
  static const Map<String, dynamic> kk = {
    "welcome": "Қош келдіңіз!",
    "barcode": "Баркод",
    "password": "Құпиясөз",
    "sign": "Кіру",
    "forgot": "Құпиясөзді ұмыттыңызба? ",
    "account": "Сізде аккаунт жоқ па? ",
    "create": "Тіркелу",
    "enterbar": "Баркодты енгізіңіз",
    "enterpass": "Құпиясөзді енгізіңіз",
    "first": "Есіміңіз",
    "last": "Тегіңіз",
    "address": "Электрондық поштаңыз",
    "mobile": "Ұялы телефон номеріңіз",
    "conditions": "Мен барлық шарттарды қабылдаймын",
    "register": "Тіркелу",
    "member": "Тіркеліп қойдыңызба?",
    "need": "Сіз шарттарды қабылдауыңыз керек",
    "pleasepass":
        "Құпия сөз кем дегенде 1 бас әріп пен саннан тұруы керек, кемінде 3 таңбадан тұруы керек",
    "enternum": "Жарамды телефон нөмірін енгізіңіз",
    "enteradd": "Өтінеміз қолданыстағы электронды пошта адресін енгізіңіз",
    "entermail": "Электрондық поштаңызды енгізіңіз",
    "enterlast": "Тегіңізді енгізіңіз",
    "enterfirst": "Есіміңізді енгізіңіз"
  };
  static const Map<String, dynamic> ru = {
    "welcome": "Добро пожаловать!",
    "barcode": "Баркод",
    "password": "Пароль",
    "sign": "Войти",
    "forgot": "Забыли пароль? ",
    "account": "У вас нет аккаунта? ",
    "create": "Зарегистрируйтесь",
    "enterbar": "Введите баркод",
    "enterpass": "Введите пароль",
    "first": "Имя",
    "last": "Фамилия",
    "address": "Электронная почта",
    "mobile": "Номер телефона",
    "conditions": "Я принимаю все условия",
    "register": "Зарегистрироваться",
    "member": "У вас уже есть аккаунт?",
    "need": "Вам необходимо принять условия",
    "pleasepass":
        "Пароль должен состоять не менее чем из 1 заглавной буквы и цифры, содержать не менее 3 символов",
    "enternum": "Введите действительный номер телефона",
    "enteradd": "Введите действительный адрес электронной почты",
    "entermail": "Введите адрес электронной почты",
    "enterlast": "Введите вашу фамилию",
    "enterfirst": "Введите свое имя"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "kk": kk,
    "ru": ru
  };
}
