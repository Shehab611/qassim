abstract final class ApiEndPoints {
  //#region Private variables can not be accessed
  //#region Basic Configurations
  ///this url used for [LOCALHOST]

  static const String _host = 'http://192.168.1.8:8000';
  static const String _api = '$_host/api';

  //#endregion

  //#region Authentication EndPoints
  static const String _register = '/register';

  static const String _login = '/login';

  static const String _logout = '/logout';

  static const String _forgotPassword = '/forgotPassword';

  static const String _resetPassword = '/restPassword';

  static const String _newPassword = '/newPassword';

  //#endregion

  //#region Customer Service EndPoints
  static const String _customerService = '/CustomerService';

  //#endregion

  //#region Update password
  static const String _changePassword = '/updatePassword';

  //#endregion

  //#region Update Profile
  static const String _updateProfile = '/updateProflie';

  //#endregion
  //#region Categories
  static const String _categories = '/divide';

  //#endregion
  //#endregion

  //#region Getters to use them in the app
  //#region Basic Configurations
  ///Api base url
  static String get baseUrl => _api;

  //#endregion

  //#region Authentication
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

  //#region Customer Service
  ///post method
  ///
  ///require 3 [body] parameters
  ///
  ///[fullName] - [email] - [topic]
  ///
  ///all of them is String
  static String get customerService => _customerService;

//#endregion

  //#region Change Password
  ///post method
  ///
  ///require 4 [body] parameters
  ///
  ///[id] - [oldPassword] - [newPassword_] - [newPassword_confirmation]
  ///
  ///all of them is String
  static String get changePassword => _changePassword;

//#endregion

  //#region Categories
  ///get method
  ///
  ///no [body] parameters
  ///
  static String get categories => _categories;

//#endregion

  //#region Update Profile
  ///put method
  ///
  ///takes 4  [body] parameters
  ///
  ///Required [id]
  ///
  ///[name] - [email] - [phone]
  ///
  ///all of them are string
  static String get updateProfile => _updateProfile;
//#endregion
//#endregion
}
