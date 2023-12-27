part of 'map_cubit.dart';

abstract class MapState extends Equatable {
  const MapState();
}

class MapInitial extends MapState {
  const MapInitial();

  @override
  List<Object> get props => [];
}

class MapSuccessState extends MapState {
  const MapSuccessState(this.url);

  final String url;

  @override
  List<Object> get props => [url];
}

class MapFailedState extends MapState {
  const MapFailedState();

  @override
  List<Object> get props => [];
}
