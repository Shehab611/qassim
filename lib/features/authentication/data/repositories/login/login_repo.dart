import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract final class LoginRepo {
  Future<ApiResponse> login({required String email, required String password});
  Future<>
}
