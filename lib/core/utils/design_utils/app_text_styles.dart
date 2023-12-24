import 'package:flutter/material.dart';
import 'package:qassim/core/utils/design_utils/app_colors.dart';
import 'package:qassim/core/utils/design_utils/app_sizes.dart';

abstract final class AppTextStyles {
  static const elevatedButtonTextStyle = TextStyle(
      color: AppColors.elevatedButtonTextColor,
      fontSize: AppSizes.fontSizeExtraLarge,
      fontWeight: FontWeight.w600);

  static const textButtonTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.complementaryColor3);

  static const tileTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.complementaryColor3);

  static final tileSubTitleTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeDefault,
      fontWeight: FontWeight.w600,
      color: AppColors.complementaryColor3.withOpacity(.6));

  static const appBarTitleTextStyle = TextStyle(
      color: AppColors.lighterShadeColor1,
      fontSize: AppSizes.fontSizeExtraLarge,
      fontWeight: FontWeight.w600);

  static const defaultTextStyle = TextStyle(
      color: AppColors.lighterShadeColor1,
      fontSize: AppSizes.fontSizeExtraLarge,
      fontWeight: FontWeight.w600);

  static const secondaryTextStyle = TextStyle(
      color: AppColors.complementaryColor2,
      fontSize: AppSizes.fontSizeExtraLarge,
      fontWeight: FontWeight.w600);

  static const switchTextStyle = TextStyle(
      fontSize: AppSizes.fontSizeLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.complementaryColor3);
}
