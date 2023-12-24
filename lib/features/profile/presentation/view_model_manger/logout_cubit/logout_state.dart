part of 'logout_cubit.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
}

class LogoutInitial extends LogoutState {
  const LogoutInitial();
  @override
  List<Object> get props => [];
}

class LogoutSuccessful extends LogoutState {
  const LogoutSuccessful();
  @override
  List<Object> get props => [];
}

class LogoutFailed extends LogoutState {
  const LogoutFailed();
  @override
  List<Object> get props => [];
}
