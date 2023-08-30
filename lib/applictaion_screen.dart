import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '00_theme/business_logic/cubit/theme_cubit.dart';
import '02_lyrics/presentation/lyrics_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'shared/utils/app_colors.dart';
import 'shared/utils/app_fonts.dart';
import 'shared/widgets/drawer_widget.dart';

@RoutePage()
class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  int _index = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LyricsScreen(),
    const SearchScreen(),
    const SearchScreen(),
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          iconSize: AppFonts.iconSize,
          icon: Icon(
            Icons.menu,
            color: AppColors.primaryColor,
          ),
        ),
        backgroundColor: ThemeCubit.isDarkMode ? Colors.black : Colors.white,
        centerTitle: true,
        // title: const Image(
        //   image: AssetImage('assets/images/logo.jpg'),
        // ),
        actions: [
          IconButton(
            iconSize: AppFonts.iconSize,
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: GNav(
          onTabChange: (index) {
            setState(() {
              _index = index;
            });
          },
          tabBackgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.all(10),
          tabs: const [
            GButton(
              icon: Icons.home_filled,
              text: 'Home',
            ),
            GButton(
              icon: Icons.lyrics,
              text: 'Lyrics',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.person,
              text: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
