import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';
import 'package:qassim/features/home/data/model/places_model.dart';
import 'package:qassim/features/home/data/repositories/all_places/all_places_repo.dart';

part 'all_places_state.dart';

class AllPlacesCubit extends Cubit<AllPlacesState> {
  AllPlacesCubit(this._allPlacesRepo) : super(const AllPlacesInitial());

  static AllPlacesCubit get(BuildContext context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _searchController.dispose();
    return super.close();
  }

  //#region Private Variables
  final AllPlacesRepo _allPlacesRepo;
  final SearchController _searchController = SearchController();

  //#endregion

  //#region Getters
  SearchController get searchController => _searchController;

  //#endregion

  //#region Public Methods
  Future<void> getAllPlaces(BuildContext context) async {
    emit(const AllPlacesGetDataLoadingState());
    ApiResponse apiResponse = await _allPlacesRepo.getAllPlaces();
    if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 200) {
      emit(AllPlacesGetDataSuccessState(PlacesModel.fromJson(apiResponse.response!.data)));
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const AllPlacesGetDataFailedState());
      }
    }
  }

  void navigateToPlaceDetails(BuildContext context, String placeId) {
    AppNavigator.navigateToPlaceDetailsScreen(context, placeId);
  }
//#endregion
}
