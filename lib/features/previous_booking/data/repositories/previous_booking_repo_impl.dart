import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'previous_booking_repo.dart';

final class PreviousBookingRepoImpl implements PreviousBookingRepo {
  final DioClient _dioClient;

  PreviousBookingRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> getPreviousBooking(String userId) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      Response responseValue =
          await _dioClient.post(ApiEndPoints.getAllBooking, stackTrace, data: {'id': userId});
      return ApiResponse.withSuccess(responseValue);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
