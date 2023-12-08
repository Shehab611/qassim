import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qassim/core/utils/constants.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.appLanguage});
  final AppLanguage? appLanguage;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qassim',
      debugShowCheckedModeBanner: false,
      locale: AppLanguage().appLocal,
      supportedLocales: AppConstants.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

