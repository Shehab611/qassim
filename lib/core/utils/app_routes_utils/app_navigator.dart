import 'package:flutter/material.dart';

import 'app_paths.dart';

abstract final class AppNavigator {
  static navigateToOpenScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kOpenScreen,
      );

  static navigateToLoginScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kLoginScreen,
      );

  static navigateToRegisterScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kRegisterScreen,
      );

  static navigateToOtpScreen(BuildContext context, String emailAddress) =>
      Navigator.popAndPushNamed(context, AppPathName.kOtpScreen,
          arguments: emailAddress);

  static navigateToForgetPasswordScreen(BuildContext context) =>
      Navigator.pushNamed(
        context,
        AppPathName.kForgetPasswordScreen,
      );

  static navigateToChangePasswordScreen(BuildContext context, String emailAddress) =>
      Navigator.popAndPushNamed(context, AppPathName.kChangePasswordScreen, arguments: emailAddress);

  static navigateToHomeScreen(BuildContext context) => Navigator.popAndPushNamed(
        context,
        AppPathName.kHomeScreen,
      );

  static navigateToPlaceDetailsScreen(BuildContext context, String placeId) =>
      Navigator.pushNamed(context, AppPathName.kPlaceDetailsScreen, arguments: placeId);

  static navigateToCompleteBookingScreen(BuildContext context, String placeId) =>
      Navigator.pushNamed(context, AppPathName.kCompleteBookingScreen, arguments: placeId);

  static navigateToScreen(BuildContext context, String routePath) => Navigator.popAndPushNamed(
        context,
        routePath,
      );
}
