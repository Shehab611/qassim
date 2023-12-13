import 'dart:ui';

abstract final class AppConstants {

  //#region private variables
  static const List<String> _locale = [
    'en',
    'ar',
  ];
  static const String _defaultLanguage = 'ar';
  static const List<Locale> _supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', ''),
  ];
  static const Duration _connectionTimeOut = Duration(seconds: 30000);
  //#endregion

  //#region getters
  static List<String> get locale => _locale;

  static String get defaultLanguage => _defaultLanguage;

  static List<Locale> get supportedLocales => _supportedLocales;

  static Duration get connectionTimeOut => _connectionTimeOut;
  //#endregion


  //#region private shared preferences keys
  static const String _userLoginToken = 'userLoginToken';

  //#endregion


  //#region shared preferences keys getters
  static String get userLoginToken=>_userLoginToken;
//#endregion
}
