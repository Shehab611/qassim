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
import 'package:qassim/features/categories/data/repositories/categories_repo_impl.dart';
import 'package:qassim/features/categories/presentation/view_model_manger/categories_cubit.dart';
import 'package:qassim/features/categories/presentation/views/categories_screen.dart';
import 'package:qassim/features/customer_service/data/repositories/customer_service_repo_impl.dart';
import 'package:qassim/features/customer_service/presentation/view_model_manger/customer_service_cubit.dart';
import 'package:qassim/features/customer_service/presentation/views/customer_service_screen.dart';
import 'package:qassim/features/favourites/data/repositories/favourites_repo_impl.dart';
import 'package:qassim/features/favourites/presentation/view/favourite_screen.dart';
import 'package:qassim/features/favourites/presentation/view_model_manger/favourites_cubit/favourites_cubit.dart';
import 'package:qassim/features/home/data/repositories/all_places/all_places_repo_impl.dart';
import 'package:qassim/features/home/presentation/view_model_manger/all_places_cubit/all_places_cubit.dart';
import 'package:qassim/features/home/presentation/views/home_screen.dart';
import 'package:qassim/features/home/presentation/views/place_details_screen.dart';
import 'package:qassim/features/map/presentation/views/map_view.dart';
import 'package:qassim/features/previous_booking/data/repositories/previous_booking_repo_impl.dart';
import 'package:qassim/features/previous_booking/presentation/view/previous_booking_screen.dart';
import 'package:qassim/features/previous_booking/presentation/view_model_manger/previous_booking/previous_booking_cubit.dart';
import 'package:qassim/features/profile/data/repositories/logout_repo/logout_repo_impl.dart';
import 'package:qassim/features/profile/data/repositories/profile_data_repo/profile_data_repo_impl.dart';
import 'package:qassim/features/profile/presentation/view_model_manger/logout_cubit/logout_cubit.dart';
import 'package:qassim/features/profile/presentation/view_model_manger/profile_cubit/profile_cubit.dart';
import 'package:qassim/features/profile/presentation/views/profile_screen.dart';
import 'package:qassim/service_locator.dart';

import 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    //#region Authentication Routes
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
          create: (context) => ForgetPasswordCubit(ForgetPasswordRepoImpl(sl<DioClient>())),
          child: const ForgetPasswordScreen(),
        ),
    AppPathName.kChangePasswordScreen: (BuildContext context) => BlocProvider(
          create: (context) => ResetPasswordCubit(ResetPasswordRepoImpl(sl<DioClient>())),
          child: const ChangePasswordScreen(),
        ),
    //#endregion

    //#region User Routes
    AppPathName.kProfileScreen: (BuildContext context) => MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => ProfileCubit(sl<ProfileRepoImpl>())..getUserData(context),
          ),
          BlocProvider(
            create: (context) => LogoutCubit(LogoutRepoImpl(sl<DioClient>())),
          ),
        ], child: const ProfileScreen()),
    AppPathName.kFavouritesScreen: (BuildContext context) => BlocProvider(
        create: (context) => FavouritesCubit(sl<FavouritesRepoImpl>())..getFavouritesPlaces(context),
        child: const FavouriteScreen()),
    AppPathName.kPreviousBookingScreen: (BuildContext context) => BlocProvider(
          create: (context) =>
              PreviousBookingCubit(sl<PreviousBookingRepoImpl>())..getPreviousBooking(context),
          child: const PreviousBookingScreen(),
        ),
    AppPathName.kCustomerServiceScreen: (BuildContext context) => BlocProvider(
          create: (context) => CustomerServiceCubit(sl<CustomerServiceRepoImpl>())..getUserData(context),
          child: const CustomerServiceScreen(),
        ),
    //#endregion

    //#region Home Routes
    AppPathName.kHomeScreen: (BuildContext context) => BlocProvider(
          create: (context) => AllPlacesCubit(sl<AllPlacesRepoImpl>())..getAllPlaces(context),
          child: const HomeScreen(),
        ),
    AppPathName.kPlaceDetailsScreen: (BuildContext context) => const PlaceDetailsScreen(),
    AppPathName.kMopScreen: (BuildContext context) => const MapScreen(),
    AppPathName.kCategoriesScreen: (BuildContext context) => BlocProvider(
          create: (context) => CategoriesCubit(sl<CategoriesRepoImpl>())..getCategories(context),
          child: const CategoriesScreen(),
        ),
    //#endregion
  };
}
