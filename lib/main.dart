import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_routes_utils/app_paths.dart';
import 'package:qassim/core/utils/app_routes_utils/app_router.dart';
import 'package:qassim/core/utils/design_utils/app_theme.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServicesLocator();
  await sl<AppLanguage>().fetchLocale();
  final bool goHome =
      sl<SharedPreferences>().getString(AppConstants.currentUserToken) != null;
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(goHome: goHome),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.goHome});

  final bool goHome;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final AppLanguage appLanguage = sl<AppLanguage>();

  @override
  void initState() {
    appLanguage.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qassim',
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      initialRoute:
          widget.goHome ? AppPathName.kHomeScreen : AppPathName.kOpenScreen,
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
