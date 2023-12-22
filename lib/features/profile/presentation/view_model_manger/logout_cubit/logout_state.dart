part of 'logout_cubit.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
}

class LogoutInitial extends LogoutState {
  const LogoutInitial();
  @override
  List<Object> get props => [];
}
