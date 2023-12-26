import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/home/data/model/places_model.dart';
import 'package:qassim/features/home/data/repositories/place_details/place_details_repo.dart';

part 'place_details_state.dart';

class PlaceDetailsCubit extends Cubit<PlaceDetailsState> {
  PlaceDetailsCubit(this._detailRepo) : super(const PlaceDetailsInitial());

  //#region Private Variable
  final PlaceDetailRepo _detailRepo;

  //#endregion

  //#region Public Methods
  Future<void> getPlaceDetails(BuildContext context, String placeId) async {
    emit(const PlaceDetailsGetDataLoadingState());
    ApiResponse apiResponse = await _detailRepo.getPlaceDetails(placeId);
    if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 200) {
      emit(PlaceDetailsGetDataSuccessState(Place.fromJson(apiResponse.response!.data['data'][0])));
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const PlaceDetailsGetDataFailedState());
      }
    }
  }
//#endregion
}
