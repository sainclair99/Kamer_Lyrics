import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamer_lyrics/shared/routes/routes.dart';
import 'package:kamer_lyrics/shared/utils/app_colors.dart';
import 'package:kamer_lyrics/shared/utils/app_fonts.dart';

import '../../00_theme/business_logic/cubit/theme_cubit.dart';
import '../../01_auth/buisness_logic/cubit/auth_cubit.dart';
import '../../01_auth/data/models/user_model.dart';
import '../../service_locator.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool dark = ThemeCubit.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Sainclair',
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                'alainsainclair@gmail.com',
                style: TextStyle(fontSize: 17),
              ),
              currentAccountPicture: CircleAvatar(),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    title: const Text(
                      'Switch mode',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    leading: dark
                        ? Icon(
                            Icons.mode_night_rounded,
                            size: AppFonts.iconSize,
                          )
                        : Icon(
                            Icons.sunny,
                            size: AppFonts.iconSize,
                          ),
                    onTap: () {
                      if (ThemeCubit.isDarkMode) {
                        context.read<ThemeCubit>().changeTheme(
                              themeColor: Colors.green,
                              themeBrightness: Brightness.light,
                            );
                      } else {
                        context.read<ThemeCubit>().changeTheme(
                              themeColor: Colors.green,
                              themeBrightness: Brightness.dark,
                            );
                      }
                      ThemeCubit.isDarkMode = !ThemeCubit.isDarkMode;
                      setState(() {
                        dark = ThemeCubit.isDarkMode;
                      });
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Profile',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.person_pin,
                      size: AppFonts.iconSize,
                    ),
                    onTap: () {}, //TODO : Redirect to profile page
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Blog',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.newspaper,
                      size: AppFonts.iconSize,
                    ),
                    onTap: () {
                      context.router.push(const ArticlesRoute());
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Forum',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.forum,
                      size: AppFonts.iconSize,
                    ),
                    onTap: () {}, //TODO : Redirect to forum page
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Translates',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.translate,
                      size: AppFonts.iconSize,
                    ),
                    onTap: () {}, //TODO : Toggle languages
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.settings,
                      size: AppFonts.iconSize,
                    ),
                    onTap: () {}, //TODO : Redirect to settings page
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Log out',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(
                      Icons.logout,
                      size: AppFonts.iconSize,
                    ),
                    onTap: () {
                      getIt.get<AuthCubit>().logout();
                      context.router.pushAndPopUntil(
                        const LoginRoute(),
                        predicate: (_) => false,
                      );
                    }, //TODO : logout the connected user
                    // enabled: false,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.copyright),
                  Text(
                    '2023',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
