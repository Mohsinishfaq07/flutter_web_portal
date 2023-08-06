import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'authentication/data/data_sources/auth_data_source.dart';
import 'authentication/data/repositories/auth_repo_imp.dart';
import 'authentication/domain/repositories/auth_repository.dart';
import 'authentication/domain/use_cases/login_use_case.dart';
import 'authentication/presentation/manager/auth_provider.dart';
import 'dashboard/presentation/widgets/app_states.dart';
import 'dashboard/presentation/widgets/local_navigator.dart';
import 'globals.dart';
import 'network.info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Providers
  sl.registerLazySingleton(() => AuthProvider(sl()));

  /// UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Data sources
  sl.registerLazySingleton<AuthRepository>(() => AuthRepoImp(
    networkInfo: sl(),
    remoteDataSource: sl(),
  ));
  // Repositories

  sl.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImp(dio: sl()));

  /// Configs

  /// External
  sl.registerLazySingleton<InternetConnectionChecker>(
          () => InternetConnectionChecker());

  sl.registerLazySingleton(() => Dio());

  Get.put(LocalNavigator());


  //



  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// Navigator
  sl.registerLazySingleton(() => AppState());
}
