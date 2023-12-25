import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'favourites_repo.dart';

final class FavouritesRepoImpl implements FavouritesRepo {
  final DioClient _dioClient;

  FavouritesRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> addToFavourites(String placeId, String userId) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      Response responseValue = await _dioClient.post(
          ApiEndPoints.addToFavourites, stackTrace,
          data: {'id': userId, 'place_id': placeId});
      return ApiResponse.withSuccess(responseValue);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> getFavourites(String userId) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      Response responseValue = await _dioClient
          .post(ApiEndPoints.getFavourites, stackTrace, data: {'id': userId});
      return ApiResponse.withSuccess(responseValue);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<ApiResponse> removeFromFavourites(
      String placeId, String userId) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      Response responseValue = await _dioClient.post(
          ApiEndPoints.removeFromFavourites, stackTrace,
          data: {'id': userId, 'place_id': placeId});
      return ApiResponse.withSuccess(responseValue);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
