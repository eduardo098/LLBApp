import 'package:flutter/material.dart';

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const double titleFontSize = 17;
  static const double subTitleFontSize = 15;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const TEXT_FIELD_RADIUS = 4.0;
}

class AppColors {
  static const darkGray = Colors.black45;
  static const black = Colors.black;
  static const white = Colors.white;
  static const orange = Colors.orange;
  static const grey = Colors.grey;
}

class LowLowBurgerTheme{
  static ThemeData of(context) {
    ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.darkGray,
      accentColor: AppColors.orange,
      bottomAppBarColor: AppColors.black,
      backgroundColor: AppColors.darkGray,
      errorColor: AppColors.orange,
      unselectedWidgetColor: AppColors.grey,
      appBarTheme: theme.appBarTheme.copyWith(
        color: AppColors.black,
        iconTheme: IconThemeData(color: AppColors.black),
        textTheme: theme.textTheme.copyWith(
          caption: TextStyle(
            color: AppColors.black,
            fontSize: 18
          )
        )
      ),
      textTheme: theme.textTheme.copyWith(
        headline1: theme.textTheme.headline1.copyWith(
          fontSize: 48,
          color: AppColors.black
        )
      )
    );
  }
}