import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/core/utils/app_constants/app_constants.dart';
import 'package:qassim/core/utils/app_routes_utils/app_navigator.dart';
import 'package:qassim/features/authentication/data/models/login_model.dart';
import 'package:qassim/features/authentication/data/repositories/login/login_repo.dart';
import 'package:qassim/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginInitial());
  final LoginRepo _loginRepo;

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _emailController.dispose();
    _passwordController.dispose();
    return super.close();
  }

  //#region private variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //#endregion

  //#region getters
  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  GlobalKey<FormState> get formKey => _formKey;

//#endregion

  //#region private methods

  Future<void> _addDataToLocalDb(User user) async {
    await _loginRepo.addUserDataToDB(user: user);
  }

  Future<void> _saveUserToken(String token) async {
    await sl<SharedPreferences>()
        .setString(AppConstants.userLoginTokenSharedPreferenceKey, token);
  }

  Future<void> _saveUserCurrentId(int id) async {
    await sl<SharedPreferences>()
        .setInt(AppConstants.currentUserId, id);
  }

  //#endregion

  //#region public methods
  Future<void> login(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      emit(const LoginLoadingState());
      ApiResponse apiResponse = await _loginRepo.login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      if (apiResponse.response?.statusCode != null &&
          apiResponse.response?.statusCode == 200) {
        User user = User.fromJson(apiResponse.response!.data);
        Future.microtask(() {
          _addDataToLocalDb(user);
          _saveUserToken(user.accessToken);
          _saveUserCurrentId(user.id);
        });

        emit(const LoginSuccessfulState());
      } else {
        if (context.mounted) {
          ApiChecker.checkApi(apiResponse, context);
          emit(const LoginFailedState());
        }
      }
    }
  }

  void navigateToHomeScreen(BuildContext context) {
    AppNavigator.navigateToHomeScreen(context);
  }

  void navigateToRegisterScreen(BuildContext context) {
    AppNavigator.navigateToRegisterScreen(context);
  }

  void navigateToForgetPasswordScreen(BuildContext context) {
    AppNavigator.navigateToForgetPasswordScreen(context);
  }
//#endregion
}
