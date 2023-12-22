import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/profile/data/repositories/logout_repo/logout_repo.dart';

final class LogoutRepoImpl implements LogoutRepo {
  final DioClient _dioClient;

  LogoutRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> logout(String accessToken) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      Response response = await _dioClient.post(ApiEndPoints.logout, stackTrace,
          options: Options(headers: {'access_token': accessToken}));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
