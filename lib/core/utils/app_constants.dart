import 'dart:ui';

abstract final class AppConstants {

  static const List<String> _locale = [
    'en',
    'ar',
  ];
  static const String _defaultLanguage = 'ar';
  static const List<Locale> _supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', ''),
  ];

  static List<String> get locale => _locale;

  static String get defaultLanguage => _defaultLanguage;

  static List<Locale> get supportedLocales => _supportedLocales;
}
