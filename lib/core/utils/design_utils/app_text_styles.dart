import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';

abstract final class AppTextStyles {
  //#region Buttons Text Styles
  static const elevatedButtonTextStyle = TextStyle(
      color: AppColors.elevatedButtonTextColor,
      fontSize: AppSizes.fontSizeExtraLarge,
      fontWeight: FontWeight.w600);

  static const textButtonTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeLarge, fontWeight: FontWeight.w600, color: AppColors.complementaryColor3);

  static const switchTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeLarge, fontWeight: FontWeight.w600, color: AppColors.complementaryColor3);

  //#endregion

  //#region List Tile Text Styles
  static const tileTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeLarge, fontWeight: FontWeight.w600, color: AppColors.complementaryColor3);

  static final tileSubTitleTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeDefault,
      fontWeight: FontWeight.w600,
      color: AppColors.complementaryColor3.withOpacity(.6));

  static const tileSecondaryTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeLarge, fontWeight: FontWeight.w600, color: AppColors.lighterShadeColor1);

  static const tileSecondarySubTitleTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeDefault, fontWeight: FontWeight.w600, color: AppColors.lighterShadeColor1);

  //#endregion

  //#region App Default Text Styles

  static const defaultTextStyle = TextStyle(
      color: AppColors.lighterShadeColor1,
      fontSize: AppSizes.fontSizeExtraLarge,
      fontWeight: FontWeight.w600);

  static const secondaryTextStyle = TextStyle(
      color: AppColors.complementaryColor2,
      fontSize: AppSizes.fontSizeExtraLarge,
      fontWeight: FontWeight.w600);

  //#endregion

  //#region App Bar Text Style
  static const appBarTitleTextStyle = TextStyle(
      color: AppColors.lighterShadeColor1,
      fontSize: AppSizes.fontSizeExtraLarge,
      fontWeight: FontWeight.w600);
//#endregion
}
