import 'package:calculator/utils/app_colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.whiteColor,
  colorScheme: ColorScheme.light(
    primary: AppColors.blueColor,
    secondary: AppColors.whiteColor,
    tertiary: AppColors.blackColor
  ),
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.blackColor,
  colorScheme: ColorScheme.dark(
      primary: AppColors.yellowColor,
      secondary: AppColors.blackColor,
      tertiary: AppColors.whiteColor
  ),
  brightness: Brightness.dark,
);

class ThemeProvider extends ChangeNotifier{
  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme(){
    _currentTheme = _currentTheme == lightTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}