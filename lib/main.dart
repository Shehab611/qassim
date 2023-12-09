import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qassim/core/utils/app_localization.dart';
import 'package:qassim/core/utils/app_paths.dart';
import 'package:qassim/core/utils/app_router.dart';
import 'package:qassim/core/utils/constants.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appLanguage});

  final AppLanguage appLanguage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qassim',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primaryColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.elevatedButtonBackground,
          ))),
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      initialRoute: AppPathName.kOpenScreen,
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
