import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamer_lyrics/01_auth/buisness_logic/cubit/auth_cubit.dart';
import 'package:kamer_lyrics/02_lyrics/business_logic/cubit/lyrics_cubit.dart';

import 'service_locator.dart';
import 'shared/routes/routes.dart';
import 'shared/utils/app_colors.dart';

void main() {
  setupLocator();
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
          create: (context) => getIt.get<AuthCubit>(),
        ),
        BlocProvider<LyricsCubit>(
          create: (context) => getIt.get<LyricsCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Kamer Lyrics',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
