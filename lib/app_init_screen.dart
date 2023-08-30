import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '01_auth/buisness_logic/cubit/auth_cubit.dart';
import '02_lyrics/business_logic/cubit/lyrics_cubit.dart';
import '03_artist/business_logic/cubit/artist_cubit.dart';
import 'service_locator.dart';
import 'shared/routes/routes.dart';

@RoutePage()
class AppInitScreen extends StatelessWidget {
  const AppInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorCheckingAuthState) {
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (_) => false,
            );
          }
          if (state.successCheckingAuthState) {
            getIt.get<LyricsCubit>().fetchAllLyrics();
            getIt.get<ArtistCubit>().fetchAllArtists();
            context.router.pushAndPopUntil(
              const ApplicationRoute(),
              predicate: (_) => false,
            );
          }
        },
        child: const Center(
          child: Image(
            image: AssetImage('assets/images/logo.jpg'),
          ),
        ),
      ),
    );
  }
}
