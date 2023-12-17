import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'confirm_otp_repo.dart';

final class ConfirmOtpRepoImpl implements ConfirmOtpRepo {
  final DioClient dioClient;

  ConfirmOtpRepoImpl(this.dioClient);

  @override
  Future<ApiResponse> confirmOtp(
      {required String email, required String otp}) async {
    try {
      Response response = await dioClient
          .post(ApiEndPoints.resetPassword, data: {'email': email, 'otp': otp});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
