import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

abstract final class AppTheme{
  static ThemeData defaultTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.elevatedButtonBackground,
      )),
      listTileTheme: ListTileThemeData(
          subtitleTextStyle: AppTextStyles.tileSubTitleTextStyle,
          iconColor: AppColors.complementaryColor3,
          titleTextStyle: AppTextStyles.tileTextStyle),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          backgroundColor: AppColors.complementaryColor2,
          titleTextStyle: AppTextStyles.appBarTitleTextStyle),
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.complementaryColor1,
      ));
}