import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
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
  final int _userId =
      sl<SharedPreferences>().getInt(AppConstants.currentUserId)!;
  late FavouritesModel _favouritesModel;

  //#endregion

  //#region Public Methods
  Future<void> getFavouritesPlaces(BuildContext context) async {
    emit(const FavouritesLoadingState());
    ApiResponse apiResponse =
        await _favouritesRepo.getFavourites(_userId.toString());
    if (apiResponse.response?.statusCode != null &&
        apiResponse.response?.statusCode == 200) {
      _favouritesModel = FavouritesModel.fromJson(apiResponse.response!.data);
      emit(FavouritesGetDataSuccessfulState(_favouritesModel));
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const FavouritesGetDataFailedState());
      }
    }
  }

  Future<void> removeFromFavouritesPlaces(
      BuildContext context, int index) async {
    emit(const FavouritesLoadingState());
    ApiResponse apiResponse = await _favouritesRepo.removeFromFavourites(
        _favouritesModel.allPlace[index].id.toString(), _userId.toString());
    if (apiResponse.response?.statusCode != null &&
        apiResponse.response?.statusCode == 200) {
      _favouritesModel.allPlace.removeAt(index);
      emit(const FavouritesRemovePlaceSuccessful());
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const FavouritesRemovePlaceFailed());
      }
    }
  }
//#endregion
}
