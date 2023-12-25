part of 'all_places_cubit.dart';

abstract class AllPlacesState extends Equatable {
  const AllPlacesState();
}

class AllPlacesInitial extends AllPlacesState {
  const AllPlacesInitial();

  @override
  List<Object> get props => [];
}

class AllPlacesGetDataLoadingState extends AllPlacesState {
  const AllPlacesGetDataLoadingState();

  @override
  List<Object> get props => [];
}

class AllPlacesGetDataFailedState extends AllPlacesState {
  const AllPlacesGetDataFailedState();

  @override
  List<Object> get props => [];
}

class AllPlacesGetDataSuccessState extends AllPlacesState {
  const AllPlacesGetDataSuccessState(this.model);

  final PlacesModel model;

  @override
  List<Object> get props => [model];
}
