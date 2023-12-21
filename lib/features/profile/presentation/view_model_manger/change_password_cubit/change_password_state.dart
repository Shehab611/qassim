part of 'change_password_cubit.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();
}

class ChangePasswordInitial extends ChangePasswordState {
  const ChangePasswordInitial();
  @override
  List<Object> get props => [];
}

class ChangePasswordLoadingState extends ChangePasswordState {
  const ChangePasswordLoadingState();
  @override
  List<Object> get props => [];
}

class ChangePasswordFailedState extends ChangePasswordState {
  const ChangePasswordFailedState();
  @override
  List<Object> get props => [];
}

class ChangePasswordSuccessState extends ChangePasswordState {
  const ChangePasswordSuccessState();
  @override
  List<Object> get props => [];
}
