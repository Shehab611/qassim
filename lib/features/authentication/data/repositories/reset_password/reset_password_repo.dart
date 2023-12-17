import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract interface class ResetPasswordRepo{
  Future<ApiResponse> resetPassword({required String email,required String password,required String confirmPassword});
}