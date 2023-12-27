import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapInitial());

  Future<void> permitLocationService() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const MapFailedState());
      return;
    } else {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const MapFailedState());
          return;
        }
      }
    }
  }

  Future<void> getCurrentLocation() async {
    emit(const MapLoadingState());
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    String url = "https://www.google.com/maps/@${position.latitude},${position.longitude},15z?entry=ttu";
    emit(MapSuccessState(url));
  }
}
