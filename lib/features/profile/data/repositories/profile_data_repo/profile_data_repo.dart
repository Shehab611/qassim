import 'package:qassim/core/utils/models.dart';

abstract interface class ProfileRepo{
  Future<({User? user, bool success, String? errorMessage})> getUserData();
}