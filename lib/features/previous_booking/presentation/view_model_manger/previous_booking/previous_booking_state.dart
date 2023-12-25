part of 'previous_booking_cubit.dart';

abstract class PreviousBookingState extends Equatable {
  const PreviousBookingState();
}

class PreviousBookingInitial extends PreviousBookingState {
  const PreviousBookingInitial();

  @override
  List<Object> get props => [];
}

class PreviousBookingGetDataLoadingState extends PreviousBookingState {
  const PreviousBookingGetDataLoadingState();

  @override
  List<Object> get props => [];
}

class PreviousBookingGetDataFailedState extends PreviousBookingState {
  const PreviousBookingGetDataFailedState();

  @override
  List<Object> get props => [];
}

class PreviousBookingGetDataSuccessState extends PreviousBookingState {
  const PreviousBookingGetDataSuccessState(this.model);

  final PreviousBookingModel model;

  @override
  List<Object> get props => [model];
}
