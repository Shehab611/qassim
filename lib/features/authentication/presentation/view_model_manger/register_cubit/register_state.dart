part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
  @override
  List<Object> get props => [];
}

class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
  @override
  List<Object> get props => [];
}

class RegisterSuccessfulState extends RegisterState {

  const RegisterSuccessfulState();
  @override
  List<Object> get props => [];
}

class RegisterFailedState extends RegisterState {
  const RegisterFailedState();
  @override
  List<Object> get props => [];
}