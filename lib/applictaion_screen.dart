import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '02_lyrics/presentation/lyrics_screen.dart';
import '02_lyrics/presentation/pages/lyrics_page_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'shared/utils/app_colors.dart';

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
    const LyricsPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: Container(
      //     width: 200,
      //     height: 200,
      //     color: Colors.black,
      //   ),
      // ),
      // appBar: AppBar(
      //   elevation: 2,
      //   leading: IconButton(
      //     onPressed: () {},
      //     iconSize: AppFonts.iconSize,
      //     icon: Icon(
      //       Icons.menu,
      //       color: AppColors.primaryColor,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   // title: const Image(
      //   //   image: AssetImage('assets/images/logo.jpg'),
      //   // ),
      //   actions: [
      //     IconButton(
      //       iconSize: AppFonts.iconSize,
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.search,
      //         color: AppColors.primaryColor,
      //       ),
      //     )
      //   ],
      // ),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: AppColors.primaryColor,
      //   unselectedItemColor: Colors.black,
      //   selectedIconTheme: const IconThemeData(size: 30),
      //   elevation: 15,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.forum),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: '',
      //     ),
      //   ],
      // ),
    );
  }
}
