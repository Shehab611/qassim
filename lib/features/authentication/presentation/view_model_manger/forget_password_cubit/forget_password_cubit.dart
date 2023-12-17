import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';
import 'package:qassim/features/authentication/data/repositories/forget_password/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordInitial());
  final ForgetPasswordRepo _forgetPasswordRepo;

  static ForgetPasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);

  @override
  Future<void> close() {
    _emailController.dispose();
    return super.close();
  }

  //#region private variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  //#endregion

  //#region getters
  TextEditingController get emailController => _emailController;

  GlobalKey<FormState> get formKey => _formKey;

  //#endregion

  //#region private methods
  void _navigateToOtpScreen(BuildContext context) {
    AppNavigator.navigateToOtpScreen(context);
  }

  //#endregion

  //#region public methods

  Future<void> forgetPassword(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      emit(const ForgetPasswordLoadingState());
      ApiResponse apiResponse = await _forgetPasswordRepo.forgetPassword(
          email: _emailController.text);
      if (apiResponse.response?.statusCode != null &&
          apiResponse.response?.statusCode == 200) {
        if (context.mounted) {
          _navigateToOtpScreen(context);
        }

        emit(const ForgetPasswordSuccessfulState());
      } else {
        if (context.mounted) {
          ApiChecker.checkApi(apiResponse, context);
          emit(const ForgetPasswordFailedState());
        }
      }
    }
  }

  void navigateToLoginScreen(BuildContext context) {
    AppNavigator.navigateToLoginScreen(context);
  }
//#endregion
}
