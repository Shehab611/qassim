part of 'favourites_cubit.dart';

abstract class FavouritesState extends Equatable {
  const FavouritesState();
}

class FavouritesInitial extends FavouritesState {
  const FavouritesInitial();

  @override
  List<Object> get props => [];
}

class FavouritesLoadingState extends FavouritesState {
  const FavouritesLoadingState();

  @override
  List<Object> get props => [];
}

class FavouritesGetDataSuccessfulState extends FavouritesState {
  const FavouritesGetDataSuccessfulState();

  @override
  List<Object> get props => [];
}

class FavouritesGetDataFailedState extends FavouritesState {
  const FavouritesGetDataFailedState();

  @override
  List<Object> get props => [];
}

class FavouritesRemovePlaceSuccessful extends FavouritesState {
  const FavouritesRemovePlaceSuccessful();

  @override
  List<Object> get props => [];
}

class FavouritesRemovePlaceFailed extends FavouritesState {
  const FavouritesRemovePlaceFailed();

  @override
  List<Object> get props => [];
}
