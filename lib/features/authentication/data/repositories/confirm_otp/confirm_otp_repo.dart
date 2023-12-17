import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract interface class ConfirmOtpRepo{
  Future<ApiResponse> confirmOtp({required String email,required String otp});

}