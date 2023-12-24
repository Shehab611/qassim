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

class ProfileUpdateUserDataLoadingState extends ProfileState {
  const ProfileUpdateUserDataLoadingState();
  @override
  List<Object> get props => [];
}

class ProfileUpdateUserDataSuccessfulState extends ProfileState {
  const ProfileUpdateUserDataSuccessfulState();
  @override
  List<Object> get props => [];
}

class ProfileUpdateUserDataFailedState extends ProfileState {
  const ProfileUpdateUserDataFailedState();
  @override
  List<Object> get props => [];
}

class ProfileChangeEmailVariables extends ProfileState{
  const ProfileChangeEmailVariables();
  @override
  List<Object> get props => [];
}

class ProfileChangeNameVariables extends ProfileState{
  const ProfileChangeNameVariables();
  @override
  List<Object> get props => [];
}

class ProfileChangePhoneVariables extends ProfileState{
  const ProfileChangePhoneVariables();
  @override
  List<Object> get props => [];
}