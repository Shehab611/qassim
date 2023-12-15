import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/core/utils/api_utils/api_endpoints.dart';
import 'package:qassim/core/utils/api_utils/logging_interceptor.dart';
import 'package:qassim/core/utils/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));
  sl.registerLazySingleton<DioClient>(() => DioClient(
      ApiEndPoints.baseUrl, sl<Dio>(),
      loggingInterceptor: sl<LoggingInterceptor>(),
      sharedPreferences: sl<SharedPreferences>()));

  // External
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
}
