import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/features/profile/data/models/change_password_model.dart';
import 'package:qassim/features/profile/data/repositories/change_password_repo/change_password_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordRepo)
      : super(const ChangePasswordInitial());
  final ChangePasswordRepo _changePasswordRepo;

  static ChangePasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);

  @override
  Future<void> close() {
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _recentPasswordController.dispose();
    _recentPasswordNode.dispose();
    _newPasswordNode.dispose();
    _confirmPasswordNode.dispose();
    return super.close();
  }

  //#region private variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _recentPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final FocusNode _recentPasswordNode = FocusNode();
  final FocusNode _newPasswordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  //#endregion

  //#region Getters
  TextEditingController get passwordController => _passwordController;

  TextEditingController get recentPasswordController => _recentPasswordController;

  TextEditingController get passwordConfirmationController =>
      _passwordConfirmationController;

  FocusNode get recentPasswordNode => _recentPasswordNode;

  FocusNode get newPasswordNode => _newPasswordNode;

  FocusNode get confirmPasswordNode => _confirmPasswordNode;

  GlobalKey<FormState> get formKey => _formKey;

//#endregion

  //#region Private Methods
  int _getCurrentUserId() {
    return sl<SharedPreferences>().get(AppConstants.currentUserId) as int;
  }

  //#endregion

  //#region public Methods
  Future<void> changePassword(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      emit(const ChangePasswordLoadingState());
      ChangePasswordRequestModel requestModel = ChangePasswordRequestModel(
          id: _getCurrentUserId().toString(),
          oldPassword: _recentPasswordController.text,
          newPassword: _passwordController.text,
          newPasswordConfirmation: _passwordConfirmationController.text);
      ApiResponse apiResponse =
          await _changePasswordRepo.changePassword(requestModel: requestModel);
      if (apiResponse.response?.statusCode != null &&
          apiResponse.response?.statusCode == 200) {
        emit(const ChangePasswordSuccessState());
      } else {
        if (context.mounted) {
          ApiChecker.checkApi(apiResponse, context);
          emit(const ChangePasswordFailedState());
        }
      }
    }
  }
//#endregion
}
