import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/core/utils/models.dart';
import 'package:qassim/features/customer_service/data/models/customer_service_model.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'customer_service_repo.dart';

final class CustomerServiceRepoImpl implements CustomerServiceRepo {
  final DioClient _dioClient;

  CustomerServiceRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> sendFeedBack(
      {required CustomerServiceRequestModel requestModel}) async {
    StackTrace stackTrace = StackTrace.current;
    try {
      Response response = await _dioClient.post(ApiEndPoints.customerService,stackTrace,
          data: requestModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<({User? user, bool success, String? errorMessage})>
      getUserData() async {
    try {
      var userData = await sl<Database>().rawQuery(
          'select * from users where id = ?',
          [sl<SharedPreferences>().get(AppConstants.currentUserId)]);
      User userDataModel = User.fromJson(userData[0]);
      return (success: true, user: userDataModel, errorMessage: null);
    } catch (e) {
      return (success: false, user: null, errorMessage: e.toString());
    }
  }
}
