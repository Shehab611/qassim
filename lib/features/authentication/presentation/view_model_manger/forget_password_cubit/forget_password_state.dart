part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
}

class ForgetPasswordInitial extends ForgetPasswordState {
  const ForgetPasswordInitial();
  @override
  List<Object> get props => [];
}

class ForgetPasswordLoadingState extends ForgetPasswordState {
  const ForgetPasswordLoadingState();
  @override
  List<Object> get props => [];
}

class ForgetPasswordSuccessfulState extends ForgetPasswordState {
  const ForgetPasswordSuccessfulState();
  @override
  List<Object> get props => [];
}

class ForgetPasswordFailedState extends ForgetPasswordState {
  const ForgetPasswordFailedState();
  @override
  List<Object> get props => [];
}

