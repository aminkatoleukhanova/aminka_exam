import 'package:amina_ex/app/ui/pages/app_locale_select.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('kk'), Locale('en'), Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('kk'),
        child: const LoginUiApp()),
  );
}

class LoginUiApp extends StatelessWidget {
  const LoginUiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppLocalePage(),
    );
  }
}
