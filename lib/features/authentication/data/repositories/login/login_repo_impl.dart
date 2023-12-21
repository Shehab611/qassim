import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/models.dart';
import 'package:qassim/service_locator.dart';
import 'package:sqflite/sqflite.dart';

import 'login_repo.dart';

final class LoginRepoImpl implements LoginRepo {
  final DioClient _dioClient;

  LoginRepoImpl(this._dioClient);

  @override
  Future<({String? errorString, bool successful})> addUserDataToDB(
      {required User user}) async {
    try {
      await sl<Database>().insert('users', user.toJson());

      return (
        successful: true,
        errorString: null,
      );
    } catch (e) {
      return (successful: false, errorString: e.toString());
    }
  }

  @override
  Future<ApiResponse> login(
      {required String email, required String password}) async {
    StackTrace stackTrace = StackTrace.current;
    try {
      Response response = await _dioClient.post(ApiEndPoints.login,stackTrace,
          data: {'email': email, 'password': password});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
