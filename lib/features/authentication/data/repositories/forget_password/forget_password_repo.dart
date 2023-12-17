import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract interface class ForgetPasswordRepo {
  Future<ApiResponse> forgetPassword({required String email});
}
