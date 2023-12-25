import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/logging_interceptor.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/network_info.dart';
import 'package:qassim/features/categories/data/repositories/categories_repo_impl.dart';
import 'package:qassim/features/customer_service/data/repositories/customer_service_repo_impl.dart';
import 'package:qassim/features/favourites/data/repositories/favourites_repo_impl.dart';
import 'package:qassim/features/home/data/repositories/all_places/all_places_repo_impl.dart';
import 'package:qassim/features/previous_booking/data/repositories/previous_booking_repo_impl.dart';
import 'package:qassim/features/profile/data/repositories/change_password_repo/change_password_repo_impl.dart';
import 'package:qassim/features/profile/data/repositories/profile_data_repo/profile_data_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  //#region Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));
  sl.registerLazySingleton<DioClient>(() => DioClient(
      ApiEndPoints.baseUrl, sl<Dio>(),
      loggingInterceptor: sl<LoggingInterceptor>(),
      sharedPreferences: sl<SharedPreferences>()));
  sl.registerLazySingleton<AppLanguage>(() => AppLanguage());
  //#endregion

  //#region Repos
  sl.registerLazySingleton<CustomerServiceRepoImpl>(() => CustomerServiceRepoImpl(sl<DioClient>()));
  sl.registerLazySingleton<ChangePasswordRepoImpl>(() => ChangePasswordRepoImpl(sl<DioClient>()));
  sl.registerLazySingleton<ProfileRepoImpl>(() => ProfileRepoImpl(sl<DioClient>()));
  sl.registerLazySingleton<CategoriesRepoImpl>(() => CategoriesRepoImpl(sl<DioClient>()));
  sl.registerLazySingleton<FavouritesRepoImpl>(() => FavouritesRepoImpl(sl<DioClient>()));
  sl.registerLazySingleton<AllPlacesRepoImpl>(() => AllPlacesRepoImpl(sl<DioClient>()));
  sl.registerLazySingleton<PreviousBookingRepoImpl>(() => PreviousBookingRepoImpl(sl<DioClient>()));
  //#endregion

  //#region External
  final sharedPreferences = await SharedPreferences.getInstance();
  final dataBase = await openDatabase(
    'userData.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE users (id INTEGER Primary Key,name text, email text ,  phone text, access_token text);');
    },
  );
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<Database>(() => dataBase);
  //#endregion
}
