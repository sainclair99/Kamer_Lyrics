import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kamer_lyrics/05_genres/business_logic/cubit/genre_cubit.dart';
import 'package:kamer_lyrics/05_genres/data/genre_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '01_auth/buisness_logic/cubit/auth_cubit.dart';
import '01_auth/data/repositories/auth_repository.dart';
import '02_lyrics/business_logic/cubit/lyrics_cubit.dart';
import '02_lyrics/data/repositories/lyrics_repository.dart';
import '03_artist/business_logic/cubit/artist_cubit.dart';
import '03_artist/data/repositories/artist_repository.dart';
import 'intercetor.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(
    () => SharedPreferences.getInstance(),
  );

  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'http://192.168.100.155:8000',
        headers: {
          'Accept': 'application/json',
        },
      ),
    )..interceptors.add(
        TokenInterceptor(),
      ),
  );

  // * Auth ---------------------------
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(dio: getIt.get<Dio>()),
  );

  getIt.registerSingleton<AuthCubit>(
    AuthCubit(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );

  // * Lyrics ---------------------------
  getIt.registerSingleton<LyricsRepository>(
    LyricsRepository(dio: getIt.get<Dio>()),
  );

  getIt
      .registerSingleton<LyricsCubit>(
        LyricsCubit(
          lyricsRepository: getIt.get<LyricsRepository>(),
        ),
      )
      .fetchAllLyrics(); // ! Ici aussi

  // * Artist ---------------------------
  getIt.registerSingleton<ArtistRepository>(
    ArtistRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt
      .registerSingleton<ArtistCubit>(
        ArtistCubit(
          artistRepository: getIt.get<ArtistRepository>(),
        ),
      )
      .fetchAllArtists();

  // * Genre ---------------------------
  getIt.registerSingleton<GenreRepository>(
    GenreRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt
      .registerSingleton<GenreCubit>(
        GenreCubit(
          genreRepository: getIt.get<GenreRepository>(),
        ),
      )
      .fetchAllGenres();
}
