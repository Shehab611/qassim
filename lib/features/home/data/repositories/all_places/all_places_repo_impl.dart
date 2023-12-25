import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'all_places_repo.dart';

final class AllPlacesRepoImpl implements AllPlacesRepo {
  final DioClient _dioClient;

  AllPlacesRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> getAllPlaces() async {
    try {
      StackTrace stackTrace = StackTrace.current;
      Response responseValue = await _dioClient.get(ApiEndPoints.allPlaces, stackTrace);
      return ApiResponse.withSuccess(responseValue);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
