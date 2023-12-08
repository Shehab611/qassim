import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/app_router.dart';
import 'package:qassim/core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.appLanguage});

  final AppLanguage appLanguage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qassim',
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      locale: appLanguage.appLocal,
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
