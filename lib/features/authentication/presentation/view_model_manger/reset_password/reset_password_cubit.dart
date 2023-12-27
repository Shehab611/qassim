import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/components/custom_snack_bar.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_localization.dart';
import 'package:qassim/core/utils/app_constants/app_strings.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';
import 'package:qassim/features/authentication/data/repositories/reset_password/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._resetPasswordRepo) : super(const ResetPasswordInitial());
  final ResetPasswordRepo _resetPasswordRepo;

  static ResetPasswordCubit get(BuildContext context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    return super.close();
  }

  //#region private variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();

  //#endregion

  //#region getters
  TextEditingController get passwordController => _passwordController;

  TextEditingController get passwordConfirmationController => _passwordConfirmationController;

  GlobalKey<FormState> get formKey => _formKey;

//#endregion

  //#region public methods
  Future<void> resetPassword(BuildContext context, String email) async {
    if (ValidateCheck.validate(_formKey)) {
      emit(const ResetPasswordLoadingState());

      ApiResponse apiResponse = await _resetPasswordRepo.resetPassword(
          email: email,
          password: _passwordController.text,
          confirmPassword: _passwordConfirmationController.text);
      if (apiResponse.response?.statusCode != null && apiResponse.response?.statusCode == 200) {
        if (context.mounted) {
          navigateToLoginScreen(context);
          showCustomSnackBar(AppLocalizations.of(context).translate(AppStrings.passwordResetSuccess), context,
              inTop: true, isError: false);
        }
      } else {
        if (context.mounted) {
          ApiChecker.checkApi(apiResponse, context);
          emit(const ResetPasswordFailedState());
        }
      }
    }
  }

  void navigateToLoginScreen(BuildContext context) {
    AppNavigator.navigateToLoginScreen(context);
  }
//#endregion
}
