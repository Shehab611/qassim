import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract interface class FavouritesRepo {
  Future<ApiResponse> getFavourites(String userId);

  Future<ApiResponse> addToFavourites(String placeId, String userId);

  Future<ApiResponse> removeFromFavourites(String placeId, String userId);
}
