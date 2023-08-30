import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_defaultTheme);

  static bool isDarkMode = false;

  static final _defaultTheme = ThemeData(
    primarySwatch: Colors.green,
    appBarTheme: const AppBarTheme(color: Colors.green),
    brightness: Brightness.light,
  );

  void changeTheme({
    required MaterialColor themeColor,
    required Brightness themeBrightness,
  }) {
    final colorTheme = ThemeData(
      primarySwatch: themeColor,
      primaryColor: themeColor,
      appBarTheme: AppBarTheme(color: themeColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeColor,
      ),
      brightness: themeBrightness,
    );
    emit(colorTheme);
  }
}
