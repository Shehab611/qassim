import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/authentication/data/models/login_model.dart';

abstract interface class LoginRepo {
  Future<ApiResponse> login({required String email, required String password});
  Future<({bool successful, String? errorString})> addUserDataToDB({required User user});
}
