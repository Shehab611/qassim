part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
  @override
  List<Object> get props => [];
}

class ProfileGetUserDataLoadingState extends ProfileState {
  const ProfileGetUserDataLoadingState();
  @override
  List<Object> get props => [];
}

class ProfileGetUserDataSuccessfulState extends ProfileState {
  const ProfileGetUserDataSuccessfulState();
  @override
  List<Object> get props => [];
}

class ProfileGetUserDataFailedState extends ProfileState {
  const ProfileGetUserDataFailedState(this.errorMessage);
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
