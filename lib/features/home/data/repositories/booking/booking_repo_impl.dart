import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'booking_repo.dart';

final class BookingRepoImpl implements BookingRepo {
  final DioClient _dioClient;

  BookingRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> bookPlace(String userId, String placeId, String timeVisit) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      Response responseValue = await _dioClient.post(ApiEndPoints.bookPlace, stackTrace,
          data: {'user_id': userId, 'id': placeId, 'timeVisit': timeVisit});
      return ApiResponse.withSuccess(responseValue);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
