import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamer_lyrics/00_theme/business_logic/cubit/theme_cubit.dart';
import 'package:kamer_lyrics/01_auth/buisness_logic/cubit/auth_cubit.dart';
import 'package:kamer_lyrics/02_lyrics/business_logic/cubit/lyrics_cubit.dart';
import 'package:kamer_lyrics/03_artist/business_logic/cubit/artist_cubit.dart';
import 'package:kamer_lyrics/05_genres/business_logic/cubit/genre_cubit.dart';

import 'service_locator.dart';
import 'shared/routes/routes.dart';
import 'theme_observer.dart';

void main() {
  setupLocator();
  Bloc.observer = ThemeObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => getIt.get<AuthCubit>()..checkAuthState(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<LyricsCubit>(
          create: (context) => getIt.get<LyricsCubit>(),
        ),
        BlocProvider<ArtistCubit>(
          create: (context) => getIt.get<ArtistCubit>(),
        ),
        BlocProvider<GenreCubit>(
          create: (context) => getIt.get<GenreCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            title: 'Kamer Lyrics',
            debugShowCheckedModeBanner: false,
            theme: state,
          );
        },
      ),
    );
  }
}
