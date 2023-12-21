import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/models.dart';

abstract interface class LoginRepo {
  Future<ApiResponse> login({required String email, required String password});
  Future<({bool successful, String? errorString})> addUserDataToDB({required User user});
}
