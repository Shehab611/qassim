import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';

import 'favourites_repo.dart';

final class FavouritesRepoImpl implements FavouritesRepo {
  final DioClient _dioClient;

  FavouritesRepoImpl(this._dioClient);

  @override
  Future<ApiResponse> addToFavourites(String placeId) async {
    // TODO: implement addToFavourites
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getFavourites() async {
    // TODO: implement getFavourites
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> removeFromFavourites(String placeId) async {
    // TODO: implement removeFromFavourites
    throw UnimplementedError();
  }
}
