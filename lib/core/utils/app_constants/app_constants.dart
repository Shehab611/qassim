import 'dart:ui';

abstract final class AppConstants {
  //#region private variables
  static const List<String> _locale = [
    'en',
    'ar',
  ];
  static const String _defaultLanguage = 'ar';
  static const List<Locale> _supportedLocales = [
    Locale('en', ''),
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
  static const String _currentUserToken = 'userLoginToken';
  static const String _currentUserId = 'currentUserID';
  static const String _currentUsername = 'currentUserName';

  //#endregion

  //#region shared preferences keys getters
  static String get currentUserToken =>
      _currentUserToken;

  static String get currentUserId => _currentUserId;
  static String get currentUserName => _currentUsername;
//#endregion
}
