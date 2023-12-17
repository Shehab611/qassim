import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'reset_password_repo.dart';

final class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final DioClient dioClient;

  ResetPasswordRepoImpl(this.dioClient);

  @override
  Future<ApiResponse> resetPassword(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      Response response = await dioClient.post(ApiEndPoints.resetPassword,
          data: {
            'email': email,
            'password_confirmation': confirmPassword,
            'password': password
          });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
