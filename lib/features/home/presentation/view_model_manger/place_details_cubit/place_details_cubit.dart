import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/favourites/data/repositories/favourites_repo.dart';
import 'package:qassim/features/home/data/model/places_model.dart';
import 'package:qassim/features/home/data/repositories/place_details/place_details_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'place_details_state.dart';

class PlaceDetailsCubit extends Cubit<PlaceDetailsState> {
  PlaceDetailsCubit(this._detailRepo, this._favouritesRepo) : super(const PlaceDetailsInitial());

  //#region Private Variable
  final PlaceDetailRepo _detailRepo;
  final FavouritesRepo _favouritesRepo;
  final int _userId = sl<SharedPreferences>().getInt(AppConstants.currentUserId)!;

  //#endregion

  //#region Public Methods
  Future<void> addToFavouritesPlaces(BuildContext context, String placeId) async {
    ApiResponse apiResponse = await _favouritesRepo.addToFavourites(placeId, _userId.toString());
    if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 200) {
      if (context.mounted) {
        showCustomSnackBar(AppLocalizations.of(context).translate(AppStrings.addedToFavourites), context,
            isError: false, inTop: true);
      }
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
      }
    }
  }

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
