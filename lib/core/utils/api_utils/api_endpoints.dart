abstract final class ApiEndPoints {
  //#region Private variables can not be accessed
  //#region Basic Configurations
  ///this url used for [Development]
  static const String _localHost = 'http://192.168.1.8:8000';

  ///this url used for [Production]
  static const String _host = 'https://nbd.lacasa.website';
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

  //#region Favourites
  static const String _getFavourites = '/favorite';
  static const String _addToFavourites = '/Addfavorite';
  static const String _removeFromFavourites = '/removeFavorite';

  //#endregion

  //#region Places
  static const String _allPlaces = '/allPlace';

  static const String _placeDetail = '/detailsPlace';

  //#endregion

  //#region Booking
  static const String _getAllBooking = '/reservationsShow';

  static const String _bookPlace = '/addReservations';

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

  //#region Favourites
  ///post method
  ///
  ///takes 1  [body] parameters
  ///
  ///Required [id]
  ///
  ///is string
  static String get getFavourites => _getFavourites;

  ///post method
  ///
  ///takes 2  [body] parameters
  ///
  ///Required [id] - [place_id]
  ///
  ///both of them is string
  static String get addToFavourites => _addToFavourites;

  ///post method
  ///
  ///takes 2  [body] parameters
  ///
  ///Required [id] - [place_id]
  ///
  ///both of them is string
  static String get removeFromFavourites => _removeFromFavourites;

//#endregion

  //#region Places

  ///get method
  ///
  static String get allPlaces => _allPlaces;

  ///post method
  ///
  ///takes 1 [body] parameters
  ///
  ///Required [id_place]
  ///
  ///both of them is string
  static String get placeDetail => _placeDetail;

  //#endregion

  //#region Booking
  ///post method
  ///
  ///takes 1 [body] parameters
  ///
  ///Required [id_user]
  ///
  ///is string
  static String get getAllBooking => _getAllBooking;

  ///post method
  ///
  ///takes 3 [body] parameters
  ///
  ///required [user_id] - [id] - [timeVisit]
  ///
  ///all of them are string
  static String get bookPlace => _bookPlace;

//#endregion

//#endregion
}
