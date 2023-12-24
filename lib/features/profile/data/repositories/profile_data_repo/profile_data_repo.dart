import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/models.dart';

abstract interface class ProfileRepo{
  Future<({User? user, bool success, String? errorMessage})> getUserData();
  Future<ApiResponse> updateUserData(Map<String,dynamic> updatedData);
}