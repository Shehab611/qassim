import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData defaultTheme = ThemeData(
      iconTheme: const IconThemeData(
        color: AppColors.lighterShadeColor1,
      ),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(iconColor: MaterialStatePropertyAll<Color>(AppColors.lighterShadeColor1))),
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
      ),
      searchViewTheme: const SearchViewThemeData(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          headerHintStyle: AppTextStyles.defaultTextStyle,
          backgroundColor: AppColors.complementaryColor3,
          headerTextStyle: AppTextStyles.defaultTextStyle,
          dividerColor: AppColors.lighterShadeColor1),
      searchBarTheme: const SearchBarThemeData(
        backgroundColor: MaterialStatePropertyAll<Color>(AppColors.complementaryColor3),
        hintStyle: MaterialStatePropertyAll<TextStyle>(AppTextStyles.defaultTextStyle),
        textStyle: MaterialStatePropertyAll<TextStyle>(AppTextStyles.defaultTextStyle),
      ));
}
