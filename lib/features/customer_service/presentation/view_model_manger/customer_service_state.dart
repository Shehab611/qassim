part of 'customer_service_cubit.dart';

abstract class CustomerServiceState extends Equatable {
  const CustomerServiceState();
}

class CustomerServiceInitial extends CustomerServiceState {
  const CustomerServiceInitial();

  @override
  List<Object> get props => [];
}

class CustomerServiceLoadingState extends CustomerServiceState {
  const CustomerServiceLoadingState();

  @override
  List<Object> get props => [];
}

class CustomerServiceUserDataLoadingState extends CustomerServiceState {
  const CustomerServiceUserDataLoadingState();

  @override
  List<Object> get props => [];
}

class CustomerServiceSuccessState extends CustomerServiceState {
  const CustomerServiceSuccessState();

  @override
  List<Object> get props => [];
}

class CustomerServiceUserDataSuccessState extends CustomerServiceState {
  const CustomerServiceUserDataSuccessState();

  @override
  List<Object> get props => [];
}

class CustomerServiceFailedState extends CustomerServiceState {
  const CustomerServiceFailedState();

  @override
  List<Object> get props => [];
}

class CustomerServiceUserDataFailedState extends CustomerServiceState {
  const CustomerServiceUserDataFailedState(this.errorMessage);
  final String errorMessage;
  @override
  List<Object> get props => [];
}
