import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/models.dart';
import 'package:qassim/features/customer_service/data/models/customer_service_model.dart';

abstract interface class CustomerServiceRepo {
  Future<ApiResponse> sendFeedBack(
      {required CustomerServiceRequestModel requestModel});

  Future<({User? user, bool success, String? errorMessage})> getUserData(
      int userId);
}
