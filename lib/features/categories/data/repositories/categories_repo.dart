import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract interface class CategoriesRepo{
  Future<ApiResponse> getCategories();
}