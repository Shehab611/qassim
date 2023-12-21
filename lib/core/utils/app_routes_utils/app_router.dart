import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/usable_functions/api_service_helper.dart';
import 'package:qassim/features/authentication/data/repositories/forget_password/forget_password_repo_impl.dart';
import 'package:qassim/features/authentication/data/repositories/login/login_repo_impl.dart';
import 'package:qassim/features/authentication/data/repositories/register/register_repo_impl.dart';
import 'package:qassim/features/authentication/data/repositories/reset_password/reset_password_repo_impl.dart';
import 'package:qassim/features/authentication/presentation/view_model_manger/forget_password_cubit/forget_password_cubit.dart';
import 'package:qassim/features/authentication/presentation/view_model_manger/login_cubit/login_cubit.dart';
import 'package:qassim/features/authentication/presentation/view_model_manger/register_cubit/register_cubit.dart';
import 'package:qassim/features/authentication/presentation/view_model_manger/reset_password/reset_password_cubit.dart';
import 'package:qassim/features/authentication/presentation/views/change_password_screen.dart';
import 'package:qassim/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:qassim/features/authentication/presentation/views/login_screen.dart';
import 'package:qassim/features/authentication/presentation/views/open_screen.dart';
import 'package:qassim/features/authentication/presentation/views/otp_screen.dart';
import 'package:qassim/features/authentication/presentation/views/register_screen.dart';
import 'package:qassim/features/customer_service/data/repositories/customer_service_repo_impl.dart';
import 'package:qassim/features/customer_service/presentation/view_model_manger/customer_service_cubit.dart';
import 'package:qassim/features/customer_service/presentation/views/customer_service_screen.dart';
import 'package:qassim/features/profile/presentation/views/profile_screen.dart';
import 'package:qassim/service_locator.dart';

import 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kOpenScreen: (BuildContext context) => const OpenScreen(),
    AppPathName.kOtpScreen: (BuildContext context) => const OtpScreen(),
    AppPathName.kLoginScreen: (BuildContext context) => BlocProvider(
          create: (context) => LoginCubit(LoginRepoImpl(sl<DioClient>())),
          child: const LoginScreen(),
        ),
    AppPathName.kRegisterScreen: (BuildContext context) => BlocProvider(
          create: (context) => RegisterCubit(RegisterRepoImpl(sl<DioClient>())),
          child: const RegisterScreen(),
        ),
    AppPathName.kForgetPasswordScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              ForgetPasswordCubit(ForgetPasswordRepoImpl(sl<DioClient>())),
          child: const ForgetPasswordScreen(),
        ),
    AppPathName.kChangePasswordScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              ResetPasswordCubit(ResetPasswordRepoImpl(sl<DioClient>())),
          child: const ChangePasswordScreen(),
        ),
    AppPathName.kProfileScreen: (BuildContext context) => const ProfileScreen(),
    AppPathName.kCustomerServiceScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              CustomerServiceCubit(sl<CustomerServiceRepoImpl>())..getUserData(context),
          child: const CustomerServiceScreen(),
        ),
  };
}
