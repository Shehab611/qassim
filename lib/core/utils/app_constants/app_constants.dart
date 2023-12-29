import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localization.dart';

abstract final class AppConstants {
  //#region private variables
  static const Duration _connectionTimeOut = Duration(seconds: 30000);

  //#region Localization Private Variables
  static const List<String> _locale = [
    'en',
    'ar',
  ];
  static const String _defaultLanguage = 'ar';
  static const List<Locale> _supportedLocales = [
    Locale('en', ''),
    Locale('ar', ''),
  ];
  static const List<LocalizationsDelegate> _delegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  //#endregion

  //#endregion

  //#region getters
  static Duration get connectionTimeOut => _connectionTimeOut;

  //#region Localization Getters
  static List<String> get locale => _locale;

  static String get defaultLanguage => _defaultLanguage;

  static List<Locale> get supportedLocales => _supportedLocales;

  static List<LocalizationsDelegate> get delegates => _delegates;

  //#endregion

  //#endregion

  //#region private shared preferences keys
  static const String _currentUserToken = 'userLoginToken';
  static const String _currentUserId = 'currentUserID';
  static const String _currentUsername = 'currentUserName';

  //#endregion

  //#region shared preferences keys getters
  static String get currentUserToken => _currentUserToken;

  static String get currentUserId => _currentUserId;

  static String get currentUserName => _currentUsername;
//#endregion
}
