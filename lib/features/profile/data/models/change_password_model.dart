import 'package:equatable/equatable.dart';

final class ChangePasswordRequestModel extends Equatable {
  final String id;
  final String oldPassword;
  final String newPassword;
  final String newPasswordConfirmation;

  const ChangePasswordRequestModel(
      {required this.id,
      required this.oldPassword,
      required this.newPassword,
      required this.newPasswordConfirmation});

  @override
  List<Object> get props => [
        id,
        oldPassword,
        newPassword,
        newPasswordConfirmation,
      ];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'newPassword_confirmation': newPasswordConfirmation,

    };
  }
}
