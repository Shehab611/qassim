import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/features/authentication/data/repositories/register/register_repo_impl.dart';
import 'package:qassim/features/authentication/presentation/view_model_manger/register_cubit/register_cubit.dart';
import 'package:qassim/features/authentication/presentation/views/change_password_screen.dart';
import 'package:qassim/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:qassim/features/authentication/presentation/views/login_screen.dart';
import 'package:qassim/features/authentication/presentation/views/open_screen.dart';
import 'package:qassim/features/authentication/presentation/views/otp_screen.dart';
import 'package:qassim/features/authentication/presentation/views/register_screen.dart';
import 'package:qassim/service_locator.dart';

import 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kOpenScreen: (BuildContext context) => const OpenScreen(),
    AppPathName.kLoginScreen: (BuildContext context) => const LoginScreen(),
    AppPathName.kRegisterScreen: (BuildContext context) => BlocProvider(
          create: (context) => RegisterCubit(RegisterRepoImpl(sl<DioClient>())),
          child: const RegisterScreen(),
        ),
    AppPathName.kOtpScreen: (BuildContext context) => const OtpScreen(),
    AppPathName.kForgetPasswordScreen: (BuildContext context) =>
        const ForgetPasswordScreen(),
    AppPathName.kChangePasswordScreen: (BuildContext context) =>
        const ChangePasswordScreen(),
  };
}
