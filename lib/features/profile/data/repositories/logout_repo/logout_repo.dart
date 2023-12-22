import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract interface class LogoutRepo{
  Future<ApiResponse> logout(String accessToken);
}