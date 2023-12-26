part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState();
}

class BookingInitial extends BookingState {
  const BookingInitial();

  @override
  List<Object> get props => [];
}

class BookingLoadingState extends BookingState {
  const BookingLoadingState();

  @override
  List<Object> get props => [];
}

class BookingSuccessState extends BookingState {
  const BookingSuccessState();

  @override
  List<Object> get props => [];
}

class BookingFailedState extends BookingState {
  const BookingFailedState();

  @override
  List<Object> get props => [];
}

class BookingDropDownValueChangedToMorningState extends BookingState {
  const BookingDropDownValueChangedToMorningState();

  @override
  List<Object> get props => [];
}

class BookingDropDownValueChangedToEveningState extends BookingState {
  const BookingDropDownValueChangedToEveningState();

  @override
  List<Object> get props => [];
}
