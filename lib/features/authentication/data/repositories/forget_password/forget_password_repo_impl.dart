import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'forget_password_repo.dart';

final class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final DioClient _dioClient;

  ForgetPasswordRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> forgetPassword({required String email}) async {
    StackTrace stackTrace = StackTrace.current;
    try {
      Response response = await _dioClient
          .post(ApiEndPoints.forgotPassword,stackTrace, data: {'email': email});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
