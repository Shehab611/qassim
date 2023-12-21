import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/authentication/data/models/register_model.dart';
import 'package:qassim/features/authentication/data/repositories/register/register_repo.dart';

final class RegisterRepoImpl implements RegisterRepo {
  final DioClient _dioClient;

  RegisterRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> register(
      {required RegisterDataModel registerDataModel}) async {
    StackTrace stackTrace = StackTrace.current;
    try {
      Response response = await _dioClient.post(ApiEndPoints.register,stackTrace,
          data: registerDataModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
