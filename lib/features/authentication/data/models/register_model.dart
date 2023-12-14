import 'package:equatable/equatable.dart';

final class RegisterResponseModel extends Equatable {
  final String _success;
  final String _accessToken;

  const RegisterResponseModel(this._success, this._accessToken);

  String get success => _success;

  String get accessToken => _accessToken;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      json['success'] as String,
      json['access_token'] as String,
    );
  }

  @override
  List<Object?> get props => [_success, _accessToken];

  @override
  bool get stringify => true;
}

final class RegisterDataModel extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const RegisterDataModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }

  @override
  List<Object?> get props =>
      [name, email, phone, password, passwordConfirmation];

  @override
  bool get stringify => true;
}
