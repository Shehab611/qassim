import 'dart:ui';

abstract final class AppConstants{
  static List locale = ['en', 'ar',];
  static String defaultLanguage = 'ar';
  static List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('ar', ''),
  ];
}