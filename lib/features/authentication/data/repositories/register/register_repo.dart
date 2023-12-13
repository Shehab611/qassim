import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/authentication/data/models/register_model.dart';

abstract interface class RegisterRepo {
  Future<ApiResponse> register({required RegisterDataModel registerDataModel});
}