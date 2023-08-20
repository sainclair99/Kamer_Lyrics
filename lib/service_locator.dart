import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kamer_lyrics/intercetor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '01_auth/buisness_logic/cubit/auth_cubit.dart';
import '01_auth/data/repositories/auth_repository.dart';
import '02_lyrics/business_logic/cubit/lyrics_cubit.dart';
import '02_lyrics/data/repositories/lyrics_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(
    () => SharedPreferences.getInstance(),
  );

  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'http://192.168.100.154:8000',
        headers: {
          'Accept': 'application/json',
        },
      ),
    )..interceptors.add(
        TokenInterceptor(),
      ),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepository(dio: getIt.get<Dio>()),
  );

  getIt.registerSingleton<AuthCubit>(
    AuthCubit(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );

  getIt.registerSingleton<LyricsRepository>(
    LyricsRepository(dio: getIt.get<Dio>()),
  );

  getIt.registerSingleton<LyricsCubit>(
    LyricsCubit(
      lyricsRepository: getIt.get<LyricsRepository>(),
    ),
  );
}
