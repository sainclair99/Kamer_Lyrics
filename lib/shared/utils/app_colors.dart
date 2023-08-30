import 'package:flutter/material.dart';
import 'package:kamer_lyrics/00_theme/business_logic/cubit/theme_cubit.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(70, 192, 50, 1);
  static Color secondaryColor =
      ThemeCubit.isDarkMode ? Colors.black : Colors.white;
  static Color subTextColor = Colors.grey;
  static Color textColor = Colors.black;
}
