import 'package:flutter/material.dart';
import 'package:qassim/features/authentication/presentation/views/open_screen.dart';

import 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kOpenScreen: (BuildContext context) => const OpenScreen(),
  };
}
