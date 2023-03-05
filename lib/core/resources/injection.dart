import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get_it/get_it.dart';

import 'constants.dart';

final getIt = GetIt.instance;

void initGetIt() {
  // getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  // getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  // getIt.registerLazySingleton<AuthRepoistry>(() => AuthRepoistry(getIt()));
  // getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));


  //   getIt.registerLazySingleton<MenuRepository>(() => MenuRepository(getIt()));
  // getIt.registerLazySingleton<MenuCubit>(() => MenuCubit(getIt()));
  // getIt
  //     .registerLazySingleton<SearchRepository>(() => SearchRepository(getIt()));
  // getIt.registerLazySingleton<SearchCubit>(() => SearchCubit(getIt()));
  // getIt.registerLazySingleton<DealsCubit>(() => DealsCubit());
  // getIt.registerLazySingleton<MessagesCubit>(() => MessagesCubit());
  // getIt.registerLazySingleton<GlobalCubit>(() => GlobalCubit());

  // getIt.registerLazySingleton<NotificationCubit>(
  //     () => NotificationCubit(getIt()));
  // getIt.registerLazySingleton<NotificationRepository>(
  //     () => NotificationRepository(getIt()));

  // getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  // getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
  // getIt.registerLazySingleton<AuthRepoistry>(() => AuthRepoistry(getIt()));
  // getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getIt()));
  // getIt.registerLazySingleton<ProductsRepository>(
  //     () => ProductsRepository(getIt()));
  // getIt.registerLazySingleton<ForumsCubit>(() => ForumsCubit(getIt()));
  // getIt
  //     .registerLazySingleton<ForumsRepository>(() => ForumsRepository(getIt()));

  // getIt.registerLazySingleton<WebServices>(
  //     () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout =  const Duration(seconds: 10)
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
