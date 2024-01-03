import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.goHome});

  static final bool goHome =
      sl<SharedPreferences>().getString(AppConstants.currentUserToken) != null;
  static final AppLanguage appLanguage = sl<AppLanguage>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appLanguage,
      builder: (context, child) {
        return MaterialApp(
          title: 'Qassim',
          theme: AppTheme.defaultTheme,
          debugShowCheckedModeBanner: false,
          routes: AppRouter.routes,
          initialRoute: goHome ? AppPathName.kHomeScreen : AppPathName.kOpenScreen,
          locale: appLanguage.appLocal,
          supportedLocales: AppConstants.supportedLocales,
          localizationsDelegates: AppConstants.delegates,
        );
      },
    );
  }
}
