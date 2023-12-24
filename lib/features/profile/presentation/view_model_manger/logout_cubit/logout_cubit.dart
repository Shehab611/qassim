import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';
import 'package:qassim/features/profile/data/repositories/logout_repo/logout_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._logoutRepo) : super(const LogoutInitial());
  final LogoutRepo _logoutRepo;

  static LogoutCubit get(BuildContext context) => BlocProvider.of(context);

  //#region Private Variables
  final String _accessToken =
      sl<SharedPreferences>().getString(AppConstants.currentUserToken)!;

  //#endregion

  //#region Private Methods
  void _clearUserData() {
    Future.microtask(() {
      sl<SharedPreferences>().remove(AppConstants.currentUserName);
      sl<SharedPreferences>().remove(AppConstants.currentUserId);
      sl<SharedPreferences>().remove(AppConstants.currentUserToken);
    });
  }

  void _navigateToOpenScreen(BuildContext context) {
    AppNavigator.navigateToOpenScreen(context);
  }

  void _showSnackBar(BuildContext context) {
    showCustomSnackBar(
        AppLocalizations.of(context).translate(AppStrings.logoutSuccessful),
        context,
        isError: false,
        inTop: true);
  }

//#endregion

  //#region Public Methods
  Future<void> logout(BuildContext context) async {
    ApiResponse apiResponse = await _logoutRepo.logout(_accessToken);
    if (apiResponse.response?.statusCode != null &&
        apiResponse.response?.statusCode == 200) {
      _clearUserData();
      if (context.mounted) {
        _showSnackBar(context);
        _navigateToOpenScreen(context);
      }

      emit(const LogoutSuccessful());
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const LogoutFailed());
      }
    }
  }
//#endregion
}
