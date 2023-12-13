abstract final class ApiEndPoints {
  //#region private variables can not be accessed
  //#region basic configurations
  ///this url used for [LOCALHOST]

  static const String _host = 'http://127.0.0.1:8000';
  static const String _api = '$_host/api';

  //#endregion

  //#region authentication endpoints
  static const String _register = '/register';

  static const String _login = '/login';

  static const String _logout = '/logout';

  static const String _forgotPassword = '/forgotPassword';

  static const String _resetPassword = '/restPassword';

  //#endregion
  //#endregion

  //#region getters to use them in the app

  ///Api base url
  static String get baseUrl => _api;

  //#region authentication getters
  ///post method
  ///
  ///require 2 [body] parameters
  ///
  ///[email] - [password]
  ///
  ///both of them is String
  static String get login => _login;

  ///post method
  ///
  ///require 5 [body] parameters
  ///
  ///[name] - [email] - [phone] - [password] - [password_confirmation]
  ///
  ///all of them is String
  static String get register => _register;

  ///post method
  ///
  ///require 1 [body] parameters
  ///
  ///[email] String
  static String get forgotPassword => _forgotPassword;

  ///post method
  ///
  ///require 1 [body] parameters
  ///
  ///[restPassword]
  ///
  ///code sent to the email as String
  static String get resetPassword => _resetPassword;

  ///post method
  ///
  /// takes [access_token] as header
  static String get logout => _logout;
//#endregion

//#endregion
}
