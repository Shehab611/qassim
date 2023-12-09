import 'package:flutter/material.dart';
import 'package:qassim/features/authentication/presentation/views/login_screen.dart';
import 'package:qassim/features/authentication/presentation/views/open_screen.dart';
import 'package:qassim/features/authentication/presentation/views/register_screen.dart';

import 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kOpenScreen: (BuildContext context) => const OpenScreen(),
    AppPathName.kLoginScreen: (BuildContext context) => const LoginScreen(),
    AppPathName.kRegisterScreen: (BuildContext context) => const RegisterScreen(),
  };
}
