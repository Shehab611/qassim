import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract interface class BookingRepo {
  Future<ApiResponse> bookPlace(String userId, String placeId, String timeVisit);
}
