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

  static navigateToOtpScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kOtpScreen,
      );
}
