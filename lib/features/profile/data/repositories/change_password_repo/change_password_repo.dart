import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/profile/data/models/change_password_model.dart';

abstract interface class ChangePasswordRepo{
  Future<ApiResponse> changePassword({required ChangePasswordRequestModel requestModel});
}