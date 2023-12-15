import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/usable_functions/validate_check.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/authentication/data/models/login_model.dart';
import 'package:qassim/features/authentication/data/repositories/login/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(const LoginInitial());
  final LoginRepo loginRepo;

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
    await loginRepo.addUserDataToDB(user: user);
  }

  //#endregion

  //#region public methods
  Future<void> login(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      emit(const LoginLoadingState());
      ApiResponse apiResponse = await loginRepo.login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      if (apiResponse.response?.statusCode != null &&
          apiResponse.response?.statusCode == 200) {
        User user = User.fromJson(apiResponse.response!.data);
        await _addDataToLocalDb(user);
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
    //AppNavigator.navigateToHomeScreen(context);
  }
//#endregion
}
