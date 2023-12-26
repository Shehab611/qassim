part of 'place_details_cubit.dart';

abstract class PlaceDetailsState extends Equatable {
  const PlaceDetailsState();
}

class PlaceDetailsInitial extends PlaceDetailsState {
  const PlaceDetailsInitial();

  @override
  List<Object> get props => [];
}

class PlaceDetailsGetDataLoadingState extends PlaceDetailsState {
  const PlaceDetailsGetDataLoadingState();

  @override
  List<Object> get props => [];
}

class PlaceDetailsGetDataFailedState extends PlaceDetailsState {
  const PlaceDetailsGetDataFailedState();

  @override
  List<Object> get props => [];
}

class PlaceDetailsGetDataSuccessState extends PlaceDetailsState {
  const PlaceDetailsGetDataSuccessState(this.model);

  final Place model;

  @override
  List<Object> get props => [model];
}
