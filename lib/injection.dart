import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'cubit/chuck_norris_cubit.dart';
import 'data/repositories/chuck_norris_repo.dart';
import 'data/web_services/chuck_norris_web_services.dart';

final chuckNorrisGetIt = GetIt.instance;

void chuckNorrisGetInit() {
  chuckNorrisGetIt.registerLazySingleton<ChuckNorrisCubit>(() => ChuckNorrisCubit(chuckNorrisGetIt(),),);
  chuckNorrisGetIt.registerLazySingleton<ChuckNorrisRepo>(() => ChuckNorrisRepo(chuckNorrisGetIt(),),);
  chuckNorrisGetIt.registerLazySingleton<ChuckNorrisWebServices>(() => ChuckNorrisWebServices(createAndSetupDio(),),);
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(seconds: 10)
    ..options.receiveTimeout = Duration(seconds: 10);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}