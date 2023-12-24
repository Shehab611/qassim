import 'package:dio/dio.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'categories_repo.dart';

final class CategoriesRepoImpl implements CategoriesRepo {
  final DioClient _dioClient;

  CategoriesRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> getCategories() async {
    StackTrace stackTrace = StackTrace.current;
    try {
      Response response = await _dioClient.get(
        ApiEndPoints.categories,
        stackTrace,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
