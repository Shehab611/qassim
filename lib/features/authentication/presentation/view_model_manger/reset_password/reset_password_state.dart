part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();

  @override
  List<Object> get props => [];
}

class ResetPasswordLoadingState extends ResetPasswordState {
  const ResetPasswordLoadingState();

  @override
  List<Object> get props => [];
}

class ResetPasswordFailedState extends ResetPasswordState {
  const ResetPasswordFailedState();

  @override
  List<Object> get props => [];
}
