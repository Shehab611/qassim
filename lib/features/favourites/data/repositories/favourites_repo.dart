import 'package:qassim/core/utils/api_utils/api_response.dart';

abstract interface class FavouritesRepo {
  Future<ApiResponse> getFavourites();

  Future<ApiResponse> addToFavourites(String placeId);

  Future<ApiResponse> removeFromFavourites(String placeId);
}
