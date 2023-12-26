import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/features/favourites/data/model/favourites_model.dart';
import 'package:qassim/features/favourites/data/repositories/favourites_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(this._favouritesRepo) : super(const FavouritesInitial());

  static FavouritesCubit get(BuildContext context) => BlocProvider.of(context);

  //#region Private Variables
  final FavouritesRepo _favouritesRepo;
  final int _userId = sl<SharedPreferences>().getInt(AppConstants.currentUserId)!;
  late FavouritesModel _favouritesModel;

  //#endregion

  //#region Getters
  FavouritesModel get favouritePlaces => _favouritesModel;

  //#endregion
  //#region Public Methods
  Future<void> getFavouritesPlaces(BuildContext context) async {
    emit(const FavouritesLoadingState());
    ApiResponse apiResponse = await _favouritesRepo.getFavourites(_userId.toString());
    if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 200) {
      _favouritesModel = FavouritesModel.fromJson(apiResponse.response!.data);
      emit(const FavouritesGetDataSuccessfulState());
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const FavouritesGetDataFailedState());
      }
    }
  }

  Future<void> removeFromFavouritesPlaces(BuildContext context, AllPlace place) async {
    emit(const FavouritesRemovePlaceLoading());
    ApiResponse apiResponse =
        await _favouritesRepo.removeFromFavourites(place.id.toString(), _userId.toString());
    if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 200) {
      _favouritesModel.allPlace.remove(place);
      if (context.mounted) {
        showCustomSnackBar(AppLocalizations.of(context).translate(AppStrings.removedFromFavourites), context,
            inTop: true, isError: false);
      }

      emit(const FavouritesRemovePlaceSuccessful());
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const FavouritesRemovePlaceFailed());
      }
    }
    print('lenght ${_favouritesModel.allPlace.length}');
  }
//#endregion
}
