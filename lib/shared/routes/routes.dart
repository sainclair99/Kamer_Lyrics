import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../01_auth/presentation/login_screen.dart';
import '../../01_auth/presentation/register_screen.dart';
import '../../02_lyrics/data/models/lyrics_model.dart';
import '../../02_lyrics/presentation/lyrics_screen.dart';
import '../../02_lyrics/presentation/pages/lyrics_form_screen.dart';
import '../../02_lyrics/presentation/pages/lyrics_page_screen.dart';
import '../../03_artist/data/models/artist_model.dart';
import '../../03_artist/presentation/artists_screen.dart';
import '../../04_article/presentation/article_screen.dart';
import '../../04_article/presentation/articles_screen.dart';
import '../../app_init_screen.dart';
import '../../applictaion_screen.dart';
import '../../03_artist/presentation/pages/artist_screen.dart';
import '../../home_screen.dart';
import '../../search_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LyricsFormRoute.page),
        AutoRoute(
          page: AppInitRoute.page,
          initial: true,
        ),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ApplicationRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ArtistsRoute.page),
        AutoRoute(page: ArtistRoute.page),
        AutoRoute(page: LyricsRoute.page),
        AutoRoute(page: LyricsRouteRoute.page),
        AutoRoute(page: ArticlesRoute.page),
        AutoRoute(page: ArticleRoute.page),
      ];
}
