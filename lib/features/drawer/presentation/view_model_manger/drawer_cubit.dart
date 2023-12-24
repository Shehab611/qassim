import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/app_routes_utils/app_paths.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(const DrawerInitial());

  static DrawerCubit get(BuildContext context) => BlocProvider.of(context);

  //#region Private Variables
  final String _userName =
      sl<SharedPreferences>().get(AppConstants.currentUserName) as String;

  static const List<({IconData icon, String title, String routePath})>
      _tileData = [
    (
      icon: Icons.home,
      title: AppStrings.homePage,
      routePath: AppPathName.kHomeScreen
    ),
    (
      icon: Icons.bookmark_added_sharp,
      title: AppStrings.previousBooking,
      routePath: AppPathName.kHomeScreen
    ),
    (
      icon: Icons.miscellaneous_services,
      title: AppStrings.customerService,
      routePath: AppPathName.kCustomerServiceScreen
    ),
    (
      icon: Icons.person,
      title: AppStrings.profile,
      routePath: AppPathName.kProfileScreen
    ),
    (
      icon: Icons.favorite,
      title: AppStrings.favouritePlaces,
      routePath: AppPathName.kFavouritesScreen
    ),
    (
      icon: Icons.category_outlined,
      title: AppStrings.categories,
      routePath: AppPathName.kCategoriesScreen
    ),
  ];
  bool _switchValue =
      sl<AppLanguage>().appLocal == AppConstants.supportedLocales[0];

  //#endregion

  //#region Getters
  bool get switchValue => _switchValue;

  String get userName => _userName;

  List<({IconData icon, String title, String routePath})> get tileData =>
      _tileData;

  //#endregion

  //#region Public Methods
  void changeLocale(bool value) {
    if (value) {
      ///change to english
      sl<AppLanguage>().changeLanguage(AppConstants.supportedLocales[0]);
    } else {
      ///change to arabic
      sl<AppLanguage>().changeLanguage(AppConstants.supportedLocales[1]);
    }
    _switchValue = value;
    emit(const DrawerChangeLanguageState());
  }
//#endregion
}
