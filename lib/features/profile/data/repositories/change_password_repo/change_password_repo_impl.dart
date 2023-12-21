import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/profile/data/models/change_password_model.dart';

import 'change_password_repo.dart';

final class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final DioClient _dioClient;

  ChangePasswordRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> changePassword(
      {required ChangePasswordRequestModel requestModel}) async {
    StackTrace stackTrace = StackTrace.current;
    try {
      Response response = await _dioClient.post(
          ApiEndPoints.changePassword, stackTrace,
          data: requestModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
