import 'package:auto_route/auto_route.dart';

import '../../01_auth/presentation/login_screen.dart';
import '../../01_auth/presentation/register_screen.dart';
import '../../02_lyrics/presentation/lyrics_screen.dart';
import '../../02_lyrics/presentation/pages/lyrics_page_screen.dart';
import '../../applictaion_screen.dart';
import '../../artist_screen.dart';
import '../../home_screen.dart';
import '../../search_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ApplicationRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: LyricsRoute.page),
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(page: ArtistRoute.page),
        AutoRoute(page: LyricsRouteRoute.page),
        AutoRoute(page: RegisterRoute.page),
      ];
}
