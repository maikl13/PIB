import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get_it/get_it.dart';
import 'package:pip/features/notification/business_logic/cubit/notification_cubit.dart';
import 'package:pip/features/notification/data/repository/notification_repository.dart';
import 'package:pip/features/pip/business_logic/cubit/pip_cubit.dart';
import 'package:pip/features/pip/data/repository/pip_repository.dart';
import 'package:pip/features/search/business_logic/bloc/search_bloc.dart';
import 'package:pip/features/search/data/repository/repository.dart';

import '../../features/auth/business_logic/cubit/auth_cubit.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/home/business_logic/cubit/home_cubit.dart';
import '../../features/home/data/repository/home_repository.dart';
import '../../features/menu/business_logic/menu_cubit.dart';
import '../../features/menu/data/repository/menu_repository.dart';
import '../web_services/web_services.dart';
import 'constants.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<AuthRepoistry>(() => AuthRepoistry(getIt()));
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerLazySingleton<NotificationRepository>(
      () => NotificationRepository(getIt()));
  getIt.registerLazySingleton<NotificationCubit>(
      () => NotificationCubit(getIt()));
  // getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

      getIt.registerLazySingleton<MenuRepository>(() => MenuRepository(getIt()));
  getIt.registerLazySingleton<MenuCubit>(() => MenuCubit(getIt()));
        getIt.registerLazySingleton<PipRepsitory>(() => PipRepsitory(getIt()));
  getIt.registerLazySingleton<PipCubit>(() => PipCubit(getIt()));

        getIt.registerLazySingleton<SearchRepository>(() => SearchRepository(getIt()));
  getIt.registerLazySingleton<SearchBloc>(() => SearchBloc(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = 10 * 1000
    ..options.receiveTimeout = 10 * 1000
    ..options.baseUrl = AppConstants.baseUrl;
  dio.interceptors.add(
    RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 4, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before the first retry
        Duration(seconds: 2), // wait 2 sec before the second retry
        Duration(seconds: 3), // wait 3 sec before the third retry
        Duration(seconds: 4), // wait 4 sec before the fourth retry
      ],
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      responseBody: true,
      request: true,
    ),
  );
  return dio;
}
