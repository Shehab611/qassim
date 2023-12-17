abstract final class ApiEndPoints {
  //#region private variables can not be accessed
  //#region basic configurations
  ///this url used for [LOCALHOST]

  static const String _host = 'http://192.168.1.8:8000';
  static const String _api = '$_host/api';

  //#endregion

  //#region authentication endpoints
  static const String _register = '/register';

  static const String _login = '/login';

  static const String _logout = '/logout';

  static const String _forgotPassword = '/forgotPassword';

  static const String _resetPassword = '/restPassword';

  static const String _newPassword = '/newPassword';

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
  ///require 2 [body] parameters
  ///
  ///[otp] - [email]
  ///
  ///both is String
  static String get resetPassword => _resetPassword;

  ///post method
  ///
  /// takes [access_token] as header
  static String get logout => _logout;

  ///post method
  ///
  ///require 3 [body] parameters
  ///
  ///[email] - [password] - [password_confirmation]
  ///
  ///all of them are String
  static String get newPassword => _newPassword;
//#endregion

//#endregion
}
