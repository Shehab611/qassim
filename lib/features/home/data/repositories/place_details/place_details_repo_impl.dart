import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'place_details_repo.dart';

final class PlaceDetailRepoImpl implements PlaceDetailRepo {
  final DioClient _dioClient;

  PlaceDetailRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> getPlaceDetails(String placeId) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      Response responseValue =
          await _dioClient.post(ApiEndPoints.placeDetail, stackTrace, data: {'id': placeId});
      return ApiResponse.withSuccess(responseValue);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
