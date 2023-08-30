// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppInitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppInitScreen(),
      );
    },
    ApplicationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApplicationScreen(),
      );
    },
    ArticleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArticleScreen(),
      );
    },
    ArticlesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArticlesScreen(),
      );
    },
    ArtistRoute.name: (routeData) {
      final args = routeData.argsAs<ArtistRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArtistScreen(
          key: args.key,
          artistModel: args.artistModel,
        ),
      );
    },
    ArtistsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ArtistsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    LyricsFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LyricsFormScreen(),
      );
    },
    LyricsRouteRoute.name: (routeData) {
      final args = routeData.argsAs<LyricsRouteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LyricsPageScreen(
          key: args.key,
          lyricsModel: args.lyricsModel,
        ),
      );
    },
    LyricsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LyricsScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
  };
}

/// generated route for
/// [AppInitScreen]
class AppInitRoute extends PageRouteInfo<void> {
  const AppInitRoute({List<PageRouteInfo>? children})
      : super(
          AppInitRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppInitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ApplicationScreen]
class ApplicationRoute extends PageRouteInfo<void> {
  const ApplicationRoute({List<PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ArticleScreen]
class ArticleRoute extends PageRouteInfo<void> {
  const ArticleRoute({List<PageRouteInfo>? children})
      : super(
          ArticleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ArticlesScreen]
class ArticlesRoute extends PageRouteInfo<void> {
  const ArticlesRoute({List<PageRouteInfo>? children})
      : super(
          ArticlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ArtistScreen]
class ArtistRoute extends PageRouteInfo<ArtistRouteArgs> {
  ArtistRoute({
    Key? key,
    required ArtistModel artistModel,
    List<PageRouteInfo>? children,
  }) : super(
          ArtistRoute.name,
          args: ArtistRouteArgs(
            key: key,
            artistModel: artistModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ArtistRoute';

  static const PageInfo<ArtistRouteArgs> page = PageInfo<ArtistRouteArgs>(name);
}

class ArtistRouteArgs {
  const ArtistRouteArgs({
    this.key,
    required this.artistModel,
  });

  final Key? key;

  final ArtistModel artistModel;

  @override
  String toString() {
    return 'ArtistRouteArgs{key: $key, artistModel: $artistModel}';
  }
}

/// generated route for
/// [ArtistsScreen]
class ArtistsRoute extends PageRouteInfo<void> {
  const ArtistsRoute({List<PageRouteInfo>? children})
      : super(
          ArtistsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArtistsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LyricsFormScreen]
class LyricsFormRoute extends PageRouteInfo<void> {
  const LyricsFormRoute({List<PageRouteInfo>? children})
      : super(
          LyricsFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'LyricsFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LyricsPageScreen]
class LyricsRouteRoute extends PageRouteInfo<LyricsRouteRouteArgs> {
  LyricsRouteRoute({
    Key? key,
    required LyricsModel lyricsModel,
    List<PageRouteInfo>? children,
  }) : super(
          LyricsRouteRoute.name,
          args: LyricsRouteRouteArgs(
            key: key,
            lyricsModel: lyricsModel,
          ),
          initialChildren: children,
        );

  static const String name = 'LyricsRouteRoute';

  static const PageInfo<LyricsRouteRouteArgs> page =
      PageInfo<LyricsRouteRouteArgs>(name);
}

class LyricsRouteRouteArgs {
  const LyricsRouteRouteArgs({
    this.key,
    required this.lyricsModel,
  });

  final Key? key;

  final LyricsModel lyricsModel;

  @override
  String toString() {
    return 'LyricsRouteRouteArgs{key: $key, lyricsModel: $lyricsModel}';
  }
}

/// generated route for
/// [LyricsScreen]
class LyricsRoute extends PageRouteInfo<void> {
  const LyricsRoute({List<PageRouteInfo>? children})
      : super(
          LyricsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LyricsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
