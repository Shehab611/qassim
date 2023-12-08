import 'package:flutter/material.dart';

import 'app_paths.dart';

abstract final class AppNavigator {
  static navigateToOpenScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kOpenScreen,
      );
}
